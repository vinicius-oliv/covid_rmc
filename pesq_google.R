library(tidyverse)
library(rvest)
library(httr)

url <- "https://www.google.com/search?q=coronavirus+12+de+maio+campinas"

links <- url %>% read_html() %>% html_nodes("a") %>% xml_attr("href")

for(i in 1:length(links)){
  if(str_detect(links[i], "g1") & str_detect(links[i], "prefeituras")){
    g1campinas <- links[i]
    break
  }
}

g <- str_replace(g1campinas, "html.*", "html") %>% str_replace(".*(https)", "https")

