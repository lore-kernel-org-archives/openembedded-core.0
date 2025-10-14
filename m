Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1548ECCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 10:21:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.12609.1760523671181481616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 03:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LcclW+s7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sEAJ003541
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 10:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dP97dQ4/Ne2ggn51GfKBhla/pHyI5MAPVYs
	2qwgs850=; b=LcclW+s7Jxswd4rGHuDDRUueqqZKl3tNL+n+HnUma6j8q9QzKJx
	9Zq4jfx9XWpz8A1NdJe659vmwVFs0ZYndDy+0yX9fyJVrcJEXbbblzRF6G8pCjXw
	97CbFtcgeGL2XijbkxDuJV9R3aHl5y3NtfDCu+hYog38Koj/WnRIIr16QAArgLnB
	PRwRirz5pHphQlBbUw3aNzXVyOBG5KSWoVnbd4ZWGHrVVoQN411Te/j5L3D9IXy6
	Sfhp8IMzkso0L5JpOE/SjFP4KfoEdK9rpLzb0G6HFjLUzvqShHycbq+SJPQwWFD4
	4VxgKlW6UcLj2Vyv94Tr5mMS+lhtUp9xhEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8jmrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 10:21:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e2bd0791cso77882485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 03:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760523669; x=1761128469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dP97dQ4/Ne2ggn51GfKBhla/pHyI5MAPVYs2qwgs850=;
        b=aSKzh2OPQGgkWaRcKzBXHX0Hxu9YnTxOwcVyuR7ad9QMkrpillGaeAjADG70S4S0GK
         XrpzThaGRwDlMsDvEnfGpM6Qp/qzLAJ0LiNIcrKGkymkHioKQxOqRjUuRk+eJ2GScGos
         l1b875fjQQ6Qa7GfN44bZH/kAyzztfPnMkdSIplggRHCi/11eaXRSBdMCNXQmDVXqklf
         Bd7zgEX2Ai3T1R2smUDc+dh8Ut49MyYVp3s3AWkk4iF37lP1KqdSbucJo4eRJsPWSJT2
         Z8U0FD2ZXrRcFH+rhqI4bKF9e4ONaySR4JSWAIkV4Z3MLfy+uUQ/n63716/w9tvQBQIj
         Otgg==
X-Gm-Message-State: AOJu0YwhZxQOXaX+D+wLOh8sR78ptIKvwY9J+TikqFjZlbreCv0Z/kOX
	RtGwaEBqVvYoG/5k1c1SxvhjQt7J9RSrXYaNQ4zokkTVtFhBjD2yLNgf2naB7cg+vvxfrnko7Xy
	jxEdRktWjJc9fXCXg0S5HF+RnEshK3r+0Xl3dXRe98AO2Du6p5Ct7xaJKbWSbJNQxMiGnEhnFPx
	pq7yJheNGgap/o+8k=
X-Gm-Gg: ASbGnctZZCAZIoAnZPJ56AGZwqzwLK4w3H+PXQlLTruVF3XDHh2xwQtKfw5CURzKwP2
	d4GeHrJP+CTr0PcTc0sK0ZtcvRQHUSxZn6HMydP9ML2PjJxJgP7XtQXsE8MExK/ZfAn66llwSuU
	p5MtdjIx5sdmqhdO15bdXxti/3AsuIu+NlPlwr2Bej7yssPHF/XtnjwqexD4HOkp7LrXeUizNzy
	64nhN76qgGs/KKkxBYN/GKnakC2eNtaEyKMVA/d647Y9o1IIi5VzPfbjpoWPt7Z6n0NVHcmqUju
	Flj79nMYGZUYHcwAN6RP1VhtLJ1m5Wi8VpH8Kvv18iNKs6sL8NM49NOOSd84RHgz7h7rG17yo+F
	qxzTL52vl4di30zRMA5ajh+IpZFqIDLiXI6EC2Hi13qTAkYqLZZv0
