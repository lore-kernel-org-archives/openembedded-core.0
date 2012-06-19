Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Sh4NQ-0006yX-E2
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 21:46:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jun 2012 12:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="158311545"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.212])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2012 12:35:26 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 12:35:23 -0700
Message-Id: <4bcffbcd05c86903fbdf47bb46bf1a52b888dfeb.1340132548.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
In-Reply-To: <cover.1340132548.git.josh@linux.intel.com>
References: <cover.1340132548.git.josh@linux.intel.com>
Subject: [2011-1 PATCH 1/3] apt: Fix locale header and hardcoded libname issues
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
X-List-Received-Date: Tue, 19 Jun 2012 19:46:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

apt wasn't building on modern libc/compiler combinations due to missing
header includes.

The libcpp version was also being hardcoded, this patch generates it
dynamically to work on different host systems which no longer have
this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../apt/apt-0.7.14/localefixes.patch               |   91 ++++++++++++++++++++
 meta/recipes-devtools/apt/apt-native.inc           |    9 +-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt-package.inc          |    9 +-
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 6 files changed, 104 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch b/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
new file mode 100644
index 0000000..8025273
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
@@ -0,0 +1,91 @@
+Add in missing header includes to resolve compile failures with recent 
+compiler/glibc combinations.
+
+Upstream-Status: Inappropriate [Resolved upstream]
+
+RP 2011/11/23
+
+Index: apt-0.7.14/apt-pkg/init.cc
+===================================================================
+--- apt-0.7.14.orig/apt-pkg/init.cc	2011-11-23 22:48:53.544637868 +0000
++++ apt-0.7.14/apt-pkg/init.cc	2011-11-23 22:48:59.456638260 +0000
+@@ -16,6 +16,7 @@
+ #include <config.h>
+ #include <cstdlib>
+ #include <sys/stat.h>
++#include <locale>
+ 									/*}}}*/
+ 
+ #define Stringfy_(x) # x
+Index: apt-0.7.14/cmdline/apt-cache.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-cache.cc	2011-11-23 22:53:29.048631067 +0000
++++ apt-0.7.14/cmdline/apt-cache.cc	2011-11-23 22:54:15.784616212 +0000
+@@ -32,6 +32,7 @@
+ #include <apti18n.h>
+ 
+ #include <locale.h>
++#include <locale>
+ #include <iostream>
+ #include <unistd.h>
+ #include <errno.h>
+Index: apt-0.7.14/cmdline/apt-cdrom.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-cdrom.cc	2011-11-23 22:53:29.064631096 +0000
++++ apt-0.7.14/cmdline/apt-cdrom.cc	2011-11-23 22:53:57.616630261 +0000
+@@ -27,6 +27,7 @@
+ //#include "indexcopy.h"
+ 
+ #include <locale.h>
++#include <locale>
+ #include <iostream>
+ #include <fstream>
+ #include <vector>
+Index: apt-0.7.14/cmdline/apt-config.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-config.cc	2011-11-23 22:50:16.796635352 +0000
++++ apt-0.7.14/cmdline/apt-config.cc	2011-11-23 22:50:25.640633906 +0000
+@@ -27,6 +27,7 @@
+ #include <locale.h>
+ #include <iostream>
+ #include <string>
++#include <locale>
+ 									/*}}}*/
+ using namespace std;
+ 
+Index: apt-0.7.14/cmdline/apt-extracttemplates.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-extracttemplates.cc	2011-11-23 22:53:29.080631084 +0000
++++ apt-0.7.14/cmdline/apt-extracttemplates.cc	2011-11-23 22:53:38.304630439 +0000
+@@ -39,6 +39,7 @@
+ #include <config.h>
+ #include <apti18n.h>
+ #include "apt-extracttemplates.h"
++#include <locale>
+ 									/*}}}*/
+ 
+ using namespace std;
+Index: apt-0.7.14/cmdline/apt-get.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-get.cc	2011-11-23 22:53:29.096631090 +0000
++++ apt-0.7.14/cmdline/apt-get.cc	2011-11-23 22:53:49.368629452 +0000
+@@ -48,6 +48,7 @@
+ 
+ #include <set>
+ #include <locale.h>
++#include <locale>
+ #include <langinfo.h>
+ #include <fstream>
+ #include <termios.h>
+Index: apt-0.7.14/cmdline/apt-sortpkgs.cc
+===================================================================
+--- apt-0.7.14.orig/cmdline/apt-sortpkgs.cc	2011-11-23 22:52:03.872640247 +0000
++++ apt-0.7.14/cmdline/apt-sortpkgs.cc	2011-11-23 22:52:10.880638611 +0000
+@@ -27,6 +27,7 @@
+ 
+ #include <locale.h>
+ #include <unistd.h>
++#include <locale>
+ 									/*}}}*/
+ 
+ using namespace std;
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index b16f99e..ddaeaf9 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -40,10 +40,11 @@ do_install_base () {
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
 
 	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER-6 ${D}${libdir}/
-	ln -sf libapt-pkg$GLIBC_VER-6.so ${D}${libdir}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER-6 ${D}${libdir}/
-	ln -sf libapt-inst$GLIBC_VER-6.so ${D}${libdir}/libapt-inst.so
+	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
+	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
+	ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-pkg.so
+	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
+	ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-inst.so
 
 	install -d ${D}${libdir}/apt/methods
 	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
index c82d606..37368ac 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
@@ -1,6 +1,6 @@
 require apt-native.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 2e3be38..1909e3b 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -78,10 +78,11 @@ do_install () {
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
 
 	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER-6 ${D}${libdir}/
-	ln -sf libapt-pkg$GLIBC_VER-6.so ${D}${libdir}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER-6 ${D}${libdir}/
-	ln -sf libapt-inst$GLIBC_VER-6.so ${D}${libdir}/libapt-inst.so
+	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
+	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
+	ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-pkg.so
+	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
+	ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-inst.so
 
 	install -d ${D}${libdir}/apt/methods
 	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 546683f..9d3268d 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -5,6 +5,7 @@ SECTION = "base"
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
            file://no-ko-translation.patch \
            file://use-host.patch \
+           file://localefixes.patch \
            "
 
 inherit autotools gettext
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index 93eebe9..bd1116f 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
-- 
1.7.10.2



