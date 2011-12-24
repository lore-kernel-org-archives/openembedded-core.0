Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReNU8-0004f9-KY
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 10:01:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Dec 2011 00:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105668642"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 24 Dec 2011 00:54:34 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 17:06:28 +0800
Message-Id: <a4b409442ef5f1cc9466c6fb625df31963ba802b.1324717264.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
References: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
In-Reply-To: <cover.1324717264.git.shane.wang@intel.com>
References: <cover.1324717264.git.shane.wang@intel.com>
Subject: [PATCH 07/13] glib-2.0: upgrade to 2.30.2
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
X-List-Received-Date: Sat, 24 Dec 2011 09:01:44 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |   76 --------------------
 .../{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb}     |    7 +-
 2 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb} (88%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
deleted file mode 100644
index 70cbbbe..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-UpstreamStatus: Pending
-
-Pass CC & CFLAGS vars so that tune parameters get used.
-This fixes compilation with x32 toolchain.
-
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
-
-Index: glib-2.30.0/glib/Makefile.am
-===================================================================
---- glib-2.30.0.orig/glib/Makefile.am
-+++ glib-2.30.0/glib/Makefile.am
-@@ -359,10 +359,10 @@ INSTALL_PROGS=
- 
- if ENABLE_DTRACE
- glib_probes.h: glib_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- 	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- glib_probes.o: glib_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- BUILT_SOURCES += glib_probes.h glib_probes.o
- CLEANFILES += glib_probes.h glib_probes.h.tmp
- libglib_2_0_la_LIBADD += glib_probes.o
-Index: glib-2.30.0/glib/Makefile.in
-===================================================================
---- glib-2.30.0.orig/glib/Makefile.in
-+++ glib-2.30.0/glib/Makefile.in
-@@ -1691,10 +1691,10 @@ uninstall-local: uninstall-ms-lib uninst
- @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
- 
- @ENABLE_DTRACE_TRUE@glib_probes.h: glib_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- @ENABLE_DTRACE_TRUE@glib_probes.o: glib_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- 
- gspawn-win32-helper-console.c:
- 	echo '#define HELPER_CONSOLE' >$@
-Index: glib-2.30.0/gobject/Makefile.am
-===================================================================
---- glib-2.30.0.orig/gobject/Makefile.am
-+++ glib-2.30.0/gobject/Makefile.am
-@@ -141,10 +141,10 @@ gobject_c_sources = \
- 
- if ENABLE_DTRACE
- gobject_probes.h: gobject_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- 	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- gobject_probes.o: gobject_probes.d Makefile
--	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- BUILT_SOURCES += gobject_probes.h gobject_probes.o
- CLEANFILES += gobject_probes.h
- libgobject_2_0_la_LIBADD += gobject_probes.o
-Index: glib-2.30.0/gobject/Makefile.in
-===================================================================
---- glib-2.30.0.orig/gobject/Makefile.in
-+++ glib-2.30.0/gobject/Makefile.in
-@@ -1581,10 +1581,10 @@ uninstall-ms-lib:
- @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
- 
- @ENABLE_DTRACE_TRUE@gobject_probes.h: gobject_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- @ENABLE_DTRACE_TRUE@gobject_probes.o: gobject_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- 
- # This is read by gobject-introspection/misc/ and gtk-doc
- gobject-public-headers.txt: Makefile
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index bf415a1..62f7dc6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native"
@@ -13,10 +13,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
-           file://glib-2.0_fix_for_x32.patch \
           "
-SRC_URI[md5sum] = "921ef2e86e911feb5e21f656f1ac305b"
-SRC_URI[sha256sum] = "4e560319450f31d85b6cdb2b530c3324a510ca04817e360943d0774327d21804"
+SRC_URI[md5sum] = "b40f3889e8d24e1b367763673ca6deb5"
+SRC_URI[sha256sum] = "94b1f1a1456c67060ca868d299bef3f7268a2c1c5c360aabb7149d4d9b2fdcd3"
 
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-- 
1.7.6



