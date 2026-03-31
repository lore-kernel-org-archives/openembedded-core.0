Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38C3FF60C2
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 04:56:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13359.1774932986501995797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 21:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Amc/8758;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso2143801a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 21:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774932985; x=1775537785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddXWWkWpczgHrk5m3cRfBujiGKtu4q7S72nAWboDT7I=;
        b=Amc/8758SM3PSeFlifouUTCneFbQbGesvnBAOzUQ1VVoMt5kik+tZA0sKNRekx02v9
         HuvTbg9K2ooywzY24ZRAZLt3RdB41IYtaNijXlo8nvnFCvNmOewfSMfp940qXjFv8HgX
         CB0Ix7ZtCyHWT7AeThQInzStANy2pjBsD+W1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774932985; x=1775537785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddXWWkWpczgHrk5m3cRfBujiGKtu4q7S72nAWboDT7I=;
        b=UFtKbPEF8DSJh/VeQb0G9vMkL8FFa1Iuvxcqqh9Fax4Hg7Mpf3H7tM1b8zQ9Kb1SKB
         MJYS/5abUhXw0+aDVZFbdX91CVSnB5teU+D6KsXC6DamQFRqkF9APZ1MUe/0c9CeEhbR
         4D9E47NiTglPgkLd7kBZKuQ6Mrnb3MvRvxktDG9nvYZTH8a3mWNH+AhSpTVnoYgZpbFi
         H1htpvkyn6yorxZwVvBw7OPwQeOMVbn0dH01lIquQQoSxoKU70iDWCb0srsdJrMsG4po
         ho2qrk6s5PsIcIXtySFKzuFC5IXJEvvgimnCjw6GhvpKOPBb5ueuQ60VSDpDXMkkr7yQ
         JXuA==
X-Gm-Message-State: AOJu0YzbBnSiK+bBIB81UFMqjwMGWU9j1moZKNaGFyVLo+N3SjduAleT
	Fz4ueOCD4zIp+vSoMhthlW8S2uSij+UenMlBlpe9n5tTjnCS6eRSjpGWSRcY0H/C0LnC/MBMNCv
	cEx05Oe8=
X-Gm-Gg: ATEYQzxmFHjJYD5Xjc6hwyADRqnMJKQL8YCFueDersmCobFv2bMPKB0IvfSKjYHRL2I
	lg7py4UuszssX2vOZT3jS4Rw0mm6SUip5lif0NXBvui0QsBNrzDjnHbeQX+ki9KVZdN3oi0KtPB
	59/C/D6EAxeEXRRopudl3aoPYsV7/cuqoMCWXc7rtUFIy2ey1bgMKYbtgqOP6zua2m0oQCgHI+n
	geL0VBJdVByx9Z0BHjNHFd4x6IPeRY8P2zAfSsC2eNpE6sPwnTCiQVEyl3+od8NtUIuMB2HqvTQ
	IMDzYn0VJakyP/RgWFSzSLSAWB2GmyjsttQCOrQFm94NPO9ogEMcbH7uKnRyxW+v06csEkL2VH/
	RocSUu6QhTqE6AG1rblCM7VjROQlewhs+20bOJWP0B4dXo4uo3wnpj3KBTCeZeApp3VM3VkaInr
	I/55fUnDXd7tj9qtS1fagttltAEDE9p+nhWpKa
X-Received: by 2002:a17:902:ebc5:b0:2b2:52af:52b8 with SMTP id d9443c01a7336-2b252af5615mr65935255ad.11.1774932984698;
        Mon, 30 Mar 2026 21:56:24 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:c18d:47a5:7f89:acfd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642864sm112328015ad.12.2026.03.30.21.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:56:24 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] libarchive: Fix CVE-2026-4111
Date: Tue, 31 Mar 2026 10:26:13 +0530
Message-ID: <20260331045613.1076570-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 04:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234260

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-4111
[2] https://github.com/libarchive/libarchive/pull/2877
[3] https://access.redhat.com/errata/RHSA-2026:5063

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   2 +
 3 files changed, 342 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
new file mode 100644
index 0000000000..f908b60775
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
+index 1dd0d88..736c95a 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2965,7 +2965,9 @@ static int parse_filter(struct archive_read* ar, const uint8_t* p) {
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
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
new file mode 100644
index 0000000000..18037ed61a
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
+index 7627ec5..e37312e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -521,6 +521,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_read_format_rar_invalid1.c \
+ 	libarchive/test/test_read_format_rar_overflow.c \
+ 	libarchive/test/test_read_format_rar5.c \
++	libarchive/test/test_read_format_rar5_loop_bug.c \
+ 	libarchive/test/test_read_format_raw.c \
+ 	libarchive/test/test_read_format_tar.c \
+ 	libarchive/test/test_read_format_tar_concatenated.c \
+@@ -918,6 +919,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar5_invalid_dict_reference.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift1.rar.uu \
+ 	libarchive/test/test_read_format_rar5_leftshift2.rar.uu \
++	libarchive/test/test_read_format_rar5_loop_bug.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part01.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part02.rar.uu \
+ 	libarchive/test/test_read_format_rar5_multiarchive.part03.rar.uu \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 59c5f5d..d7ec64e 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -165,6 +165,7 @@ IF(ENABLE_TEST)
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
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index b62c3d69b9..bc0d3ba074 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -44,6 +44,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            file://CVE-2025-60753-01.patch \
            file://CVE-2025-60753-02.patch \
+           file://CVE-2026-4111-1.patch \
+           file://CVE-2026-4111-2.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


