Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826ADC4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:26:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.111823.1699493157652625366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HkGNClnO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A90onCA021582;
	Wed, 8 Nov 2023 17:25:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=QC5I7kY1j5xNgL+i+j/NtqTof7edV8t9iS1Xpt6u714=; b=
	HkGNClnOvMGYF5XZ28AWGXgj293qPcQxaPT6bkmZiRKCXmogomcmjNgRsNd1U7Ne
	wkh6FkKnJnZ5MzhduTR/uxHgUGdoxhS5bYxNONppkXhiDdAH4LUqjem1GZx4qDDT
	F79tg9ildXDLZ2cca5eIlCitEIDELfxP6xvG1RaRhDz+35dwE0CFcgDvbEU6nJKE
	DBYy++/CXfazVPw/scvu0E8odYi5ecl5z6UnVic/ev/TZ1WNkUN8dGeh1F34LEDy
	idGMlFovrF3Yjm6VLAnaEGm1GPOJmiUemc2VMjzat2WRWBkFoZRyU5QXFd8/VZaj
	rkuYEE0TVWEwppljm2XO7Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1chh-2
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
Subject: [RFC 2/5] valgrind: update from 3.21.0 to 3.22.0
Date: Wed, 8 Nov 2023 17:25:52 -0800
Message-ID: <20231109012555.4074359-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
References: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lCEcC3WQ4yevSG6kUMRzFgf19uuvf6n2
X-Proofpoint-ORIG-GUID: lCEcC3WQ4yevSG6kUMRzFgf19uuvf6n2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190369

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Full release notes: https://valgrind.org/docs/manual/dist.news.html

In summary, there is a new configure option: --with-gdbscripts-dir
that lets you install the gdb valgrind python monitor scripts in a specific location.
It's not used in the valgrind recipe yet. Also, there were a few Memcheck and Cachegrind
improvements made and many bugs fixed.

The update required removing the patch:
   0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
as it's dealt with by these commits:
   f7e4bb4af Bug 382034 - Testcases build fixes for musl
   306232d40 musl: another fix for building testcases
as described on: https://bugs.kde.org/show_bug.cgi?id=382034

Ptest Resutls for qemux86-64/kvm

glibc:
=== Test Summary ===
TOTAL: 792
PASSED: 759
FAILED: 14
SKIPPED: 19

musl:
=== Test Summary ===
TOTAL: 792
PASSED: 559
FAILED: 211
SKIPPED: 22

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...inux-seg_override.c-add-missing-incl.patch | 30 -------------------
 ...{valgrind_3.21.0.bb => valgrind_3.22.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb => valgrind_3.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
deleted file mode 100644
index 5e36c28523..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 8 May 2023 11:56:35 +0200
-Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing include for
- musl builds
-
-Otherwise SYS_modify_ldt is undefined.
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=382034]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- none/tests/x86-linux/seg_override.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
-index ca8fbfe..4ef4394 100644
---- a/none/tests/x86-linux/seg_override.c
-+++ b/none/tests/x86-linux/seg_override.c
-@@ -3,6 +3,10 @@
- #include <errno.h>
- #include <string.h>
- #include "../../../config.h"
-+#if defined(MUSL_LIBC)
-+#include <syscall.h>
-+#include <unistd.h>
-+#endif
- 
- 
- /* Stuff from Wine. */
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index a2feda6aae..6dcd028075 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -36,9 +36,8 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch \
            "
-SRC_URI[sha256sum] = "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971"
+SRC_URI[sha256sum] = "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.42.0


