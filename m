Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BF4C77B71
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:07 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.10384.1681572422695253552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EDw0XLG9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-63b73203e0aso1586685b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572422; x=1684164422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uSTSMhcm3PFahTrMnZjL1WM2qc4NsbVKol3WuVfXEQ=;
        b=EDw0XLG9ZXR+DplkE1OH717Upj1XZldyDAcxtnMW5tqFrl6i/J/GhKBp7LiAU2C+cW
         kX1F659d4PZrlFRyvQpGqoiAvv4F7tbWf61yxOBpUIf5jLsHOTlV8OYarn6P8ysfQx28
         5yOC5tl9L8DjPBltK2u2C324c3qiORHHLUp+YZ1aO36AwfM7bNVg/XbD66pRfki+B10S
         DG22PRpcjTsSaWrJiMyiS2YpO2lKDOjVdhnPgYAUXyz7mKWoG7GzbyNbGxzFcZeK3Adx
         CHjS8+NFbnekYReGI5cHFJ1T+OOZNoV0tIbaW6a983wNuOsqT95XIFiDZ6JLXegfWEOF
         mjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572422; x=1684164422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uSTSMhcm3PFahTrMnZjL1WM2qc4NsbVKol3WuVfXEQ=;
        b=WrrYVyo1ao3L3qGolpiNcscErRGFsRrVURx1lVDxmH4Zf/FfUPcsANcr5U3AM7nvd3
         fBzhhhQ3rsBjLDSsMogt3cEmWaVn2U8vIYZYMrnMV7qiAy5fiCF2+FYvoLSjB3TtB1+Y
         ikAsx7tkIjxvBZgZiFou+cdl3B7xxQbDFofIcw4TWSHPKpnFWd0Xx44UVED7kb5jeQNx
         LcuHHxFsCx3cAOzXyXq0ftmVjMhrG77cGDH2zbisAJAiXIqAsaREuQhJAqOmhvXFPpjh
         stliVVavhP9Q3fRcHDxGSiNVAe5P9pL52bIgCEC+IzD97/Yl3u2qEIGrK3Vwu+qiNma4
         2sMA==
X-Gm-Message-State: AAQBX9dX93KMm8JI6qB1eOS3EL7CTXGD2TVzRj8fUvd9SkxgYQFCcSAv
	d/o7QkkGeNWA3uGEqM1j9PWr71cXh2ahg4KcMnM=
X-Google-Smtp-Source: AKy350ZDjdbkeS4QHBxSD1y9ZGcaBUW3/t81tOceUZ9JHbpzPHNRwjqEJsP976wwCdvn/Xo7CkjSCQ==
X-Received: by 2002:a05:6a00:1343:b0:634:4f6:86df with SMTP id k3-20020a056a00134300b0063404f686dfmr11002365pfu.1.1681572421772;
        Sat, 15 Apr 2023 08:27:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.27.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:27:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] curl: CVE-2023-27534 SFTP path resolving discrepancy
