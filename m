Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50576C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 11:40:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11562.1784288397388382383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 04:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BjLdyWm4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bAqrv3U9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASk2E1323638
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 11:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BZh6sPI2UfoJjPSOef20Um1GLbRg3feOGU4
	Wx2Mqz4k=; b=BjLdyWm4lMNlUFAPimgdy+yYhh0n9n7B7zEnI0Wr7I6o+Dod9nI
	ZuhARp6jsXbjMgMJ3onoEvvj1RaEDZFnISdUg+umWDsbzSL8rOFDmKVglSPwzp7v
	iIIdO4mIUkHNxYQTTdkxXhmw8vv45tFtS6kQDXH+0w0sBCHzZRnRWz5PDh7LUfCp
	ah5I2hhYlp4wcIH36JnJkvQLrQaB0FO/Kejc8jSV1DWCSWLIuyKFWA/OsubUF4yc
	1bvg0Yo7zfu86k3C+2rD/7gC8h+iuUFf6I8oLe17xBqdxoyasl0X1MQAe/9eX5SX
	a2GVD1igwyvX8QC1ATuyhbLuK2aFyfqfH8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8kgxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 11:39:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e632390d2so874552485a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784288395; x=1784893195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZh6sPI2UfoJjPSOef20Um1GLbRg3feOGU4Wx2Mqz4k=;
        b=bAqrv3U9OArj2t95RpjSyTpiE9O+r9Djd9aAGBjIFPdgIKHBok5bqk2H99LLcbddwo
         GdcelliWz9JNz8buNJ5mhfF3/hEI/ZzKYW9yX8e8e2nTQtfP2sgdixfTbrAJvfSGc+H6
         onU9MsyEh0J96E+VzPUfQZZxhQ//1wFvbuGkLcHQSnKlETPs0MrsOIYaCyTIT3brooE1
         G2pr0ITzHDGbgM9xp1dN8Cq0owuQL4w8XsBnF9fRo7iHIIr0paIPmrkH+eRJnJWe03u4
         7/H2Mm/eu1C/lsnMaKvnyiYDy0tQkVKUVr/sfIbZ3eTQQZQ9eDzD/4MlhBD4i3MuK3mg
         sBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288395; x=1784893195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZh6sPI2UfoJjPSOef20Um1GLbRg3feOGU4Wx2Mqz4k=;
        b=l2BRlJf+hODOEBL95pVt2dpAHl0F3jFI7kEh/NtFCy8XzEO66PxYf7hwIXWdHhkAHm
         sFWsV2MduEvLwzZ2RtywR9IA28E2eEUikBwwAWgnbL3QGBc1Db9rq8smV/ypvHe8X6Q5
         jujapwEEzq7Xk1a5JKsJ3WLhlOH77sGmLl9pmOL0iUrO+C1u36ErI6rIbMGTqKs1Jvmn
         GtjnO0AQUKCBXRdK4J3H1OTFGFkXuJGGBMQzEejD6mAVvaZoEvotLmEtIFEK0jEeQJQP
         8bZjLThPJyVUSbO2b64ql0O94bvfoNTt5IHO0+yjnPZdG7QRO3ZAhcBvyV9E7BpbwWoY
         /H0A==
X-Gm-Message-State: AOJu0YytjOcBOaQLgOBTAH0RP/bxLfwYcQszGabiajBhk63LIeDwfsOy
	S0qb9N5u8sF041xuLRPvwYFwjtjlH9acUXeFQnt7IqPHkO0xZdAyx/Y7p8FCl/Bw2YfueORlAM8
	Kdd6dZcL+aiQ5F1hnYoDayA7/Yem/Pc/7ODifeusoWMoxwddhdvMSaxIIsVARANsF9w6odqy7je
	0TjwwCTnvSBqVmVvo=
X-Gm-Gg: AfdE7clMYbXe8hqgg0jYtAIOpXIBkeECtEEZwc41Tx6y83xzp+I9Y6EqbrimCJy9FDI
	9pdWkPTsc+/EW6x2UjFD71fKWP8OgCB6aQeYVM/dA9wakxhIuA6nDpaOCfW1dJ8Z+RhJog5X993
	Y0Cd/rb+IWWk/q3BOqxCzT0p/f49cT/G9eZbkCio/kNAO5+9Is5dCESIJoXjC4h7FpqBe13qcQJ
	CViOz1SdibCxcanMFiJrQBPrMICBEVMg7W0AiD6oazYTIx/k8fwS69eLfBqqbnXDVJP8gJzCSIm
	auboPExsVzCSSjAPYTnJQtNd+SZPcEGpYNRaP63h9J5w/Dvmhzh2HHub+PfsSHJw+y+Ug5ElM37
	4WnmVevbIGzBXZUk=
