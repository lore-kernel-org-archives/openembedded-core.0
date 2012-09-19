Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TEGnW-0002CT-2K
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 11:42:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Sep 2012 02:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194452780"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 02:29:39 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 12:32:39 +0300
Message-Id: <f8aa3721ae0bbbb972063cf38be6339e11964a37.1348046845.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348046845.git.radu.moisan@intel.com>
References: <cover.1348046845.git.radu.moisan@intel.com>
In-Reply-To: <cover.1348046845.git.radu.moisan@intel.com>
References: <cover.1348046845.git.radu.moisan@intel.com>
Subject: [PATCH 1/1] insane.bbclass: add library dir sanity check
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
X-List-Received-Date: Wed, 19 Sep 2012 09:42:22 -0000

Check in ${PKGD} for libraries in wrong locations.
Trigger a warning if so.
Eg. Catch recipe installing /lib/bar.so when ${base_libdir}="lib32"
or installing in /usr/lib64 when ${libdir}="/usr/lib"

[Yocto #2038]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/classes/insane.bbclass |   39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e74eb3f..425e93a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -113,7 +113,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev"
+WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
 
 def package_qa_clean_path(path,d):
@@ -212,6 +212,40 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
         messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+def package_qa_check_libdir(d):
+    """
+    Check for wrong library installation paths. For instance, catch
+    recipes installing /lib/bar.so when ${base_libdir}="lib32" or
+    installing in /usr/lib64 when ${libdir}="/usr/lib"
+    """
+    import re
+
+    pkgd = d.getVar('PKGD', True)
+    base_libdir = d.getVar("base_libdir",True) + os.sep
+    libdir = d.getVar("libdir", True) + os.sep
+    exec_prefix = d.getVar("exec_prefix", True) + os.sep
+
+    messages = []
+    my_files = []
+
+    for root, dirs, files in os.walk(pkgd):
+        for file in files:
+            full_path = os.path.join(root,file)
+            my_files.append(full_path[len(pkgd):])
+
+    lib_re = re.compile("^/lib.*\.so")
+    exec_re = re.compile("^%s.*/lib*.\.so" % exec_prefix)
+
+    for file in my_files:
+        if lib_re.match(file):
+            if base_libdir not in file:
+                messages.append("Found library in wrong location: %s" % file)
+        if exec_re.match(file):
+            if libdir not in file:
+                messages.append("Found library in wrong location: %s" % file)
+    if messages:
+        package_qa_handle_error("libdir", "\n".join(messages), d)
+
 QAPATHTEST[debug-files] = "package_qa_check_dbg"
 def package_qa_check_dbg(path, name, d, elf, messages):
     """
@@ -688,6 +722,9 @@ python do_package_qa () {
             rdepends_sane = False
 
 
+    if 'libdir' in (d.getVar("WARN_QA", True) or "").split():
+        package_qa_check_libdir(d)
+
     if not walk_sane or not rdepends_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
-- 
1.7.9.5



