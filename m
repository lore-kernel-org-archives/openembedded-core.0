Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809l-00034S-6C
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Mar 2012 19:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119089804"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:14 -0700
Message-Id: <1b743bf3864539a8ce1902a269a5cec7d50dba1b.1331776832.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331776831.git.nitin.a.kamble@intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/8] python: fix install when libdir is not "lib"
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
X-List-Received-Date: Thu, 15 Mar 2012 02:11:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit fixes python's install issue of not finding the
native pythong binray modules.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/fix_for_using_different_libdir.patch    |   78 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 80 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch

diff --git a/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
new file mode 100644
index 0000000..e8f19a2
--- /dev/null
+++ b/meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Inappropriate [Embedded specific]
+
+This patch fixes issuing with different libdir like lib64.
+This patch makes the native python binary modules findable
+in the install process of the host python.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/03/14
+
+Index: Python-2.7.2/Lib/sysconfig.py
+===================================================================
+--- Python-2.7.2.orig/Lib/sysconfig.py
++++ Python-2.7.2/Lib/sysconfig.py
+@@ -7,10 +7,10 @@ from os.path import pardir, realpath
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
++        'purelib': '{base}/'+sys.lib+'/python{py_version_short}/site-packages',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{base}/include/python{py_version_short}',
+         'platinclude': '{platbase}/include/python{py_version_short}',
+         'scripts': '{base}/bin',
+@@ -65,10 +65,10 @@ _INSTALL_SCHEMES = {
+         'data'   : '{userbase}',
+         },
+     'posix_user': {
+-        'stdlib': '{userbase}/lib/python{py_version_short}',
+-        'platstdlib': '{userbase}/lib/python{py_version_short}',
+-        'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'purelib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
++        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+         'data'   : '{userbase}',
+Index: Python-2.7.2/Makefile.pre.in
+===================================================================
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -928,25 +928,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 		done; \
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+-	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+-	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH}  $(RUNSHARED) \
+ 		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index d2100be..412b294 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -20,7 +20,7 @@ SRC_URI += "\
   file://setup_py_skip_cross_import_check.patch \
   file://add-md5module-support.patch \
   file://host_include_contamination.patch \
-  file://sys_platform_is_now_always_linux2.patch \
+  file://fix_for_using_different_libdir.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -99,6 +99,7 @@ do_install() {
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-- 
1.7.6.4



