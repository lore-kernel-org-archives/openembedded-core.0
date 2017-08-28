Return-Path: <ola.x.nilsson@axis.com>
X-Greylist: delayed 535 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Aug 2017 15:07:11 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 988A178221
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4F9D32E21D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3wWITZeqDE6f
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 775472E230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F2471A08C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 546B01A08A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 48F9F71D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 4551E409AC; Mon, 28 Aug 2017 16:58:16 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 16:58:15 +0200
Message-Id: <20170828145816.17208-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] oeqa/selftest/case: Add recipeinc method
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
X-List-Received-Date: Mon, 28 Aug 2017 15:07:12 -0000

The recipeinc method returns the absolute path of the test_recipe.inc
file of a specified recipe.  It replaces four instances of identical
code, and make it possible to access the filename from a testcase for
cleanup.

The write_recipeinc and append_recipeinc methods are changed to return
the path to the file in case that is useful.

The test_recipe.inc file is usually cleaned up in a finally block,
but that block executes before any teardown operations.  This blocks
any teardown that requires the presence of the test_recipe.inc file.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oeqa/selftest/case.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 871009c568..e09915b495 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -212,27 +212,33 @@ to ensure accurate results.")
         self.logger.debug("Removing from: %s\n%s\n" % (self.testinc_path, data))
         ftools.remove_from_file(self.testinc_path, data)
 
+    def recipeinc(self, recipe):
+        """Return absolute path of meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
+        return os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+
     def write_recipeinc(self, recipe, data):
         """Write to meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
-        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        inc_file = self.recipeinc(recipe)
         self.logger.debug("Writing to: %s\n%s\n" % (inc_file, data))
         ftools.write_file(inc_file, data)
+        return inc_file
 
     def append_recipeinc(self, recipe, data):
         """Append data to meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
-        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        inc_file = self.recipeinc(recipe)
         self.logger.debug("Appending to: %s\n%s\n" % (inc_file, data))
         ftools.append_file(inc_file, data)
+        return inc_file
 
     def remove_recipeinc(self, recipe, data):
         """Remove data from meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
-        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        inc_file = self.recipeinc(recipe)
         self.logger.debug("Removing from: %s\n%s\n" % (inc_file, data))
         ftools.remove_from_file(inc_file, data)
 
     def delete_recipeinc(self, recipe):
         """Delete meta-sefltest/recipes-test/<recipe>/test_recipe.inc file"""
-        inc_file = os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
+        inc_file = self.recipeinc(recipe)
         self.logger.debug("Deleting file: %s" % inc_file)
         try:
             os.remove(inc_file)
@@ -259,13 +265,13 @@ to ensure accurate results.")
         self.logger.debug("Writing to: %s\n%s\n" % (self.machineinc_path, data))
         ftools.write_file(self.machineinc_path, data)
 
-    # check does path exist    
+    # check does path exist
     def assertExists(self, expr, msg=None):
         if not os.path.exists(expr):
             msg = self._formatMessage(msg, "%s does not exist" % safe_repr(expr))
             raise self.failureException(msg)
-    
-    # check does path not exist 
+
+    # check does path not exist
     def assertNotExists(self, expr, msg=None):
         if os.path.exists(expr):
             msg = self._formatMessage(msg, "%s exists when it should not" % safe_repr(expr))
-- 
2.11.0


