Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4879C433EF
	for <webhook@archiver.kernel.org>; Sat, 14 May 2022 21:15:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10464.1652562897309316625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 May 2022 14:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Io7vvzMP;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1652562899;
  x=1684098899;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gKUfe9nzmY40FbLiM+7mPkLVZwon6ckdbWTKi9tiDo0=;
  b=Io7vvzMPk5pV3LAA1XIhw/hihstQmewXCR+593cLL2wc0A4ADyD70Q3v
   CI0GWf5gF+wr+KwGdt9D3wkeEBRWNy95QUyBkqxapeLkEpL3T5ePRj6bW
   F+7/kN5sJWUug9g1dzxqKEH/oTuklPWdu9k3MKhFcOCIWwdA3Gzn/XRQ9
   zRRb2R5SYR/tcBandtVsejjUEczxWBWWWbAqcbyV2KgXkjPxt2X7QNzta
   FFINEgc1HAx6baD7l9/2YjJru24AVm6M0OS3+sNwtoon9Bnh2wfBQiu10
   fOS1q3p5QcWr7kAQSKPc/azZak7rYedN4lHTfhnZzhvOwBfFI3bQetlpW
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] base-passwd: Update to 3.5.52
Date: Sat, 14 May 2022 23:14:50 +0200
Message-ID: <20220514211450.28115-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220514211450.28115-1-pkj@axis.com>
References: <20220514211450.28115-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 May 2022 21:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165594

* Add a patch to allow the use of debconf to be disabled.
* Replace 0007-Disable-generation-of-the-documentation.patch with a new
  patch to disable the generation of the documentation using a
  configuration option.
