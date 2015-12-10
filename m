Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5400A731CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:31 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c201so33884197wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=D8zSmqxdXssLiPjoMlDlAMGU63UjCRi9Svpu0wc5Nic=;
	b=RfAQJJtEdcFd2JoBR2nC1gIPTOETSQjasqTxpUFVVX5Keids4mmyBs40hfClOvNZOD
	LdY+IzjbLqpBEy424k30UKH8GqHYZ98+EXLDdStWxl1DvS7cGJBN6TCj3p1RlXv0Syr7
	j5cPpBdXwifzsXxyB4qkwNA5Ta1HmZw35F0PfBeHZw30mntJ1QsWPOTumwrxrlvSXnb4
	6kVt4VSLLvfZ5Z5fKwvYDwrD1xwxqzaXfElpIR3yb93jV9uYThxiBCQyOm5cfr/tWHAl
	VShEV3oHpGnCZTZG5ZGjqfemVzX2tn1W9jH6Qc9yZYL3OlBZf5WD6668kivdC9ITiEHC
	52KA==
X-Received: by 10.28.226.11 with SMTP id z11mr19266311wmg.56.1449755251892;
	Thu, 10 Dec 2015 05:47:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id a63sm941499wmc.5.2015.12.10.05.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:51 +0100
Message-Id: <491ead1c0e8db7f1c919c163431be7bb9b087ddd.1449754344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754344.git.Martin.Jansa@gmail.com>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
Subject: [PATCH][master][RESEND 14/15] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2015 13:47:32 -0000

* be aware that this -march value is available only in gcc-4.9 and
  newer:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
* -mcpu=cortex15 and -mcpu=cortexa7 conflict with -march=armv7a
  We either have to stop putting -march in default CCARGS or at
  least set it compatible one like this patch does.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 141 +++++++++++++++++++++
 .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
 meta/conf/machine/include/tune-cortexa15.inc       |  52 ++++----
 meta/conf/machine/include/tune-cortexa7.inc        |  52 ++++----
 4 files changed, 194 insertions(+), 52 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv7ve.inc

diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
new file mode 100644
index 0000000..79e1ef6
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -0,0 +1,141 @@
+DEFAULTTUNE ?= "armv7ve"
+
+TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
+TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
+
+require conf/machine/include/arm/arch-armv6.inc
+require conf/machine/include/arm/feature-arm-neon.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon armv7ve-neon-vfpv4 armv7vet-neon-vfpv4"
+ARMPKGARCH_tune-armv7ve             ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet            ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-vfpv3d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-vfpv3d16   ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-vfpv3       ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-neon        ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-neon       ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-neon-vfpv4  ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-neon-vfpv4 ?= "armv7ve"
+TUNE_FEATURES_tune-armv7ve             = "arm armv7ve vfp"
+TUNE_FEATURES_tune-armv7vet            = "${TUNE_FEATURES_tune-armv7ve} thumb"
+TUNE_FEATURES_tune-armv7ve-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve}  vfpv3d16"
+TUNE_FEATURES_tune-armv7vet-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet} vfpv3d16"
+TUNE_FEATURES_tune-armv7ve-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}  vfpv3"
+TUNE_FEATURES_tune-armv7vet-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7ve-neon        = "${TUNE_FEATURES_tune-armv7ve}  neon"
+TUNE_FEATURES_tune-armv7vet-neon       = "${TUNE_FEATURES_tune-armv7vet} neon"
+TUNE_FEATURES_tune-armv7ve-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon}  vfpv4"
+TUNE_FEATURES_tune-armv7vet-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon} vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7ve armv7ve-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ve armv7ve-vfp armv7vet2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv3d16 armv7vet2-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16}  armv7ve-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16} armv7ve-vfpv3 armv7vet2-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-neon armv7vet2-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  armv7ve-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} armv7ve-neon-vfpv4 armv7vet2-neon-vfpv4"
+
+# HF Tunes
+AVAILTUNES += "armv7vehf armv7vethf armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3 armv7vehf-neon armv7vethf-neon armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
+ARMPKGARCH_tune-armv7vehf             ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf            ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-vfpv3d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-vfpv3d16   ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-vfpv3       ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-neon        ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-neon       ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-neon-vfpv4  ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-neon-vfpv4 ?= "armv7ve"
+TUNE_FEATURES_tune-armv7vehf             = "${TUNE_FEATURES_tune-armv7ve}             callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf            = "${TUNE_FEATURES_tune-armv7vet}            callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3}       callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3}      callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} callconvention-hard"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7vehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7vehf-vfp armv7vet2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv3d16 armv7vet2hf-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16}  armv7vehf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfpv3 armv7vet2hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-neon armv7vet2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  armv7vehf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4"
+
+# Big Endian
+AVAILTUNES += "armv7veb armv7vetb armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-neon armv7vetb-neon armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4"
+ARMPKGARCH_tune-armv7veb             ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb            ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-vfpv3d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-vfpv3d16   ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-vfpv3       ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-neon        ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-neon       ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-neon-vfpv4  ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-neon-vfpv4 ?= "armv7ve"
+TUNE_FEATURES_tune-armv7veb             = "${TUNE_FEATURES_tune-armv7ve}             bigendian"
+TUNE_FEATURES_tune-armv7vetb            = "${TUNE_FEATURES_tune-armv7vet}            bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16}    bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16}   bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3}       bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3}      bigendian"
+TUNE_FEATURES_tune-armv7veb-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        bigendian"
+TUNE_FEATURES_tune-armv7vetb-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       bigendian"
+TUNE_FEATURES_tune-armv7veb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7veb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7veb-vfp armv7vet2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv3d16 armv7vet2b-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16}  armv7veb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16} armv7veb-vfpv3 armv7vet2b-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-neon armv7vet2b-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon}  armv7veb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon} armv7veb-neon-vfpv4 armv7vet2b-neon-vfpv4"
+
+# Big Endian + HF
+AVAILTUNES += "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3 armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4 armv7vethfb-neon-vfpv4"
+ARMPKGARCH_tune-armv7vehfb             ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb            ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-vfpv3d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-vfpv3d16   ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-vfpv3       ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-neon        ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-neon       ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-neon-vfpv4  ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-neon-vfpv4 ?= "armv7ve"
+TUNE_FEATURES_tune-armv7vehfb             = "${TUNE_FEATURES_tune-armv7vehf}             bigendian"
+TUNE_FEATURES_tune-armv7vethfb            = "${TUNE_FEATURES_tune-armv7vethf}            bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7vehf-vfpv3d16}    bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16}   bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv3       = "${TUNE_FEATURES_tune-armv7vehf-vfpv3}       bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv3      = "${TUNE_FEATURES_tune-armv7vethf-vfpv3}      bigendian"
+TUNE_FEATURES_tune-armv7vehfb-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        bigendian"
+TUNE_FEATURES_tune-armv7vethfb-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       bigendian"
+TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  bigendian"
+TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} bigendian"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7vehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7vehfb-vfp armv7vet2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16 armv7vet2hfb-vfpv3d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16}  armv7vehfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16} armv7vehfb-vfpv3 armv7vet2hfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-neon armv7vet2hfb-neon"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon}  armv7vehfb-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon} armv7vehfb-neon-vfpv4 armv7vet2hfb-neon-vfpv4"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 5632171..54c0cee 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -12,6 +12,7 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
+ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '', d)}"
 
 # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
 # If the defice doesn't support ARM, then always set "thumb" even when
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 8b34bb2..cfc8151 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -1,6 +1,6 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7ve-neon"
 
