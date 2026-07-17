Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0531C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:37:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12405.1784291826707285338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eMS+Snpf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HPrQcI45;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSorJ1884125
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=viBDwRxLp4jB6eEtoTg0hKKHQTgabOns92m
	Fct5tc6k=; b=eMS+Snpf6Sbm8OqpNT5jYXsscI7kFRIaxQ0KW82fPMiuKg4DAIZ
	LOLklzg7/HOtPbRSEMxLwOzi7NKCRKIPcAfAHKmJJSSqWUmDsC5J2iRnZglQOEEG
	Zt6txCn+WgMTUiy2ZQJQPlwCQt20vI/UdXFqiX7jnmXCLYpGsgRAczkUboBXUIOA
	7vDheBnNPmkU6hiy51Z0hXLOBrxDlPh+HjE8ta+8IFbdQyQapYuvR6kyJ26DX+6j
	SlDVSc/xRccQdYZAnnPp0gq7M0FlJZ6JkN/9yaA9v8gu58YESNtZ54BvKUb1c+Tm
	jC8YQXEkzfJPVaFka55G5XC4ker4KbuRG7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfgnta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:37:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e934385db1so156343466d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784291825; x=1784896625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=viBDwRxLp4jB6eEtoTg0hKKHQTgabOns92mFct5tc6k=;
        b=HPrQcI45A/cAxU89382CWK+p0Adz893DV9WUaTmrqRcXBkTjmVwFIJyYdKRwFzDd51
         aV+oRssG2FW8mtyMBcQn1xMKxuRlgQcpxaMTQunWVJBVDfjDCmt/51uKUNdJafGXXQPv
         qmyf8oyEJ6WfLaApTdXzg35ggg8lSoJKL1Es0jUlcsrWLoRur3BeU905LZHDPdprfbHG
         0q4BG9iv6hS21PkDY4lEauQphUxiH/0tl3uzQ0piEI6Lo98C4S9W0BBIGz9mMJF79EYR
         P8FndiNgQxmYV6WpfGJe7+ssM601lLSk6WPSXMHj/r+8ePBGTmqDooBs79p9SO4hmvkF
         vBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784291825; x=1784896625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viBDwRxLp4jB6eEtoTg0hKKHQTgabOns92mFct5tc6k=;
        b=Suv1BU811LqIjTJFHj41++tS2ew5fvLE7apcqEUNvjisT7i3MOybGo8ujWslCIxkq8
         6ZnB5HovEjD5H/kbMEOhgheWGiUHOgcX7kA8r0jzasZqkbIfLNnKlHfrqGlzLuHjuqB6
         i4DlizcdWqv2Y5k5073PyeqF5FjMLaleXT+lYsC77Uot+qRWJB9kVjQ7PpS6rbATY655
         JaQsx9eD4Gfz2k+AfGXdyVXIkTRyvEoZwBXtwmgKxNsYnEyZs2ns4qUQJr6Ooz/vl/n9
         6J2XbKnRfzh0tz4cKpOO88BOlDSaaqnIZq2zfmz1jITbzOQxn4sidamAhf5mrASnAaNY
         rnAg==
X-Gm-Message-State: AOJu0YzsCneJNqkrKHobo9Hkefpyo6HpMt5cxyeiXmzeBGto1JByqY6B
	rHwkcsfbY6Lh0Jo/rPGhLiDebYORQyo7nIRF0OgqqoeGWv5I54sIbjYKuLaQ6s83gGHCW3HBA1M
	ea7fPoKxLLlHtvsfrdvEKoAh26gpuhBpA4rFHrPZq4vvAswOUhxueUZK0uYOdS9qsCZVuSSAp4L
	072SKP9KoI7xcZLA4=
X-Gm-Gg: AfdE7clOBHYIjcL89AfILoPuyrLtb9VnbaRcYB+lO82UHg/tw/ocQJMs+99qxExp7nN
	RzoEMrkj7j7DpF7FwSc+oe2WdottEwe7z+NGj/jMW1PHfIlhT0D5NAUSukCpNhiILmd9DBpGszB
	nhPdEmytEJbzzRtbsGAGRpDsn9jzXcyvHOtOnt9wUaFPtBfxvpOstTWik/aD0mISL68TcMhNBJL
	UMXYxAtSKGWuus16uVGY0kfGQhDjFVy2ZIWAkAcW9kIfBxo3/5bAD5bvNh/+sGZIdc2/QlTcqJM
	mNNBc0SAX8cmA0XrulLo2GXu1drw6JNhp7R2suQTAFBhBBD3jewto0jCUu13P0W2uD/efsmdltd
	Ozw2oyvO4f7FdLS0=
