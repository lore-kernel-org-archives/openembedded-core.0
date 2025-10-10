Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A94CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:01:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.7524.1760097713872938468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Or68XODF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Wnxa005975
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b7M12zrxQn1
	MiZjC1FKCNrtQsFmFQFG3nWD0vnQxuS8=; b=Or68XODFm1hs0PR5H+0OndWkx4F
	ovdDtZ6VI9EwQV3Ph3H5XD75hYUzVNpL5IKKB7KYcV3sbG2zJNHA2IOyp9glDypb
	0Oywtqf1HC3LfDYrHebMy23KJ8u7jVxZ2lK6HhOQAd+kXle9fkUZV3/OcdMpg1g2
	9myXDwM1gxrw/KuKPLjZVGxk6qx7fm8ctRA2f24oKTz/4nS71ZbKtxC36W8NesUc
	zyBZRwc1BjlGqLX44IGm/sJQlBpbaPv3qtwvPwi17+T/cdDm9PqvW1jGvknZu9Lm
	8lHm4gS6stJ1ee5liS3mLkYmbu72cyfD6BvYQfu4jZ7P5PCYx/YIMPtSjhQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j69q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:53 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-42486b1d287so107337225ab.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097712; x=1760702512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7M12zrxQn1MiZjC1FKCNrtQsFmFQFG3nWD0vnQxuS8=;
        b=CODFpyNNZKtIBjlwDTETvoZi46yhtwWRQOy0JNNBEexCXmjI7uQmrqHDPAh2sGsjas
         VKoRfmAb0SiCUsgHhU0wUJFGHz0YVpzqxTmp4Jds7gNihut0a+Emq+hhbVW1EnL+bbhB
         kGT3Sr0GqfFL6qqgpXUzzKjt+S0vIhm+0go2joz9z0seQYRCE2PMMgrnHSsBUncq06t0
         vPkmBQf6r5yhxkU88+b6f/7zdVavvGT8g/8j3eXI7tP4XOuDsUR1V40yk31k0+aNazBQ
         gtYL3Xh+/0/xJqJcITHyRFI8Xj8dRjmSNPEnzwAgoyJCQ7oiMQBI8yq1r3B7OYUCuSfL
         gAhg==
X-Gm-Message-State: AOJu0YyeK333nvWOVNxuerjJuFog6JgvUIG+eKV0lvrRELLQgGR3f/3J
	CLEWu5vz/+xzSmxAiInY6KjncIRt74qKXy6xGuDMD/Ox/9e2BfbdbLZC+9zjY0Udcy4WXYdOVhs
	B9hK2s3h2Unuu/cgYF4V9xRH5bDk0sXOg1M/zKhk+BfTdUXacRZTSABsEjUrpF/Y4sIflb9O1g0
	92G8N8QCg7XLGM5BY=
X-Gm-Gg: ASbGnctguU7zmO/sGqEJQBG2+RaK1WW6IdR09tWlxk48moEfGD2PM9Jzg5hvLVYCvN3
	T5VQV9QhaHdLkY6ECJep82bNYF6Wux/9iOqpjp4QPcRH8rE8g6b0leHA0K6J3swt2nyMwTi+p2s
	WPK6T7BsdoaQmW1U5mUP3jd4nMpZD1L/Dq2jMQqbrU0qaEFynY0YEXjZdy3r9HI4Wn05IzIHAtM
	QtZzhZMDVVB9uVNkrXwicpKTO3z3l3BTOzuY+dCTqxIvokTCJTKc0zjlN2whkJX+aCquGHYqXfy
	8koQwY/LFKNxbVkMcVzkt9aB+r9f2KhOuMO1gkbtAMyX+1EyU/Lkic55F5/nZ94mcHXnbMEElcP
	9k+5egKGyM+TvPWQC/TRyywsHsag+FYvyagx05YzbiP0l2v3+AV6M
X-Received: by 2002:a05:6e02:1d8d:b0:42f:8d40:6c4b with SMTP id e9e14a558f8ab-42f8d40719dmr89984695ab.11.1760097703066;
        Fri, 10 Oct 2025 05:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7bDydMEh2lc9xxKpumUxEeoul77Bq+RW2L7d13u2LybgStaQMSa9kHP2h2jJd3FLIgmECcA==
X-Received: by 2002:a05:6e02:1d8d:b0:42f:8d40:6c4b with SMTP id e9e14a558f8ab-42f8d40719dmr89977475ab.11.1760097697689;
        Fri, 10 Oct 2025 05:01:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-376350710edsm3603321fa.1.2025.10.10.05.01.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:01:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] mesa: sort out driver lists
