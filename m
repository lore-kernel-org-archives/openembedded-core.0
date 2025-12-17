Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EDED65C62
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17083.1765985073711266449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MFGEiUAk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCuSkr574399;
	Wed, 17 Dec 2025 15:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ve0OoTlKVsX9P4qwLJsyxgdZ9kNEiOeKEgyzTxrw8xY=; b=MFGEiUAkWBLg
	fjls1B0sTEixs9DwpP9QNUDgkwPL3HAMT0s0LFCSf9EcMk116WtUeKv09gREuoVy
	BanuH4G2KZPkfnYFXOA2B+qe0LJe7xB4faXJWidZUFiXEG1757WwLu2S7kgvh1vF
	vELyvG9dndp57w3kju4LfdxZ0mqSuRthk2HPhPdt+C/xGsDjjjiF6LpnJKX7+tTZ
	3OV/tqRjbQpzN/tAn9HmOS/Bu/ym4GzPCX8Hl2YjwhNEbTUcr6AJKnsMupKNDlB4
	BgY84yuZwZORvfu4gLbIwe2EJLMksxeDidQnSmp/u7Do0pesaLkIbF1yxRujsqkf
	eVK0RMaHng==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k68rr29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 15:24:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:30 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 8/8] Clean up compiler optimization variable DEBUG_OPTIMIZATION
Date: Wed, 17 Dec 2025 23:24:21 +0800
Message-ID: <20251217152421.1181080-8-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfX5WdCK4r4twGk
 9HvUHSv13yJqUYd+CgWHCAhkCxmCP1pg4NT85Op4lf1t5GNDNZ7YXN3jnpacaq0jyzQd1w2+c1D
 SfeG6OVLEjX6Ju6uXLu1r6wLj2Mn7f980xDWwheKT/3D5XeXZfYNtBZPp6dpKmjHHWblS1xIFJd
 W/QlUi1IBI4exXoYJBSajfJadgiDpntKGGNyZ8+Gyy6CN3d3i8JiI5Greelblu73J+vukGaUlNi
 PsvsiYoG8oaxUI9m575rVH+XyIUzafU9P2nEfaQiyMEahz01Q2aMLr+paAdqoYFWaB4q8xe7wy1
 tazVeW6ZTF4ImBE+xDW8PXMnaUrhtvk3HEgwFEi+rq015YfjCZXf+iLIsUmbNEhJ9yFuLPBX4Kj
 lZF6Ee05KWCcuCPYG33rDP2S1dr2OA==
X-Proofpoint-ORIG-GUID: fODrKM4SqfBaJXvfkKedQDqHhj8e-Oa4
X-Proofpoint-GUID: fODrKM4SqfBaJXvfkKedQDqHhj8e-Oa4
X-Authority-Analysis: v=2.4 cv=EpLfbCcA c=1 sm=1 tr=0 ts=6942cb30 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=69wJf7TsAAAA:8 a=t7CeM3EgAAAA:8
 a=N3d6yfmxjZLdeZyX-EkA:9 a=STXwoKBC1RUA:10 a=Fg1AiH1G6rFz08G2ETeA:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228062

Remove DEBUG_OPTIMIZATION, set "-Og ${DEBUG_LEVELFLAG}" to
SELECTED_OPTIMIZATION when debug build is enabled (fragment
core/yocto/debug-build)

Use SELECTED_OPTIMIZATION to instead of DEBUG_OPTIMIZATION
for debug tuning configuration

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/debug_build.inc   | 31 +++++++++++-----------
 meta/conf/documentation.conf               |  3 +--
 meta/conf/fragments/yocto/debug-build.conf |  2 +-
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
index aadc87e5f5..a9e9b0f439 100644
--- a/meta/conf/distro/include/debug_build.inc
+++ b/meta/conf/distro/include/debug_build.inc
@@ -1,31 +1,30 @@
 # Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when fragment 'core/yocto/debug-build' is enabled.
