Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B75C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:50:39 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9382.1706766631975963236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OnCgXnPb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706766631; x=1738302631;
  h=from:to:cc:subject:date:message-id;
  bh=T+0vlnsgwq7jopO9DzaQHR/xYocE8guI++5XUu2kCPQ=;
  b=OnCgXnPbjBPFOmiT8h692TOCatyg2hGzstUCUfYVKZLSlV0Gnw0L3RaK
   8Dl7ZQFQ4Ye9sEwVzd3NvOYiKdfaTDhHCQNoLWuvA9H6apsbziMt3L7f/
   +776Z5nWgb24o9hXiB5XYofWtoVpfNjCx2iS4PaODDVVzGPnVUpkCOGVm
   pE9dUYw6cGaWThVlrB1ZCwOklTddG7oCJNWDr+W4PfRQSFkSnhmO61N49
   NKUch+hp5PgV+zHQGhBKvPaL8ATM3+hJE8dBb/K6d6Q+mQQ1Asrki7175
   RwCBHfHbDZvY0cDzSxp3jP6719lx74nxXRTGIucGnVWoiDuZC/Ts9Nzay
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="136449970"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="136449970"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:50:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E966178742
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:50:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 561661D4544
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:50:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CAB3D6C9D8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:50:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4402E1A006A;
	Thu,  1 Feb 2024 13:50:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 6.6 -> 6.7
Date: Thu,  1 Feb 2024 13:49:29 +0800
Message-Id: <1706766569-13110-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10--12.042300-10.000000
X-TMASE-MatchedRID: uhFBvrq0w1ajz0nOeth/yXg2y0j5vXZGK2GKtdiFmTlXGTbsQqHbknw6
	H06bMgivbyKrttEBrTSvnV8pOx/HNxZBX4eaTpnna87CDXaKRVJZ+CK+BxQ9k2WKhd+if2/Gy9Q
	FF82C/4JTdfFcLp9z2gMkm9lUG0hs0nl1nsNjR7jece0aRiX9WkyQ5fRSh265YA3qL69rXq7TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDZVRzPxemJL0mZiw53dqSN80VxbuzzsaAGNok
	eyvFnLMfBnw4TEwb3JQ2WjTkQz8s6hcbBawps00LTHwnYOikQ2IrmqDVyayvzzNRqQN9SIrEUS3
	3ulD4Lz6Ss9HyBHBXuD0amSkvbNFKgDmz5EUYuUJGwniUXM+M7SgyqRj33XJidW8QlIv67Y5lRs
	DF8jLUrieuMUwltffsgckRp0LGirkLvvM/f6v5azGfgakLdjakXXItSplgeZIMUkMc0iwGx1WI+
	unqp55KG91ZdPGLBahvUMoIXnjgU7x8xnBqoiCngIgpj8eDcCbifj2/J/1cdAFDxIFTMxfOAawE
	8JvIaLfd+P6wwCt84RtqopBKUBlX0VtNlIaagug2DVn+0img/NJJtnBFJ64WA3TYh0zj5gzVRDw
	BJgEiw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194576

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
0001-strace-fix-reproducibilty-issues.patch
0002-tests-Replace-off64_t-with-off_t.patch
Makefile-ptest.patch
ptest-spacesave.patch
update-gawk-paths.patch
refreshed for 6.7.

Changelog:
============
* Improvements
  * Implemented -kk/--stack-traces=source option for libdw-based stack tracing.
  * Implemented decoding of futex_wake, futex_wait, and sys_futex_requeue
    syscalls.
  * Updated lists of BPF_*, BTRFS_*, IORING_*, KVM_*, LANDLOCK_*, PR_*,
    and TCP_* constants.
  * Updated lists of ioctl commands from Linux 6.7.

* Bug fixes
  * Fix strace -r during the first second after booting to show correct relative
    timestamps.
  * Fix strace -f entering deadlock on exit if there are tracee processes
    spawned using vfork semantics.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...toconf-macro-to-detect-largefile-sup.patch |  7 +-
 ...001-strace-fix-reproducibilty-issues.patch | 10 ++-
 ...002-tests-Replace-off64_t-with-off_t.patch | 36 ++++++----
 .../strace/strace/Makefile-ptest.patch        |  8 +--
 .../strace/strace/ptest-spacesave.patch       |  6 +-
 .../strace/strace/update-gawk-paths.patch     | 69 ++++++++++---------
 .../strace/{strace_6.6.bb => strace_6.7.bb}   |  4 +-
 7 files changed, 75 insertions(+), 65 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.6.bb => strace_6.7.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 76ca7a76a8..cb9dc11ee7 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 470399f3636c412b74f9daf6ae430b13c3126f02 Mon Sep 17 00:00:00 2001
+From abfd130ad939a387247515d9000f6982e11d82e9 Mon Sep 17 00:00:00 2001
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
index c4c176e6bc..9daeaceb0f 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 6309792c49ca900cec6a7f1dc5b51bf75b629e11 Mon Sep 17 00:00:00 2001
+From 8482f1a149bd6f1d6b5ec80f6a206ab0dd73848a Mon Sep 17 00:00:00 2001
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
index 0cabdfe99f..34f06c17ab 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 579b2ebe52d4b97f954e6188df2d07e137820075 Mon Sep 17 00:00:00 2001
+From 51304fa04cafec3a4d2f6f1fddf03aedb6257bda Mon Sep 17 00:00:00 2001
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
index 9af7737662..bfe14b7f33 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 1f50e0a09d828be8f5b1f28db9af0b12492a1553 Mon Sep 17 00:00:00 2001
+From f35dac4f3d3a7df73e1c77d7f665497ecdc60b47 Mon Sep 17 00:00:00 2001
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
index 4e86ccadc5..b5cf579724 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 3fad4821d90cd264d1b94253b9cf4fdf5d4034b8 Mon Sep 17 00:00:00 2001
+From 8b4d63fd9705f3aea0232255c11f1125e4076e5a Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index a16ede95c2..cdd6fc6e3b 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 4cd26cfaec255ec87f22abe886e0be89312a9671 Mon Sep 17 00:00:00 2001
+From 0082413d2bf59f8837a634fc01f379ac74e193a5 Mon Sep 17 00:00:00 2001
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
index ed3033c867..f365477ccd 100644
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
2.34.1


