Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F5C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 01:39:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.105864.1738633172918144455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 17:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4130ac9f02=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141GuLj008827;
	Mon, 3 Feb 2025 17:39:28 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hm0pt4dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Feb 2025 17:39:27 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 3 Feb 2025 17:39:26 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Mon, 3 Feb 2025 17:39:26 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <raj.khem@gmail.com>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 1/3] valgrind: update 3.23.0 -> 3.24.0 (ptest fails, vg_regtest needs rebase)
Date: Mon, 3 Feb 2025 20:39:23 -0500
Message-ID: <20250204013925.2005184-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PqlpbxM3 c=1 sm=1 tr=0 ts=67a16fcf cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=3fyaaF4VAAAA:8 a=FP58Ms26AAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Sv4y0yS6AAAA:8
 a=6ohNodAXAAAA:8 a=QyXUC8HyAAAA:8 a=cY8ZZXUfMeaVYlE8G-sA:9 a=tHaGDqhDiXdT65Qk:21 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=0gLUg1G2xj6MhZ7RLP3J:22
X-Proofpoint-ORIG-GUID: EN1qFp6rznmOMg4ANfK6S1BtY0t7mJ3w
X-Proofpoint-GUID: EN1qFp6rznmOMg4ANfK6S1BtY0t7mJ3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 01:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210746

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rn-a-valid-exit_code-from-vg_regtest.patch |  22 --
 ...e-Drop-setting-mcpu-cortex-a8-on-arm.patch |   7 +-
 .../0001-docs-Disable-manual-validation.patch |   6 +-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |  15 +-
 ...check-tests-Fix-timerfd-syscall-test.patch |  24 +-
 ...-vgtests-remove-fullpath-after-flags.patch |   9 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |   7 +-
 ...ame-_sifields-to-__si_fields-on-musl.patch |   9 +-
 .../0001-tests-arm-Use-O-instead-of-O0.patch  |  10 +-
 ...-filter_xml_frames-do-not-filter-usr.patch |   9 +-
 ...-include-directive-path-for-config.h.patch |   9 +-
 ...est-wrapper-to-support-PTEST-formats.patch | 257 ------------------
 ...t-for-PPC-instructions-mfatbu-mfatbl.patch |  23 +-
 ...n-for-targets-which-don-t-support-it.patch |   5 +-
 .../valgrind/valgrind/fixed-perl-path.patch   |   5 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |   8 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |   6 +-
 ...-ld-XXX.so-strlen-intercept-optional.patch |   6 +-
 ...{valgrind_3.23.0.bb => valgrind_3.24.0.bb} |   4 +-
 19 files changed, 81 insertions(+), 360 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.23.0.bb => valgrind_3.24.0.bb} (97%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
deleted file mode 100644
index 832a1c3d6e..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 5eebdefd2251803e7d21081745018fcb16b2ba71 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Wed, 8 May 2019 20:16:52 -0400
-Subject: [PATCH] Return a valid exit_code from vg_regtest
-
-Upstream-Status: Pending
-
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- tests/vg_regtest.in | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/tests/vg_regtest.in
-+++ b/tests/vg_regtest.in
-@@ -401,6 +401,7 @@ sub mysystem($)
-             exit 1;
-         }
-     }
-+    return $exit_code;
- }
- # if $keepunfiltered, copies $1 to $1.unfiltered.out
- # renames $0 tp $1
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
index 63a1a58c04..4ee5288336 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From b17b6d7d3a65c14f91f090f3f4f9898d6fa3a9e4 Mon Sep 17 00:00:00 2001
+From 26a3367fbbab2a664a288f4ff8ef3273ebe57124 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 16:27:34 -0700
 Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 39d8b6d..d61b3a6 100755
+index 095659a..75d42c9 100755
 --- a/configure.ac
 +++ b/configure.ac
 @@ -275,13 +275,13 @@ case "${host_cpu}" in
