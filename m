Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661B5106F2EB
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 07:59:00 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42502.1774511939468158706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 00:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ihhp2ssd;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so629393a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774511938; x=1775116738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XU8MauJoJ7nxpTGw3b5GVk67GW+QBReMx39Jpjb1uLI=;
        b=Ihhp2ssdxXwWYROJjxgbEx5u3dPo4KCnl3FvqHvEo4bSpe9g3FRKetRplv2E9C+D6x
         2r97djaRhxvJNjHmbQFpNunSed/BGgwyWzShBReYtD0GplQvIlQ7NJsErPJz0YoHM5/Q
         830YlMrE3VvJkulfNCvesx4N0OM3VMNBN9adQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511938; x=1775116738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU8MauJoJ7nxpTGw3b5GVk67GW+QBReMx39Jpjb1uLI=;
        b=Rx697w5YHZGlKb/W9QFzktLFiYHIDallzI9HJOfyU0d1ybdRiq4RZPk0RlOyfYWtbo
         emTfAvG9yWxzDa2xtGwvWFplLmRmzTM6zCnKqB218bEx9R/FOtGgHMgK7wlmcPRQGabn
         ltMDRihvsQFTSSIk3BiMW0E4zobezcs9ckMeys+X96uBzGyJR5VUIKdo4121Xb7ygVyx
         Mqe4d3Ua7aDFPl+r1PKNSKZV0OQfczuXRAgKQw64eyrW+Rcurmc04k1XswUCJuvarZax
         Y+8ro0+A0MDr8CINt7sAChbReITsifaHNpczqkdwb1s1ap4zStoUhi/4D4CjWhYgwgL+
         n8kw==
X-Gm-Message-State: AOJu0Yx40MrJtsGSxaUzoC2ljtXl6jQbLzWLW9Po7zWS9d+vpUeo7k75
	GB0VI//c8uIynL32e7KIPS33nY3nFb8nx+LasQEgs3ViiBsW/QyiZLZ1PBMjumQUUM8OSrD8o6p
	hAuM67sc=
X-Gm-Gg: ATEYQzyrNyKzxfCnG7e/a23X0NxdaKbq80YF5OTUdW7a3TLXJ3pOLXWNablPrJJBdzN
	466JL5ZT0MDILUk48Oz5Do6pmt6u9SpH0R2NK0f5Iwu6AeqownMu3d15+vWpaH52Vt/Qdhu6lhC
	RmcHNZIh86w+kJQoXWBjG9Mw/EtVgfR1r1Mm3kO9AJFPSdLbT8QMgNfakJhw236bYJyU1D4wE/w
	gZpblDR5aw9kMmWswHU/IaNpCBmUAgSc7ear/saplulOwLXs7hHEm3jOpQ4rc8XACT7jS46BSnT
	TWPG91hEoB9kw0yjAPrOReJis28E/zLD6xeerbnM4Rwc+2v/LlKNIaCZDupPuyIp0e810SP9HRi
	2vWQvl0kL+fkjPus6CiDY0JwdZxUQyUwcmmrE6/mkD4B13dhd+x0MBxBSlA6QqwLjK9P6sNf5MV
	a2PtxgEzz62UUTg2JvLryaPOZwcOyiPfefb08A
X-Received: by 2002:a17:90b:4b:b0:359:8293:67f2 with SMTP id 98e67ed59e1d1-35c0dd996b2mr6056519a91.32.1774511937932;
        Thu, 26 Mar 2026 00:58:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:7987:be3f:ca17:f7a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1f2dddcesm446735a91.7.2026.03.26.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:58:57 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: Fix CVE-2026-4111
