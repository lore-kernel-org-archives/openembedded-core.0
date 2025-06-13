Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356DCC61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:04:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8804.1749816247659016998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 05:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aSw9hNdM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D94RkM027178
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+5s2Fk5TfM
	ffUIFLCLeyATSd25EWQK5BrPfuqHn07M=; b=aSw9hNdMHb+9a7ek4VTVsqHgmLT
	L9bvREcknTLfQZTEI9vT6IiGptDI4jNJeIXYL87YUhPmsqodw0a1FYwDL3gvsTz/
	ORg70P8mmlki+d/4tkJFbMKwH3svi4fwSi0vynZzcP8MGuSGeXnK+cp4iO7HlEk6
	3KSdRFftot81963hCMSt6eudRxH7lWeFCF5BCowvLGQ8VtdP1i3JrLbPHlxKM2pq
	RqpmYrGw3/2FX+NJ3SX78xjDbHkWBUaSaJOqibR4w7eAM2A45LQeheZnrbt+RuWS
	Dd22W7xZnFR5qPtI8RCEINAPKJ8ouIGTCcqIKsNczAgqEKfVQeku2AVkdYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvkd2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so410353285a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816245; x=1750421045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+5s2Fk5TfMffUIFLCLeyATSd25EWQK5BrPfuqHn07M=;
        b=g5xHNpIig5+8FFiF3SQBycM683ZWy5fIsjW3MrDxjCePPXFH1rjA2gMn5fuUqvicBo
         K41j1KJpD3Q7e6ssqV1ni5f1GhyKwU2RtgPzmQBXDmDKmX8PZ/HTEUI0nCxOqUC8P3Zj
         HEGFFWNigsQxq9/X6+nVO7spHdwm+wdN5PH2/HSMm68hH8RMe6uktVdmuOI59A0Od7ds
         CZTGYwWuwd0Q+sFttbQhBnF0Qo1k5edeN0PsiGu2JVpn0WdVAurutsBtDvuL6lsxNZYY
         BLyNh1k/uQ/60cxWLZl1rvtsDlvoD4JDMxMndW2WpNa0jzF4O1iDWb/Wm1nYB/ZV95Gj
         3jQA==
X-Gm-Message-State: AOJu0YxunDxs1p55unznlm6zIEWOIavsX7yw86aVJ8ZZp8cxVyFp00vX
	x7oMc6gWaTqLYynpJej1dSkyVRSjByjf5oubAAwZ0vYlv1kS8q3cjh6LYzo8fi8UC6n86qOk9ZW
	5BFP3m+ES+t3Tc5Krw/C8OnFTDePtbbFeZ2QvHdsrGK3ClA452XIAt62UFQn29BSWk5J+ho7WvX
	Ma30/9PPtzgv9uRKkuAQ==
X-Gm-Gg: ASbGncvACnmj2XVDfPtgGANOXPrXwuZAQlX/nkhARA21iPUK/3mPkY/B//vS7X90gvq
	UDRVW67MI5VPwPaVXBcWpr1MIiQDv/BC/L8zFVX1y7Ki2YcuH4I6G+/eFycmRJAvoxgzaKjzQLV
	7TwMs4O3u1gcULRLvef8cSjO5ujnQN1dLyJSh140j9BNZgUgU5TwVcY1aLVhYcBcFBVUayqtr6F
	dcjKR0yJUgrSclDQjH2hnB51oil9FPrvHaS/bYnZzITey7z0Xoc85kpCq8eHvyYbCWO0O3qhyUc
	xQwMNGgyMoRUZY1QzSL3WVFHoc66KxNG9cmOaR8Fj3cM8OrGzo5fqc+Puh9zqqhdvJ8c4muoM24
	FCem5TcEefVGFuXrzONdWHfdcyEeXJdktUZw=
X-Received: by 2002:a05:620a:46a5:b0:7cd:26eb:658e with SMTP id af79cd13be357-7d3bc444bd9mr495077285a.25.1749816245304;
        Fri, 13 Jun 2025 05:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBCZa6alwGlSfcb/AMeGEyJAfpxsa9kH7nP5LOi+z6BGB6TInrpImqEkT/rbAmRY12Q2H+sQ==
X-Received: by 2002:a05:620a:46a5:b0:7cd:26eb:658e with SMTP id af79cd13be357-7d3bc444bd9mr495065085a.25.1749816244338;
        Fri, 13 Jun 2025 05:04:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm422913e87.31.2025.06.13.05.04.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:04:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] libglvnd: migrate from meta-oe
Date: Fri, 13 Jun 2025 15:03:58 +0300
Message-Id: <20250613120358.2011626-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8_KEG7qpkCv8y69AgMz__uPCGmsBnKgA
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684c13b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=e-rRlIAal1nM4KdWVv4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 8_KEG7qpkCv8y69AgMz__uPCGmsBnKgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4NyBTYWx0ZWRfX2YPAY90bK9bc
 MtQZV/3avoMsAFR0QH5dQ30e44m3fiCESAiQVipmUcoLBTUi0ZTV0jlTvo0lGII1UQW6FOMh+w6
 n2q6J9/ARWQiWitu2LU8cYF/ko5WUog50QLIGYin8w+b55ZwgENoBIjniPF0EyISDLFqgkSRDkA
 PgM5S8d5u5eMSPBu0OCXJLxnVZ2q4R9JeB2v6jylPLU0Kc2s5ODS+5D92qucc9potgaIkKz04bt
 BYtKYeg0m7V1KKFI/q5PAUVTUvI+cFZr7/VvL98KOTowOKCBqUwHB0xLZ8DZ9mj07J/m1saMxZi
 LqssNK2uyTd9RTl+VQsP+OlEwlUwMKZHgc+KaRdOR9X6w1usDKXQVdgv1TRyv/NW/WGIpVU0wCw
 2jjWb6dCAmqaD6h4zPhtKqHAbxhLaWswgMHtAXMYn339D43SCfOwU7ZM3S6AP2hMnbltdWs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218597

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


