Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8221AE674BC
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81374.1766415254412862121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 06:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WeoIB6vg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44517665e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMBObYt060767;
	Mon, 22 Dec 2025 14:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=sGHLu+YdcfnlNvOc5zP+
	bOCcatGosqI1gN6x/NKKlns=; b=WeoIB6vgPbfiiHy+O2mn+Khq5NldJsw1JYVM
	Ws8p4zu+e7GUNzzE21ybjcIGmywB+Bdpn2yJ3Bc3fYX+VjcgctFtbTFZ3pyJmw8s
	w8agAOTDw8+6bcbXBAmSW+X259ABTKXJEgT73w4VfDdfXzzYbo7XRb4F+oVHHnDp
	eNms7YQfS7NIjRaNWWljK1a8V/ejHzJpV8vmGs2NIoRf1ejNW4wrW72Z1AhYZPpP
	ss0EXGA0t8KREt9LVcbw4t2keDhAXhVK4H3R0rU3rCoA5K3jJ9XhDcUR9C41EXWZ
	ctrrykMNMKn3KUctceW5NSxwCOFIfzbLE7n2cVnx6j63bQUYVw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vhws8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2025 14:54:10 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 06:54:09 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 06:54:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH v7 1/6] distro/include: rework debug friendly optimization
Date: Mon, 22 Dec 2025 22:53:58 +0800
Message-ID: <20251222145403.3688113-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jpTyHPa6tlxcc-4GxzulCHll6Wf4eGfH
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=69495b92 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=69wJf7TsAAAA:8 a=3-RhneuVAAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=PvFB28OBcufTlglzE9IA:9
 a=JjNjme-Jjdp7XvkV:21 a=STXwoKBC1RUA:10 a=Fg1AiH1G6rFz08G2ETeA:22
 a=VLVLkjT_5ZicWzSuYqSo:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jpTyHPa6tlxcc-4GxzulCHll6Wf4eGfH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEzNSBTYWx0ZWRfX936CrJiOhoip
 m55cmuPnRIDZf0E6clCCZHg0KqduiW61d2h6+24AUT2NXfUQwrymFaimyzuY64VHTkTCpYh+06m
 F8MRGTC9gm1IzHDlOpL8IfjEnbRu1IOLeP15Qi/pUw6jqKh8mmzjMscjhrrl18rZLrQmG7k+QII
 vAwKmvzIKOtJY/RnruZzKjBREvw3mMdlqChpuThp7k80k3SYUJe4OwlOeXc6CAjoRJW4rUh87iB
 TwfozyMWlhiGKQnZPHeTDJao6Y+NagZ7Qa/ajqGTwAK5rhpsb1RcdpCxnugQUjVG/UJhJQcUnbG
 EQAuYC2qnNCd4PS4BQ2/CHZxAsXA506LJ6DTzd8i3WN7uHczRTDh/aFEDXjbKF6Q6bjxMJUQAr1
 zozGfVsjOsAOQB+6HsbtHhg4ZJ9acaRlAuT7c9tCY8VAAa1k5x/W77DbBuQfM3AUf4g6vHuFXma
 9rjW7PCBxB0kEGv4tPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 14:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228304

The problem with DEBUG_BUILD is that we have a lot of debug information
in builds anyway and this is now unclear what it means. The
documentation.conf entry mentions packages which is now incorrect too.
The variable is a very old one and the interface is poorly designed
compared to other areas now.

This commit drop DEBUG_BUILD, use DEBUG_OPTIMIZE to instead, add
debug-optimize.bbclass and debug-optimize.inc. Use variable DEBUG_OPTIMIZE
to defer inherit debug-optimize.bbclass conditionally.

Make a config fragment core/yocto/debug-optimize to set DEBUG_OPTIMIZE ?= 1
to enable debug friendly optimize. For the recipe (such as qemu) which doesn't
work with debug optimization, set DEBUG_OPTIMIZE = "0" to disable it for a
given recipe even though config fragment core/yocto/debug-optimize is enabled

In bitbake.conf, use ??= to set *_OPTIMIZATION, in debug-optimize.inc
to use ?= to override *_OPTIMIZATION

In debug-optimize.bbclass, include_all debug-optimize.inc to allow other
layers to add their own debug optimization configurations.

User should use the following ways to enable debug optimize

  $ bitbake-config-build enable-fragment core/yocto/debug-optimize

Or

  $ echo 'OE_FRAGMENTS += "core/yocto/debug-optimize"' >> conf/local.conf

