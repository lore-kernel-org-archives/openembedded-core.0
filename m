Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0437CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 15:30:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.2059.1760196622189419838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 08:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QOdyMSmH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BCds6A014641
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 15:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bTe69ZUxC6GOjD7jl7ZZKnQi2+JZxaoQzo7
	UpTDNbF8=; b=QOdyMSmHsxyX8irUk+TE3rdoovaIkoINZvH0N76KFVFuekg3U+p
	dz7irCCrXviCY+S2XRcNkvqH0eb7B6mgRY5W0kre4ZZrCh8SxvhVJ02i95iwbwNn
	86JNFOValdHBe/NIXdgIYpv9nAyU6UuH64E2kGFIFECCNAa0dfKBvuq0b817acBN
	/zpeVLcnAv44/le8dVmkM0POl2K06L5QdfCQlC4yRXtBncYcIAVb4p/RgqrdH1O+
	YJG1UJqnXSWzt9O6eqW46KiGgftenWXLz0MWlta7zRRHlVNmHDEeoaNNX4VwqYdQ
	2bGTGKH4FqRETzuUTTaUktumGkWQDq9GL3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfrr6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 15:30:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8574e8993cbso728360985a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 08:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760196619; x=1760801419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTe69ZUxC6GOjD7jl7ZZKnQi2+JZxaoQzo7UpTDNbF8=;
        b=tpMGBzkbo7w7uyjZZWJ/Rpz+0f62LLGKkdT8K3hw7tFCXqWO/1Bxr85UdmCBD4OAw0
         QJ6iSuYmEUo5LWXF6vpmlwTDorLEgJapOl9uiSQjhi1Ux73szTH/+GGPpEjsDuubj8WY
         c86notxndE5y/WmGYTvQxdejuFPDPM/qcnDND7BPSy961GqbNtO0sIWIvfoZvbi2KpfQ
         h5DwI7QsIMhkXEbmVWH+/PfsegJ8VQDydTdYzfwkTn4OJ0W1ZzANHF10QAynp8u/pe9+
         6nRTKTkQCKb1B+2hEenJFEQH/TH6XIpdKlo7csOBzclvJSsFlT+J2GXrAZVJniTdFfZY
         sGUw==
X-Gm-Message-State: AOJu0Yw4lkOaQqE8JPnhbjOwfK6K43V6S62FlUiRPopuxQDDRGy+EtxG
	IqMbnciOgJALb133hTpOvmUynm1ayXGsas6EysUbTkMMZXT1ZW/TlyimARdNft7SWtAINI+pncC
	XNZ4y9WpuJpBJLs+1jpRU8yvyjfl6pnhYTaM9XA9hQIWnAXUPvSl8swf13J+Yvlc6pm4Fdiyeic
	DXKVrNd34Fa2wTqpI=
X-Gm-Gg: ASbGncuDuXXTUbO0M9xfhC0fT7dznwhH+W369hr6VJwFhZW2toJAE6reNhNreTMG0Qf
	SF7hdSBXAj1QGDjOHntGFuFt4FOLxuMPgCIG+HG5oAy3BmiG2v5GTjuwwSFvkCsGgBM6p2r/JNW
	8k5HIxDOXHo/DIngKiHPhJETCELiLem0PSt84ShFndR7zCZCmH2roEVpB1CLY6t3XovZacaLFZ1
	qnLlShYRXWWefREe6bchWxsbquYGbntoapRhmYBTTBxvO8yh47kSbZ44tRxSC8NthF3u4MLpVvP
	aRug5yXrgjS99QN7p7z6n1eWiPYD6e/3zN9IrnNmfi3K9YpvaLym0I0lPZ+yaADOUuNWwJXDjFn
	CSAdJIdZmSLBlXiITUQe/SlwP5KQWJY+8DGyId9xpbxDeA+lBMMfq
X-Received: by 2002:a05:622a:1dca:b0:4e4:f9f8:9d3d with SMTP id d75a77b69052e-4e6ead87103mr252800751cf.84.1760196617683;
        Sat, 11 Oct 2025 08:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+3pwSrPyGurYRl3cz0X7Kta/sRpKCMN7xOhoau1jFpQOM1HQphCr4NuG2FuFwTNr4hv/tGg==
X-Received: by 2002:a05:622a:1dca:b0:4e4:f9f8:9d3d with SMTP id d75a77b69052e-4e6ead87103mr252799421cf.84.1760196616336;
        Sat, 11 Oct 2025 08:30:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm1996971e87.7.2025.10.11.08.30.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 08:30:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vulkan: upgrade 1.4.321.0 -> 1.4.328.1
Date: Sat, 11 Oct 2025 18:30:14 +0300
Message-ID: <20251011153014.1813055-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX3n5X29XgqcvT
 ic6KqEMymqsSEvt1/E36XtyA0NC1ENkNqMCVb9nku435D7sttFOKqHBXihpD0gkq5uPOmxi6llq
 tQPBvtSGMCuwLPk4wkfhyFTMk8tqFTyyBzU/OEAGSPlHyPhe2jSOiFAnaqOZlQ2L9nb6iTMVfzL
 Zhzfx0bSaXecCCHBLByq1kiIXuGJ3Fk5MZv/UyRuVsGdlO0Dh2Pr2/hP0vKk4tW9EUhtouCiv7g
 7srxZpzWr8jxX15YjJSEnO2VfgqvMNTOxKhCH5yfaN8F8cMXuGgYRvEj69IQva6Z7hBU9ISURxg
 DVwtwyvh8Iz6FheA2IJoeLYYpSGUw7CtDDEIelQqYnPVFEDr4OeqQTB7ULLp4S26zooEbY9mgMH
 +QsdvnnVhQTYlzb0FejoViFgGQg+fQ==
X-Proofpoint-GUID: MI4uv5eqJBKMTR_WCJskBKLR6pzZSIgF
X-Proofpoint-ORIG-GUID: MI4uv5eqJBKMTR_WCJskBKLR6pzZSIgF
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ea780d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=8xQq9_NXAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=Hfoq6aXPAAAA:8 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=SpFrnJGBAOmCR5AxKMkA:9
 a=PdmRddODVDJrpLoo:21 a=PEH46H7Ffwr30OY-TuGO:22 a=0iNphi6Df0tEHG9LoRPy:22
 a=NrRqPRXH979sAPH7e1uv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 15:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224719

Upgrade all Vulkan-related packages together in a single commit.