@@ -35,6 +35,3 @@ index 39d8b6d..d61b3a6 100755
          ARCH_MAX="arm"
          ;;
  
--- 
-2.45.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index eba569c884..df6f77cba4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 99fc6fe9b66becac3c94068129e84217330a71a6 Mon Sep 17 00:00:00 2001
+From 7fa34af750f113fd600cabcecb79e65b9d04fa15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -18,9 +18,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  docs/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/docs/Makefile.am b/docs/Makefile.am
+index 6859ee8..d5e4e2f 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -194,7 +194,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -195,7 +195,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  touch $@; \
  	fi
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index 7996fa6e8f..ef65edfb76 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From 715cf122388f3527afa5649cebf9f1522c240693 Mon Sep 17 00:00:00 2001
+From a9292f711375c12c5135b207698e623e297b049b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Apr 2017 10:11:16 -0700
 Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
@@ -14,14 +14,15 @@ Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile.all.am            |  6 +++---
  helgrind/tests/Makefile.am |  6 +++---
  none/tests/arm/Makefile.am | 18 +++++++++---------
- 3 files changed, 15 insertions(+), 15 deletions(-)
+ 2 files changed, 12 insertions(+), 12 deletions(-)
 
+diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
+index d7101ed..670c29f 100755
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -223,9 +223,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+@@ -226,9 +226,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
  endif
  
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
@@ -34,9 +35,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  else
  annotate_hbefore_CFLAGS = $(AM_CFLAGS)
  tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
+diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
+index 41a5a03..a76981e 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -56,10 +56,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_N
+@@ -56,10 +56,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # need special helping w.r.t -mfpu and -mfloat-abi, though.
  # Also force -O0 since -O takes hundreds of MB of memory 
  # for v6intThumb.c.
@@ -50,7 +53,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm -march=armv8-a
  v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb -march=armv8-a
-@@ -74,23 +74,23 @@ v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0
+@@ -74,23 +74,23 @@ v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
  
  vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mfpu=neon
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
index 29a9e95a90..fe652ccdb4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 5d411fd147d652e9d7bb259f4048693c6e4742aa Mon Sep 17 00:00:00 2001
+From ddf3ac832d85bd9a1266c52ff3ae5ec88c4114db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -10,14 +10,16 @@ have the implementation or syscall is not defined
 Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36943897/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- config.h.in                            |  9 +++++++++
- configure.ac                           |  3 +++
- memcheck/tests/linux/timerfd-syscall.c | 10 ++++++++--
- 5 files changed, 32 insertions(+), 2 deletions(-)
+ config.h.in                            |  3 +++
+ configure.ac                           |  1 +
+ memcheck/tests/linux/timerfd-syscall.c | 14 +++++++++++---
+ 3 files changed, 15 insertions(+), 3 deletions(-)
 
+diff --git a/config.h.in b/config.h.in
+index d2e8b26..f235dec 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -424,6 +424,9 @@
+@@ -406,6 +406,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -27,9 +29,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* Define to 1 if you have the <sys/time.h> header file. */
  #undef HAVE_SYS_TIME_H
  
+diff --git a/configure.ac b/configure.ac
+index 75d42c9..b6ec119 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4881,6 +4881,7 @@ AC_CHECK_HEADERS([       \
+@@ -4844,6 +4844,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
@@ -37,6 +41,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          sys/types.h      \
          ])
  
+diff --git a/memcheck/tests/linux/timerfd-syscall.c b/memcheck/tests/linux/timerfd-syscall.c
+index 61d75b5..1ba888a 100644
 --- a/memcheck/tests/linux/timerfd-syscall.c
 +++ b/memcheck/tests/linux/timerfd-syscall.c
 @@ -42,6 +42,9 @@
