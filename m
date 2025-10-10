Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846A6CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:07:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7668.1760098055618340356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bYaJdKjv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WkfU006204
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KqOu2lM8/iS
	W6uwxHHgNdwMhcVxGWVZSmYaLcyGVFmE=; b=bYaJdKjvD1bojEF+uQ2dMdsrloS
	LlNEPc2XlMpeaS2Zc4N3xjKBV7JI9nH+T4nsqr5NaPHzkaOhUCT6fYKsEbMGfOKq
	vAmBkIRqj3w/7l3ecvhoAt5x2/f1uXuUxgV2ipt/0B3q9QC9yfwNTEXp5IphG8T8
	pkNMR8YHOa1TZhVLngoViU8U9rV0qpLFmAeE5zs6Vy+0bD0ErcxarrSL8TIvJKfs
	+3hH2OVV3SI1I7Q4+896cgYJzQuhleryzy9A4X/EHO6VsB8eSnT1ZsE4zncEXnPa
	r7zitoWpXWwMrjsl/KReinshssJy22d4MqgG36wfQG6aK9zvfawl1CI9K4w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sp968-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:07:34 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-43f7bca4765so3724904b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760098053; x=1760702853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqOu2lM8/iSW6uwxHHgNdwMhcVxGWVZSmYaLcyGVFmE=;
        b=LhW8SVpabvyV/F5Y0epMpvbuClRA8lIiYdcSjS0OWHC9b/kVCBxv/bbaV7o9hpzF5t
         ijksFJ4Wei7vLepWsKj9/wv5/gX1P5TUNWP0xjHXfqMkgcAbaVqVeSXfRKSPyrdJjIkC
         83LN2akJgdhWuWuM3Mbs/hb9Tyt0a1JWqCNSZYtFiMxseyr+kWi1Uqqoqy5emuL8Gb+q
         Vp3YcU7ZOCsPlBNB7pH+uFevUNvbtVgbHkytOeZS8xBd9VHH63AjQVcUvPqkVB2iTDmE
         9VLEytbaQq/Wn2pCGNTPVr+uWxbVX5s6JFdf9K5l3/N/gxUKrLImqRDM/BKVgKaZM8jh
         RwGw==
X-Gm-Message-State: AOJu0Yxmzh+/2DWS7D3DkkYyQxe0rm2eX5/B8JPqBUTDDRzecWVQhMOd
	M2pcoKE4nc2MpxU0xwzuv7SIX9vgJvgBRfz4q1lP/tGIvf43OYeeYYBeZvt7JhBokfSZW4VeXqN
	2SmLQLW3NLoO2/E5CNv7SC+qC+S5fqybAv2poC+PE7yDHI+cUQcnU4g+kXfygc+Zz4IGYVSU5BQ
	gjJ9TndWyO6DLhg8I=
X-Gm-Gg: ASbGncue7fx3P5xYnNGFb5AoI3IsFMvfqoQJvyB60UCaW+1YJ1TNuX9+cqBbMMCFpf3
	lDlFOGQzAeXZY47PO71F8qT+yKVKrWwvddo+4uu8umRj4p0qiX1zIdu4uSCW5DuSYR1LL6LUAu1
	VsWXrbw+dzYpTlMznyxnVGXpeI4chHKU0pNxIzWEokorOEy26D9NeVOeWDKG+VbagCWZwY2L8Rb
	Ij/VWZv1NruMv3YDfSu111mPqAa0DTR1sXzgEVxAYmcU0rk2EXs4/bT/W5M/hWgWku+fvg0k2B+
	EBvos6rX1r606gicL8IOX+LdgY0faxAkD7WSbW/abWibPNY1MQhLDdXHB7ugT/XPZjXvNel+4vs
	CMSVqPdUDat9sVJPatceJ0sv4c6jgLKUtCpTHALZDAVqPk/2Ha0SM