License-Update: glslang dropped SPIR-V remapper
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...lang_1.4.321.0.bb => glslang_1.4.328.1.bb} |   6 +-
 ...-Add-SPV_INTEL_function_variants-532.patch | 642 ------------------
 ....4.321.0.bb => spirv-headers_1.4.328.1.bb} |   7 +-
 ...on_variants-basic-asm-dis-support-61.patch | 289 --------
 ..._1.4.321.0.bb => spirv-tools_1.4.328.1.bb} |   5 +-
 ...4.321.0.bb => vulkan-headers_1.4.328.1.bb} |   4 +-
 ....4.321.0.bb => vulkan-loader_1.4.328.1.bb} |   4 +-
 ...1.4.321.0.bb => vulkan-tools_1.4.328.1.bb} |   4 +-
 ... => vulkan-utility-libraries_1.4.328.1.bb} |   4 +-
 ... => vulkan-validation-layers_1.4.328.1.bb} |   4 +-
 ..._1.4.321.0.bb => vulkan-volk_1.4.328.1.bb} |   4 +-
 11 files changed, 20 insertions(+), 953 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.321.0.bb => glslang_1.4.328.1.bb} (87%)
 delete mode 100644 meta/recipes-graphics/spir/spirv-headers/0001-Add-SPV_INTEL_function_variants-532.patch
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.321.0.bb => spirv-headers_1.4.328.1.bb} (83%)
 delete mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.321.0.bb => spirv-tools_1.4.328.1.bb} (91%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.321.0.bb => vulkan-headers_1.4.328.1.bb} (92%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.321.0.bb => vulkan-loader_1.4.328.1.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.321.0.bb => vulkan-tools_1.4.328.1.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.321.0.bb => vulkan-utility-libraries_1.4.328.1.bb} (91%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.321.0.bb => vulkan-validation-layers_1.4.328.1.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.321.0.bb => vulkan-volk_1.4.328.1.bb} (88%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
similarity index 87%
rename from meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
index 2d6f098ad9ed..57d9fe1a9863 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.328.1.bb
@@ -6,10 +6,10 @@ either from a command line or programmatically."
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "8a85691a0740d390761a1008b4696f57facd02c4"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.321;tag=vulkan-sdk-${PV} \
+SRCREV = "a57276bf558f5cf94d3a9854ebdf5a2236849a5a"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.328;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers/0001-Add-SPV_INTEL_function_variants-532.patch b/meta/recipes-graphics/spir/spirv-headers/0001-Add-SPV_INTEL_function_variants-532.patch
deleted file mode 100644
index 9a3ab153508b..000000000000
--- a/meta/recipes-graphics/spir/spirv-headers/0001-Add-SPV_INTEL_function_variants-532.patch
+++ /dev/null
@@ -1,642 +0,0 @@
-From 9e3836d7d6023843a72ecd3fbf3f09b1b6747a9e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jakub=20=C5=BD=C3=A1dn=C3=ADk?= <jakub.zadnik@intel.com>
-Date: Tue, 24 Jun 2025 15:35:27 +0300
-Subject: [PATCH] Add SPV_INTEL_function_variants (#532)
-
-* Add tokens for SPV_INTEL_function_variants
-
-Add FunctionVariantXXX decorations
-
-Add SpecConditionalINTEL capability
-
-Change class of conditional copy to Composite
-
-Add new instructions; Update tokens
-
-Fix wrong op name
-
-Change spec const arch operand to integer
-
-Reassign tokens; Fix operand
-
-Remove old decorations
-
-* Generate headers
-
-* Add provisional entries and missing capability
-
-Co-authored-by: Victor Lomuller <victor@codeplay.com>
-
----------
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Headers/commit/9e3836d7d6023843a72ecd3fbf3f09b1b6747a9e]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Co-authored-by: Victor Lomuller <victor@codeplay.com>
----
- include/spirv/unified1/spirv.bf               |  10 ++
- .../spirv/unified1/spirv.core.grammar.json    | 120 ++++++++++++++++++
- include/spirv/unified1/spirv.cs               |  10 ++
- include/spirv/unified1/spirv.h                |  27 ++++
- include/spirv/unified1/spirv.hpp              |  27 ++++
- include/spirv/unified1/spirv.hpp11            |  27 ++++
- include/spirv/unified1/spirv.json             |  10 ++
- include/spirv/unified1/spirv.lua              |  10 ++
- include/spirv/unified1/spirv.py               |  10 ++
- include/spirv/unified1/spv.d                  |  10 ++
- 10 files changed, 261 insertions(+)
-
-diff --git a/include/spirv/unified1/spirv.bf b/include/spirv/unified1/spirv.bf
-index 1d5945a..630f2f4 100644
---- a/include/spirv/unified1/spirv.bf
-+++ b/include/spirv/unified1/spirv.bf
-@@ -655,6 +655,7 @@ namespace Spv
-             HostAccessINTEL = 6188,
-             InitModeINTEL = 6190,
-             ImplementInRegisterMapINTEL = 6191,
-+            ConditionalINTEL = 6247,
-             CacheControlLoadINTEL = 6442,
-             CacheControlStoreINTEL = 6443,
-             Max = 0x7fffffff,
-@@ -1312,6 +1313,8 @@ namespace Spv
-             Subgroup2DBlockTransposeINTEL = 6230,
-             SubgroupMatrixMultiplyAccumulateINTEL = 6236,
-             TernaryBitwiseFunctionINTEL = 6241,
-+            SpecConditionalINTEL = 6245,
-+            FunctionVariantsINTEL = 6246,
-             GroupUniformArithmeticKHR = 6400,
-             TensorFloat32RoundingINTEL = 6425,
-             MaskedGatherScatterINTEL = 6427,
-@@ -2472,6 +2475,13 @@ namespace Spv
-             OpSubgroup2DBlockStoreINTEL = 6235,
-             OpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-             OpBitwiseFunctionINTEL = 6242,
-+            OpConditionalExtensionINTEL = 6248,
-+            OpConditionalEntryPointINTEL = 6249,
-+            OpConditionalCapabilityINTEL = 6250,
-+            OpSpecConstantTargetINTEL = 6251,
-+            OpSpecConstantArchitectureINTEL = 6252,
-+            OpSpecConstantCapabilitiesINTEL = 6253,
-+            OpConditionalCopyObjectINTEL = 6254,
-             OpGroupIMulKHR = 6401,
-             OpGroupFMulKHR = 6402,
-             OpGroupBitwiseAndKHR = 6403,
-diff --git a/include/spirv/unified1/spirv.core.grammar.json b/include/spirv/unified1/spirv.core.grammar.json
-index b197d9e..2470bfa 100644
---- a/include/spirv/unified1/spirv.core.grammar.json
-+++ b/include/spirv/unified1/spirv.core.grammar.json
-@@ -10777,6 +10777,101 @@
-       "capabilities" : [ "TernaryBitwiseFunctionINTEL" ],
-       "version" : "None"
-     },
-+    {
-+      "opname" : "OpConditionalExtensionINTEL",
-+      "class"  : "Extension",
-+      "opcode" : 6248,
-+      "operands" : [
-+        { "kind" : "IdRef",         "name" : "Condition" },
-+        { "kind" : "LiteralString", "name" : "Name" }
-+      ],
-+      "capabilities" : [ "SpecConditionalINTEL" ],
-+      "provisional" : true,
-+      "version" : "None"
-+    },
-+    {
-+      "opname" : "OpConditionalEntryPointINTEL",
-+      "class"  : "Mode-Setting",
-+      "opcode" : 6249,
-+      "operands" : [
-+        { "kind" : "IdRef",                              "name" : "Condition" },
-+        { "kind" : "ExecutionModel" },
-+        { "kind" : "IdRef",                              "name" : "Entry Point" },
-+        { "kind" : "LiteralString",                      "name" : "Name" },
-+        { "kind" : "IdRef",          "quantifier" : "*", "name" : "Interface" }
-+      ],
-+      "capabilities" : [ "SpecConditionalINTEL" ],
-+      "provisional" : true,
-+      "version" : "None"
-+    },
-+    {
-+      "opname" : "OpConditionalCapabilityINTEL",
-+      "class"  : "Mode-Setting",
-+      "opcode" : 6250,
-+      "operands" : [
-+        { "kind" : "IdRef",      "name" : "Condition" },
-+        { "kind" : "Capability", "name" : "Capability" }
-+      ],
-+      "capabilities" : [ "SpecConditionalINTEL" ],
-+      "provisional" : true,
-+      "version" : "None"
-+    },
-+    {
-+      "opname" : "OpSpecConstantTargetINTEL",
-+      "class"  : "Constant-Creation",
-+      "opcode" : 6251,
-+      "operands" : [
-+        { "kind" : "IdResultType" },
-+        { "kind" : "IdResult" },
-+        { "kind" : "LiteralInteger",                     "name" : "Target" },
-+        { "kind" : "LiteralInteger", "quantifier" : "*", "name" : "Features" }
-+      ],
-+      "capabilities" : [ "FunctionVariantsINTEL" ],
-+      "provisional" : true,
-+      "version": "None"
-+    },
-+    {
-+      "opname" : "OpSpecConstantArchitectureINTEL",
-+      "class"  : "Constant-Creation",
-+      "opcode" : 6252,
-+      "operands" : [
-+        { "kind" : "IdResultType" },
-+        { "kind" : "IdResult" },
-+        { "kind" : "LiteralInteger", "name" : "Category" },
-+        { "kind" : "LiteralInteger", "name" : "Family" },
-+        { "kind" : "LiteralInteger", "name" : "Opcode" },
-+        { "kind" : "LiteralInteger", "name" : "Architecture" }
-+      ],
-+      "capabilities" : [ "FunctionVariantsINTEL" ],
-+      "provisional" : true,
-+      "version": "None"
-+    },
-+    {
-+      "opname" : "OpSpecConstantCapabilitiesINTEL",
-+      "class"  : "Constant-Creation",
-+      "opcode" : 6253,
-+      "operands" : [
-+        { "kind" : "IdResultType" },
-+        { "kind" : "IdResult" },
-+        { "kind" : "Capability", "quantifier" : "*", "name" : "Capabilities" }
-+      ],
-+      "capabilities" : [ "FunctionVariantsINTEL" ],
-+      "provisional" : true,
-+      "version": "None"
-+    },
-+    {
-+      "opname" : "OpConditionalCopyObjectINTEL",
-+      "class"  : "Composite",
-+      "opcode" : 6254,
-+      "operands" : [
-+        { "kind" : "IdResultType" },
-+        { "kind" : "IdResult" },
-+        { "kind" : "IdRef", "quantifier" : "*", "name" : "Condition 0, Operand 0, +\nCondition 1, Operand 1, +\n..." }
-+      ],
-+      "capabilities" : [ "SpecConditionalINTEL" ],
-+      "provisional" : true,
-+      "version" : "None"
-+    },
-     {
-       "opname" : "OpGroupIMulKHR",
-       "class"  : "Group",
-@@ -14900,6 +14995,16 @@
-           "capabilities" : [ "GlobalVariableFPGADecorationsINTEL" ],
-           "version" : "None"
-         },
-+        {
-+          "enumerant" : "ConditionalINTEL",
-+          "value" : 6247,
-+          "parameters": [
-+            { "kind" : "IdRef", "name" : "Condition" }
-+          ],
-+          "capabilities" : [ "SpecConditionalINTEL" ],
-+          "provisional" : true,
-+          "version" : "None"
-+        },
-         {
-           "enumerant" : "CacheControlLoadINTEL",
-           "value" : 6442,
-@@ -17563,6 +17668,21 @@
-           "extensions" : [ "SPV_INTEL_ternary_bitwise_function"],
-           "version" : "None"
-         },
-+        {
-+          "enumerant" : "SpecConditionalINTEL",
-+          "value" : 6245,
-+          "extensions" : [ "SPV_INTEL_function_variants" ],
-+          "provisional" : true,
-+          "version": "None"
-+        },
-+        {
-+          "enumerant" : "FunctionVariantsINTEL",
-+          "value" : 6246,
-+          "capabilities" : [ "SpecConditionalINTEL" ],
-+          "extensions" : [ "SPV_INTEL_function_variants" ],
-+          "provisional" : true,
-+          "version": "None"
-+        },
-         {
-           "enumerant" : "GroupUniformArithmeticKHR",
-           "value" : 6400,
-diff --git a/include/spirv/unified1/spirv.cs b/include/spirv/unified1/spirv.cs
-index b11a8b2..57e7216 100644
---- a/include/spirv/unified1/spirv.cs
-+++ b/include/spirv/unified1/spirv.cs
-@@ -654,6 +654,7 @@ namespace Spv
-             HostAccessINTEL = 6188,
-             InitModeINTEL = 6190,
-             ImplementInRegisterMapINTEL = 6191,
-+            ConditionalINTEL = 6247,
-             CacheControlLoadINTEL = 6442,
-             CacheControlStoreINTEL = 6443,
-             Max = 0x7fffffff,
-@@ -1311,6 +1312,8 @@ namespace Spv
-             Subgroup2DBlockTransposeINTEL = 6230,
-             SubgroupMatrixMultiplyAccumulateINTEL = 6236,
-             TernaryBitwiseFunctionINTEL = 6241,
-+            SpecConditionalINTEL = 6245,
-+            FunctionVariantsINTEL = 6246,
-             GroupUniformArithmeticKHR = 6400,
-             TensorFloat32RoundingINTEL = 6425,
-             MaskedGatherScatterINTEL = 6427,
-@@ -2471,6 +2474,13 @@ namespace Spv
-             OpSubgroup2DBlockStoreINTEL = 6235,
-             OpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-             OpBitwiseFunctionINTEL = 6242,
-+            OpConditionalExtensionINTEL = 6248,
-+            OpConditionalEntryPointINTEL = 6249,
-+            OpConditionalCapabilityINTEL = 6250,
-+            OpSpecConstantTargetINTEL = 6251,
-+            OpSpecConstantArchitectureINTEL = 6252,
-+            OpSpecConstantCapabilitiesINTEL = 6253,
-+            OpConditionalCopyObjectINTEL = 6254,
-             OpGroupIMulKHR = 6401,
-             OpGroupFMulKHR = 6402,
-             OpGroupBitwiseAndKHR = 6403,
-diff --git a/include/spirv/unified1/spirv.h b/include/spirv/unified1/spirv.h
-index 005d451..84972da 100644
---- a/include/spirv/unified1/spirv.h
-+++ b/include/spirv/unified1/spirv.h
-@@ -642,6 +642,7 @@ typedef enum SpvDecoration_ {
-     SpvDecorationHostAccessINTEL = 6188,
-     SpvDecorationInitModeINTEL = 6190,
-     SpvDecorationImplementInRegisterMapINTEL = 6191,
-+    SpvDecorationConditionalINTEL = 6247,
-     SpvDecorationCacheControlLoadINTEL = 6442,
-     SpvDecorationCacheControlStoreINTEL = 6443,
-     SpvDecorationMax = 0x7fffffff,
-@@ -1282,6 +1283,8 @@ typedef enum SpvCapability_ {
-     SpvCapabilitySubgroup2DBlockTransposeINTEL = 6230,
-     SpvCapabilitySubgroupMatrixMultiplyAccumulateINTEL = 6236,
-     SpvCapabilityTernaryBitwiseFunctionINTEL = 6241,
-+    SpvCapabilitySpecConditionalINTEL = 6245,
-+    SpvCapabilityFunctionVariantsINTEL = 6246,
-     SpvCapabilityGroupUniformArithmeticKHR = 6400,
-     SpvCapabilityTensorFloat32RoundingINTEL = 6425,
-     SpvCapabilityMaskedGatherScatterINTEL = 6427,
-@@ -2406,6 +2409,13 @@ typedef enum SpvOp_ {
-     SpvOpSubgroup2DBlockStoreINTEL = 6235,
-     SpvOpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-     SpvOpBitwiseFunctionINTEL = 6242,
-+    SpvOpConditionalExtensionINTEL = 6248,
-+    SpvOpConditionalEntryPointINTEL = 6249,
-+    SpvOpConditionalCapabilityINTEL = 6250,
-+    SpvOpSpecConstantTargetINTEL = 6251,
-+    SpvOpSpecConstantArchitectureINTEL = 6252,
-+    SpvOpSpecConstantCapabilitiesINTEL = 6253,
-+    SpvOpConditionalCopyObjectINTEL = 6254,
-     SpvOpGroupIMulKHR = 6401,
-     SpvOpGroupFMulKHR = 6402,
-     SpvOpGroupBitwiseAndKHR = 6403,
-@@ -3225,6 +3235,13 @@ inline void SpvHasResultAndType(SpvOp opcode, bool *hasResult, bool *hasResultTy
-     case SpvOpSubgroup2DBlockStoreINTEL: *hasResult = false; *hasResultType = false; break;
-     case SpvOpSubgroupMatrixMultiplyAccumulateINTEL: *hasResult = true; *hasResultType = true; break;
-     case SpvOpBitwiseFunctionINTEL: *hasResult = true; *hasResultType = true; break;
-+    case SpvOpConditionalExtensionINTEL: *hasResult = false; *hasResultType = false; break;
-+    case SpvOpConditionalEntryPointINTEL: *hasResult = false; *hasResultType = false; break;
-+    case SpvOpConditionalCapabilityINTEL: *hasResult = false; *hasResultType = false; break;
-+    case SpvOpSpecConstantTargetINTEL: *hasResult = true; *hasResultType = true; break;
-+    case SpvOpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
-+    case SpvOpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
-+    case SpvOpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
-     case SpvOpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
-     case SpvOpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
-     case SpvOpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
-@@ -3765,6 +3782,7 @@ inline const char* SpvDecorationToString(SpvDecoration value) {
-     case SpvDecorationHostAccessINTEL: return "HostAccessINTEL";
-     case SpvDecorationInitModeINTEL: return "InitModeINTEL";
-     case SpvDecorationImplementInRegisterMapINTEL: return "ImplementInRegisterMapINTEL";
-+    case SpvDecorationConditionalINTEL: return "ConditionalINTEL";
-     case SpvDecorationCacheControlLoadINTEL: return "CacheControlLoadINTEL";
-     case SpvDecorationCacheControlStoreINTEL: return "CacheControlStoreINTEL";
-     default: return "Unknown";
-@@ -4204,6 +4222,8 @@ inline const char* SpvCapabilityToString(SpvCapability value) {
-     case SpvCapabilitySubgroup2DBlockTransposeINTEL: return "Subgroup2DBlockTransposeINTEL";
-     case SpvCapabilitySubgroupMatrixMultiplyAccumulateINTEL: return "SubgroupMatrixMultiplyAccumulateINTEL";
-     case SpvCapabilityTernaryBitwiseFunctionINTEL: return "TernaryBitwiseFunctionINTEL";
-+    case SpvCapabilitySpecConditionalINTEL: return "SpecConditionalINTEL";
-+    case SpvCapabilityFunctionVariantsINTEL: return "FunctionVariantsINTEL";
-     case SpvCapabilityGroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
-     case SpvCapabilityTensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
-     case SpvCapabilityMaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
-@@ -5198,6 +5218,13 @@ inline const char* SpvOpToString(SpvOp value) {
-     case SpvOpSubgroup2DBlockStoreINTEL: return "OpSubgroup2DBlockStoreINTEL";
-     case SpvOpSubgroupMatrixMultiplyAccumulateINTEL: return "OpSubgroupMatrixMultiplyAccumulateINTEL";
-     case SpvOpBitwiseFunctionINTEL: return "OpBitwiseFunctionINTEL";
-+    case SpvOpConditionalExtensionINTEL: return "OpConditionalExtensionINTEL";
-+    case SpvOpConditionalEntryPointINTEL: return "OpConditionalEntryPointINTEL";
-+    case SpvOpConditionalCapabilityINTEL: return "OpConditionalCapabilityINTEL";
-+    case SpvOpSpecConstantTargetINTEL: return "OpSpecConstantTargetINTEL";
-+    case SpvOpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
-+    case SpvOpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
-+    case SpvOpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
-     case SpvOpGroupIMulKHR: return "OpGroupIMulKHR";
-     case SpvOpGroupFMulKHR: return "OpGroupFMulKHR";
-     case SpvOpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
-diff --git a/include/spirv/unified1/spirv.hpp b/include/spirv/unified1/spirv.hpp
-index f7a7bf8..a3d760a 100644
---- a/include/spirv/unified1/spirv.hpp
-+++ b/include/spirv/unified1/spirv.hpp
-@@ -638,6 +638,7 @@ enum Decoration {
-     DecorationHostAccessINTEL = 6188,
-     DecorationInitModeINTEL = 6190,
-     DecorationImplementInRegisterMapINTEL = 6191,
-+    DecorationConditionalINTEL = 6247,
-     DecorationCacheControlLoadINTEL = 6442,
-     DecorationCacheControlStoreINTEL = 6443,
-     DecorationMax = 0x7fffffff,
-@@ -1278,6 +1279,8 @@ enum Capability {
-     CapabilitySubgroup2DBlockTransposeINTEL = 6230,
-     CapabilitySubgroupMatrixMultiplyAccumulateINTEL = 6236,
-     CapabilityTernaryBitwiseFunctionINTEL = 6241,
-+    CapabilitySpecConditionalINTEL = 6245,
-+    CapabilityFunctionVariantsINTEL = 6246,
-     CapabilityGroupUniformArithmeticKHR = 6400,
-     CapabilityTensorFloat32RoundingINTEL = 6425,
-     CapabilityMaskedGatherScatterINTEL = 6427,
-@@ -2402,6 +2405,13 @@ enum Op {
-     OpSubgroup2DBlockStoreINTEL = 6235,
-     OpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-     OpBitwiseFunctionINTEL = 6242,
-+    OpConditionalExtensionINTEL = 6248,
-+    OpConditionalEntryPointINTEL = 6249,
-+    OpConditionalCapabilityINTEL = 6250,
-+    OpSpecConstantTargetINTEL = 6251,
-+    OpSpecConstantArchitectureINTEL = 6252,
-+    OpSpecConstantCapabilitiesINTEL = 6253,
-+    OpConditionalCopyObjectINTEL = 6254,
-     OpGroupIMulKHR = 6401,
-     OpGroupFMulKHR = 6402,
-     OpGroupBitwiseAndKHR = 6403,
-@@ -3221,6 +3231,13 @@ inline void HasResultAndType(Op opcode, bool *hasResult, bool *hasResultType) {
-     case OpSubgroup2DBlockStoreINTEL: *hasResult = false; *hasResultType = false; break;
-     case OpSubgroupMatrixMultiplyAccumulateINTEL: *hasResult = true; *hasResultType = true; break;
-     case OpBitwiseFunctionINTEL: *hasResult = true; *hasResultType = true; break;
-+    case OpConditionalExtensionINTEL: *hasResult = false; *hasResultType = false; break;
-+    case OpConditionalEntryPointINTEL: *hasResult = false; *hasResultType = false; break;
-+    case OpConditionalCapabilityINTEL: *hasResult = false; *hasResultType = false; break;
-+    case OpSpecConstantTargetINTEL: *hasResult = true; *hasResultType = true; break;
-+    case OpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
-+    case OpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
-+    case OpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
-     case OpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
-     case OpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
-     case OpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
-@@ -3761,6 +3778,7 @@ inline const char* DecorationToString(Decoration value) {
-     case DecorationHostAccessINTEL: return "HostAccessINTEL";
-     case DecorationInitModeINTEL: return "InitModeINTEL";
-     case DecorationImplementInRegisterMapINTEL: return "ImplementInRegisterMapINTEL";
-+    case DecorationConditionalINTEL: return "ConditionalINTEL";
-     case DecorationCacheControlLoadINTEL: return "CacheControlLoadINTEL";
-     case DecorationCacheControlStoreINTEL: return "CacheControlStoreINTEL";
-     default: return "Unknown";
-@@ -4200,6 +4218,8 @@ inline const char* CapabilityToString(Capability value) {
-     case CapabilitySubgroup2DBlockTransposeINTEL: return "Subgroup2DBlockTransposeINTEL";
-     case CapabilitySubgroupMatrixMultiplyAccumulateINTEL: return "SubgroupMatrixMultiplyAccumulateINTEL";
-     case CapabilityTernaryBitwiseFunctionINTEL: return "TernaryBitwiseFunctionINTEL";
-+    case CapabilitySpecConditionalINTEL: return "SpecConditionalINTEL";
-+    case CapabilityFunctionVariantsINTEL: return "FunctionVariantsINTEL";
-     case CapabilityGroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
-     case CapabilityTensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
-     case CapabilityMaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
-@@ -5194,6 +5214,13 @@ inline const char* OpToString(Op value) {
-     case OpSubgroup2DBlockStoreINTEL: return "OpSubgroup2DBlockStoreINTEL";
-     case OpSubgroupMatrixMultiplyAccumulateINTEL: return "OpSubgroupMatrixMultiplyAccumulateINTEL";
-     case OpBitwiseFunctionINTEL: return "OpBitwiseFunctionINTEL";
-+    case OpConditionalExtensionINTEL: return "OpConditionalExtensionINTEL";
-+    case OpConditionalEntryPointINTEL: return "OpConditionalEntryPointINTEL";
-+    case OpConditionalCapabilityINTEL: return "OpConditionalCapabilityINTEL";
-+    case OpSpecConstantTargetINTEL: return "OpSpecConstantTargetINTEL";
-+    case OpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
-+    case OpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
-+    case OpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
-     case OpGroupIMulKHR: return "OpGroupIMulKHR";
-     case OpGroupFMulKHR: return "OpGroupFMulKHR";
-     case OpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
-diff --git a/include/spirv/unified1/spirv.hpp11 b/include/spirv/unified1/spirv.hpp11
-index b83ca46..e8479cb 100644
---- a/include/spirv/unified1/spirv.hpp11
-+++ b/include/spirv/unified1/spirv.hpp11
-@@ -638,6 +638,7 @@ enum class Decoration : unsigned {
-     HostAccessINTEL = 6188,
-     InitModeINTEL = 6190,
-     ImplementInRegisterMapINTEL = 6191,
-+    ConditionalINTEL = 6247,
-     CacheControlLoadINTEL = 6442,
-     CacheControlStoreINTEL = 6443,
-     Max = 0x7fffffff,
-@@ -1278,6 +1279,8 @@ enum class Capability : unsigned {
-     Subgroup2DBlockTransposeINTEL = 6230,
-     SubgroupMatrixMultiplyAccumulateINTEL = 6236,
-     TernaryBitwiseFunctionINTEL = 6241,
-+    SpecConditionalINTEL = 6245,
-+    FunctionVariantsINTEL = 6246,
-     GroupUniformArithmeticKHR = 6400,
-     TensorFloat32RoundingINTEL = 6425,
-     MaskedGatherScatterINTEL = 6427,
-@@ -2402,6 +2405,13 @@ enum class Op : unsigned {
-     OpSubgroup2DBlockStoreINTEL = 6235,
-     OpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-     OpBitwiseFunctionINTEL = 6242,
-+    OpConditionalExtensionINTEL = 6248,
-+    OpConditionalEntryPointINTEL = 6249,
-+    OpConditionalCapabilityINTEL = 6250,
-+    OpSpecConstantTargetINTEL = 6251,
-+    OpSpecConstantArchitectureINTEL = 6252,
-+    OpSpecConstantCapabilitiesINTEL = 6253,
-+    OpConditionalCopyObjectINTEL = 6254,
-     OpGroupIMulKHR = 6401,
-     OpGroupFMulKHR = 6402,
-     OpGroupBitwiseAndKHR = 6403,
-@@ -3221,6 +3231,13 @@ inline void HasResultAndType(Op opcode, bool *hasResult, bool *hasResultType) {
-     case Op::OpSubgroup2DBlockStoreINTEL: *hasResult = false; *hasResultType = false; break;
-     case Op::OpSubgroupMatrixMultiplyAccumulateINTEL: *hasResult = true; *hasResultType = true; break;
-     case Op::OpBitwiseFunctionINTEL: *hasResult = true; *hasResultType = true; break;
-+    case Op::OpConditionalExtensionINTEL: *hasResult = false; *hasResultType = false; break;
-+    case Op::OpConditionalEntryPointINTEL: *hasResult = false; *hasResultType = false; break;
-+    case Op::OpConditionalCapabilityINTEL: *hasResult = false; *hasResultType = false; break;
-+    case Op::OpSpecConstantTargetINTEL: *hasResult = true; *hasResultType = true; break;
-+    case Op::OpSpecConstantArchitectureINTEL: *hasResult = true; *hasResultType = true; break;
-+    case Op::OpSpecConstantCapabilitiesINTEL: *hasResult = true; *hasResultType = true; break;
-+    case Op::OpConditionalCopyObjectINTEL: *hasResult = true; *hasResultType = true; break;
-     case Op::OpGroupIMulKHR: *hasResult = true; *hasResultType = true; break;
-     case Op::OpGroupFMulKHR: *hasResult = true; *hasResultType = true; break;
-     case Op::OpGroupBitwiseAndKHR: *hasResult = true; *hasResultType = true; break;
-@@ -3761,6 +3778,7 @@ inline const char* DecorationToString(Decoration value) {
-     case Decoration::HostAccessINTEL: return "HostAccessINTEL";
-     case Decoration::InitModeINTEL: return "InitModeINTEL";
-     case Decoration::ImplementInRegisterMapINTEL: return "ImplementInRegisterMapINTEL";
-+    case Decoration::ConditionalINTEL: return "ConditionalINTEL";
-     case Decoration::CacheControlLoadINTEL: return "CacheControlLoadINTEL";
-     case Decoration::CacheControlStoreINTEL: return "CacheControlStoreINTEL";
-     default: return "Unknown";
-@@ -4200,6 +4218,8 @@ inline const char* CapabilityToString(Capability value) {
-     case Capability::Subgroup2DBlockTransposeINTEL: return "Subgroup2DBlockTransposeINTEL";
-     case Capability::SubgroupMatrixMultiplyAccumulateINTEL: return "SubgroupMatrixMultiplyAccumulateINTEL";
-     case Capability::TernaryBitwiseFunctionINTEL: return "TernaryBitwiseFunctionINTEL";
-+    case Capability::SpecConditionalINTEL: return "SpecConditionalINTEL";
-+    case Capability::FunctionVariantsINTEL: return "FunctionVariantsINTEL";
-     case Capability::GroupUniformArithmeticKHR: return "GroupUniformArithmeticKHR";
-     case Capability::TensorFloat32RoundingINTEL: return "TensorFloat32RoundingINTEL";
-     case Capability::MaskedGatherScatterINTEL: return "MaskedGatherScatterINTEL";
-@@ -5194,6 +5214,13 @@ inline const char* OpToString(Op value) {
-     case Op::OpSubgroup2DBlockStoreINTEL: return "OpSubgroup2DBlockStoreINTEL";
-     case Op::OpSubgroupMatrixMultiplyAccumulateINTEL: return "OpSubgroupMatrixMultiplyAccumulateINTEL";
-     case Op::OpBitwiseFunctionINTEL: return "OpBitwiseFunctionINTEL";
-+    case Op::OpConditionalExtensionINTEL: return "OpConditionalExtensionINTEL";
-+    case Op::OpConditionalEntryPointINTEL: return "OpConditionalEntryPointINTEL";
-+    case Op::OpConditionalCapabilityINTEL: return "OpConditionalCapabilityINTEL";
-+    case Op::OpSpecConstantTargetINTEL: return "OpSpecConstantTargetINTEL";
-+    case Op::OpSpecConstantArchitectureINTEL: return "OpSpecConstantArchitectureINTEL";
-+    case Op::OpSpecConstantCapabilitiesINTEL: return "OpSpecConstantCapabilitiesINTEL";
-+    case Op::OpConditionalCopyObjectINTEL: return "OpConditionalCopyObjectINTEL";
-     case Op::OpGroupIMulKHR: return "OpGroupIMulKHR";
-     case Op::OpGroupFMulKHR: return "OpGroupFMulKHR";
-     case Op::OpGroupBitwiseAndKHR: return "OpGroupBitwiseAndKHR";
-diff --git a/include/spirv/unified1/spirv.json b/include/spirv/unified1/spirv.json
-index 0668c98..e0c0230 100644
---- a/include/spirv/unified1/spirv.json
-+++ b/include/spirv/unified1/spirv.json
-@@ -661,6 +661,7 @@
-                     "HostAccessINTEL": 6188,
-                     "InitModeINTEL": 6190,
-                     "ImplementInRegisterMapINTEL": 6191,
-+                    "ConditionalINTEL": 6247,
-                     "CacheControlLoadINTEL": 6442,
-                     "CacheControlStoreINTEL": 6443
-                 }
-@@ -1254,6 +1255,8 @@
-                     "Subgroup2DBlockTransposeINTEL": 6230,
-                     "SubgroupMatrixMultiplyAccumulateINTEL": 6236,
-                     "TernaryBitwiseFunctionINTEL": 6241,
-+                    "SpecConditionalINTEL": 6245,
-+                    "FunctionVariantsINTEL": 6246,
-                     "GroupUniformArithmeticKHR": 6400,
-                     "TensorFloat32RoundingINTEL": 6425,
-                     "MaskedGatherScatterINTEL": 6427,
-@@ -2383,6 +2386,13 @@
-                     "OpSubgroup2DBlockStoreINTEL": 6235,
-                     "OpSubgroupMatrixMultiplyAccumulateINTEL": 6237,
-                     "OpBitwiseFunctionINTEL": 6242,
-+                    "OpConditionalExtensionINTEL": 6248,
-+                    "OpConditionalEntryPointINTEL": 6249,
-+                    "OpConditionalCapabilityINTEL": 6250,
-+                    "OpSpecConstantTargetINTEL": 6251,
-+                    "OpSpecConstantArchitectureINTEL": 6252,
-+                    "OpSpecConstantCapabilitiesINTEL": 6253,
-+                    "OpConditionalCopyObjectINTEL": 6254,
-                     "OpGroupIMulKHR": 6401,
-                     "OpGroupFMulKHR": 6402,
-                     "OpGroupBitwiseAndKHR": 6403,
-diff --git a/include/spirv/unified1/spirv.lua b/include/spirv/unified1/spirv.lua
-index a612e5c..410060b 100644
---- a/include/spirv/unified1/spirv.lua
-+++ b/include/spirv/unified1/spirv.lua
-@@ -629,6 +629,7 @@ spv = {
-         HostAccessINTEL = 6188,
-         InitModeINTEL = 6190,
-         ImplementInRegisterMapINTEL = 6191,
-+        ConditionalINTEL = 6247,
-         CacheControlLoadINTEL = 6442,
-         CacheControlStoreINTEL = 6443,
-         Max = 0x7fffffff,
-@@ -1269,6 +1270,8 @@ spv = {
-         Subgroup2DBlockTransposeINTEL = 6230,
-         SubgroupMatrixMultiplyAccumulateINTEL = 6236,
-         TernaryBitwiseFunctionINTEL = 6241,
-+        SpecConditionalINTEL = 6245,
-+        FunctionVariantsINTEL = 6246,
-         GroupUniformArithmeticKHR = 6400,
-         TensorFloat32RoundingINTEL = 6425,
-         MaskedGatherScatterINTEL = 6427,
-@@ -2393,6 +2396,13 @@ spv = {
-         OpSubgroup2DBlockStoreINTEL = 6235,
-         OpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-         OpBitwiseFunctionINTEL = 6242,
-+        OpConditionalExtensionINTEL = 6248,
-+        OpConditionalEntryPointINTEL = 6249,
-+        OpConditionalCapabilityINTEL = 6250,
-+        OpSpecConstantTargetINTEL = 6251,
-+        OpSpecConstantArchitectureINTEL = 6252,
-+        OpSpecConstantCapabilitiesINTEL = 6253,
-+        OpConditionalCopyObjectINTEL = 6254,
-         OpGroupIMulKHR = 6401,
-         OpGroupFMulKHR = 6402,
-         OpGroupBitwiseAndKHR = 6403,
-diff --git a/include/spirv/unified1/spirv.py b/include/spirv/unified1/spirv.py
-index 5adfded..0b77b4f 100644
---- a/include/spirv/unified1/spirv.py
-+++ b/include/spirv/unified1/spirv.py
-@@ -611,6 +611,7 @@ spv = {
-         'HostAccessINTEL' : 6188,
-         'InitModeINTEL' : 6190,
-         'ImplementInRegisterMapINTEL' : 6191,
-+        'ConditionalINTEL' : 6247,
-         'CacheControlLoadINTEL' : 6442,
-         'CacheControlStoreINTEL' : 6443,
-     },
-@@ -1240,6 +1241,8 @@ spv = {
-         'Subgroup2DBlockTransposeINTEL' : 6230,
-         'SubgroupMatrixMultiplyAccumulateINTEL' : 6236,
-         'TernaryBitwiseFunctionINTEL' : 6241,
-+        'SpecConditionalINTEL' : 6245,
-+        'FunctionVariantsINTEL' : 6246,
-         'GroupUniformArithmeticKHR' : 6400,
-         'TensorFloat32RoundingINTEL' : 6425,
-         'MaskedGatherScatterINTEL' : 6427,
-@@ -2336,6 +2339,13 @@ spv = {
-         'OpSubgroup2DBlockStoreINTEL' : 6235,
-         'OpSubgroupMatrixMultiplyAccumulateINTEL' : 6237,
-         'OpBitwiseFunctionINTEL' : 6242,
-+        'OpConditionalExtensionINTEL' : 6248,
-+        'OpConditionalEntryPointINTEL' : 6249,
-+        'OpConditionalCapabilityINTEL' : 6250,
-+        'OpSpecConstantTargetINTEL' : 6251,
-+        'OpSpecConstantArchitectureINTEL' : 6252,
-+        'OpSpecConstantCapabilitiesINTEL' : 6253,
-+        'OpConditionalCopyObjectINTEL' : 6254,
-         'OpGroupIMulKHR' : 6401,
-         'OpGroupFMulKHR' : 6402,
-         'OpGroupBitwiseAndKHR' : 6403,
-diff --git a/include/spirv/unified1/spv.d b/include/spirv/unified1/spv.d
-index 3c5130a..a5763e6 100644
---- a/include/spirv/unified1/spv.d
-+++ b/include/spirv/unified1/spv.d
-@@ -657,6 +657,7 @@ enum Decoration : uint
-     HostAccessINTEL = 6188,
-     InitModeINTEL = 6190,
-     ImplementInRegisterMapINTEL = 6191,
-+    ConditionalINTEL = 6247,
-     CacheControlLoadINTEL = 6442,
-     CacheControlStoreINTEL = 6443,
-     Max = 0x7fffffff,
-@@ -1314,6 +1315,8 @@ enum Capability : uint
-     Subgroup2DBlockTransposeINTEL = 6230,
-     SubgroupMatrixMultiplyAccumulateINTEL = 6236,
-     TernaryBitwiseFunctionINTEL = 6241,
-+    SpecConditionalINTEL = 6245,
-+    FunctionVariantsINTEL = 6246,
-     GroupUniformArithmeticKHR = 6400,
-     TensorFloat32RoundingINTEL = 6425,
-     MaskedGatherScatterINTEL = 6427,
-@@ -2474,6 +2477,13 @@ enum Op : uint
-     OpSubgroup2DBlockStoreINTEL = 6235,
-     OpSubgroupMatrixMultiplyAccumulateINTEL = 6237,
-     OpBitwiseFunctionINTEL = 6242,
-+    OpConditionalExtensionINTEL = 6248,
-+    OpConditionalEntryPointINTEL = 6249,
-+    OpConditionalCapabilityINTEL = 6250,
-+    OpSpecConstantTargetINTEL = 6251,
-+    OpSpecConstantArchitectureINTEL = 6252,
-+    OpSpecConstantCapabilitiesINTEL = 6253,
-+    OpConditionalCopyObjectINTEL = 6254,
-     OpGroupIMulKHR = 6401,
-     OpGroupFMulKHR = 6402,
-     OpGroupBitwiseAndKHR = 6403,
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
similarity index 83%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
index 807e34abcc26..2b750e4b9222 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main \
-           file://0001-Add-SPV_INTEL_function_variants-532.patch \
-		  "
+SRCREV = "01e0577914a75a2569c846778c2f93aa8e6feddd"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=vulkan-sdk-1.4.328 \
+"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch b/meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch
deleted file mode 100644
index d4ca23c72955..000000000000
--- a/meta/recipes-graphics/spir/spirv-tools/0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch
+++ /dev/null
@@ -1,289 +0,0 @@
-From 28a883ba4c67f58a9540fb0651c647bb02883622 Mon Sep 17 00:00:00 2001
-From: David Neto <dneto@google.com>
-Date: Wed, 25 Jun 2025 11:27:23 -0400
-Subject: [PATCH] SPV_INTEL_function_variants: basic asm, dis support (#6195)
-
-The challenging part is that there are instructions that
-take zero or more Capability operands.  So we have to introduce
-SPV_TYPE_OPERAND_VARIABLE_CAPABILITY and SPV_TYPE_OPERAND_OPTIONAL_CAPABILITY.
-
-Remove deprecated enums for the first and last variable or optional
-enums.
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/commit/28a883ba4c67f58a9540fb0651c647bb02883622]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- DEPS                                   |  2 +-
- include/spirv-tools/libspirv.h         | 48 +++++++----------
- source/binary.cpp                      |  3 ++
- source/disassemble.cpp                 |  1 +
- source/operand.cpp                     |  7 +++
- test/text_to_binary.extension_test.cpp | 73 ++++++++++++++++++++++++++
- utils/ggt.py                           |  3 +-
- 7 files changed, 107 insertions(+), 30 deletions(-)
-
-diff --git a/DEPS b/DEPS
-index e25ca513..511fd718 100644
---- a/DEPS
-+++ b/DEPS
-@@ -14,7 +14,7 @@ vars = {
- 
-   're2_revision': 'c84a140c93352cdabbfb547c531be34515b12228',
- 
--  'spirv_headers_revision': '2a611a970fdbc41ac2e3e328802aed9985352dca',
-+  'spirv_headers_revision': '9e3836d7d6023843a72ecd3fbf3f09b1b6747a9e',
- 
-   'mimalloc_revision': '09a27098aa6e9286518bd9c74e6ffa7199c3f04e',
- }
-diff --git a/include/spirv-tools/libspirv.h b/include/spirv-tools/libspirv.h
-index a2a032a0..2a604e94 100644
---- a/include/spirv-tools/libspirv.h
-+++ b/include/spirv-tools/libspirv.h
-@@ -189,36 +189,24 @@ typedef enum spv_operand_type_t {
-   SPV_OPERAND_TYPE_MEMORY_ACCESS,          // SPIR-V Sec 3.26
-   SPV_OPERAND_TYPE_FRAGMENT_SHADING_RATE,  // SPIR-V Sec 3.FSR
- 
--// NOTE: New concrete enum values should be added at the end.
--
--// The "optional" and "variable"  operand types are only used internally by
--// the assembler and the binary parser.
--// There are two categories:
--//    Optional : expands to 0 or 1 operand, like ? in regular expressions.
--//    Variable : expands to 0, 1 or many operands or pairs of operands.
--//               This is similar to * in regular expressions.
--
--// NOTE: These FIRST_* and LAST_* enum values are DEPRECATED.
--// The concept of "optional" and "variable" operand types are only intended
--// for use as an implementation detail of parsing SPIR-V, either in text or
--// binary form.  Instead of using enum ranges, use characteristic function
--// spvOperandIsConcrete.
--// The use of enum value ranges in a public API makes it difficult to insert
--// new values into a range without also breaking binary compatibility.
--//
--// Macros for defining bounds on optional and variable operand types.
--// Any variable operand type is also optional.
--// TODO(dneto): Remove SPV_OPERAND_TYPE_FIRST_* and SPV_OPERAND_TYPE_LAST_*
--#define FIRST_OPTIONAL(ENUM) ENUM, SPV_OPERAND_TYPE_FIRST_OPTIONAL_TYPE = ENUM
--#define FIRST_VARIABLE(ENUM) ENUM, SPV_OPERAND_TYPE_FIRST_VARIABLE_TYPE = ENUM
--#define LAST_VARIABLE(ENUM)                         \
--  ENUM, SPV_OPERAND_TYPE_LAST_VARIABLE_TYPE = ENUM, \
--        SPV_OPERAND_TYPE_LAST_OPTIONAL_TYPE = ENUM
-+  // NOTE: New concrete enum values should be added at the end.
-+
-+  // The "optional" and "variable"  operand types are only used internally by
-+  // the assembler and the binary parser.
-+  // There are two categories:
-+  //    Optional : expands to 0 or 1 operand, like ? in regular expressions.
-+  //    Variable : expands to 0, 1 or many operands or pairs of operands.
-+  //               This is similar to * in regular expressions.
-+
-+  // Use characteristic function spvOperandIsConcrete to classify the
-+  // operand types; when it returns false, the operand is optional or variable.
-+  //
-+  // Any variable operand type is also optional.
- 
-   // An optional operand represents zero or one logical operands.
-   // In an instruction definition, this may only appear at the end of the
-   // operand types.
--  FIRST_OPTIONAL(SPV_OPERAND_TYPE_OPTIONAL_ID),
-+  SPV_OPERAND_TYPE_OPTIONAL_ID,
-   // An optional image operand type.
-   SPV_OPERAND_TYPE_OPTIONAL_IMAGE,
-   // An optional memory access type.
-@@ -243,7 +231,7 @@ typedef enum spv_operand_type_t {
-   // A variable operand represents zero or more logical operands.
-   // In an instruction definition, this may only appear at the end of the
-   // operand types.
--  FIRST_VARIABLE(SPV_OPERAND_TYPE_VARIABLE_ID),
-+  SPV_OPERAND_TYPE_VARIABLE_ID,
-   SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER,
-   // A sequence of zero or more pairs of (typed literal integer, Id).
-   // Expands to zero or more:
-@@ -251,7 +239,7 @@ typedef enum spv_operand_type_t {
-   // where the literal number must always be an integer of some sort.
-   SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER_ID,
-   // A sequence of zero or more pairs of (Id, Literal integer)
--  LAST_VARIABLE(SPV_OPERAND_TYPE_VARIABLE_ID_LITERAL_INTEGER),
-+  SPV_OPERAND_TYPE_VARIABLE_ID_LITERAL_INTEGER,
- 
-   // The following are concrete enum types from the DebugInfo extended
-   // instruction set.
-@@ -343,6 +331,10 @@ typedef enum spv_operand_type_t {
-   SPV_OPERAND_TYPE_TENSOR_OPERANDS,
-   SPV_OPERAND_TYPE_OPTIONAL_TENSOR_OPERANDS,
- 
-+  // SPV_INTEL_function_variants
-+  SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY,
-+  SPV_OPERAND_TYPE_VARIABLE_CAPABILITY,
-+
-   // This is a sentinel value, and does not represent an operand type.
-   // It should come last.
-   SPV_OPERAND_TYPE_NUM_OPERAND_TYPES,
-diff --git a/source/binary.cpp b/source/binary.cpp
-index 180d0a99..8e4d899f 100644
---- a/source/binary.cpp
-+++ b/source/binary.cpp
-@@ -636,6 +636,7 @@ spv_result_t Parser::parseOperand(size_t inst_offset,
-     } break;
- 
-     case SPV_OPERAND_TYPE_CAPABILITY:
-+    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
-     case SPV_OPERAND_TYPE_EXECUTION_MODEL:
-     case SPV_OPERAND_TYPE_ADDRESSING_MODEL:
-     case SPV_OPERAND_TYPE_MEMORY_MODEL:
-@@ -689,6 +690,8 @@ spv_result_t Parser::parseOperand(size_t inst_offset,
-         parsed_operand.type = SPV_OPERAND_TYPE_PACKED_VECTOR_FORMAT;
-       if (type == SPV_OPERAND_TYPE_OPTIONAL_FPENCODING)
-         parsed_operand.type = SPV_OPERAND_TYPE_FPENCODING;
-+      if (type == SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY)
-+        parsed_operand.type = SPV_OPERAND_TYPE_CAPABILITY;
- 
-       const spvtools::OperandDesc* entry = nullptr;
-       if (spvtools::LookupOperand(type, word, &entry)) {
-diff --git a/source/disassemble.cpp b/source/disassemble.cpp
-index 2d9bb0ff..4267333a 100644
---- a/source/disassemble.cpp
-+++ b/source/disassemble.cpp
-@@ -907,6 +907,7 @@ void InstructionDisassembler::EmitOperand(std::ostream& stream,
-       stream << '"';
-     } break;
-     case SPV_OPERAND_TYPE_CAPABILITY:
-+    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
-     case SPV_OPERAND_TYPE_SOURCE_LANGUAGE:
-     case SPV_OPERAND_TYPE_EXECUTION_MODEL:
-     case SPV_OPERAND_TYPE_ADDRESSING_MODEL:
-diff --git a/source/operand.cpp b/source/operand.cpp
-index c635c72d..d7fc535c 100644
---- a/source/operand.cpp
-+++ b/source/operand.cpp
-@@ -111,6 +111,7 @@ const char* spvOperandTypeStr(spv_operand_type_t type) {
-     case SPV_OPERAND_TYPE_KERNEL_PROFILING_INFO:
-       return "kernel profiling info";
-     case SPV_OPERAND_TYPE_CAPABILITY:
-+    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
-       return "capability";
-     case SPV_OPERAND_TYPE_RAY_FLAGS:
-       return "ray flags";
-@@ -394,6 +395,7 @@ bool spvOperandIsOptional(spv_operand_type_t type) {
-     case SPV_OPERAND_TYPE_OPTIONAL_RAW_ACCESS_CHAIN_OPERANDS:
-     case SPV_OPERAND_TYPE_OPTIONAL_FPENCODING:
-     case SPV_OPERAND_TYPE_OPTIONAL_TENSOR_OPERANDS:
-+    case SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY:
-       return true;
-     default:
-       break;
-@@ -408,6 +410,7 @@ bool spvOperandIsVariable(spv_operand_type_t type) {
-     case SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER:
-     case SPV_OPERAND_TYPE_VARIABLE_LITERAL_INTEGER_ID:
-     case SPV_OPERAND_TYPE_VARIABLE_ID_LITERAL_INTEGER:
-+    case SPV_OPERAND_TYPE_VARIABLE_CAPABILITY:
-       return true;
-     default:
-       break;
-@@ -439,6 +442,10 @@ bool spvExpandOperandSequenceOnce(spv_operand_type_t type,
-       pattern->push_back(SPV_OPERAND_TYPE_LITERAL_INTEGER);
-       pattern->push_back(SPV_OPERAND_TYPE_OPTIONAL_ID);
-       return true;
-+    case SPV_OPERAND_TYPE_VARIABLE_CAPABILITY:
-+      pattern->push_back(type);
-+      pattern->push_back(SPV_OPERAND_TYPE_OPTIONAL_CAPABILITY);
-+      return true;
-     default:
-       break;
-   }
-diff --git a/test/text_to_binary.extension_test.cpp b/test/text_to_binary.extension_test.cpp
-index 65079d1b..39accfc1 100644
---- a/test/text_to_binary.extension_test.cpp
-+++ b/test/text_to_binary.extension_test.cpp
-@@ -1495,5 +1495,78 @@ INSTANTIATE_TEST_SUITE_P(
-                                SaturatedToLargestFloat8NormalConversionEXT)})},
-         })));
- 
-+// SPV_INTEL_function_variants
-+// https://github.com/intel/llvm/blob/sycl/sycl/doc/design/spirv-extensions/SPV_INTEL_function_variants.asciidoc
-+INSTANTIATE_TEST_SUITE_P(
-+    SPV_INTEL_function_variants, ExtensionRoundTripTest,
-+    Combine(
-+        Values(SPV_ENV_UNIVERSAL_1_0, SPV_ENV_UNIVERSAL_1_6),
-+        ValuesIn(std::vector<AssemblyCase>{
-+            {"OpExtension \"SPV_INTEL_function_variants\"\n",
-+             MakeInstruction(spv::Op::OpExtension,
-+                             MakeVector("SPV_INTEL_function_variants"))},
-+            {"OpCapability SpecConditionalINTEL\n",
-+             MakeInstruction(
-+                 spv::Op::OpCapability,
-+                 {(uint32_t)spv::Capability::SpecConditionalINTEL})},
-+            {"OpCapability FunctionVariantsINTEL\n",
-+             MakeInstruction(
-+                 spv::Op::OpCapability,
-+                 {(uint32_t)spv::Capability::FunctionVariantsINTEL})},
-+            {"OpDecorate %1 ConditionalINTEL %2\n",
-+             MakeInstruction(spv::Op::OpDecorate,
-+                             {1, (uint32_t)spv::Decoration::ConditionalINTEL,
-+                              2})},
-+
-+            {"OpConditionalExtensionINTEL %1 \"foo\"\n",
-+             MakeInstruction(spv::Op::OpConditionalExtensionINTEL, {1},
-+                             MakeVector("foo"))},
-+
-+            {"OpConditionalEntryPointINTEL %1 Kernel %2 \"foo\"\n",
-+             MakeInstruction(spv::Op::OpConditionalEntryPointINTEL,
-+                             {1, (uint32_t)spv::ExecutionModel::Kernel, 2},
-+                             MakeVector("foo"))},
-+
-+            {"OpConditionalCapabilityINTEL %1 Kernel\n",
-+             MakeInstruction(spv::Op::OpConditionalCapabilityINTEL,
-+                             {1, (uint32_t)spv::ExecutionModel::Kernel})},
-+
-+            {"%2 = OpSpecConstantTargetINTEL %1 42\n",
-+             MakeInstruction(spv::Op::OpSpecConstantTargetINTEL, {1, 2, 42})},
-+
-+            {"%2 = OpSpecConstantTargetINTEL %1 42 99\n",
-+             MakeInstruction(spv::Op::OpSpecConstantTargetINTEL,
-+                             {1, 2, 42, 99})},
-+
-+            {"%2 = OpSpecConstantTargetINTEL %1 42 99 108\n",
-+             MakeInstruction(spv::Op::OpSpecConstantTargetINTEL,
-+                             {1, 2, 42, 99, 108})},
-+
-+            {"%2 = OpSpecConstantArchitectureINTEL %1 42 99 108 72\n",
-+             MakeInstruction(spv::Op::OpSpecConstantArchitectureINTEL,
-+                             {1, 2, 42, 99, 108, 72})},
-+
-+            {"%2 = OpSpecConstantCapabilitiesINTEL %1\n",
-+             MakeInstruction(spv::Op::OpSpecConstantCapabilitiesINTEL, {1, 2})},
-+
-+            {"%2 = OpSpecConstantCapabilitiesINTEL %1 Kernel\n",
-+             MakeInstruction(spv::Op::OpSpecConstantCapabilitiesINTEL,
-+                             {1, 2, (uint32_t)spv::Capability::Kernel})},
-+
-+            {"%2 = OpSpecConstantCapabilitiesINTEL %1 Kernel Shader\n",
-+             MakeInstruction(spv::Op::OpSpecConstantCapabilitiesINTEL,
-+                             {1, 2, (uint32_t)spv::Capability::Kernel,
-+                              (uint32_t)spv::Capability::Shader})},
-+
-+            {"%2 = OpConditionalCopyObjectINTEL %1 %3 %4\n",
-+             MakeInstruction(spv::Op::OpConditionalCopyObjectINTEL,
-+                             {1, 2, 3, 4})},
-+
-+            {"%2 = OpConditionalCopyObjectINTEL %1 %3 %4 %5 %6\n",
-+             MakeInstruction(spv::Op::OpConditionalCopyObjectINTEL,
-+                             {1, 2, 3, 4, 5, 6})},
-+
-+        })));
-+
- }  // namespace
- }  // namespace spvtools
-diff --git a/utils/ggt.py b/utils/ggt.py
-index 258c1b00..45262ba8 100755
---- a/utils/ggt.py
-+++ b/utils/ggt.py
-@@ -242,7 +242,8 @@ class Grammar():
-                 'MatrixMultiplyAccumulateOperands',
-                 'RawAccessChainOperands',
-                 'FPEncoding',
--                'TensorOperands']
-+                'TensorOperands',
-+                'Capability']
- 
-     def dump(self) -> None:
-         self.context.dump()
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
similarity index 91%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
index c3e0d17d87ab..e5aedb162086 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
-           file://0001-SPV_INTEL_function_variants-basic-asm-dis-support-61.patch \
+SRCREV = "7f2d9ee926f98fc77a3ed1e1e0f113b8c9c49458"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb
similarity index 92%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb
index b3413b0e6b14..d531ec8e87be 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb
@@ -9,9 +9,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=vulkan-sdk-1.4.328;protocol=https"
 
-SRCREV = "2cd90f9d20df57eac214c148f3aed885372ddcfe"
+SRCREV = "19725e4d48082fe78e26622b15d3080ccd54112b"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
index 8ad088fa7edd..d80e84a34e5c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.321;protocol=https"
-SRCREV = "da8d2caad9341ca8c5a7c3deba217d7da50a7c24"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.328;protocol=https"
+SRCREV = "0a278cc725089cb67bf6027076e5d72f97c04d86"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
index 26c196336e60..34823b295c78 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.328.1.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.321;protocol=https"
-SRCREV = "06ae73a3dc3a03466817d8370355203dac7b79b1"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.328;protocol=https"
+SRCREV = "c08c91e473dcab3d5042e85856b005562fa5dbbb"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
index 54e8af6dcfad..d59efaaaee5c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.321;protocol=https"
-SRCREV = "ec329e2721921f79743b90307ee047d08e057788"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.328;protocol=https"
+SRCREV = "4322db5906e67b57ec9c327e6afe3d98ed893df7"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.328.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.328.1.bb
index 466e757a908d..76a87398c499 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.328.1.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.321;protocol=https"
-SRCREV = "fee7b2b4a926355e48668e29570be129eb82cb36"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.328;protocol=https"
+SRCREV = "83bcbddf0813cbe5cbf1b916b612e493e2cacd70"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
similarity index 88%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
index 17a290ed1d0c..a6b4b2735506 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
-SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "a8da8ef3368482b0ee9b0ec0c6079a16a89c6924"
+SRC_URI = "git://github.com/zeux/volk.git;branch=vulkan-sdk-1.4.328;protocol=https"
+SRCREV = "f30088b3f4160810b53e19258dd2f7395e5f0ba3"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.3