* Replace 0006-Disable-shell-for-default-users.patch with a sed
  expression that uses a variable, NOLOGIN, to specify what command to
  use for users that are not expected to login. This allows to use some
  other command than "nologin", e.g., "false". Also, by using
  ${base_sbindir}, it adheres to usrmerge being configured.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...nstead-of-bin-bash-for-the-root-user.patch |   8 +-
 ...t-since-we-do-not-have-an-etc-shadow.patch |   8 +-
 ...0006-Disable-shell-for-default-users.patch |  54 --------
 ...ble-to-build-without-debconf-support.patch | 129 ++++++++++++++++++
 ...able-generation-of-the-documentation.patch |  32 -----
 ...-to-disable-the-generation-of-the-do.patch |  46 +++++++
 ...passwd_3.5.29.bb => base-passwd_3.5.52.bb} |  18 ++-
 7 files changed, 194 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.29.bb => base-passwd_3.5.52.bb} (89%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index ea0256684b..09f8cfea9c 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -12,12 +12,12 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index a01a6aa..b54ff51 100644
+index 7cd4e24..041685a 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
 -root:*:0:0:root:/root:/bin/bash
 +root:*:0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/usr/sbin/nologin
+ bin:*:2:2:bin:/bin:/usr/sbin/nologin
+ sys:*:3:3:sys:/dev:/usr/sbin/nologin
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 88cc5be66c..06222ab04c 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -10,12 +10,12 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index b54ff51..e1c32ff 100644
+index 041685a..31a84d4 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
 -root:*:0:0:root:/root:/bin/sh
 +root::0:0:root:/root:/bin/sh
- daemon:*:1:1:daemon:/usr/sbin:/bin/sh
- bin:*:2:2:bin:/bin:/bin/sh
- sys:*:3:3:sys:/dev:/bin/sh
+ daemon:*:1:1:daemon:/usr/sbin:/usr/sbin/nologin
+ bin:*:2:2:bin:/bin:/usr/sbin/nologin
+ sys:*:3:3:sys:/dev:/usr/sbin/nologin
diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch
deleted file mode 100644
index 2bcb829d9c..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Disable-shell-for-default-users.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f35eb24213475d3024ad45297fd855c6abfbbac0 Mon Sep 17 00:00:00 2001
-From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
-Date: Mon, 18 Apr 2022 11:22:43 +0800
-Subject: [PATCH] Disable shell for default users
-
-Change the shell of all global static users other than root (which
-retains /bin/sh) and sync (as /bin/sync is rather harmless) to
-/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
-
-Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-passwd/3.5.30]
-Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
----
- passwd.master | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/passwd.master b/passwd.master
-index e1c32ff..0cd5ffd 100644
---- a/passwd.master
-+++ b/passwd.master
-@@ -1,18 +1,18 @@
- root::0:0:root:/root:/bin/sh
--daemon:*:1:1:daemon:/usr/sbin:/bin/sh
--bin:*:2:2:bin:/bin:/bin/sh
--sys:*:3:3:sys:/dev:/bin/sh
-+daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
-+bin:*:2:2:bin:/bin:/sbin/nologin
-+sys:*:3:3:sys:/dev:/sbin/nologin
- sync:*:4:65534:sync:/bin:/bin/sync
--games:*:5:60:games:/usr/games:/bin/sh
--man:*:6:12:man:/var/cache/man:/bin/sh
--lp:*:7:7:lp:/var/spool/lpd:/bin/sh
--mail:*:8:8:mail:/var/mail:/bin/sh
--news:*:9:9:news:/var/spool/news:/bin/sh
--uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
--proxy:*:13:13:proxy:/bin:/bin/sh
--www-data:*:33:33:www-data:/var/www:/bin/sh
--backup:*:34:34:backup:/var/backups:/bin/sh
--list:*:38:38:Mailing List Manager:/var/list:/bin/sh
--irc:*:39:39:ircd:/var/run/ircd:/bin/sh
--gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
--nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
-+games:*:5:60:games:/usr/games:/sbin/nologin
-+man:*:6:12:man:/var/cache/man:/sbin/nologin
-+lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
-+mail:*:8:8:mail:/var/mail:/sbin/nologin
-+news:*:9:9:news:/var/spool/news:/sbin/nologin
-+uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
-+proxy:*:13:13:proxy:/bin:/sbin/nologin
-+www-data:*:33:33:www-data:/var/www:/sbin/nologin
-+backup:*:34:34:backup:/var/backups:/sbin/nologin
-+list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
-+irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
-+gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/sbin/nologin
-+nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
new file mode 100644
index 0000000000..61ed1641a1
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-build-without-debconf-support.patch
@@ -0,0 +1,129 @@
+From 236d6c8c0dd7e15d9a9795813b94bc87ce09eec5 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Fri, 29 Apr 2022 19:32:29 +0200
+Subject: [PATCH] Make it possible to build without debconf support
+
+Not all systems have the debconfclient library available.
+
+Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/merge_requests/11]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.am     |  1 -
+ configure.ac    | 13 +++++++++++++
+ update-passwd.c | 15 +++++++++++++++
+ 3 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 223916f..4bdd769 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,7 +3,6 @@ SUBDIRS = doc man
+ sbin_PROGRAMS = update-passwd
+ 
+ update_passwd_SOURCES = update-passwd.c
+-update_passwd_LDADD = -ldebconfclient
+ 
+ pkgdata_DATA = passwd.master group.master
+ 
+diff --git a/configure.ac b/configure.ac
+index 9d1ace5..1e35ad1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,19 @@ AC_SYS_LARGEFILE
+ dnl Scan for things we need
+ AC_CHECK_FUNCS([putgrent])
+ 
++dnl Check for debconf
++AC_MSG_CHECKING([whether to enable debconf support])
++AC_ARG_ENABLE([debconf],
++  [AS_HELP_STRING([--disable-debconf], [disable support for debconf])],
++  [],
++  [enable_debconf=yes])
++AC_MSG_RESULT($enable_debconf)
++AS_IF([test "x$enable_debconf" != xno],
++  [AC_CHECK_LIB([debconfclient], [debconfclient_new], [],
++    [AC_MSG_ERROR(
++      [debconf support not available (use --disable-debconf to disable)])])
++   AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])])
++
+ dnl Finally output everything
+ AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
+ AC_OUTPUT
+diff --git a/update-passwd.c b/update-passwd.c
+index 3f3dffa..5b49740 100644
+--- a/update-passwd.c
++++ b/update-passwd.c
+@@ -39,7 +39,9 @@
+ #include <stdarg.h>
+ #include <ctype.h>
+ 
++#ifdef HAVE_DEBCONF
+ #include <cdebconf/debconfclient.h>
++#endif
+ 
+ #define DEFAULT_PASSWD_MASTER	"/usr/share/base-passwd/passwd.master"
+ #define DEFAULT_GROUP_MASTER	"/usr/share/base-passwd/group.master"
+@@ -143,6 +145,7 @@ int		flag_debconf	= 0;
+ const char*	user_domain	= DEFAULT_DEBCONF_DOMAIN;
+ const char*	group_domain	= DEFAULT_DEBCONF_DOMAIN;
+ 
++#ifdef HAVE_DEBCONF
+ struct debconfclient*	debconf	= NULL;
+ 
+ /* Abort the program if talking to debconf fails.  Use ret exactly once. */
+@@ -162,6 +165,10 @@ struct debconfclient*	debconf	= NULL;
+     DEBCONF_CHECK(debconf_register(debconf, (template), (question)))
+ #define DEBCONF_SUBST(question, var, value) \
+     DEBCONF_CHECK(debconf_subst(debconf, (question), (var), (value)))
++#else
++#define DEBCONF_REGISTER(template, question)
++#define DEBCONF_SUBST(question, var, value)
++#endif
+ 
+ 
+ /* malloc() with out-of-memory checking.
+@@ -621,6 +628,7 @@ void version() {
+  * flag.  Aborts the problem on any failure.
+  */
+ int ask_debconf(const char* priority, const char* question) {
++#ifdef HAVE_DEBCONF
+     int		ret;
+     const char*	response;
+ 
+@@ -640,6 +648,9 @@ int ask_debconf(const char* priority, const char* question) {
+ 	return 1;
+     else
+ 	return 0;
++#else
++	return 0;
++#endif
+ }
+ 
+ 
+@@ -1427,6 +1438,7 @@ int main(int argc, char** argv) {
+     /* If DEBIAN_HAS_FRONTEND is set in the environment, we're running under
+      * debconf.  Enable debconf prompting unless --dry-run was also given.
+      */
++#ifdef HAVE_DEBCONF
+     if (getenv("DEBIAN_HAS_FRONTEND")!=NULL && !opt_dryrun) {
+ 	debconf=debconfclient_new();
+ 	if (debconf==NULL) {
+@@ -1435,6 +1447,7 @@ int main(int argc, char** argv) {
+ 	}
+ 	flag_debconf=1;
+     }
++#endif
+ 
+     if (read_passwd(&master_accounts, master_passwd)!=0)
+ 	return 2;
+@@ -1480,8 +1493,10 @@ int main(int argc, char** argv) {
+ 	if (!unlock_files())
+ 	    return 5;
+ 
++#ifdef HAVE_DEBCONF
+     if (debconf!=NULL)
+ 	debconfclient_delete(debconf);
++#endif
+ 
+     if (opt_dryrun)
+ 	return flag_dirty;
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch
deleted file mode 100644
index 4a19f91c35..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Disable-generation-of-the-documentation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ccf8227cb10d78f1958a7a7feed75a390a6b133 Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Fri, 29 Apr 2022 13:32:28 +0000
-Subject: [PATCH] Disable generation of the documentation
-
-It uses tools currently not supported by OE-Core. It uses sgmltools
-and po4a.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- Makefile.in | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 9ba097c..d3ea47c 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -25,13 +25,10 @@ gen_configure	= config.cache config.status config.log \
- 		  confdefhs.h config.h Makefile
- 
- all: update-passwd
--	$(MAKE) -C doc all
--	$(MAKE) -C man all
- 
- install: all
- 	mkdir -p $(DESTDIR)$(sbindir)
- 	$(INSTALL) update-passwd $(DESTDIR)$(sbindir)/
--	$(MAKE) -C man install
- 
- update-passwd.o: version.h
- 
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
new file mode 100644
index 0000000000..2bec065cdb
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Make-it-possible-to-disable-the-generation-of-the-do.patch
@@ -0,0 +1,46 @@
+From 63e8270141a296843cfe1daba38e1969ac6d75ae Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Sat, 30 Apr 2022 00:35:34 +0200
+Subject: [PATCH] Make it possible to disable the generation of the
+ documentation
+
+Not all systems have docbook and po4a available.
+
+Upstream-Status: Submitted [https://salsa.debian.org/debian/base-passwd/-/merge_requests/11]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ Makefile.am  | 2 ++
+ configure.ac | 9 +++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4bdd769..97b4f42 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,6 @@
++if ENABLE_DOCS
+ SUBDIRS = doc man
++endif
+ 
+ sbin_PROGRAMS = update-passwd
+ 
+diff --git a/configure.ac b/configure.ac
+index 1e35ad1..b98374e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,6 +27,15 @@ AS_IF([test "x$enable_debconf" != xno],
+       [debconf support not available (use --disable-debconf to disable)])])
+    AC_DEFINE([HAVE_DEBCONF], [1], [Define if you have libdebconfclient])])
+ 
++dnl Check whether to build the documentation 
++AC_MSG_CHECKING([whether to build the documentation])
++AC_ARG_ENABLE([docs],
++  [AC_HELP_STRING([--disable-docs], [do not build and install documentation])],
++  [],
++  [enable_docs=yes])
++AC_MSG_RESULT($enable_docs)
++AM_CONDITIONAL(ENABLE_DOCS, test "x$enable_docs" = xyes)
++
+ dnl Finally output everything
+ AC_CONFIG_FILES([Makefile doc/Makefile man/Makefile])
+ AC_OUTPUT
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
similarity index 89%
rename from meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
index e561599136..f89752c077 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
@@ -5,27 +5,30 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
-
-SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar.gz \
+SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar.xz \
            file://0001-Add-a-shutdown-group.patch \
            file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch \
            file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch \
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
            file://0005-Add-kvm-group.patch \
-           file://0006-Disable-shell-for-default-users.patch \
-           file://0007-Disable-generation-of-the-documentation.patch \
+           file://0006-Make-it-possible-to-build-without-debconf-support.patch \
+           file://0007-Make-it-possible-to-disable-the-generation-of-the-do.patch \
            "
 
-SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
-SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
+SRC_URI[sha256sum] = "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31a3d6317f95ccea"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/"
 
+S = "${WORKDIR}/work"
+
 inherit autotools
 
+EXTRA_OECONF += "--disable-debconf --disable-docs"
+
+NOLOGIN ?= "${base_sbindir}/nologin"
+
 do_install () {
 	install -d -m 755 ${D}${sbindir}
 	install -o root -g root -p -m 755 ${B}/update-passwd ${D}${sbindir}/
@@ -37,6 +40,7 @@ do_install () {
 	install -d -m 755 ${D}${datadir}/base-passwd
 	install -o root -g root -p -m 644 ${S}/passwd.master ${D}${datadir}/base-passwd/
 	sed -i 's#:/root:#:${ROOT_HOME}:#' ${D}${datadir}/base-passwd/passwd.master
+	sed -i 's#/usr/sbin/nologin#${NOLOGIN}#' ${D}${datadir}/base-passwd/passwd.master
 	install -o root -g root -p -m 644 ${S}/group.master ${D}${datadir}/base-passwd/
 
 	install -d -m 755 ${D}${docdir}/${BPN}

