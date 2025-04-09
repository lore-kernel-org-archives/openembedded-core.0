Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4553BC36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:51:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37.1744167073389374148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6194433897=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53919cX5028406
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Apr 2025 19:51:12 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m4f38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 19:51:12 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 8 Apr 2025 19:51:11 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 8 Apr 2025 19:51:10 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [PATCH] gcc: Undef _TIME_BITS in sanitizer_procmaps_solaris.cpp
Date: Wed, 9 Apr 2025 10:51:10 +0800
Message-ID: <20250409025110.2795486-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fF6set-zC5ohqcaFtnsg8uL-HUjrbJbU
X-Proofpoint-ORIG-GUID: fF6set-zC5ohqcaFtnsg8uL-HUjrbJbU
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f5e0a0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=pZTDudBWK4A4GmL99h0A:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214574

From: Jiaying Song <jiaying.song.cn@windriver.com>

gcc-sanitizers fail to build when both -D_TIME_BITS=64 and
-D_FILE_OFFSET_BITS=64  are defined. This is because
sanitizer_procmaps_solaris.cpp explicitly undefines  _FILE_OFFSET_BITS
before including any headers, which causes _TIME_BITS=64 to  violate the
requirement in glibc:

/usr/include/features-time64.h:26:5: error:  "_TIME_BITS=64 is allowed
only with _FILE_OFFSET_BITS=64"

Fixes a build failure on 32-bit Linux platforms when using both
-D_TIME_BITS=64 and -D_FILE_OFFSET_BITS=64.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |  1 +
 ...undef-_TIME_BITS-in-solaris-procmaps.patch | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index 3d65bed92a..ae2f8c0638 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -71,6 +71,7 @@ SRC_URI = "${BASEURI} \
 	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
+           file://0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch b/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch
new file mode 100644
index 0000000000..9426f5d221
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch
@@ -0,0 +1,62 @@
+From 883d5549dc959b736e3cb61b989272a9e6a42565 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 3 Apr 2025 17:09:22 +0800
+Subject: [PATCH] libsanitizer: also undef _TIME_BITS in sanitizer_procmaps_solaris.cpp
+
+Upstream commit
+https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
+of LLVM added a #undef _TIME_BITS in
+libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
+fix the build on 32-bit Linux platforms that have enabled 64-bit
+time_t using _TIME_BITS=64.
+
+Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
+sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
+including any header file. To fix this, the upstream fix was to also
+undef _TIME_BITS.
+
+This commit simply does the same in sanitizer_procmaps_solaris.cpp,
+which also gets compiled under Linux (despite what the file name
+says). In practice on Linux hosts (where _TIME_BITS=64 matters),
+sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
+the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
+the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
+before including sanitizer_platform.h, which will set the
+SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
+
+Fixes
+
+```
+/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
+ only with _FILE_OFFSET_BITS=64"
+| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+|     ^
+| 1 error generated.
+```
+Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/fa321004f3f6288d3ee2eefa6b02177131882dca]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+index eeb49e2af..f78558bed 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
+@@ -10,7 +10,12 @@
+ //===----------------------------------------------------------------------===//
+ 
+ // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
++
+ #undef _FILE_OFFSET_BITS
++
++// Avoid conflict between `_TIME_BITS` defined vs. `_FILE_OFFSET_BITS`
++// undefined in some Linux configurations.
++#undef _TIME_BITS
+ #include "sanitizer_platform.h"
+ #if SANITIZER_SOLARIS
+ #  include <fcntl.h>
+-- 
+2.34.1
+
-- 
2.34.1


