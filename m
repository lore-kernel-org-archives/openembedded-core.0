Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhB-0002KL-Vv
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396287"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:04 -0800
Message-Id: <0632535c449247b01625f8b621b0cfadc2e55fdd.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 06/11] glib-2.0: fix compilatoin with x32 toolchain
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Pass along CC & CFLAGS vars so that the tune parameters set get used.
This fixes compilation with x32 toolchain.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |   76 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb      |    3 +-
 2 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
new file mode 100644
index 0000000..70cbbbe
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
@@ -0,0 +1,76 @@
+UpstreamStatus: Pending
+
+Pass CC & CFLAGS vars so that tune parameters get used.
+This fixes compilation with x32 toolchain.
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
+
+Index: glib-2.30.0/glib/Makefile.am
+===================================================================
+--- glib-2.30.0.orig/glib/Makefile.am
++++ glib-2.30.0/glib/Makefile.am
+@@ -359,10 +359,10 @@ INSTALL_PROGS=
+ 
+ if ENABLE_DTRACE
+ glib_probes.h: glib_probes.d Makefile
+-	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
++	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ 	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ glib_probes.o: glib_probes.d Makefile
+-	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
++	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ BUILT_SOURCES += glib_probes.h glib_probes.o
+ CLEANFILES += glib_probes.h glib_probes.h.tmp
+ libglib_2_0_la_LIBADD += glib_probes.o
+Index: glib-2.30.0/glib/Makefile.in
+===================================================================
+--- glib-2.30.0.orig/glib/Makefile.in
++++ glib-2.30.0/glib/Makefile.in
+@@ -1691,10 +1691,10 @@ uninstall-local: uninstall-ms-lib uninst
+ @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
+ 
+ @ENABLE_DTRACE_TRUE@glib_probes.h: glib_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
++@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ @ENABLE_DTRACE_TRUE@glib_probes.o: glib_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
++@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ 
+ gspawn-win32-helper-console.c:
+ 	echo '#define HELPER_CONSOLE' >$@
+Index: glib-2.30.0/gobject/Makefile.am
+===================================================================
+--- glib-2.30.0.orig/gobject/Makefile.am
++++ glib-2.30.0/gobject/Makefile.am
+@@ -141,10 +141,10 @@ gobject_c_sources = \
+ 
+ if ENABLE_DTRACE
+ gobject_probes.h: gobject_probes.d Makefile
+-	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
++	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ 	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ gobject_probes.o: gobject_probes.d Makefile
+-	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
++	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ BUILT_SOURCES += gobject_probes.h gobject_probes.o
+ CLEANFILES += gobject_probes.h
+ libgobject_2_0_la_LIBADD += gobject_probes.o
+Index: glib-2.30.0/gobject/Makefile.in
+===================================================================
+--- glib-2.30.0.orig/gobject/Makefile.in
++++ glib-2.30.0/gobject/Makefile.in
+@@ -1581,10 +1581,10 @@ uninstall-ms-lib:
+ @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
+ 
+ @ENABLE_DTRACE_TRUE@gobject_probes.h: gobject_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
++@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ @ENABLE_DTRACE_TRUE@gobject_probes.o: gobject_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
++@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ 
+ # This is read by gobject-introspection/misc/ and gtk-doc
+ gobject-public-headers.txt: Makefile
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
index 408ab83..bf415a1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -13,6 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
+           file://glib-2.0_fix_for_x32.patch \
           "
 SRC_URI[md5sum] = "921ef2e86e911feb5e21f656f1ac305b"
 SRC_URI[sha256sum] = "4e560319450f31d85b6cdb2b530c3324a510ca04817e360943d0774327d21804"
-- 
1.7.6.4



