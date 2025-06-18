Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4206C7115F
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:46:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.3436.1750239962272192500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QvUWlu7y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I6RM7u005140
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JP9AcmnZz50
	XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=; b=QvUWlu7yns46SHWdUn6osqwSVcR
	rGeE6afxqdG7DNeO7R7AAP6AZlLch7IWHQdIY1hYZOnc/Df8n4HYgCbQaVI+q0JX
	8LjoK3ZnB7cmYIqIlSV15eyhG1/SwmNPnLvXaDBYr5Bqm8+wSZpWnX0QPWjVYzpT
	3OIMH3p3Oy0uPecSVqDZorF1wJd4fUzA9t/5eUVDxbS+3S6FLD6UCJlRGLOS//Gj
	9rXQ531cS+z+jgvhC62YtLQYDtu6MjPH6nVtvFZnzAaIOmdVoUTHf2RqhDJl2qVX
	uAXiho/OPTG/+5b0MQLNj79A/LZ09c4EwDmaZcWuXa+AUtb8r756gmHat2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag237mjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so2123285385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239959; x=1750844759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP9AcmnZz50XasXjfo7z/+x1+CxglK8mr1T1Y5h5AWo=;
        b=T+Mi5ZcpDOJCM8Vjh/IRVRv49Rd6ACmYx9CA1X8kPkxIs6dYsQOA24ZttAYKueTuM9
         l2olQzQb2IglTrbkeo4wHIbC+yWHY4cK1YzPBHNHrWK4ipQxbBL0ABp6auSNd/72MuHo
         5odpRH0Oa0V6Uh1n/j77vOJDwkZl1/zqWkxXzKGhlBgSfuaXSYQOKXotOLaKhkNOV3Zz
         Zqrl4yZriXIBuzY09ozkrvj0ufdK385AvsruXUxG+j6ZSafL5aEAYQqboTLq16Oq1kvs
         PgG3NvQUSl2WZDV34iGQ48NxcsgKkl8NYuB1Bt6A1ziDdcByGnBWD5hLyZkmbKwwRUOB
         DqNg==
X-Gm-Message-State: AOJu0YxRVPcNtDXeJ7e6d6P5rX7iZlZVzJscr2ERr9DQInnnsoBkrslC
	qQojpoENAsJJZ8N7qR1wBMFTgdqEhUwRzWmB+rL7HkEwDMV5TT92GVlMKum24GmWVi4qoPO1JeP
	nJhJF9s7C/7obaU2bgsK3i8CQ3egqczFtlpdjuhtNmppvVUUeya4nwkzoAHAwA3A41vAp+GtQBA
	DtPQ4oXoMPLqUAye+OZMnw
X-Gm-Gg: ASbGncts6cFnOWElauHFDQryMBZtrEAzYw8d/GVQizDkMl0bKS84V/DoNkE9MZmxoGc
	zvQRhXlMpL9DUemYbQc3Uk6WdkaniC/L/1iphN20c8LqmBY1OYqD3lOu8UZSTIqX3yrVwkMN3U7
	nzakIrgTQPV+GNHlTbaEGuoGH+PxVP/C04tAMfV4IWA9mcOBQufIfS7TRhIukkBxJSx+MwFtFAx
	1Gd8WOfhTUw/gSlS/mwzeiQ8Oi4UR3bjfUyNIzSa2Wj9crUfvsWcx0Ahw0meerBPzgOUlv0Iv+m
	pcj/HwI1hK13B2iSM9+LZVF97w96vxe9byGATNPi/N+RC61DJMz3t3VwTtfOK+dffOcMweqeMQN
	yS5b9cBSFtVtBWIHac7hhmC17jyKJkw9OuyY=
X-Received: by 2002:a05:620a:44c1:b0:7ca:f039:d471 with SMTP id af79cd13be357-7d3c6cf91b6mr2536146285a.52.1750239959304;
        Wed, 18 Jun 2025 02:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwjrido2IeNzz1rgW9BNVBwr3mhXwDrUVjgPeU6aJaK9gHSwfD8ovkmyk8iv83p3znCzVLYw==
X-Received: by 2002:a05:620a:44c1:b0:7ca:f039:d471 with SMTP id af79cd13be357-7d3c6cf91b6mr2536143685a.52.1750239958799;
        Wed, 18 Jun 2025 02:45:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1e0cb9sm2207750e87.201.2025.06.18.02.45.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 6/8] libglvnd: migrate from meta-oe
Date: Wed, 18 Jun 2025 12:45:48 +0300
Message-Id: <20250618094550.1335521-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jsmW7VBNYivUcxBMR0RWyhwzMvwj7h_A
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68528ad8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=PLp4ybTe7-GJC1KxXAsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA4NCBTYWx0ZWRfX2fXBLDVWX/FP
 DzyROUMQl4khajGMr23Ht8sc5Fl1WJCb0qozD7AAU5y2TVBx8bF9kV1T5MDQ/I8la2WFDQ37sVh
 +MFNpIKJBnoeQDJcyj64r6yzox3QweOGLCA7wOSxelNgZUG/IQ6gv+t1W2xWxBR2lAUFra7GAF2
 zoe1yb89pJ2PSwCBrL4IOZ1o4BUNMr29o3BxJyiasWmmwrd8IoZG1jIlnz1vNkXF1M8BuYnciO7
 N2HxrLk71wIciVB2N3HRCnO6HpiY+LxpB4GHKgYTKPtymxxM7gGo5S53Nrddqo2RrjSWWxecbI6
 IEGuPRgtVwO13xpCpt+/84aoJlzXrRReiJxd3YkOAKAjBZiwbgm0xVb5yIrwpZz595TIDZqf2pO
 LgMhjKdnxVYEzJJhe/e3FwfS5K8hqnb7F4pOCcyXCnK08yS1ZNEmMl4BLqf4/IvR4kcSGoFb
X-Proofpoint-GUID: jsmW7VBNYivUcxBMR0RWyhwzMvwj7h_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218994

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


