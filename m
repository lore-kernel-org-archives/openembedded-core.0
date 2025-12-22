Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98866E677E1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81379.1766415262531539201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 06:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JRx5TXW2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44517665e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMBwGuA2725326;
	Mon, 22 Dec 2025 14:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=h77pyXTwla2bCsbEe0K8PTr3hZSgrNRB+PrgiGxKC1Y=; b=JRx5TXW2k2GV
	xg+F65W1n6xHgIOiy+Sah/woh6GujH3uxpqwU8zRz/0kSld7dceXKUWv3EgKh7UV
	F1cEA4inylQcFnV8k2GSNfPurHPxd7gDHBez0r/wtA9ohjObMMaNNEplGpqY0qON
	BbyzA4vWl548AAAh8OOrytJkRhVuHs64lTnzUUfNXTR2yJP2S8DkNH4ibm/VKdEg
	3VkRhnzzd/zI63uIiDEkGhP7LktjTQ8bG+sCl/naEx55tEoE68KUcwu25hbNoO0G
	xFkf65tAp0hvVLDWiAT8xrIKuoX72FxnqMxkIX5/bPTjlW4z2PnEWUWrO6uchw3W
	WspBP6PvDA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js71u70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2025 14:54:19 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 06:54:16 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 06:54:15 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v7 6/6] Clean up compiler optimization variable DEBUG_OPTIMIZATION
Date: Mon, 22 Dec 2025 22:54:03 +0800
Message-ID: <20251222145403.3688113-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222145403.3688113-1-hongxu.jia@windriver.com>
References: <20251222145403.3688113-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3zQUDCpyVF_zg4zyJYSx1_WSxZZPPW3I
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=69495b9b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=WYqJZ4mwHZK2OaCqjwEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3zQUDCpyVF_zg4zyJYSx1_WSxZZPPW3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNSBTYWx0ZWRfXwwDyPSC49ntX
 akyKwXwqTmUgZsOCYWuAEfPo7LnH5X+UwAJQtF+Rb6lxNJxi/1leertn5nj4NngUJKVK+dKLZvA
 xa+t3wPnUqyz52DdJKB/u1URLh7wBLB1x2rBE0RZJtLPX0ySeKI9cQ95fyeln/kXFeSBXxJ8Poj
 PMXW7MraPLlan8iH89vvWhZTTe4YMilxs08pWsUCloPTHvrHj1FoED9eAK/vRYmzVtWSVFT5rXY
 Mu5IL7fWLg9oEgyxJNTjUbwAxB0RrgZJ/T/H8n1pYSiuemfyzbw8PrX3U6i62fcsLZ5raPaqmHw
 YaG1uoHVPh4cwIpJkpmcGJbRxhPCoKpv2BqgaWjPtKv5jJN/H4s0q6qT51fhPkHJL88w/pI1YEv
 zELVV1e0ZHkQ6o/CGWvd5AmGzi3qkWoi9X4CR8kiCHfzlLpO/+YJFYrlME9l9/vHnt6plnbGMZ7
 N3/bLlmg8m9gG1BaHdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228309

Remove DEBUG_OPTIMIZATION, set "-Og ${DEBUG_LEVELFLAG}" to
SELECTED_OPTIMIZATION when debug optimization is enabled (fragment
core/yocto/debug-optimize)

Use SELECTED_OPTIMIZATION to instead of DEBUG_OPTIMIZATION
for debug optimization tuning configuration

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/debug-optimize.inc   | 25 +++++++++----------
 meta/conf/documentation.conf                  |  3 +--
 meta/conf/fragments/yocto/debug-optimize.conf |  2 +-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/debug-optimize.inc b/meta/conf/distro/include/debug-optimize.inc
index 55f35dd7c6..587c12721a 100644
--- a/meta/conf/distro/include/debug-optimize.inc
+++ b/meta/conf/distro/include/debug-optimize.inc
@@ -1,26 +1,25 @@
 # Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when fragment 'core/yocto/debug-optimize' is enabled.
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
 
 BUILD_OPTIMIZATION:mips:pn-kea = "-O -g"
 BUILD_OPTIMIZATION:mipsel:pn-kea = "-O -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 7d2163bae0..94441416cd 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,7 +129,6 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
 DEBUG_OPTIMIZE[doc] = "Specifies to build recipe with debugging friendly optimization. This influences the value of the SELECTED_OPTIMIZATION variable."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
@@ -369,7 +368,7 @@ SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creat
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
-SELECTED_OPTIMIZATION[doc] = "The variable takes the value of '-O2 ${DEBUG_LEVELFLAG}' unless fragment 'core/yocto/debug-optimize' is enabled. In this case, the value of DEBUG_OPTIMIZATION is used."
+SELECTED_OPTIMIZATION[doc] = "The variable takes the value of '-O2 ${DEBUG_LEVELFLAG}' unless fragment 'core/yocto/debug-optimize' is enabled. In this case, the value of '-Og ${DEBUG_LEVELFLAG}' is used."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
diff --git a/meta/conf/fragments/yocto/debug-optimize.conf b/meta/conf/fragments/yocto/debug-optimize.conf
index 000b5a50cd..afdb877479 100644
--- a/meta/conf/fragments/yocto/debug-optimize.conf
+++ b/meta/conf/fragments/yocto/debug-optimize.conf
@@ -2,6 +2,6 @@ BB_CONF_FRAGMENT_SUMMARY = "Specifies to build recipes with debugging friendly o
 This influences the value of the SELECTED_OPTIMIZATION variable."
 BB_CONF_FRAGMENT_DESCRIPTION = "Enables full debug and backtrace capabilities for all programs \
 and libraries in the image, by modifying the SELECTED_OPTIMIZATION variable, \
-setting it to "DEBUG_OPTIMIZATION"."
+setting it to '-Og ${DEBUG_LEVELFLAG}'."
 
 DEBUG_OPTIMIZE ?= "1"
-- 
2.34.1


