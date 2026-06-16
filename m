Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814F3CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:52:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.997.1781625116053866064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bEA+SJdz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06273c465f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFh5ah3689879
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ruvlivJXA2fmcFrdKn40KS7ZUDL8ANPm1dJXE5oFf7E=; b=bEA+SJdz6pOA
	JWG3ewHnwUvLiieyl+xXzR1vI0EE6zfN3zXIKTqxKtwqhkfDMRABmMQ3QfkXAe0R
	hRyRqIeB5qx4gV8XdznOz8PrSPt0jXSEJEMENDTnUX4txCbPtr+l9QbBSkk7sciz
	EAmWC7Xaj6P0vY9rU/Hj0Y2h/YIzHnJ5q8nOBqcoKnTci4PIhFk6hovOtzGZxArV
	+JbLtfFOi/CNA+9QW2R+L2ouKzfn6DNotU3uHMZdUo8Bs0pWFZDcKJRuZZMhgEGB
	9wAptvei05TlkrJ8mDd7CruvE66x67uYM6ITgqqixFgFgopEZP+98GrCw2UG7PSJ
	aq36FamT6g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eu0vs0r0a-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:51:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Jun 2026 08:51:53 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Jun 2026 08:51:53 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 2/2] strace: upgrade 5.19 -> 7.1
Date: Tue, 16 Jun 2026 08:51:52 -0700
Message-ID: <e0bd331774d63d49c173b88711ed04005048bcb0.1781624800.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1781624800.git.liezhi.yang@windriver.com>
References: <cover.1781624800.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IsIutr/g c=1 sm=1 tr=0 ts=6a31711a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=fzO0DoyAAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fk1lIlRQAAAA:8 a=Sv4y0yS6AAAA:8
 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=I5hwX05JCwDkP8j07PYA:9
 a=9D4HFVnPSN7_ompT:21 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22
 a=I7ze7AG8jwQKfjVvUIqj:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: NTFmOuglrbPjgS1HETKRTZq0L_1wn65N
X-Proofpoint-ORIG-GUID: NTFmOuglrbPjgS1HETKRTZq0L_1wn65N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2MiBTYWx0ZWRfX2lz/69zCX7GV
 YRUzJD1uNXlz9H3gj3JvSRDzQSNHm9SyiV/Li9UrrJjLcnsn+faFHEfx/JsPqdEPBODxt6dYXOM
 DUQdyf6umYaQnb/ZjPVtHfWzmCh4xOR9/rbDVbtDaPBoyxkmsDXhi9PS7pCin2D6IOLEefSmouY
 OUE4l3IA+ZlmiWz8Bp8W7IqvBUnUYdnyr6bsNJOsWR0oPZRyl02RStVmmdOi7R+C6o/4LTUHjUg
 UVR4M3F9kCWjGQUIu5vcw1vvONccFmo2W6bL5IH5OcQE4XGnSQKwyWGIb0FlKtqT20lpOnCiwZq
 RK6i0KOGE0O6VF+es3CKGa6HRV6KMx4LEv71zjah5SYKLNVGaW9xzACqM4qCF0ED8kJDmNG1+Pw
 rYpo25fLwWVwNUwQ+GANy/KlH8mI+z2eEbylf+Ho1LKy4sWJGn9A+6ZFzkdQy2NYCxFDsH7VWSC
 s3hqyCybB2/b5lwaeGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2MiBTYWx0ZWRfX3swdfPcqElXN
 x8vWDQ5bVjH8l+eeKWlG0kULFHl7EbqSf9EQyUQ4k+wPI9E1c/D+Kit/y6+EnRHX307CdyNsgM2
 y9yq0SWI73XQhiU7n4HD6Kb2TBspq6HG8phTRjVmr8rHm9jXpzWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238914

From: Robert Yang <liezhi.yang@windriver.com>

* Release notes:
  https://github.com/strace/strace/releases

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 16 ++++++++----
 ...toconf-macro-to-detect-largefile-sup.patch |  4 +--
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++---
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-bpf.patch              | 25 +++++++++++++------
 .../strace/strace/skip-load.patch             |  6 ++---
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.19.bb => strace_7.1.bb}  |  6 +----
 11 files changed, 42 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.1.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
index f21f68001f..3603cb7ad7 100644
--- a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
+++ b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -1,4 +1,4 @@
-From 13fd22ad0df5b80c428d3ecc0114fb340f3b3894 Mon Sep 17 00:00:00 2001
+From 42b04443d797345e4dc1f933017a66cd726a5c61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 18 Aug 2025 22:18:58 -0700
 Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
