Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 892FB71AC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:30:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAT1Ue1M031770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 17:30:40 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 17:30:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 17:30:38 -0800
Message-ID: <b10dffaf537bc8bebc034d64afa1f477cd50cccc.1480383001.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480383001.git.liezhi.yang@windriver.com>
References: <cover.1480383001.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.bbclass: update DEFAULTTUNE for image recipe
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
X-List-Received-Date: Tue, 29 Nov 2016 01:30:40 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake -e lib32-core-image-minimal | grep ^TUNE_ARCH=
TUNE_ARCH="x86_64"

This is incorrect, it should be i686 (or other 32 bit tunes), this makes
we can't conditionlly install some packages, for example, the recipe-A
sets:
COMPATIBLE_HOST = "x86_64.*-linux"

Then it only can be installed when TARGET_ARCH is x86_64:
IMAGE_INSTALL_x86-64 += "package-A"

But it would be error when "bitbake lib32-core-image-minimal":
ERROR: lib32-recipe-A was skipped: incompatible with host i686-pokymllib32-linux (not in COMPATIBLE_HOST)

This is because TARGET_ARCH is not updated to "i686" when multilib, this
patch can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/multilib.bbclass | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index d5a3128..5d2d048 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -23,6 +23,13 @@ python multilib_virtclass_handler () {
     overrides = overrides.replace("pn-${PN}", "pn-${PN}:pn-" + pn)
     e.data.setVar("OVERRIDES", overrides)
 
+    def multilib_set_default_tune():
+        # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
+        newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
+        if newtune:
+            e.data.setVar("DEFAULTTUNE", newtune)
+            e.data.setVar('DEFAULTTUNE_ML_%s' % variant, newtune)
+
     if bb.data.inherits_class('image', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
@@ -30,6 +37,9 @@ python multilib_virtclass_handler () {
         target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
         if target_vendor:
             e.data.setVar("TARGET_VENDOR", target_vendor)
+
+        multilib_set_default_tune()
+
         return
 
     if bb.data.inherits_class('cross-canadian', e.data):
@@ -65,11 +75,7 @@ python multilib_virtclass_handler () {
             pkgs += " " + variant + "-" + pkg
         e.data.setVar(whitelist, pkgs)
 
-    # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
-    newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
-    if newtune:
-        e.data.setVar("DEFAULTTUNE", newtune)
-        e.data.setVar('DEFAULTTUNE_ML_%s' % variant, newtune)
+    multilib_set_default_tune()
 }
 
 addhandler multilib_virtclass_handler
-- 
2.9.0


