Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F1ECAC594
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25938.1757917037556332003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EasRgopF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F4dbVl3224261;
	Mon, 15 Sep 2025 06:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=emtGzu8AQ21/rtJNIFYlhhsx/qpG5KcNhmwfcL2VtJ4=; b=
	EasRgopFFcgrEvsnKVwlyHUtNGm9m2djYWHW75tVdTnh0SYj3QaPty6eFJ8DaCGs
	Wmy5dGCJW+eTR/P2ql7PEovHj5DYIQxA3AWrzvP7Vv/9aEMRxBiiIc31DSXQ5O8c
	h5bj81L6kVj5/YCBEykS+ql1Mlo7Ie+zKiQKTvGDai3USejbsXnUQIrsh+HPuH5X
	RPvRhnii2RCZF9LYVjO5kXt+dleLRmffWJ+Bo7Sp4+8v1r9PW7GWOvSL4BZeX68d
	ooXIoY/nrCzNABuoSD+6SpN1hE+o4NQbidsZuAHJSQR0kT5LdrltPnK+DlaHeWnB
	DQngL82F1UVOvNpWB+41+w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494yk79puv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Sep 2025 06:17:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:46 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH v2 2/8] distro/include: Add debug_build.inc when DEBUG_BUILD is enabled
Date: Mon, 15 Sep 2025 14:17:37 +0800
Message-ID: <20250915061743.313230-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915061743.313230-1-hongxu.jia@windriver.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=GZYXnRXL c=1 sm=1 tr=0 ts=68c7af6a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=kWqXF-ASCvSC9hEyKq8A:9
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: k_jkHJua-RM3Gu-BIt_Aq7KvYk89HBe5
X-Proofpoint-ORIG-GUID: k_jkHJua-RM3Gu-BIt_Aq7KvYk89HBe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfX3RInBaiu1sAJ
 HBSdTDfBMGrUvysjV1Vmx1FtgbCLI9VmexSdtkNq58oIZ6Vh+tjFK45rnxmefo6yKTmLMsBlDn2
 6faf818H56Wov+WKXD8kMfrkFWNEbPvlcJlD/hRsaorPgLpbdevwDpB17KB65vqAz9+JA4TArbX
 oUZGOlKODWm6JDrEcHv9lB8SsDVLsdmeUeFK8ni+EdJoGial3j2dPinGoCrZpWFa7AMSAazgJUj
 TOLqZSY11uMX/xO3AgEjvmwVG6mylcl8g6rN8BJbgbq2cRwx2i4fWKKwtNZ+fks759s5CDctX+g
 eU5Gi3Hr1jN0gcphUqh3F/ao+EOowFFABKHARu5o00flgDGsS462F4Jhcne1vU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223378

Add a new include file debug_build.inc to override SELECTED_OPTIMIZATION
and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled

Add separate variables FULL_OPTLEVEL, DEBUG_OPTLEVEL and BUILD_OPTLEVEL
for the optimization level, and override it for specific recipe other
than original remove and append DEBUG_OPTIMIZATION and BUILD_OPTIMIZATION

Update the documentation for FULL_OPTIMIZATION and DEBUG_OPTIMIZATION

Require the include file when DEBUG_BUILD is enabled

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/bitbake.conf                   | 15 +++++++++------
 meta/conf/distro/include/debug_build.inc |  8 ++++++++
 meta/conf/documentation.conf             |  8 +++++---
 3 files changed, 22 insertions(+), 9 deletions(-)
 create mode 100644 meta/conf/distro/include/debug_build.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e90c7bbc85..91dc51cd61d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -658,13 +658,14 @@ DEBUG_PREFIX_MAP ?= "\
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-FULL_OPTIMIZATION = "-O2 ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
-SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
+FULL_OPTLEVEL ?= "-O2"
+FULL_OPTIMIZATION = "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_LEVELFLAG FULL_OPTLEVEL"
 # compiler flags for native/nativesdk
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
-BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
+BUILD_OPTLEVEL ?= "-O2"
+BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL}"
+BUILD_OPTIMIZATION[vardeps] += "BUILD_OPTLEVEL"
 
 ##################################################################
 # Reproducibility
@@ -831,6 +832,8 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
+require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
+
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
new file mode 100644
index 00000000000..af947a80e8b
--- /dev/null
+++ b/meta/conf/distro/include/debug_build.inc
@@ -0,0 +1,8 @@
+# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
+DEBUG_OPTLEVEL ?= "-Og"
+DEBUG_OPTIMIZATION = "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
+SELECTED_OPTIMIZATION[vardeps] += "DEBUG_OPTIMIZATION DEBUG_OPTLEVEL"
+# compiler flags for native/nativesdk
+BUILD_OPTLEVEL = "-Og"
+BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL} -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a3921..824c4fb3801 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,8 +129,9 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
+DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable and add include file conf/distro/include/debug_build.inc"
+DEBUG_OPTLEVEL[doc] = "The toolchain optimization level flags for debugging. This variable defaults to '-Og'"
+DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
@@ -178,7 +179,8 @@ FILESPATH[doc] = "The default set of directories the OpenEmbedded build system u
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
 FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
-FULL_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_LEVELFLAG}'."
+FULL_OPTLEVEL[doc] = "The toolchain optimization level flags. This variable defaults to '-O2'"
+FULL_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
 
 #G
 
-- 
2.34.1


