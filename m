Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDB5C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 22:29:58 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.10518.1683844195334661574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 15:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=eobQVBfZ;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-24dea6d5ce8so8625839a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683844194; x=1686436194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNS0RrpfyKAU+9M8LfKtpMKBH6RWPAdYnbKZM1CU4tE=;
        b=eobQVBfZVH8Yx7Ve0ThInzv4QTIdIdsz5fBYSMIJrtR72487UdI/bf9ginjpXBooiL
         /c296ugf96Ohts6TRSuoSEpe7ns3V0P1ve5R9aINKTBoXMzJ9BSimYb5VyW3V2L0ny3N
         3EqD/bC+zXPLG8EL484WpfR1Vi2mZ3o/hcrCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844194; x=1686436194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNS0RrpfyKAU+9M8LfKtpMKBH6RWPAdYnbKZM1CU4tE=;
        b=Xz1SrDjlR4xJx3/y7EWH3xOeJgvCpOEcET0Ds4ui5rtDP5Jq0ThxxeUJBq2zMK08of
         mNvBMi2/Zu417sJWM5CXcRy7fSrHMB6tsMfDkLzQ59GpsJ+HKIuA3mBQ/6rjBJvVATHr
         S5+vt1lveEem454k1lpmVAtz1sb5S7KvxHoDW44BRcxnLiWtRA2hgzQEriDdATsD1c7p
         wM+HvYs22kOoQaEICTMpSmh7Ta/YPiZaJHjfvfdTJD6uwrxzVJ215qxOhMWgnv4c4lu8
         VLKw7dvTBELg5kNprR0BMZqO+jQgRHuKqjjnQ5VY5xJvf9Wo92BgcF2RjjepeU050rr3
         LNCw==
X-Gm-Message-State: AC+VfDy2Spz6tKUakljtaJK2DOf2U+RU4WAPWt8jjq0Ue6bK16SlC64i
	EIlzf5rkVmoUBR2DJ7lsrzyvXpVK4Se8KEWF7H0=
X-Google-Smtp-Source: ACHHUZ4rKtfoCDXklnkwaPWR7KKLFcsLL2zykCHaJGPKI48cv9Ce50eQzNXbqSKHzvYN4sNBTzC8TQ==
X-Received: by 2002:a17:90b:4d85:b0:247:529f:92d7 with SMTP id oj5-20020a17090b4d8500b00247529f92d7mr23053844pjb.8.1683844194102;
        Thu, 11 May 2023 15:29:54 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.248.152])
        by smtp.gmail.com with ESMTPSA id j9-20020a17090276c900b001aaeaa27dd5sm6380619plt.252.2023.05.11.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:29:53 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth <sdoshi@mvista.com>,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [OE-core][dunfell][PATCHv3] curl: Security fix for CVE-2023-27534
Date: Fri, 12 May 2023 03:59:42 +0530
Message-Id: <20230511222942.106215-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 22:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181160

Upstream-Status: Backport from [https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6]

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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
2.25.1


