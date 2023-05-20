Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42655C77B7A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.13402.1684598722428523776
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iRl2Iyk6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64d4e4598f0so437178b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598721; x=1687190721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fCwKGstJF+JltVtpNt9eBdk7DM4ihf6Updv0n71uiI=;
        b=iRl2Iyk6jGkud42CDcU0+9tD61FZiBA5VkNok3y/kJg84QqC2aeT5aw0dTXee4N16H
         wHjjCRHLRnrWaIryHCqz6iSAzEHLSS2uBqFCDW/46E1ApFVNFv0f1+/nAYucn5IXvLFq
         7c0b2YPd83w2yPp5bZOwN/c9Sa/LRWRbX61G1UAvoctY/QN0SzaAkgb+mVjadp9sFx/C
         3opm4DJVrSfD74o+HT6hjxgtw/YhS9NvC8Za9Uh7BVHW13tN4kssxh5FBqV/C0v+zrnM
         t4cx/HVULTjEhpzvKB9bNkegnXMQ7puEzO6uIrJvsDj9FJuuUPt9Z9dsO72bUjjvNBVI
         R2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598721; x=1687190721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fCwKGstJF+JltVtpNt9eBdk7DM4ihf6Updv0n71uiI=;
        b=YpRg8SvpphoYbHOxL6p+LLcZ+XgH/BdH+9QSiAEMDb1B5NDenJz65E2Lm4i3jXdFfU
         9xwDlQAKkYWgxfkK+ipTmda5Xp+wp7jXTzXC3fO4FcPj2zSMwzCgUPF03wxxCpTpPbBK
         QlKotTOFQiSuk9eGuRKAkN0zOoZZrXgR2UzT3KWdW3PVgkqlHCCS0fz0wbjpMV784dWw
         DrXBShWZg2kDAs0dOKPrNfXrAPGm5NAXdTPnurRsUz+Vwe1DrHf3ob4J0DrnKUsySJjs
         O/gyNIbXhr+hwgQgdcbYVAOfwPhmi7+yeBIA4vO9sMxHK+w17VOdZgJiSrtZJ4xmoY/k
         rN3g==
X-Gm-Message-State: AC+VfDx2UZjZuT3ubIhLRbJQZb+6vkLeF0ljAdH5KAQPY78DgBWeEM3/
	W1Rt/T26oVfMb5MINe4wVzbBJ28Xhn4ckAPFU2s=
X-Google-Smtp-Source: ACHHUZ7t9qPaMXi9U2C5YOAHcIBVNQT5Xbu8U3Rp1/iNk7GaKXz5pq+LA+jRF7KYergWls9ey8Eyhw==
X-Received: by 2002:a05:6a20:6f8b:b0:106:999f:64df with SMTP id gv11-20020a056a206f8b00b00106999f64dfmr5338907pzb.58.1684598721362;
        Sat, 20 May 2023 09:05:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] curl: ammend fix for CVE-2023-27534 to fix error when ssh is enabled
Date: Sat, 20 May 2023 06:04:59 -1000
Message-Id: <df489f644e41108cf0e2ff55af7ce5e9bca40471.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181566

From: Siddharth <sdoshi@mvista.com>

The upstream patch for CVE-2023-27534 does three things:
1) creates new path with dynbuf(dynamic buffer)
2) solves the tilde error which causes CVE-2023-27534
3) modifies the below added functionality to not add a trailing "/" to the user home dir if it already ends with one with dynbuf.

dynbuf functionalities are added in curl in later versions and are not essential to fix the vulnerability but does add extra feature in later versions.
This patch completes the 3rd task of the patch which was implemented without using dynbuf

