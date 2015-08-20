Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 27F1F73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 02:22:44 +0000 (UTC)
Received: by igui7 with SMTP id i7so4044391igu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 19:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+vw8A1E0NA1YDu1q+nppg7PrKpf8fg+PoWsnrsIP78Q=;
	b=wM61q43eMKTfvMQFkqkAeV+IuCaD4pxtOXSSVLqXF4SSUfywQ5eKn61fC6Aa3Xm+3C
	URF98I4cgzUnJYZmzchJ/IuWl+rPIAg/aNN4geA25jINjhTn0OQF10EGaTcqhEkeLZjl
	C2aUtDjCX8ntN90wT/EhiFh7NOdDvcUcUA/MRH21pmiel+Lhcx4C1hQdTrp/lt156iOT
	YMJ29P0lqUXW0sHk2w3TIun8Lv43OVydSDIhjVy24w3Gmvh2opX1fecJuAZTyqw6L8In
	w8aYrIJwOi3GJwFN85Sbh7pjUBfdgFMu67tvHbLFEqQuXuJizWQiQGnX54/aPJa7bnG0
	XIxQ==
X-Received: by 10.50.122.73 with SMTP id lq9mr5090204igb.68.1440037364535;
	Wed, 19 Aug 2015 19:22:44 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id c79sm2251287iod.9.2015.08.19.19.22.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 19:22:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 19:22:36 -0700
Message-Id: <1440037356-937-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Thu, 20 Aug 2015 02:22:48 -0000

MIT licence was unused and dropped in source itself

commit 8f1e0c5f38cdf7e401ab4d2bb93ad816d08e7715
Author: Kay Sievers <kay@vrfy.org>
Date: Tue Apr 21 19:21:56 2015 +0200

delete unused LICENSE.MIT

libudev API documentation has been converted from gtkdoc into man pages.

see

commit 2375607039517c88df51ef16ddbb624ec1c10654
Author: Kay Sievers <kay@vrfy.org>
Date: Wed Jun 3 00:09:23 2015 +0200

remove gudev and gtk-doc

The library moved to:
https://git.gnome.org/browse/libgudev/

package newly added xorg information

commit 1401ec2d34bcde406ced531a72dc46ebaf332594
Author: Kay Sievers <kay@vrfy.org>
Date:   Fri Jan 9 21:23:48 2015 +0100

    push xorg information to the systemd --user instance

There are many reasons, for me its overlay support for systemd-nspawn,
networkd has got many new features that is now usable w.r.t. IP
forwarding, vxlan etc.
and it has many bug fixed in those 2000 odd commits since 219