@@ -80,7 +86,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Definitions from include/linux/timerfd.h */
-@@ -124,6 +130,7 @@ void set_timespec(struct timespec *tmr,
+@@ -124,6 +130,7 @@ void set_timespec(struct timespec *tmr, unsigned long long ustime)
    tmr->tv_nsec = (long) (1000ULL * (ustime % 1000000ULL));
  }
  
@@ -88,7 +94,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int timerfd_create(int clockid, int flags)
  {
    return syscall(__NR_timerfd_create, clockid, flags);
-@@ -139,6 +146,7 @@ int timerfd_gettime(int ufc, struct itim
+@@ -139,6 +146,7 @@ int timerfd_gettime(int ufc, struct itimerspec *otmr)
  {
    return syscall(__NR_timerfd_gettime, ufc, otmr);
  }
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index dce8b52ba3..bb32fa0bda 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From 3ff82dcb844f98dbf67c69f11f6516bc234725a9 Mon Sep 17 00:00:00 2001
+From f5c0021a016116c53d21d8d5902ea92e682658b6 Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
@@ -20,7 +20,7 @@ Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/memcheck/tests/badfree3.vgtest b/memcheck/tests/badfree3.vgtest
-index 3dfc5fd8a..4ee03f00a 100644
+index 3dfc5fd..4ee03f0 100644
 --- a/memcheck/tests/badfree3.vgtest
 +++ b/memcheck/tests/badfree3.vgtest
 @@ -1,3 +1,3 @@
@@ -29,7 +29,7 @@ index 3dfc5fd8a..4ee03f00a 100644
 +vgopts: -q
  stderr_filter_args: badfree.c
 diff --git a/memcheck/tests/varinfo5.vgtest b/memcheck/tests/varinfo5.vgtest
-index 063d00dce..79c4a72a4 100644
+index 063d00d..79c4a72 100644
 --- a/memcheck/tests/varinfo5.vgtest
 +++ b/memcheck/tests/varinfo5.vgtest
 @@ -1,3 +1,3 @@
@@ -37,6 +37,3 @@ index 063d00dce..79c4a72a4 100644
 -vgopts: --fullpath-after=memcheck/  --fullpath-after=coregrind/ --read-var-info=yes --read-inline-info=yes -q
 +vgopts: --read-var-info=yes --read-inline-info=yes -q
  stderr_filter: filter_varinfo3
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index e421ac6c80..10e7d71622 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
+From 4c27b9259f4aa1b4dc0741c56ab90b6c57905564 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
-index 6e5a797b9..0ede1ab18 100644
+index 0fe56ea..5a0605e 100644
 --- a/none/tests/fdleak_cmsg.stderr.exp
 +++ b/none/tests/fdleak_cmsg.stderr.exp
 @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
@@ -29,6 +29,3 @@ index 6e5a797b9..0ede1ab18 100644
     ...
  
  Open AF_UNIX socket ...: <unknown>
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index 27366153f7..1f2cce1a55 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,7 +1,7 @@
-From 64ad2744acfb4fa40b1c114633a053f87125a203 Mon Sep 17 00:00:00 2001
+From 4dddd9e533847f07327cde9a062fc7cbba9d5584 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
-Subject: [PATCH 1/6] sigqueue: Rename _sifields to __si_fields on musl
+Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/memcheck/tests/linux/sigqueue.c b/memcheck/tests/linux/sigqueue.c
-index d18bd72..acb7cba 100644
+index 4b6fb0f..d37fe93 100644
 --- a/memcheck/tests/linux/sigqueue.c
 +++ b/memcheck/tests/linux/sigqueue.c
 @@ -8,6 +8,11 @@
@@ -26,6 +26,3 @@ index d18bd72..acb7cba 100644
  int main(int argc, char **argv)
  {
    siginfo_t *si;
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
index 2d28bcb6c4..a5afc78b07 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -1,4 +1,4 @@
-From 8e907753625faba3284925983ef8e83f8491aa76 Mon Sep 17 00:00:00 2001
+From 0fba6bce02108b355a291f7dcb9497d0c7291e6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 17:44:47 -0700
 Subject: [PATCH] tests/arm: Use -O instead of -O0
@@ -15,12 +15,14 @@ we have enough of it on build host.
 Upstream-Status: Inappropriate [WORKAROUND]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- none/tests/arm/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ none/tests/arm/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
+index a76981e..a198f73 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -57,9 +57,9 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_N
+@@ -57,9 +57,9 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # Also force -O0 since -O takes hundreds of MB of memory 
  # for v6intThumb.c.
  v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -marm
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index bf0f0ded21..974c1a2362 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,7 +1,7 @@
-From d1dea3c2bcf1e22baab39e2c0b8ca59db8a5bc37 Mon Sep 17 00:00:00 2001
+From a7437450577c324d6f85a6e9d7b61be76555d49a Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
-Subject: [PATCH 1/2] valgrind: filter_xml_frames: do not filter /usr
+Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
 
 filter_xml_frames is intended to filter system paths under
 '/usr' that vary from platform to platform. In the ptest case
@@ -21,7 +21,7 @@ Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tests/filter_xml_frames b/tests/filter_xml_frames
-index f1fa3f070..04fbc82de 100755
+index f1fa3f0..04fbc82 100755
 --- a/tests/filter_xml_frames
 +++ b/tests/filter_xml_frames
 @@ -47,7 +47,8 @@ while (my $line = <>)
@@ -34,6 +34,3 @@ index f1fa3f070..04fbc82de 100755
      }
  }
  
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index c2965c40df..21725f3d3c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,7 +1,7 @@
-From ecbdea7bd8b08205f1bc3f6b72d4b4a80f313fcb Mon Sep 17 00:00:00 2001
+From fbddd889e2fbc1195009d8947211b8900c03c641 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
-Subject: [PATCH 3/6] correct include directive path for config.h
+Subject: [PATCH] correct include directive path for config.h
 
 when building out of source tree, it can not find
 the generated config.h otherwise
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/memcheck/tests/linux/syscalls-2007.c b/memcheck/tests/linux/syscalls-2007.c
-index b61c6d5..cc3fd62 100644
+index b91df82..c15c3eb 100644
 --- a/memcheck/tests/linux/syscalls-2007.c
 +++ b/memcheck/tests/linux/syscalls-2007.c
 @@ -10,7 +10,7 @@
@@ -40,6 +40,3 @@ index 1143722..21e758b 100644
  #include <stdio.h>
  #if defined(HAVE_SYS_KLOG_H)
  #include <sys/klog.h>
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
deleted file mode 100644
index fea3b00f62..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From e244a72c6f8803550f37e81f72bbae039651013b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 15 Dec 2015 15:50:44 +0200
-Subject: [PATCH] Modify vg_test wrapper to support PTEST formats
-
-Change the valgrind regression test script vg_regtest to
-support the yocto ptest stdout reporting format.  The commit adds
-'--yocto-ptest' as an optional argument to vg_regtest, which alters
-the output to use the ptest infrastructure reporting format:
-    "[PASS|SKIP|FAIL]: testname"
-instead of valgrind's internal test reporting format.  Without the added
-option, --yocto-ptest, the valgrind regression test output is unchanged.
-
-Enforce 30 seconds limit for the test.
-This resume execution of the remaining tests when valgrind hangs.
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
-Increase time limit to 90 s.
-(double of the expected time of drd/tests/std_list on qemuarm64)
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++------------
- 1 file changed, 55 insertions(+), 20 deletions(-)
-
-diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index ad18800..e4bd8cb 100755
---- a/tests/vg_regtest.in
-+++ b/tests/vg_regtest.in
-@@ -47,6 +47,7 @@
- #   --loop-till-fail: loops on the test(s) till one fail, then exit
- #              This is useful to obtain detailed trace or --keep-unfiltered
- #              output of a non deterministic test failure
-+#   --yocto-ptest: output in yocto ptest format
- #
- # The easiest way is to run all tests in valgrind/ with (assuming you installed
- # in $PREFIX):
-@@ -139,7 +140,7 @@ my $usage="\n"
-      . "Usage:\n"
-      . "   vg_regtest [--all, --valgrind, --valgrind-lib, --keep-unfiltered\n"
-      . "                 --outer-valgrind, --outer-tool, --outer-args\n"
--     . "                 --loop-till-fail]\n"
-+     . "                 --loop-till-fail, --yocto-ptest]\n"
-      . "   Use EXTRA_REGTEST_OPTS to supply extra args for all tests\n"
-      . "\n";
- 
-@@ -187,6 +188,7 @@ my $run_outer_args = "";
- my $valgrind_lib = "$tests_dir/.in_place";
- my $keepunfiltered = 0;
- my $looptillfail = 0;
-+my $yoctoptest = 0;
- 
- # default filter is the one named "filter_stderr" in the test's directory
- my $default_stderr_filter = "filter_stderr";
-@@ -245,6 +247,8 @@ sub process_command_line()
-                 $keepunfiltered = 1;
-             } elsif ($arg =~ /^--loop-till-fail$/) {
-                 $looptillfail = 1;
-+            } elsif ($arg =~ /^--yocto-ptest$/) {
-+                $yoctoptest = 1;
-             } else {
-                 die $usage;
-             }
-@@ -376,13 +380,28 @@ sub read_vgtest_file($)
- #----------------------------------------------------------------------------
- # Since most of the program time is spent in system() calls, need this to
- # propagate a Ctrl-C enabling us to quit.
--sub mysystem($) 
-+# Enforce 90 seconds limit for the test.
-+# This resume execution of the remaining tests if valgrind hangs.
-+sub mysystem($)
- {
--    my $exit_code = system($_[0]);
--    ($exit_code == 2) and exit 1;      # 2 is SIGINT
--    return $exit_code;
-+    my $exit_code=0;
-+    eval {
-+        local $SIG{'ALRM'} = sub { die "timed out\n" };
-+        alarm(90);
-+        $exit_code = system($_[0]);
-+        alarm (0);
-+        ($exit_code == 2) and die "SIGINT\n";   # 2 is SIGINT
-+    };
-+    if ($@) {
-+        if ($@ eq "timed out\n") {
-+            print "timed out\n";
-+            return 1;
-+        }
-+        if ($@ eq "SIGINT\n") {
-+            exit 1;
-+        }
-+    }
- }
--
- # if $keepunfiltered, copies $1 to $1.unfiltered.out
- # renames $0 tp $1
- sub filtered_rename($$) 
-@@ -430,23 +449,25 @@ sub do_diffs($$$$)
-                 # A match;  remove .out and any previously created .diff files.
-                 unlink("$name.$mid.out");
-                 unlink(<$name.$mid.diff*>);
--                return;
-+                return 0;
-             }
-         }
-     }
-     # If we reach here, none of the .exp files matched.
--    print "*** $name failed ($mid) ***\n";
-+    print "*** $name failed ($mid) ***\n" if ($yoctoptest == 0) ;
-     push(@failures, sprintf("%-40s ($mid)", "$fullname"));
-     $num_failures{$mid}++;
-     if ($looptillfail == 1) {
-        print "Failure encountered, stopping to loop\n";
-        exit 1
-     }
-+    return 1;
- }
- 
- sub do_one_test($$) 
- {
-     my ($dir, $vgtest) = @_;
-+    my $diffStatus = 0;
-     $vgtest =~ /^(.*)\.vgtest/;
-     my $name = $1;
-     my $fullname = "$dir/$name"; 
-@@ -465,7 +486,11 @@ sub do_one_test($$)
-         } elsif (256 == $prereq_res) {
-             # Nb: weird Perl-ism -- exit code of '1' is seen by Perl as 256...
-             # Prereq failed, skip.
--            printf("%-16s (skipping, prereq failed: $prereq)\n", "$name:");
-+            if ($yoctoptest == 0) {
-+                printf("%-16s (skipping, prereq failed: $prereq)\n", "$name:");
-+            } else {
-+                printf("SKIP: $fullname\n");
-+            }
-             return;
-         } else {
-             # Bad prereq; abort.
-@@ -483,7 +508,7 @@ sub do_one_test($$)
-         }
-         # If there is a progB, let's start it in background:
-         printf("%-16s valgrind $extraopts $vgopts $prog $args (progB: $progB $argsB)\n",
--               "$name:");
-+               "$name:") if ($yoctoptest == 0);
-         # progB.done used to detect child has finished. See below.
-         # Note: redirection of stdout and stderr is before $progB to allow argsB
-         # to e.g. redirect stdoutB to stderrB
-@@ -499,7 +524,8 @@ sub do_one_test($$)
-                      . "touch progB.done)  &");
-         }
-     } else {
--        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:");
-+        printf("%-16s valgrind $extraopts $vgopts $prog $args\n", "$name:")
-+            if ($yoctoptest == 0);
-     }
- 
-     # Collect environment variables, if any.
-@@ -540,7 +566,7 @@ sub do_one_test($$)
-     # Find all the .stdout.exp files.  If none, use /dev/null.
-     my @stdout_exps = <$name.stdout.exp*>;
-     @stdout_exps = ( "/dev/null" ) if (0 == scalar @stdout_exps);
--    do_diffs($fullname, $name, "stdout", \@stdout_exps); 
-+    $diffStatus |= do_diffs($fullname, $name, "stdout", \@stdout_exps);
- 
-     # Filter stderr
-     $stderr_filter_args = $name if (! defined $stderr_filter_args);
-@@ -549,7 +575,7 @@ sub do_one_test($$)
-     # Find all the .stderr.exp files.  At least one must exist.
-     my @stderr_exps = <$name.stderr.exp*>;
-     (0 != scalar @stderr_exps) or die "Could not find `$name.stderr.exp*'\n";
--    do_diffs($fullname, $name, "stderr", \@stderr_exps); 
-+    $diffStatus |= do_diffs($fullname, $name, "stderr", \@stderr_exps);
- 
-     if (defined $progB) {
-         # wait for the child to be finished
-@@ -573,7 +599,7 @@ sub do_one_test($$)
-         # Find all the .stdoutB.exp files.  If none, use /dev/null.
-         my @stdoutB_exps = <$name.stdoutB.exp*>;
-         @stdoutB_exps = ( "/dev/null" ) if (0 == scalar @stdoutB_exps);
--        do_diffs($fullname, $name, "stdoutB", \@stdoutB_exps); 
-+        $diffStatus |= do_diffs($fullname, $name, "stdoutB", \@stdoutB_exps);
-         
-         # Filter stderr
-         $stderrB_filter_args = $name if (! defined $stderrB_filter_args);
-@@ -582,7 +608,7 @@ sub do_one_test($$)
-         # Find all the .stderrB.exp files.  At least one must exist.
-         my @stderrB_exps = <$name.stderrB.exp*>;
-         (0 != scalar @stderrB_exps) or die "Could not find `$name.stderrB.exp*'\n";
--        do_diffs($fullname, $name, "stderrB", \@stderrB_exps); 
-+        $diffStatus |= do_diffs($fullname, $name, "stderrB", \@stderrB_exps);
-     }
- 
-     # Maybe do post-test check
-@@ -594,7 +620,7 @@ sub do_one_test($$)
- 	    # Find all the .post.exp files.  If none, use /dev/null.
- 	    my @post_exps = <$name.post.exp*>;
- 	    @post_exps = ( "/dev/null" ) if (0 == scalar @post_exps);
--	    do_diffs($fullname, $name, "post", \@post_exps);
-+	    $diffStatus |= do_diffs($fullname, $name, "post", \@post_exps);
- 	}
-     }
-  
-@@ -603,6 +629,13 @@ sub do_one_test($$)
-             print("(cleanup operation failed: $cleanup)\n");
-     }
- 
-+    if ($yoctoptest == 1) {
-+        if ($diffStatus == 0) {
-+            print("PASS: $fullname\n");
-+        } else {
-+            print("FAIL: $fullname\n");
-+        }
-+    }
-     $num_tests_done++;
- }
- 
-@@ -643,7 +676,7 @@ sub test_one_dir($$)
- 
-     my $tests_start_time = time;
-     if ($found_tests) {
--        print "-- Running  tests in $full_dir $dashes\n";
-+        print "-- Running  tests in $full_dir $dashes\n" if ($yoctoptest == 0);
-     }
-     foreach my $f (@fs) {
-         if (-d $f) {
-@@ -657,7 +690,7 @@ sub test_one_dir($$)
-         my $end_time = "(in $tests_cost_time sec)";
-         my $end_dashes = "-" x (50 - (length $full_dir)
-                                    - (length $end_time) - 1);
--        print "-- Finished tests in $full_dir $end_time $end_dashes\n";
-+        print "-- Finished tests in $full_dir $dashes\n" if ($yoctoptest == 0);
-     }
- 
-     chdir("..");
-@@ -683,10 +716,12 @@ sub summarise_results
-            $num_failures{"stdout"},   plural($num_failures{"stdout"}),
-            $num_failures{"stderrB"},  plural($num_failures{"stderrB"}),
-            $num_failures{"stdoutB"},  plural($num_failures{"stdoutB"}),
--           $num_failures{"post"},     plural($num_failures{"post"}));
-+           $num_failures{"post"},     plural($num_failures{"post"}))
-+               if ($yoctoptest == 0);
- 
-     foreach my $failure (@failures) {
--        print "$failure\n";
-+        print "$failure\n"
-+           if ($yoctoptest == 0);
-     }
-     print "\n";
- }
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 65de427d36..24b9edbccf 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 0bf4b0ac18d1ea41b32ad781d214b295ca1998f3 Mon Sep 17 00:00:00 2001
+From 6e914403985f3f094e318b06ee206f7df16215cf Mon Sep 17 00:00:00 2001
 From: Aneesh Bansal <aneesh.bansal@freescale.com>
 Date: Mon, 21 Nov 2011 17:31:39 +0530
 Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
