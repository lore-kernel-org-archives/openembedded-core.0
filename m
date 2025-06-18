Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBA8C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 21:21:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7318.1750281673897795283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 14:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SWpTuo7N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IBuUf5024378
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JP9AcmnZz50
	XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=; b=SWpTuo7NaMMJgGxtdbpEArJAvBO
	/gYpsTzhOLO3nG8RcoKSZT7Uw+FrzYnBUzFg4JHrXUsNw4B3iyVpQ7Di/vWZbAtX
	vab8oVlLdfvQwiAdjljBVaopGlEZ4/fvU9okE5FMkdM4POUOqfax7YevLXmcQJEt
	mCIrMyD9AzjdkiXdzQDlPL9URh83BjZ8c76IKQQJXVbiM0E2818HuuIhNR5rmKGJ
	uNGOIk3kvOj9pYyFM4rSMTE2ryjvOvINuYOE6gsgLhMHdUfpe7opB4cTe6qLXiIH
	+eyjbNscOiBOVUNwJr4KXf6u3COVtVp0ohIjUt/wKO1hdC+vzkE1YQIqGdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw139nnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09bc05b77so22993785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281672; x=1750886472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP9AcmnZz50XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=;
        b=QKJE/mypY1Bcg6Uj5nharzDoyEWS2ePBB0nb7bdrJ2fzUGDeZHsBSqq9r46jU3T17y
         iJ1okuMjRebXcLs9p9lmy7Mi4e65rnxnYSdyGQ/YzEJDf8PM0GVYKoWneC2uI8igsuiT
         egfO1GmAUm9TZxgUNGQbKOtsWyNQ/IJZN+hErla+972ZjQpHJiBuXv4qeLFEkZA2t3iT
         kg9KV8sulAIZWaAji6k5t4grtHOfSwh38Oa2Hm+UVDzg5BCx5JdrUImqt8YPwnuRnEMm
         7OrCAMAn9B3EwKNKfMV0/zuEKmc6IUe2F2ahcGduyp0Lhp5xOWfvHWYr1tbyQFF3fupu
         uLlw==
X-Gm-Message-State: AOJu0YxA9r24FcRJifpHtLTBW+ekBGL0X83jcCe4xOJWiOjA6+szMm0n
	x86VP0gOJaetUj7XoGZ0EQLBM9AGyf4h8qLOtCOGsKEhxicmu+KpcxZukC1LL2lO1vMV7W0qLWO
	U/WKXHWEEpdl0Y4dnN2MgSNG22s01nZ1GJ+b4Cn8h5CIYCP+vEBIlbSpihlle2cX4lejvtDI3eq
	5Y8defoZ8UVCtP2Ceh2NIS
X-Gm-Gg: ASbGnctCPwMr5E7g7DeU0tyiQybhVj5bPloCqEkTiOEPqV/i/ILQE+ENBPgk2zu4Hj/
	55B9oYMX1yp8fl64HBZngvFaXB+047ejWjK3OBPqStjgQpjKJGNBAjpOfeiFBkhMbAklhtFHAqD
	Y27CNNRWWuVPQXl7p/tFVGSdc0gB2fl2oIMWEvYCzLbt0j4cBZIbM9gNYM8NSNn94yo7o/0vAJO
	LiVTsAQp0cszTNTgbe2Gm2lT7GIpDhfPZqadhfCmZKZ7Cj7VtdjN/4UeCGPsdO+0o/4MLZr6W7J
	dlKNumfOEXQmMx7i0bVLky2aHIsay7AOOunjPQ+yBVJvRVTwjQM/SGGVuiCUOTo+cT0jsREViOK
	NZk8qEvJEyY1qWTP3O8MNlhffgmC12tuThpU=
X-Received: by 2002:a05:620a:a10a:b0:7d3:91f4:9c43 with SMTP id af79cd13be357-7d3c6c209dcmr2227103185a.15.1750281671864;
        Wed, 18 Jun 2025 14:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFdKSj3qgJ9G7vYVWjaQOIxmUiEmZgUXJeYbOYfPvqRZlxoJees8FMl58rrBkjy9+ArvcydA==
X-Received: by 2002:a05:620a:a10a:b0:7d3:91f4:9c43 with SMTP id af79cd13be357-7d3c6c209dcmr2227100585a.15.1750281671326;
        Wed, 18 Jun 2025 14:21:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c12e2sm2368806e87.153.2025.06.18.14.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 5/8] libglvnd: migrate from meta-oe
Date: Thu, 19 Jun 2025 00:20:52 +0300
Message-Id: <20250618212055.1529969-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=68532dc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=PLp4ybTe7-GJC1KxXAsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Jup0aLk0yqmmYZB6PcvO6_NAiiNoN8sR
X-Proofpoint-GUID: Jup0aLk0yqmmYZB6PcvO6_NAiiNoN8sR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MiBTYWx0ZWRfX8/eNMoq/HdAy
 Igqzd6FqNw+Huq9f2tIDuMv0Bfh51zBDCokF7oZcKk6bHYPFGj6h4sBUTvnxm3YzWQX/xIz/tZ2
 3WQ+9+CaxE6KgV01xTDQErBgktj0/ZsoLnIMQH50u8qMyyWSdti/V6mJWFJC/RgADlOjzy4Iq3J
 1HawJ4iqVt+Kd4jFPDsH+odGzY2edfKA6ZNpm5nkjMHOm30Ay8NiYxoiZw01CNwksLpdL5nqFfT
 CDrna77U95nigZYHmjRKEFEakAqbM8zs6rPeep2TUISlI5CS2G8Nh/aAxNqmPQ4wd+Q8JKjyD6w
 K0vCZu9HPqckD6hX3j6O/G2drpXl/QtfLqUmBDIJSqYzTXrvIMsqp3NbNw+7IzAtppBUYblxDN+
 kWwwznYZHHOsK0z4C6ELguTZDaTW9wJiqQVT2aKI3w4o5o9AsC6Ef7E8Cp4w1p90BsVynzZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 21:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219041

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


