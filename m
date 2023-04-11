Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8758CC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 11:16:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.10848.1681211779797997779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 04:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OWQhpxLY;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id ik20so7370341plb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681211779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H8XVz28jsyfVvFENUP++2Y/d4WsL5zVuDxvlk1/ZDMU=;
        b=OWQhpxLYBITu7BE5XmsBGdibBulR7d2Wzii3Hw0XE43AR+C0oq8JTcpZhfr0veoPIz
         R41HW1IdC7CVr6dCNHgaQOMKFWpN7HKhj4D5T1S+uJYrdp2x5uw3t+9YslFH82pN+K5P
         AHj/7QGTwp81BvocboXZtGE1flDHdFcYyodIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681211779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8XVz28jsyfVvFENUP++2Y/d4WsL5zVuDxvlk1/ZDMU=;
        b=qUjvmPC5Yxe42FKvq8025BLQPWCji7ugLKeWi+t1iLsaMVQ9weTy28F7tYlW61USvK
         hgJeevA4eYxVjCm7dnMfOquaNRhEPmsX2UJYIimi3xBFiqaPlKGr6D5/TUWMoiHoYFIg
         xeRedO1CCe2Nov773gjHkWei3zFJktgl8Xe91md2TeLJYZmwZ5b+KlGVrJfH39MOy3At
         bDlXpmLb/maJ1kpmmHlfFSEnHNKS5weeFDVqHVvADrZ2uq7B6OPueIFuaNNUM2Fv7HTz
         6Kc6+TWKvfD6EGjrI1RFke4Ru7h5yoRKKPOR0RCKcwc8/RRicH25fAMlFUR72CDhHFaK
         JnKw==
X-Gm-Message-State: AAQBX9fpGXxMM90RpgGBZexHGcTs5zDuhkHBQo3etosMdF0hRZOIovBs
	d4zUXakowM6Aph0sWl7bVWYCT2hIz+vQEikjBKs=
X-Google-Smtp-Source: AKy350b31DxL0IKXSdFfMrMPd43sML2pFGGsP6lVl+RPrMfsmoyD1ceMAePwryPRI9eyQXpbGWAQ2A==
X-Received: by 2002:a17:902:d2d2:b0:1a1:bcf:db5f with SMTP id n18-20020a170902d2d200b001a10bcfdb5fmr21728759plc.25.1681211778928;
        Tue, 11 Apr 2023 04:16:18 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.203])
        by smtp.gmail.com with ESMTPSA id bb10-20020a170902bc8a00b0019cad2de86bsm6756446plb.156.2023.04.11.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 04:16:18 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 11 Apr 2023 16:46:12 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] curl: CVE-2023-27533 TELNET option IAC injection
Date: Tue, 11 Apr 2023 16:46:11 +0530
Message-Id: <20230411111611.247636-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 11:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179916

Upstream-Status: Backport from https://github.com/curl/curl/commit/0c28ba2faae2d7da780a66d2446045a560192cdc && https://github.com/curl/curl/commit/538b1e79a6e7b0bb829ab4cecc828d32105d0684

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
index b583060889..cd6264b715 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23914_5-3.patch \
            file://CVE-2023-23914_5-4.patch \
            file://CVE-2023-23914_5-5.patch \
+           file://CVE-2023-27533.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