Date: Thu, 26 Mar 2026 13:28:47 +0530
Message-Id: <20260326075847.312211-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233956

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-4111
[2] https://github.com/libarchive/libarchive/pull/2877
[3] https://access.redhat.com/errata/RHSA-2026:5080

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 3 files changed, 342 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
new file mode 100644
index 0000000000..1f065b1364
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
@@ -0,0 +1,32 @@
+From 7273d04803a1e5a482f26d8d0fbaf2b204a72168 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sun, 1 Mar 2026 20:24:56 -0800
+Subject: [PATCH] Reject filters when the block length is nonsensical
+
+Credit: Grzegorz Antoniak @antekone
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/7273d04803a1e5a482f26d8d0fbaf2b204a72168]
+CVE: CVE-2026-4111
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libarchive/archive_read_support_format_rar5.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/archive_read_support_format_rar5.c
+index 38979cb..867f0a8 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2914,7 +2914,9 @@ static int parse_filter(struct archive_read* ar, const uint8_t* p) {
+ 	if(block_length < 4 ||
+ 	    block_length > 0x400000 ||
+ 	    filter_type > FILTER_ARM ||
+-	    !is_valid_filter_block_start(rar, block_start))
++	    !is_valid_filter_block_start(rar, block_start) ||
++	    (rar->cstate.window_size > 0 &&
++	     (ssize_t)block_length > rar->cstate.window_size >> 1))
+ 	{
+ 		archive_set_error(&ar->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+ 		    "Invalid filter encountered");
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
new file mode 100644
index 0000000000..243a03a8e5
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
@@ -0,0 +1,308 @@
+From ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sun, 1 Mar 2026 10:04:01 -0800
+Subject: [PATCH] Infinite loop in Rar5 decompression
+
+Found by: Elhanan Haenel
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4]
+CVE: CVE-2026-4111
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Makefile.am                                   |   2 +
+ libarchive/test/CMakeLists.txt                |   1 +
+ .../test/test_read_format_rar5_loop_bug.c     |  53 +++++
+ .../test_read_format_rar5_loop_bug.rar.uu     | 189 ++++++++++++++++++
+ 4 files changed, 245 insertions(+)
+ create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.c
+ create mode 100644 libarchive/test/test_read_format_rar5_loop_bug.rar.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index dd1620d..14edb2a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -507,6 +507,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_read_format_rar_invalid1.c \
+ 	libarchive/test/test_read_format_rar_overflow.c \
+ 	libarchive/test/test_read_format_rar5.c \
++	libarchive/test/test_read_format_rar5_loop_bug.c \
+ 	libarchive/test/test_read_format_raw.c \
+ 	libarchive/test/test_read_format_tar.c \
+ 	libarchive/test/test_read_format_tar_concatenated.c \
+@@ -869,6 +870,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
++	libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 05c6fd7..c8f2e90 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -156,6 +156,7 @@ IF(ENABLE_TEST)
+     test_read_format_rar_filter.c
+     test_read_format_rar_overflow.c
+     test_read_format_rar5.c
++    test_read_format_rar5_loop_bug.c
+     test_read_format_raw.c
+     test_read_format_tar.c
+     test_read_format_tar_concatenated.c
+diff --git a/libarchive/test/test_read_format_rar5_loop_bug.c b/libarchive/test/test_read_format_rar5_loop_bug.c
+new file mode 100644
+index 0000000..77dd78c
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_loop_bug.c
+@@ -0,0 +1,53 @@
++/*-
++ * Copyright (c) 2026 Tim Kientzle
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++#include "test.h"
++
++DEFINE_TEST(test_read_format_rar5_loop_bug)
++{
++  const char *reffile = "test_read_format_rar5_loop_bug.rar";
++  struct archive_entry *ae;
++  struct archive *a;
++  const void *buf;
++  size_t size;
++  la_int64_t offset;
++
++  extract_reference_file(reffile);
++  assert((a = archive_read_new()) != NULL);
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, reffile, 10240));
++
++  // This has just one entry
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
++
++  // Read blocks until the end of the entry
++  while (ARCHIVE_OK == archive_read_data_block(a, &buf, &size, &offset)) {
++  }
++
++  assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++  assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
++  assertEqualInt(ARCHIVE_OK, archive_free(a));
++}
+diff --git a/libarchive/test/test_read_format_rar5_loop_bug.rar.uu b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
+new file mode 100644
+index 0000000..3e47004
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar5_loop_bug.rar.uu
+@@ -0,0 +1,189 @@
++begin 644 test_read_format_rar5_loop_bug.rar
++M4F%R(1H'`0#%&C,R`P$``)T-9%L.`@+P0`"`@`P`@`,``6'(WFP@`?\7_U/^
++M8@!.`B`H````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++M````````````````````````````````````````````````````````````
++5```````````````````Y^;*!`@4`
++`
++end
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index e74326b40f..85fe6e5baa 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -50,6 +50,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            file://CVE-2025-60753-01.patch \
            file://CVE-2025-60753-02.patch \
+           file://CVE-2026-4111-1.patch \
+           file://CVE-2026-4111-2.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.25.1