-require conf/machine/include/arm/arch-armv7a.inc
+require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
@@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
 ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
 ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
-TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7a}             cortexa15"
-TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7at}            cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa15"
-TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa15"
-TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa15-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa15-vfp cortexa15-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
+TUNE_FEATURES_tune-cortexa15             = "${TUNE_FEATURES_tune-armv7ve}             cortexa15"
+TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-armv7vet}            cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa15"
+TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa15"
+TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa15-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa15-vfp cortexa15-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
 
 # HF Tunes
 AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
 ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
 ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
-TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa15"
-TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa15"
-TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa15"
-TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa15"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa15hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa15hf-vfp cortexa15hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
+TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-armv7vehf}             cortexa15"
+TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-armv7vethf}            cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa15"
+TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa15"
+TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa15"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa15hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa15hf-vfp cortexa15hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 4fea36f..84432bd 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -1,6 +1,6 @@
-DEFAULTTUNE ?= "armv7a-neon"
+DEFAULTTUNE ?= "armv7ve-neon"
 
-require conf/machine/include/arm/arch-armv7a.inc
+require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
@@ -13,18 +13,18 @@ ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
 ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
 ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7a}             cortexa7"
-TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7at}            cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7a-neon}        cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7at-neon}       cortexa7"
-TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4}  cortexa7"
-TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7at-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  cortexa7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}  cortexa7-vfp cortexa7-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4}  cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
+TUNE_FEATURES_tune-cortexa7             = "${TUNE_FEATURES_tune-armv7ve}             cortexa7"
+TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-armv7vet}            cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}        cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       cortexa7"
+TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  cortexa7"
+TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  cortexa7-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon}  cortexa7-vfp cortexa7-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4}  cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
 
 # HF Tunes
 AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
@@ -34,15 +34,15 @@ ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
 ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
 ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
-TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-armv7ahf}             cortexa7"
-TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-armv7athf}            cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon}        cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-armv7athf-neon}       cortexa7"
-TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4}  cortexa7"
-TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7athf-neon-vfpv4} cortexa7"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  cortexa7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}  cortexa7hf-vfp cortexa7hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
+TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-armv7vehf}             cortexa7"
+TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-armv7vethf}            cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon}        cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       cortexa7"
+TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  cortexa7"
+TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} cortexa7"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  cortexa7hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon}  cortexa7hf-vfp cortexa7hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4}  cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
+PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
-- 
2.6.3


