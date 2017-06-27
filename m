Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC7571C0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 21:24:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5RLOvFV007104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Jun 2017 22:24:58 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dPxyj-0006Iq-Ob; Tue, 27 Jun 2017 22:24:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 22:24:56 +0100
Message-Id: <1498598696-24190-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 27 Jun 2017 22:24:58 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
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
X-List-Received-Date: Tue, 27 Jun 2017 21:25:01 -0000

Allow the tests to be explicitly disabled to avoid floating dependnecy
issues. This is not really an issue with RSS but is on previous releases.
Currently the tests are enabled/disabled depending on the presence of
glib-2.0.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gtk-doc/files/conditionaltests.patch           | 34 ++++++++++++++++++++++
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb         |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk-doc/files/conditionaltests.patch

diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
new file mode 100644
index 0000000..0c180f2
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -0,0 +1,34 @@
+Allow the tests to be explicitly disabled to avoid floating dependnecy
+issues. This is not really an issue with RSS but is on previous releases.
+
+RP 2017/6/27
+Upstream-Status: Pending
+
+Index: gtk-doc-1.25/configure.ac
+===================================================================
+--- gtk-doc-1.25.orig/configure.ac
++++ gtk-doc-1.25/configure.ac
+@@ -161,6 +161,11 @@ if test "x$GCC" = "xyes"; then
+ 	fi
+ fi
+ 
++AC_ARG_ENABLE([tests],
++	AS_HELP_STRING([--enable-tests],
++	[enable tests (default=yes)]),,
++	[enable_tests="yes"])
++
+ dnl if glib is available we can enable the tests
+ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
+ 	[	glib_prefix="`$PKG_CONFIG --variable=prefix glib-2.0`"
+@@ -171,6 +176,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >
+ 		build_tests="no"
+ 	]
+ )
++if test "x$enable_tests" != "xyes"; then
++	gtk_doc_use_libtool="no"
++	build_tests="no"
++fi
++
+ AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL" -a x$gtk_doc_use_libtool = xyes )
+ dnl this enable the rule in test/Makefile.am
+ AM_CONDITIONAL(BUILD_TESTS, test x$build_tests = xyes)
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
index 7de36ae9..e0eb994 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
@@ -16,6 +16,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 # hopefully no one minds because its scripts are not used for anything during build
 # and shouldn't be used on targets.
 PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native perl-native"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
 # We cannot use host perl, because it may be too old for gtk-doc
 EXTRANATIVEPATH += "perl-native"
@@ -23,6 +24,7 @@ EXTRANATIVEPATH += "perl-native"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
             file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
             file://0001-Do-not-error-out-if-perl-is-not-found-or-its-version.patch \
+            file://conditionaltests.patch \
            "
 SRC_URI_append_class-native = " file://pkg-config-native.patch"
 
-- 
2.7.4