X-Received: by 2002:ac8:5e4e:0:b0:51c:1327:5068 with SMTP id d75a77b69052e-5213d1bee85mr17452221cf.1.1784288395498;
        Fri, 17 Jul 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:51c:1327:5068 with SMTP id d75a77b69052e-5213d1bee85mr17452081cf.1.1784288395062;
        Fri, 17 Jul 2026 04:39:55 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edda9bsm3003265f8f.31.2026.07.17.04.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:39:54 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] shaderc: upgrade 2026.2 -> 2026.3
Date: Fri, 17 Jul 2026 12:39:42 +0100
Message-ID: <20260717113942.67640-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PtQmln4PUGDKLGpV-4VGdhC3HikLzHah
X-Proofpoint-ORIG-GUID: PtQmln4PUGDKLGpV-4VGdhC3HikLzHah
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOCBTYWx0ZWRfX+XwGPjIRhWpn
 6+FznqgHuV8Kmw1Di/Vv6VDvK5XZA2UDrLLh+oOsph05iNx0Os9r+lwR2JXweUTgTOTkmx76GDZ
 TFHNxPRFS6ZqUQQyog+aym292Pk10WM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOCBTYWx0ZWRfX/iTCgHm0lVK3
 9wqcDsy5QOlR4c+IxCSkQ+19TLO0OMWrSTvXS+Zdn1eJJgCWXNL1afeIehNOSLHYka6SxcbaXNL
 XSjxHmmW1hKa1oytG1u9qwJpzg90VsL4/0kjrynSE7deXlwILBD6zT36X7ED/vY5piRnPXP/NbH
 7EM+A3UcD4opkVLWtVkl1ZAx40R5rbp0Fs3LBsRYvJpIWMek7LzfaDweEnjPDkxBryXQf2ZYtWt
 jTGpRr8S7bE71r3jupq2/WyIcsqhW9twKe4Oj7XkVZiZ6VBVMR3+NOLE99E1A3VznAvI3B161CU
 yZtBW4NVoKsloehARVAGK80yjWvoQU83Eg1EqAgCx5kFunwsH5MA3z5lG1kDoemq5jxeOWCPvis
 dih4PmdPM8026wnteRvjOfpUxP+lv3+zkdrU0aFq7FFCXbzC2NZVnG3JAk6Srkbo1eIrgpxwCch
 fgg2A1kv+MegsAPvj+Q==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a148c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ezQQ7er8JOjSBbkXI-EA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 11:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241163

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 ...-cmake-disable-building-external-dependencies.patch | 10 +++++-----
 ...shaderc_util-fix-glslang-header-file-location.patch |  4 ++--
 .../shaderc/{shaderc_2026.2.bb => shaderc_2026.3.bb}   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2026.2.bb => shaderc_2026.3.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index f9731a8eaa..bc324b5c0d 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From adf7927c3fa5055d33c3970be53fdf1a8853b617 Mon Sep 17 00:00:00 2001
+From b2d321b9c493a6e36203c50ad20adb655485c951 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 06f5395..39b8869 100644
+index 51b5469..8557714 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -72,6 +72,7 @@ else()
+@@ -77,6 +77,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
@@ -26,7 +26,7 @@ index 06f5395..39b8869 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -129,8 +130,14 @@ endif(MSVC)
+@@ -134,8 +135,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,7 +43,7 @@ index 06f5395..39b8869 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -142,7 +149,7 @@ endif()
+@@ -147,7 +154,7 @@ endif()
  add_custom_target(build-version
    ${Python_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index d639635766..fb11fae014 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From f3915766d382d30c83da6d8077bf183e930a4789 Mon Sep 17 00:00:00 2001
+From 8f2350e4172758bf6ef3464c998352864b90988f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index f2ed3c7..59b262a 100644
+index 41bdba7..db7f329 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.2.bb b/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2026.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.3.bb
index 644db97969..063bafaa04 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "baec0c74d6dca70c52d937e2e5bf6ffcd449e430"
+SRCREV = "82757e4f72af8518fb679604d352623450cb761f"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.55.0


