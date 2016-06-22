Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4FB3600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 21:59:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5MLxPkr013830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:59:26 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 22 Jun 2016 14:59:25 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2016 14:59:24 -0700
Message-ID: <1466632764-22540-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1466632764-22540-1-git-send-email-jslater@windriver.com>
References: <1466632764-22540-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Wed, 22 Jun 2016 21:59:28 -0000
Content-Type: text/plain

PNBLACKLIST[pn] in a recipe does not work for multilib.
Add BPNBLACKLIST specifically for use in recipes.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/blacklist.bbclass |   24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index a0141a8..d92b0bc 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -8,9 +8,20 @@
 #
 # Features:
 #
-# * To add a package to the blacklist, set:
+# * To add a recipe to the blacklist, set:
 #   PNBLACKLIST[pn] = "message"
 #
+#   This blacklist works by matching 'pn' to the exact 'PN' of
+#   a recipe.  The 'PN' of a recipe may be influenced by the recipe
+#   itself, multilib and classextensions.
+#
+# * Another way to blacklist a recipe, set:
+#   BPNBLACKLIST[bpn] = "message"
+#
+#   This blacklist works by matching 'bpn' to the exact 'BPN' set by
+#   a recipe.  While unusual, a recipe may modify the BPN, but multilib
+#   and classextensions generally do not.
+
 
 # Cope with PNBLACKLIST flags for multilib case
 addhandler blacklist_multilib_eventhandler
@@ -38,8 +49,13 @@ python blacklist_multilib_eventhandler() {
 }
 
 python () {
-    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
+    reason = d.getVarFlag('BPNBLACKLIST', d.getVar('BPN', True), True)
+
+    if reason:
+        raise bb.parse.SkipRecipe("BPN is blacklisted: %s" % (reason))
+
+    reason = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
 
-    if blacklist:
-        raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blacklist))
+    if reason:
+        raise bb.parse.SkipRecipe("PN is blacklisted: %s" % (reason))
 }
-- 
1.7.9.5