@@ -11,15 +11,16 @@ Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=289836]
 
 Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
 ---
+ VEX/priv/guest_ppc_defs.h    |  2 ++
+ VEX/priv/guest_ppc_helpers.c | 18 ++++++++++++++++++
+ VEX/priv/guest_ppc_toIR.c    | 22 ++++++++++++++++++++++
+ 3 files changed, 42 insertions(+)
 
- VEX/priv/guest_ppc_defs.h    |    2 ++
- VEX/priv/guest_ppc_helpers.c |   18 ++++++++++++++++++
- VEX/priv/guest_ppc_toIR.c    |   22 ++++++++++++++++++++++
- 3 files changed, 42 insertions(+), 0 deletions(-)
-
+diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
+index 220fbf1..cd259f3 100644
 --- a/VEX/priv/guest_ppc_defs.h
 +++ b/VEX/priv/guest_ppc_defs.h
-@@ -233,6 +233,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268
+@@ -233,6 +233,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
  
  extern UInt ppc32g_dirtyhelper_MFSPR_287 ( void );
  
@@ -28,9 +29,11 @@ Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
  extern void ppc32g_dirtyhelper_LVS ( VexGuestPPC32State* gst,
                                       UInt vD_idx, UInt sh,
                                       UInt shift_right );
+diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
+index 2611e52..72c349b 100644
 --- a/VEX/priv/guest_ppc_helpers.c
 +++ b/VEX/priv/guest_ppc_helpers.c
