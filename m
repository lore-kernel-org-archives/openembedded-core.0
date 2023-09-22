Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DFECD4F26
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:52 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.16350.1695367488620581863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BGw8mgqN;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-530a6cbbb47so2208020a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367487; x=1695972287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJB9twqM/bSoAr8sq3FUcFgFhoy2n9L4psdLzPvjSyM=;
        b=BGw8mgqN/wdHQdsYjUdDh4Sh2VyZGEsu3J04Nwl5ycM9YfjQCNVKKuY3vuVQY+A/uC
         q8pgnicOGh9vsqtXPFSEgdVPNNcwuUwpYdpa2+PDQ0jKoD5qKjd/Ipl/pSYY1AHEiLxT
         NGXC4yD0E/pMwG1BOrpMcGBiUL/lcpZm6r4ZCAdGbiZTIYAQUn/MtXUj2fqOtMF+c/XC
         bkJ+GrhRmaxIRomifWEU8zRJkqoTDl/OUlHWJ47fh2Z8K+x1cazw6axJ2AcdgiuKz7FT
         SgSuc8Wzb+XHX8nEx0FAaAAQbsAeUKNpwDCJfjsDXLmvgJPXIXvs7PYkXVZ2PxpwxneP
         KXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367487; x=1695972287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJB9twqM/bSoAr8sq3FUcFgFhoy2n9L4psdLzPvjSyM=;
        b=a2UXg0cMGdE3YOhO+d3gYb2zeHfYcctsq+9lnYzp7P6gFoFeWxBqfNjtgHvNlBpDkz
         6KZpqoGlKLHcrxabtCERBf+k+z2RnPqhpkhso825misXM2TrA/G2PzouFCFg6936QP8G
         yJpzUndnwivCkTmwfc8yC/D8iFuiqZsueBjYPWO7/kezmwqJvzI/PTROf17Ls3zZ1Izg
         uzAH3/9uVVPZOpMi9oroQbfZ3gsjwK+aE7+5+CzXpkow/Wti7SuLF92iA85csZUbF9XT
         ml09C4SwhK42zvfymodw070I4/ntjngcPcJzLIl8NrwV9bgOhMF4svEjuVpGNyj2mxs6
         IgOw==
X-Gm-Message-State: AOJu0YzXGQTzJl6awX3sOtKKvlScdrJY+rE/xoIYqQqYHRy9C5bbT+Ny
	vgNO/AlMEb41DTN78P4gC+GNTc1miI8=
X-Google-Smtp-Source: AGHT+IHeY0htN0fF8t8BvCcbjQaLunleFj2uH0AwGgJIGSS02D33cRsYicYB49V8Ke4m9xrvPELCpg==
X-Received: by 2002:a17:907:77d0:b0:9ae:690d:4284 with SMTP id kz16-20020a17090777d000b009ae690d4284mr3113128ejc.75.1695367486777;
        Fri, 22 Sep 2023 00:24:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/40] json-c: upgrade 0.16 -> 0.17
Date: Fri, 22 Sep 2023 09:24:10 +0200
Message-Id: <20230922072431.1481743-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188062

Fix run-ptest to append to log instead of overwriting it with every test invocation.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../json-c/0001-Fix-build-with-clang-15.patch | 34 -------------------
 meta/recipes-devtools/json-c/json-c/run-ptest |  2 +-
 .../json-c/{json-c_0.16.bb => json-c_0.17.bb} | 12 +++----
 3 files changed, 6 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
 rename meta/recipes-devtools/json-c/{json-c_0.16.bb => json-c_0.17.bb} (73%)

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
deleted file mode 100644
index 215f4d829a2..00000000000
--- a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0145b575ac1fe6a77e00d639864f26fc91ceb12f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Aug 2022 20:37:03 -0700
-Subject: [PATCH] Fix build with clang-15+
-
-Fixes
-json_util.c:63:35: error: a function declaration without a prototype is deprecated in all versions of C [-We
-rror,-Wstrict-prototypes]
-const char *json_util_get_last_err()
-                                  ^
-                                   void
-
-Upstream-Status: Backport [https://github.com/json-c/json-c/pull/783]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- json_util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_util.c b/json_util.c
-index 952770a..83d9c68 100644
---- a/json_util.c
-+++ b/json_util.c
-@@ -60,7 +60,7 @@ static int _json_object_to_fd(int fd, struct json_object *obj, int flags, const
- 
- static char _last_err[256] = "";
- 
--const char *json_util_get_last_err()
-+const char *json_util_get_last_err(void)
- {
- 	if (_last_err[0] == '\0')
- 		return NULL;
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-devtools/json-c/json-c/run-ptest
index 9ee6095ea22..2d0e94cd3ac 100644
--- a/meta/recipes-devtools/json-c/json-c/run-ptest
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -8,7 +8,7 @@ for i in test*.test; do
     # test_basic is not an own testcase, just
     # contains common code of other tests
     if [ "$i" != "test_basic.test" ]; then
-        if ./$i > json-c_test.log 2>&1 ; then
+        if ./$i >> json-c_test.log 2>&1 ; then
             echo PASS: $i
         else
             ret_val=1
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
similarity index 73%
rename from meta/recipes-devtools/json-c/json-c_0.16.bb
rename to meta/recipes-devtools/json-c/json-c_0.17.bb
index 3aba41dfcf6..b7b596212f8 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -4,12 +4,10 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = " \
-    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-    file://0001-Fix-build-with-clang-15.patch \
-    file://run-ptest \
-"
-SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
@@ -24,7 +22,7 @@ do_install_ptest() {
     install ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
     install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
     install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
-    install ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*json ${D}/${PTEST_PATH}/tests
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


