Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534E3C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:04:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.8730.1749816237338785631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 05:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fc+O+hby;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9woRZ026057
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=p+5s2Fk5TfMffUIFLCLeyATSd25EWQK5BrP
	fuqHn07M=; b=fc+O+hbyrWVnxrgk6HsPl3U7eqr8vJZ+6TKLcUSoY1uQ7YOLSHt
	BQTyF9MV57ix+CQ74HvQFvz7Va0g2b3q3ceM6bbe9bRsoTC/dkEnroSPyiaC8Wt1
	FUotyPfathZUxZRXazANbqJqtVE8bxGSOd3bsONf4RB+Zk+HZbmjzgrvsi/f84Hd
	Svz7enuyK3ee9QQdmtBiTD4ugAeFxy7P/hKtQwIxCpSWZc33UnhvgjlAmyfl62qg
	XMaxyMqyLMoRSvr8J5bod3VqO78dfM50NvjFj8pWeAxw/y1J9KZ9GLWqJVXoGGnm
	SCwSpnB3B+0a/8lNtVWrtU8eforhEPjYRLA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2ye8r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:03:56 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-739f234f43bso1848287a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816235; x=1750421035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+5s2Fk5TfMffUIFLCLeyATSd25EWQK5BrPfuqHn07M=;
        b=l9qwYzu1GhLQrQP/klh85YrHI56YV6lA1p5C86pr+dse+9QplR8nnGyHhuaPyqzDEw
         LDnTGEPeEoJrj8CSMcfq7flqe5QTp72RwkWyMDRceOCn6Jk4eiyZ8Fl0vrPSLlpxArV9
         nAUS4k3t61I0mznTOlR4tYBWpmjo6kpw5JJsFeupSTjNuOU+Rr564xhl6trGxuNjlFuR
         +E02HMl/kwZYZ0F4h4AoD7+fz6cMCXoDWPnN0USqVBBKM7bCfNqPn13YjV+Ajd961Lji
         mTvkYoVDAitYZF8f+MTnQvijTYHAE+fSTg2xz+pUqz/TsEEHbMjEAIh6YgIiPYqu7Ld2
         AqQg==
X-Gm-Message-State: AOJu0Yz0CxaIVDUrHIZltKeURRlGFVXfOidvlvVkr0eag1p2yelWZmK/
	0fvrPMEbx0S0byVJ84IYO18UiYzjjXPp6YnsdQiSJqjAWDO08jIVMwGuQrwzZr0sBk0hHy6cyYL
	YdHdBgmE1wGM5YBNS9bWhikaGp5SpEaSnVfoNQ36w9CNC+Dpjatgl9Qetud3li2MfKQF3HTicuZ
	azEGfCY9hj333uGk1Pqw==
X-Gm-Gg: ASbGncs4FdKXUc7sMHg1Wx84dDSIa/cs81RCm15Yohx5XRTxPZdM1Ck/2QAtPgE68o3
	s2xrj8U8l6TNVCYf/BA09br0i88QFb74HFpr+tDXQPw+1MMTsAcSpRP8azT7kT0qwVxiXRDIIjQ
	QwDPSCx33SYB1Lq6zeKzyYdDjNmk4Pf9pxGW1i+ZWqO9QEAXq7gOnIPK3viYJTRJ/nkM2uUWCDD
	3yxUxzKRkwzBcc0f4po+8Df3T3QKUGl+3zVJuunSURWm6PV6q5ZlTULNdBFD9ahJv8kCim8j1N7
	F480eEmFNPFZs0ix7vRV+Q9SspyRARWry1ZGW9/81OORqY+WUECTZpPomVpHddVRG/wv7gQc02R
	Nisbt/NyiShMg3OCfy91z6DOd173Jgb6DoO8=
X-Received: by 2002:a05:6830:4d95:b0:72b:a06b:dd71 with SMTP id 46e09a7af769-73a2708d263mr1874446a34.5.1749816235243;
        Fri, 13 Jun 2025 05:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErQkNGctecSAx/5uAO68dQgupnyF9WlUkM9buSdEm9P6CNVfqtdnVzWAMZs4IWzuHwKw85GA==
X-Received: by 2002:a05:6830:4d95:b0:72b:a06b:dd71 with SMTP id 46e09a7af769-73a2708d263mr1874400a34.5.1749816234750;
        Fri, 13 Jun 2025 05:03:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307ae32sm5211611fa.39.2025.06.13.05.03.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:03:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libglvnd: migrate from meta-oe
Date: Fri, 13 Jun 2025 15:03:52 +0300
Message-Id: <20250613120352.2011606-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4NyBTYWx0ZWRfX+WRuOCnyWK1C
 H2HM8LCGIZSUfUSfRX3mfTxw3YnQodw7zXLwx96NffC7EV++NCXJkERHaS1Hk/M1S/GrpemDeEg
 RH4xF3RmDMuTxEge1vZ7c2SIedpTHhC7XUdlYbwb0kd4tGmECEA/lTnZAuh5yOiYBhGEDDnBRH+
 jqaE8KYnXkhud1fa/2/Os4nhseQmUerH/TjnvHrpmxd8br1aTT+KZo8uEgajn/7Auufs7q3DVIk
 /6A4VnjxBYpM8dGml+GAAjNdfZiOS2x4JyGbssX+hk4jFEPbuqxqIlWLZlvLt8J7q2w2TF8zfGI
 AS81YYh9uV8W8wABYwop1iRn7xWnUnwZOywW+I2+jm4zvwZmqddLEAFNisgc0M7xiHyc8n57kNc
 kN8d+VeQpcCUzNZEaHU02GCoKM0VBzIIq6mxYXWl4fe5Im/6Bo1faz7loylwSKl/f4Wxldov
X-Proofpoint-GUID: QRrkFaRzxKtS8UW7ZLtTn9uofENubyGf
X-Proofpoint-ORIG-GUID: QRrkFaRzxKtS8UW7ZLtTn9uofENubyGf
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684c13ac cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=e-rRlIAal1nM4KdWVv4A:9
 a=EXS-LbY8YePsIyqnH6vw:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218595

libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
EGL / GLX libraries. It has been proposed and initially implemented by
NVIDIA in order to simplify coinstallation of GL drivers provided by
different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
etc.) have already switched to libglvnd.

Having libglvnd in OE-Core simplifies integration of this ABI into
distro and BSP layers (e.g. it will help meta-tegra, which currently
provides its own version of the recipe).

Import recipe for libglvnd from the meta-oe layer (changes: fix virtual
package names, add add the SUMMARY data, drop git@ from SRC_URI).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libglvnd/libglvnd_1.7.0.bb                | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5c315d58cf56..dbe9623de1dd 100644
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
index 000000000000..aefe62001148
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