Upstream-Status: Backport from [https://github.com/curl/curl/commit/6c51adeb71da076c5c40a45e339e06bb4394a86b]

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-27534-pre1.patch       |  51 ++++++++
 .../curl/curl/CVE-2023-27534.patch            | 122 +++---------------
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 3 files changed, 68 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch b/meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch
new file mode 100644
index 0000000000..46c57afb73
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch
@@ -0,0 +1,51 @@
+From 6c51adeb71da076c5c40a45e339e06bb4394a86b Mon Sep 17 00:00:00 2001
+From: Eric Vigeant <evigeant@gmail.com>
+Date: Wed, 2 Nov 2022 11:47:09 -0400
+Subject: [PATCH] cur_path: do not add '/' if homedir ends with one
+
+When using SFTP and a path relative to the user home, do not add a
+trailing '/' to the user home dir if it already ends with one.
+
+Closes #9844
+
+CVE: CVE-2023-27534
+Note:
+- The upstream patch for CVE-2023-27534 does three things:
+1) creates new path with dynbuf(dynamic buffer)
+2) solves the tilde error which causes CVE-2023-27534
+3) modifies the below added functionality to not add a trailing "/" to the user home dir if it already ends with one with dynbuf.
+- dynbuf functionalities are added in curl in later versions and are not essential to fix the vulnerability but does add extra feature in later versions.
+- This patch completes the 3rd task of the patch which was implemented without using dynbuf
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/6c51adeb71da076c5c40a45e339e06bb4394a86b]
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/curl_path.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/lib/curl_path.c b/lib/curl_path.c
+index f429634..40b92ee 100644
+--- a/lib/curl_path.c
++++ b/lib/curl_path.c
+@@ -70,10 +70,14 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
+       /* It is referenced to the home directory, so strip the
+          leading '/' */
+       memcpy(real_path, homedir, homelen);
+-      real_path[homelen] = '/';
+-      real_path[homelen + 1] = '\0';
++      /* Only add a trailing '/' if homedir does not end with one */
++      if(homelen == 0 || real_path[homelen - 1] != '/') {
++        real_path[homelen] = '/';
++        homelen++;
++        real_path[homelen] = '\0';
++      }
+       if(working_path_len > 3) {
+-        memcpy(real_path + homelen + 1, working_path + 3,
++        memcpy(real_path + homelen, working_path + 3,
+                1 + working_path_len -3);
+       }
+     }
+-- 
+2.24.4
+
diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
index aeeffd5fea..3ecd181290 100644
--- a/meta/recipes-support/curl/curl/CVE-2023-27534.patch
+++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
@@ -3,121 +3,31 @@ From: Daniel Stenberg <daniel@haxx.se>
 Date: Thu, 9 Mar 2023 16:22:11 +0100
 Subject: [PATCH] curl_path: create the new path with dynbuf
 
+Closes #10729
+
 CVE: CVE-2023-27534
-Upstream-Status: Backport [https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6]
+Note: This patch is needed to backport CVE-2023-27534
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6]
 
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
- lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
- 1 file changed, 35 insertions(+), 36 deletions(-)
+ lib/curl_path.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/curl_path.c b/lib/curl_path.c
-index f429634..e17db4b 100644
+index 40b92ee..598c5dd 100644
 --- a/lib/curl_path.c
 +++ b/lib/curl_path.c
