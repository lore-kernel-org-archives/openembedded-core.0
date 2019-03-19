Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 572CA7CD7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 11:45:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44NrpT1lvgz5v
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 12:45:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552995937;
	bh=UbUf+9Q1C508jA1LYa93GtidjaWi35G/gZIJsp2OXTE=;
	h=From:To:Subject:Date:From;
	b=Q5O25QIE2VDLgA0PUnqYUvZm9CkGzq08/SD/7gSbLe9t4trHSq1buu3OCGtAC9JAf
	Qf40vT1ang5+eQTAhQ65IoX8fHmrga/A0WsJc7Q176U5Qp4eAZn5SNVfwdjjcAGJj/
	Y6YkFiAdk0ijLB74oSm6kiHAhIz6ulLwKb8rKnNblnCv6XUo+emaInseX3Ikv8KH7l
	1edyZRCTkiqzPse7p/vSuoxL7yh+zBmhKfDnG+O8VCbH0PzugXdFnuBuVwTVmyE8xv
	B0wIrxom+qnj2PnZwisWQIvoU8AeUi4qo/BxtN9G/OoNzrsrLGgxknE4mZRx1ZsPzE
	AkVfw+J6kTnekOSmv0qSI4hLUajFc7f0vfGBvznqwc/ottbfnh9hNbvCcCp5pi7s7A
	DJw1RiL1Li+WlIQROCPH2GdkWEQvp1X/xJSCWuyC2Z0rK/7mmmniDKm4xGgdb3LRvc
	8I5KXroMPhPC6CUQV/bux4HjYscal4CjLuzbv2HDD6fgh3h/X++g/W5Uf6srETn4oi
	PoZb4OjDH+4NQnPjRYpvTv6o/MjtV0UaxaJ3rdoPNky0dzRKv3h1Ylw8iFRjntsz6m
	iNhY1HMVY43kxG2WQDAENJPg22JM/+ixRjv0fIbcJoHhZqLcAa2ux0pTkWReqIU0KU
	gtJFfsqec9NkxvTwgkjY4DHw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2019 13:45:36 +0200
Message-Id: <20190319114536.2925-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Remove the simd tune for armv8a
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
X-List-Received-Date: Tue, 19 Mar 2019 11:45:37 -0000

SIMD instructions are a mandatory part of armv8a
(they were optional in armv7a), and the gcc docs
also say that they are always enabled.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/conf/machine/include/arm/arch-armv8a.inc | 6 ++----
 meta/conf/machine/include/tune-cortexa32.inc  | 4 ++--
 meta/conf/machine/include/tune-cortexa35.inc  | 4 ++--
 meta/conf/machine/include/tune-cortexa53.inc  | 4 ++--
 meta/conf/machine/include/tune-cortexa72.inc  | 2 +-
 5 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index 22064559be..44d0ca4557 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -2,8 +2,6 @@ DEFAULTTUNE ?= "armv8a-crc"
 
 TUNEVALID[armv8a] = "Enable instructions for ARMv8-a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -march=armv8-a', '', d)}"
-TUNEVALID[simd] = "Enable instructions for ARMv8-a Advanced SIMD and floating-point"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
 TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
 TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
@@ -18,11 +16,11 @@ ARMPKGARCH_tune-armv8a                    ?= "armv8a"
 ARMPKGARCH_tune-armv8a-crc                ?= "armv8a"
 ARMPKGARCH_tune-armv8a-crypto             ?= "armv8a"
 ARMPKGARCH_tune-armv8a-crc-crypto         ?= "armv8a"
-TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a simd"
+TUNE_FEATURES_tune-armv8a                  = "aarch64 armv8a"
 TUNE_FEATURES_tune-armv8a-crc              = "${TUNE_FEATURES_tune-armv8a} crc"
 TUNE_FEATURES_tune-armv8a-crypto           = "${TUNE_FEATURES_tune-armv8a} crypto"
 TUNE_FEATURES_tune-armv8a-crc-crypto       = "${TUNE_FEATURES_tune-armv8a-crc} crypto"
-PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a simd"
+PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
 PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index 4bf7f774e1..9c948f1766 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -10,8 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "aarch64 cortexa32 simd crc"
-TUNE_FEATURES_tune-cortexa32-crypto   = "aarch64 cortexa32 simd crc crypto"
+TUNE_FEATURES_tune-cortexa32          = "aarch64 cortexa32 crc"
+TUNE_FEATURES_tune-cortexa32-crypto   = "aarch64 cortexa32 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
 BASE_LIB_tune-cortexa32               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
index 6ece810753..d6df6cd6bd 100644
--- a/meta/conf/machine/include/tune-cortexa35.inc
+++ b/meta/conf/machine/include/tune-cortexa35.inc
@@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa35 cortexa35-crypto"
 ARMPKGARCH_tune-cortexa35             = "cortexa35"
 ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
-TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 simd crc"
-TUNE_FEATURES_tune-cortexa35-crypto   = "aarch64 cortexa35 simd crc crypto"
+TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
+TUNE_FEATURES_tune-cortexa35-crypto   = "aarch64 cortexa35 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
 PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
 BASE_LIB_tune-cortexa35               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
index 9fb37ff639..6c0b443eaf 100644
--- a/meta/conf/machine/include/tune-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa53.inc
@@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa53 cortexa53-crypto"
 ARMPKGARCH_tune-cortexa53             = "cortexa53"
 ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53"
-TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 simd crc"
-TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 simd crc crypto"
+TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
+TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
 PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
 BASE_LIB_tune-cortexa53               = "lib64"
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 4c2306c4fd..00f7745a22 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Little Endian base configs
 AVAILTUNES += "cortexa72"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 simd crc crypto"
+TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
 BASE_LIB_tune-cortexa72               = "lib64"
-- 
2.17.1


