Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735BCC77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 05:32:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.36112.1681277573314008798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 22:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=SPWuWLhR;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id mn5-20020a17090b188500b00246eddf34f6so2702975pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 22:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681277572; x=1683869572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdsTX5DvbEUbyflOcdfovflq//Lh4hNHJg9AnP8u2JI=;
        b=SPWuWLhRoP8tukQuR/FGk35hJL7f2jc06rdBdgnM0TNoVt1qTuwnEejWvdB557yjpK
         oM84mDDxWpCkBCFASicNCqNY1n4CBBac/MarbDZmVPg9CADMhUOG75O0tQ2+YSja4wXV
         iBaBCl+f6rE4aI90XfskTIFy1aCZh1zPL0vIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681277572; x=1683869572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdsTX5DvbEUbyflOcdfovflq//Lh4hNHJg9AnP8u2JI=;
        b=RX2f30E0JkB9rtHj3mcWzZ9SuOUBLlWbqRvqQpqZqtNfINZPsNUuYFNFWtUouIx6z6
         z5knEtea2TlyevdO0e6h/Ju5HRrHjSiz5h0WJPemSoJF7CBwYUJOl+vh2Euvk+mifaU4
         dFAmCJuOrCHzfiSbxtFblqZx1pab9eQ/J7PWm25ltO15Er8nMn530YfsvIrQ5VPamlvS
         DWyIb/ROEKtLwnipzLIjc/dHqt2ssYqhLe0Y/m6Zh8TjeW8qQgfAT1odXPbRIgqD7d/R
         o3Pt2B23i8dOvW6f56K/L2kNnh++pCpE1goW5czPfZkL0l+nhUBP9nW9UOKhDm1enE45
         2r8Q==
X-Gm-Message-State: AAQBX9d2qyFkybyDoW4HgBM4sDqV0vXFmyB+7d/mAgTeZ+iBeXnenXbz
	8aGWdI5q9HwGchGgJf5N6fsWOksikWLURv/Wz8E=
X-Google-Smtp-Source: AKy350YlyeRgmbx4iD0xZA1BQpBoBWQma/UPVJ6qGbT6cWzeqXWiy+6sH+l+2VNn3wLzb/SkZrUZmQ==
X-Received: by 2002:a05:6a20:7b2f:b0:eb:a859:e870 with SMTP id s47-20020a056a207b2f00b000eba859e870mr1072691pzh.20.1681277572259;
        Tue, 11 Apr 2023 22:32:52 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.223])
        by smtp.gmail.com with ESMTPSA id x10-20020a62fb0a000000b006259beddb63sm10679982pfm.44.2023.04.11.22.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 22:32:51 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 12 Apr 2023 11:02:47 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] curl: CVE-2023-27534 SFTP path resolving discrepancy
Date: Wed, 12 Apr 2023 11:02:45 +0530
Message-Id: <20230412053245.134816-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 05:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179938

Upstream-Status: Backport from https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
index cd6264b715..8c2d99a449 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23914_5-4.patch \
            file://CVE-2023-23914_5-5.patch \
            file://CVE-2023-27533.patch \
+           file://CVE-2023-27534.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


