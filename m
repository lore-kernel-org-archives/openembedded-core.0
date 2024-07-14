Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA189C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.15273.1720960748282067137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pCuuAPSC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fb64d627b0so17927095ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960747; x=1721565547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efsBpu8tRK2srO6XXoQZG+s3vBw4HohVnjt0s8ntdQs=;
        b=pCuuAPSCeW83TIsQmjBN+RSBLL57/WtnmpgcraeACK43ndP4Zs7QpuktyJ7q5YBBnf
         dvFnb9/qVck+mTrbeVTDApD97j1EwQzJaH9KqTmTvA0yx7uRJuz7NZyVnBlCctRaINOY
         eQPkch0h+1SwOnCxNaIu+55UYqO7jytUT/1m7HeKJLthgOP39yQIZkoRAEVdj0JPb+bp
         NHhsfNBP4EvC/DKoOo/EH7HrK5IdTViOYYvVIVutj7/u5yqBiE3HmGRLATZLlCq3gqou
         Ibs1oYxWnvVsgoR4dt3ls4ZfFz/CuM0fO6Glpt28qZoIVZGTIhKkvaoT/gT0bczR6JJH
         /TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960747; x=1721565547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efsBpu8tRK2srO6XXoQZG+s3vBw4HohVnjt0s8ntdQs=;
        b=uoZJ7RWX9aj+fVpocD2Ot4K0VhWlboCo1GrblKgmQCo1s/L9NsVwGhm65Lv3iPMK7U
         a0QCgkNDGVu+tFxzHMtTF6UmhKKxSwjx6wzzk9DCDO+m2EYDauk1gDc6KbtBeO8BLANe
         KPqDJMo8i+DMJIvey4cLQ+zhFqd4w9/9BZBniT7JX4mSn77SZqiFziki9Eud8zmBneam
         MuOTGJi1FZ3hizLbNHHaJJunIBjDPLjO3Zhtksu99Hs+isdpYiPem4Dc+9gfOL5hNEUy
         +bdD7C3pZ1KZNBC+2atotWsG2OH8jPzcRPZQPRlSKPLBMjqSAYVAJPFd7ovGhUg2Syyy
         haIg==
X-Gm-Message-State: AOJu0YxZIMei8Q21RzZCm6IKyIzuLKIcN5XUdy5JgLVyKClee2kRIi0/
	Y7nI17GXcdsidM8zcx+Pv1QCM3P29RNaMy1MRkVntUaYsEACGbTADm/r6TVj2mQz23RhGucRagY
	Xm9U=
X-Google-Smtp-Source: AGHT+IFu13++B9/M5riJVkU3/zLF5BshdlFz1vjkXpN1ImoeB43sT8+D4mOTvdqimNMGXOs9fdHf5g==
X-Received: by 2002:a17:902:ec85:b0:1fb:57e7:5bc6 with SMTP id d9443c01a7336-1fbb6d03e74mr126498615ad.23.1720960747470;
        Sun, 14 Jul 2024 05:39:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/27] libcap-ng: upgrade 0.8.4 -> 0.8.5
Date: Sun, 14 Jul 2024 05:38:32 -0700
Message-Id: <5eff01bbc58dcb1d51639ee4b43ee9a3e23e39ed.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201862

From: Yi Zhao <yi.zhao@eng.windriver.com>

Changelog:
https://people.redhat.com/sgrubb/libcap-ng/ChangeLog

 - Remove python global exception handler since it's deprecated
 - Make the utilities link against just built libraries
 - Remove unused macro in cap-ng.h

Drop backport patch fix-issues-with-swig-4-2.patch.
Backport a patch to fix build for libcap-ng-python.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0263fd8193e51e54a4598ea3811c3c0a6e781f85)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...hon-path-when-invoking-py-compile-54.patch | 34 +++++++++++++++++++
 .../files/fix-issues-with-swig-4-2.patch      | 32 -----------------
 meta/recipes-support/libcap-ng/libcap-ng.inc  |  4 +--
 ...{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} |  0
 4 files changed, 36 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
 delete mode 100644 meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.4.bb => libcap-ng_0.8.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch b/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
new file mode 100644
index 0000000000..a0452ad53d
--- /dev/null
+++ b/meta/recipes-support/libcap-ng/files/0001-Fix-python-path-when-invoking-py-compile-54.patch
@@ -0,0 +1,34 @@
+From 1fe7c1cfeea00ba4eb903fbb39b74361594d4835 Mon Sep 17 00:00:00 2001
+From: Jan Palus <jpalus@fastmail.com>
+Date: Wed, 10 Apr 2024 21:30:51 +0200
+Subject: [PATCH] Fix python path when invoking py-compile (#54)
+
+48eebb2 replaced custom PYTHON3 variable with PYTHON by using standard
+AM_PATH_PYTHON macro. Makefile however still referred to old one.
+There's no need to set PYTHON explicitly anymore so drop it.
+
+Fixes #53
+
+Upstream-Status: Backport
+[https://github.com/stevegrubb/libcap-ng/commit/1fe7c1cfeea00ba4eb903fbb39b74361594d4835]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bindings/python3/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/bindings/python3/Makefile.am b/bindings/python3/Makefile.am
+index 70a1dd8..6072fc2 100644
+--- a/bindings/python3/Makefile.am
++++ b/bindings/python3/Makefile.am
+@@ -27,7 +27,6 @@ AM_CPPFLAGS = -I. -I$(top_builddir) $(PYTHON3_INCLUDES)
+ LIBS = ${top_builddir}/src/libcap-ng.la
+ SWIG_FLAGS = -python
+ SWIG_INCLUDES = ${AM_CPPFLAGS}
+-PYTHON = $(PYTHON3)
+ pyexec_PYTHON = capng.py
+ pyexec_LTLIBRARIES = _capng.la
+ pyexec_SOLIBRARIES = _capng.so
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch b/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
deleted file mode 100644
index fb424fe725..0000000000
--- a/meta/recipes-support/libcap-ng/files/fix-issues-with-swig-4-2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 355eada2d20886287cffc16e304087dd6f66ae37 Mon Sep 17 00:00:00 2001
-From: Steve Grubb <ausearch.1@gmail.com>
-Date: Thu, 4 Jan 2024 15:06:29 -0500
-Subject: [PATCH] Remove python global exception handler since its deprecated
-
-Upstream-Status: Backport [https://github.com/stevegrubb/libcap-ng/commit/30453b6553948cd05c438f9f509013e3bb84f25b]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- bindings/src/capng_swig.i | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/bindings/src/capng_swig.i b/bindings/src/capng_swig.i
-index fcdaf18..fa85e13 100644
---- a/bindings/src/capng_swig.i
-+++ b/bindings/src/capng_swig.i
-@@ -30,13 +30,6 @@
- 
- %varargs(16, signed capability = 0) capng_updatev;
- 
--%except(python) {
--  $action
--  if (result < 0) {
--    PyErr_SetFromErrno(PyExc_OSError);
--    return NULL;
--  }
--}
- #endif
- 
- %define __signed__
--- 
-2.43.2
-
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 845b7c2f0a..12b4002d11 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-           file://fix-issues-with-swig-4-2.patch \
+           file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
            "
 
-SRC_URI[sha256sum] = "68581d3b38e7553cb6f6ddf7813b1fc99e52856f21421f7b477ce5abd2605a8a"
+SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
 
 EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
 EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb
-- 
2.34.1


