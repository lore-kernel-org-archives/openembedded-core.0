Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDC7609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:48:38 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XHYut-0005QP-Aa from Yasir_Khan@mentor.com ;
	Wed, 13 Aug 2014 06:48:39 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Aug 2014 06:48:38 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 18:48:13 +0500
Message-Id: <1407937693-55248-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 13 Aug 2014 13:48:39.0098 (UTC)
	FILETIME=[495F09A0:01CFB6FD]
Subject: [PATCH 1/2] consolekit: allow explicit enable/disable of polkit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Aug 2014 13:48:45 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Adds the configure option to enable/disable policykit.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../consolekit/add-polkit-configure-argument.patch |   33 ++++++++++++++++++++
 .../recipes-support/consolekit/consolekit_0.4.6.bb |    7 +++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch

diff --git a/meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch b/meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch
new file mode 100644
index 0000000..ad879d4
--- /dev/null
+++ b/meta/recipes-support/consolekit/consolekit/add-polkit-configure-argument.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+--- ConsoleKit-0.4.6.orig/configure.ac
++++ ConsoleKit-0.4.6/configure.ac
+@@ -56,10 +56,24 @@ PKG_CHECK_MODULES(CONSOLE_KIT,
+   gthread-2.0 >= $GLIB_REQUIRED_VERSION
+ )
+
+-PKG_CHECK_MODULES(POLKIT,
+-  polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
+-  have_polkit=yes,
+-  have_polkit=no)
++AC_ARG_WITH([polkit],
++  [AS_HELP_STRING([--with-polkit],
++    [support PolicyKit @<:@default=check@:>@])],
++  [],
++  [with_polkit=check])
++
++AS_IF([test "x$with_polkit" != xno],
++  [PKG_CHECK_MODULES(POLKIT,
++     polkit-gobject-1 >= $POLKIT_REQUIRED_VERSION,
++     have_polkit=yes,
++     [if test "x$with_polkit" != xcheck; then
++       AC_MSG_FAILURE(
++         [--with-polkit was given, but test for polkit failed])
++      else
++        have_polkit=no
++      fi
++     ])])
++
+ if test "x$have_polkit" = "xyes" ; then
+        AC_DEFINE(HAVE_POLKIT, [], [Define if we have polkit])
+ fi
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 9851616..643850f 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -12,7 +12,9 @@ RDEPENDS_${PN} += "base-files"
 inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.xz \
-           file://sepbuildfix.patch"
+           file://sepbuildfix.patch \
+           file://add-polkit-configure-argument.patch \
+"
 
 SRC_URI[md5sum] = "611792b4d616253a5bdec9175f8b7678"
 SRC_URI[sha256sum] = "b41d17e06f80059589fbeefe96ad07bcc564c49e65516da1caf975146475565c"
@@ -23,8 +25,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG[pam] = "--enable-pam-module --with-pam-module-dir=${base_libdir}/security,--disable-pam-module,libpam"
-# No option to turn it on or off, so rely on the build dependency for now.
-PACKAGECONFIG[policykit] = ",,polkit"
+PACKAGECONFIG[policykit] = "--with-polkit,--without-polkit,polkit"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--with-systemdsystemunitdir="
 
 FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
-- 
1.7.9.5


