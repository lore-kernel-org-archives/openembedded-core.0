Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3466E6FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:17 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so3747425eek.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ZbhgV/NyW/vafwpBvlNWRWHS5P7sum36jvSuNIcZjJ0=;
	b=iVIO+LKpKDMJLrULQ3vhv8AUZW8SduUN6E42ottsbpAd2OliEnZxJ1cHwhZQkpVKdS
	WsUsuzs9OlD7RQeW1+MFtC7IOh6nQ32hCDWDVibUoXHojgxuj1Oxg6eyseUw+la48dLr
	cyYFjTiGiFFc/VYcgkvn+6XYCzZnh+AZ6fywbbjbTZjUi8elrmLsn57snS8YZlRTho89
	UeMlpov1GedPNymUcvnLUT1/eJILRNkKu8XTZyfFO/MrKnTVb2Hdad0gr5egFg0hwCrs
	ytnXtswPp8wAFAIb6nWSTnWjz1/w3SS9bWGSt7zmSqyviX9Y6RNfeENcqZgMSQoOFTnZ
	PNmg==
X-Received: by 10.14.39.3 with SMTP id c3mr26974092eeb.4.1390350978112;
	Tue, 21 Jan 2014 16:36:18 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z42sm12839877eel.3.2014.01.21.16.36.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:09 +0100
Message-Id: <25dfabfce7b175098e9724f15b8252dbdd73d70a.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390350823.git.Martin.Jansa@gmail.com>
References: <cover.1390350823.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RFC][WIP 4/6] feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:17 -0000

* it will be inherited by all higher architectures, except few exceptions which
  support only thumb and not arm
* respect missing "arm" in TUNE_FEATURES in feature-arm-thumb.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc        |  2 +-
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index c33c816..4b43e9f 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -18,7 +18,7 @@ require conf/machine/include/arm/feature-arm-thumb.inc
 AVAILTUNES += "armv4 armv4t"
 ARMPKGARCH_tune-armv4 ?= "armv4"
 ARMPKGARCH_tune-armv4t ?= "armv4"
-TUNE_FEATURES_tune-armv4 ?= "armv4"
+TUNE_FEATURES_tune-armv4 ?= "arm armv4"
 TUNE_FEATURES_tune-armv4t ?= "${TUNE_FEATURES_tune-armv4} thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv4 = "arm armv4"
 PACKAGE_EXTRA_ARCHS_tune-armv4t = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4t"
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 09a127a..aaa39dc 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -13,11 +13,17 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
 
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_THUMB_OPT}', '', d)}"
+# If the device supports ARM, then respect ARM_THUMB_OPT
+# If the defice doesn't support ARM, then always set "thumb" even when
+# some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
+# (maybe we should show warning in this case)
+ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_THUMB_OPT to thumb
-ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_THUMB_OPT', True) == 'thumb'] else ''}"
+# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
+ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb'] else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
1.8.5.3


