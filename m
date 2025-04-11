Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7BEC369B1
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:09:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.38815.1744409369424922165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cfyFErIo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEuQGU018718
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVTQVHxao+HHtAzHRjZwG1A3WANxx5vtsPNlpU8jrro=; b=cfyFErIotSFedrk1
	lf/GV5sbiS/jyc7uzleeIqH1e5iSpijc/fIkqcJlfryQWsXZo2t3IJYJFRexAhnW
	5Jaq5rbLSV/gauE8HKGG/i1fTUEfw/DhapjT8C95ED2lQhaB7Fdni9TkLx3dJlfY
	dwRrDTLUo9N02rvU0kuy0JolTdCk7XEFvgcdyOioYCxJLlJ6Mmh2FPfWah5zOwqH
	g+pM+I0Dlgxy6YgpHDpyCh5r7YHMjYL08/eAvgj6gWas2MnfNYOcd40RAqI8MSdr
	BKA9qq6x8KCbXdCfVTC8W3SOmR2IMtpvIvQbhgHrYIi/iIm05A1zyTV5HYzxY6jY
	6Akfig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdguvvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c579d37eeeso389104485a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744409367; x=1745014167;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVTQVHxao+HHtAzHRjZwG1A3WANxx5vtsPNlpU8jrro=;
        b=SS+U4iCI+Vtr78rcBLyy54Cec6PoUwwtcPHnqEgvq5XplQInAxHyRJDNF/7v4z68BJ
         ndEAmwSUCP4KblZunctjlh+c5Sf2HTL7ozAwRYq+erTZuBpTTXlhOE7psOmdx9Pu/dor
         rwsQ88uXjYWsUg0h6BqPXw8TA4gLdxJANjOzTqfZ4pTweusG3zJIKGELjvbol2uWcsro
         qtfTLbq6qndWXcBmDImTXOnmKzLVqcTVshrjVHfTcENx4irKvxYxShVYHOSch/aEEymV
         DUUVaHpL2Zzah7opyMyQG8bp4JurfmKVGAfiK0p17LM0wVRDLYHWk/LPyCtvUVjPctnZ
         A8pg==
X-Gm-Message-State: AOJu0YyIGzcEq/IP/DAn7+oMInQuAfuDazol9xg3QOmq8pULzRatmCwm
	vJfQyX2OrKV+ICc1aPrVu8UTfsWlM/7eFOkilTt+xuW7Ip0t+ZI8eU3XZBMjEOnRNVlhheFUb/b
	qQWTpunwfw0goDupu5GW3vAzHoY+U/kOZVWrZ8tg8/f/W/giFxxTWlaVZPV7N5duDey9EW8ImcO
	vz+jY05j+GDVI=
X-Gm-Gg: ASbGnctpyicVxsIjqoZhwulK2Px4EqFy7FInSSON4O2p6unc80JcJHKieV9RHCu6GU2
	R0Aq8IBDYuWc6XnWJaobb9wXrnuobnUYDQ93S9pjuYVpmE/s4rerfi9CeiI7IMwNPypk6wSo+T8
	z77YF0oEpHh5BJ4FIfJ4maZWnv8pLP/CiDESc0QUvGuHSbcKBAnKaZSV/nStK7hcs64GJxgeeYY
	BmW7Zwm4TAm3npEIgZEgec4zxEJsLP9PvfcRRQ1+Apagm2pt2GwOqSpYnsMM68gIML2wDtdqYg+
	uRuIYVf9WScjeqhnY/3w+tPDih/fsEhW0FirLLdpM1JnuQCC0PLq/4DIGMsIR3qBAoNU40EnI8y
	gO1C4ZA/ges8KRbH99E8FHaA5
X-Received: by 2002:a05:620a:4915:b0:7c7:b5e1:4e45 with SMTP id af79cd13be357-7c7b5e14ea8mr161632285a.9.1744409367295;
        Fri, 11 Apr 2025 15:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH66+dPKxmL6AAbK5KoFo/fbfOgdunMYiVubm/uZ10Ebtujo0lKaZ3Xd/CmdqDYsGSospRqzQ==