X-Received: by 2002:a05:6e02:1aa4:b0:42f:9883:c1c with SMTP id e9e14a558f8ab-42f98831109mr44785375ab.22.1760097696154;
        Fri, 10 Oct 2025 05:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPsUajl2fxaoNiIX18UEbURRAzoHyVzt5ednWzAYZ7gyrJHFhXB4i0V3UAWlsvKUi4+TMfdA==
X-Received: by 2002:a05:6e02:1aa4:b0:42f:9883:c1c with SMTP id e9e14a558f8ab-42f98831109mr44784715ab.22.1760097695565;
        Fri, 10 Oct 2025 05:01:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-376350710edsm3603321fa.1.2025.10.10.05.01.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:01:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] mesa: be more explicit about gallium-llvm dependency
Date: Fri, 10 Oct 2025 14:59:50 +0300
Message-ID: <20251010120125.2868011-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v3zB1OHGWQXYNd0IkvmqVZ29-LVYSbNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX71y6t/IrNUFT
 7d86UML1uY0kh8cwRFobwss3S3+JNUHkh2IgrYfAbBWrKPV2+f9f7/v+u5um8cGKDu0zhwBQr4W
 1OL4KefhekSp8m+ujpzS7SDiEVttcVhtpE2M3qux9wfaHkU49m1mpZPoVUF3hGgORxdemlyxuH9
 TPoydXFrvlwc7b6sK2OpwfIsWE2DIivv1bOG3MBD8LIK3SpMvbBdPPgFcGwg/mI29UgeivgrqZk
 aj3jT03jOmv56SD85lmUd3VJXWHu1sMLWTOWgdsSK8h8XQ5AXFbuWUxvCdl+QbLX1eI/6S88SbA
 CD01tgnuQv2OL1RKMl0gy6JZpMn+aEiPY1lK3h8y8/6ZcM1kAvtbblkF+tjFi0FE/tBXmnb7oJ3
 zCRxpXHHC264qx3TagOfa1O9RN6gGg==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e8f706 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=WGT7DFx9atw8bQ7Yt7UA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: v3zB1OHGWQXYNd0IkvmqVZ29-LVYSbNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224684

Historically mesa recipe had separate variables for drivers that
depended on gallium-llvm PACKAGECONFIG. Since that time we started
listing other dependencies explicitly (e.g. libclc). Drop the
intermediate variables and make the dependency on gallium-llvm more
explicit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5716243fd242..30bb512fec35 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -81,18 +81,18 @@ X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xra
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-VULKAN_DRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',amd', '', d)}"
-VULKAN_DRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc', ',asahi', '', d)}"
-VULKAN_DRIVERS_INTEL = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel', '', d)}"
+VULKAN_DRIVERS = ""
+
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',amd', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST = ",swrast"
 # Crashes on x32
 VULKAN_DRIVERS_SWRAST:x86-x32 = ""
-VULKAN_DRIVERS_LLVM = "${VULKAN_DRIVERS_SWRAST}${VULKAN_DRIVERS_AMD}${VULKAN_DRIVERS_ASAHI}${VULKAN_DRIVERS_INTEL}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 
-VULKAN_DRIVERS = ""
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
@@ -147,23 +147,22 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', ''
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
-GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc', ',asahi', '', d)}"
-GALLIUMDRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r300', '', d)}"
-GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
-GALLIUMDRIVERS_NOUVEAU = "${@bb.utils.contains('PACKAGECONFIG', 'nouveau', ',nouveau', '', d)}"
-GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',radeonsi', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'nouveau gallium-llvm', ',nouveau', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 # llvmpipe crashes on x32
 GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
-GALLIUMDRIVERS_SVGA = "${@bb.utils.contains('PACKAGECONFIG', 'svga', ',svga', '', d)}"
-GALLIUMDRIVERS_LLVM = "${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_AMD}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_NOUVEAU}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 
 PACKAGECONFIG[amd] = ""
 PACKAGECONFIG[nouveau] = ""
 PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[virgl] = ""
 
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
-- 
2.47.3


