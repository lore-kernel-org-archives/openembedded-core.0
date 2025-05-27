Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F232DC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 23:49:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4213.1748389766266108770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UQbi1ol4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJpRbv001593
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WuRD6I22UMwxymEo1ngEx1kHQL7Imbhp0mT
	f5wUf7DE=; b=UQbi1ol4tU25eXQWD05+8TRPlh13BylCFxEBGv4xY4vlYR3wYMc
	p8vtHresVBlrEJuxO22AhEdwEm5bOIzebgM/p97IbRUBNpkBIjh3FHXy+yAwRHOb
	Z6iwUHZUFa1sFyKafwoggPgDPXMz3UewbU+8SCQmzgWf1RaAIKtL9agznfRNanNe
	3TXUpuFuDKXhcn1zT19oAkJdxqBiN9IYgzR2D/wjh4NTj+JdOXnG2O1kiXaK+SKb
	NdN7pf/7/NT9d/+d5WJXgSHMdyectpPV7VXklAtTKGKSgdnQ0IBtm7jdslFvPIFE
	H1AkVdczJYWAL3U59CSkYwwBO8k4l5B+C+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjrhqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:49:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f50edda19eso57508696d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 16:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748389764; x=1748994564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuRD6I22UMwxymEo1ngEx1kHQL7Imbhp0mTf5wUf7DE=;
        b=Wh2X5Iiji3yM/XUgPOmjfPvyFvZFDHvzSTDwr/feEn/9AJdJ4UhWcveNlN8XVxGtrp
         4FQp53JV5C+QaGyzqkV/GlMqgQpaN1/fbTzvRnZl1QCZIjG6CII2kNoiO0ZDg52x6W3g
         XBTefDTLIobGNwQRb/IQH35/Nro0e2PBTTFyeT2NU2lcRnJ2Ci2b8VlGK2IvkTeCPgLm
         KcYDNW8IBNlxUsFL+Bvo+aAeGxiGwXDzVHsXuBQokVQm30tCSN9quMlb0KdDl7RfWxHK
         QZ6x0Qlj9Yc1b11+YWxj9X1XD3LiC+q9BrCfQsB8QhY4cv60Ece0plcrLsajvPLuUsiQ
         9lsw==
X-Gm-Message-State: AOJu0YwwXzW9bzj6qOiTw1w3Mv6KANCDPjmYH1I3iZRNq0vAgIViZpTy
	L6QM4/G+ts1SOUFMlZ3D6dBZn5gUJWpnhkWh0q8fqaaIvR97MMZq6JvKuUFdB7KBDy2KAyWwuVm
	lUiA5tJ7A5/f7qO+suG0JN+HqnVofaOKSajk9rHD91FBGEgCSgDdBcz7rfFfgC2tWGbCf/w8SUb
	ukP8sLj498LzSpX1o=
X-Gm-Gg: ASbGnctxwBRvqJ3IUCJy6rXtvvUweq6L/BPlhPLgIKc+XP+b7tpNG60zO+33twStc9R
	1dkRFagX5KRwibx4+XGDW66aHZkdbsj/FkZG/1S2JOj66YnnDSRyO1tZIBCRlEsRVKl2j8rBCgv
	h50esKD2xXpUyr+SvdCHv8yUF5mI/dNBxuCMFfpqBYDQW9WmFRXbUf7z9vTQaZ8mLIwvOoPMlwj
	HTXhHt1o6QBpyitoUCyfGt/2kvD7mM8lR3NX41hBcxmCAX7FSflL5bWJupVX6z8gdtAZB3B0Z2w
	lQ9ImxsTkkGFFpTSzTKeeo7YkdS05F3ZIBSNewpQE/Z9HDbu8olpwL0j/SsYwMkFu2NLM/TUoUe
	5PEvX0njayOQuw3MpBnCRa8wb
X-Received: by 2002:ad4:5943:0:b0:6f4:c602:806e with SMTP id 6a1803df08f44-6fa9d00c0e8mr209359676d6.13.1748389763734;
        Tue, 27 May 2025 16:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpwWECxIB7HPkJMKMdlwGHYwuor7dmdlDXebKILfqbkVQQpHAHv6w9lSig9/2ciEO4tgTHhw==
X-Received: by 2002:ad4:5943:0:b0:6f4:c602:806e with SMTP id 6a1803df08f44-6fa9d00c0e8mr209359356d6.13.1748389763187;
        Tue, 27 May 2025 16:49:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a674sm11797e87.152.2025.05.27.16.49.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 16:49:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: remove XA tracker support
