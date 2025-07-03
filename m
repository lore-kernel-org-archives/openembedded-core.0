Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D501C83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 10:16:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18980.1751537770123638050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 03:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9279406b92=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5636K2jr031515
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 03:16:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4dav5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 03:16:09 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 03:16:10 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/4] libarchive: fix CVE-2025-5915
Date: Thu, 3 Jul 2025 15:45:39 +0530
Message-ID: <20250703101542.886225-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: tPYBVwa_d9J7Cvp2wgcnLyK1HhArb6ST
X-Proofpoint-ORIG-GUID: tPYBVwa_d9J7Cvp2wgcnLyK1HhArb6ST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4NCBTYWx0ZWRfX5iDLhNrahoCa xHa45D7VWcUxo8DkmGr9XVoT3/12LOwEd3anDlSIB8/zYB7Pam0fi7KNxUfrmwogctC3QbJnkoO AtoF5AXi+9f5lHYKitjsDxFc14RGoVsjFzYaFGzzyqBGL0xHvQ6GGQLMOQTEYFqieyyJgoi3opq
 Ob+F3sg8ZEj4RD0/fS65HHL8meAx4NYTTXKk7jnv+Y/Gh89ccYdjL3Bl19FvatBLVjVWwJ8DBjZ WDymPSbru/kqH2FYJpuJ/VX9nCC7ByrUVqBmD2kywG2nZUafX1Nn+vFWog55ZHQG91jSxbNoERG 4GZizauEnm+v8DAO6Q9o+C0eIH+4iQDF5OEhi0/2qQInRbmtYlk9dkP2BkIJUIvZezk5/QyGy1I
 VF8OAWPEM8BzPJNIGL1vdgQoeLk7yc7WYg3kbxjIGnOaITdYJkl8ScfQvv/ZqhngehJIpqa/
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68665869 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8
 a=N54-gffFAAAA:8 a=_PSwHIibRqnCqDy-8GoA:9 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 10:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219864

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
---
 .../libarchive/libarchive/CVE-2025-5915.patch | 217 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
new file mode 100644
index 0000000000..3c911ce9d9
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
+index 4fafc41..9f3a6d1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -519,6 +519,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_read_format_rar_encryption_header.c \
+ 	libarchive/test/test_read_format_rar_filter.c \
+ 	libarchive/test/test_read_format_rar_invalid1.c \
++	libarchive/test/test_read_format_rar_overflow.c \
+ 	libarchive/test/test_read_format_rar5.c \
+ 	libarchive/test/test_read_format_raw.c \
+ 	libarchive/test/test_read_format_tar.c \
+@@ -889,6 +890,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_rar_multivolume.part0003.rar.uu \
+ 	libarchive/test/test_read_format_rar_multivolume.part0004.rar.uu \
+ 	libarchive/test/test_read_format_rar_noeof.rar.uu \
++	libarchive/test/test_read_format_rar_overflow.rar.uu \
+ 	libarchive/test/test_read_format_rar_ppmd_lzss_conversion.rar.uu \
+ 	libarchive/test/test_read_format_rar_ppmd_use_after_free.rar.uu \
+ 	libarchive/test/test_read_format_rar_ppmd_use_after_free2.rar.uu \
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 9eb3c84..88eab62 100644
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
+@@ -2929,7 +2929,7 @@ expand(struct archive_read *a, int64_t *end)
+     }
+ 
+     if ((symbol = read_next_symbol(a, &rar->maincode)) < 0)
+-      return (ARCHIVE_FATAL);
++      goto bad_data;
+ 
+     if (symbol < 256)
+     {
+@@ -2956,14 +2956,14 @@ expand(struct archive_read *a, int64_t *end)
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
+@@ -3048,7 +3048,7 @@ expand(struct archive_read *a, int64_t *end)
+           {
+             if ((lowoffsetsymbol =
+               read_next_symbol(a, &rar->lowoffsetcode)) < 0)
+-              return (ARCHIVE_FATAL);
++              goto bad_data;
+             if(lowoffsetsymbol == 16)
+             {
+               rar->numlowoffsetrepeats = 15;
+@@ -3096,7 +3096,7 @@ bad_data:
+ }
+ 
+ static int
+-copy_from_lzss_window(struct archive_read *a, void *buffer,
++copy_from_lzss_window(struct archive_read *a, uint8_t *buffer,
+                       int64_t startpos, int length)
+ {
+   int windowoffs, firstpart;
+@@ -3111,7 +3111,7 @@ copy_from_lzss_window(struct archive_read *a, void *buffer,
+   }
+   if (firstpart < length) {
+     memcpy(buffer, &rar->lzss.window[windowoffs], firstpart);
+-    memcpy(buffer, &rar->lzss.window[0], length - firstpart);
++    memcpy(buffer + firstpart, &rar->lzss.window[0], length - firstpart);
+   } else {
+     memcpy(buffer, &rar->lzss.window[windowoffs], length);
+   }
+@@ -3266,6 +3266,9 @@ parse_filter(struct archive_read *a, const uint8_t *bytes, uint16_t length, uint
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
+index 5d7a5d2..59c5f5d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -163,6 +163,7 @@ IF(ENABLE_TEST)
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index d5c950f9e0..c091508799 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
+           file://CVE-2025-5915.patch \
            "
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
-- 
2.40.0