-DEBUG_OPTIMIZATION ?= "-Og ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION ?= "${DEBUG_OPTIMIZATION}"
+SELECTED_OPTIMIZATION ?= "-Og ${DEBUG_LEVELFLAG}"
 # compiler flags for native/nativesdk
 BUILD_OPTIMIZATION ?= "-Og -g"
 
 # The modern compilers and code seem to require extra steps to avoid DEBUG errors,
 # this file collects debug tuning configuration to address DEBUG errors.
 
-DEBUG_OPTIMIZATION:append:pn-perf = " -Wno-error=maybe-uninitialized"
-DEBUG_OPTIMIZATION:append:armv4:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION:append:armv5:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION:append:armv4:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION:append:armv5:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-DEBUG_OPTIMIZATION:append:pn-mdadm = " -Wno-error"
-DEBUG_OPTIMIZATION:mips:pn-kea = "-O ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION:mipsel:pn-kea = "-O ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:append:pn-perf = " -Wno-error=maybe-uninitialized"
+SELECTED_OPTIMIZATION:append:armv4:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+SELECTED_OPTIMIZATION:append:armv5:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+SELECTED_OPTIMIZATION:append:armv4:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+SELECTED_OPTIMIZATION:append:armv5:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
+SELECTED_OPTIMIZATION:append:pn-mdadm = " -Wno-error"
+SELECTED_OPTIMIZATION:mips:pn-kea = "-O ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:mipsel:pn-kea = "-O ${DEBUG_LEVELFLAG}"
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-DEBUG_OPTIMIZATION:mips:pn-python3-lxml = "-O ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION:mipsel:pn-python3-lxml = "-O ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:mips:pn-python3-lxml = "-O ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:mipsel:pn-python3-lxml = "-O ${DEBUG_LEVELFLAG}"
 # used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers = " -Wno-error"
+SELECTED_OPTIMIZATION:append:pn-gcc-sanitizers = " -Wno-error"
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
 # upstream states qemu doesn't work without optimization
-DEBUG_OPTIMIZATION:pn-qemu = "-O2 ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION:pn-qemu-native = "-O2 ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION:pn-nativesdk-qemu = "-O2 ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:pn-qemu = "-O2 ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:pn-qemu-native = "-O2 ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION:pn-nativesdk-qemu = "-O2 ${DEBUG_LEVELFLAG}"
 
 BUILD_OPTIMIZATION:mips:pn-kea = "-O -g"
 BUILD_OPTIMIZATION:mipsel:pn-kea = "-O -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 91912a288e..fd318b95c9 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,7 +129,6 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
@@ -368,7 +367,7 @@ SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creat
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
-SELECTED_OPTIMIZATION[doc] = "The variable takes the value of '-O2 ${DEBUG_LEVELFLAG}' less fragment 'core/yocto/debug-build' is enabled. In this case, the value of DEBUG_OPTIMIZATION is used."
+SELECTED_OPTIMIZATION[doc] = "The variable takes the value of '-O2 ${DEBUG_LEVELFLAG}' less fragment 'core/yocto/debug-build' is enabled. In this case, the value of '-Og ${DEBUG_LEVELFLAG}' is used."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
diff --git a/meta/conf/fragments/yocto/debug-build.conf b/meta/conf/fragments/yocto/debug-build.conf
index 5bdc1366b4..dbd7bf114f 100644
--- a/meta/conf/fragments/yocto/debug-build.conf
+++ b/meta/conf/fragments/yocto/debug-build.conf
@@ -2,7 +2,7 @@ BB_CONF_FRAGMENT_SUMMARY = "Specifies to build recipes with debugging informatio
 This influences the value of the SELECTED_OPTIMIZATION variable."
 BB_CONF_FRAGMENT_DESCRIPTION = "Enables full debug and backtrace capabilities for all programs \
 and libraries in the image, by modifying the SELECTED_OPTIMIZATION variable, \
-setting it to "DEBUG_OPTIMIZATION"."
+setting it to '-Og ${DEBUG_LEVELFLAG}'."
 
 # Allow other layers to add their own debug build configurations
 include_all conf/distro/include/debug_build.inc
-- 
2.34.1


