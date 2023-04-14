Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A23C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 10:55:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.6251.1681469733135853582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 03:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=NWi7ZO11;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id w11so17927304plp.13
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681469732; x=1684061732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JOttfw/1Ya0M5eL6aSV5c0MhFYHvDqK6rpyWGKB98Q=;
        b=NWi7ZO11h1QSFKSWMvQpLCLY2UuSuh9IMjwDmmd1Q1mEQPn6DgD6ynNw4s1z3qXQ7V
         9++JZ2ziSUErc+EL0WYC7tpXnT4/mXScZwhNMCmYSgIRiGYIHi+9YzQ2doKBvAfBphyJ
         EtdZex5RXZg5wdOtUN0sSnG4QQiog7vZsHHzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681469732; x=1684061732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JOttfw/1Ya0M5eL6aSV5c0MhFYHvDqK6rpyWGKB98Q=;
        b=VoRDt98BmM+QDgSkcS0hiiq90AeYxYDMNnf3n6L4rcmXTTtXl54IWPfUkID6Bg+A0E
         mWoDOa6jL92E/tD1OvMzuAfJKBDGX0t7y0yyIxNbBCSkLlUrlf8b/POijNZtYRk3yTAn
         KVcYTaGdwygfwcyVh/Q0u7FCxU7YmLQLosCWpG3rq08XF6kf1DIwPYveVmsu3LM8TjaU
         eIfiPJWLpaA+bUzNcB6ehJiSgy4OMbpyM9JMs54592uie2qb/Tlc1t5W4TeDv3b6Z7GX
         VdSkKeWwioLKcgfMigVczdsgXXN1EuXK+iOaK0fVjOXW/8SABeWFgA35y0WZdQwe6dl2
         y1iA==
X-Gm-Message-State: AAQBX9fDZh1JdKkfvRprSKNz+QsnYQw8VPwOWM7C9B22os1Tiartbb0Q
	01uN8HSspXbIULiZ/q0WA28EOX3gICVUABVAlMY=
X-Google-Smtp-Source: AKy350ZQjnLRoYQda294wiFZ9VRtFdI2EVM1c1jWxiooDA1LsQbDa4yDOxxXMGzS1A3MbQIVEIVn6A==
X-Received: by 2002:a17:90a:ab0e:b0:23d:35c9:bf1c with SMTP id m14-20020a17090aab0e00b0023d35c9bf1cmr5273511pjq.16.1681469732386;
        Fri, 14 Apr 2023 03:55:32 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.210])
        by smtp.gmail.com with ESMTPSA id jm10-20020a17090304ca00b001a526805b86sm2820416plb.191.2023.04.14.03.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 03:55:32 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 14 Apr 2023 16:25:25 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] curl: CVE-2023-27534 SFTP path ~ resolving discrepancy
Date: Fri, 14 Apr 2023 16:25:23 +0530
Message-Id: <20230414105523.81661-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 10:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179997

Upstream-Status: Backport from https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2023-27534.patch            | 123 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
new file mode 100644
index 0000000000..aeeffd5fea
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
@@ -0,0 +1,123 @@
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
+index f429634..e17db4b 100644
+--- a/lib/curl_path.c
++++ b/lib/curl_path.c
+@@ -30,6 +30,8 @@
+ #include "escape.h"
+ #include "memdebug.h"
+ 
++#define MAX_SSHPATH_LEN 100000 /* arbitrary */
++
+ /* figure out the path to work with in this particular request */
+ CURLcode Curl_getworkingpath(struct connectdata *conn,
+                              char *homedir,  /* when SFTP is used */
+@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
+                                              real path to work with */
+ {
+   struct Curl_easy *data = conn->data;
+-  char *real_path = NULL;
+   char *working_path;
+   size_t working_path_len;
++  struct dynbuf npath;
+   CURLcode result =
+     Curl_urldecode(data, data->state.up.path, 0, &working_path,
+                    &working_path_len, FALSE);
+   if(result)
+     return result;
+ 
++  /* new path to switch to in case we need to */
++  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
++
+   /* Check for /~/, indicating relative to the user's home directory */
+-  if(conn->handler->protocol & CURLPROTO_SCP) {
+-    real_path = malloc(working_path_len + 1);
+-    if(real_path == NULL) {
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
+-  else if(conn->handler->protocol & CURLPROTO_SFTP) {
+-    if((working_path_len > 1) && (working_path[1] == '~')) {
+-      size_t homelen = strlen(homedir);
+-      real_path = malloc(homelen + working_path_len + 1);
+-      if(real_path == NULL) {
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
+-      if(real_path == NULL) {
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
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 899daf8eac..fddf15e3ff 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32221.patch \
            file://CVE-2022-35260.patch \
            file://CVE-2022-43552.patch \
+           file://CVE-2023-27534.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