X-Received: by 2002:a05:620a:4915:b0:7c7:b5e1:4e45 with SMTP id af79cd13be357-7c7b5e14ea8mr161630185a.9.1744409366934;
        Fri, 11 Apr 2025 15:09:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm518432e87.175.2025.04.11.15.09.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:09:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:09:14 +0300
Subject: [PATCH 5/7] mesa: don't buid Intel drivers outside of x86 world
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-mesa-25-fixes-v1-5-791840391271@oss.qualcomm.com>
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fb/WV3aEc1HSGrpHmAgkF4nqjJxS0ORcv1IqVy6OXNc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+ZMHh/773kWC8Yn10BrIERhAFgysxv/F4R6aH
 fULR7Vlc82JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/mTBwAKCRCLPIo+Aiko
 1ebPB/9rakN4KpDKQjr16MdweLFvVWmux0Jgtvz2469XpEj4mXlx9lSDzrEj6qlgkC2F9HIw/Sx
 XXEiGAufbDkpfylLt/o/+B0cQLkmj4mctNffy3g3TZcTjCiigwAzyQCeAHUwhZRA/plhc5cU1os
 TclfS/YKl9fc2pupbneZezCthfmvSPG4nNSEEa+M+HkHx5XL1wCsyp10DW22W7IoqHatRy9w/wJ
 ZHSS7crmm+NvvEzQibj76DcOLZcMEL3AyDWYIaJwWCkJOp7MJkPPqBC1p6l9ecuWD1iOiiklzsX
 cGJFaWnKSeatgDXnfUcbo5hfSpegr4IYjcVlaOg2NDyjXbje
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f99318 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9ulEF5QCDdM8efRlvGcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4oJft0DBjAyYmtfAw-DSo1bUQgLmwAjx
X-Proofpoint-GUID: 4oJft0DBjAyYmtfAw-DSo1bUQgLmwAjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214767

It mostly doesn't make sense to build i915 & Co drivers for non-x86
targets. Add separate 'intel' PACKAGECONFIG entry (enabled by default on
x86) and use it to select Intel-related drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d2de6a096a6343b6d1bf9e7a638abc0e3c7eb492..1b758a28d38b4d2d02df501b8898fb7f2f5e88a4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -88,9 +88,9 @@ PACKAGECONFIG = " \
 # skip all Rust dependencies if we are not building OpenCL"
 INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm"
+PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel"
+PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel"
+PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel"
 PACKAGECONFIG:append:class-native = " libclc gallium-llvm r600"
 
 # "gbm" requires "opengl"
@@ -107,7 +107,7 @@ VULKAN_DRIVERS_AMD:x86-64 = ",amd"
 # i686 is a 32 bit override for mesa-native
 VULKAN_DRIVERS_AMD:i686 = ",amd"
 
-VULKAN_DRIVERS_INTEL = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ',intel', '', d)}"
+VULKAN_DRIVERS_INTEL = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST = ",swrast"
 # Crashes on x32
 VULKAN_DRIVERS_SWRAST:x86-x32 = ""
@@ -165,10 +165,6 @@ PACKAGECONFIG[zink] = ""
 GALLIUMDRIVERS = "softpipe"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86 = ",i915,crocus"
-GALLIUMDRIVERS:append:x86-64 = ",i915,crocus"
-# i686 is a 32 bit override for mesa-native
-GALLIUMDRIVERS:append:i686 = ",i915,crocus"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
@@ -177,7 +173,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', ''
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 # radeonsi requires LLVM
-GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ',iris', '', d)}"
+GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 # llvmpipe crashes on x32
@@ -211,6 +207,9 @@ PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpa
 
 PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
 
+PACKAGECONFIG[intel] = ""
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,crocus', '', d)}"
+
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 

-- 
2.39.5


