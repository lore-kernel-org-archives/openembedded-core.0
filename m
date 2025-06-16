Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF423C7115F
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1057.1750090246191382137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YFj5+Nv6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8OiVO024156
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JP9AcmnZz50
	XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=; b=YFj5+Nv6Cmg4a8C5S+8ELb0f6y5
	42iaEJjCf2OokWZY6TQgKIw5rZsrGvad3Zpn2feED1Jbka+h9q9k6+aEs/oGV+o3
	cxQFqD8MK84mBnpvuY/mmkgq66tX+JGDm4ICvJ0wa8aRU+7Pzm8qaBpxAgnexXpL
	NLHZc4B/ed4zTnZzr4C64KHfgZ930oXoeMzjUh3CbuW7ZYyIay1lNrxhmE/KypQz
	ctBIMR4iNwjPszJ1b09yAunYF9i9bft0OEbGWQukLaVSN7NC3B8tNwBq6VD7/hgo
	iUEil9Sg3xMV2WMdNG9A1MHbVMqhjGN9sha+uWg5I7fzhEVpgWx4OvzpKZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsw47s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990721so1213383085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090244; x=1750695044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP9AcmnZz50XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=;
        b=I7Q/pl5pz0Q9Au7ZrJkF1xCPcbFza1z7pHvgrTUNIDImeY7rWC9rkqitdhCfbNYLrJ
         XLnh/1rnPj0L5+T0u+QK0t434+eD5pub0r0O0TP/taYfjZwPN8mMBtmVYToHN/mwTWLT
         v3pRjZZPwVVXbxZsGlTK4Mj+R4ZhC4Mrta6MITVFYgXK6598jxequTxnoKpCXr8lbJHa
         rUiL51m20d3SIG9zG4E4Tinuo8enGsUeTuLEAugLaorOrA7tezedgVCQCGr74qDnCnHZ
         z5lv6KFQtwmieLx1cTJQV23CGb+S+SZT/Ou1+b+JnZiOs6XQIjOrMrMCjNgmxiaNS851
         u5xg==
X-Gm-Message-State: AOJu0Yw/+/jcqrRGO8qMYcDqx0CCXO+5CQckfVniZCrIn9JPRtr/w5e3
	05PM3rFILqzAdBz18hn0vZFrbQ/SNDEgoDRNEjaU3hs25Gf4p7WxQbJx0Fu2b/li1VkkXWZTaED
	JrUC2oY2MoGpIr+2eNpW8vsWhc+qQ/xucYPVqRxbbT2uSuBXloPC9mlA7RfJsthJDnWqtJTZvRn
	p3trZNrRPfIDew4ZOL7Q==
X-Gm-Gg: ASbGncsLym9oXghvtdwT6t0JPt08i1tirs7MangGSnQkepBJY5WsI4OI4jI2bprh7Hj
	HTc50UAzOdi9W30Ic0JtIWF/TUlcZjqDe+VJQ9pDQR3rASwYKks4OvnX45rvFk+lGjqtSt5tLT1
	bY5aNK0aFznZ1yldjxOM649IP3TcJ3rz6+G664PRMe4lb3ZG2fINS42EMm2Y/Jshu45PJdXjbKo
	20xQv804ejg6tW7tD51/FxEjs9LPoVMgo+9j6K9l+GSER1SwlnaWO+ApXJDG3HTg2+jhBpS1oSg
	7a1iNCD8yYktXOjHUKbLaQMWbOJV8p+w8HzhWsMyZSn9EMcCJps6ds0Scci8Ov8376UZSIQ4uVU
	EtsX40+F8g9wgyDjSq6+sTV74XUUC/Urg9NM=
X-Received: by 2002:a05:620a:bd5:b0:7d3:9012:75c4 with SMTP id af79cd13be357-7d3c6ceedfamr1483686085a.44.1750090243870;
        Mon, 16 Jun 2025 09:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6P6HToj84tDWOLWiIcL1RA04T+L9SlHVCY8ji6A1/heZk95nR5baBUQoztZcdhI82e/zBvQ==
X-Received: by 2002:a05:620a:bd5:b0:7d3:9012:75c4 with SMTP id af79cd13be357-7d3c6ceedfamr1483681085a.44.1750090243346;
        Mon, 16 Jun 2025 09:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/8] libglvnd: migrate from meta-oe
Date: Mon, 16 Jun 2025 19:10:34 +0300
Message-Id: <20250616161037.1518306-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfX09pq9WUDW4Cg
 KxbS8ultffSvEODzjy2JCembw3ciwNmiCKeJhktKWaZjGpzvt7WfR2gRmSopRUbvXIQe6V1K8yZ
 PCx0FK2KhhSEwsYCDFMMAA5Wgn/A1E3csCsI+7lP8oKGN5EusC9Gm01YFSQ1Wz/YZJFKYP5p7YJ
 rIBrOlASjVDrmEGV/PKGG3EMj4wWjIooHXGpFs5/ggd1b9LHuHoozRz3t/nG69J22dRDBkfky+r
 ZaJR9Pb+3LZZndeeOtE1nt19/qA2lM1xMxH5RsYOZaJxsdNupzX17woGz3rHOHeneREW23sXI+p
 156efcWkplZwCW3v7LZxKSDdoZ3/zzLyVIbNsMvzofXcsjU154b8FLI+3JYFI8tuRZOH+XEka53
 AD2bQQwRRQNo3AS2I2AJL9lSbIPTh5LywtvP2SHv+YPplCd5fkJdMxki8cESTzJgcpu/jaMO
X-Proofpoint-ORIG-GUID: 6kwmDMTvCtw1WIie0auQpmHfOf8s-dXS
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68504205 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=PLp4ybTe7-GJC1KxXAsA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 6kwmDMTvCtw1WIie0auQpmHfOf8s-dXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218839

libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
EGL / GLX libraries. It has been proposed and initially implemented by
NVIDIA in order to simplify coinstallation of GL drivers provided by
different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
etc.) have already switched to libglvnd.

Having libglvnd in OE-Core simplifies integration of this ABI into
distro and BSP layers (e.g. it will help meta-tegra, which currently
provides its own version of the recipe).

Import recipe for libglvnd from the meta-oe layer (changes: fix virtual
package names, add add the SUMMARY data, drop git@ from SRC_URI, require
glvnd DISTRO_FEATURE).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libglvnd/libglvnd_1.7.0.bb                | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b6cf4b7cfae9..ba2e9a527597 100644
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
index 000000000000..d2a4b2dc51d9
--- /dev/null
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "the GL Vendor-Neutral Dispatch library"
+DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
+OpenGL API calls between multiple vendors."
+HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
+LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
+
+SRC_URI = "git://gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+
+SRCREV = "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
+
+REQUIRED_DISTRO_FEATURES = "opengl glvnd"
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
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto,,virtual-libglx-icd"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,,virtual-libegl-icd"
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


