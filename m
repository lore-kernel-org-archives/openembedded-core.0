Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E1805720C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 12:00:38 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 12 Nov 2014 13:00:34 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 2191028FE8B;
	Wed, 12 Nov 2014 13:00:34 +0100 (CET)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 13:00:12 +0100
Message-ID: <1415793612-12055-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] automake: set test-driver path relative to top_builddir
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
X-List-Received-Date: Wed, 12 Nov 2014 12:00:44 -0000
Content-Type: text/plain

automake offers auxiliary tools and is capable to install and prepare the setup for those.
test-driver, a log driver used by parallel testsuite harness in ptests, is one of those tools.
By default it looks that automake prepare environment for testing relative $top_srcdir.
But in Yocto following changed:
 - build folder was separated
 - $top_srcdir is not anymore defined as relative path, now can be relative or absolute

So now in Yocto the Makefile from src/tests contains absolute path of $top_srcdir for test-driver
which is an unexisting path at runtime.

We need to have relative path for test-driver in Makefile to work on target. $top_builddir
can guarantee this path.

Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
---
 .../automake/new_rt_path_for_test-driver.patch     | 34 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.14.1.bb  |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch

diff --git a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
new file mode 100644
index 0000000..c277619
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
@@ -0,0 +1,34 @@
+Set the path relative to $top_build for test-driver to be accesible at runtime
+
+Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
+
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -272,6 +272,9 @@
+ # $AM_CONFIG_AUX_DIR is prefixed with $(top_srcdir), so it can be used
+ # in Makefiles.
+ my $am_config_aux_dir = '';
++# Directory used at runtime like running test-driver that should not
++# depend on $(top_srcdir)
++my $am_config_rt_aux_dir = '';
+
+ # Directory to search for AC_LIBSOURCE files, as set by AC_CONFIG_LIBOBJ_DIR
+ # in configure.ac.
+@@ -4700,7 +4703,7 @@
+     {
+       require_conf_file ("parallel-tests", FOREIGN, 'test-driver');
+       define_variable ("${pfx}LOG_DRIVER",
+-                       "\$(SHELL) $am_config_aux_dir/test-driver",
++                       "\$(SHELL) $am_config_rt_aux_dir/test-driver",
+                        INTERNAL);
+     }
+   my $driver = '$(' . $pfx . 'LOG_DRIVER)';
+@@ -7284,6 +7287,10 @@
+   $am_config_aux_dir =
+     '$(top_srcdir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_dir");
+   $am_config_aux_dir =~ s,/*$,,;
++
++  $am_config_rt_aux_dir =
++    '$(top_builddir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_dir");
++  $am_config_rt_aux_dir =~ s,/*$,,;
+ }
diff --git a/meta/recipes-devtools/automake/automake_1.14.1.bb b/meta/recipes-devtools/automake/automake_1.14.1.bb
index be73d19..3a13a34 100644
--- a/meta/recipes-devtools/automake/automake_1.14.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.14.1.bb
@@ -20,7 +20,8 @@ RDEPENDS_${PN}_class-native = "autoconf-native perl-native-runtime"
 
 SRC_URI += " file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch \
-            file://buildtest.patch"
+            file://buildtest.patch \
+            file://new_rt_path_for_test-driver.patch"
 
 SRC_URI[md5sum] = "d052a3e884631b9c7892f2efce542d75"
 SRC_URI[sha256sum] = "814c2333f350ce00034a1fe718e0e4239998ceea7b0aff67e9fd273ed6dfc23b"
-- 
1.9.1


