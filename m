Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0663DC433F5
	for <webhook@archiver.kernel.org>; Sun,  2 Oct 2022 17:56:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.10092.1664733405723528848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Oct 2022 10:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PeopJnwY;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664733406;
  x=1696269406;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=97XUiP+8gXfvQNUIP0F4w21LB84zY0vcOFDrjn89i9Q=;
  b=PeopJnwY7hZQzx4BxKc1YqfMkKguTlFXpddwsKgNE6y6FTRnxUgPpdln
   U6MkPCd2qQ5D56Krxh5izwA2g95mo3Olkq51aeve9K72SxOgLDMH4h2EE
   ZnR/iON8qapycRXVRACRY9n+E5L16tqOFauyKmhciCO+LJtP25kUpVmJg
   KGYW6jtp3DgS7TpOxno8XBhIHznjbUrgFCmPCJIrV8Pr11GDbEVBE75rY
   bhW44PpTw5rQcyLRwh9OOI616q4hikUt0aUWZI+Sb602NSiu3eq+dL3rl
   R3dYeBoloML5SMGeewt0x+EVsNaW+xbrjSji9UuT1TF1bkJYRVpQqRvmV
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] base-passwd: Update to 3.6.1
Date: Sun, 2 Oct 2022 19:56:36 +0200
Message-ID: <20221002175636.3408245-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Oct 2022 17:56:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171355

Add a patch to support configuring whether SELinux is enabled or not.
Also add a PACKAGECONFIG for SELinux support and enable it if the
"selinux" distro feature is enabled.

Remove two patches that have been applied upstream.

Changes since 3.5.52:
* 5928e85: German (thanks, Helge Kreutzmann)
* 72cb6a6: Remove constraints unnecessary since buster
* 2f71444: Merge branch 'scrub-obsolete' into 'master'
* 5a578e7: Drop Build-Depends: dpkg
* 44f28e1: Apply wrap-and-sort -at
* 1fe0338: Upgrade to debhelper v13
* d77d38c: Simplify some debhelper overrides slightly
* 2143651: Implement SELinux awareness when updating
  /etc/{passwd,group,shadow}
* 0b824ad: improve enforcing handling
* e2f0c03: update-passwd.c: use raw selinux labeles
* 8d45264: selinux_prepare_create_file: return error from
  setfscreatecon_raw
* 2f23448: selinux_after_create_file: save errno
* 6953dd1: update-passwd.c: replace goto error handling
* 32fbf59: cleanup
* 3c3eb67: fixup goto
* 585126f: implement feedback
* 02a366b: users-and-groups: Update copyright years
* 7849c61: users-and-groups: Rename ssh group to _ssh
* 06ed6f4: update-passwd.c: set walk to walk->next before removing
* ef6baea: users-and-groups: Document libvirt group
* 68e02a3: Stop creating the gnats user and group on new installations
* cb6e2a9: Restore Build-Depends sorting
* 0e1afc1: Tidy up whitespace
* 6005a06: Merge branch 'selinux' into 'master'
* 24046cb: Bump version to 3.6.0
* c72aa5d: Make it possible to build without debconf support
* 2a6d16e: Make it possible to disable the generation of the
  documentation
* 60ece0c: Merge branch 'master' into 'master'
* 63d0f94: Add changelog entry
* cbae4a5: update-passwd: add format attribute
* b71eb04: update-passwd: use strict prototypes
* df48ea8: update-passwd: silence potential null dereference
* cddc9df: update-passwd: print filename on fclose error
* d05f8a3: update-passwd: use correct filename in copy_filemodes
* 11e6466: update-passwd: drop t flag from fopen
* 347aeb6: update-passwd: open temporary file exclusively
* a697493: d/salsa-ci.yml: add standard salsa ci configuration
* 2f622f4: configure: replace obsolete macro
* 43ebe64: Add changelog entry
* e1a186b: frozen the group id for crontab, in order to fix #1012622
* 5ce7773: frozen the group id for crontab, closes: #1012622
* 670c2be: Revert "frozen the group id for crontab, closes: #1012622"
* bc1ad19: Revert "Revert "frozen the group id for crontab, closes:
  #1012622""
* 12122c6: Revert "frozen the group id for crontab, in order to fix
  #1012622"
