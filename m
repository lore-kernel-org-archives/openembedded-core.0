Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B031C3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 15:11:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50263.1744038658020447237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 08:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6192bc662b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537BcCdn029212;
	Mon, 7 Apr 2025 15:10:47 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8jf1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 07 Apr 2025 15:10:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 08:10:46 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 08:10:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ejo@pengutronix.de>, <alex@linutronix.de>
Subject: [PATCH V2] barebox-tools: clean up yamltree from dtc
Date: Mon, 7 Apr 2025 23:10:44 +0800
Message-ID: <20250407151044.2318788-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Wnq8p1OogdZeVmU5WgarH3DxfRxUMZqC
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f3eaf7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=87fBIG1AqcmDEyj1YDkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Wnq8p1OogdZeVmU5WgarH3DxfRxUMZqC
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 15:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214457

Refer Linux commit [dt-bindings: kbuild: Use DTB files for validation][1],
clean up yamltree from dtc to avoid compile failure while include <yaml.h>
in non-standard path

| tmp/work/core2-64-wrs-linux/barebox-tools/2025.02.0/barebox-2025.02.0/scripts/
dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
|     9 | #include <yaml.h>

Since barebox actually doesn't do any dtb binding checks at the moment, just
remove the test of /usr/include/yaml.h, hard-code the -DNO_YAML and remove
yamltree.c from DTC_SOURCE

[1] https://github.com/torvalds/linux/commit/ef8795f3f1ce

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb     |  4 ++
 ...ripts-dtc-clean-up-yamltree-from-dtc.patch | 60 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index 2a117bc9c08..f6395beb7c1 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,6 +2,10 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
+SRC_URI += " \
+    file://0001-scripts-dtc-clean-up-yamltree-from-dtc.patch \
+"
+
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch b/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
new file mode 100644
index 00000000000..fdab21ef72d
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
@@ -0,0 +1,60 @@
+From 77afd065dc58e2f57066ef7f392c571f8136723d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 7 Apr 2025 14:45:27 +0000
+Subject: [PATCH] scripts/dtc: clean up yamltree from dtc
+
+Refer Linux commit [dt-bindings: kbuild: Use DTB files for validation][1],
+clean up yamltree from dtc to avoid compile failure while include <yaml.h>
+in non-standard path
+
+Since barebox actually doesn't do any dtb binding checks at the moment, just
+remove the test of /usr/include/yaml.h, hard-code the -DNO_YAML and remove
+yamltree.c from DTC_SOURCE
+
+[1] https://github.com/torvalds/linux/commit/ef8795f3f1ce
+
+Upstream-Status: Submitted [https://github.com/barebox/barebox/pull/37]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ scripts/dtc/Makefile             | 9 ---------
+ scripts/dtc/update-dtc-source.sh | 2 +-
+ 2 files changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
+index 721e8e2b..da00319f 100644
+--- a/scripts/dtc/Makefile
++++ b/scripts/dtc/Makefile
+@@ -16,16 +16,7 @@ fdtget-objs    += fdtget.o $(libfdt-objs) util.o
+ # Source files need to get at the userspace version of libfdt_env.h to compile
+ HOST_EXTRACFLAGS += -I$(src)/libfdt
+ 
+-ifeq ($(wildcard /usr/include/yaml.h),)
+-ifneq ($(CHECK_DTBS),)
+-$(error dtc needs libyaml for DT schema validation support. \
+-	Install the necessary libyaml development package.)
+-endif
+ HOST_EXTRACFLAGS += -DNO_YAML
+-else
+-dtc-objs	+= yamltree.o
+-HOSTLDLIBS_dtc	:= -lyaml
+-endif
+ 
+ # Generated files need one more search path to include headers in source tree
+ HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
+diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
+index 141d3629..8aa5cd66 100755
+--- a/scripts/dtc/update-dtc-source.sh
++++ b/scripts/dtc/update-dtc-source.sh
+@@ -31,7 +31,7 @@ DTC_UPSTREAM_PATH=`pwd`/../dtc
+ DTC_LINUX_PATH=`pwd`/scripts/dtc
+ 
+ DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
+-		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c Makefile.dtc \
++		srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
+ 		dtc-lexer.l dtc-parser.y fdtget.c"
+ LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
+ 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
+-- 
+2.48.1
+
-- 
2.34.1


