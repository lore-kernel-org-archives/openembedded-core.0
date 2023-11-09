Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735C8C4167D
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:26:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.111822.1699493157613749093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SjXTI3B6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A90onCB021582;
	Wed, 8 Nov 2023 17:25:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=FTGuhuLdP39m7npAUa89k4EC4p1y5RhinR3o+l++MAU=; b=
	SjXTI3B6Oy5WfHOZI9sFsYOV1Ssum/xcqcxWvF5tqzRKWvuId7K6u7eGGQqlErgY
	70x8nv0ZN+t9+tgLA2YYY9lTA0AtKzScx06cSM49qh/LNNewc9LjnSCJWT7qCemW
	BTb07GjnmHCQpsMSCk4kPiJ5ztJeC+8zGIGxjGK+ZDwEwDIHBwO+JD4sI8DRCiCB
	7gE/0TZLQDU9EnZueVWEb5hqZGQn0QptydsU1ZXUg/VcXCJUGb1TWLg13fTcOmzw
	63MovvBJ0vnpCGwV1+oLwbqq4LucaUsNeuD7389c8Mz4gcwWnlWb/kOtR7e2QWV8
	vWRPtajuLGogQ2HMExZRVA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1chh-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Nov 2023 17:25:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 17:25:59 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 17:25:59 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [RFC 4/5] valgrind: drop mips32 opcode patch
Date: Wed, 8 Nov 2023 17:25:54 -0800
Message-ID: <20231109012555.4074359-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
References: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OXcaXNMOTi57qcoUJyC2V91BdQyhg_sn
X-Proofpoint-ORIG-GUID: OXcaXNMOTi57qcoUJyC2V91BdQyhg_sn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190368

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Drop: 0001-fix-opcode-not-supported-on-mips32-linux.patch

The resolved (works for me) upstream defect rejected this patch:
   https://bugs.kde.org/show_bug.cgi?id=396905
and suggested using CFLAGS="-mips32". With this patch dropped, the
qemumips build succeeds perhaps due to using -march=mips32r2

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...opcode-not-supported-on-mips32-linux.patch | 82 -------------------
 .../valgrind/valgrind_3.22.0.bb               |  1 -
 2 files changed, 83 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
deleted file mode 100644
index 39b624d9f6..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From fb5362f205b37c5060fcd764a7ed393abe4f2f3d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 27 Jul 2018 17:39:37 +0800
-Subject: [PATCH 1/2] fix opcode not supported on mips32-linux
-
-While build tests(`make check') on mips32-linux, there are
-serial failures such as:
-[snip]
-| mips-wrsmllib32-linux-gcc  -meb -mabi=32 -mhard-float -c
--o atomic_incs-atomic_incs.o `test -f 'atomic_incs.c' || echo
-'../../../valgrind-3.13.0/memcheck/tests/'`atomic_incs.c
-| /tmp/ccqrmINN.s: Assembler messages:
-| /tmp/ccqrmINN.s:247: Error: opcode not supported on this
-processor: mips1 (mips1) `ll $t3,0($t1)'
-| /tmp/ccqrmINN.s:249: Error: opcode not supported on this
-processor: mips1 (mips1) `sc $t3,0($t1)'
-[snip]
-
-Since the following commit applied, it defines CLFAGS for mips32,
-but missed to pass them to tests which caused the above failure
-...
-3e344c57f Merge in a port for mips32-linux
-...
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=396905]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- helgrind/tests/Makefile.am    | 5 +++++
- memcheck/tests/Makefile.am    | 5 +++++
- none/tests/mips32/Makefile.am | 4 ++++
- 3 files changed, 14 insertions(+)
-
-diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index ad1af191a..6209d35a7 100644
---- a/helgrind/tests/Makefile.am
-+++ b/helgrind/tests/Makefile.am
-@@ -214,6 +214,11 @@ check_PROGRAMS += annotate_rwlock
- endif
- 
- AM_CFLAGS   += $(AM_FLAG_M3264_PRI)
-+
-+if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
-+AM_CFLAGS   += $(AM_CFLAGS_MIPS32_LINUX)
-+endif
-+
- AM_CXXFLAGS += $(AM_FLAG_M3264_PRI)
- 
- LDADD = -lpthread
-diff --git a/memcheck/tests/Makefile.am b/memcheck/tests/Makefile.am
-index 84e49405f..aff861a32 100644
---- a/memcheck/tests/Makefile.am
-+++ b/memcheck/tests/Makefile.am
-@@ -443,6 +443,11 @@ check_PROGRAMS += reach_thread_register
- endif
- 
- AM_CFLAGS   += $(AM_FLAG_M3264_PRI)
-+
-+if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
-+AM_CFLAGS   += $(AM_CFLAGS_MIPS32_LINUX)
-+endif
-+
- AM_CXXFLAGS += $(AM_FLAG_M3264_PRI)
- 
- if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
-diff --git a/none/tests/mips32/Makefile.am b/none/tests/mips32/Makefile.am
-index d11591d45..602cd26f6 100644
---- a/none/tests/mips32/Makefile.am
-+++ b/none/tests/mips32/Makefile.am
-@@ -99,6 +99,10 @@ check_PROGRAMS = \
- 	round_fpu64 \
- 	fpu_branches
- 
-+if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
-+AM_CFLAGS   += $(AM_CFLAGS_MIPS32_LINUX)
-+endif
-+
- AM_CFLAGS    += @FLAG_M32@
- AM_CXXFLAGS  += @FLAG_M32@
- AM_CCASFLAGS += @FLAG_M32@
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 0ebf08eb28..c3c1bc0b2c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -26,7 +26,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
-- 
2.42.0


