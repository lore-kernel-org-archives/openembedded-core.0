Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D04D37316B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 23:37:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBGNbkb9011219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 15:37:47 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Dec 2015 15:37:46 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Wed, 16 Dec 2015 15:37:46 -0800
Message-ID: <1450309066-18270-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] blacklist: add SELFBLACKLIST support
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
X-List-Received-Date: Wed, 16 Dec 2015 23:37:50 -0000
Content-Type: text/plain

BLACKLIST[pn] in a recipe does not work for multilib.
Add SELFBLACKLIST specifically for use in recipes.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/blacklist.bbclass |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index a0141a8..a396536 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -11,6 +11,9 @@
 # * To add a package to the blacklist, set:
 #   PNBLACKLIST[pn] = "message"
 #
+# * To have a recipe blacklist itself, in the recipe set:
+#   SELFBLACKLIST = "message"
+#
 
 # Cope with PNBLACKLIST flags for multilib case
 addhandler blacklist_multilib_eventhandler
@@ -38,8 +41,13 @@ python blacklist_multilib_eventhandler() {
 }
 
 python () {
-    blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
+    reason = d.getVar('SELFBLACKLIST', True)
+
+    if reason:
+        raise bb.parse.SkipPackage("Recipe blacklists itself!: %s" % (reason))
+
+    reason = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
 
-    if blacklist:
-        raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (blacklist))
+    if reason:
+        raise bb.parse.SkipPackage("Recipe is blacklisted: %s" % (reason))
 }
-- 
1.7.9.5


