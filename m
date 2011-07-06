Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QeQJt-0000NC-PE
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 13:31:05 +0200
Received: by wyg30 with SMTP id 30so5187552wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2011 04:27:15 -0700 (PDT)
Received: by 10.227.20.82 with SMTP id e18mr5607785wbb.58.1309951634831;
	Wed, 06 Jul 2011 04:27:14 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c17sm6003703wbh.46.2011.07.06.04.27.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jul 2011 04:27:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:27:07 +0200
Message-Id: <1309951628-11896-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] pulseaudio: add 0.9.23
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
X-List-Received-Date: Wed, 06 Jul 2011 11:31:05 -0000

Older version have been retained to allow more testing of this release

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../pulseaudio-0.9.23/autoconf_version.patch       |   17 ++++++++++
 .../pulseaudio/pulseaudio-0.9.23/buildfix.patch    |   17 ++++++++++
 .../pulseaudio-0.9.23/configure_silent_rules.patch |   33 +++++++++++++++++++
 .../pulseaudio-0.9.23/gcc4-compile-fix.patch       |   22 +++++++++++++
 .../pulseaudio/pulseaudio-0.9.23/tls_m4.patch      |   34 ++++++++++++++++++++
 .../pulseaudio-0.9.23/volatiles.04_pulse           |    2 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |   25 ++++++++++++++
 8 files changed, 151 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch
