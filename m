Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012ECC48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 09:01:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59243.1707123711768906105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 01:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YRiWCN0N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2765499117=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415902nM002870
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=k5wwWN3BzEE++bugw0vtY9Rk5D59UOgn6pC/HqrEGuo=; b=
	YRiWCN0NJ1GqkpnvAFv2AwINj32vCN9QqzdriLV/r7qOhEeJ2bX4CNtfWXgvpLGh
	7C8kiOGAaHeTBjGP2Yb/zZ/pVXYWsChObb2B2LGrxnOr949Hkmy0LbT+/R2T5NsB
	lBT5MFlV/a9ni9RnsPMoXXYYydb9dThqNGklkXGMXWkJcezBpDPvzHimtQPtEhxj
	fJACZSR1Cc+ZIYbLUYH9ymojOvxHmBKnE40lFPJKBCX4gcTX4TD7UXEJI2dIm2x3
	DpSxiDYnXsDHlbd29Lx1jXmOs6Y5jUfJnBI3dNdYq3mtbrCIC22PtTy8CWgTKVMO
	fA7EnztuCva0T+TDp1xxJg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs79m68-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:01:50 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 01:01:48 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 01:01:48 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] strace: Upgrade 6.6 -> 6.7
Date: Mon, 5 Feb 2024 01:01:48 -0800
Message-ID: <695e33cf6a340d2fd325adeea93cc4e98f2b5ace.1707123654.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707123654.git.liezhi.yang@windriver.com>
References: <cover.1707123654.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lBfiIcECWf_5NIC-7xb44QjpobItSu9Y
X-Proofpoint-GUID: lBfiIcECWf_5NIC-7xb44QjpobItSu9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402050068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194924

From: Robert Yang <liezhi.yang@windriver.com>

License-Update: copyright years updated.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...toconf-macro-to-detect-largefile-sup.patch |  7 +-
 ...001-strace-fix-reproducibilty-issues.patch | 10 ++-
 ...002-tests-Replace-off64_t-with-off_t.patch | 36 ++++++----
 .../strace/strace/Makefile-ptest.patch        |  8 +--
 .../strace/strace/ptest-spacesave.patch       |  6 +-
 .../strace/strace/skip-load.patch             |  8 ++-
 .../strace/strace/update-gawk-paths.patch     | 69 ++++++++++---------
 .../strace/{strace_6.6.bb => strace_6.7.bb}   |  4 +-
 8 files changed, 80 insertions(+), 68 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.6.bb => strace_6.7.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 76ca7a76a85..3b1a335eee4 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 470399f3636c412b74f9daf6ae430b13c3126f02 Mon Sep 17 00:00:00 2001
+From 50087af2c6a75eddc4a4be5ee745639f42406c05 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -8,15 +8,16 @@ where default is to detect the support
 
 Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4797b42dd..7d57fb254 100644
+index 36fff90..9e40ab5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -43,6 +43,8 @@ AC_PROG_INSTALL
+@@ -42,6 +42,8 @@ AC_PROG_INSTALL
  AC_PROG_RANLIB
  AC_PROG_LN_S
  
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index c4c176e6bcd..d6e2d61ab6e 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 6309792c49ca900cec6a7f1dc5b51bf75b629e11 Mon Sep 17 00:00:00 2001
+From be6b209e152329f9fd8c96c802577fa5b88edc30 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
@@ -8,12 +8,13 @@ The full path to the gen_tests.sh script is encoded in the tests
 Upstream-Status: Pending
 
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+
 ---
  tests/gen_tests.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 5e1e7c9..1e65eac 100755
+index 8f47651..65267db 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
 @@ -46,7 +46,7 @@ while read -r name arg0 args; do {
@@ -25,7 +26,7 @@ index 5e1e7c9..1e65eac 100755
  
  	case "$arg0" in
  		+*)
