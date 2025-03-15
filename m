Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400CAC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 12:35:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.20390.1742081677359277077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 16:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ntQSYj0r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FLvfSe009662
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 23:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9VtE3IXA8ihoPp+2F/lpWRoislVvaTA3rf7
	YeNXXICM=; b=ntQSYj0rH0K1A8oOcWqJab3aDP8gAaIG0/2QlMlJKSs2iup1lm+
	bZqv+FbtiL39O4wUCTFb28gUTcSm8oBVgSAuuTMA1kV5kHLnZ+j//+NNoIGCZv2b
	VoS5YPwiEr5WM91+JcJ1/moV8mQaa7u8pZT5N0y8n0P8Cds0rB5CF6nk32j3gnoo
	i9AJ09/fAArexWBF8Z2qiGE7af3CGmm5H7RGVXCuko0LmspcDXjw2u0YDPNdbal3
	eaazFg2LcQCN3cjnxTxbrkcVdxXKh38oOoUOX64oeCR1f3V9FizI13Il+/GjjNbn
	bGnqkEIttQ8/I+zNm8K++dkkaIEG6dM+KNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7scdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 23:34:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c579d37eeeso401260585a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 16:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742081675; x=1742686475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VtE3IXA8ihoPp+2F/lpWRoislVvaTA3rf7YeNXXICM=;
        b=WI+Ul9ioqissH48Zy/UHJsavxdQmKQzRyWSZIEB0w0v3pJTdXWF26eKaoRkS18S07M
         84ifI/C/HqlD9qDYvxURn6FvkZh3ckrFa8PiZx3hkrqqU4Aq0ovI7q+Nx8h5vcsPhY+p
         lsvTdQDDYepjLA2iL3jHYSfq51krd8gL3+iVCYKpqkjGc4WVt1M4IECHzljaSTbz1SuG
         yV6JIWB+jKz3ZpK3JrmOPjYKCaIpF00A4EquOKWj2PzZZXTDpVZFp9ruS1pEXpUQ6dCv
         xDHIGIRj4rcjfS9Lrt/dQtP34tZ0+UUOZcwv/0Q3bXxQuQV0pEAKrkbOYxwlxvIaZWJL
         pGag==
X-Gm-Message-State: AOJu0YzyqfJbN5bPjGkKt2dcmv2NrtXf4NeSBFOzz0nRXZAYevq4AbN+
	mhDZKNhdcuFsTmPDL4ajgYVb3jVs8Mzf+ja31Ax3M9h38qCAPMVsVeZRsfnce7nN+cbYckPGLAv
	7+ZDLrwS7T/s910ETBgja1IQde5txNM6EaH6myuWwB/haLJiyQH0/no00F66RFVKx2lfJcma0yE
	u/xaBGtU5QVnw=
X-Gm-Gg: ASbGncskuY7gCO3NeWohNprD37e5Qg0hSZ4cE3Ppu7+HvindakBR8Fd+uzfR6gL8Sza
	Y31jTnq1ShHA6Ukc0VTmM8GW8s7RFlaPrMwPHiuuMKtMXbGgl5zlxR7702ymOHMez7Z2/OF1z6H
	fPf2IJB39IKy/p0nNX7e715Qf1c8W6Kl6+vSv+Mlr62NB+W/13qJ9opEn6LFuSOKYFlXMYMOuJB
	i663cw43+0VbCg5RnrqvG/soZLg0WMUvNYZjZQgNnj7oRrU+H/HdWUFJgR0AaxrpBm90n+SC5wK
	loVdcB3vLjdLmsWGrSIkTw8bTHp1JdP0OsIRayduIByo45U5X0a1BG0iB6GfFdjjn4xUJAGsxTT
	tRRKsx4P75YUMTbPG127y4HSDILTv
X-Received: by 2002:a05:620a:3951:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c57c79da3amr934350185a.20.1742081674897;
        Sat, 15 Mar 2025 16:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvzv71mYiHOGsnN7gz/I63tzkcvnWBZlhMZPAf8b9lVmGxEbKpyzD8ozy2TRqAbZpYWImXBQ==
X-Received: by 2002:a05:620a:3951:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c57c79da3amr934348785a.20.1742081674421;
        Sat, 15 Mar 2025 16:34:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864dd9sm950788e87.148.2025.03.15.16.34.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 16:34:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan : upgrade 1.3.296.0 -> 1.4.309.0
