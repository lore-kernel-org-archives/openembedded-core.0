Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A566C83F17
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:35 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.18425.1752074374086991340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z5tK+avg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so104556a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074373; x=1752679173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVTIdt4QQ1siAm3nx2Dvc1k2cpc2Fiy1WlVqLNsx5Y=;
        b=Z5tK+avgZKsc/cmIPTaJy3biJ+xPxw5cxSkL2bT6kTNbcG+9wQqpEUpJA2RIoMBLbX
         duWShlrRur81aoSL/tPiOLzI5CDvm1tqakjpq7OyXEW8kqwE7g+Seb+FCfhmcte6Tab3
         Sg7QDZdvCP2qRoRHvBcg83+5104QSTOj/EiZNW7CkV8h7e2MeNV34WbCga22zfFvmUXD
         h5VOTT+ltI7OpZ9NN2GVaSCdxsvTwQ7fd9LEZAbrH7rlB8yyOCM5QboNkmLEIgFsg3zj
         h/B3DXMmR7YBfRz10ZZ7u8g9TcBWa8TBj3tnGv2/ElYZKTF396yYju5xLZwF3/iWNjZa
         CbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074373; x=1752679173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvVTIdt4QQ1siAm3nx2Dvc1k2cpc2Fiy1WlVqLNsx5Y=;
        b=TQ6gk+KFv7UP1fSW/EWu4fTfCuCINL0bwGMJ57mIFDKkV9O8HiRQ7+rN+G0CXRnfY/
         HLsurCNbgPx4t9InoHVjGoadU5pACUUaVuPozaJAAByV86ufDt38MwHjqoVQ47jLwW4t
         DzZ1mc0rC1azx8XKMVI0nCyl9bORdLnEOeXjUVqjpkVTGp2QKHXx+IuTb5qc45j1TRl7
         t0B0i3pDmOTsqJ8DTAN/dTUeHF9dGz9OEZXWeenK/PLHUNe7qhjWIo3fJQ69qSo2wLxz
         Gyc2vc3/1tpn1/V2r4uk1tzGSxOJcmHKddNFI9wzl9sYHqfTeKkCin2CoEgBkVgkOBVk
         TMGQ==
X-Gm-Message-State: AOJu0YxxJNrr6LNQ4sjQUA6S0ZaJ+M/+4AaRZl36JWDuh9elQy+6WNJD
	73nDYgQ9GUyBzvaJt4DXqXV0Al6U2m1KwjhTTUL3lbnSoEZIePxoCJzo5wcXfp9fm/wpOuj3WFL
	rj3n+
X-Gm-Gg: ASbGnctQrH+jvSDpUEtl459+834135U4liEaFoNotTChsZuxVljH4MA1gZR+koPvjC4
	sXmIeUdSas6xhGIPBpr6RwRiTn3W3ohEEnYG06UjxlfpqGsAob+B6b98I8yv8jv8BCB372Bol1e
	j5pEzJMJT/vKZihdd7xU2ers7kwZ6H7v31I75vwMVVrS60sjgWkrcETKxvpcMmzDTCDERpaj4zL
	Qn0KNisQxcNCoQ024L16lVZn/iMpHXi7c9ktP87dM9gNXL6DMCXDcyXRKvwhdzu0IjDZL8gIg3s
	RyuSeZ0QM3BvU4nZiesmclnq5IkQxOVCi/kXwyHm8W62o4nn7kNT1g==
X-Google-Smtp-Source: AGHT+IHXUafmNyg/kuV6vwbZZjyyGTHN08rc2JEPm9iCO1s6CMiN7S/6fenwqUzSaW48fMMoaFQw1w==
X-Received: by 2002:a17:90b:4fc5:b0:312:e73e:cded with SMTP id 98e67ed59e1d1-31c2276a98cmr9501106a91.16.1752074372908;
        Wed, 09 Jul 2025 08:19:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/11] libarchive: fix CVE-2025-5915
Date: Wed,  9 Jul 2025 08:19:11 -0700
Message-ID: <41e7be4aa28481530d5e259d0f25b238b86c012d.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220099

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library. This flaw can lead to a heap b
uffer over-read due to the size of a filter block potentially exceeding the Lempel-Ziv-Storer
-Schieber (LZSS) window. This means the library may attempt to read beyond the allocated memo
ry buffer, which can result in unpredictable program behavior, crashes (denial of service), o
r the disclosure of sensitive information from adjacent memory regions.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5915

