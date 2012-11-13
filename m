Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TYHNd-0001og-KZ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:22:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Nov 2012 06:08:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,767,1344236400"; d="scan'208";a="167777920"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.49])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Nov 2012 06:08:25 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 16:08:49 +0200
Message-Id: <1352815729-7409-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] insane.bbclass: add qa_package_check_name
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
X-List-Received-Date: Tue, 13 Nov 2012 14:22:21 -0000

Check if package names match the [a-z0-9.+-]+ regular
expression

[YOCTO #3139]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d51d1a1..f22e620 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -235,6 +235,15 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
         messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+def package_qa_check_name(name, d):
+    """
+    Check if the package name matches the [a-z0-9.+-]+ regular expression
+    """
+    import re
+    pattern = re.compile("^[a-z0-9.+-]+$")
+    if not pattern.match(name):
+        package_qa_handle_error("pkgname", "%s doesn't match the [a-z0-9.+-]+ regex\n" % name, d)
+
 def package_qa_check_libdir(d):
     """
     Check for wrong library installation paths. For instance, catch
@@ -780,6 +789,9 @@ python do_package_qa () {
                 errorchecks.append(g[testmatrix[e]])
 
         bb.note("Checking Package: %s" % package)
+        # Check package name
+        package_qa_check_name(package, d)
+
         path = "%s/%s" % (pkgdest, package)
         if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
             walk_sane  = False
-- 
1.7.11.7



