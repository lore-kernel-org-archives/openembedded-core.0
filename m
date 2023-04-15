Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1969C77B70
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.10380.1681572421110775565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FautJfH2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1a6bc48aec8so191965ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572420; x=1684164420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1I7IaIQ1QK/8WL5IUT/2Z6G1mO1dOZImXXRAkdgXu4E=;
        b=FautJfH2X76ZzCT4cXPUe9L4YqnSG3PPbtEgkeaz04wcIllx5T2jjGCB3LS7BFMX24
         efJAWnqXazxOgux6WwtSCzawrdo353VDgHNLm1b1VgmIVUykbyH9D7UQKPNR36zAq9Ok
         IFel3B2r2esBcdmpqBuznMSwy7PJfaXvPQNE/qdE6dtvs9Mi9ysOqtOcMM3f6nf1bqbV
         JBZo4pKMEQgIZS6CiST6Sm1v4TbGJUqhj/N8CErZgMzCSj0EYY8C6/HkgAgqUtoSpg9O
         HsdSYECCjfRn9GQxz8euNsfvPaHmT59BtbNvqq7N5Ui8ljU5PitBjln/PqOMu3sX71B0
         9eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572420; x=1684164420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1I7IaIQ1QK/8WL5IUT/2Z6G1mO1dOZImXXRAkdgXu4E=;
        b=Cn58IVkaH5ceUDD7RVQXBeE7i/Nnd/W4BoicuNRiEJN9jMApk9DmvAjKzc8A9vYznA
         A/pigBqGFTM0B8gTZnCDBFWa8+6HGrLJApdmmZbk74bywnOKTY5gcdazC/d5I5+I4e2L
         2RfsvgNibTx6ItpgFBZ4GbSXyvr+tk1tWorKd7HPrqulzsvytsh1BrKEVf5pyeeZOxYq
         RLasmp4E8Zm7Yp+98EfWjn43Tbp6wEjeC0CvqswLHxmB0n2Ha68vmJRk75OMDHUbQT/x
         3xIAPGg1f9payADXMhHAbl26/kVSxc0oDRU7pznOYWBve0K9qtclLvWg/wd2CTC3Xol9
         DUhw==
X-Gm-Message-State: AAQBX9dH1Gqa8LguXoDl2vaF4Ot11MmVljlLHqmnt4KpC2OngdxuHq+g
	mSddLc9K1plnqakAVEkPmrsx7tUMLPxishLdFkk=
X-Google-Smtp-Source: AKy350abT79qz4/Smm4iIxBEfrubAkRMoQE/TT0U3UTonOR/sSJclfUQKhmBjYFXLTQBzR8Ausz1AQ==
X-Received: by 2002:a05:6a00:1401:b0:637:1177:73f3 with SMTP id l1-20020a056a00140100b00637117773f3mr14114053pfu.14.1681572420035;
        Sat, 15 Apr 2023 08:27:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:26:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] curl: CVE-2023-27533 TELNET option IAC injection