Upstream-patches:
https://github.com/libarchive/libarchive/commit/a612bf62f86a6faa47bd57c52b94849f0a404d8c

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5915.patch | 217 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
new file mode 100644
index 0000000000..c83f4f1abc
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
@@ -0,0 +1,217 @@
+From a612bf62f86a6faa47bd57c52b94849f0a404d8c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 11 May 2025 19:00:11 +0200
+Subject: [PATCH] rar: Fix heap-buffer-overflow (#2599)
+
+A filter block size must not be larger than the lzss window, which is
+defined
+by dictionary size, which in turn can be derived from unpacked file
+size.
+
+While at it, improve error messages and fix lzss window wrap around
+logic.
+
+Fixes https://github.com/libarchive/libarchive/issues/2565
+
+---------
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Co-authored-by: Tim Kientzle <kientzle@acm.org>
+
+CVE: CVE-2025-5915
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a612bf62f86a6faa47bd57c52b94849f0a404d8c]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ Makefile.am                                   |  2 +
+ libarchive/archive_read_support_format_rar.c  | 17 ++++---
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_read_format_rar_overflow.c      | 48 +++++++++++++++++++
+ .../test/test_read_format_rar_overflow.rar.uu | 11 +++++
+ 5 files changed, 72 insertions(+), 7 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_rar_overflow.c
+ create mode 100644 libarchive/test/test_read_format_rar_overflow.rar.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index 3fd2fdb..e486a8d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -505,6 +505,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_read_format_rar_encryption_header.c \
+ 	libarchive/test/test_read_format_rar_filter.c \
+ 	libarchive/test/test_read_format_rar_invalid1.c \
++	libarchive/test/test_read_format_rar_overflow.c \
+ 	libarchive/test/test_read_format_rar5.c \
+ 	libarchive/test/test_read_format_raw.c \
+ 	libarchive/test/test_read_format_tar.c \
+@@ -848,6 +849,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar_multivolume.part0003.rar.uu \
+ 	libarchive/test/test_read_format_rar_multivolume.part0004.rar.uu \
+ 	libarchive/test/test_read_format_rar_noeof.rar.uu \
++	libarchive/test/test_read_format_rar_overflow.rar.uu \
+ 	libarchive/test/test_read_format_rar_ppmd_lzss_conversion.rar.uu \
+ 	libarchive/test/test_read_format_rar_ppmd_use_after_free.rar.uu \
+ 	libarchive/test/test_read_format_rar_ppmd_use_after_free2.rar.uu \
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 091a993..4d3b966 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -451,7 +451,7 @@ static int read_filter(struct archive_read *, int64_t *);
+ static int rar_decode_byte(struct archive_read*, uint8_t *);
+ static int execute_filter(struct archive_read*, struct rar_filter *,
+                           struct rar_virtual_machine *, size_t);
+-static int copy_from_lzss_window(struct archive_read *, void *, int64_t, int);
++static int copy_from_lzss_window(struct archive_read *, uint8_t *, int64_t, int);
+ static inline void vm_write_32(struct rar_virtual_machine*, size_t, uint32_t);
+ static inline uint32_t vm_read_32(struct rar_virtual_machine*, size_t);
+ 
+@@ -2899,7 +2899,7 @@ expand(struct archive_read *a, int64_t *end)
+     }
+ 
+     if ((symbol = read_next_symbol(a, &rar->maincode)) < 0)
+-      return (ARCHIVE_FATAL);
++      goto bad_data;
+ 
+     if (symbol < 256)
+     {
+@@ -2926,14 +2926,14 @@ expand(struct archive_read *a, int64_t *end)
+       else
+       {
+         if (parse_codes(a) != ARCHIVE_OK)
+-          return (ARCHIVE_FATAL);
++          goto bad_data;
+         continue;
+       }
+     }
+     else if(symbol==257)
+     {
+       if (!read_filter(a, end))
+-          return (ARCHIVE_FATAL);
++          goto bad_data;
+       continue;
+     }
+     else if(symbol==258)
+@@ -3018,7 +3018,7 @@ expand(struct archive_read *a, int64_t *end)
+           {
+             if ((lowoffsetsymbol =
+               read_next_symbol(a, &rar->lowoffsetcode)) < 0)
+-              return (ARCHIVE_FATAL);
++              goto bad_data;
+             if(lowoffsetsymbol == 16)
+             {
+               rar->numlowoffsetrepeats = 15;
+@@ -3066,7 +3066,7 @@ bad_data:
+ }
+ 
+ static int
+-copy_from_lzss_window(struct archive_read *a, void *buffer,
++copy_from_lzss_window(struct archive_read *a, uint8_t *buffer,
+                       int64_t startpos, int length)
+ {
+   int windowoffs, firstpart;
+@@ -3081,7 +3081,7 @@ copy_from_lzss_window(struct archive_read *a, void *buffer,
+   }
+   if (firstpart < length) {
+     memcpy(buffer, &rar->lzss.window[windowoffs], firstpart);
+-    memcpy(buffer, &rar->lzss.window[0], length - firstpart);
++    memcpy(buffer + firstpart, &rar->lzss.window[0], length - firstpart);
+   } else {
+     memcpy(buffer, &rar->lzss.window[windowoffs], length);
+   }
+@@ -3228,6 +3228,9 @@ parse_filter(struct archive_read *a, const uint8_t *bytes, uint16_t length, uint
+   else
+     blocklength = prog ? prog->oldfilterlength : 0;
+ 
++  if (blocklength > rar->dictionary_size)
++    return 0;
++
+   registers[3] = PROGRAM_SYSTEM_GLOBAL_ADDRESS;
+   registers[4] = blocklength;
+   registers[5] = prog ? prog->usagecount : 0;
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index bbbff22..05c6fd7 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -154,6 +154,7 @@ IF(ENABLE_TEST)
+     test_read_format_rar_encryption_partially.c
+     test_read_format_rar_invalid1.c
+     test_read_format_rar_filter.c
++    test_read_format_rar_overflow.c
+     test_read_format_rar5.c
+     test_read_format_raw.c
+     test_read_format_tar.c
+diff --git a/libarchive/test/test_read_format_rar_overflow.c b/libarchive/test/test_read_format_rar_overflow.c
+new file mode 100644
+index 0000000..b39ed6b
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar_overflow.c
+@@ -0,0 +1,48 @@
++/*-
++ * Copyright (c) 2003-2025 Tim Kientzle
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
++DEFINE_TEST(test_read_format_rar_overflow)
++{
++    struct archive *a;
++    struct archive_entry *ae;
++    const char reffile[] = "test_read_format_rar_overflow.rar";
++    const void *buff;
++    size_t size;
++    int64_t offset;
++
++    extract_reference_file(reffile);
++    assert((a = archive_read_new()) != NULL);
++    assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
++    assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
++    assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, reffile, 1024));
++    assertEqualIntA(a, ARCHIVE_OK, archive_read_next_header(a, &ae));
++    assertEqualInt(48, archive_entry_size(ae));
++    /* The next call should reproduce Issue #2565 */
++    assertEqualIntA(a, ARCHIVE_FATAL, archive_read_data_block(a, &buff, &size, &offset));
++
++    assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
++    assertEqualInt(ARCHIVE_OK, archive_read_free(a));
++}
+diff --git a/libarchive/test/test_read_format_rar_overflow.rar.uu b/libarchive/test/test_read_format_rar_overflow.rar.uu
+new file mode 100644
+index 0000000..48fd3fd
+--- /dev/null
++++ b/libarchive/test/test_read_format_rar_overflow.rar.uu
+@@ -0,0 +1,11 @@
++begin 644 test_read_format_rar_overflow.rar
++M4F%R(1H'`,($=```(0`@`0``,`````(````````````S`0``````,`"_B%_:
++MZ?^[:7``?S!!,`@P,KB@,T@RN33)MTEB@5Z3<`DP`K35`.0P63@P<,Q&0?#,
++MA##,,",S,(@P,#,@##`&,#":(3`!,#"(`9HPS,,S13`P,#`P,*`PHPS,,S1A
++M,!,!,#","9H@S12D#$PP!C`P`*'F03":,,T8H`@\,/DPJS!/,"30,#`3N%LP
++MCQ6:S3"!,#LP22<-,$5%B"5B$S!)(&*>G#+@!`E`%0ODC])62=DO,)BYJX'P
++M=/LPZ3!!008?%S`P,#`P,#`P,#`P,#`P,#`P,#`P2$PP,#`P03!(,#`P,#`&
++M,`7),#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P,#`P
++-,#`P,#`P,#`P,#`P,```
++`
++end
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 4d0e3f7179..c612c1b7e0 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2024-20696.patch \
            file://CVE-2025-25724.patch \
            file://CVE-2025-5914.patch \
+           file://CVE-2025-5915.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


