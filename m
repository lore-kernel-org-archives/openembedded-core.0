Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7349EC25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 02:26:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.12169.1660530407798784580
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DrYXN/oU;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id k14so5678750pfh.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=7x2xT+WGWMVRrbUlb+Ur5A/wXjhGK4il64ZrTSPSMr4=;
        b=DrYXN/oUxppywlPCvTXrtNrYsN4t5njTZTpkmpGzVAOqMSm+py0WuZLatY9vG8XV7D
         Kddo3bcHTd/ZZvNI3bvEZzzIpQqkRzVhNGs0dJ6j+coSR2m2mRrkXt3pfZ+285kJZgYm
         IK08ONZtIhOa33DkcbW5SuPYNdpjG7zoebp+9IrJSCVQCq1IiB5+HNQznzjv4MXQOYZM
         D4jQhkkpxsGJsHxZJNxB+BCXbqXJbUHHELZJwQsJAuKVhi6CSAk0HiIeeyLmvxPH3WO5
         slbk6farVPGYO028dwilXg6JlKytaP+FW8ONOTGX0HGY56B9xz+31pmJEYtYweZTEv5m
         4Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=7x2xT+WGWMVRrbUlb+Ur5A/wXjhGK4il64ZrTSPSMr4=;
        b=qoMftoUWWacezLemp0lvWU3e/zBHMcoC0vh12xunR6YBIj3IPt/ZVBrTwsvxlPux/q
         rsqkh6C+MUUwsCxdYq5N1pDD+PiTrgtQeRLjoPf9mRS62bp+4WRxIF2h+E4xXmh0IFyc
         IuzMf4HvjaepcvEMO3gTqkfaViIlH+wFdzOa2WXMAFQcXtXxuJ6w9CJSY4T8iG8B93He
         aYkxNLdPewlgTrwYiZSYzdKEPhEBL+ixoNf5FTZ0Ci85RnOMG9jj+ly9PXvaWRlVFh9m
         f3mLPOdgXs9YlzyN4bSGJe06/c54w4xTTFGOfiPtSxXoGt0gte//ytnx6JeMlMakgW6M
         yslg==
X-Gm-Message-State: ACgBeo3Al6EIAwj2XvLt0z6w5qJjvcBBDBrb7I5zAtjctzPi2/oZU56P
	hyl7x4WIU1VFh5T1G3v7OuJeIl0OewE/6Q==
X-Google-Smtp-Source: 
 AA6agR5OStru3abemiYvwwtLW62vtHZsQZ30JAxCiTzLfYle7Oo8WsrxXcKcTVGLVQNvvY7i/Voc1g==
X-Received: by 2002:a63:484e:0:b0:429:411b:1d8c with SMTP id
 x14-20020a63484e000000b00429411b1d8cmr2166746pgk.623.1660530406731;
        Sun, 14 Aug 2022 19:26:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a170902f54b00b0016db0d877e4sm6026608plf.221.2022.08.14.19.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 19:26:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] json-c: Fix function prototypes
Date: Sun, 14 Aug 2022 19:26:41 -0700
Message-Id: <20220815022644.1665539-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 02:26:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169342

This is flagged with clang 15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../json-c/0001-Fix-build-with-clang-15.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.16.bb   |  2 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
new file mode 100644
index 00000000000..215f4d829a2
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
@@ -0,0 +1,34 @@
+From 0145b575ac1fe6a77e00d639864f26fc91ceb12f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Aug 2022 20:37:03 -0700
+Subject: [PATCH] Fix build with clang-15+
+
+Fixes
+json_util.c:63:35: error: a function declaration without a prototype is deprecated in all versions of C [-We
+rror,-Wstrict-prototypes]
+const char *json_util_get_last_err()
+                                  ^
+                                   void
+
+Upstream-Status: Backport [https://github.com/json-c/json-c/pull/783]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ json_util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json_util.c b/json_util.c
+index 952770a..83d9c68 100644
+--- a/json_util.c
++++ b/json_util.c
+@@ -60,7 +60,7 @@ static int _json_object_to_fd(int fd, struct json_object *obj, int flags, const
+ 
+ static char _last_err[256] = "";
+ 
+-const char *json_util_get_last_err()
++const char *json_util_get_last_err(void)
+ {
+ 	if (_last_err[0] == '\0')
+ 		return NULL;
+-- 
+2.37.2
+
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-devtools/json-c/json-c_0.16.bb
index 50431081bba..3aba41dfcf6 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = " \
     https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://0001-Fix-build-with-clang-15.patch \
     file://run-ptest \
 "
-
 SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
-- 
2.37.2


