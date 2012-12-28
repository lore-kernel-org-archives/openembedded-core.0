Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TohvL-0007NF-If
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:03 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id DF9C02FEF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:02 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:36 -0800
Message-Id: <b955f1a7bc716055c78ed575eccac6f611dc2395.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: DF9C02FEF1.B08A0
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 03/15] gettext, m4, augeas, gnutls: Account for removal of gets in eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2012 21:57:03 -0000

From: Khem Raj <raj.khem@gmail.com>

These recipes use gnulib which needs this change to use gets
when its defined and not otherwise. Until that change goes into
gnulib and then all these package upgrade gnulib in their sourcebase
we patch them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Resolved merge conflicts with denzil branch and backported gnutls
patch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 ++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 meta/recipes-devtools/m4/m4-1.4.16.inc             |    6 +-
 meta/recipes-devtools/m4/m4/remove-gets.patch      |   21 +++++++
 .../augeas/augeas/remove-gets.patch                |   20 +++++++
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    4 +-
 .../gnutls/gnutls/remove-gets.patch                |   42 ++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.17.bb      |    3 +-
 8 files changed, 152 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
 create mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
new file mode 100644
index 0000000..3d3c400
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
@@ -0,0 +1,58 @@
+eglibc 2.16 has removed gets so we need to check for it
+being there before using it.
+
+
+From glibc stdio.h
+
+The function has been officially removed in ISO C11.  This opportunity
+   is used to also remove it from the GNU feature list.  It is now only
+   available when explicitly using an old ISO C, Unix, or POSIX standard.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h
+===================================================================
+--- gettext-0.18.1.1.orig/gettext-runtime/gnulib-lib/stdio.in.h	2010-05-17 12:56:12.000000000 -0700
++++ gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h	2012-07-02 22:42:21.292223316 -0700
+@@ -140,8 +140,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
+Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h
+===================================================================
+--- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/stdio.in.h	2010-05-24 02:42:46.000000000 -0700
++++ gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h	2012-07-02 23:02:33.476281979 -0700
+@@ -140,8 +140,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
+Index: gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h
+===================================================================
+--- gettext-0.18.1.1.orig/gettext-tools/libgettextpo/stdio.in.h	2010-05-17 12:58:03.000000000 -0700
++++ gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h	2012-07-02 23:01:57.440280253 -0700
+@@ -140,8 +140,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 1e67afb..16ea010 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r12"
+PR = "r13"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -13,6 +13,7 @@ PROVIDES_virtclass-native = "virtual/gettext-native"
 CONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
+	   file://remove_gets.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
diff --git a/meta/recipes-devtools/m4/m4-1.4.16.inc b/meta/recipes-devtools/m4/m4-1.4.16.inc
index 139193c..bb82a3b 100644
--- a/meta/recipes-devtools/m4/m4-1.4.16.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.16.inc
@@ -5,8 +5,10 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 	            file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
 
-PR = "r2"
-SRC_URI += "file://ac_config_links.patch"
+PR = "r3"
+SRC_URI += "file://ac_config_links.patch \
+            file://remove-gets.patch \
+           "
 
 SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
 SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
diff --git a/meta/recipes-devtools/m4/m4/remove-gets.patch b/meta/recipes-devtools/m4/m4/remove-gets.patch
new file mode 100644
index 0000000..9c396d9
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/remove-gets.patch
@@ -0,0 +1,21 @@
+eglibc has remove gets starting 2.16
+therefore check for its being there before 
+undefining it.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: m4-1.4.16/lib/stdio.in.h
+===================================================================
+--- m4-1.4.16.orig/lib/stdio.in.h	2011-03-01 08:39:29.000000000 -0800
++++ m4-1.4.16/lib/stdio.in.h	2012-07-03 08:32:08.145935928 -0700
+@@ -161,8 +161,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-extended/augeas/augeas/remove-gets.patch b/meta/recipes-extended/augeas/augeas/remove-gets.patch
new file mode 100644
index 0000000..bd6e92c
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas/remove-gets.patch
@@ -0,0 +1,20 @@
+eglibc 2.16 has remove gets so check for it to be there before using it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: augeas-0.10.0/gnulib/lib/stdio.in.h
+===================================================================
+--- augeas-0.10.0.orig/gnulib/lib/stdio.in.h	2011-03-03 17:07:59.000000000 -0800
++++ augeas-0.10.0/gnulib/lib/stdio.in.h	2012-07-03 19:46:42.871894833 -0700
+@@ -161,8 +161,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes-extended/augeas/augeas_0.10.0.bb
index 00921aa..06ef494 100644
--- a/meta/recipes-extended/augeas/augeas_0.10.0.bb
+++ b/meta/recipes-extended/augeas/augeas_0.10.0.bb
@@ -1,6 +1,8 @@
 require augeas.inc
 
-PR = "r1"
+PR = "r2"
+SRC_URI += "file://remove-gets.patch \
+           "
 
 SRC_URI[md5sum] = "fe1834e90a066c3208ac0214622c7352"
 SRC_URI[sha256sum] = "ec111af06186216930176ebe5ecccdf7bf528528aee9acde1d5d70088484afca"
diff --git a/meta/recipes-support/gnutls/gnutls/remove-gets.patch b/meta/recipes-support/gnutls/gnutls/remove-gets.patch
new file mode 100644
index 0000000..d694a3d
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/remove-gets.patch
@@ -0,0 +1,42 @@
+eglibc 2.16 has removed gets completely
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Backported to gnutls 2.12.17 by Scott Garman <scott.a.garman@intel.com>
+
+Upstream-Status: Pending
+
+diff -urN gnutls-2.12.17.orig/gl/stdio.in.h gnutls-2.12.17/gl/stdio.in.h
+--- gnutls-2.12.17.orig/gl/stdio.in.h	2012-03-01 07:47:48.000000000 -0800
++++ gnutls-2.12.17/gl/stdio.in.h	2012-12-12 20:27:54.833297791 -0800
+@@ -710,11 +710,13 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
+diff -urN gnutls-2.12.17.orig/lib/gl/stdio.in.h gnutls-2.12.17/lib/gl/stdio.in.h
+--- gnutls-2.12.17.orig/lib/gl/stdio.in.h	2012-03-01 07:53:13.000000000 -0800
++++ gnutls-2.12.17/lib/gl/stdio.in.h	2012-12-12 20:29:09.669295717 -0800
+@@ -710,11 +710,13 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.17.bb b/meta/recipes-support/gnutls/gnutls_2.12.17.bb
index 7a33ec2..ebcbea3 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.17.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.17.bb
@@ -1,10 +1,11 @@
 require gnutls.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.2"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
+            file://remove-gets.patch \
            "
 
 SRC_URI[md5sum] = "f08990f1afa4e1d0ee13e64e537c7854"
-- 
1.7.9.5