Date: Sat, 15 Apr 2023 05:26:39 -1000
Message-Id: <ff795872530975a014ae23001a4b014449783a0e.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572283.git.steve@sakoman.com>
References: <cover.1681572283.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180011

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/0c28ba2faae2d7da780a66d2446045a560192cdc && https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-27533.patch            | 208 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27533.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27533.patch b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
new file mode 100644
index 0000000000..b69b20c85a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27533.patch
@@ -0,0 +1,208 @@
+From 538b1e79a6e7b0bb829ab4cecc828d32105d0684 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 6 Mar 2023 12:07:33 +0100
+Subject: [PATCH] telnet: parse telnet options without sscanf & only accept option arguments in ascii
+
+To avoid embedded telnet negotiation commands etc.
+
+Reported-by: Harry Sintonen
+Closes #10728
+
+CVE: CVE-2023-27533
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c28ba2faae2d7da780a66d2446045a560192cdc && https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684]
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/telnet.c | 149 +++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 91 insertions(+), 58 deletions(-)
+
+diff --git a/lib/telnet.c b/lib/telnet.c
+index e709973..3ecd680 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -768,22 +768,32 @@ static void printsub(struct Curl_easy *data,
+   }
+ }
+ 
++static bool str_is_nonascii(const char *str)
++{
++  size_t len = strlen(str);
++  while(len--) {
++    if(*str & 0x80)
++      return TRUE;
++    str++;
++  }
++  return FALSE;
++}
++
+ static CURLcode check_telnet_options(struct Curl_easy *data)
+ {
+   struct curl_slist *head;
+   struct curl_slist *beg;
+-  char option_keyword[128] = "";
+-  char option_arg[256] = "";
+   struct TELNET *tn = data->req.p.telnet;
+-  struct connectdata *conn = data->conn;
+   CURLcode result = CURLE_OK;
+-  int binary_option;
+ 
+   /* Add the user name as an environment variable if it
+      was given on the command line */
+   if(data->state.aptr.user) {
+-    msnprintf(option_arg, sizeof(option_arg), "USER,%s", conn->user);
+-    beg = curl_slist_append(tn->telnet_vars, option_arg);
++    char buffer[256];
++    if(str_is_nonascii(data->conn->user))
++      return CURLE_BAD_FUNCTION_ARGUMENT;
++    msnprintf(buffer, sizeof(buffer), "USER,%s", data->conn->user);
++    beg = curl_slist_append(tn->telnet_vars, buffer);
+     if(!beg) {
+       curl_slist_free_all(tn->telnet_vars);
+       tn->telnet_vars = NULL;
+@@ -793,68 +803,91 @@ static CURLcode check_telnet_options(struct Curl_easy *data)
+     tn->us_preferred[CURL_TELOPT_NEW_ENVIRON] = CURL_YES;
+   }
+ 
+-  for(head = data->set.telnet_options; head; head = head->next) {
+-    if(sscanf(head->data, "%127[^= ]%*[ =]%255s",
+-              option_keyword, option_arg) == 2) {
+-
+-      /* Terminal type */
+-      if(strcasecompare(option_keyword, "TTYPE")) {
+-        strncpy(tn->subopt_ttype, option_arg, 31);
+-        tn->subopt_ttype[31] = 0; /* String termination */
+-        tn->us_preferred[CURL_TELOPT_TTYPE] = CURL_YES;
++  for(head = data->set.telnet_options; head && !result; head = head->next) {
++    size_t olen;
++    char *option = head->data;
++    char *arg;
++    char *sep = strchr(option, '=');
++    if(sep) {
++      olen = sep - option;
++      arg = ++sep;
++      if(str_is_nonascii(arg))
+         continue;
+-      }
++      switch(olen) {
++      case 5:
++        /* Terminal type */
++        if(strncasecompare(option, "TTYPE", 5)) {
++          strncpy(tn->subopt_ttype, arg, 31);
++          tn->subopt_ttype[31] = 0; /* String termination */
++          tn->us_preferred[CURL_TELOPT_TTYPE] = CURL_YES;
++        }
++        else
++          result = CURLE_UNKNOWN_OPTION;
++        break;
+ 
+-      /* Display variable */
+-      if(strcasecompare(option_keyword, "XDISPLOC")) {
+-        strncpy(tn->subopt_xdisploc, option_arg, 127);
+-        tn->subopt_xdisploc[127] = 0; /* String termination */
+-        tn->us_preferred[CURL_TELOPT_XDISPLOC] = CURL_YES;
+-        continue;
+-      }
++      case 8:
++        /* Display variable */
++        if(strncasecompare(option, "XDISPLOC", 8)) {
++          strncpy(tn->subopt_xdisploc, arg, 127);
++          tn->subopt_xdisploc[127] = 0; /* String termination */
++          tn->us_preferred[CURL_TELOPT_XDISPLOC] = CURL_YES;
++        }
++        else
++          result = CURLE_UNKNOWN_OPTION;
++        break;
+ 
+-      /* Environment variable */
+-      if(strcasecompare(option_keyword, "NEW_ENV")) {
+-        beg = curl_slist_append(tn->telnet_vars, option_arg);
+-        if(!beg) {
+-          result = CURLE_OUT_OF_MEMORY;
+-          break;
++      case 7:
++        /* Environment variable */
++        if(strncasecompare(option, "NEW_ENV", 7)) {
++          beg = curl_slist_append(tn->telnet_vars, arg);
++          if(!beg) {
++            result = CURLE_OUT_OF_MEMORY;
++            break;
++          }
++          tn->telnet_vars = beg;
++          tn->us_preferred[CURL_TELOPT_NEW_ENVIRON] = CURL_YES;
+         }
+-        tn->telnet_vars = beg;
+-        tn->us_preferred[CURL_TELOPT_NEW_ENVIRON] = CURL_YES;
+-        continue;
+-      }
++        else
++          result = CURLE_UNKNOWN_OPTION;
++        break;
+ 
+-      /* Window Size */
+-      if(strcasecompare(option_keyword, "WS")) {
+-        if(sscanf(option_arg, "%hu%*[xX]%hu",
+-                  &tn->subopt_wsx, &tn->subopt_wsy) == 2)
+-          tn->us_preferred[CURL_TELOPT_NAWS] = CURL_YES;
+-        else {
+-          failf(data, "Syntax error in telnet option: %s", head->data);
+-          result = CURLE_SETOPT_OPTION_SYNTAX;
+-          break;
++      case 2:
++        /* Window Size */
++        if(strncasecompare(option, "WS", 2)) {
++          if(sscanf(arg, "%hu%*[xX]%hu",
++                    &tn->subopt_wsx, &tn->subopt_wsy) == 2)
++            tn->us_preferred[CURL_TELOPT_NAWS] = CURL_YES;
++          else {
++            failf(data, "Syntax error in telnet option: %s", head->data);
++            result = CURLE_SETOPT_OPTION_SYNTAX;
++          }
+         }
+-        continue;
+-      }
++        else
++          result = CURLE_UNKNOWN_OPTION;
++        break;
+ 
+-      /* To take care or not of the 8th bit in data exchange */
+-      if(strcasecompare(option_keyword, "BINARY")) {
+-        binary_option = atoi(option_arg);
+-        if(binary_option != 1) {
+-          tn->us_preferred[CURL_TELOPT_BINARY] = CURL_NO;
+-          tn->him_preferred[CURL_TELOPT_BINARY] = CURL_NO;
++      case 6:
++        /* To take care or not of the 8th bit in data exchange */
++        if(strncasecompare(option, "BINARY", 6)) {
++          int binary_option = atoi(arg);
++          if(binary_option != 1) {
++            tn->us_preferred[CURL_TELOPT_BINARY] = CURL_NO;
++            tn->him_preferred[CURL_TELOPT_BINARY] = CURL_NO;
++          }
+         }
+-        continue;
++        else
++          result = CURLE_UNKNOWN_OPTION;
++        break;
++      default:
++        failf(data, "Unknown telnet option %s", head->data);
++        result = CURLE_UNKNOWN_OPTION;
++        break;
+       }
+-
+-      failf(data, "Unknown telnet option %s", head->data);
+-      result = CURLE_UNKNOWN_OPTION;
+-      break;
+     }
+-    failf(data, "Syntax error in telnet option: %s", head->data);
+-    result = CURLE_SETOPT_OPTION_SYNTAX;
+-    break;
++    else {
++      failf(data, "Syntax error in telnet option: %s", head->data);
++      result = CURLE_SETOPT_OPTION_SYNTAX;
++    }
+   }
+ 
+   if(result) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 945745cdde..7efec07e61 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23914_5-4.patch \
            file://CVE-2023-23914_5-5.patch \
            file://CVE-2023-23916.patch \
+           file://CVE-2023-27533.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