Date: Sat, 15 Apr 2023 05:26:40 -1000
Message-Id: <7919a5a5eaa2689db9f0e8110b923bbfe0a610ab.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572283.git.steve@sakoman.com>
References: <cover.1681572283.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180013

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-27534.patch            | 122 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
new file mode 100644
index 0000000000..9109faaf88
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
@@ -0,0 +1,122 @@
+From 4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 9 Mar 2023 16:22:11 +0100
+Subject: [PATCH] curl_path: create the new path with dynbuf
+
+CVE: CVE-2023-27534
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6]
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 35 insertions(+), 36 deletions(-)
+
+diff --git a/lib/curl_path.c b/lib/curl_path.c
+index a1669d1..b9c470f 100644
+--- a/lib/curl_path.c
++++ b/lib/curl_path.c
+@@ -30,66 +30,65 @@
+ #include "escape.h"
+ #include "memdebug.h"
+ 
++#define MAX_SSHPATH_LEN 100000 /* arbitrary */
++
+ /* figure out the path to work with in this particular request */
+ CURLcode Curl_getworkingpath(struct Curl_easy *data,
+                              char *homedir,  /* when SFTP is used */
+                              char **path) /* returns the  allocated
+                                              real path to work with */
+ {
+-  char *real_path = NULL;
+   char *working_path;
+   size_t working_path_len;
++  struct dynbuf npath;
+   CURLcode result =
+     Curl_urldecode(data->state.up.path, 0, &working_path,
+                    &working_path_len, REJECT_ZERO);
+   if(result)
+     return result;
+ 
++  /* new path to switch to in case we need to */
++  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
++
+   /* Check for /~/, indicating relative to the user's home directory */
+-  if(data->conn->handler->protocol & CURLPROTO_SCP) {
+-    real_path = malloc(working_path_len + 1);
+-    if(!real_path) {
++  if((data->conn->handler->protocol & CURLPROTO_SCP) &&
++     (working_path_len > 3) && (!memcmp(working_path, "/~/", 3))) {
++    /* It is referenced to the home directory, so strip the leading '/~/' */
++    if(Curl_dyn_addn(&npath, &working_path[3], working_path_len - 3)) {
+       free(working_path);
+       return CURLE_OUT_OF_MEMORY;
+     }
+-    if((working_path_len > 3) && (!memcmp(working_path, "/~/", 3)))
+-      /* It is referenced to the home directory, so strip the leading '/~/' */
+-      memcpy(real_path, working_path + 3, working_path_len - 2);
+-    else
+-      memcpy(real_path, working_path, 1 + working_path_len);
+   }
+-  else if(data->conn->handler->protocol & CURLPROTO_SFTP) {
+-    if((working_path_len > 1) && (working_path[1] == '~')) {
+-      size_t homelen = strlen(homedir);
+-      real_path = malloc(homelen + working_path_len + 1);
+-      if(!real_path) {
+-        free(working_path);
+-        return CURLE_OUT_OF_MEMORY;
+-      }
+-      /* It is referenced to the home directory, so strip the
+-         leading '/' */
+-      memcpy(real_path, homedir, homelen);
+-      real_path[homelen] = '/';
+-      real_path[homelen + 1] = '\0';
+-      if(working_path_len > 3) {
+-        memcpy(real_path + homelen + 1, working_path + 3,
+-               1 + working_path_len -3);
+-      }
++  else if((data->conn->handler->protocol & CURLPROTO_SFTP) &&
++          (working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
++    size_t len;
++    const char *p;
++    int copyfrom = 3;
++    if(Curl_dyn_add(&npath, homedir)) {
++      free(working_path);
++      return CURLE_OUT_OF_MEMORY;
+     }
+-    else {
+-      real_path = malloc(working_path_len + 1);
+-      if(!real_path) {
+-        free(working_path);
+-        return CURLE_OUT_OF_MEMORY;
+-      }
+-      memcpy(real_path, working_path, 1 + working_path_len);
++    /* Copy a separating '/' if homedir does not end with one */
++    len = Curl_dyn_len(&npath);
++    p = Curl_dyn_ptr(&npath);
++    if(len && (p[len-1] != '/'))
++      copyfrom = 2;
++
++    if(Curl_dyn_addn(&npath,
++                     &working_path[copyfrom], working_path_len - copyfrom)) {
++      free(working_path);
++      return CURLE_OUT_OF_MEMORY;
+     }
+   }
+ 
+-  free(working_path);
++  if(Curl_dyn_len(&npath)) {
++    free(working_path);
+ 
+-  /* store the pointer for the caller to receive */
+-  *path = real_path;
++    /* store the pointer for the caller to receive */
++    *path = Curl_dyn_ptr(&npath);
++  }
++  else
++    *path = working_path;
+ 
+   return CURLE_OK;
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 7efec07e61..4c18afe293 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23914_5-5.patch \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27533.patch \
+           file://CVE-2023-27534.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