X-Received: by 2002:a05:622a:118c:b0:51f:20e1:137f with SMTP id d75a77b69052e-5213c7e5183mr18738641cf.19.1784291824631;
        Fri, 17 Jul 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51f:20e1:137f with SMTP id d75a77b69052e-5213c7e5183mr18738371cf.19.1784291824125;
        Fri, 17 Jul 2026 05:37:04 -0700 (PDT)
Received: from toster.lan ([185.228.162.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e14e1bsm34914705e9.2.2026.07.17.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:37:03 -0700 (PDT)
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] shaderc: add CPPFLAG to fix header location and drop the patch
Date: Fri, 17 Jul 2026 13:36:59 +0100
Message-ID: <20260717123659.909373-1-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyOCBTYWx0ZWRfX9/DUQnXxP/Fr
 fWJH2dO6PRabrXpb3ZmMi1bU4/gD6OM5M7cQ0WShVr5s+1S5FOO5l2TSOwUV+70ETA7zWgtyLrf
 Vky+UrX0KjuP0RHcE/qaQZnxqFHymgtnT/ckQSSyGgw7ql/4ldg61GXJYyVFtnl9vkRvyn3M1Um
 RW709idDmwVfdwT3j7Z/3JQxna7qrGe9MC4CugbRt/zTwMLFEpyfu5lyNnAdkNy3JTPz1YZGPx+
 AnyXLLetx1C9sk2eo4IiaCiZdGXnZpR6hVUNRcsaxkqP5NE7fPdoTlT+dDx+ANyVBrPBSQ4yIb4
 LT5tRTlmPXX0/UtKi4NRPuE/S5CsM0JO9e+aY/XuaveCtzGIk0BRbUD2jQW7mwFhvMYO3zeQ6IU
 Et20qYzebmVZ5uDWsf86kgbC1uTxOsYXMzdGUP0+jKPYwHjzdXCuJV0Yq0txzxAKCQ74Kqw5Cku
 +87VpvltIoc1pMnBRNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyOCBTYWx0ZWRfX1znCzvsyJcZd
 eIUasbbQlbAbhGpNcV2AcBIdYSQxG4Oyt+lRwTzKsCf7RXBJexMBoIoIFyycDb1JlcyYDDYX8J+
 bIFvK+rnt+ExU6L992x0jBWaoCZkhPo=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a21f1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=YIx/k7VQn7/pPcQ+xNwIKQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=Sct6mcVwwlL9E293P-AA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 6k69f5k6DSu8fzDkLvSUA_SMddj8MV1Y
X-Proofpoint-ORIG-GUID: 6k69f5k6DSu8fzDkLvSUA_SMddj8MV1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241170

Fix glslang header file location in libshaderc_util with
CXXFLAGS and drop the pending pacth.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 ...til-fix-glslang-header-file-location.patch | 25 -------------------
 .../shaderc/shaderc_2026.3.bb                 |  3 ++-
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch

diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
deleted file mode 100644
index fb11fae014..0000000000
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 8f2350e4172758bf6ef3464c998352864b90988f Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sat, 13 Feb 2021 00:45:56 +0000
-Subject: [PATCH] libshaderc_util: fix glslang header file location
-
-Upstream-Status: Pending
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- libshaderc_util/src/compiler.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index 41bdba7..db7f329 100644
---- a/libshaderc_util/src/compiler.cc
-+++ b/libshaderc_util/src/compiler.cc
-@@ -20,7 +20,7 @@
- #include <thread>
- #include <tuple>
- 
--#include "SPIRV/GlslangToSpv.h"
-+#include "glslang/SPIRV/GlslangToSpv.h"
- #include "libshaderc_util/format.h"
- #include "libshaderc_util/io_shaderc.h"
- #include "libshaderc_util/message.h"
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.3.bb b/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
index 063bafaa04..d2a62a4cd4 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.3.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SRCREV = "82757e4f72af8518fb679604d352623450cb761f"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
-           file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
@@ -25,4 +24,6 @@ EXTRA_OECMAKE = " \
     -DSHADERC_SKIP_COPYRIGHT_CHECK=ON \
 "
 
+CXXFLAGS += "-I${STAGING_INCDIR}/glslang"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