Change-Id: I998e652382950a3c74c4839f3767ef8bef23d88f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-mount-add-dependencies-to-dynamically-mo.patch |  36 ----
 ...ed-missing.h-fall-back-to-insecure-getenv.patch |  25 ---
 ...t-install-dependency-links-at-install-tim.patch |  35 ++--
 ...heck-for-additional-features-that-uclibc-.patch |  23 ++-
 ...wn-Use-execvpe-only-when-libc-supports-it.patch |  37 ++---
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |   8 +-
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |   8 +-
 ...0-Make-root-s-home-directory-configurable.patch | 136 ++++++++-------
 ...files.c-Honor-ordering-within-files-as-th.patch | 185 ---------------------
 ...-remove-userspace-firmware-loading-suppor.patch |  99 ++++++-----
 .../systemd/systemd/tmpfiles-pam.patch             |  30 ----
 .../systemd/{systemd_219.bb => systemd_224.bb}     |  25 +--
 12 files changed, 174 insertions(+), 473 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
 rename meta/recipes-core/systemd/{systemd_219.bb => systemd_224.bb} (95%)

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch b/meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
deleted file mode 100644
index d69cfe0..0000000
--- a/meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From eb7a760052667c5a35637901de9359c377263804 Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Tue, 24 Feb 2015 10:12:28 -0500
-Subject: [PATCH] Revert "core/mount: add dependencies to dynamically mounted
- mounts too"
-
-This reverts commit 06e97888883e2cc12eb6514e80c7f0014295f59b.
-
-This patch was imported from Fedora (http://pkgs.fedoraproject.org/cgit/systemd.git/commit/?h=f22&id=9bbe0e92dc59d5a42258c729b105a7d9901eb35e).
-
-It fixes an issue where mount points not listed in fstab are immediately
-unmounted after a call to mount.
-
-Upstream-Status: Inappropriate [fixed upstream]
-
-Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
----
- src/core/mount.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/mount.c b/src/core/mount.c
-index 40037e7..cddb5e2 100644
---- a/src/core/mount.c
-+++ b/src/core/mount.c
-@@ -295,7 +295,7 @@ static int mount_add_device_links(Mount *m) {
- 
-         assert(m);
- 
--        p = get_mount_parameters(m);
-+        p = get_mount_parameters_fragment(m);
-         if (!p)
-                 return 0;
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch b/meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
deleted file mode 100644
index 1cf7840..0000000
--- a/meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 03baade6db2cf83b44a157818ba827d725449bb0 Mon Sep 17 00:00:00 2001
-From: Emil Renner Berthing <systemd@esmil.dk>
-Date: Thu, 18 Sep 2014 15:24:47 +0200
-Subject: [PATCH 02/11] shared/missing.h: fall back to insecure getenv
-
----
- src/shared/missing.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index b33a70c..11cca04 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -366,7 +366,7 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
- #  ifdef HAVE___SECURE_GETENV
- #    define secure_getenv __secure_getenv
- #  else
--#    error "neither secure_getenv nor __secure_getenv are available"
-+#    define secure_getenv getenv
- #  endif
- #endif
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index c14cc6f..0e20fd0 100644
--- a/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -23,11 +23,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  units/systemd-binfmt.service.in         | 5 +++++
  3 files changed, 8 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index ba63f68..0fb3f9f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4838,10 +4838,6 @@ INSTALL_DIRS += \
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -4271,10 +4271,6 @@ INSTALL_DIRS += \
  	$(prefix)/lib/binfmt.d \
  	$(sysconfdir)/binfmt.d
  
@@ -38,10 +38,10 @@ index ba63f68..0fb3f9f 100644
  endif
  
  EXTRA_DIST += \
-diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 6be3893..709adef 100644
---- a/units/proc-sys-fs-binfmt_misc.automount
-+++ b/units/proc-sys-fs-binfmt_misc.automount
+Index: git/units/proc-sys-fs-binfmt_misc.automount
+===================================================================
+--- git.orig/units/proc-sys-fs-binfmt_misc.automount
++++ git/units/proc-sys-fs-binfmt_misc.automount
 @@ -16,3 +16,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
@@ -49,11 +49,11 @@ index 6be3893..709adef 100644
 +
 +[Install]
 +WantedBy=sysinit.target
-diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index 34a5d52..617462b 100644
---- a/units/systemd-binfmt.service.in
-+++ b/units/systemd-binfmt.service.in
-@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
+Index: git/units/systemd-binfmt.service.in
+===================================================================
+--- git.orig/units/systemd-binfmt.service.in
++++ git/units/systemd-binfmt.service.in
+@@ -11,6 +11,8 @@ Documentation=man:systemd-binfmt.service
  Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
  DefaultDependencies=no
  Conflicts=shutdown.target
@@ -62,13 +62,10 @@ index 34a5d52..617462b 100644
  After=proc-sys-fs-binfmt_misc.automount
  Before=sysinit.target shutdown.target
  ConditionPathIsReadWrite=/proc/sys/
-@@ -24,3 +26,6 @@ ConditionDirectoryNotEmpty=|/run/binfmt.d
- Type=oneshot
+@@ -25,3 +27,6 @@ Type=oneshot
  RemainAfterExit=yes
  ExecStart=@rootlibexecdir@/systemd-binfmt
+ TimeoutSec=90s
 +
 +[Install]
 +WantedBy=sysinit.target
--- 
-2.1.4
-
diff --git a/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch b/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
index dddb7da..8078da9 100644
--- a/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
+++ b/meta/recipes-core/systemd/systemd/0004-configure-Check-for-additional-features-that-uclibc-.patch
@@ -14,13 +14,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index 9a2235b..a5b2e6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -103,6 +103,24 @@ AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't s
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -110,6 +110,24 @@ AC_PATH_PROG([UMOUNT_PATH], [umount], [/
  
- M4_DEFINES=
+ AS_IF([! ln --relative --help > /dev/null 2>&1], [AC_MSG_ERROR([*** ln doesn't support --relative ***])])
  
 +# check for few functions not implemented in uClibc
 +
@@ -31,7 +31,7 @@ index 9a2235b..a5b2e6e 100644
 +AC_MSG_CHECKING([whether %ms format is supported by *scanf])
 +
 +AC_LINK_IFELSE(
-+	[AC_LANG_PROGRAM([ 
++	[AC_LANG_PROGRAM([
 +	 #include <stdio.h>
 +	 ],[
 +	    char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
@@ -40,9 +40,6 @@ index 9a2235b..a5b2e6e 100644
 +	[AC_DEFINE([HAVE_MSFORMAT], [1], [Define if %ms format is supported by *scanf.])],
 +	[AC_MSG_RESULT([no])])
 +
- # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
- m4_ifdef([GTK_DOC_CHECK], [
- GTK_DOC_CHECK([1.18],[--flavour no-tmpl])],
--- 
-2.1.4
-
+ M4_DEFINES=
+ 
+ AC_CHECK_TOOL(OBJCOPY, objcopy)
diff --git a/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
index 85279d6..55a0088 100644
--- a/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
+++ b/meta/recipes-core/systemd/systemd/0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch
@@ -10,32 +10,29 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/nspawn/nspawn.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 0d8d199..b597edb 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -129,6 +129,8 @@ typedef enum Volatile {
-         VOLATILE_STATE,
- } Volatile;
+Index: git/src/nspawn/nspawn.c
+===================================================================
+--- git.orig/src/nspawn/nspawn.c
++++ git/src/nspawn/nspawn.c
+@@ -143,6 +143,8 @@ typedef struct CustomMount {
+         char **lower;
+ } CustomMount;
  
 +#include "config.h"
 +
  static char *arg_directory = NULL;
  static char *arg_template = NULL;
  static char *arg_user = NULL;
-@@ -4257,7 +4259,12 @@ int main(int argc, char *argv[]) {
-                                 a[0] = (char*) "/sbin/init";
-                                 execve(a[0], a, env_use);
-                         } else if (argc > optind)
+@@ -4238,7 +4240,12 @@ static int inner_child(
+                 a[0] = (char*) "/sbin/init";
+                 execve(a[0], a, env_use);
+         } else if (argc > optind)
 +#ifdef HAVE_EXECVPE
-                                 execvpe(argv[optind], argv + optind, env_use);
+                 execvpe(argv[optind], argv + optind, env_use);
 +#else
-+                                environ = env_use;
-+                                execvp(argv[optind], argv + optind);
++                environ = env_use;
++                execvp(argv[optind], argv + optind);
 +#endif /* HAVE_EXECVPE */
-                         else {
-                                 chdir(home ? home : "/root");
-                                 execle("/bin/bash", "-bash", NULL, env_use);
--- 
-2.1.4
-
+         else {
+                 chdir(home ? home : "/root");
+                 execle("/bin/bash", "-bash", NULL, env_use);
diff --git a/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch b/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
index 29c20c0..b8ab7c4 100644
--- a/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
+++ b/meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
@@ -7,13 +7,13 @@ Upstream-Status: Denied [no desire for uclibc support]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/shared/util.c | 8 ++++++++
+ src/basic/util.c | 8 ++++++++
  1 file changed, 8 insertions(+)
 
-diff --git a/src/shared/util.c b/src/shared/util.c
+diff --git a/src/basic/util.c b/src/basic/util.c
 index dc65280..72f4665 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
+--- a/src/basic/util.c
++++ b/src/basic/util.c
 @@ -97,6 +97,8 @@
  #include "def.h"
  #include "sparse-endian.h"
diff --git a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch b/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
index 5297625..3f4d4de 100644
--- a/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
+++ b/meta/recipes-core/systemd/systemd/0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch
@@ -8,13 +8,13 @@ Upstream-Status: Inappropriate [uclibc-specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/shared/util.c | 15 +++++++++++++++
+ src/basic/util.c | 15 +++++++++++++++
  1 file changed, 15 insertions(+)
 
-diff --git a/src/shared/util.c b/src/shared/util.c
+diff --git a/src/basic/util.c b/src/basic/util.c
 index 72f4665..cbbe3b1 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
+--- a/src/basic/util.c
++++ b/src/basic/util.c
 @@ -6793,10 +6793,25 @@ uint64_t physical_memory(void) {
          /* We return this as uint64_t in case we are running as 32bit
           * process on a 64bit kernel with huge amounts of memory */
diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
index 76a9481..ed7ff5b 100644
--- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
@@ -19,26 +19,25 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac                      | 7 +++++++
  src/core/unit-printf.c            | 2 +-
  src/nspawn/nspawn.c               | 4 ++--
- src/shared/util.c                 | 4 ++--
+ src/basic/util.c                 | 4 ++--
  units/console-shell.service.m4.in | 4 ++--
  units/emergency.service.in        | 4 ++--
  units/rescue.service.in           | 4 ++--
  8 files changed, 20 insertions(+), 11 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index 0fb3f9f..4623963 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -199,7 +199,8 @@ AM_CPPFLAGS = \
- 	-DKEXEC=\"$(KEXEC)\" \
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -208,6 +208,7 @@ AM_CPPFLAGS = \
  	-DLIBDIR=\"$(libdir)\" \
  	-DROOTLIBDIR=\"$(rootlibdir)\" \
  	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
 +	-DROOTHOMEDIR=\"$(roothomedir)\" \
  	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
  	-I $(top_srcdir)/src \
- 	-I $(top_builddir)/src/shared \
-@@ -6342,6 +6343,7 @@ EXTRA_DIST += \
+ 	-I $(top_builddir)/src/basic \
+@@ -5615,6 +5616,7 @@ EXTRA_DIST += \
  substitutions = \
         '|rootlibexecdir=$(rootlibexecdir)|' \
         '|rootbindir=$(rootbindir)|' \
@@ -46,13 +45,13 @@ index 0fb3f9f..4623963 100644
         '|bindir=$(bindir)|' \
         '|SYSTEMCTL=$(rootbindir)/systemctl|' \
         '|SYSTEMD_NOTIFY=$(rootbindir)/systemd-notify|' \
-diff --git a/configure.ac b/configure.ac
-index a5b2e6e..55bb7d8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1428,6 +1428,11 @@ AC_ARG_WITH([rootlibdir],
-         [],
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -1383,6 +1383,11 @@ AC_ARG_WITH([rootlibdir],
          [with_rootlibdir=${libdir}])
+ AX_NORMALIZE_PATH([with_rootlibdir])
  
 +AC_ARG_WITH([roothomedir],
 +        AS_HELP_STRING([--with-roothomedir=DIR], [Home directory for the root user]),
@@ -62,62 +61,62 @@ index a5b2e6e..55bb7d8 100644
  AC_ARG_WITH([pamlibdir],
          AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
          [],
-@@ -1518,6 +1523,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
+@@ -1474,6 +1479,7 @@ AC_SUBST([pamlibdir], [$with_pamlibdir])
  AC_SUBST([pamconfdir], [$with_pamconfdir])
  AC_SUBST([rootprefix], [$with_rootprefix])
  AC_SUBST([rootlibdir], [$with_rootlibdir])
 +AC_SUBST([roothomedir], [$with_roothomedir])
  
  AC_CONFIG_FILES([
-         Makefile po/Makefile.in
-@@ -1617,6 +1623,7 @@ AC_MSG_RESULT([
-         include_prefix:          ${INCLUDE_PREFIX}
+         Makefile
+@@ -1563,6 +1569,7 @@ AC_MSG_RESULT([
+         includedir:              ${includedir}
          lib dir:                 ${libdir}
          rootlib dir:             ${with_rootlibdir}
 +        root home dir:           ${with_roothomedir}
          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-diff --git a/src/core/unit-printf.c b/src/core/unit-printf.c
-index 97135db..14d12f1 100644
---- a/src/core/unit-printf.c
-+++ b/src/core/unit-printf.c
-@@ -259,7 +259,7 @@ static int specifier_user_home(char specifier, void *data, void *userdata, char
+Index: git/src/core/unit-printf.c
+===================================================================
+--- git.orig/src/core/unit-printf.c
++++ git/src/core/unit-printf.c
+@@ -237,7 +237,7 @@ static int specifier_user_home(char spec
                   * best of it if we can, but fail if we can't */
  
                  if (!c->user || streq(c->user, "root") || streq(c->user, "0"))
 -                        n = strdup("/root");
 +                        n = strdup(ROOTHOMEDIR);
                  else
-                         return -ENOTSUP;
+                         return -EOPNOTSUPP;
  
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index b597edb..0b32673 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -4192,7 +4192,7 @@ int main(int argc, char *argv[]) {
-                         if (r < 0)
-                                 _exit(EXIT_FAILURE);
+Index: git/src/nspawn/nspawn.c
+===================================================================
+--- git.orig/src/nspawn/nspawn.c
++++ git/src/nspawn/nspawn.c
+@@ -4176,7 +4176,7 @@ static int inner_child(
+         if (envp[n_env])
+                 n_env ++;
  
--                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
-+                        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
-                             (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
-                             (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0)) {
-                                 log_oom();
-@@ -4266,7 +4266,7 @@ int main(int argc, char *argv[]) {
-                                 execvp(argv[optind], argv + optind);
+-        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: "/root") < 0) ||
++        if ((asprintf((char**)(envp + n_env++), "HOME=%s", home ? home: ROOTHOMEDIR) < 0) ||
+             (asprintf((char**)(envp + n_env++), "USER=%s", arg_user ? arg_user : "root") < 0) ||
+             (asprintf((char**)(envp + n_env++), "LOGNAME=%s", arg_user ? arg_user : "root") < 0))
+                 return log_oom();
+@@ -4247,7 +4247,7 @@ static int inner_child(
+                 execvp(argv[optind], argv + optind);
  #endif /* HAVE_EXECVPE */
-                         else {
--                                chdir(home ? home : "/root");
-+                                chdir(home ? home : ROOTHOMEDIR);
-                                 execle("/bin/bash", "-bash", NULL, env_use);
-                                 execle("/bin/sh", "-sh", NULL, env_use);
-                         }
-diff --git a/src/shared/util.c b/src/shared/util.c
-index cbbe3b1..a0e3cc5 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
-@@ -4609,7 +4609,7 @@ int get_user_creds(
+         else {
+-                chdir(home ? home : "/root");
++                chdir(home ? home : ROOTHOMEDIR);
+                 execle("/bin/bash", "-bash", NULL, env_use);
+                 execle("/bin/sh", "-sh", NULL, env_use);
+         }
+Index: git/src/basic/util.c
+===================================================================
+--- git.orig/src/basic/util.c
++++ git/src/basic/util.c
+@@ -3233,7 +3233,7 @@ int get_user_creds(
                          *gid = 0;
  
                  if (home)
@@ -126,7 +125,7 @@ index cbbe3b1..a0e3cc5 100644
  
                  if (shell)
                          *shell = "/bin/sh";
-@@ -5611,7 +5611,7 @@ int get_home_dir(char **_h) {
+@@ -4069,7 +4069,7 @@ int get_home_dir(char **_h) {
          /* Hardcode home directory for root to avoid NSS */
          u = getuid();
          if (u == 0) {
@@ -135,10 +134,10 @@ index cbbe3b1..a0e3cc5 100644
                  if (!h)
                          return -ENOMEM;
  
-diff --git a/units/console-shell.service.m4.in b/units/console-shell.service.m4.in
-index 5c80722..efde5f0 100644
---- a/units/console-shell.service.m4.in
-+++ b/units/console-shell.service.m4.in
+Index: git/units/console-shell.service.m4.in
+===================================================================
+--- git.orig/units/console-shell.service.m4.in
++++ git/units/console-shell.service.m4.in
 @@ -15,8 +15,8 @@ After=rc-local.service
  Before=getty.target
  
@@ -150,10 +149,10 @@ index 5c80722..efde5f0 100644
  ExecStart=-@SULOGIN@
  ExecStopPost=-@SYSTEMCTL@ poweroff
  Type=idle
-diff --git a/units/emergency.service.in b/units/emergency.service.in
-index 2695d7b..7f47b73 100644
---- a/units/emergency.service.in
-+++ b/units/emergency.service.in
+Index: git/units/emergency.service.in
+===================================================================
+--- git.orig/units/emergency.service.in
++++ git/units/emergency.service.in
 @@ -14,8 +14,8 @@ Conflicts=rescue.service
  Before=shutdown.target
  
@@ -162,14 +161,14 @@ index 2695d7b..7f47b73 100644
 -WorkingDirectory=/root
 +Environment=HOME=@roothomedir@
 +WorkingDirectory=@roothomedir@
- ExecStartPre=-/bin/plymouth quit
+ ExecStartPre=-/bin/plymouth --wait quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\ntry again to boot into default mode.'
- ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
-diff --git a/units/rescue.service.in b/units/rescue.service.in
-index de73fee..47f3593 100644
---- a/units/rescue.service.in
-+++ b/units/rescue.service.in
-@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.service
+ ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
+Index: git/units/rescue.service.in
+===================================================================
+--- git.orig/units/rescue.service.in
++++ git/units/rescue.service.in
+@@ -14,8 +14,8 @@ After=sysinit.target plymouth-start.serv
  Before=shutdown.target
  
  [Service]
@@ -179,7 +178,4 @@ index de73fee..47f3593 100644
 +WorkingDirectory=@roothomedir@
  ExecStartPre=-/bin/plymouth quit
  ExecStartPre=-/bin/echo -e 'Welcome to emergency mode! After logging in, type "journalctl -xb" to view\\nsystem logs, "systemctl reboot" to reboot, "systemctl default" or ^D to\\nboot into default mode.'
- ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --fail --no-block default"
--- 
-2.1.4
-
+ ExecStart=-/bin/sh -c "@SULOGIN@; @SYSTEMCTL@ --job-mode=fail --no-block default"
diff --git a/meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch b/meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
deleted file mode 100644
index ccd6757..0000000
--- a/meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-From 2abf886295b979bce6d3f0a240f6f5ecfd70ba37 Mon Sep 17 00:00:00 2001
-From: Randy Witt <randy.e.witt@linux.intel.com>
-Date: Wed, 4 Mar 2015 18:32:40 -0800
-Subject: [PATCH] tmpfiles.c: Honor ordering within files as the docs say.
-
-Previously, globs would always get processed first followed by any other
-items in arbitrary order. This is contrary to the documentation which
-states "Otherwise, the files/directories are processed in the order they
-are listed."
-
-To fix this, remove the separate "globs" hashmap, and instead use only one
-marking each entry as a glob or not. There should be little overhead
-from doing this, considering the only time nested processing will occur
-is for processing of globs which are not of type "X".
-
-Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
----
- src/tmpfiles/tmpfiles.c | 53 ++++++++++++++++++++++---------------------------
- 1 file changed, 24 insertions(+), 29 deletions(-)
-
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 917bb3c..0b6d226 100644
---- a/src/tmpfiles/tmpfiles.c
-+++ b/src/tmpfiles/tmpfiles.c
-@@ -116,6 +116,7 @@ typedef struct Item {
-         bool force:1;
- 
-         bool done:1;
-+        bool glob:1;
- } Item;
- 
- typedef struct ItemArray {
-@@ -137,7 +138,7 @@ static const char conf_file_dirs[] = CONF_DIRS_NULSTR("tmpfiles");
- 
- #define MAX_DEPTH 256
- 
--static Hashmap *items = NULL, *globs = NULL;
-+static OrderedHashmap *items = NULL;
- static Set *unix_sockets = NULL;
- 
- static bool needs_glob(ItemType t) {
-@@ -176,17 +177,17 @@ static bool takes_ownership(ItemType t) {
-                       RECURSIVE_REMOVE_PATH);
- }
- 
--static struct Item* find_glob(Hashmap *h, const char *match) {
-+static struct Item* find_glob(OrderedHashmap *h, const char *match) {
-         ItemArray *j;
-         Iterator i;
- 
--        HASHMAP_FOREACH(j, h, i) {
-+        ORDERED_HASHMAP_FOREACH(j, h, i) {
-                 unsigned n;
- 
-                 for (n = 0; n < j->count; n++) {
-                         Item *item = j->items + n;
- 
--                        if (fnmatch(item->path, match, FNM_PATHNAME|FNM_PERIOD) == 0)
-+                        if (item->glob && fnmatch(item->path, match, FNM_PATHNAME|FNM_PERIOD) == 0)
-                                 return item;
-                 }
-         }
-@@ -391,12 +392,12 @@ static int dir_cleanup(
-                 }
- 
-                 /* Is there an item configured for this path? */
--                if (hashmap_get(items, sub_path)) {
-+                if (ordered_hashmap_get(items, sub_path)) {
-                         log_debug("Ignoring \"%s\": a separate entry exists.", sub_path);
-                         continue;
-                 }
- 
--                if (find_glob(globs, sub_path)) {
-+                if (find_glob(items, sub_path)) {
-                         log_debug("Ignoring \"%s\": a separate glob exists.", sub_path);
-                         continue;
-                 }
-@@ -1378,7 +1379,7 @@ static int process_item(Item *i) {
-         PATH_FOREACH_PREFIX(prefix, i->path) {
-                 ItemArray *j;
- 
--                j = hashmap_get(items, prefix);
-+                j = ordered_hashmap_get(items, prefix);
-                 if (j) {
-                         int s;
- 
-@@ -1505,7 +1506,6 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
-         _cleanup_free_ char *action = NULL, *mode = NULL, *user = NULL, *group = NULL, *age = NULL, *path = NULL;
-         _cleanup_(item_free_contents) Item i = {};
-         ItemArray *existing;
--        Hashmap *h;
-         int r, c = -1, pos;
-         bool force = false, boot = false;
- 
-@@ -1739,9 +1739,9 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
-                 i.age_set = true;
-         }
- 
--        h = needs_glob(i.type) ? globs : items;
-+        i.glob = needs_glob(i.type);
- 
--        existing = hashmap_get(h, i.path);
-+        existing = ordered_hashmap_get(items, i.path);
-         if (existing) {
-                 unsigned n;
- 
-@@ -1752,7 +1752,7 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
-                 }
-         } else {
-                 existing = new0(ItemArray, 1);
--                r = hashmap_put(h, i.path, existing);
-+                r = ordered_hashmap_put(items, i.path, existing);
-                 if (r < 0)
-                         return log_oom();
-         }
-@@ -1911,14 +1911,20 @@ static int read_config_file(const char *fn, bool ignore_enoent) {
-         }
- 
-         /* we have to determine age parameter for each entry of type X */
--        HASHMAP_FOREACH(i, globs, iterator) {
-+        ORDERED_HASHMAP_FOREACH(i, items, iterator) {
-                 Iterator iter;
-                 Item *j, *candidate_item = NULL;
-+                int number = 0;
- 
-+                if (!i->glob)
-+                        continue;
-                 if (i->type != IGNORE_DIRECTORY_PATH)
-                         continue;
- 
--                HASHMAP_FOREACH(j, items, iter) {
-+                ORDERED_HASHMAP_FOREACH(j, items, iter) {
-+                        number++;
-+                        if (j == i)
-+                                continue;
-                         if (j->type != CREATE_DIRECTORY && j->type != TRUNCATE_DIRECTORY && j->type != CREATE_SUBVOLUME)
-                                 continue;
- 
-@@ -1964,10 +1970,9 @@ int main(int argc, char *argv[]) {
- 
-         mac_selinux_init(NULL);
- 
--        items = hashmap_new(&string_hash_ops);
--        globs = hashmap_new(&string_hash_ops);
-+        items = ordered_hashmap_new(&string_hash_ops);
- 
--        if (!items || !globs) {
-+        if (!items) {
-                 r = log_oom();
-                 goto finish;
-         }
-@@ -2000,27 +2005,17 @@ int main(int argc, char *argv[]) {
-                 }
-         }
- 
--        HASHMAP_FOREACH(a, globs, iterator) {
--                k = process_item_array(a);
--                if (k < 0 && r == 0)
--                        r = k;
--        }
--
--        HASHMAP_FOREACH(a, items, iterator) {
-+        ORDERED_HASHMAP_FOREACH(a, items, iterator) {
-                 k = process_item_array(a);
-                 if (k < 0 && r == 0)
-                         r = k;
-         }
- 
- finish:
--        while ((a = hashmap_steal_first(items)))
--                item_array_free(a);
--
--        while ((a = hashmap_steal_first(globs)))
-+        while ((a = ordered_hashmap_steal_first(items)))
-                 item_array_free(a);
- 
--        hashmap_free(items);
--        hashmap_free(globs);
-+        ordered_hashmap_free(items);
- 
-         free(arg_include_prefixes);
-         free(arg_exclude_prefixes);
--- 
-1.9.3
-
diff --git a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
index 3e3aa27..6308cc7 100644
--- a/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
+++ b/meta/recipes-core/systemd/systemd/0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch
@@ -21,11 +21,11 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  8 files changed, 214 insertions(+), 4 deletions(-)
  create mode 100644 src/udev/udev-builtin-firmware.c
 
-diff --git a/Makefile.am b/Makefile.am
-index bf04d31..9394700 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3678,6 +3678,18 @@ libudev_core_la_LIBADD = \
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -3470,6 +3470,18 @@ libudev_core_la_LIBADD = \
  	$(BLKID_LIBS) \
  	$(KMOD_LIBS)
  
@@ -44,10 +44,10 @@ index bf04d31..9394700 100644
  if HAVE_KMOD
  libudev_core_la_SOURCES += \
  	src/udev/udev-builtin-kmod.c
-diff --git a/README b/README
-index c722092..db382d2 100644
---- a/README
-+++ b/README
+Index: git/README
+===================================================================
+--- git.orig/README
++++ git/README
 @@ -36,7 +36,8 @@ LICENSE:
          - except src/udev/* which is (currently still) GPLv2, GPLv2+
  
@@ -76,11 +76,11 @@ index c722092..db382d2 100644
            CONFIG_FW_LOADER_USER_HELPER=n
  
          Some udev rules and virtualization detection relies on it:
-diff --git a/TODO b/TODO
-index 255a4f2..407bdd0 100644
---- a/TODO
-+++ b/TODO
-@@ -727,6 +727,7 @@ Features:
+Index: git/TODO
+===================================================================
+--- git.orig/TODO
++++ git/TODO
+@@ -754,6 +754,7 @@ Features:
  * ExecOnFailure=/usr/bin/foo
  
  * udev:
@@ -88,11 +88,11 @@ index 255a4f2..407bdd0 100644
    - move to LGPL
    - kill scsi_id
    - add trigger --subsystem-match=usb/usb_device device
-diff --git a/configure.ac b/configure.ac
-index 97a29d6..13b80ce 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1245,6 +1245,25 @@ fi
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -1268,6 +1268,26 @@ fi
  AM_CONDITIONAL(HAVE_MYHOSTNAME, [test "$have_myhostname" = "yes"])
  
  # ------------------------------------------------------------------------------
@@ -114,23 +114,23 @@ index 97a29d6..13b80ce 100644
 +AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
 +AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
 +
++
 +# ------------------------------------------------------------------------------
- AC_ARG_ENABLE([gudev],
-        AS_HELP_STRING([--disable-gudev], [disable Gobject libudev support @<:@default=enabled@:>@]),
-        [], [enable_gudev=yes])
-@@ -1533,6 +1552,7 @@ AC_MSG_RESULT([
+ AC_ARG_ENABLE(hwdb, [AC_HELP_STRING([--disable-hwdb], [disable hardware database support])],
+        enable_hwdb=$enableval, enable_hwdb=yes)
+ AM_CONDITIONAL(ENABLE_HWDB, [test x$enable_hwdb = xyes])
+@@ -1574,6 +1594,7 @@ AC_MSG_RESULT([
+         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
          Build Python:            ${PYTHON}
-         Installation Python:     ${PYTHON_BINARY}
          sphinx binary:           ${SPHINX_BUILD}
 +        firmware path:           ${FIRMWARE_PATH}
          PAM modules dir:         ${with_pamlibdir}
          PAM configuration dir:   ${with_pamconfdir}
          D-Bus policy dir:        ${with_dbuspolicydir}
-diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
-new file mode 100644
-index 0000000..bd8c2fb
+Index: git/src/udev/udev-builtin-firmware.c
+===================================================================
 --- /dev/null
-+++ b/src/udev/udev-builtin-firmware.c
++++ git/src/udev/udev-builtin-firmware.c
 @@ -0,0 +1,154 @@
 +/*
 + * firmware - Kernel firmware loader
@@ -286,11 +286,11 @@ index 0000000..bd8c2fb
 +        .help = "kernel firmware loader",
 +        .run_once = true,
 +};
-diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
-index 1950ec2..f21c0b6 100644
---- a/src/udev/udev-builtin.c
-+++ b/src/udev/udev-builtin.c
-@@ -34,6 +34,9 @@ static const struct udev_builtin *builtins[] = {
+Index: git/src/udev/udev-builtin.c
+===================================================================
+--- git.orig/src/udev/udev-builtin.c
++++ git/src/udev/udev-builtin.c
+@@ -30,6 +30,9 @@ static const struct udev_builtin *builti
          [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
  #endif
          [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
@@ -300,11 +300,11 @@ index 1950ec2..f21c0b6 100644
          [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
          [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
          [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
-diff --git a/src/udev/udev.h b/src/udev/udev.h
-index dece6ec..f7ee1e7 100644
---- a/src/udev/udev.h
-+++ b/src/udev/udev.h
-@@ -151,6 +151,9 @@ enum udev_builtin_cmd {
+Index: git/src/udev/udev.h
+===================================================================
+--- git.orig/src/udev/udev.h
++++ git/src/udev/udev.h
+@@ -146,6 +146,9 @@ enum udev_builtin_cmd {
          UDEV_BUILTIN_BLKID,
  #endif
          UDEV_BUILTIN_BTRFS,
@@ -314,7 +314,7 @@ index dece6ec..f7ee1e7 100644
          UDEV_BUILTIN_HWDB,
          UDEV_BUILTIN_INPUT_ID,
          UDEV_BUILTIN_KEYBOARD,
-@@ -179,6 +182,9 @@ struct udev_builtin {
+@@ -174,6 +177,9 @@ struct udev_builtin {
  extern const struct udev_builtin udev_builtin_blkid;
  #endif
  extern const struct udev_builtin udev_builtin_btrfs;
@@ -324,21 +324,21 @@ index dece6ec..f7ee1e7 100644
  extern const struct udev_builtin udev_builtin_hwdb;
  extern const struct udev_builtin udev_builtin_input_id;
  extern const struct udev_builtin udev_builtin_keyboard;
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index 99d4c89..71af1e1 100644
---- a/src/udev/udevd.c
-+++ b/src/udev/udevd.c
-@@ -99,6 +99,9 @@ struct event {
-         dev_t devnum;
-         int ifindex;
+Index: git/src/udev/udevd.c
+===================================================================
+--- git.orig/src/udev/udevd.c
++++ git/src/udev/udevd.c
+@@ -116,6 +116,9 @@ struct event {
          bool is_block;
+         sd_event_source *timeout_warning;
+         sd_event_source *timeout;
 +#ifdef HAVE_FIRMWARE
 +        bool nodelay;
 +#endif
  };
  
  static inline struct event *node_to_event(struct udev_list_node *node) {
-@@ -472,6 +475,10 @@ static int event_queue_insert(struct udev_device *dev) {
+@@ -607,6 +610,10 @@ static int event_queue_insert(Manager *m
          event->devnum = udev_device_get_devnum(dev);
          event->is_block = streq("block", udev_device_get_subsystem(dev));
          event->ifindex = udev_device_get_ifindex(dev);
@@ -349,7 +349,7 @@ index 99d4c89..71af1e1 100644
  
          log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
               udev_device_get_action(dev), udev_device_get_subsystem(dev));
-@@ -548,6 +555,12 @@ static bool is_devpath_busy(struct event *event) {
+@@ -692,6 +699,12 @@ static bool is_devpath_busy(Manager *man
                          return true;
                  }
  
@@ -362,6 +362,3 @@ index 99d4c89..71af1e1 100644
                  /* parent device event found */
                  if (event->devpath[common] == '/') {
                          event->delaying_seqnum = loop_event->seqnum;
--- 
-2.3.3
-
diff --git a/meta/recipes-core/systemd/systemd/tmpfiles-pam.patch b/meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
deleted file mode 100644
index a40b1b9..0000000
--- a/meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 0802aaaa9784813d318d045c79533a044eedf542 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 3 Mar 2015 11:32:29 +0000
-Subject: [PATCH] tmpfiles.d: only copy /etc/pam.d if PAM is present
-
-If HAVE_PAM isn't set then don't attempt to copy /etc/pam.d from the factory, as
-it doesn't get installed.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- tmpfiles.d/etc.conf.m4 |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tmpfiles.d/etc.conf.m4 b/tmpfiles.d/etc.conf.m4
-index 9b0e080..ab5cd16 100644
---- a/tmpfiles.d/etc.conf.m4
-+++ b/tmpfiles.d/etc.conf.m4
-@@ -14,4 +14,6 @@ m4_ifdef(`ENABLE_RESOLVED',
- L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
- )m4_dnl
- C /etc/nsswitch.conf - - - -
-+m4_ifdef(`HAVE_PAM',
- C /etc/pam.d - - - -
-+)m4_dnl
--- 
-1.7.10.4
-
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_224.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd_219.bb
rename to meta/recipes-core/systemd/systemd_224.bb
index e187cea..16eb497 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_224.bb
@@ -10,10 +10,9 @@ state, maintains mount and automount points and implements an \
 elaborate transactional dependency-based service control logic. It can \
 work as a drop-in replacement for sysvinit."
 
-LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
 PROVIDES = "udev"
 
@@ -23,14 +22,13 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
+inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
+SRCREV = "b2a0ac5e5b29c73ca7c0da23369a4769d5a91ddd"
 
-PV = "219-stable+git${SRCPV}"
+PV = "224+git${SRCPV}"
 
-SRC_URI = "git://github.com/systemd/systemd-stable;branch=v219-stable;protocol=git \
-           file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
            file://0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch \
@@ -40,11 +38,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable;branch=v219-stable;protocol=g
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
            file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
-           file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
-           file://tmpfiles-pam.patch \
-           file://0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
@@ -108,8 +103,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
                  --with-roothomedir=${ROOT_HOME} \
                  --disable-coredump \
-                 --disable-introspection \
-                 --disable-kdbus \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
@@ -210,7 +203,7 @@ python populate_packages_prepend (){
 PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
-             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc"
 
 SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
@@ -224,8 +217,6 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
-FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
-
 RDEPENDS_${PN}-ptest += "perl python bash"
 FILES_${PN}-ptest += "${libdir}/udev/rules.d"
 
@@ -245,6 +236,8 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
 FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
                          "
 
+FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
+
 FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
 
 FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
-- 
2.1.4