NOTE: we do not encourage user to enable debug friendly optimization by setting
DEBUG_OPTIMIZE = '1' directly, because the variable override is not certainty,
which is affected by the order of configuration parsing

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-global/base.bbclass                       | 3 +++
 meta/classes/debug-optimize.bbclass                    | 8 ++++++++
 meta/conf/bitbake.conf                                 | 9 +++------
 meta/conf/distro/include/debug-optimize.inc            | 5 +++++
 meta/conf/documentation.conf                           | 4 ++--
 meta/conf/fragments/yocto/debug-optimize.conf          | 7 +++++++
 meta/conf/templates/default/local.conf.sample.extended | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                    | 4 ++--
 8 files changed, 31 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/debug-optimize.bbclass
 create mode 100644 meta/conf/distro/include/debug-optimize.inc
 create mode 100644 meta/conf/fragments/yocto/debug-optimize.conf

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index cf303c237a..3c9488cd45 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
+DEBUG_OPTIMIZE ??= "0"
+inherit_defer ${@oe.utils.vartrue('DEBUG_OPTIMIZE', 'debug-optimize', '',d)}
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
diff --git a/meta/classes/debug-optimize.bbclass b/meta/classes/debug-optimize.bbclass
new file mode 100644
index 0000000000..8d26d03c2c
--- /dev/null
+++ b/meta/classes/debug-optimize.bbclass
@@ -0,0 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Allow other layers to add their own debug build configurations
+include_all conf/distro/include/debug-optimize.inc
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
diff --git a/meta/conf/distro/include/debug-optimize.inc b/meta/conf/distro/include/debug-optimize.inc
new file mode 100644
index 0000000000..b5fb3bbf78
--- /dev/null
+++ b/meta/conf/distro/include/debug-optimize.inc
@@ -0,0 +1,5 @@
+# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when fragment 'core/yocto/debug-optimize' is enabled.
+DEBUG_OPTIMIZATION ?= "-Og ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION ?= "${DEBUG_OPTIMIZATION}"
+# compiler flags for native/nativesdk
+BUILD_OPTIMIZATION ?= "-Og -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..956d4a79a6 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,8 +129,8 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
 DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
+DEBUG_OPTIMIZE[doc] = "Specifies to build recipe with debugging friendly optimization. This influences the value of the SELECTED_OPTIMIZATION variable."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
@@ -370,7 +370,7 @@ SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creat
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
-SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
+SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless fragment 'core/yocto/debug-optimize' is enabled. In this case, the value of DEBUG_OPTIMIZATION is used."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
 SIGGEN_EXCLUDERECIPES_ABISAFE[doc] = "A list of recipes that are completely stable and will never change."
diff --git a/meta/conf/fragments/yocto/debug-optimize.conf b/meta/conf/fragments/yocto/debug-optimize.conf
new file mode 100644
index 0000000000..000b5a50cd
--- /dev/null
+++ b/meta/conf/fragments/yocto/debug-optimize.conf
@@ -0,0 +1,7 @@
+BB_CONF_FRAGMENT_SUMMARY = "Specifies to build recipes with debugging friendly optimization. \
+This influences the value of the SELECTED_OPTIMIZATION variable."
+BB_CONF_FRAGMENT_DESCRIPTION = "Enables full debug and backtrace capabilities for all programs \
+and libraries in the image, by modifying the SELECTED_OPTIMIZATION variable, \
+setting it to "DEBUG_OPTIMIZATION"."
+
+DEBUG_OPTIMIZE ?= "1"
diff --git a/meta/conf/templates/default/local.conf.sample.extended b/meta/conf/templates/default/local.conf.sample.extended
index a898b18d59..ecf1855d2a 100644
--- a/meta/conf/templates/default/local.conf.sample.extended
+++ b/meta/conf/templates/default/local.conf.sample.extended
@@ -67,7 +67,7 @@
 #
 # Uncomment this to change the optimization to make debugging easer, at the
 # possible cost of performance.
-# DEBUG_BUILD = "1"
+# OE_FRAGMENTS += "core/yocto/debug-optimize"
 #
 # Uncomment this to disable the stripping of the installed binaries
 # INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 63414196fa..b3c5be11d6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -60,8 +60,8 @@ COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
-# upstream states qemu doesn't work without optimization
-DEBUG_BUILD = "0"
+# upstream states qemu doesn't work with debug friendly optimization
+DEBUG_OPTIMIZE = "0"
 
 do_install:append() {
     # Prevent QA warnings about installed ${localstatedir}/run
-- 
2.34.1


