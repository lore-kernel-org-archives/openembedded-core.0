Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CABD743F9
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 01:23:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.822.1732152230182810754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 17:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10558afda8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0x1Yc021031
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 17:23:50 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq4sn8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 17:23:49 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 20 Nov 2024 17:23:49 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Wed, 20 Nov 2024 17:23:48 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 2/2] strace: update from 6.11 to 6.12
Date: Wed, 20 Nov 2024 20:23:47 -0500
Message-ID: <20241121012347.1975065-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121012347.1975065-1-Randy.MacLeod@windriver.com>
References: <20241121012347.1975065-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jSZ-8CIKZnZueGos5csqtrPmBQ9uiWii
X-Proofpoint-ORIG-GUID: jSZ-8CIKZnZueGos5csqtrPmBQ9uiWii
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673e8ba5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=pZrfFISh1EznGaRN9YUA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_22,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 01:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207495

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release highlights:
   https://github.com/strace/strace/releases/tag/v6.12

Drop patch merged upstream:
   0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch
      3b6f69aa2 sched_attr: Define conditionally on SCHED_ATTR_SIZE_VER1

qemux86-64 ptest results:
       glibc musl:
TOTAL: 1393  1393
PASS:  1066  1059
SKIP:  327   330
XFAIL: 0     0
FAIL:  0     4
XPASS: 0     0
ERROR: 0     0

The skipped tests are mostly SELinux.

The musl tests that fail, currently for unknown reasons, are:
   pread64-pwrite64.gen
   preadv-pwritev.gen
   pwritev.gen
   uio
At least for  pread64-pwrite6 the pwrite(64) syscalls are not traced
and that makes the test fail.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...e-conditionally-on-SCHED_ATTR_SIZE_V.patch | 49 -------------------
 .../strace/{strace_6.11.bb => strace_6.12.bb} |  4 +-
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch
 rename meta/recipes-devtools/strace/{strace_6.11.bb => strace_6.12.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch b/meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch
deleted file mode 100644
index b8d57797df..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d162a1d6b18348955f9989f150c86a68af096362 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 30 Sep 2024 15:17:16 -0700
-Subject: [PATCH] sched_attr: Define conditionally on SCHED_ATTR_SIZE_VER0
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Fixes builds with glibc/trunk
-
-In file included from ../../strace-6.11/src/sched.c:14:
-../../strace-6.11/src/sched_attr.h:16:8: error: redefinition of 'sched_attr'
-   16 | struct sched_attr {
-      |        ^
-/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/strace/6.11/recipe-sysroot/usr/include/linux/sched/types.h:98:8: note: previous definition is here
-   98 | struct sched_attr {
-      |        ^
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://github.com/strace/strace/pull/318]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/sched_attr.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/sched_attr.h b/src/sched_attr.h
-index 26c53172f..a5b5d94ce 100644
---- a/src/sched_attr.h
-+++ b/src/sched_attr.h
-@@ -11,6 +11,8 @@
- 
- # include <stdint.h>
- 
-+# ifndef SCHED_ATTR_SIZE_VER0
-+
- struct sched_attr {
- 	uint32_t size;
- 	uint32_t sched_policy;
-@@ -25,6 +27,8 @@ struct sched_attr {
- 	uint32_t sched_util_max;
- };
- 
-+# endif /* SCHED_ATTR_SIZE_VER0 */
-+
- # define SCHED_ATTR_MIN_SIZE	48
- # ifndef SCHED_ATTR_SIZE_VER1
- #  define SCHED_ATTR_SIZE_VER1  56
diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-devtools/strace/strace_6.12.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.11.bb
rename to meta/recipes-devtools/strace/strace_6.12.bb
index 1bc8aa99e7..c16e5dc478 100644
--- a/meta/recipes-devtools/strace/strace_6.11.bb
+++ b/meta/recipes-devtools/strace/strace_6.12.bb
@@ -14,9 +14,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://0001-sched_attr-Define-conditionally-on-SCHED_ATTR_SIZE_V.patch \
            "
-SRC_URI[sha256sum] = "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab6e4883626e283a5"
+SRC_URI[sha256sum] = "c47da93be45b6055f4dc741d7f20efaf50ca10160a5b100c109b294fd9c0bdfe"
+
 
 inherit autotools github-releases ptest
 
-- 
2.34.1


