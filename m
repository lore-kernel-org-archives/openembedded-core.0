Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1300DC4167B
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 05:37:29 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.39454.1671687447470865648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 21:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGMfk271;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 82so685093pgc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqPy4ED/DSFAZgx7P9FUgeUVA1YCkcx3jRu0DDCYQ8g=;
        b=XGMfk2711CVEVi8d7gRhRSJl1dVqyE86XQgXvAq+u+GjJcgcEmk8AZzUewTKiNZ+V/
         DQhmvetWQOlD8AC8P9v8VpQNASjQ42c2Z7MHD9iPtZ6tLbnyVhmwXKaBhVrcwxYJa3P4
         76Ar0xWuuAwvXqqZHyHvLXD1BXJwOzD8cJYU0Q+5JuiXdS9hQmnjIIgxrNxaiHCj2w0E
         eQL+BXSG9KKU/wzlXTWQyUSurJ2jgIU23OB822o0WWqj+xxSbucb9OOuUL24G/gxxACH
         CKTdoT8KDgyDq1GyNgBUj622pnmSf7DziqSXhg3SiF4HrNAKvHGIlnn64ZdCT85Yz3uP
         uJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqPy4ED/DSFAZgx7P9FUgeUVA1YCkcx3jRu0DDCYQ8g=;
        b=nIo/7Yt0N6aM5ewiB82n7H1qjjaUrOAjPNimeYJl9cFk9coTsMMRgfNLpYi1a2JI8Z
         wDm5Hzh97XtLQF05kWoxpd+peNgfwVnm4ETffXqJBBqdydvXzjoZDzoXfRuxOhceeD2W
         KeDL/78H9MIKgyZLX+W1P7WCk9Bf1jCyLYwy86/6HEH/uNZReYDGHR51L4HLfs6ikYyx
         FnyrlHi2La5Qn3Ckx3M+JXKP3vutN5VnMQOUTPOKvxa4r1dFpRATVAA7WGv9rtFydBtO
         PQ+jHlcm5JILentGZUcZUxBsKrpPVzETfwPsua1wwY/aDPy9dShlcYe07uutMpV/CsTp
         I9FQ==
X-Gm-Message-State: AFqh2kp/1wjWKxq3iT0Ec+5f6zGZNNF6jAKExutd9UslmgIgwkIVI2Zd
	rKdpBTK1no778pVUqrn9fAErftJsbmc=
X-Google-Smtp-Source: AMrXdXv3CgIqbPGNp21fQxqRnU0IFTTZr4WS4e1q1UKIs1FpYuBdigD45PP2pNzblb1xj5DOMLjt1w==
X-Received: by 2002:a62:17c6:0:b0:576:c454:38e2 with SMTP id 189-20020a6217c6000000b00576c45438e2mr19041313pfx.30.1671687445919;
        Wed, 21 Dec 2022 21:37:25 -0800 (PST)
Received: from localhost.localdomain ([103.85.11.254])
        by smtp.gmail.com with ESMTPSA id p62-20020a622941000000b0056b9ec7e2desm11438258pfp.125.2022.12.21.21.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 21:37:25 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][kirkstone][PATCH 2/2] curl: Add patch to fix CVE-2022-43552
Date: Thu, 22 Dec 2022 11:07:09 +0530
Message-Id: <20221222053709.20001-2-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222053709.20001-1-ranjitsinhrathod1991@gmail.com>
References: <20221222053709.20001-1-ranjitsinhrathod1991@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 05:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174956

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix the security issue "curl can be asked to tunnel
virtually all protocols it supports through an HTTP proxy. HTTP proxies
can (and often do) deny such tunnel operations using an appropriate HTTP
error response code." as per below link
Link: https://curl.se/docs/CVE-2022-43552.html

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../curl/curl/CVE-2022-43552.patch            | 80 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-43552.patch b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
new file mode 100644
index 0000000000..dfe6d8c6d5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-43552.patch
@@ -0,0 +1,80 @@
+From 4f20188ac644afe174be6005ef4f6ffba232b8b2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 19 Dec 2022 08:38:37 +0100
+Subject: [PATCH] smb/telnet: do not free the protocol struct in *_done()
+
+It is managed by the generic layer.
+
+Reported-by: Trail of Bits
+
+Closes #10112
+
+CVE: CVE-2022-43552
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f20188ac644afe174be6005ef4f6ffba232b8b2]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ lib/smb.c    | 14 ++------------
+ lib/telnet.c |  3 ---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 2cfe041dff072..48d5a2fe006d5 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -58,8 +58,6 @@ static CURLcode smb_connect(struct Curl_easy *data, bool *done);
+ static CURLcode smb_connection_state(struct Curl_easy *data, bool *done);
+ static CURLcode smb_do(struct Curl_easy *data, bool *done);
+ static CURLcode smb_request_state(struct Curl_easy *data, bool *done);
+-static CURLcode smb_done(struct Curl_easy *data, CURLcode status,
+-                         bool premature);
+ static CURLcode smb_disconnect(struct Curl_easy *data,
+                                struct connectdata *conn, bool dead);
+ static int smb_getsock(struct Curl_easy *data, struct connectdata *conn,
+@@ -74,7 +72,7 @@ const struct Curl_handler Curl_handler_smb = {
+   "SMB",                                /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -101,7 +99,7 @@ const struct Curl_handler Curl_handler_smbs = {
+   "SMBS",                               /* scheme */
+   smb_setup_connection,                 /* setup_connection */
+   smb_do,                               /* do_it */
+-  smb_done,                             /* done */
++  ZERO_NULL,                            /* done */
+   ZERO_NULL,                            /* do_more */
+   smb_connect,                          /* connect_it */
+   smb_connection_state,                 /* connecting */
+@@ -936,14 +934,6 @@ static CURLcode smb_request_state(struct Curl_easy *data, bool *done)
+   return CURLE_OK;
+ }
+ 
+-static CURLcode smb_done(struct Curl_easy *data, CURLcode status,
+-                         bool premature)
+-{
+-  (void) premature;
+-  Curl_safefree(data->req.p.smb);
+-  return status;
+-}
+-
+ static CURLcode smb_disconnect(struct Curl_easy *data,
+                                struct connectdata *conn, bool dead)
+ {
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 24d3f1efb14c8..22bc81e755222 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -1248,9 +1248,6 @@ static CURLcode telnet_done(struct Curl_easy *data,
+ 
+   curl_slist_free_all(tn->telnet_vars);
+   tn->telnet_vars = NULL;
+-
+-  Curl_safefree(data->req.p.telnet);
+-
+   return CURLE_OK;
+ }
+ 
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 20a602920d..d3e74b6953 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-42916.patch \
            file://CVE-2022-42915.patch \
            file://CVE-2022-43551.patch \
+           file://CVE-2022-43552.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