-@@ -30,6 +30,8 @@
- #include "escape.h"
- #include "memdebug.h"
- 
-+#define MAX_SSHPATH_LEN 100000 /* arbitrary */
-+
- /* figure out the path to work with in this particular request */
- CURLcode Curl_getworkingpath(struct connectdata *conn,
-                              char *homedir,  /* when SFTP is used */
-@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
-                                              real path to work with */
- {
-   struct Curl_easy *data = conn->data;
--  char *real_path = NULL;
-   char *working_path;
-   size_t working_path_len;
-+  struct dynbuf npath;
-   CURLcode result =
-     Curl_urldecode(data, data->state.up.path, 0, &working_path,
-                    &working_path_len, FALSE);
-   if(result)
-     return result;
- 
-+  /* new path to switch to in case we need to */
-+  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
-+
-   /* Check for /~/, indicating relative to the user's home directory */
--  if(conn->handler->protocol & CURLPROTO_SCP) {
--    real_path = malloc(working_path_len + 1);
--    if(real_path == NULL) {
-+  if((data->conn->handler->protocol & CURLPROTO_SCP) &&
-+     (working_path_len > 3) && (!memcmp(working_path, "/~/", 3))) {
-+    /* It is referenced to the home directory, so strip the leading '/~/' */
-+    if(Curl_dyn_addn(&npath, &working_path[3], working_path_len - 3)) {
-       free(working_path);
-       return CURLE_OUT_OF_MEMORY;
-     }
--    if((working_path_len > 3) && (!memcmp(working_path, "/~/", 3)))
--      /* It is referenced to the home directory, so strip the leading '/~/' */
--      memcpy(real_path, working_path + 3, working_path_len - 2);
--    else
--      memcpy(real_path, working_path, 1 + working_path_len);
+@@ -60,7 +60,7 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
+       memcpy(real_path, working_path, 1 + working_path_len);
    }
--  else if(conn->handler->protocol & CURLPROTO_SFTP) {
+   else if(conn->handler->protocol & CURLPROTO_SFTP) {
 -    if((working_path_len > 1) && (working_path[1] == '~')) {
--      size_t homelen = strlen(homedir);
--      real_path = malloc(homelen + working_path_len + 1);
--      if(real_path == NULL) {
--        free(working_path);
--        return CURLE_OUT_OF_MEMORY;
--      }
--      /* It is referenced to the home directory, so strip the
--         leading '/' */
--      memcpy(real_path, homedir, homelen);
--      real_path[homelen] = '/';
--      real_path[homelen + 1] = '\0';
--      if(working_path_len > 3) {
--        memcpy(real_path + homelen + 1, working_path + 3,
--               1 + working_path_len -3);
--      }
-+  else if((data->conn->handler->protocol & CURLPROTO_SFTP) &&
-+          (working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
-+    size_t len;
-+    const char *p;
-+    int copyfrom = 3;
-+    if(Curl_dyn_add(&npath, homedir)) {
-+      free(working_path);
-+      return CURLE_OUT_OF_MEMORY;
-     }
--    else {
--      real_path = malloc(working_path_len + 1);
--      if(real_path == NULL) {
--        free(working_path);
--        return CURLE_OUT_OF_MEMORY;
--      }
--      memcpy(real_path, working_path, 1 + working_path_len);
-+    /* Copy a separating '/' if homedir does not end with one */
-+    len = Curl_dyn_len(&npath);
-+    p = Curl_dyn_ptr(&npath);
-+    if(len && (p[len-1] != '/'))
-+      copyfrom = 2;
-+
-+    if(Curl_dyn_addn(&npath,
-+                     &working_path[copyfrom], working_path_len - copyfrom)) {
-+      free(working_path);
-+      return CURLE_OUT_OF_MEMORY;
-     }
-   }
- 
--  free(working_path);
-+  if(Curl_dyn_len(&npath)) {
-+    free(working_path);
- 
--  /* store the pointer for the caller to receive */
--  *path = real_path;
-+    /* store the pointer for the caller to receive */
-+    *path = Curl_dyn_ptr(&npath);
-+  }
-+  else
-+    *path = working_path;
- 
-   return CURLE_OK;
- }
++    if((working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
+       size_t homelen = strlen(homedir);
+       real_path = malloc(homelen + working_path_len + 1);
+       if(real_path == NULL) {
 -- 
-2.25.1
+2.24.4
 
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 32d18ddb3a..13ec117099 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-35260.patch \
            file://CVE-2022-43552.patch \
            file://CVE-2023-23916.patch \
+           file://CVE-2023-27534-pre1.patch \
            file://CVE-2023-27534.patch \
            file://CVE-2023-27538.patch \
            file://CVE-2023-27533.patch \
-- 
2.34.1