Date: Sun, 16 Mar 2025 01:34:30 +0200
Message-Id: <20250315233430.2722332-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Proofpoint-GUID: ZBu36d2XgTvI1iDQiAEocuxNBn9hm-7o
X-Proofpoint-ORIG-GUID: ZBu36d2XgTvI1iDQiAEocuxNBn9hm-7o
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d60e8c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=8xQq9_NXAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=TvHPAf7NeAoDOOlyppQA:9 a=a37OYjmyPHh6xn49:21
 a=NFOGd7dJGGMPyQGDc5-O:22 a=0iNphi6Df0tEHG9LoRPy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=803 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150174
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213001

Upgrade all Vulkan-related packages together in a single cmmit.

License-Update: copyright years update.
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../glslang/{glslang_1.3.296.0.bb => glslang_1.4.309.0.bb}    | 4 ++--
 ...{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.309.0.bb} | 2 +-
 .../{spirv-tools_1.3.296.0.bb => spirv-tools_1.4.309.0.bb}    | 2 +-
 ...ulkan-headers_1.3.296.0.bb => vulkan-headers_1.4.309.0.bb} | 2 +-
 ...{vulkan-loader_1.3.296.0.bb => vulkan-loader_1.4.309.0.bb} | 4 ++--
 .../{vulkan-tools_1.3.296.0.bb => vulkan-tools_1.4.309.0.bb}  | 4 ++--
 ...ies_1.3.296.0.bb => vulkan-utility-libraries_1.4.309.0.bb} | 4 ++--
 ...ers_1.3.296.0.bb => vulkan-validation-layers_1.4.309.0.bb} | 4 ++--
 .../{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.309.0.bb}    | 4 ++--
 9 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.296.0.bb => glslang_1.4.309.0.bb} (94%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.309.0.bb} (93%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.296.0.bb => spirv-tools_1.4.309.0.bb} (97%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.296.0.bb => vulkan-headers_1.4.309.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.296.0.bb => vulkan-loader_1.4.309.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.296.0.bb => vulkan-tools_1.4.309.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.296.0.bb => vulkan-utility-libraries_1.4.309.0.bb} (91%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.296.0.bb => vulkan-validation-layers_1.4.309.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.309.0.bb} (89%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.309.0.bb
similarity index 94%
rename from meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.309.0.bb
index 3b66e3544c0f..99fbe8e9d518 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.309.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "46ef757e048e760b46601e6e77ae0cb72c97bd2f"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
+SRCREV = "7200bc12a8979d13b22cd52de80ffb7d41939615"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.309 \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
index bf7190379d1a..71ec2f7b4258 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801"
+SRCREV = "09913f088a1197aba4aefd300a876b2ebbaa3391"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb
index dd393cae309f..3a8006e2f11c 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.296.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.309.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "6dcc7e350a0b9871a825414d42329e44b0eb8109"
+SRCREV = "f289d047f49fb60488301ec62bafab85573668cc"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb
index 68f8f5b0a1ed..8eab94817227 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "29f979ee5aa58b7b005f805ea8df7a855c39ff37"
+SRCREV = "952f776f6573aafbb62ea717d871cd1d6816c387"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb
index 92ed18c2999a..0db641221524 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.296;protocol=https"
-SRCREV = "7aeb5e4324957b6f60dac5c8cedb955df4fecbfb"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.309;protocol=https"
+SRCREV = "fa5f2bf40baa15c22be61e393e1dded6c06ee503"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
index 5f83f4f24677..4215fa25d984 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.296;protocol=https"
-SRCREV = "74dd90abd69f813220b572e1d89c17bc7784972d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.309;protocol=https"
+SRCREV = "bf9fcd2d62ea9eac52e5351c02e35cb61ec5e873"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.309.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.309.0.bb
index 3ea50ff832c1..f3db1be06d90 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.309.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "0a786ee3e4fd3602f68ff0ffd9fdcb12e0efb646"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.309;protocol=https"
+SRCREV = "897ee4d90309f5b4f8e254472863d0489e6439d2"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.309.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.309.0.bb
index a5f93bc3f146..f4be3895a845 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.309.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.296;protocol=https"
-SRCREV = "9935cdd6f9524b1da1e140393fa69a0a1b72125d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.309;protocol=https"
+SRCREV = "3ba0e590a2e76475b3eef4043355b498fb64e752"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
index bed42934902e..251ce229aec2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
@@ -7,10 +7,10 @@ BUGTRACKER = "https://github.com/zeux/volk"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a"
+SRCREV = "58689c063427f5bad4f133625049b1a3c5dd8287"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