* 0145e8a: Revert "frozen the group id for crontab, closes: #1012622"
* c8125ff: releasing package base-passwd version 3.6.0
* dc157c6: passwd.master: Add _apt user
* e50024c: Merge branch 'misc' into 'master'
* 7fb5ad8: debian/postinst: Fix several shellcheck issues
* 8f07b66: releasing package base-passwd version 3.6.1

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ble-to-build-without-debconf-support.patch | 129 ------------------
 ...-to-configure-whether-to-use-SELinux.patch |  35 +++++
 ...-to-disable-the-generation-of-the-do.patch |  46 -------
 ...-passwd_3.5.52.bb => base-passwd_3.6.1.bb} |   8 +-
 4 files changed, 40 insertions(+), 178 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.52.bb => base-passwd_3.6.1.bb} (92%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
deleted file mode 100644
index 6e236993f5..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 236d6c8c0dd7e15d9a9795813b94bc87ce09eec5 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Date: Fri, 29 Apr 2022 19:32:29 +0200
-Subject: [PATCH] Make it possible to build without debconf support
-
-Not all systems have the debconfclient library available.
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/c72aa5dd25a952da25e307761f4526db2c8c39ec]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- Makefile.am     |  1 -
- configure.ac    | 13 +++++++++++++
- update-passwd.c | 15 +++++++++++++++
- 3 files changed, 28 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 223916f..4bdd769 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,7 +3,6 @@ SUBDIRS = doc man
- sbin_PROGRAMS = update-passwd
- 
- update_passwd_SOURCES = update-passwd.c
--update_passwd_LDADD = -ldebconfclient
- 
- pkgdata_DATA = passwd.master group.master
- 
-diff --git a/configure.ac b/configure.ac
-index 9d1ace5..1e35ad1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,6 +14,19 @@ AC_SYS_LARGEFILE
- dnl Scan for things we need
- AC_CHECK_FUNCS([putgrent])
- 
-+dnl Check for debconf
-+AC_MSG_CHECKING([whether to enable debconf support])
-+AC_ARG_ENABLE([debconf],
-+  [AS_HELP_STRING([--disable-debconf], [disable support for debconf])],
-+  [],
-+  [enable_debconf=yes])
-+AC_MSG_RESULT($enable_debconf)
-+AS_IF([test "x$enable_debconf" != xno],
-+  [AC_CHECK_LIB([debconfclient], [debconfclient_new], [],
-+    [AC_MSG_ERROR(
-+      [debconf support not available (use --disable-debconf to disable)])])
-+   AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])])
-+
- dnl Finally output everything
- AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
- AC_OUTPUT
-diff --git a/update-passwd.c b/update-passwd.c
-index 3f3dffa..5b49740 100644
---- a/update-passwd.c
-+++ b/update-passwd.c
-@@ -39,7 +39,9 @@
- #include <stdarg.h>
- #include <ctype.h>
- 
-+#ifdef HAVE_DEBCONF
- #include <cdebconf/debconfclient.h>
-+#endif
- 
- #define DEFAULT_PASSWD_MASTER	"/usr/share/base-passwd/passwd.master"
- #define DEFAULT_GROUP_MASTER	"/usr/share/base-passwd/group.master"
-@@ -143,6 +145,7 @@ int		flag_debconf	= 0;
- const char*	user_domain	= DEFAULT_DEBCONF_DOMAIN;
- const char*	group_domain	= DEFAULT_DEBCONF_DOMAIN;
- 
-+#ifdef HAVE_DEBCONF
- struct debconfclient*	debconf	= NULL;
- 
- /* Abort the program if talking to debconf fails.  Use ret exactly once. */
-@@ -162,6 +165,10 @@ struct debconfclient*	debconf	= NULL;
-     DEBCONF_CHECK(debconf_register(debconf, (template), (question)))
- #define DEBCONF_SUBST(question, var, value) \
-     DEBCONF_CHECK(debconf_subst(debconf, (question), (var), (value)))
-+#else
-+#define DEBCONF_REGISTER(template, question)
-+#define DEBCONF_SUBST(question, var, value)
-+#endif
- 
- 
- /* malloc() with out-of-memory checking.
-@@ -621,6 +628,7 @@ void version() {
-  * flag.  Aborts the problem on any failure.
-  */
- int ask_debconf(const char* priority, const char* question) {
-+#ifdef HAVE_DEBCONF
-     int		ret;
-     const char*	response;
- 
-@@ -640,6 +648,9 @@ int ask_debconf(const char* priority, const char* question) {
- 	return 1;
-     else
- 	return 0;
-+#else
-+	return 0;
-+#endif
- }
- 
- 
-@@ -1427,6 +1438,7 @@ int main(int argc, char** argv) {
-     /* If DEBIAN_HAS_FRONTEND is set in the environment, we're running under
-      * debconf.  Enable debconf prompting unless --dry-run was also given.
-      */
-+#ifdef HAVE_DEBCONF
-     if (getenv("DEBIAN_HAS_FRONTEND")!=NULL && !opt_dryrun) {
- 	debconf=debconfclient_new();
- 	if (debconf==NULL) {
-@@ -1435,6 +1447,7 @@ int main(int argc, char** argv) {
- 	}
- 	flag_debconf=1;
-     }
-+#endif
- 
-     if (read_passwd(&master_accounts, master_passwd)!=0)
- 	return 2;
-@@ -1480,8 +1493,10 @@ int main(int argc, char** argv) {
- 	if (!unlock_files())
- 	    return 5;
- 
-+#ifdef HAVE_DEBCONF
-     if (debconf!=NULL)
- 	debconfclient_delete(debconf);
-+#endif
- 
-     if (opt_dryrun)
- 	return flag_dirty;
diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
new file mode 100644
index 0000000000..2cc6174e2a
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
@@ -0,0 +1,35 @@
+From 25e3bf09bbbb04aa930ea0fd9f28809a24fb7194 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sun, 2 Oct 2022 17:47:29 +0200
+Subject: [PATCH] Make it possible to configure whether to use SELinux or not
+
+Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/396c41bb35e03c5dcc727aa9f74218a45874ac1f]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ configure.ac | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 589df88..e46403b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,7 +13,18 @@ AC_SYS_LARGEFILE
+ 
+ dnl Scan for things we need
+ AC_CHECK_FUNCS([putgrent])
+-AC_CHECK_LIB([selinux], [is_selinux_enabled])
++
++dnl Check for SELinux
++AC_MSG_CHECKING([whether to enable SELinux support])
++AC_ARG_ENABLE([selinux],
++  [AS_HELP_STRING([--disable-selinux], [disable support for SELinux])],
++  [],
++  [enable_selinux=yes])
++AC_MSG_RESULT($enable_selinux)
++AS_IF([test "x$enable_selinux" != xno],
++  [AC_CHECK_LIB([selinux], [is_selinux_enabled], [],
++    [AC_MSG_ERROR(
++      [SELinux support not available (use --disable-selinux to disable)])])])
+ 
+ dnl Check for debconf
+ AC_MSG_CHECKING([whether to enable debconf support])
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
deleted file mode 100644
index 5c63599143..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 63e8270141a296843cfe1daba38e1969ac6d75ae Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Date: Sat, 30 Apr 2022 00:35:34 +0200
-Subject: [PATCH] Make it possible to disable the generation of the
- documentation
-
-Not all systems have docbook and po4a available.
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/2a6d16e595c93084e279d0dcbef37d960b44fd1a]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- Makefile.am  | 2 ++
- configure.ac | 9 +++++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 4bdd769..97b4f42 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,6 @@
-+if ENABLE_DOCS
- SUBDIRS = doc man
-+endif
- 
- sbin_PROGRAMS = update-passwd
- 
-diff --git a/configure.ac b/configure.ac
-index 1e35ad1..b98374e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,6 +27,15 @@ AS_IF([test "x$enable_debconf" != xno],
-       [debconf support not available (use --disable-debconf to disable)])])
-    AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])])
- 
-+dnl Check whether to build the documentation 
-+AC_MSG_CHECKING([whether to build the documentation])
-+AC_ARG_ENABLE([docs],
-+  [AC_HELP_STRING([--disable-docs], [do not build and install documentation])],
-+  [],
-+  [enable_docs=yes])
-+AC_MSG_RESULT($enable_docs)
-+AM_CONDITIONAL(ENABLE_DOCS, test "x$enable_docs" = xyes)
-+
- dnl Finally output everything
- AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
- AC_OUTPUT
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
similarity index 92%
rename from meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
index f89752c077..853717176d 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
@@ -11,11 +11,10 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch \
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
            file://0005-Add-kvm-group.patch \
-           file://0006-Make-it-possible-to-build-without-debconf-support.patch \
-           file://0007-Make-it-possible-to-disable-the-generation-of-the-do.patch \
+           file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
            "
 
-SRC_URI[sha256sum] = "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31a3d6317f95ccea"
+SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
@@ -23,6 +22,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
 
 S = "${WORKDIR}/work"
 
+PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[selinux] = "--enable-selinux, --disable-selinux, libselinux"
+
 inherit autotools
 
 EXTRA_OECONF += "--disable-debconf --disable-docs"

