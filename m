Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TliYP-0007yq-Hf
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:01:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Dec 2012 07:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="234654083"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by azsmga001.ch.intel.com with ESMTP; 20 Dec 2012 07:46:13 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id A0069560613; Thu, 20 Dec 2012 17:46:15 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: richard.purdie@linuxfoundation.org, paul.eggleton@linux.intel.com,
	laurentiu.palcu@intel.com, constantinx.musca@intel.com,
	ross.burton@intel.com, openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 17:46:12 +0200
Message-Id: <1356018372-26226-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] Fix dependency ordering
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
X-List-Received-Date: Thu, 20 Dec 2012 16:01:05 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch fixes the precedence of the dependency list
that may appear when a single package source is split in
multiple binary packages.

The shared lib dependency resolver will prefer the shared
library as found in the package tree instead as it is defined
in the PACKAGES instructions.

The fix will prevent overriding the package name with the
parent package name.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/package.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9885d94..4556315 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1508,7 +1508,8 @@ python package_do_shlibs() {
                     lib_ver = fd.readline().rstrip()
                     fd.close()
                 for l in lines:
-                    shlib_provider[l.rstrip()] = (dep_pkg, lib_ver)
+                    if not l.rstrip() in shlib_provider:
+                        shlib_provider[l.rstrip()] = (dep_pkg, lib_ver)
 
     bb.utils.unlockfile(lf)
 
@@ -1521,7 +1522,8 @@ python package_do_shlibs() {
             if len(dep_pkg) == 2:
                 lib_ver = dep_pkg[1]
             dep_pkg = dep_pkg[0]
-            shlib_provider[l] = (dep_pkg, lib_ver)
+            if not l in shlib_provider:
+                shlib_provider[l] = (dep_pkg, lib_ver)
 
     for pkg in packages.split():
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
-- 
1.7.10.4