-@@ -80,7 +80,7 @@ while read -r name arg0 args; do {
+@@ -91,7 +91,7 @@ while read -r name arg0 args; do {
  
  if [ -n "$names" ]; then
  	{
@@ -34,6 +35,3 @@ index 5e1e7c9..1e65eac 100755
  		printf 'GEN_TESTS ='
  		printf ' %s.gen.test' $names
  		echo
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index 0cabdfe99f8..13a8738d338 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 579b2ebe52d4b97f954e6188df2d07e137820075 Mon Sep 17 00:00:00 2001
+From 75b1a21a1573e1c73f076c33847ccb1816071e2e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
@@ -8,11 +8,15 @@ build on musl where off64_t is not available without _LARGEFILE64_SOURCE
 
 Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  tests/readahead.c        | 2 +-
+ tests/sync_file_range.c  | 4 ++--
  tests/sync_file_range2.c | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ 3 files changed, 5 insertions(+), 5 deletions(-)
 
+diff --git a/tests/readahead.c b/tests/readahead.c
+index 1072378..b9597e6 100644
 --- a/tests/readahead.c
 +++ b/tests/readahead.c
 @@ -42,7 +42,7 @@ static const int fds[] = {
@@ -24,29 +28,33 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	-0x8000000000000000LL,
  	-0x5060708090a0b0c0LL,
  	-1LL,
---- a/tests/sync_file_range2.c
-+++ b/tests/sync_file_range2.c
+diff --git a/tests/sync_file_range.c b/tests/sync_file_range.c
+index e93ab6c..dc76865 100644
+--- a/tests/sync_file_range.c
++++ b/tests/sync_file_range.c
 @@ -20,8 +20,8 @@ int
  main(void)
  {
  	const int fd = -1;
--	const off64_t offset = 0xdeadbeefbadc0ded;
--	const off64_t nbytes = 0xfacefeedcafef00d;
-+	const off_t offset = 0xdeadbeefbadc0ded;
-+	const off_t nbytes = 0xfacefeedcafef00d;
+-	const off64_t offset = 0xdeadbeefbadc0dedULL;
+-	const off64_t nbytes = 0xfacefeedcafef00dULL;
++	const off_t offset = 0xdeadbeefbadc0dedULL;
++	const off_t nbytes = 0xfacefeedcafef00dULL;
  	const unsigned int flags = -1;
  
  	int rc = sync_file_range(fd, offset, nbytes, flags);
---- a/tests/sync_file_range.c
-+++ b/tests/sync_file_range.c
+diff --git a/tests/sync_file_range2.c b/tests/sync_file_range2.c
+index b8dc712..e4b003c 100644
+--- a/tests/sync_file_range2.c
++++ b/tests/sync_file_range2.c
 @@ -20,8 +20,8 @@ int
  main(void)
  {
  	const int fd = -1;
--	const off64_t offset = 0xdeadbeefbadc0dedULL;
--	const off64_t nbytes = 0xfacefeedcafef00dULL;
-+	const off_t offset = 0xdeadbeefbadc0dedULL;
-+	const off_t nbytes = 0xfacefeedcafef00dULL;
+-	const off64_t offset = 0xdeadbeefbadc0ded;
+-	const off64_t nbytes = 0xfacefeedcafef00d;
++	const off_t offset = 0xdeadbeefbadc0ded;
++	const off_t nbytes = 0xfacefeedcafef00d;
  	const unsigned int flags = -1;
  
  	int rc = sync_file_range(fd, offset, nbytes, flags);
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 9af77376626..9553ff29c6b 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 1f50e0a09d828be8f5b1f28db9af0b12492a1553 Mon Sep 17 00:00:00 2001
+From 5659a44a1d7c64a7891fb714b5cb0a899674c108 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -14,10 +14,10 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 55566ee..a7ae6f9 100644
+index 9059f80..a732566 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -16,6 +16,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+@@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
  MPERS_NAME =
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
@@ -25,7 +25,7 @@ index 55566ee..a7ae6f9 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -703,3 +704,22 @@ BUILT_SOURCES = ksysent.h
+@@ -887,3 +888,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 4e86ccadc5b..b813a9ca12d 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 3fad4821d90cd264d1b94253b9cf4fdf5d4034b8 Mon Sep 17 00:00:00 2001
+From 39211370e7facf24c673618c59e6c84718e42df6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
@@ -15,10 +15,10 @@ Upstream-Status: Inappropriate [specific to OE image space issues]
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 3540204..5e1e7c9 100755
+index ce1467e..8f47651 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -62,6 +62,7 @@ while read -r name arg0 args; do {
+@@ -73,6 +73,7 @@ while read -r name arg0 args; do {
  		$hdr
  		. "\${srcdir=.}/init.sh"
  		run_strace_match_diff $arg0 $args
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index b1acfda5d80..0ec70a3861c 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,3 +1,8 @@
+From f07694e7df838aa5ab7b05565729e793d6b08635 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 31 Jan 2022 17:40:13 +0000
+Subject: [PATCH] strace: skip a number of load-sensitive tests
+
 Skip tests which are known to be unreliable under load, typically because they
 care about timing.
 
@@ -44,6 +49,3 @@ index 8299737..d89c7df 100755
  
  r_opt="${1:--r}"
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index a16ede95c26..9792ab6ed2d 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 4cd26cfaec255ec87f22abe886e0be89312a9671 Mon Sep 17 00:00:00 2001
+From 265bb08cffcab8bf77daafa80335debd3c141c68 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
@@ -14,19 +14,22 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 
 ---
  src/mpers.awk               | 2 +-
+ tests-m32/caps-abbrev.awk   | 2 +-
  tests-m32/caps.awk          | 2 +-
  tests-m32/match.awk         | 2 +-
  tests-m32/rt_sigaction.awk  | 2 +-
+ tests-mx32/caps-abbrev.awk  | 2 +-
  tests-mx32/caps.awk         | 2 +-
  tests-mx32/match.awk        | 2 +-
  tests-mx32/rt_sigaction.awk | 2 +-
+ tests/caps-abbrev.awk       | 2 +-
  tests/caps.awk              | 2 +-
  tests/match.awk             | 2 +-
  tests/rt_sigaction.awk      | 2 +-
- 10 files changed, 10 insertions(+), 10 deletions(-)
+ 13 files changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/src/mpers.awk b/src/mpers.awk
-index 25a212f..b2ff53f 100644
+index 425ab65..33ece5c 100644
 --- a/src/mpers.awk
 +++ b/src/mpers.awk
 @@ -1,4 +1,4 @@
@@ -35,6 +38,16 @@ index 25a212f..b2ff53f 100644
  #
  # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
  # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@strace.io>
+diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
+index e8393fd..76c4e51 100644
+--- a/tests-m32/caps-abbrev.awk
++++ b/tests-m32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
 diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
 index 69500ec..e5dfd87 100644
 --- a/tests-m32/caps.awk
@@ -65,6 +78,16 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
+index e8393fd..76c4e51 100644
+--- a/tests-mx32/caps-abbrev.awk
++++ b/tests-mx32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
 diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
 index 69500ec..e5dfd87 100644
 --- a/tests-mx32/caps.awk
@@ -95,6 +118,16 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
+index e8393fd..76c4e51 100644
+--- a/tests/caps-abbrev.awk
++++ b/tests/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
 diff --git a/tests/caps.awk b/tests/caps.awk
 index 69500ec..e5dfd87 100644
 --- a/tests/caps.awk
@@ -125,33 +158,3 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
-diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests-m32/caps-abbrev.awk
-+++ b/tests-m32/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
-diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests-mx32/caps-abbrev.awk
-+++ b/tests-mx32/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
-diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests/caps-abbrev.awk
-+++ b/tests/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-devtools/strace/strace_6.7.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.6.bb
rename to meta/recipes-devtools/strace/strace_6.7.bb
index ed3033c8673..f365477ccd8 100644
--- a/meta/recipes-devtools/strace/strace_6.6.bb
+++ b/meta/recipes-devtools/strace/strace_6.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=63c8c3eb5c71b4362edac1397f40bdc7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2433d82e1432a76dc3eadd9002bfe304"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c"
+SRC_URI[sha256sum] = "2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7"
 
 inherit autotools ptest
 
-- 
2.43.0


