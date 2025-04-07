Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DA1C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 08:09:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41795.1744013374030481509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 01:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6192bc662b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5375doPO005314
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 01:09:33 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt49sh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 01:09:33 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 01:09:32 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 01:09:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] barebox-tools: fix host contamination on libyaml
Date: Mon, 7 Apr 2025 16:09:31 +0800
Message-ID: <20250407080931.3926302-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bR21WNfyMYAPOL_ra2MQ8r4mADPc3Y6E
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f3883d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=KkCZxxNNQsh4uY6Z5bUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bR21WNfyMYAPOL_ra2MQ8r4mADPc3Y6E
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 08:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214402

The barebox-tools uses host gcc to build dtc tools, and test the existence
of /usr/include/yaml.h to build with/without libyaml

It caused host contamination if /usr/include/yaml.h existed on host.
| tmp/work/core2-64-wrs-linux/barebox-tools/2025.02.0/barebox-2025.02.0/scripts/
dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
|     9 | #include <yaml.h>

Explicitly define NO_YAML = 1 to disable libyaml for host dtc

No regression because the host dtc was not shipped to target or native sysroot

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb     |  5 +++
 ...01-fix-host-contamination-on-libyaml.patch | 38 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/files/0001-fix-host-contamination-on-libyaml.patch

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index 2a117bc9c08..50660bdf5c8 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,6 +2,10 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
+SRC_URI += " \
+    file://0001-fix-host-contamination-on-libyaml.patch \
+"
+
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
@@ -17,6 +21,7 @@ EXTRA_OEMAKE = " \
   CROSS_PKG_CONFIG=pkg-config \
   CC='${CC}' \
   LD='${LD}' \
+  NO_YAML=1 \
   "
 
 do_compile:class-target () {
diff --git a/meta/recipes-bsp/barebox/files/0001-fix-host-contamination-on-libyaml.patch b/meta/recipes-bsp/barebox/files/0001-fix-host-contamination-on-libyaml.patch
new file mode 100644
index 00000000000..e24e47a9cfc
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-fix-host-contamination-on-libyaml.patch
@@ -0,0 +1,38 @@
+From f6b529fd13af7e05bfed4471d160f1119308db2a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 7 Apr 2025 13:13:14 +0800
+Subject: [PATCH] fix host contamination on libyaml
+
+The barebox-tools uses host gcc to build dtc tools, and test the existence
+of /usr/include/yaml.h to build with/without libyaml
+
+It caused host contamination if /usr/include/yaml.h existed on host.
+| tmp/work/core2-64-wrs-linux/barebox-tools/2025.02.0/barebox-2025.02.0/scripts/
+dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
+|     9 | #include <yaml.h>
+
+Explicitly define NO_YAML = 1 to disable libyaml for host dtc
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ scripts/dtc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
+index 721e8e2b..b7bfee1b 100644
+--- a/scripts/dtc/Makefile
++++ b/scripts/dtc/Makefile
+@@ -16,7 +16,7 @@ fdtget-objs    += fdtget.o $(libfdt-objs) util.o
+ # Source files need to get at the userspace version of libfdt_env.h to compile
+ HOST_EXTRACFLAGS += -I$(src)/libfdt
+ 
+-ifeq ($(wildcard /usr/include/yaml.h),)
++ifeq ($(NO_YAML), 1)
+ ifneq ($(CHECK_DTBS),)
+ $(error dtc needs libyaml for DT schema validation support. \
+ 	Install the necessary libyaml development package.)
+-- 
+2.34.1
+
-- 
2.34.1