-@@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void
+@@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
  #  endif
  }
  
@@ -55,9 +58,11 @@ Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
  
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
+diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
+index 94930aa..be2ac0a 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
-@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiI
+@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
           break;
        }
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 82b8344279..fb5e32b3bb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 8facc29c3c56e6cf9cfef70986cf73876044a3fb Mon Sep 17 00:00:00 2001
+From 5c0afe3f46d52923dd37845aea1e51be1e54ce19 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
@@ -28,6 +28,3 @@ index ae82248..816e139 100644
              /* On arm32, many compilers generate a 64-bit float move
                 using two 32 bit integer registers, which completely
                 defeats this test.  Hence force a 64-bit NEON load and
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index b9804e7451..59f6daa7bd 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From beaa5b64c60d501fa9cd59fdc563e5f5bccf6882 Mon Sep 17 00:00:00 2001
+From 8258b92d458ffed94d90cb8f43b766e29f364601 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -17,7 +17,6 @@ a better fix would need:
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
 ---
  massif/ms_print.in  | 2 +-
  perf/vg_perf.in     | 2 +-
@@ -45,7 +44,7 @@ index 90ee1d2..c585096 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 7152765..ad18800 100755
+index 3471322..49e1114 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index 3ab339d215..07578c5b02 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,7 +1,7 @@
-From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
+From 5dbb49abc08acb9a484bc187c18c433fb821d281 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
-Subject: [PATCH 19/20] remove s390x_vec_op_t
+Subject: [PATCH] remove s390x_vec_op_t
 
 s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
 removing it ensures that valgrind can be built with -fno-common option
@@ -17,9 +17,11 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  VEX/priv/guest_s390_defs.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
+index a64d563..fb963e9 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -284,7 +284,7 @@ typedef enum {
+@@ -286,7 +286,7 @@ typedef enum {
     S390_VEC_OP_VCLFNL,
     S390_VEC_OP_VCRNF,
     S390_VEC_OP_LAST             // supposed to be the last element in enum
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index afca874d02..a2a96cf735 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From d134dafc2f11e0d247420a0ba360bcdef77b4093 Mon Sep 17 00:00:00 2001
+From 2446e14216b6888dd39eed877bc6952c577b4e41 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
@@ -22,9 +22,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  none/tests/arm/Makefile.am | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
+diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
+index 79b957c..41a5a03 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -87,8 +87,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0
+@@ -87,8 +87,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
  			-mfpu=neon \
  			-mthumb
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index 0895473fc0..aa852e9115 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From 005bd11809a1ce65e9f2c28e884354a4741650b9 Mon Sep 17 00:00:00 2001
+From 18919d07e531a06c6fba74d4e43f6200f79aaca3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 13 Dec 2016 11:29:55 +0800
 Subject: [PATCH] make ld-XXX.so strlen intercept optional
@@ -16,9 +16,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  coregrind/m_redir.c | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
+diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
+index f9e8d88..453732e 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
-@@ -1307,7 +1307,18 @@ static void add_hardwired_spec (const  H
+@@ -1315,7 +1315,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
     spec->to_addr     = to_addr;
     spec->isWrap      = False;
     spec->isGlobal    = False;
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
similarity index 97%
rename from meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
index 494a3c0df9..0f05e029b9 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
@@ -19,7 +19,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://remove-for-aarch64 \
            file://remove-for-all \
            file://taskset_nondeterministic_tests \
-           file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
            file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch \
@@ -27,7 +26,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
            file://s390x_vec_op_t.patch \
@@ -36,7 +34,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            "
-SRC_URI[sha256sum] = "c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d"
+SRC_URI[sha256sum] = "71aee202bdef1ae73898ccf7e9c315134fa7db6c246063afc503aef702ec03bd"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.34.1


