Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoEXN-0000NW-0h for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 14:57:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72CrDei015527
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 13:53:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14687-07 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 13:53:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72Cr826015521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 13:53:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Aug 2011 13:52:52 +0100
Message-ID: <1312289572.2344.589.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] tune/ppc: Fix various TUNE_PKGARCH issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2011 12:57:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to ensure only one value ends up in TUNE_PKGARCH rather than several.
This change ensures consistency accross all the PPC tune files and that they
correctly inherit the core value but also allow it to be overwritten.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 8cc76ab..da1a1d6 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -20,7 +20,8 @@ ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-e
 
 PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
 
-TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
+PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
+TUNE_PKGARCH ?= "${PPCPKGARCH}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 7c05394..da8114f 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${PPCPKGARCH}', d)}"
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index bad2611..5eea4a6 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2", "${TUNE_ARCH}", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2", "${PPCPKGARCH}", d)}"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index c34d631..709e14f 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "${PPCPKGARCH}", d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 73217dd..64e7bdc 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "${PPCPKGARCH}", d)}"
 
 AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 819d68a..0cbe5af 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "${PPCPKGARCH}", d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"




