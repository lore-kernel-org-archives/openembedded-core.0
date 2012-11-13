Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TYIyY-00051B-W7
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 17:04:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 07:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,767,1344236400"; d="scan'208";a="217148097"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.49])
	by azsmga001.ch.intel.com with ESMTP; 13 Nov 2012 07:50:37 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 17:51:00 +0200
Message-Id: <1352821860-2263-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCHv2] insane.bbclass: add qa package name check
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
X-List-Received-Date: Tue, 13 Nov 2012 16:04:35 -0000

Check if package names match the [a-z0-9.+-]+ regular
expression

[YOCTO #3139]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/insane.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2dc9ba3..57a6efd 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -757,6 +757,9 @@ python do_package_qa () {
         return
 
     testmatrix = d.getVarFlags("QAPATHTEST")
+    import re
+    # The package name matches the [a-z0-9.+-]+ regular expression
+    pkgname_pattern = re.compile("^[a-z0-9.+-]+$")
 
     g = globals()
     walk_sane = True
@@ -780,6 +783,11 @@ python do_package_qa () {
                 errorchecks.append(g[testmatrix[e]])
 
         bb.note("Checking Package: %s" % package)
+        # Check package name
+        if not pkgname_pattern.match(package):
+            package_qa_handle_error("pkgname",
+                    "%s doesn't match the [a-z0-9.+-]+ regex\n" % package, d)
+
         path = "%s/%s" % (pkgdest, package)
         if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
             walk_sane  = False
-- 
1.7.11.7



