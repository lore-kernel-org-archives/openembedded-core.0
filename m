Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADF5CD4F35
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:14:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2671.1778660048319447184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QBS/tGn0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9593f74c6b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D42IFd258937
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=UBthMVZOqxxGVPDcLVXxOYKYWIPOdh/CKLMNp+5cPgM=; b=QBS/tGn0Em+u
	4w+ZZ9ckqnpv1IP5+JZWvXIN01ZFjktA/SEtVKAuQBDSwC03zufsnoNOKbnpbyED
	kfPOnmr3wQdMW/1Wm2P/4TxfbUhwB9jGj6Unqt3gurEMXOkCvHjYMXMY8pbLVbP+
	N3Ep8Qs7Wc2Gp7GqUajgvpP2pBIezy6SiPYYSgMv1MQvZvY3BVtz8eUwfh+dYuCg
	C2DTRrL1fn0LVbF65Bat1rs/KggGICmFoEY7Crk5BbZIS9Oae41fIYry2DwcBVm/
	qymu/+u1zOyK7/XVz4PK4z9Ch0yvpUnJvo5il6lPFccY6jmEY1ddW4CNtfPCvVK8
	4Wir+4nNTQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ft78dbb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 13 May 2026 01:14:05 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 13 May 2026 01:14:05 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/2] strace: upgrade 6.19 -> 7.0
Date: Wed, 13 May 2026 01:14:05 -0700
Message-ID: <19dc384322b778c446534c54666b60f0eb721827.1778659781.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1778659781.git.liezhi.yang@windriver.com>
References: <cover.1778659781.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2X4NXe6B9RmcWA-BOJTwjaEGAL1aziDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4MyBTYWx0ZWRfX50btyQ+buihd
 8lL+E00ohCw9QzOcVMAPLRbFD9lJXJUro0Dhnt6zqgqyNGN4qX2dbgnX0jUAGKKM70m2e/WO6k1
 RJc4Eel6Qs3QHa3UL/qs7J6C5fpxMT1yTZAhzJgb7H7Yvx8REXAPLfDf/hoi4Usg8Gp4of6EwB0
 9FMbAsVkD9GiCMqdhX8Tlb44Zw5VmuMhErBWWbU3r+7YvP/ngly688qRhVvbfXxHP/6660ODE0K
 qUKN8rfBBmnUX8AdOiyY46MxMaRpB9UmU3KKkbrRMKm3UKqg7tZP/9CrPsXgjhYoYKPV9CEtRyr
 M9aYtqFqyLNs92IcbhxNXED4aMwKXiMlraHYdw0nI5xQHXrEv4bporj00LmeQ1JZH5cTIyCOgfT
 37ADLP56LOTzNx2ynRmmQBfQZYj8dF7g0iy7Sho9XV/RLpnY+0FQNUPnMTeQz9xCq8s2fzWvjfJ
 xIUYnK1OIIaNZqejkbQ==
X-Proofpoint-GUID: 2X4NXe6B9RmcWA-BOJTwjaEGAL1aziDL
X-Authority-Analysis: v=2.4 cv=G6As1dk5 c=1 sm=1 tr=0 ts=6a0432cf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=5KEJ3k9QAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fk1lIlRQAAAA:8 a=Sv4y0yS6AAAA:8
 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=vFAE3Q5m1tp9og0FRgsA:9
 a=9D4HFVnPSN7_ompT:21 a=olg2BfGzmf2haRflzj8J:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=U75ogvRika4pmaD_UPO0:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236944

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |  4 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 +-
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-bpf.patch              | 25 +++++---
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.19.bb => strace_7.0.bb}  |  3 +-
 11 files changed, 91 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.0.bb} (96%)

diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
new file mode 100644
index 0000000000..d19533854c
--- /dev/null
+++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -0,0 +1,62 @@
+From 3c692ce22a70e9fa4cc21afa56d03a9adcd5d2a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 22:18:58 -0700
+Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
+
+musl uses wrappers for pwritev and pwrite64 using
+pwritev2 syscall [1], however the test exepcts that the
+program will call pwritev and pwrite64 ( glibc behavior )
+
+This can be fixed if the function calls are changed to
+use syscall() API directly, but that needs change upstream [2]
+
+Issue is reported upstream [3]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/src?id=5370070fded61b569196764673a4fc8440aac79e
+[2] https://github.com/strace/strace/pull/347
+[3] https://github.com/strace/strace/issues/349
+
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/pread64-pwrite64.gen.test | 3 +++
+ tests/preadv-pwritev.gen.test   | 3 +++
+ tests/pwritev.gen.test          | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.test
+index b53e069..0a1e6e6 100755
+--- a/tests/pread64-pwrite64.gen.test
++++ b/tests/pread64-pwrite64.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pwrite64 -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
+index 5ed8297..b83f129 100755
+--- a/tests/preadv-pwritev.gen.test
++++ b/tests/preadv-pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwritev -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
+diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
+index e54fd15..4999816 100755
+--- a/tests/pwritev.gen.test
++++ b/tests/pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a22 -s7); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a22 -s7
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 1750f34518..bda5156cdf 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
+From 36df82284b1e8c3d7338c315016a8e74c0978e32 Mon Sep 17 00:00:00 2001
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
index 68a1a4230a..920c2e4faf 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 00de0004bbb7c0816f9f899345971c148c9e59d9 Mon Sep 17 00:00:00 2001
+From dd821aebdefb3531202bcd51fce5e2bd74c1512d Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index c633531f44..77f90bf0d1 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
+From bb0cd804214054ef95193daa0b7076ed5be1c881 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index 093cedc233..7daf3f6763 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
+From 2d6384cd2b6b923ea3eb6863beb0bfaf6bf628c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 60562ae7d9..3d23e34244 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
+From 21747b62c36689b68fac7e987a9b93b998f692e3 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d76b5c6..d4fc206 100644
+index 7d80e07..1e0e064 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index d76b5c6..d4fc206 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
+@@ -950,3 +951,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 3e66b15850..14ad35be74 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
+From 0b3d278fa808a21d4300a71d062807f905671bf9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-bpf.patch b/meta/recipes-devtools/strace/strace/skip-bpf.patch
index b058b0ba03..1fa8c2db2d 100644
--- a/meta/recipes-devtools/strace/strace/skip-bpf.patch
+++ b/meta/recipes-devtools/strace/strace/skip-bpf.patch
@@ -1,22 +1,31 @@
+From 66edf5d44ba89f73d51657edeeb19fc10d008aea Mon Sep 17 00:00:00 2001
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
index 20535fe005..dc88706948 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
+From 7fc69711b5e216c385b22a5b64c6c7c8be693600 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index bf4a8cd123..c47ca08dd4 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
+From 6bc97ed4e26ca4d275c10f5b4f56fc43a8e12925 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_7.0.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.19.bb
rename to meta/recipes-devtools/strace/strace_7.0.bb
index 7b8d4851fb..1150cfda61 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_7.0.bb
@@ -20,10 +20,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143"
+SRC_URI[sha256sum] = "6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b3771b1b013ad074b"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".1"
 
 inherit autotools github-releases ptest
-- 
2.49.0


