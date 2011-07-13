Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qh593-00034N-KE
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:30:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2011 12:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,526,1304319600"; d="scan'208";a="25507386"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 12:26:52 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 05:59:32 -0700
Message-Id: <c8ed5900d3ef67a57db6d0b50226269f1c25477e.1310561877.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
References: <6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310561877.git.nitin.a.kamble@intel.com>
References: <cover.1310561877.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] glib-2.0: fix makefiles
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
X-List-Received-Date: Wed, 13 Jul 2011 19:30:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

x32 exposed this bug in the makefiles.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../glib-2.0/glib-2.0/x32_compile_fix.patch        |   65 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |    3 +-
 2 files changed, 67 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/x32_compile_fix.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/x32_compile_fix.patch b/meta/recipes-core/glib-2.0/glib-2.0/x32_compile_fix.patch
new file mode 100644
index 0000000..b25516e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/x32_compile_fix.patch
@@ -0,0 +1,65 @@
+Received from H J Liu @intel
+UpstreamStatus: Pending
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
+
+--- glib-2.28.8/glib/Makefile.am.x32	2011-06-05 16:18:49.000000000 -0700
++++ glib-2.28.8/glib/Makefile.am	2011-07-13 07:00:51.350088697 -0700
+@@ -347,10 +347,10 @@ INSTALL_PROGS=
+ 
+ if ENABLE_DTRACE
+ glib_probes.h: glib_probes.d Makefile
+-	$(DTRACE) -C -h -s $< -o $@.tmp
++	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ 	sed -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ glib_probes.o: glib_probes.d Makefile
+-	$(DTRACE) -G -s $< -o $@
++	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ BUILT_SOURCES += glib_probes.h glib_probes.o
+ CLEANFILES += glib_probes.h glib_probes.h.tmp
+ libglib_2_0_la_LIBADD += glib_probes.o
+--- glib-2.28.8/glib/Makefile.in.x32	2011-06-05 16:24:51.000000000 -0700
++++ glib-2.28.8/glib/Makefile.in	2011-07-13 07:00:51.351088697 -0700
+@@ -1745,10 +1745,10 @@ uninstall-local: uninstall-ms-lib uninst
+ @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
+ 
+ @ENABLE_DTRACE_TRUE@glib_probes.h: glib_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(DTRACE) -C -h -s $< -o $@.tmp
++@ENABLE_DTRACE_TRUE@	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ @ENABLE_DTRACE_TRUE@	sed -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ @ENABLE_DTRACE_TRUE@glib_probes.o: glib_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(DTRACE) -G -s $< -o $@
++@ENABLE_DTRACE_TRUE@	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ 
+ gspawn-win32-helper-console.c:
+ 	echo '#define HELPER_CONSOLE' >$@
+--- glib-2.28.8/gobject/Makefile.am.x32	2011-06-05 16:18:50.000000000 -0700
++++ glib-2.28.8/gobject/Makefile.am	2011-07-13 07:09:42.410088595 -0700
+@@ -140,10 +140,10 @@ BUILT_SOURCES = gmarshal.h gmarshal.c
+ 
+ if ENABLE_DTRACE
+ gobject_probes.h: gobject_probes.d Makefile
+-	$(DTRACE) -C -h -s $< -o $@.tmp
++	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ 	sed -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ gobject_probes.o: gobject_probes.d Makefile
+-	$(DTRACE) -G -s $< -o $@
++	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ BUILT_SOURCES += gobject_probes.h gobject_probes.o
+ CLEANFILES += gobject_probes.h
+ libgobject_2_0_la_LIBADD += gobject_probes.o
+--- glib-2.28.8/gobject/Makefile.in.x32	2011-06-05 16:24:52.000000000 -0700
++++ glib-2.28.8/gobject/Makefile.in	2011-07-13 07:10:00.365088596 -0700
+@@ -1430,10 +1430,10 @@ uninstall-ms-lib:
+ @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
+ 
+ @ENABLE_DTRACE_TRUE@gobject_probes.h: gobject_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(DTRACE) -C -h -s $< -o $@.tmp
++@ENABLE_DTRACE_TRUE@	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
+ @ENABLE_DTRACE_TRUE@	sed -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
+ @ENABLE_DTRACE_TRUE@gobject_probes.o: gobject_probes.d Makefile
+-@ENABLE_DTRACE_TRUE@	$(DTRACE) -G -s $< -o $@
++@ENABLE_DTRACE_TRUE@	CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
+ 
+ gmarshal.h: stamp-gmarshal.h
+ 	@true
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
index a2e609f..a793eb0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r2"
+PR = "r3"
 PE = "1"
 
 SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
@@ -9,6 +9,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/2.28/glib-${PV}.tar.bz2 \
            file://g_once_init_enter.patch \
            file://0003-gatomic-proper-pointer-get-cast.patch.patch \
            file://0005-glib-mkenums-interpreter.patch.patch \
+           file://x32_compile_fix.patch \
           "
 # Only apply this patch for target recipe on uclibc
 SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-- 
1.7.5.4