Date: Fri, 10 Oct 2025 14:59:51 +0300
Message-ID: <20251010120125.2868011-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: if_Nhca2MUJ-3xws2PgG3zKYv90Em7CC
X-Proofpoint-ORIG-GUID: if_Nhca2MUJ-3xws2PgG3zKYv90Em7CC
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e8f5b1 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=vrsPe4y06Kqx-SXxpUQA:9 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2KMe5tzbhD3d
 hr7LlCjREMJHh0rEMNiUoiLRxTb7PxZObxfL3wdG6XyMAN5+HTg+RfPpXtsBxCtKzIdDudqGeW5
 VfsCnXlxIzmiZ4cUAbB26L0czs+OF9QRr4oH8xQ28oGhT0WtSC0/ZiJn9BvCt8mxOaJa01YcLtv
 5GGmtiQeb/dLRDKzUxK7/T1yXVey3bpY+F69sFdTeuQHI32yUPgJMWYDXXMYCJ/Ly7jWtmN9Kck
 VqbMiGGnh6txK+9IRPy+80MeB+L9x5EmU29vnABtfKO2tCz0TyRmt9SZCtat3ivF4Od08cQhpqS
 0Wp2rGwbR7nVFMybSJkEOs3eHQ4jcjMkLWm9UKiyOriFQx4/yvFl3dHnA+F3f2DIHUb1DC5sdah
 lkXMtL9eKeHtDUy57BR8utGygu4B4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224682

Sort the lists of VUKAN_DRIVERS, GALLIUMDRIVERS and driver-related
PACAKGECONFIG entries, making it easier to add new drivers or to find
out the correct dependencies for the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 135 ++++++++++++++--------------
 1 file changed, 69 insertions(+), 66 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 30bb512fec35..ee00214111c2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -73,39 +73,79 @@ def strip_comma(s):
 # skip all Rust dependencies if we are not building OpenCL"
 INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
+# "egl" requires "opengl"
+PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
+
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
+# "gles" requires "opengl"
+PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
+
+PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"
+
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+
+# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
+# Be sure to enable them both for the target and for the native build.
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
+
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
+# Entries for GPU vendors.
+# Some of the drivers might have extra dependencies (libclc, gallium-llvm).
+# Check them in the individual driver settings in VULKAN_DRIVERS and
+# GALLIUMDRIVERS.
+PACKAGECONFIG[amd] = ""
+PACKAGECONFIG[asahi] = ""
+PACKAGECONFIG[broadcom] = ""
+PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
+PACKAGECONFIG[freedreno] = ""
+PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
+PACKAGECONFIG[intel] = ""
+PACKAGECONFIG[lima] = ""
+PACKAGECONFIG[nouveau] = ""
+PACKAGECONFIG[panfrost] = ""
+PACKAGECONFIG[svga] = ""
+PACKAGECONFIG[tegra] = ""
+PACKAGECONFIG[v3d] = ""
+PACKAGECONFIG[vc4] = ""
+PACKAGECONFIG[virgl] = ""
+PACKAGECONFIG[zink] = ""
+
 VULKAN_DRIVERS = ""
 
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',amd', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST = ",swrast"
 # Crashes on x32
 VULKAN_DRIVERS_SWRAST:x86-x32 = ""
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+# keep sorted by the driver name (rather than PKGCONFIG)
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',amd', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
+PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
 # mesa development and testing tools support, per driver
 TOOLS = ""
 TOOLS_DEPS = ""
+
+# keep sorted by the driver name (rather than PKGCONFIG)
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
-TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
 
 # dependencies for tools.
 TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
@@ -117,54 +157,37 @@ PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
 
-PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"
-
-# "gles" requires "opengl"
-PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
-
-# "egl" requires "opengl"
-PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
-
-# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
-# Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
-
-PACKAGECONFIG[broadcom] = ""
-PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-PACKAGECONFIG[freedreno] = ""
-PACKAGECONFIG[vc4] = ""
-PACKAGECONFIG[v3d] = ""
-PACKAGECONFIG[zink] = ""
-
-GALLIUMDRIVERS = "softpipe"
-# gallium swrast was found to crash Xorg on startup in x32 qemu
-GALLIUMDRIVERS:x86-x32 = ""
+GALLIUMDRIVERS = ""
+GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
+GALLIUMDRIVERS_SOFTPIPE = ",softpipe"
+# gallium softpipe and llvmpipe was found to crash Xorg on startup in x32 qemu
+GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
+GALLIUMDRIVERS_SOFTPIPE:x86-x32 = ""
 
+# keep sorted by the driver name (rather than PKGCONFIG)
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'nouveau gallium-llvm', ',nouveau', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
-# llvmpipe crashes on x32
-GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
+GALLIUMDRIVERS:append = "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
-
-PACKAGECONFIG[amd] = ""
-PACKAGECONFIG[nouveau] = ""
-PACKAGECONFIG[svga] = ""
-PACKAGECONFIG[virgl] = ""
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
+
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 
 MESA_CLC = "system"
 MESA_CLC:class-native = "enabled"
@@ -173,30 +196,10 @@ INSTALL_MESA_CLC:class-native = "true"
 MESA_NATIVE = "mesa-native"
 MESA_NATIVE:class-native = ""
 
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
-PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
-
-PACKAGECONFIG[asahi] = ""
-
-PACKAGECONFIG[intel] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,crocus', '', d)}"
-
-PACKAGECONFIG[lima] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
-
-PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
-
-PACKAGECONFIG[tegra] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
-
-PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
-
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
-- 
2.47.3


