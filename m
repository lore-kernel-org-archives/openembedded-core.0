Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ACACAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11300.1757995776622029795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TTg9nEEk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3xHfs1313070;
	Tue, 16 Sep 2025 04:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DJj0VsCWdvG5XgQwRxZaRuzgZmycrMAA4DDX4SgBYWA=; b=
	TTg9nEEk9YEgU6elnPbTJ3A5U9ec47QZAjpa7w4nT+dudMktzffqljwdgTIOo798
	+1SoEBfUMYCBcTaSU9vgs/ohCXK1bRTN6peKCW3Ghp7fOjOZYIRO7U+ryHGkvPyO
	dhDblYorQ5nRHcUNA2ucC0ngsjGv+x8y76uFQACavtVBOxKxChQMqGfWPpGJY3+f
	aAkKNmhjuIJNtOF4eMLbmLd9fAelaGak9xXunZpCbbc8LFlkzOOLqvBojIvTpsvb
	7WPXKhkGGFt8VqEMcVo10IZa9w6JcggULET+7OAvhvE0ddU+i7CUdUFvDikbcZvZ
	b9L+lMXoLS+4MziyYjs5+g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 496pekrha3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:30 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH v3 2/8] distro/include: Add debug_build.inc when DEBUG_BUILD is enabled
Date: Tue, 16 Sep 2025 12:09:21 +0800
Message-ID: <20250916040927.103722-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916040927.103722-1-hongxu.jia@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX1G/m9Bay5vOZ
 3Uoc9FuKgTHyvk0rcszWwZZ0nlNUx/cIHK+21rjMlg3HnoUs1D5K1eHiYTuI/3U3pTcTpXrg7nR
 mgXoWIqd1UaJYCC6TailJvesP1ibU6wyyxoemQdEO0hkvor23exHphBeauTqMmfXMxyXmWIeSUw
 thnP7ghEEYEcaFevr1iDgKTgUH5AoQoDCdv4MkT/KsB2p3hVgpQkaJmKDvb15ugiHTMuB7fS7qB
 AkHckSybj8dlIwPYH+s8Bap9u+ssQ2Jsf4RV5KEMeQ2WWGWWVpowxwWLYmGKT529PvEaCZD1X+4
 fCj4GZ+ry2eGdNvUzODPAeQ7MLjCWCIh6zt13x+n/ZUrD/6grysLLkiaNISogI=
X-Authority-Analysis: v=2.4 cv=DYAXqutW c=1 sm=1 tr=0 ts=68c8e2fc cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=kWqXF-ASCvSC9hEyKq8A:9
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: f4p8TH5trpnJwaUnWvUGZKDcGcrvJJM1
X-Proofpoint-GUID: f4p8TH5trpnJwaUnWvUGZKDcGcrvJJM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223516

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
 meta/conf/bitbake.conf                   | 13 +++++++------
 meta/conf/distro/include/debug_build.inc |  7 +++++++
 meta/conf/documentation.conf             |  8 +++++---
 3 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 meta/conf/distro/include/debug_build.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e90c7bbc8..0e614c6b21 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -658,13 +658,12 @@ DEBUG_PREFIX_MAP ?= "\
 "
 DEBUG_LEVELFLAG ?= "-g"
 
-FULL_OPTIMIZATION = "-O2 ${DEBUG_LEVELFLAG}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}"
-SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
-SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
+FULL_OPTLEVEL ?= "-O2"
+FULL_OPTIMIZATION = "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 # compiler flags for native/nativesdk
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
-BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
+BUILD_OPTLEVEL ?= "-O2"
+BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL}"
 
 ##################################################################
 # Reproducibility
@@ -831,6 +830,8 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
+require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
+
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
new file mode 100644
index 0000000000..a9222a442a
--- /dev/null
+++ b/meta/conf/distro/include/debug_build.inc
@@ -0,0 +1,7 @@
+# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
+DEBUG_OPTLEVEL ?= "-Og"
+DEBUG_OPTIMIZATION = "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
+SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
+# compiler flags for native/nativesdk
+BUILD_OPTLEVEL = "-Og"
+BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL} -g"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..b643724e27 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -129,8 +129,9 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] = "Defines which layers to include during cve-c
 D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
-DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
+DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable and includes file conf/distro/include/debug_build.inc"
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


