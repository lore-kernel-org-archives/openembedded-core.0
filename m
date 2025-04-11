Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26013C369AF
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.38817.1744409371935722318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VtV2/oM5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEnxBb019655
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OHh5UEUDLEG2JttfFRufY+/E1FFzxTGBOKl4vLF2DQ=; b=VtV2/oM5aACVPzv+
	m32TYfYNj3ALN4Cf8uE5ulRiDK1aB2ruzGBNMsQqcbHoknT9JoDAcwYV+5uX5KD7
	6dwCGqNIVJpoYSTTmZfl8LPX3BiMcw8snw1b66t7hjUsJv7s0cUf4yrfHuxkOe2F
	A4F0A8zsw6WzoRagsPdIKPfeLYteXJBeavfNpKaJUWKgFEjERrPnLyar5Nuw2I61
	7w+kCNGsP+cKjS5iyrf7Mvu1hJrN3WVgW7hUEWb5ql6phSm/G9XeJmkwmyGl6PvG
	R/LmELugHvS/Jef4ZkoV+41yDPv1IYLi1M4PHJyVk5Ec1JhvuI1AzdaGP9Zd8KcQ
	UFt/zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcruvb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f7210995so443041285a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409370; x=1745014170;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OHh5UEUDLEG2JttfFRufY+/E1FFzxTGBOKl4vLF2DQ=;
        b=wJ12u45ZFtrmCo0HutCd7BVYd3lS8RYxXKpWmL3L8GNVG0wo9oXBdCpIMh/z20/UZw
         OLlkLmAtjc/9pnR0qUScT72JbLR1LVyAezJLuxImHXM+Rl8G7ZoW96LytlhN0sEMd6ti
         ldVSrAevtmDErFL2hK5MoLSecwnBm2dGHAFR7qhf97KEroDxWDNYFF9dZkYJKhh4SQOr
         +WczxkslZepdnEVW1npOtgDM9MUAdsJDMfoCsjFjy94enNhhd/km7BrP5rJYNmV1GbvP
         40I7XIlYfagv6Ios6XAI6f8dwYKSvqqMh1HEtiTmQtH+IJUHySh3gBfvCg3vWxMkW8r/
         eTHA==
X-Gm-Message-State: AOJu0YyGDlOOcYy2IKoHm8P17NMZZuqrh5MrrwA4tLLfQqWK0/tH3+Ob
	HiD+Ol9HyP8cWlqFftcCORj5tEdozwk0FefM3/ygXKNCkLCi2AgvBHAK+QC05Lw6Bva1UZFQyQv
	NP4jtctMFlcKWv8TykvtcJDqdd1zLRKdl/Ay0T9K7pa8dXJLkcPmzgnDQstfmMeUGAPxpv5DHc1
	vD55XQxnD4iS8=
X-Gm-Gg: ASbGnctO/d7KjOygWhJLLpBP2hCOkuh4WB9kkI4njCOhXDJwkEQ8dRpOP2BRsmaz3/C
	Dx1cyP3ivrnr4dJxcyPiKN0HWws2nzSPbfzhRDQIwvPoZ7w40YaS1qHjqcd3+3V9XUBsMOUF69X
	tMljiu5wMi02Z5LvgPhlILdgToiAJb1kwTQWK0hU6+Q9qHJbZ4E+fJ1gMGYnZnduWPcwX3s6CWF
	5xzQP2LTGxHFxwuQEJti+RACHOglR6t6PyEUEcuNDElHaTDSn2/axo56fyaopGYxcr0v+iWK5RR
	M8AhqsZhH046ttGElK5YfphWBJ4n/ILQmikHY4wa/8wGMVvL1NXAqs/fNlbb6TZgZ82ycbyBAc1
	xPn8JAA+fwRxfyTeQ/CzwFLQG
X-Received: by 2002:a05:620a:448d:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7c7a76b9727mr1150225285a.19.1744409369856;
        Fri, 11 Apr 2025 15:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPCN3Diwy9Fd+NMCR0+SR63Miav/vIbPU0upsojmlK2b9ZifXYfywjXSTstfZistfZ0YqCRQ==
X-Received: by 2002:a05:620a:448d:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7c7a76b9727mr1150222485a.19.1744409369461;
        Fri, 11 Apr 2025 15:09:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:15 +0300
Subject: [PATCH 6/7] mesa: introduce amd PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-6-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vsyOLZOy4uVPnh8nGac255CSvcUXmOku9CDPcoILehc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMHE1gIWvlSD1ZzJ2X6N3henIB+mLs1GMwVp
 RajK08ELLaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBwAKCRCLPIo+Aiko
 1W4UB/98N6cxnC3+VzO7SXLgJZdd5XLE/3N3DF4w+HvySOPzkWFOcM6UFWvS7uuDiDsUpLx/ZpG
 +NsFu5yNOx7N3hvliD2UBOuWLy8MOMTq2WaJMLJLlZcxrhmkpK382RZI1o9c2VlgStAy8OX8ZCn
 gzCTdRXrf3Xl0Qc+pM4gPLmMPAxVwQDLTF1u5quXhh581hQTD5jSA7oib9dE3ulJq0ZX6WwWelp
 k0/MNOr8exLSQglcRCG9mvLkg3HcrfFI+08UY0LzhZnYH5BOus+uJ/U/ceZKtHGPHT/GZWH9pof
 NtBW+5z8aG+WM7tBWQ9tOJmf23aODdckqHrSzLl6hUYPtRqa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2q7tDn1dZPI5OGFTlKkn91DDBo2-F4pM
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f9931b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=N-1FU7Ib_J0BpY9GTPwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2q7tDn1dZPI5OGFTlKkn91DDBo2-F4pM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=939 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214768

Follow the example of other hardware platforms and introduce a separate
PACKAGECONFIG knbob for all AMD/ATI cards. Enable it by default on x86
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1b758a28d38b4d2d02df501b8898fb7f2f5e88a4..8ab9af9887ef567925563247b88d96aca3fcfb1c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -88,10 +88,10 @@ PACKAGECONFIG = " \
 # skip all Rust dependencies if we are not building OpenCL"
 INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm r600"
+PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd"
+PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd"
+PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd"
 
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
@@ -101,12 +101,7 @@ X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xra
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-VULKAN_DRIVERS_AMD = ""
-VULKAN_DRIVERS_AMD:x86 = ",amd"
-VULKAN_DRIVERS_AMD:x86-64 = ",amd"
-# i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS_AMD:i686 = ",amd"
-
+VULKAN_DRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',amd', '', d)}"
 VULKAN_DRIVERS_INTEL = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST = ",swrast"
 # Crashes on x32
@@ -174,7 +169,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink',
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
-GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
+GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 # llvmpipe crashes on x32
 GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
@@ -184,11 +179,11 @@ GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
 # i686 is a 32 bit override for mesa-native
 GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
 
-PACKAGECONFIG[r600] = ""
+PACKAGECONFIG[amd] = ""
 PACKAGECONFIG[virgl] = ""
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
 MESA_CLC = "system"

-- 
2.39.5


