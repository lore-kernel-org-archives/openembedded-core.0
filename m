Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AEFD65C70
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17520.1765985072265789546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mL1ROoxJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4KvM91481957;
	Wed, 17 Dec 2025 07:24:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MWiP+434t4or2dnaF50dTr99jk0po1WXjfFLC9HXTrk=; b=mL1ROoxJ0ClR
	JpEdTqjTxoPqyTD9vtyi7GqsSP3gazoAerkoGxVUULGaGNJ+8eojaB++GyTu5q9K
	bpA0kBNRjUNl9hkOTdJssj+YWh6SbecLztdx+JKR++CioomGKlaq06vaf8LGHqkG
	Q8tAnlLm+LwI1m9bJmpM+NKbQi2KgV8g+BNN8tzNcsnF0b6KoWoDxkpZ+opTX9ry
	BRzCboVY8ltrDsfg0VcQ/8WqO+xEnvUZNIUvv2fHowuMCc8eNi2+3t4/h8uvgQpf
	RoufgZEWaEKba78X26dVHFmEDHM0jXB4JAmgGgj4lR6XfQ0DLRMhnewyGeZdXkKH
	YqvlgMV3Mw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sgquj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 07:24:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:29 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 7/8] Clean up compiler optimization variable FULL_OPTIMIZATION
Date: Wed, 17 Dec 2025 23:24:20 +0800
Message-ID: <20251217152421.1181080-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217152421.1181080-1-hongxu.jia@windriver.com>
References: <20251217152421.1181080-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hqM6ey6fHhjwCQn5NVRX84aJvRpMwERP
X-Proofpoint-ORIG-GUID: hqM6ey6fHhjwCQn5NVRX84aJvRpMwERP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfX1uMfeV6uyq16
 VQ2yYvzRRvdZzEy5IVSjwM1Rt+YMalxMB/LMtAoMnoq1BzLFP7Uv+o1IeZ7jsjmbSjQq+Z+TAwC
 WIWve2d0Ddn2LeKDnIQFQlNdkI4j9HMA36h2xk9XGUJ12q1ZeFlGmubUF5fY48c/MR/Zz97MZdq
 MHlBq9s+rtVOhIwyHuuee6y2wCHxPZPI8KgiCw7xsYe9N4WFj1iGHUrnsUfjm3VzqvsD8PH7yHF
 DIOoLxeATSaWR/oYBTLMDuQG4IgfQX2LYs93KG3f1rOds7Uq+ku3KTsBjhnSfUC+UM4QxTzWiFr
 /g0j1/9cfnClSkSzRhR3ShjQZJaXo40GtlOWtbWdnfrxH2JujCEdNZba4BxCUOXtIx38hGkuTt2
 aa7HXcD8RYwj6LTHkQQuLmaPy4omcw==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=6942cb2e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=Ijn1RKaX0nAUqlVouMsA:9 a=X5K9hatliZlWjnsT:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228061

In bitbake.conf, remove FULL_OPTIMIZATION, set "-O2 ${DEBUG_LEVELFLAG}"
to SELECTED_OPTIMIZATION directly

In mesa.inc, due to llvmpipe is slow if compiled with
-fomit-frame-pointer (e.g. -O2), set -fno-omit-frame-pointer
to TARGET_CFLAGS only if option -O2 existed

Correct typo in clang.patch

In recipe harfbuzz, use SELECTED_OPTIMIZATION to instead of
FULL_OPTIMIZATION

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf                            | 3 +--
 meta/conf/documentation.conf                      | 3 +--
 meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc               | 2 +-
 meta/recipes-multimedia/lame/lame/clang.patch     | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 653d396c79..c4e9b60ac3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -659,8 +659,7 @@ DEBUG_PREFIX_MAP ?= "${DEBUG_PREFIX_MAP_EXTRA} \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-FULL_OPTIMIZATION ??= "-O2 ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION ??= "${FULL_OPTIMIZATION}"
+SELECTED_OPTIMIZATION ??= "-O2 ${DEBUG_LEVELFLAG}"
 # compiler flags for native/nativesdk
 BUILD_OPTIMIZATION ??= "-O2"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index cdd6566f3c..91912a288e 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -177,7 +177,6 @@ FILESPATH[doc] = "The default set of directories the OpenEmbedded build system u
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
 FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
-FULL_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_LEVELFLAG}'."
 
 #G
 
@@ -369,7 +368,7 @@ SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creat
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
-SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless fragment 'core/yocto/debug-build' is enabled. In this case, the value of DEBUG_OPTIMIZATION is used."
+SELECTED_OPTIMIZATION[doc] = "The variable takes the value of '-O2 ${DEBUG_LEVELFLAG}' less fragment 'core/yocto/debug-build' is enabled. In this case, the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
index dd30c1237d..72840417f2 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb
@@ -21,7 +21,7 @@ GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
 # As per upstream CONFIG.md, it is recommended to always build with -Os.
-FULL_OPTIMIZATION = "-Os ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION ?= "-Os ${DEBUG_LEVELFLAG}"
 
 EXTRA_OEMESON = "-Dtests=disabled"
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 835e4d46ea..24d2435f00 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -221,7 +221,7 @@ PACKAGECONFIG[video-codecs] = "-Dvideo-codecs=${VIDEO_CODECS}, -Dvideo-codecs=''
 PACKAGECONFIG[teflon] = "-Dteflon=true, -Dteflon=false"
 
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
-FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
+TARGET_CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-O2', '-fno-omit-frame-pointer', '', d)}"
 
 CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
 CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
diff --git a/meta/recipes-multimedia/lame/lame/clang.patch b/meta/recipes-multimedia/lame/lame/clang.patch
index 116000c577..183a9d3212 100644
--- a/meta/recipes-multimedia/lame/lame/clang.patch
+++ b/meta/recipes-multimedia/lame/lame/clang.patch
@@ -9,7 +9,7 @@ and target hardware aligns, and leads to some amusing errors:
 	unknown target CPU 'neoverse-n1'
 	note: valid target CPU values are: i386, i486, ...
 
-Move the HAVE_CLANG block up into the FULL_OPTIMIZATION case, alongside
+Move the HAVE_CLANG block up into the OPTIMIZATION case, alongside
 HAVE_GCC.  This option is never enabled (as it's basically "use native")
 so resolves the build failure.
 
-- 
2.34.1


