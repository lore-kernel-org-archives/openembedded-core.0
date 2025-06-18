Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462E3C73C66
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:05:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8261.1750255535440494866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=McfgbiZp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IA8oEv020800
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JP9AcmnZz50
	XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=; b=McfgbiZpv3aKBs9juSMv+L7wV9e
	9+aI1q8Vogb3+JMZFgwzBAP5pwfE8h5OJxJYFeS/mRywfnew5MAKBLmhKGAHOYTz
	zr5X0+jNWibMOh2ISeFEx+ckfqVOytF3x09UEU1e9vYa3ryYCKno0EjdHddHHpPF
	I4Vxb+WEUoszeY4CiiV87UyLi8dipNDDRjeWOlEpKEqOqp+2omMHky1gyCSl2JGM
	6J4s7NxkVKIIH/bxDGvnscq3m1z1lkU3v6+DDqCqQ4S0V7+SJM5RbBZfy4tPLnyY
	6BfRDBYUPOlWOLdCPNb/l3TGzjmf1BTClVWRZFW+qxi5s4vpb1Jk2skWM/g==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca4fwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:34 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so761855539f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255533; x=1750860333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP9AcmnZz50XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=;
        b=rAHUNZ2SvQfC3oL4t08FYTgnr5yZhdN4YCjp9Va6Vu9j/aMCUPXZbqMStcy8I0vIiY
         UcTj3HbaPZVpbjA8YXq2btCwAKf1xNFIqHshFI2LaKkjzMnPdCu63pIUhOvHt31Rdwh3
         Eqb8AZISmvu871Uj7vpzxYcgAbACQ7IAvwQmU8wjISIdv3Qu+h1CKzJWsicu5ePwZdwV
         NRncmHf0sr2XQpZi3AKnX5HW3wkKOEFmn7YfMvuQtvt0f0UyPHcw3j//mAJG1S9R0pWE
         3SL0WPr48WoLpNXO+3qUlY/sVRaNfBQtFUa4Wy0RG7owifE9m2Fb6vrwL0E9q+X8OXQ1
         7bFw==
X-Gm-Message-State: AOJu0YxMAEBR5BY3BGPqynqgE3FyEzLKQ/Xy96OzbV+JjFwiOosWz7aK
	18QZZDOZEOZT8LC09mm0mrlIxgdIPcBd2yqxpEZs/uH8/3GA2nJTzWMKJS0d/JEYfY0yuJjpoqr
	RZ2yU9CFPnKl0VE7Tz3Yzv0o+dC3IXoZwLGEU7evDvXzulaOhuSHG0rgwf+5h68ObPtgl2Tmd0W
	JirKTI14312izJA8hnUF9I
X-Gm-Gg: ASbGncsfrrSFGlmGXlRC4X97gqLANl6rzjHcoROeJ2/v5esv4GJ6Zzg5WTZiAAh1JZb
	IX+WzBR/vp3h++jE4GookpZoAOwvhFS88iY/yYpFxpX7/6SK5c2fF+/jFbsxzGQtCMg+IO9slFO
	ML3wVLONFIuJIEzLLZChbr1+vNqoVnDOkdoX4FY00xIKPuoHeEWC0Y1NG6wSydKNogsqWlklqDq
	t45IvC5Cew0FIUc/+LDptpidxGDtBaNtZ5Snpai7qoss9klEngj7YUuUn8yJKfmJMVP/Hxj0oe6
	r8WQHT6keP7oLedRMAy3qoyMapB87u7ggm2It93dWMnoPGD+otCjaW+s2tWV7fBKTSigSbj4IhJ
	pYsgrSSZwgM/QBHRQYSKkKXQ+xjXcerCyL+Q=
X-Received: by 2002:a05:6e02:1fce:b0:3dd:d995:5a97 with SMTP id e9e14a558f8ab-3de07d50b6emr193519175ab.12.1750255533311;
        Wed, 18 Jun 2025 07:05:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcJ4kjBX8kO80p1JyqB0A9lsV0+aYqs2GrBKn+ddadAZIdye+gu6+9DnvhQs5uZB0Yck8+Ug==
X-Received: by 2002:a05:6e02:1fce:b0:3dd:d995:5a97 with SMTP id e9e14a558f8ab-3de07d50b6emr193518515ab.12.1750255532707;
        Wed, 18 Jun 2025 07:05:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm20164281fa.30.2025.06.18.07.05.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:05:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 6/8] libglvnd: migrate from meta-oe
Date: Wed, 18 Jun 2025 17:05:24 +0300
Message-Id: <20250618140526.1431757-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618140526.1431757-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZrPZdwgP7BQSTv2SbgPres8zycIxjJ1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX4Jw383n9Z9IX
 9/rxg40cWktqjA7tH20iw7bu8xIuNuzwlKyuXWvSDz8O0UXkwLOqrLYs1tYkXMzoYzJEFCzvZcN
 SRbdbAgpvfnEH+M1pAudbFehEgrHlIeoEjmae5T858SspD1l4mtRMqXF8pdKu7zz6ro4WtZvogw
 XlyHG1hy+cj4EftKLzrtpyeGAYon8JDzMsdAuZdaW3pBD+01GKA6mLg8fMRwCt6LRFEuSsrrZKt
 cUfDx3EUxTPzzOyO/xi8n68zfkOQFtwwId3tkc4WFPR3B7uQx1H/vHwYIeAVLCmKEKwk/D77OgE
 KHL1zpYetwM/LwUdtTi9IOd1u4fkiiS7YgfDOonAiYAJiUm/PeAbX2gkrAMKChIzoODw98CV8li
 /ej8/hUXWZSEusaX1D6iBQrEIcOg88SwU/5VHFTcVWBXJCcdXp/AFFiUQh1p/n9arud0iKnU
X-Proofpoint-ORIG-GUID: ZrPZdwgP7BQSTv2SbgPres8zycIxjJ1U
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6852c7ae cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=PLp4ybTe7-GJC1KxXAsA:9
 a=TsFzuV67ciA61D7d30EA:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 14:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219019

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