Date: Wed, 28 May 2025 02:49:19 +0300
Message-Id: <20250527234920.263235-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68364f85 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=EUspDBNiAAAA:8 a=ehEfqPk3yJ9WtfAccZIA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-ORIG-GUID: w2QeR3kEZ71cvA1od_bK7LpEW2kfMufK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDIwMyBTYWx0ZWRfX7Sfyx8OlPsNi
 5D6cW0B4Jq0is2jq5ENIr4YlYpx7HuieHQ1dNQWs1GFLqLCR8X1oHJSXFWpNnRPnkgR7feovv2l
 tBQoJ/DRMkF7DXFvzUJssUJeYmBv47wxPGhqaaxpINueFtYsYJxIghyiuu8KeeawFrtKO0dxymO
 gnOfCDqOeoR/hgOcNNQnzZFuhWjwnj6ri8y2qsY1zmyURWmMePiXQWzJ4NZbsv2uq/BVTPOXvSA
 2RBfWZhj1lTTipC4Io4ddYI9OM9iqFO4sbYU9Ng1ERs2NLXlEaiHWb16lYT6XcDmhGD/JfHjUgE
 7Sek3jyCB9yQNrSwuxaJi2lC7GU8FNM0ei7CY44QKUtmLeX1kIoxdQX5BBNXcXmiKEVhbzReCIQ
 +Rytp6vlpcHaYLWlZFfZASZp7EJ5Bv6o2GpH+J86aD/qyQaRdeHu+/R0VI2kPOA/DI90Iscf
X-Proofpoint-GUID: w2QeR3kEZ71cvA1od_bK7LpEW2kfMufK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 23:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217323

XA tracker is unmaintained and deprecated. It has been removed in 25.2
branch and it is going to be disabled by default in the 25.1.2 release.
Be slightly more proactive, pick up the patch disabling XA by default
and drop support for XA tracker in the recipe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...01-meson-stop-building-XA-by-default.patch | 33 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  7 +---
 2 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-stop-building-XA-by-default.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-stop-building-XA-by-default.patch b/meta/recipes-graphics/mesa/files/0001-meson-stop-building-XA-by-default.patch
new file mode 100644
index 000000000000..4372675952eb
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-stop-building-XA-by-default.patch
@@ -0,0 +1,33 @@
+From 31a835dd2573c17d77efa8803c7fb28e0d58abc6 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Thu, 22 May 2025 20:11:46 +0300
+Subject: [PATCH] meson: stop building XA by default
+
+Commit cf40099730c4 ("meson: deprecate gallium-xa") deprecated XA
+tracker, but didn't disable it by default. Thus any attempt to disable
+it would cause a deprecated option warning. Flip the default to disable
+XA tracker by default.
+
+Fixes: cf40099730c4 ("meson: deprecate gallium-xa")
+Backport-to: 25.1
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/31cf6b94ad1dfaf4272b22a39d7e2805d03f9375]
+---
+ meson.options | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.options b/meson.options
+index e6c9567ade86..a56bcef6e2ca 100644
+--- a/meson.options
++++ b/meson.options
+@@ -127,6 +127,7 @@ option(
+ option(
+   'gallium-xa',
+   type : 'feature',
++  value : 'disabled',
+   description : 'enable gallium xa frontend.',
+   deprecated: true,
+ )
+-- 
+2.47.2
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7c067420c12b..75467fc856ce 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-dont-build-clover-frontend.patch \
+           file://0001-meson-stop-building-XA-by-default.patch \
 "
 
 SRC_URI[sha256sum] = "cf942a18b7b9e9b88524dcbf0b31fed3cde18e6d52b3375b0ab6587a14415bce"
@@ -197,7 +198,6 @@ MESA_NATIVE:class-native = ""
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
-PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
@@ -253,7 +253,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libopencl-mesa \
-             libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
              mesa-vdpau-drivers mesa-tools \
             "
@@ -345,7 +344,6 @@ FILES:libgl-mesa = "${libdir}/libGL.so.*"
 FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
 FILES:libopencl-mesa = "${libdir}/lib*OpenCL.so* ${sysconfdir}/OpenCL/vendors/*.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libxatracker = "${libdir}/libxatracker.so.*"
 
 FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan ${libdir}/vdpau/*.so"
 FILES:libegl-mesa-dev = "${libdir}/libEGL*.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
@@ -354,9 +352,6 @@ FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL/*.h ${libdir}/pkgconf
 FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
-                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-                          ${libdir}/pkgconfig/xatracker.pc"
 # catch all to get all the tools and data
 FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
-- 
2.39.5


