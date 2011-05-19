Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QN0Sx-000628-Cn
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:28:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2011 03:24:25 -0700
X-ExtLoop1: 1
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2011 03:24:24 -0700
Message-Id: <c75426ee78c4ed4dae65ba35fc8781be4afdc701.1305800693.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Old-Date: Wed, 18 May 2011 21:15:01 +0800
Date: Thu, 19 May 2011 18:29:26 +0800
To: openembedded-core@lists.openembedded.org
From: Lianhao Lu <lianhao.lu@intel.com>
Subject: [PATCH 3/5] classes/package(prserv).bbclass: Added PR service support.
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
X-List-Received-Date: Thu, 19 May 2011 10:28:28 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

1. Added package_get_auto_rev to PACKAGEFUNCS to get the auto
incremented value(PRAUTO) from remote PR service.

2. Save PRFORMAT to pkgdata to be used by package_write_xxx.

3. Added supporting functions in prserv.bbclass.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass |   36 +++++++++++++++++++++++++-----------
 meta/classes/prserv.bbclass  |   29 +++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/prserv.bbclass

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4eb349d..efadbbd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -7,34 +7,37 @@
 #
 # There are the following default steps but PACKAGEFUNCS can be extended:
 #
-# a) perform_packagecopy - Copy D into PKGD
+# a) package_get_auto_rev - get PRAUTO from remote PR service
 #
-# b) package_do_split_locales - Split out the locale files, updates FILES and PACKAGES
+# b) perform_packagecopy - Copy D into PKGD
 #
-# c) split_and_strip_files - split the files into runtime and debug and strip them.
+# c) package_do_split_locales - Split out the locale files, updates FILES and PACKAGES
+#
+# d) split_and_strip_files - split the files into runtime and debug and strip them.
 #    Debug files include debug info split, and associated sources that end up in -dbg packages
 #
-# d) populate_packages - Split the files in PKGD into separate packages in PKGDEST/<pkgname>
+# e) populate_packages - Split the files in PKGD into separate packages in PKGDEST/<pkgname>
 #    Also triggers the binary stripping code to put files in -dbg packages.
 #
-# e) package_do_filedeps - Collect perfile run-time dependency metadata
+# f) package_do_filedeps - Collect perfile run-time dependency metadata
 #    The data is stores in FILER{PROVIDES,DEPENDS}_file_pkg variables with
 #    a list of affected files in FILER{PROVIDES,DEPENDS}FLIST_pkg
 #
-# f) package_do_shlibs - Look at the shared libraries generated and autotmatically add any 
+# g) package_do_shlibs - Look at the shared libraries generated and autotmatically add any 
 #    depenedencies found. Also stores the package name so anyone else using this library 
 #    knows which package to depend on.
 #
-# g) package_do_pkgconfig - Keep track of which packages need and provide which .pc files
+# h) package_do_pkgconfig - Keep track of which packages need and provide which .pc files
 #
-# h) read_shlibdeps - Reads the stored shlibs information into the metadata
+# i) read_shlibdeps - Reads the stored shlibs information into the metadata
 #
-# i) package_depchains - Adds automatic dependencies to -dbg and -dev packages
+# j) package_depchains - Adds automatic dependencies to -dbg and -dev packages
 #
-# j) emit_pkgdata - saves the packaging data into PKGDATA_DIR for use in later 
+# k) emit_pkgdata - saves the packaging data into PKGDATA_DIR for use in later 
 #    packaging steps
 
 inherit packagedata
+inherit prserv
 
 PKGD    = "${WORKDIR}/package"
 PKGDEST = "${WORKDIR}/packages-split"
@@ -324,6 +327,15 @@ def runtime_mapping_rename (varname, d):
 # Package functions suitable for inclusion in PACKAGEFUNCS
 #
 
+python package_get_auto_rev() {
+	if bb.data.getVar('USE_PR_SERV', d, True):
+		auto_rev=get_auto_rev(d)
+		if auto_rev is None:
+			bb.fatal("Can NOT get auto revision from remote PR service")
+			return
+		bb.data.setVar('PRAUTO',str(auto_rev),d)
+}
+
 python package_do_split_locales() {
 	if (bb.data.getVar('PACKAGE_NO_LOCALE', d, True) == '1'):
 		bb.debug(1, "package requested not splitting locales")
@@ -771,6 +783,7 @@ python emit_pkgdata() {
 		write_if_exists(sf, pkg, 'PN')
 		write_if_exists(sf, pkg, 'PV')
 		write_if_exists(sf, pkg, 'PR')
+		write_if_exists(sf, pkg, 'PRFORMAT')
 		write_if_exists(sf, pkg, 'DESCRIPTION')
 		write_if_exists(sf, pkg, 'SUMMARY')
 		write_if_exists(sf, pkg, 'RDEPENDS')
@@ -1346,7 +1359,8 @@ python package_depchains() {
 }
 
 PACKAGE_PREPROCESS_FUNCS ?= ""
-PACKAGEFUNCS ?= "perform_packagecopy \
+PACKAGEFUNCS ?= "package_get_auto_rev \	
+                perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
 		package_do_split_locales \
 		split_and_strip_files \
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
new file mode 100644
index 0000000..67c88f9
--- /dev/null
+++ b/meta/classes/prserv.bbclass
@@ -0,0 +1,29 @@
+def make_conn(d):
+    import prserv.serv
+    host=bb.data.getVar("PRSERV_HOST",d,True)
+    port=bb.data.getVar("PRSERV_PORT",d,True)
+    try:
+        conn=None
+        conn=prserv.serv.PRServerConnection(host,int(port))
+        bb.data.setVar("__PRSERV_CONN",conn,d)
+    except Exception, exc:
+        bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
+
+    return conn
+
+def get_auto_rev(d):
+    if not bb.data.getVar('USE_PR_SERV', d, True):
+        bb.warn("Not using network based PR service")
+        return None
+
+    conn=bb.data.getVar("__PRSERV_CONN", d, True)
+    if conn is None:
+        conn=make_conn(d)
+        if conn is None:
+            return None
+
+    version=bb.data.getVar("PF", d, True)
+    checksum=bb.data.getVar("BB_TASKHASH", d, True)
+    auto_rev=conn.getPR(version,checksum)
+    bb.debug(1,"get_auto_rev: version: %s checksum: %s result %d" % (version, checksum, auto_rev))
+    return auto_rev
-- 
1.7.0.4



