Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E10F364DB
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:28 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144832.1775776285095176894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xmUlOiqE;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso15334625e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776283; x=1776381083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugHqcjdN6zoBas+QQwnv65Xz4W7IIwZMWDc6pFdOi90=;
        b=xmUlOiqElpHEvdAR0PTxfd8yFgc6gbsb8il6aJiJZbeQ+yg8sQcz/xRJFOp6MT6Tun
         o7gmvuulE8NHFFPmK2Bf7nDpJoRK4meDBrww2wfTFzEt+p2qu56X2QDwbqestvP49Pyi
         3UFkwfnIREEpA7eKcB5sR2UjKNN71SFrPCihg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776283; x=1776381083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ugHqcjdN6zoBas+QQwnv65Xz4W7IIwZMWDc6pFdOi90=;
        b=RVGJGu5E5gb710oS3fehXrE/cpAnamppne1PtZOkTHmx/nQ3AbqKr751f27TfvNn40
         HRCIx97JlZNdbWHTIM8VozJkfAS9OAjGsc54yheM1JCYGTf+L3u7MkvsbtOZ39SQa0+8
         hNTFu3r/hMqBzi5bc8Abu1h1WvPw2gO9McbpTGrGVZE85Y27Ip4nHA4HI6bY/P5dpGA8
         o0nTnXk08wEWQzoF3u2+yAkPUHDLJ1Bcj2AAkJOJUjd7qZ9PVxWrTSyWpmm2kE7cmTF7
         0xHYopLiXRRO976Ddxmgjx+DmY9jzafcmjl0dsjSMZ8Kd8/UC8ZGcFog7gvtIkCYjt2j
         qy0Q==
X-Gm-Message-State: AOJu0YxbF8S76xqi34H5BLwgP6gi1KAVH/+8srzIgznn0fa2kktP/6et
	Wz0244rq4gtSwBjikVFCmhs+juCoH7NWmKV3kUERHB9aXsIyK9gSUeLIHRmsTBWOgPtgSeRGkWJ
	+5r8hZh5tmdfR
X-Gm-Gg: AeBDiet8Lb5cGCN5pw8q4Gv1wKLmcVhtn6FsTUBFcsham3z6TuHzWMjaet00VuenITl
	ZpBHGXdAK/tMfR6svqO3zvbMnjqfaWoYH3k42HXpd0Awp+cTOXeVS8dfqBmp52uKeik5QxvwwVL
	dECcl4hav18lyMHDfJICV6DTogQB01Q2BFuT20FtQeKjdUQE44I1Rh37epnYNM5sZq3+ma6cXlf
	nq6l3A9EZOWMZdzIp83xjX7qE3rc1eHrPKswH6YKivX7h8h+5AkG7gy2RaVcqxTv9IRoHfRmaNv
	Pr5jbaHNEnRkiHNNikc80uwv+nGOTaeKteSZD5aKIJbf5J5I/lUuCr9eKYPZQAh3j34TQYMR3KC
	aaTTjusl04hXd3QyRvKXlTJidowo8irAYy+7pJUFWTFxWAA8HSVBwme4VT5WSaxIHOU/LYug+Df
	Nv9tHSAYiiR46MSCeXf0UO4gAnXt/d4kj6IJ5yFDDpr4MgUf3+7kfn5P6EfdB8CTNVBHTX0j3uF
	gSVQ/b881AXzwyQbEgRWp+/+3cb
X-Received: by 2002:a05:600c:5299:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488d6875f3emr7441525e9.22.1775776282738;
        Thu, 09 Apr 2026 16:11:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 11/30] libarchive: Fix CVE-2026-4111
Date: Fri, 10 Apr 2026 01:10:11 +0200
Message-ID: <9af05e2d56ed355c02722a24ee66b2b0d4097cb9.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234970

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-4111
[2] https://github.com/libarchive/libarchive/pull/2877
[3] https://access.redhat.com/errata/RHSA-2026:5080

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 3 files changed, 342 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
new file mode 100644
index 00000000000..1f065b13648
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
index 00000000000..243a03a8e5d
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
index e74326b40fd..85fe6e5baa2 100644
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
 

