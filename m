Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2FFC77B76
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:34:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.10549.1681572843075133123
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LmhGnoYv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id v9so26600117pjk.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572842; x=1684164842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLx6uU/xSYUGnVzx6zl8zqNzfwXY3pMk6cd7LdDG8vU=;
        b=LmhGnoYv1X+eiGgnYGS0eYdRyUImdSASl2Oho3vrK4BaAO2ZeurS9QZhJcLTF/nPRk
         ttHkQvLVpwrQeqHOycAODpKB4TGU7nKN6qZp6Iy11ltqU/NoHeSLGwMZhJ27yzr4HJOv
         1U2YNoPSVUaquouVCU5HgxqvNMVAGH/4tcO1RCQzfhgzCEUu52DYyZoA0Pu6Ev5HKlC3
         ZW8b6IA4Vpdvx5JEgMKagpk9msM+XcxRbb+4XNn9ykWTPXebAxWh+WBYosT7WudZ/vYy
         JCIGK+zPK2UY88SWjg1UlfvZOiCWLfOJ7WCmoyMCyQetn/DgfDXNhnU5/RqMt+aoyUhP
         nBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572842; x=1684164842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLx6uU/xSYUGnVzx6zl8zqNzfwXY3pMk6cd7LdDG8vU=;
        b=CdQQic4xkzLZQwD6hmP70FzzwqVTab7EEMOzetwTEMq42LNkeFEVbkQlr5Yarr/QiV
         1DIXdg8kic4ZStHKiNHozHQc1mcAH0rdnWyT+iqH6EbZ8tzAOG7DWwkn/v3yoZM/Od16
         gXZaIm1yA0g6uboaMqKmrmFK6FHeM/I7Xto0AJrF3qwT8b1OVQ3gUHNNsub3rY5RPNVQ
         RsB3otTEISAMrpC03yHoMj4LcAk7S1ramh1lJQq9wZk8cBGx+XF/uzI1yZPD+7NMPgQT
         +dA9BjrIaJsdfEDFc5B+QhkyWSVvMPjUEUwaIu5QZpl9a5G6rDQQm1tjq9osVUkM7H6R
         38wA==
X-Gm-Message-State: AAQBX9d4Oyfz8IsiCRkLbZiqbp3q3Mhtb/ZUcLQfsSUkYHqIhAMv1Pc6
	pWdzeRyigED1BeGCvMGgxWl5vJxO52j22Z+E4Eo=
X-Google-Smtp-Source: AKy350ZfQJdi2cD71ukB9n10N3F4c6RvcF0StXqd3aAxP+VJnU7pzm4hcfHhTySa5f5fKMsRNObxXw==
X-Received: by 2002:a17:90a:540a:b0:23f:2486:5b53 with SMTP id z10-20020a17090a540a00b0023f24865b53mr15623609pjh.17.1681572841973;
        Sat, 15 Apr 2023 08:34:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cs19-20020a17090af51300b002367325203fsm6313969pjb.50.2023.04.15.08.34.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:34:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/4] curl: CVE-2023-27534 SFTP path ~ resolving discrepancy
Date: Sat, 15 Apr 2023 05:33:39 -1000
Message-Id: <9aefb4e46cf4fbf14b46f9adaf3771854553e7f3.1681572706.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572706.git.steve@sakoman.com>
References: <cover.1681572706.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180022

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 64e4fb5809..a7f4f5748f 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-35260.patch \
            file://CVE-2022-43552.patch \
            file://CVE-2023-23916.patch \
+           file://CVE-2023-27534.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


