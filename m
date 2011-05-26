Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPZ7O-00067f-1b
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 13:52:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 04:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="5295673"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 04:49:42 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 19:55:32 +0800
Message-Id: <fef36d90183b83d6578cd60c71a0dd54a49c0e77.1306401007.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306401007.git.lianhao.lu@intel.com>
References: <cover.1306401007.git.lianhao.lu@intel.com>
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
X-List-Received-Date: Thu, 26 May 2011 11:52:46 -0000

1. Added package_get_auto_pr to PACKAGEFUNCS to get the auto
incremented value(PRAUTO) from remote PR service.

2. use PKGV/PKGR for pkgdata which will be used by package_write_xxx.

3. Added supporting functions in prserv.bbclass.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass |   51 +++++++++++++++++++++++++++++------------
 meta/classes/prserv.bbclass  |   29 +++++++++++++++++++++++
 2 files changed, 65 insertions(+), 15 deletions(-)
 create mode 100644 meta/classes/prserv.bbclass

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2c6d30c..a1b9482 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -7,34 +7,37 @@
 #
 # There are the following default steps but PACKAGEFUNCS can be extended:
 #
-# a) perform_packagecopy - Copy D into PKGD
+# a) package_get_auto_pr - get PRAUTO from remote PR service
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
@@ -326,6 +329,15 @@ def runtime_mapping_rename (varname, d):
 # Package functions suitable for inclusion in PACKAGEFUNCS
 #
 
+python package_get_auto_pr() {
+	if d.getVar('USE_PR_SERV', True):
+		auto_pr=prserv_get_pr_auto(d)
+		if auto_pr is None:
+			bb.fatal("Can NOT get auto PR revision from remote PR service")
+			return
+		d.setVar('PRAUTO',str(auto_pr))
+}
+
 python package_do_split_locales() {
 	if (bb.data.getVar('PACKAGE_NO_LOCALE', d, True) == '1'):
 		bb.debug(1, "package requested not splitting locales")
@@ -773,6 +785,8 @@ python emit_pkgdata() {
 		write_if_exists(sf, pkg, 'PN')
 		write_if_exists(sf, pkg, 'PV')
 		write_if_exists(sf, pkg, 'PR')
+		write_if_exists(sf, pkg, 'PKGV')
+		write_if_exists(sf, pkg, 'PKGR')
 		write_if_exists(sf, pkg, 'DESCRIPTION')
 		write_if_exists(sf, pkg, 'SUMMARY')
 		write_if_exists(sf, pkg, 'RDEPENDS')
@@ -911,9 +925,9 @@ python package_do_shlibs() {
 
 	workdir = bb.data.getVar('WORKDIR', d, True)
 
-	ver = bb.data.getVar('PV', d, True)
+	ver = bb.data.getVar('PKGV', d, True)
 	if not ver:
-		bb.error("PV not defined")
+		bb.error("PKGV not defined")
 		return
 
 	pkgdest = bb.data.getVar('PKGDEST', d, True)
@@ -1025,6 +1039,12 @@ python package_do_shlibs() {
 		needs_ldconfig = False
 		bb.debug(2, "calculating shlib provides for %s" % pkg)
 
+		pkgver = bb.data.getVar('PKGV_' + pkg, d, True)
+		if not pkgver:
+			pkgver = bb.data.getVar('PV_' + pkg, d, True)
+		if not pkgver:
+			pkgver = ver
+
 		needed[pkg] = []
 		sonames = list()
 		renames = list()
@@ -1048,10 +1068,10 @@ python package_do_shlibs() {
 			fd = open(shlibs_file, 'w')
 			for s in sonames:
 				fd.write(s + '\n')
-				shlib_provider[s] = (pkg, ver)
+				shlib_provider[s] = (pkg, pkgver)
 			fd.close()
 			fd = open(shver_file, 'w')
-			fd.write(ver + '\n')
+			fd.write(pkgver + '\n')
 			fd.close()
 		if needs_ldconfig and use_ldconfig:
 			bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
@@ -1348,7 +1368,8 @@ python package_depchains() {
 }
 
 PACKAGE_PREPROCESS_FUNCS ?= ""
-PACKAGEFUNCS ?= "perform_packagecopy \
+PACKAGEFUNCS ?= "package_get_auto_pr \	
+                perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
 		package_do_split_locales \
 		split_and_strip_files \
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
new file mode 100644
index 0000000..de46ff6
--- /dev/null
+++ b/meta/classes/prserv.bbclass
@@ -0,0 +1,29 @@
+def prserv_make_conn(d):
+    import prserv.serv
+    host=d.getVar("PRSERV_HOST",True)
+    port=d.getVar("PRSERV_PORT",True)
+    try:
+        conn=None
+        conn=prserv.serv.PRServerConnection(host,int(port))
+        d.setVar("__PRSERV_CONN",conn)
+    except Exception, exc:
+        bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
+
+    return conn
+
+def prserv_get_pr_auto(d):
+    if not d.getVar('USE_PR_SERV', True):
+        bb.warn("Not using network based PR service")
+        return None
+
+    conn=d.getVar("__PRSERV_CONN", True)
+    if conn is None:
+        conn=prserv_make_conn(d)
+        if conn is None:
+            return None
+
+    version=d.getVar("PF", True)
+    checksum=d.getVar("BB_TASKHASH", True)
+    auto_rev=conn.getPR(version,checksum)
+    bb.debug(1,"prserv_get_pr_auto: version: %s checksum: %s result %d" % (version, checksum, auto_rev))
+    return auto_rev
-- 
1.7.0.4