new file mode 100644
index 0000000..86e3972
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch
@@ -0,0 +1,17 @@
+Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: pulseaudio-0.9.15/configure.ac
+===================================================================
+--- pulseaudio-0.9.15.orig/configure.ac	2009-04-14 00:09:53.000000000 +0100
++++ pulseaudio-0.9.15/configure.ac	2009-05-22 11:32:50.000000000 +0100
+@@ -20,7 +20,7 @@
+ # along with PulseAudio; if not, write to the Free Software Foundation,
+ # Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+ 
+-AC_PREREQ(2.63)
++AC_PREREQ(2.61)
+ 
+ m4_define(pa_major, [0])
+ m4_define(pa_minor, [9])
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
new file mode 100644
index 0000000..99ceff8
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
@@ -0,0 +1,17 @@
+Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Pending
+
+Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
+===================================================================
+--- pulseaudio-0.9.11.orig/src/pulsecore/atomic.h
++++ pulseaudio-0.9.11/src/pulsecore/atomic.h
+@@ -40,6 +40,8 @@
+ #error "Please include config.h before including this file!"
+ #endif
+ 
++#include "macro.h"
++
+ #ifdef HAVE_ATOMIC_BUILTINS
+ 
+ /* __sync based implementation */
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch
new file mode 100644
index 0000000..d4a247a
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch
@@ -0,0 +1,33 @@
+Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: pulseaudio-0.9.19/configure.ac
+===================================================================
+--- pulseaudio-0.9.19.orig/configure.ac	2009-10-31 11:40:00.000000000 +0000
++++ pulseaudio-0.9.19/configure.ac	2009-10-31 11:50:35.000000000 +0000
+@@ -27,12 +27,13 @@
+ AC_CONFIG_SRCDIR([src/daemon/main.c])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_HEADERS([config.h])
+-AM_INIT_AUTOMAKE([foreign 1.11 -Wall -Wno-portability silent-rules tar-pax])
++AM_INIT_AUTOMAKE([foreign 1.10 -Wall -Wno-portability tar-pax])
+ 
+ m4_define(pa_major, `echo $VERSION | cut -d. -f1 | cut -d- -f1`)
+ m4_define(pa_minor, `echo $VERSION | cut -d. -f2 | cut -d- -f1`)
+ m4_define(pa_micro, `echo $VERSION | cut -d. -f3 | cut -d- -f1`)
+ 
++
+ AC_SUBST(PA_MAJOR, pa_major)
+ AC_SUBST(PA_MINOR, pa_minor)
+ AC_SUBST(PA_MICRO, pa_micro)
+@@ -80,7 +81,8 @@
+       ;;
+ esac
+ 
+-AM_SILENT_RULES([yes])
++# only use if available
++m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+ #### Checks for programs. ####
+ 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch
new file mode 100644
index 0000000..f8b07ea
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch
@@ -0,0 +1,22 @@
+| fix for more strict syntax compliance in gcc4.x
+| pulsecore/core-util.c: In function 'pa_raise_priority':
+| pulsecore/core-util.c:547: error: label at end of compound statement
+| Signed off: mickey@openmoko.org
+|
+Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Pending
+
+Index: pulseaudio-0.9.6/src/pulsecore/core-util.c
+===================================================================
+--- pulseaudio-0.9.6.orig/src/pulsecore/core-util.c
++++ pulseaudio-0.9.6/src/pulsecore/core-util.c
+@@ -535,7 +535,7 @@ void pa_raise_priority(void) {
+         pa_log_info("Successfully gained high priority class.");
+ #endif
+ 
+-fail:
++fail:;
+ 
+ #if defined(HAVE_SYS_CAPABILITY_H)
+     if (caps) {
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
new file mode 100644
index 0000000..bae0a25
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
@@ -0,0 +1,34 @@
+Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: pulseaudio-0.9.15/m4/tls.m4
+===================================================================
+--- pulseaudio-0.9.15.orig/m4/tls.m4	2008-08-19 23:25:02.000000000 +0200
++++ pulseaudio-0.9.15/m4/tls.m4	2009-07-10 09:55:25.266365511 +0200
+@@ -1,12 +1,19 @@
+ AC_DEFUN([CC_CHECK_TLS], [
+   AC_CACHE_CHECK([whether $CC knows __thread for Thread-Local Storage],
+     cc_cv_tls___thread,
+-    [AC_COMPILE_IFELSE(
+-      AC_LANG_PROGRAM(
+-        [[static __thread int a = 6;]],
+-        [[a = 5;]]),
+-      [cc_cv_tls___thread=yes],
+-      [cc_cv_tls___thread=no])
++    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a = b; }],
++	 [chktls_save_LDFLAGS="$LDFLAGS"
++	  LDFLAGS="-shared -Wl,--no-undefined $LDFLAGS"
++	  chktls_save_CFLAGS="$CFLAGS"
++	  CFLAGS="-fPIC $CFLAGS"
++	  dnl If -shared works, test if TLS works in a shared library.
++	  AC_LINK_IFELSE([int f() { return 0; }],
++	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a = b; }],
++	      [cc_cv_tls___thread=yes],
++	      [cc_cv_tls___thread=no]),
++	    [cc_cv_tls___thread=yes])
++	  CFLAGS="$chktls_save_CFLAGS"
++	  LDFLAGS="$chktls_save_LDFLAGS"], [cc_cv_tls___thread=no])
+     ])
+   
+   AS_IF([test "x$cc_cv_tls___thread" = "xyes"],
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
new file mode 100644
index 0000000..5b19980
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d pulse pulse 0755 /var/run/pulse none
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ab7e867..12e6ef3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -65,7 +65,7 @@ FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 				   	 
 FILES_${PN}-dbg += "${libexecdir}/pulse/.debug \
                     ${libdir}/pulse-${PV}/modules/.debug"
-FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la"		    
+FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala"		    
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin = "${bindir}/* \
                    ${sysconfdir}/default/volatiles/volatiles.04_pulse"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
new file mode 100644
index 0000000..4bdc4ed
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -0,0 +1,25 @@
+require pulseaudio.inc
+
+PR = "r0"
+
+DEPENDS += "gdbm speex"
+
+inherit gettext
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.gz \
+  file://buildfix.patch \
+  file://autoconf_version.patch \
+  file://tls_m4.patch \
+  file://configure_silent_rules.patch \
+  file://volatiles.04_pulse \
+"
+
+SRC_URI[md5sum] = "7391205a337d1e04a9ff38025f684034"
+SRC_URI[sha256sum] = "af3e84c614cb632fd1f57105489fcd5f93f906da1ce5aa9019492212031fba4e"
+
+do_compile_prepend() {
+    cd ${S}
+    mkdir -p ${S}/libltdl
+    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+}
+
-- 
1.6.6.1



