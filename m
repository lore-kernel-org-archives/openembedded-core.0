Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B372CD65C65
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:24:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17075.1765985065601276861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GVKlGh4A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH535oG1076109;
	Wed, 17 Dec 2025 07:24:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JqDoCc4YetLa5kLioPoN
	xz0vS+GKvG+XkU0sY6SjaZ0=; b=GVKlGh4AdRAhtW80udAZwfuPBD8uJ9K5vL26
	/FY4Ab0lSYOZA/36TjLUTiFYxKhI8cGbjCUWbKALmw9iy835ZhDYMGs97X31yKzh
	uKV2RxE6Q+bGfC6dSXweqQQGsMpR9BZfv8rgxmAGRNRpEAV1df+EBJptzmj2ghOf
	DU7dLLIGyKWoRRCMnNwGpwSBvBR7tqJ1I7XTXaT5PV5HMRVFb5ATQHjxd3WlEOv0
	McW9FWtb5b6hycEbxw/fW5ffuLLnxG4w244I/XEmE8ZGg4ZpWjWKD6CYvIVbYjJ5
	1QUuk5Z3KCYFd0UnuSC5C0tb6OPrXZ3ZtP3BbVJ3BKqhBhu9mQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j0qyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Dec 2025 07:24:23 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 17 Dec 2025 07:24:22 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 17 Dec 2025 07:24:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v6 1/8] distro/include: rework debug build
Date: Wed, 17 Dec 2025 23:24:14 +0800
Message-ID: <20251217152421.1181080-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=6942cb27 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=3-RhneuVAAAA:8 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=AT7qKQP2qk2aVwQu-SAA:9 a=MBHTkq5ozfd5zzl9:21
 a=VLVLkjT_5ZicWzSuYqSo:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YHfJHIp0eXu2Zom2WlKgD2ZH3_VKLM-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyMCBTYWx0ZWRfXzzc88kA6GKeG
 WT+5kUDgcjYSEnxmtDgbyHvv5Ylovdy2sObf8pvoVsBT5eQe8zkG0yhEsfVNZp5tVYWwU572gTW
 k+bMW0uxDgMzR177XvPtt4uzOi9J/rFOJrr5TZ5YOrbZ3R2vOQtEx5wNU3bZ70Ik+Gk6AUH3OtQ
 prQMpYqu3smCgMxdEAg3NDdqzGWBGTSdgeoDKvMZKLOETtL71C57MOrws0EYYldrdxsqH7V/tPb
 oQE1JSyoq753RdqKIs240hvO6y3J2fviJXgoHJDjDwbZx3ILyDibAs9+2LoBszuxH7YLMVzrJxW
 tkT+0NsCTjUpCBTscdQQoHBTceSGjVifTyx1dyyxHQSTxh9bFCgSV4BMYl2u20g2f34y7dPuvmh
 CavqhKuJz3DElF3sEyEfIXx5FXyBwA==
X-Proofpoint-ORIG-GUID: YHfJHIp0eXu2Zom2WlKgD2ZH3_VKLM-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228055

The problem with DEBUG_BUILD is that we have a lot of debug information
in builds anyway and this is now unclear what it means. The
documentation.conf entry mentions packages which is now incorrect too.
The variable is a very old one and the interface is poorly designed
compared to other areas now.

This commit drop DEBUG_BUILD, and add debug_build.inc to instead.
In bitbake.conf, use ??= to set *_OPTIMIZATION, in debug_build.inc to
use ?= to override *_OPTIMIZATION

Make a config fragment to use include_all debug_build.inc to allow other
layers to add their own debug build configurations, user should use the
following ways to enable debug build

  $ bitbake-config-build enable-fragment core/yocto/debug-build

Or

  $ echo 'OE_FRAGMENTS += "core/yocto/debug-build"' >> conf/local.conf

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf                                 | 9 +++------
 meta/conf/distro/include/debug_build.inc               | 5 +++++
 meta/conf/documentation.conf                           | 3 +--
 meta/conf/fragments/yocto/debug-build.conf             | 8 ++++++++
 meta/conf/templates/default/local.conf.sample.extended | 2 +-
 5 files changed, 18 insertions(+), 9 deletions(-)
 create mode 100644 meta/conf/distro/include/debug_build.inc
 create mode 100644 meta/conf/fragments/yocto/debug-build.conf

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..653d396c79 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -659,13 +659,10 @@ DEBUG_PREFIX_MAP ?= "${DEBUG_PREFIX_MAP_EXTRA} \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-FULL_OPTIMIZATION = "-O2 ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
-SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
+FULL_OPTIMIZATION ??= "-O2 ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION ??= "${FULL_OPTIMIZATION}"
 # compiler flags for native/nativesdk
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
-BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
+BUILD_OPTIMIZATION ??= "-O2"
 
 ##################################################################
 # Reproducibility
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
new file mode 100644
index 0000000000..9ae6be10c9
--- /dev/null
+++ b/meta/conf/distro/include/debug_build.inc
@@ -0,0 +1,5 @@
+# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when fragment 'core/yocto/debug-build' is enabled.
+DEBUG_OPTIMIZATION ?= "-Og ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION ?= "${DEBUG_OPTIMIZATION}"
+# compiler flags for native/nativesdk
+BUILD_OPTIMIZATION ?= "-Og -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..cdd6566f3c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,7 +129,6 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
 DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
@@ -370,7 +369,7 @@ SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creat
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
-SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
+SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless fragment 'core/yocto/debug-build' is enabled. In this case, the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
diff --git a/meta/conf/fragments/yocto/debug-build.conf b/meta/conf/fragments/yocto/debug-build.conf
new file mode 100644
index 0000000000..5bdc1366b4
--- /dev/null
+++ b/meta/conf/fragments/yocto/debug-build.conf
@@ -0,0 +1,8 @@
+BB_CONF_FRAGMENT_SUMMARY = "Specifies to build recipes with debugging information. \
+This influences the value of the SELECTED_OPTIMIZATION variable."
+BB_CONF_FRAGMENT_DESCRIPTION = "Enables full debug and backtrace capabilities for all programs \
+and libraries in the image, by modifying the SELECTED_OPTIMIZATION variable, \
+setting it to "DEBUG_OPTIMIZATION"."
+
+# Allow other layers to add their own debug build configurations
+include_all conf/distro/include/debug_build.inc
diff --git a/meta/conf/templates/default/local.conf.sample.extended b/meta/conf/templates/default/local.conf.sample.extended
index a898b18d59..0e96d40daa 100644
--- a/meta/conf/templates/default/local.conf.sample.extended
+++ b/meta/conf/templates/default/local.conf.sample.extended
@@ -67,7 +67,7 @@
 #
 # Uncomment this to change the optimization to make debugging easer, at the
 # possible cost of performance.
-# DEBUG_BUILD = "1"
+# OE_FRAGMENTS += "core/yocto/debug-build"
 #
 # Uncomment this to disable the stripping of the installed binaries
 # INHIBIT_PACKAGE_STRIP = "1"
-- 
2.34.1


