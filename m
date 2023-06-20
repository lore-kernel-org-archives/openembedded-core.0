Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4218EB64D9
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 02:48:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2169.1687229323494393448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 19:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55354de6a5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35K2eCPv029356
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 02:48:42 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220j6qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 02:48:42 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 19:48:40 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 19:48:40 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] u-boot-tools: u-boot-tools: Use PATH_MAX for path length
Date: Tue, 20 Jun 2023 10:48:39 +0800
Message-ID: <20230620024839.4102361-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UvmewZA89lsS9qhs7wjB_zfn6zTC5-6i
X-Proofpoint-ORIG-GUID: UvmewZA89lsS9qhs7wjB_zfn6zTC5-6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_15,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=716 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 02:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183128

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   | uboot-mkimage -D "-I dts -O dtb -p 2000" -F -k "/buildarea1/test/wr_build/wrtestLTS_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/layers/xilinx-zynqmp/zynqmp_keys/fitImage-rsa2048-keys" -K "u-boot.dtb" -r /buildarea1/test/wr_build/wrtestLTS_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/build/tmp-glibc/work/xilinx_zynqmp-wrs-linux/u-boot-xlnx/1_v2023.01-xilinx-v2023.1+gitAUTOINC+40a08d69e7-r0/build/fitImage-linux
   | /buildarea1/test/wr_build/wrtestLTS_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/build/tmp-glibc/work/xilinx_zynqmp-wrs-linux/u-boot-xlnx/1_v2023.01-xilinx-v2023.1+gitAUTOINC+40a08d69e7-r0/build/fitImage-linux: Image file name (uboot-mkimage) too long, can't create tmpfile.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...mkimage-Use-PATH_MAX-for-path-length.patch | 40 +++++++++++++++++++
 .../u-boot/u-boot-tools_2023.04.bb            |  4 ++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch b/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
new file mode 100644
index 0000000000..9f38736bcd
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-mkimage-Use-PATH_MAX-for-path-length.patch
@@ -0,0 +1,40 @@
+From dcd3d272975863128e25a4e25453cb6521cddc53 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 14 Jun 2023 16:09:59 +0800
+Subject: [PATCH] mkimage: Use PATH_MAX for path length
+
+Fixed when build xilinx_zynqmp in long directory ( >256):
+  |  /buildarea1/testtest/wr_build/wr1023test_secureboot/test1-what/test2-what/test3-what/test4-what/test5-what/test6-what/test7-what/test8-what/test9-what/test10-what/test11-what/test12-what/build/tmp-glibc/work/xilinx_zynqmp-wrs-linux/u-boot-xlnx/1_v2023.01-xilinx-v2023.1+gitAUTOINC+40a08d69e7-r0/build/fitImage-linux: Image file name (uboot-mkimage) too long, can't create tmpfile.
+  | Error: Bad parameters for FIT image type
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/uboot/patch/20230619062250.3244894-1-mingli.yu@eng.windriver.com/]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tools/mkimage.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/mkimage.h b/tools/mkimage.h
+index f5ca65e2ed..d92a3ff811 100644
+--- a/tools/mkimage.h
++++ b/tools/mkimage.h
+@@ -17,6 +17,7 @@
+ #include <sys/stat.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <limits.h>
+ #include <u-boot/sha1.h>
+ #include "fdt_host.h"
+ #include "imagetool.h"
+@@ -44,7 +45,7 @@ static inline ulong map_to_sysmem(void *ptr)
+ #define ALLOC_CACHE_ALIGN_BUFFER(type, name, size) type name[size]
+ 
+ #define MKIMAGE_TMPFILE_SUFFIX		".tmp"
+-#define MKIMAGE_MAX_TMPFILE_LEN		256
++#define MKIMAGE_MAX_TMPFILE_LEN		PATH_MAX
+ #define MKIMAGE_DEFAULT_DTC_OPTIONS	"-I dts -O dtb -p 500"
+ #define MKIMAGE_MAX_DTC_CMDLINE_LEN	2 * MKIMAGE_MAX_TMPFILE_LEN + 35
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
index 7eaf721ca8..b77a49af87 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2023.04.bb
@@ -1,2 +1,6 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+SRC_URI += " \
+    file://0001-mkimage-Use-PATH_MAX-for-path-length.patch \
+"
-- 
2.25.1


