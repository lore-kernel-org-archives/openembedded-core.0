Return-Path: <bin.lan.cn@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51BEC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 06:30:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5391.1717137030534692767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 23:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68818aac0f=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V4jFKw011797
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 23:30:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yf619r4nc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 23:30:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:30:29 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 23:30:28 -0700
From: Bin Lan <bin.lan.cn@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Bin Lan <bin.lan.cn@windriver.com>
Subject: [OE-core][scarthgap][PATCH] opencl: fix virtual PROVIDES warnings
Date: Fri, 31 May 2024 14:30:27 +0800
Message-ID: <20240531063027.2050793-1-bin.lan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LzX8REer30LBFmTb-CtZKZcf1YTZSSB6
X-Proofpoint-ORIG-GUID: LzX8REer30LBFmTb-CtZKZcf1YTZSSB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 adultscore=0 phishscore=0 mlxlogscore=676 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2405310049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 06:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200055

From: Bin Lan <bin.lan.cn@windriver.com>

oe-core has started to warn when virtual/ is used outside of
the RPROVIDES (build) context.

We tweak provides/depends to use virtual- instead to
avoid the warning:

  RPROVIDES is set to virtual/opencl-icd, the substring 'virtual/'
  holds no meaning in this context. It is suggested to use the 'virtual-'

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 2 +-
 meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb | 2 +-
 meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb       | 2 +-
 meta-oe/recipes-support/opencv/opencv_4.9.0.bb              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index d43ea281ae..bc1a645217 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 inherit autotools
 
 DEPENDS = "ruby-native"
-PROVIDES = "virtual/opencl-icd"
+PROVIDES = "virtual-opencl-icd"
 RPROVIDES:${PN} = "virtual-opencl-icd"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
index 146ec6e472..9901e47616 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2023.12.14.bb
@@ -8,7 +8,7 @@ inherit pkgconfig cmake
 
 DEPENDS += "opencl-headers"
 
-PROVIDES = "virtual/opencl-icd"
+PROVIDES = "virtual-opencl-icd"
 RPROVIDES:${PN} = "virtual-opencl-icd"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
index 6cacd3722c..3e9ea48993 100644
--- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
@@ -13,7 +13,7 @@ SRCREV = "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "opencl-headers virtual/opencl-icd"
+DEPENDS += "opencl-headers virtual-opencl-icd"
 
 do_install() {
 	oe_runmake install PREFIX=${D}${prefix} MANDIR=${D}${mandir}
diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
index cf836d3ecf..2e72f12658 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
@@ -109,7 +109,7 @@ PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_P
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual-opencl-icd,"
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-- 
2.34.1


