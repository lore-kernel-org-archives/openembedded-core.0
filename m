Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B53BCCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 22:54:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.28564.1760309643775644692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 15:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UQYnOjc7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CMs3nX009043;
	Sun, 12 Oct 2025 22:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eaW6H1DstfTEhrkBoaLa5dsvsdexbLgBOwN
	Hpdl0osc=; b=UQYnOjc70uoqNnsTjWlaKhRmOU09UAHeb+i631LZePWjJidOQ5V
	E/vW03QLl1RFSQsGedvw5LRafIL5XMeOkg39JQqFDA4A4ZU4m9IJrUVAvX22vmgI
	HCrr3NW9rljckVXwnB/G7W+MeYZb8Ii/FIlU5fPl1h58HmEtcVbUbnxRLKouqOid
	1ExtuZVny4zUCDT+bFPvZ5tDNcm1+HWNfN8cgauYXwbomWBgkNuLn1pa9LifxUZ8
	5/kFT3Z8LVkyzViY97ie3rBQaHu8weNnpJqI7H5YSS9yrsiMtm3I86xGO4WyrMdb
	9/iVNSObOdgRU+h/ga4p9R4sUIO2DZKeGXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfby2p21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 22:54:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-87ae13cc97cso2357910485a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760309641; x=1760914441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaW6H1DstfTEhrkBoaLa5dsvsdexbLgBOwNHpdl0osc=;
        b=MnFNhaudI1S/z9P//s8fPaqyVjgsS17z/YJw2F+CRjoS7vzJNTTK+iJMCtoL5Yg/ky
         Y2YjVtux5QOKuFZ4uPN2zeS0zK9F9vxjTJs48FLeZMTIcvOURjsPoPyKjRcBxQIRfSST
         zm2VG5z4337pIspXC/HlATcZnOZ3Sxs6lFBOiEDtFTvj489lUszWI3vEgmJpc25XCdop
         lurq4m0BE06sFvalvguR7eY6m3rzsWBwCW4+dGLKVhbD44Ym4kGdmBZtojchkiqKR1SZ
         ZCZvjxvzwgWtuRUY68KI5gFlPPpVEArrvnXzEHGZSzUMSq2F3PYaT0WiU5s25GEWFKe2
         sIpg==
X-Gm-Message-State: AOJu0YyDyMfh3oyTpMRitxf3nPFZp7xuuSitw+Dyz//nyfIlFTk8qCgj
	ejkf3vd7Tq20NzGRdFvpJXiONQuVHcs8sGtjmrq2ucUtDnx1Gn5REcypde26vVjG5gGDCUeewDl
	iPl6Aes4z4v93WYWEGnC9ivej7G2JbP/DIyIFHmTNA3UqkZl4EEjk+T+PaqJ1garr4GcmyNJf32
	x07J2cIeS6Y9UIYh4=
X-Gm-Gg: ASbGncuOrpr+fw4HmMiAz/zVmDYg2poTtlFZawEZAmzs/s4/+cyo80zGtoMC8WIEX+B
	ggN4nlhzwxBfmU2O3qERPoqinaKxeybetDZQRYnwva4xmd7kUPnZ3eyoWKtKBEs4qQh5su67Hdj
	i2dYCpdH4PEc57Zuyt2/AjJlwWGN793ClpFWZ341vw1ZwustL2cfN6eV8QbYYhyozMjkeoFuSWr
	DT9LhrHmH3dFlgtuGF6GQEon4e5tuEnGNE4R1yimlUxzE04quyoTVjyQDkbzYl4Ru31W7hPuTWx
	gONKw1DH0UlgVkGk0/TMXsNebGTDVAcSbj9fGeQJYBLhSdr3zCddxVsD90bYMnQ2hY0nZWbJnF8
	DX2LQw3r94/44lL03S2sLQneXQQrZlZlJV05WdsonhecnGv0C8WNw
X-Received: by 2002:ac8:7778:0:b0:4e6:ee71:eeac with SMTP id d75a77b69052e-4e6ee71f1eemr156301741cf.26.1760309641462;
        Sun, 12 Oct 2025 15:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAl1mUDzFDs0I5VYYdLwNFOtxRKbRSrBXXnDnArUEuDqfjA7AJMKyjfP9SxWaEI8Lf5BAmGw==
X-Received: by 2002:ac8:7778:0:b0:4e6:ee71:eeac with SMTP id d75a77b69052e-4e6ee71f1eemr156301651cf.26.1760309640863;
        Sun, 12 Oct 2025 15:54:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590885784e7sm3423648e87.111.2025.10.12.15.53.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 15:54:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: provide glx.pc
Date: Mon, 13 Oct 2025 01:53:58 +0300
Message-ID: <20251012225358.767916-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7DUUZKI7SAiP
 1AxaexuGp0ywld0pjewdqCxSPCui9AA3FrKLbxKbT8fE5kWmYrCpHTiB3X45pb/dsswSqE7dRzA
 ZMqyMfrOWUzgY+KfAGsQeAUS9e+xlm/BdW62dDCl2AN3l2PR+uOua80fT8d6UWJt9bP9FZQCXA8
 4fNynTbVY8z/ZGU4UJgVWXkMiTKom3AQV3Cj5pOKw2rsN35xbC5yAT90puCW19NTac+vM/hQPE8
 8reK8PJs2u5N+guhDzFBhALQUfLsBQiZeMkS85Oai0/yifyNYvkMGl2vrTg8MJU/bQyall6uXdX
 mCZPH+PptQ7yBFhcebQ4W3j0/vJkxOfv4awa+1+f8kwGXL5H/wkP5Gn0HiQdnXNx1IANVwgQCDy
 GT6YtCk4T9ynOBwjyBGfCp3Y5RIaWg==
X-Proofpoint-GUID: 24MO2rzGpZmD66KIPe_CKquIHiJ-PHBk
X-Proofpoint-ORIG-GUID: 24MO2rzGpZmD66KIPe_CKquIHiJ-PHBk
X-Authority-Analysis: v=2.4 cv=A+Bh/qWG c=1 sm=1 tr=0 ts=68ec318a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=nGXyDtgPZ7kfGM8x6SkA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_09,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 22:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224750

New Vulkan CTS 1.4.4 started requiring glx.pc pkg-config file. Apply a
patch adding one in order to let VK CTS and other programs find Mesa GLX
implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../mesa/files/0001-glx-provide-glx.pc.patch  | 41 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch b/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
new file mode 100644
index 000000000000..dbe58fcc89a8
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37834]
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
index 7046deeb2b63..c567cfa3edfd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-glx-provide-glx.pc.patch \
 "
 
 SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
@@ -334,7 +335,7 @@ FILES:libglapi = "${libdir}/libglapi.so.*"
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