@@ -19,11 +19,13 @@ Issue is reported upstream [3]
 Upstream-Status: Inappropriate [Musl Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/pread64-pwrite64.gen.test | 2 ++
- tests/preadv-pwritev.gen.test   | 2 ++
- tests/pwritev.gen.test          | 2 ++
- 3 files changed, 6 insertions(+)
+ tests/pread64-pwrite64.gen.test | 3 +++
+ tests/preadv-pwritev.gen.test   | 3 +++
+ tests/pwritev.gen.test          | 3 +++
+ 3 files changed, 9 insertions(+)
 
+diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.test
+index b53e069..0a1e6e6 100755
 --- a/tests/pread64-pwrite64.gen.test
 +++ b/tests/pread64-pwrite64.gen.test
 @@ -1,4 +1,7 @@
@@ -34,6 +36,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +skip_ "Test not ported to musl, musl generates pwritev2"
 +
  run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
+index 5ed8297..b83f129 100755
 --- a/tests/preadv-pwritev.gen.test
 +++ b/tests/preadv-pwritev.gen.test
 @@ -1,4 +1,7 @@
@@ -44,6 +48,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +skip_ "Test not ported to musl, musl generates pwritev2"
 +
  run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
+diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
+index e54fd15..4999816 100755
 --- a/tests/pwritev.gen.test
 +++ b/tests/pwritev.gen.test
 @@ -1,4 +1,7 @@
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 1750f34518..49b3c3e599 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
+From 2d134e7c5a3b82e0b4c969285b1da0c3a113168b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ad12d20..a760789 100644
+index 956bb85..0812725 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,6 +43,8 @@ AC_PROG_INSTALL
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 68a1a4230a..97754404cd 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 00de0004bbb7c0816f9f899345971c148c9e59d9 Mon Sep 17 00:00:00 2001
+From dafd84d28d29d69ed0eb4c63b7365bf7831e42cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index c633531f44..a278ee52e1 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
+From 02b64b8f3ae6387cb1dadb442f554702ec47a454 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index 093cedc233..8f7f693914 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
+From 742340d4422aee46c2b05d6b301ddcb78e0c37fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 60562ae7d9..127cc615e4 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
+From 3043c6bfeeb55d56dfc9f1b8cbe7d01b8c2556e6 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d76b5c6..d4fc206 100644
+index f37d053..975f878 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index d76b5c6..d4fc206 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
+@@ -967,3 +968,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROGRAMS)
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 3e66b15850..e61c3524f8 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
+From 2d1ef82864f037b8dd029ae870ac0c2f1fd14321 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-bpf.patch b/meta/recipes-devtools/strace/strace/skip-bpf.patch
index b058b0ba03..44f34c0fca 100644
--- a/meta/recipes-devtools/strace/strace/skip-bpf.patch
+++ b/meta/recipes-devtools/strace/strace/skip-bpf.patch
@@ -1,22 +1,31 @@
+From b51fb304845674d3952e8420e641ccdaeab519c6 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 22 Dec 2025 12:14:45 +0000
+Subject: [PATCH] strace: Skip bpd tests for now since they don't work with the
+
 These tests failed when upgrading to 6.18. Skip them for now until the issue can be resolved
 as the upgrade is needed for newer kernel versons.
 
 Upstream-Status: Inappropriate [issue reported at https://github.com/strace/strace/issues/370]
+---
+ tests/bpf-v.gen.test | 1 +
+ tests/bpf.gen.test   | 1 +
+ 2 files changed, 2 insertions(+)
 
-Index: strace-6.16/tests/bpf-v.gen.test
-===================================================================
---- strace-6.16.orig/tests/bpf-v.gen.test
-+++ strace-6.16/tests/bpf-v.gen.test
+diff --git a/tests/bpf-v.gen.test b/tests/bpf-v.gen.test
+index e57154e..440ddfe 100755
+--- a/tests/bpf-v.gen.test
++++ b/tests/bpf-v.gen.test
 @@ -1,4 +1,5 @@
  #!/bin/sh -efu
  # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf-v -a20 -v -e trace=bpf); do not edit.
  . "${srcdir=.}/init.sh"
 +skip_ "Test doesn't work atm"
  run_strace_match_diff -a20 -v -e trace=bpf
-Index: strace-6.16/tests/bpf.gen.test
-===================================================================
---- strace-6.16.orig/tests/bpf.gen.test
-+++ strace-6.16/tests/bpf.gen.test
+diff --git a/tests/bpf.gen.test b/tests/bpf.gen.test
+index 1391d6b..c4906b1 100755
+--- a/tests/bpf.gen.test
++++ b/tests/bpf.gen.test
 @@ -1,4 +1,5 @@
  #!/bin/sh -efu
  # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf -a20 ); do not edit.
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 20535fe005..9a9c0789f4 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
+From 7948396c248863941e47431b3a0e0be225c1b601 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
@@ -49,7 +49,7 @@ index 41928de..f8a87cb 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -a20 
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 8299737..e894234 100755
+index a85558d..9ae9677 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
 @@ -9,6 +9,7 @@
@@ -59,4 +59,4 @@ index 8299737..e894234 100755
 +skip_ "Test not reliable under load"
  r_opt="${1:--r}"
  
- run_prog ../sleep 0
+ run_prog ../sleep-timing 0 "$TIMING_FILE"
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index bf4a8cd123..c691bb63a3 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
+From aeefba8a6a7822fb30fcc07f86a96813a28f2bf9 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_7.1.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.19.bb
rename to meta/recipes-devtools/strace/strace_7.1.bb
index b92bfc4f31..177a615c49 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_7.1.bb
@@ -20,16 +20,12 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143"
+SRC_URI[sha256sum] = "81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f"
 
 # To help "devtool finish" can add 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 # into strace/strace rather than strace/files.
 FILESPATH .= ":${FILE_DIRNAME}/${BPN}"
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 inherit autotools github-releases ptest
 
 # Not yet ported to rv32
-- 
2.49.0


