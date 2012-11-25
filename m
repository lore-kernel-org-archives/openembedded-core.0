Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tcv6r-00044g-0E for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 10:36:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAPKNpXw017455
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 20:23:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10739-03 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 20:23:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAPKNg7f017449
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2012 20:23:44 GMT
Message-ID: <1353875022.21863.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 25 Nov 2012 20:23:42 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] packagegroup/allarch: Convert to use allarch class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 09:36:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently there is some odd behaviour of the packagegroup class in relation
to sstate since it sets PACKAGE_ARCH = "all" but does not use the allarch class
leading to it being undetected by sstate.

Previously it was not possible to use allarch as the recipe couldn't "undo"
settings made by the allarch class. Since this no longer happens when
PACKAGE_ARCH != all, we can use the allarch class.

This patch also fixes up one case we need to preserve TRANSLATED_TARGET_ARCH
and ensures sstate only assumes allarch when PACKAGE_ARCH is "all".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index e0e5b1c..fc67302 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -13,7 +13,7 @@ PACKAGES = "${PN}"
 # By default, packagegroup packages do not depend on a certain architecture.
 # Only if dependencies are modified by MACHINE_FEATURES, packages
 # need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
-PACKAGE_ARCH = "all"
+inherit allarch
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e1bc89d..6de35e6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -46,7 +46,7 @@ python () {
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}"))
     elif bb.data.inherits_class('cross-canadian', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
-    elif bb.data.inherits_class('allarch', d):
+    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH", True) == "all":
         d.setVar('SSTATE_PKGARCH', "allarch")
     else:
         d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index cb2fb1a..87c7dce 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -3,6 +3,9 @@ PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PR = "r0"
 LICENSE = "MIT"
 
+# Save TRANSLATED_TARGET_ARCH before allarch tramples it
+TRANSLATED_TARGET_ARCH := "${TRANSLATED_TARGET_ARCH}"
+
 inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"




