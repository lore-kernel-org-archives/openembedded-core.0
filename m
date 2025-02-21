Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA028C021B7
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 14:38:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24276.1740148693040057231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 06:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4147424817=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCiPXP002957
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:38:12 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44xqcar7ff-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 06:38:12 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 21 Feb 2025 06:38:11 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 21 Feb 2025 06:38:11 -0800
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe] [OE-Core][PATCH 1/2] libglvnd: add new recipe libglvnd v1.6.0
Date: Fri, 21 Feb 2025 06:38:10 -0800
Message-ID: <20250221143811.2072024-2-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221143811.2072024-1-rob.woolley@windriver.com>
References: <20250221143811.2072024-1-rob.woolley@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pgv9yaV7padJrhVMXS3CfUMGrB9u9usE
X-Authority-Analysis: v=2.4 cv=Xb9zzJ55 c=1 sm=1 tr=0 ts=67b88fd4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=RDNcNAmtM-NRG3qii94A:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pgv9yaV7padJrhVMXS3CfUMGrB9u9usE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211803

This is a backport of the recipe from Mickledore.  It is needed
to properly detect OpenGL using FindOpenGL.cmake.

This recipe is meant to be an optional dependency of mesa.
This recipe will allow for glvnd support in mesa. Thus,
giving access to the GLX window-system API library and
related libraries, mesa will build libGLX_mesa.so.*.*
and libEGL_mesa.so.*.* or whatever specified in
-Dglvnd-vendor-name. There may be applications that require
direct access to the GLX window-system API library in order
to build/execute. This will allow for multiple layers to
have generic support for libraries in libglvnd
(GLX window-system API library, etc...) without needing to
implement their own version of the libglvnd recipe.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 .../libglvnd/libglvnd_1.6.0.bb                | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.6.0.bb

diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.6.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
new file mode 100644
index 0000000000..b76373cf2a
--- /dev/null
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.6.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
+OpenGL API calls between multiple vendors."
+HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
+LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
+
+SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+
+# v1.5.0 tag
+SRCREV = "b05bbcdaeb9b700cf7877e6d66f8fc3ac952295b"
+
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+inherit meson pkgconfig features_check
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= "\
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
+  "
+
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,"
+PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
+PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


