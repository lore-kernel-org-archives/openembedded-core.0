Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5417CC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 12:29:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.58484.1749472142982235131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 05:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H61QTPR9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599ZgV3018309
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 12:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VWe6pIa0p/cqdA89vN2AfUyZx1MoIZBfiEo
	LcNQV3es=; b=H61QTPR9v893Na/0CYMd2Nkk2L6nVfW2MhnWrW/YAlFYlExtHZB
	nEDpjW9DkC3iXqibxMg36HZ7RgjafITEU/FuRIfZdt/mGdnxpleifTtyQUDXb3wW
	7ya37uKO/u6aVKNUgniEGx3RPOHxUPCJXBz5nbb77rM36mOZWutA44YQxC1y/s+p
	9gjSAyeGCKTxXko0GAQFXRnpTOJdePIP/cmJ1ZMvRc7XquQ3///f4518wzAsoKxH
	ABvVXfSf8h42CE0T81iCVI6pkpjbVnVD2k/ctzxcj188JkNGRUt7fPtVacrbZEm2
	+OJfgw985uVSYqEcOTF68Yv398ow84Ue+Vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9p55s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 12:29:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so1344335185a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 05:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749472131; x=1750076931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWe6pIa0p/cqdA89vN2AfUyZx1MoIZBfiEoLcNQV3es=;
        b=Kqldlcpoj1FghV87YA2Fg5eA5WN8QnvLxqhqpEfvAjCFM9aU/M78juoZsViWsWuSyR
         ksYYnEQLvxiDVl1q5Kr8Irk55/WH4hCdp+3wxZcdUds9T7nIFV/VdrtvjDxiQQzKRVSx
         rDcOOS58oE4bNSED7adTAiRUQX/kjhCjOi6CG/2xQV9eHvoPxKfG7AdE5N5/jxIP9v8P
         Q6av2GsUE6KCWlMADHoxxi2hwc3BH4N6LzWGLhwLanZkftX8MMNKA9TmKkb2uGncXmql
         pqM3bvJyBsL0W6pZEIYwN2cOHUqIZ1GSoXzCEE79YR0G9R08umxZxTUJcAKnTPr6yzFH
         Grtw==
X-Gm-Message-State: AOJu0Yw3Lxj+8ZVCeP9cMxQNBgbztYAqso2wO4/AcPVmBZbfxS3ZXbkn
	5cPg0pftxgrfNcK2GGi2pVLMhSDz5WZdLKMaQ8XpoGa2EO3KLws/ldLdv89kU+fZOGPuU5thjRa
	vlhWBw4f8oV9w8E1N9E0dTJhR+o0sEcrS2b5ODAITpPYxnruDn+Pu6Uk4AFJ4aI1nTNBYK96L1z
	Rlg9LxmbUGDMYf9/Y=
X-Gm-Gg: ASbGncsI7xWKpeJZnT8xC2SeLsfG2UhdM7X581nVgQBiLPUJ6cHyLFYFxP/9Jnd+8Al
	WDXU8CMQSfcUduHkFmCx061kCt1KXoipTDdEyRpa53DU9HCT13X/liGCZ8FDLMEOp9VVG4yqCVA
	mgfAu/nrFUAVyjLY3Adb9UbeaEB4hGRroW4xk2Gi6+XwMP5PdV5PQNY/OYDX8d321L1nnDFRe6y
	EHjxt5SW9fNMBa6EWD/oLVOaOeEPzvIFk/mO6+qYKft34OYR16pnx7Yglt3dCb5JV6sA3ucbmD4
	CeW7MElmmChyqZML0RbqC684MlKr+QZGuM+I9k1GGnV72ATgvDCufV0UedJGY8On9+dCdbR8xET
	8x2Di9PNDmAaH9Vqv2E9CTqcF
X-Received: by 2002:a05:620a:294a:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7d2298968a2mr1703643185a.34.1749472120159;
        Mon, 09 Jun 2025 05:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzkJjbk5uwguofUP0pWgW1Dz3Jf4vU+8yogiMpWMV0rVMOP0NblgJuDqbtDTzhVHDLcM7Vog==
X-Received: by 2002:a05:620a:26a0:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7d2298ec9d9mr2376716285a.48.1749472108221;
        Mon, 09 Jun 2025 05:28:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677330c8sm1128062e87.238.2025.06.09.05.28.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:28:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libglvnd: migrate from meta-oe
Date: Mon,  9 Jun 2025 15:28:26 +0300
Message-Id: <20250609122826.2775354-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7bE4CiLvwNbQ_-6Dh8ZrMKur8e5UMMte
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846d38d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=PLp4ybTe7-GJC1KxXAsA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 7bE4CiLvwNbQ_-6Dh8ZrMKur8e5UMMte
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX389zUruL8dIb
 0UA3i7bt1Y6BUubfptsN6wTQq4uCGfa+cwopN2/MYn9bHoK7IqtrMPBGd5qWAxwAY1rrY9fUtAy
 C8TBPrujZTMQDj7DwwfL9ZnqzbH3CHE7BRC7obwmvPqJMGGVokb9p1KN2FDOBgC+RyRkcfwLwuS
 zG+VLISqAMwRL64dCEx/rRuJ1PwGyJrC7o4mbTSeee75eMjMlYpJ/E7nO/+H47OJ7qn7U6kgMEP
 AQsX30uJaI9pqTMkSkYcZiTcRvc6TkWGPHf2hO6tF3lVu74ajPugamKNAnBxhUNENL9F2BTAucF
 rLg0F6wTGgFnOFo1Hz9BXWGn+mD5noJNrHQdObilYK+42XrLh+Zr3212NjHDQeXzUEXHQap7beG
 tQprCU1Dc+T0rC+H7KR8qgYZirkq7khSytd1ibGueEEpah/kLxz1NMX8ZkmDyvgHzgv/ifmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 12:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218286

libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
EGL / GLX libraries. It has been proposed and initially implemented by
NVIDIA in order to simplify coinstallation of GL drivers provided by
different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
etc.) have already switched to libglvnd.

Having libglvnd in OE-Core simplifies integration of this ABI into
distro and BSP layers (e.g. it will help meta-tegra, which currently
provides its own version of the recipe).

Import recipe for libglvnd from the meta-oe layer (the only change was
to add the SUMMARY data).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libglvnd/libglvnd_1.7.0.bb                | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c19e306cfae..d608a9b21271 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -353,6 +353,7 @@ RECIPE_MAINTAINER:pn-libgcrypt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libgfortran = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgit2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libgloss = "Alejandro Hernandez <alejandro@enedino.org>"
+RECIPE_MAINTAINER:pn-libglvnd = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libglu = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libgudev = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
new file mode 100644
index 000000000000..962719158f5a
--- /dev/null
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "the GL Vendor-Neutral Dispatch library"
+DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
+OpenGL API calls between multiple vendors."
+HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
+LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
+
+SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+
+# v1.5.0 tag
+SRCREV = "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
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
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto,,libglx-icd"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,,libegl-icd"
+PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
+PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
+
+BBCLASSEXTEND = "native nativesdk"
+
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+
+RPROVIDES:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'egl', 'libegl', '', d)}"
-- 
2.39.5