X-Received: by 2002:a05:620a:458f:b0:84d:f2b:ae92 with SMTP id af79cd13be357-88356becf3cmr4042087385a.64.1760523668717;
        Wed, 15 Oct 2025 03:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1WuYIPeM1fLVDrOv9kLeagVBT4b4qwfyfEufVC60yrjn0mhwfo4QasAyD5dg6IwHRnOBx9A==
X-Received: by 2002:a05:620a:458f:b0:84d:f2b:ae92 with SMTP id af79cd13be357-88356becf3cmr4042084285a.64.1760523667903;
        Wed, 15 Oct 2025 03:21:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563b3csm6099405e87.77.2025.10.15.03.21.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:21:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] mesa: provide glx.pc
Date: Wed, 15 Oct 2025 02:28:08 +0300
Message-ID: <20251015102106.1275981-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sWMvluS7wdAX1EmU5c7hsgx11hwh-XkU
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef7596 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8
 a=nGXyDtgPZ7kfGM8x6SkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX6Vof5uckRm9N
 +HDTVAEvd0O/0GK4feo/7k1fu7A49Wy0h1EWfniMUjTCp14BIbtQT8MdAye3LEZMg2739lrE3Gr
 qxspTrFXSa2j85J/gHiUZ9haFauY8yYA+PI/SCSv/XcMVZNwPGh8m7cOcSZToZ9b94RMAj85PHZ
 1+eKHIY32XFBAe3dB7mV65Cpl0Lh5BcM10UGZ2JwYeXE0uQmtkqeKg4o23owN4aLdU+cYbS4grN
 ozczWw7iSrQAynOKykwmJIpu9jStGyeT98bDBOW7JRfSqptAJxp1vjJzlgQ3hJPDTNWDOKL6cn8
 kVp8P7+GEilcNPLBU0qGpg58H8QIEoctN35uz3A/mRGh2z6F34aaNHSNJWQ3BlMi8zha6gj+Mek
 2+Pb7QmWDExHwWlsWK9mBORnbhz6Vw==
X-Proofpoint-ORIG-GUID: sWMvluS7wdAX1EmU5c7hsgx11hwh-XkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 10:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224890

New Vulkan CTS 1.4.4 started requiring glx.pc pkg-config file. Apply a
patch adding one in order to let VK CTS and other programs find Mesa GLX
implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Changes since v1:

- Changed status from Submited to Backport

---
 .../mesa/files/0001-glx-provide-glx.pc.patch  | 41 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch b/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
new file mode 100644
index 000000000000..cb634690591a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
@@ -0,0 +1,41 @@
+From 4fed044aaed5911fdc58d2a634f34a7186836935 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Sun, 12 Oct 2025 23:54:25 +0300
+Subject: [PATCH] glx: provide glx.pc
+
+New Vulkan CTS 1.4.4 started requiring glx.pc pkg-config file. Provide
+one if GLVND is not used in order to let VK CTS and other programs find
+Mesa GLX implementation.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/681c734804b1dd251606792be4187942dc9ee18]
+---
+ src/glx/meson.build | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/glx/meson.build b/src/glx/meson.build
+index 04fdf26ba6a2..28313f83a783 100644
+--- a/src/glx/meson.build
++++ b/src/glx/meson.build
+@@ -134,6 +134,18 @@ libgl = shared_library(
+   install : true,
+ )
+ 
++if not with_glvnd
++  pkg.generate(
++    name : 'glx',
++    description : 'Mesa GLX Library',
++    version : meson.project_version(),
++    libraries : libgl,
++    libraries_private : gl_priv_libs,
++    requires_private : gl_priv_reqs,
++    variables : ['glx_tls=yes'],
++  )
++endif
++
+ if with_symbols_check
+   libgl_symbols_file = with_glvnd ? 'glvnd-symbols.txt' : 'libgl-symbols.txt'
+ 
+-- 
+2.51.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ee00214111c2..1485e0b7270d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-glx-provide-glx.pc.patch \
 "
 
 SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
@@ -336,7 +337,7 @@ FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h ${includedir}/gbm_backend_abi.h"
-FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-- 
2.47.3


