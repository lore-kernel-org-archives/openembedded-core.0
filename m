Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 28B356D8C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:03 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id DF2BB40308
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:34:02 +0100
Message-Id: <1384245243-20247-9-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
Subject: [PATCH 8/9] icecc: Add package whitelist
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:04 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

There are some recipes which parse the PARALLEL_MAKE variable by their
own and set them to an empty string afterwards. This disables icecc
for this recipe.

Adding a whitelist for forcing icecc makes it possible to use icecc
also with these recipes.

Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
---
 meta/classes/icecc.bbclass | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 0c9b260..e3b05ac 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -21,12 +21,13 @@
 #
 #User can specify if specific packages or packages belonging to class should not use icecc to distribute
 #compile jobs to remote machines, but handled localy, by defining ICECC_USER_CLASS_BL and ICECC_PACKAGE_BL
-#with the appropriate values in local.conf
+#with the appropriate values in local.conf. In addition the user can force to enable icecc for packages
+#which set an empty PARALLEL_MAKE variable by defining ICECC_USER_PACKAGE_WL.
 #########################################################################################
 #Error checking is kept to minimum so double check any parameters you pass to the class
 ###########################################################################################
 
-BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL ICECC_USER_CLASS_BL"
+BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL ICECC_USER_CLASS_BL ICECC_USER_PACKAGE_WL"
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
@@ -104,6 +105,7 @@ def use_icc(bb,d):
     #for one reason or the other
     system_package_blacklist = [ "uclibc", "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
     user_package_blacklist = (d.getVar('ICECC_USER_PACKAGE_BL') or "").split()
+    user_package_whitelist = (d.getVar('ICECC_USER_PACKAGE_WL') or "").split()
     package_blacklist = system_package_blacklist + user_package_blacklist
 
     for black in package_blacklist:
@@ -111,6 +113,11 @@ def use_icc(bb,d):
             #bb.note(package_tmp, ' found in blacklist, disable icecc')
             return "no"
 
+    for white in user_package_whitelist:
+        if white in package_tmp:
+            bb.debug(1, package_tmp, " ", d.expand('${PV})'), " found in whitelist, enable icecc")
+            return "yes"
+
     if d.getVar('PARALLEL_MAKE') == "":
         bb.debug(1, package_tmp, " ", d.expand('${PV}'), " has empty PARALLEL_MAKE, disable icecc")
         return "no"
@@ -131,7 +138,8 @@ def icc_version(bb, d):
         return ""
 
     parallel = d.getVar('ICECC_PARALLEL_MAKE') or ""
-    d.setVar("PARALLEL_MAKE", parallel)
+    if not d.getVar('PARALLEL_MAKE') == "":
+        d.setVar("PARALLEL_MAKE", parallel)
 
     if icc_is_native(bb, d):
         archive_name = "local-host-env"
-- 
1.8.3.1


