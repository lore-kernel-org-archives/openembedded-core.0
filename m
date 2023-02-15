Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B72FC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 17:18:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.21342.1676481518768542036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 09:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c+PtGzwn;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id s13so2181788wrw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 09:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jI+cM0VtEkRWn4iNyKwWErtw+6ozoRTBPYbWUGTu2J0=;
        b=c+PtGzwneNuiBN+SKQw3EY/yp1pcamXEZ5TPk/eE2pyeksx2q2Mze0bQ6EiGgL7iuF
         nz13hBZn3u7zqJWl+Z56KLYZtGAuu2uXeeqMs+JeA+oE+c2scqsSQxZagNm3XF+tzlAw
         Vmac04OgXGdGRtP7F+QVliyjUFNV/vUYGLMIUuaFii980zSk91bfPfWtVnoafWTJ+rOl
         qI6kPjsAlczpSUf0pevEgjIT9/KFRNJCm9rz43CUFkEsxt8a1uIDxEUx2zh6/jdF35eM
         dhc19dBM1ft5XG6atcdbQjDjp9PqaqXmkszepRBlqmNc/gLzMGfNK/JPcq/Htv9CvHq4
         PnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI+cM0VtEkRWn4iNyKwWErtw+6ozoRTBPYbWUGTu2J0=;
        b=bBY21wlq2FsWbVbVLXxiPzbfRrDnJy04aj4eDickWbEkAcyfDk2Gl9LFa4iEM5bP5a
         WmdFdftryuuSMA3P1GnQfW/vwJwAh+Vhl8qRb9e6zHgBcQk0iCiC2mNvhPjIQA01dobg
         FOYhw2cYQbraWQrVNtc770KLG8C/INg1KD4K1TQRUCe80KWbgiJCdQCRy7YCQh4ir0VT
         FIg0y7so4CztA1CjZblNE6Kv4z2BfBy8y6scGEN39xriQQPx0xTdCmenmLT4OsHTHHAB
         skvzxTIBrLuz6pcMxcKfoI2F7wtIcYxAc427TwDZxKJiyQM2W4cXc2PZthf1tP5SP8dl
         V81Q==
X-Gm-Message-State: AO0yUKXRkkgZ8p1xoiWbqejGusiVjjaVQj0LRzsJbGNUoqW/ZJ1b8TpA
	6Aid/FPRyhCb+IAoTl6s6lbhKpywAgg=
X-Google-Smtp-Source: AK7set/KbsuaFLEoo011il4zTF3h9ZpAkfRIYQ2/NPUoPKX4xW+8gKM+kIKzp1Mtcnd7xTcCmD5w0w==
X-Received: by 2002:adf:d085:0:b0:2c5:52ce:7061 with SMTP id y5-20020adfd085000000b002c552ce7061mr2127379wrh.70.1676481517190;
        Wed, 15 Feb 2023 09:18:37 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e29-20020a5d595d000000b002c53cc7504csm15875669wri.78.2023.02.15.09.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:18:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	changqing.li@windriver.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] libssh2: Update patch to apply and fix malformed Upstream-Status
Date: Wed, 15 Feb 2023 18:18:32 +0100
Message-Id: <20230215171832.635085-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 17:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177204

* I've noticed this, because patchreview.py reports Malformed
  Upstream-Status in this one now, but the QA check in insane.bbclass
  wasn't reporting it before

* the reason why insane.bbclass doesn't report it is because:
  SRC_URI:append:ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
  doesn't work and probably never did as "ptest" is not an override
  and patch-status-core checks only the .patch files which are really
  in SRC_URI.

* I've added it directly to SRC_URI and it also didn't apply:
  http://errors.yoctoproject.org/Errors/Details/689955/
  as the "endif" at the end was removed in 1.10.0 version:
  https://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a402c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81a4f9db

  after updating the patch to apply I got expected patch-status-core failure:
  http://errors.yoctoproject.org/Errors/Details/689956/
  ERROR: QA Issue: Malformed Upstream-Status in patch
  TOPDIR/openembedded-core/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
  Please correct according to https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
  Upstream-Status: Inappropriate[oe specific] [patch-status-core]

* so the mystery is solved, but what should be do with this never-used
  patch, I think we should just delete it together with
  SRC_URI:append:ptest, but please Changqing Li confirm it's not needed

* it was originally added by Changqing Li in meta-oe with:
  https://git.openembedded.org/meta-openembedded/commit/?id=d7aa7173405c3b36235af736cd31dbe110708787
  then imported to oe-core by Randy MacLeod with:
  https://git.openembedded.org/openembedded-core/commit/?id=57df134b1be56a688f41851e5ff014dd859c0bc3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
index b1204e49eb..e0000b2658 100644
--- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
+++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
@@ -1,24 +1,23 @@
-From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
-From: Your Name <you@example.com>
+From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 28 Dec 2020 02:08:03 +0000
 Subject: [PATCH] Don't let host enviroment to decide if a test is build
 
 test ssh2.sh need sshd, for cross compile, we need it on target, so
 don't use SSHD on host to decide weither to build a test
 
-Upstream-Status: Inappropriate[oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
- tests/Makefile.am | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
+ tests/Makefile.am | 4 ----
+ 1 file changed, 4 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index dc0922f..6cbc35d 100644
+index 27ddc2d..13de8ab 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -1,16 +1,12 @@
+@@ -3,16 +3,12 @@ SUBDIRS = ossfuzz
  AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include -I$(top_builddir)/src
  LDADD = ../src/libssh2.la
  
@@ -35,10 +34,3 @@ index dc0922f..6cbc35d 100644
  check_PROGRAMS = $(ctests)
  
  TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
-@@ -38,4 +34,4 @@ if OPENSSL
- # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
- # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
- EXTRA_DIST += test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
--endif
-\ No newline at end of file
-+endif
-- 
2.39.2


