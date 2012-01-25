Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rps7J-0003Ix-NN
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 02:57:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2012 17:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115810658"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2012 17:49:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 17:49:54 -0800
Message-Id: <1327456194-9871-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 1/2] insane.bbclass: Add test for static .a libraries in non-staticdev packages
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
X-List-Received-Date: Wed, 25 Jan 2012 01:57:41 -0000

This check verifies that non staticdev and non pic packages do not
have static libraries in them. There are a few exceptions for the
libgcc-dev and libgcov-dev packages which are whitelisted, also the
*_nonshared.a need to be part of their respective -dev packages.

This is currently a warning to work out any other issues in the upper
layers but will be moved to ERROR at somepoint in the future.

[YOCTO #663]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/insane.bbclass |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ce21496..7aea73b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -109,7 +109,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts"
+WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
 
 def package_qa_clean_path(path,d):
@@ -192,6 +192,24 @@ def package_qa_check_dev(path, name, d, elf, messages):
         messages.append("non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[staticdev] = "package_qa_check_staticdev"
+
+# These 2 packages contain archive libraries that need to be in -dev
+STATICDEV_WHITELIST = "libgcc-dev libgcov-dev"
+def package_qa_check_staticdev(path, name, d, elf, messages):
+    """
+    Check for ".a" library in non-staticdev packages, use a STATICDEV_WHITELIST
+    for exceptions
+    """
+
+    import re
+    staticdev_whitelist = d.getVar('STATICDEV_WHITELIST', True)
+    if (staticdev_whitelist.find(name) != -1):
+        return
+    if not name.endswith("-pic") and not name.endswith("-staticdev") and path.endswith(".a") and not path.endswith("_nonshared.a"):
+        messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
+
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
 def package_qa_check_dbg(path, name, d, elf, messages):
     """
-- 
1.7.6.5



