Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9A726FFCC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:58:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u29Jwj2B010140
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 11:58:46 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 11:58:44 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Mar 2016 13:58:41 -0600
Message-ID: <ae108ddf9607bbe7b8eddf1d76e711ff4d069a14.1457553473.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457553473.git.mark.hatle@windriver.com>
References: <cover.1457553473.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] rpm: Fix musl integration with RPM5
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
X-List-Received-Date: Wed, 09 Mar 2016 19:58:47 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/0001-rpm-Fix-build-on-musl.patch       | 242 ++++++++++++++++-----
 .../rpm/rpm/rpm-autogen-force.patch                |  78 +++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |   1 +
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   1 +
 4 files changed, 267 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autogen-force.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch b/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
index 763dc57..70dd4ff 100644
--- a/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
+++ b/meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
@@ -7,21 +7,37 @@ Provide alternatives to assumptions about glibc
 on linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Updated to 5.4.16 (CVS)
+
+The patch will likely need additional rework before it can be accepted upsteam
+due to the way MUSL changes are patched in.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
 ---
 Upstream-Status: Pending
 
- rpmio/fts.c       |  4 ++++
- rpmqv.c           |  6 +++++-
- system.h          |  2 +-
- tools/debugedit.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
- tools/rpmfind.c   |  6 +++---
- 5 files changed, 60 insertions(+), 5 deletions(-)
+ lib/poptALL.c          |    2 ++
+ rpmio/fts.c            |    4 ++++
+ rpmio/poptIO.c         |    2 ++
+ rpmqv.c                |    2 ++
+ system.h               |   13 ++++++-------
+ tools/debugedit.c      |   47 +++++++++++++++++++++++++++++++++++++++++++++++
+ tools/rpm2cpio.c       |    2 ++
+ tools/rpmcache.c       |    2 ++
+ tools/rpmcmp.c         |    2 ++
+ tools/rpmdeps-oecore.c |    2 ++
+ tools/rpmdeps.c        |    2 ++
+ tools/rpmdigest.c      |    2 ++
+ tools/rpmfind.c        |    6 +++---
+ 13 files changed, 78 insertions(+), 10 deletions(-)
 
-diff --git a/rpmio/fts.c b/rpmio/fts.c
-index 2d7594c..b7aa9b8 100644
---- a/rpmio/fts.c
-+++ b/rpmio/fts.c
-@@ -124,6 +124,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (Berkeley) 8/14/94";
+Index: rpm-5.4.15/rpmio/fts.c
+===================================================================
+--- rpm-5.4.15.orig/rpmio/fts.c
++++ rpm-5.4.15/rpmio/fts.c
+@@ -124,6 +124,10 @@ static char sccsid[] = "@(#)fts.c	8.6 (B
  #   define __fxstat64(_stat_ver, _fd, _sbp)    fstat((_fd), (_sbp))
  #endif
  
@@ -32,39 +48,11 @@ index 2d7594c..b7aa9b8 100644
  #if !defined(_D_EXACT_NAMLEN)
  #   define _D_EXACT_NAMLEN(d) (strlen((d)->d_name))
  #endif
-diff --git a/rpmqv.c b/rpmqv.c
-index 14c73e2..b2d3e24 100644
---- a/rpmqv.c
-+++ b/rpmqv.c
-@@ -523,7 +523,11 @@ int main(int argc, const char ** argv)
-     (void) initproctitle(argc, (char **)argv, environ);
- #endif
- #endif  
--
-+    /* XXX glibc churn sanity */
-+    if (__progname == NULL) {
-+        if ((__progname = strrchr(argv[0], '/')) != NULL) __progname++;
-+        else __progname = argv[0];
-+    }
-     /* Set the major mode based on argv[0] */
-     /*@-nullpass@*/
- #ifdef	IAM_RPMBT
-diff --git a/system.h b/system.h
-index 72851c0..05f7553 100644
---- a/system.h
-+++ b/system.h
-@@ -791,5 +791,5 @@ static inline const char *rcsid(const char *p) { \
-  * Permit ar(1) payloads. Disabled while rpmio/iosm.c is under development.
-  */
- #undef	SUPPORT_AR_PAYLOADS
--
- #endif	/* H_SYSTEM */
-+const char *program_name;
-diff --git a/tools/debugedit.c b/tools/debugedit.c
-index 29e8ee9..b2a8918 100644
---- a/tools/debugedit.c
-+++ b/tools/debugedit.c
-@@ -23,7 +23,12 @@
+Index: rpm-5.4.15/tools/debugedit.c
+===================================================================
+--- rpm-5.4.15.orig/tools/debugedit.c
++++ rpm-5.4.15/tools/debugedit.c
+@@ -22,7 +22,12 @@
  #include <byteswap.h>
  #include <endian.h>
  #include <errno.h>
@@ -77,7 +65,7 @@ index 29e8ee9..b2a8918 100644
  #include <limits.h>
  #include <string.h>
  #include <stdlib.h>
-@@ -1531,6 +1536,48 @@ handle_build_id (DSO *dso, Elf_Data *build_id,
+@@ -1535,6 +1540,48 @@ handle_build_id (DSO *dso, Elf_Data *bui
      puts (hex);
    }
  }
@@ -126,11 +114,11 @@ index 29e8ee9..b2a8918 100644
  
  /* It avoided the segment fault while file's bss offset have a large number.
     See https://bugzilla.redhat.com/show_bug.cgi?id=1019707
-diff --git a/tools/rpmfind.c b/tools/rpmfind.c
-index 816aeef..327fab0 100644
---- a/tools/rpmfind.c
-+++ b/tools/rpmfind.c
-@@ -1174,7 +1174,7 @@ find_parsenum(PLAN *plan, const char *option, char *vp, char *endch)
+Index: rpm-5.4.15/tools/rpmfind.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpmfind.c
++++ rpm-5.4.15/tools/rpmfind.c
+@@ -1175,7 +1175,7 @@ find_parsenum(PLAN *plan, const char *op
       * and endchar points to the beginning of the string we know we have
       * a syntax error.
       */
@@ -139,7 +127,7 @@ index 816aeef..327fab0 100644
      value = strtoll(str, &endchar, 10);
  #else
      value = strtoq(str, &endchar, 10);
-@@ -1214,7 +1214,7 @@ find_parsetime(PLAN *plan, const char *option, char *vp)
+@@ -1215,7 +1215,7 @@ find_parsetime(PLAN *plan, const char *o
  	break;
      }
  
@@ -148,7 +136,7 @@ index 816aeef..327fab0 100644
      value = strtoll(str, &unit, 10);
  #else
      value = strtoq(str, &unit, 10);
-@@ -1252,7 +1252,7 @@ find_parsetime(PLAN *plan, const char *option, char *vp)
+@@ -1253,7 +1253,7 @@ find_parsetime(PLAN *plan, const char *o
  	str = unit + 1;
  	if (*str == '\0')	/* EOS */
  	    break;
@@ -157,6 +145,150 @@ index 816aeef..327fab0 100644
  	value = strtoll(str, &unit, 10);
  #else
  	value = strtoq(str, &unit, 10);
--- 
-2.7.1
-
+Index: rpm-5.4.15/system.h
+===================================================================
+--- rpm-5.4.15.orig/system.h
++++ rpm-5.4.15/system.h
+@@ -372,16 +372,15 @@ extern int _tolower(int) __THROW	/*@*/;
+ #define	__progname	__assert_program_name
+ #endif
+ #define	setprogname(pn)
++/*@unchecked@*/
++extern const char *__progname;
+ #else
+-#define	__progname	program_name
+-#define	setprogname(pn)	\
+-  { if ((__progname = strrchr(pn, '/')) != NULL) __progname++; \
+-    else __progname = pn;		\
+-  }
+-#endif
++#define	setprogname(pn)
++#define	progname	__progname
+ 
+ /*@unchecked@*/
+-extern const char *__progname;
++extern char *__progname;
++#endif
+ 
+ /* -- Retrofit missing prototypes (if needed). */
+ #ifdef __cplusplus
+Index: rpm-5.4.15/rpmio/poptIO.c
+===================================================================
+--- rpm-5.4.15.orig/rpmio/poptIO.c
++++ rpm-5.4.15/rpmio/poptIO.c
+@@ -65,7 +65,9 @@ extern int _rpmsvn_debug;
+ GENfree(rpmioP)
+ #endif	/* __cplusplus */
+ 
++#ifdef __GLIBC__
+ const char *__progname;
++#endif
+ 
+ #if !defined(POPT_ARGFLAG_TOGGLE)	/* XXX compat with popt < 1.15 */
+ #define	POPT_ARGFLAG_TOGGLE	0
+Index: rpm-5.4.15/lib/poptALL.c
+===================================================================
+--- rpm-5.4.15.orig/lib/poptALL.c
++++ rpm-5.4.15/lib/poptALL.c
+@@ -4,7 +4,9 @@
+  */
+ 
+ #include "system.h"
++#ifdef __GLIBC__
+ extern const char *__progname;
++#endif
+ 
+ #if defined(RPM_VENDOR_WINDRIVER)
+ const char *__usrlibrpm = USRLIBRPM;
+Index: rpm-5.4.15/tools/rpm2cpio.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpm2cpio.c
++++ rpm-5.4.15/tools/rpm2cpio.c
+@@ -1,7 +1,9 @@
+ /* rpmarchive: spit out the main archive portion of a package */
+ 
+ #include "system.h"
++#ifdef __GLIBC__
+ const char *__progname;
++#endif
+ 
+ #include <rpmio.h>
+ #include <rpmiotypes.h>	/* XXX fnpyKey */
+Index: rpm-5.4.15/tools/rpmcache.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpmcache.c
++++ rpm-5.4.15/tools/rpmcache.c
+@@ -3,7 +3,9 @@
+  */
+ 
+ #include "system.h"
++#ifdef __GLIBC__
+ const char *__progname;
++#endif
+ 
+ #include <fnmatch.h>
+ #include <fts.h>
+Index: rpm-5.4.15/tools/rpmdeps-oecore.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpmdeps-oecore.c
++++ rpm-5.4.15/tools/rpmdeps-oecore.c
+@@ -1,5 +1,7 @@
+ #include "system.h"
++#ifdef __GLIBC__
+ const char *__progname;
++#endif
+ 
+ #include <rpmio.h>
+ #include <rpmiotypes.h>
+Index: rpm-5.4.15/tools/rpmdeps.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpmdeps.c
++++ rpm-5.4.15/tools/rpmdeps.c
+@@ -1,5 +1,7 @@
+ #include "system.h"
++#ifdef __GLIBC__
+ const char *__progname;
++#endif
+ 
+ #include <rpmio.h>
+ #include <rpmiotypes.h>
+Index: rpm-5.4.15/tools/rpmdigest.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpmdigest.c
++++ rpm-5.4.15/tools/rpmdigest.c
+@@ -1,6 +1,8 @@
+ #include "system.h"
++#ifdef __GLIBC__
+ /*@unchecked@*/
+ extern const char * __progname;
++#endif
+ 
+ #define	_RPMIOB_INTERNAL
+ #include <rpmiotypes.h>
+Index: rpm-5.4.15/tools/rpmcmp.c
+===================================================================
+--- rpm-5.4.15.orig/tools/rpmcmp.c
++++ rpm-5.4.15/tools/rpmcmp.c
+@@ -13,8 +13,10 @@
+ 
+ #include "debug.h"
+ 
++#ifdef __GLIBC__
+ const char *__progname;
+ #define	progname	__progname
++#endif
+ 
+ static int pointRpmEVR(ARGV_t av)
+ {
+Index: rpm-5.4.15/rpmqv.c
+===================================================================
+--- rpm-5.4.15.orig/rpmqv.c
++++ rpm-5.4.15/rpmqv.c
+@@ -1,5 +1,7 @@
+ #include "system.h"
++#ifdef __GLIBC__
+ extern const char *__progname;
++#endif
+ 
+ /* Copyright (C) 1998-2002 - Red Hat, Inc. */
+ 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-autogen-force.patch b/meta/recipes-devtools/rpm/rpm/rpm-autogen-force.patch
new file mode 100644
index 0000000..258a7f6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-autogen-force.patch
@@ -0,0 +1,78 @@
+In order to enable musl or other libc support, force update the config.guess
+
+In order to reliably replace config.guess and config.sub, we need to remove
+them prior to the call to automake.  Adding the --force-missing is likely
+not necessary, but matching normal OE autoreconf usage.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.15/autogen.sh
+===================================================================
+--- rpm-5.4.15.orig/autogen.sh
++++ rpm-5.4.15/autogen.sh
+@@ -73,7 +73,8 @@ rm -f aclocal.m4
+ aclocal -I m4
+ autoheader -I m4
+ echo "---> generate files via GNU automake (automake)"
+-automake -Wall -Wno-override -a -c
++rm -f config.guess config.sub
++automake -Wall -Wno-override -a -c --force-missing
+ echo "---> generate files via GNU autoconf (autoconf)"
+ autoconf -I m4
+ echo "<=== rpm"
+Index: rpm-5.4.15/beecrypt/autogen.sh
+===================================================================
+--- rpm-5.4.15.orig/beecrypt/autogen.sh
++++ rpm-5.4.15/beecrypt/autogen.sh
+@@ -25,6 +25,7 @@ libtoolize () {
+ 
+ libtoolize --force --copy
+ aclocal
+-automake -a -c
++rm -f config.guess config.sub
++automake -a -c --force-missing
+ autoconf
+ autoheader
+Index: rpm-5.4.15/libtpm/autogen.sh
+===================================================================
+--- rpm-5.4.15.orig/libtpm/autogen.sh
++++ rpm-5.4.15/libtpm/autogen.sh
+@@ -46,7 +46,8 @@ echo "---> generate files via GNU autoco
+ aclocal
+ autoheader
+ echo "---> generate files via GNU automake (automake)"
+-automake -Wall -Wno-override -a -c
++rm -f config.guess config.sub
++automake -Wall -Wno-override -a -c --force-missing
+ echo "---> generate files via GNU autoconf (autoconf)"
+ autoconf
+ 
+Index: rpm-5.4.15/neon/autogen.sh
+===================================================================
+--- rpm-5.4.15.orig/neon/autogen.sh
++++ rpm-5.4.15/neon/autogen.sh
+@@ -63,7 +63,8 @@ echo "---> generate files via GNU autoco
+ ${ACLOCAL:-aclocal} -I macros
+ ${AUTOHEADER:-autoheader}
+ echo "---> generate files via GNU automake (automake)"
+-${AUTOMAKE:-automake} -Wall -Wno-override -a -c
++rm -f config.guess config.sub
++${AUTOMAKE:-automake} -Wall -Wno-override -a -c --force-missing
+ echo "---> generate files via GNU autoconf (autoconf)"
+ ${AUTOCONF:-autoconf} -Wall
+ 
+Index: rpm-5.4.15/syck/autogen.sh
+===================================================================
+--- rpm-5.4.15.orig/syck/autogen.sh
++++ rpm-5.4.15/syck/autogen.sh
+@@ -40,6 +40,7 @@ echo "---> generate files via GNU autoco
+ aclocal
+ autoheader
+ echo "---> generate files via GNU automake (automake)"
+-automake -Wall -Wno-override -a -c
++rm -f config.guess config.sub
++automake -Wall -Wno-override -a -c --force-missing
+ echo "---> generate files via GNU autoconf (autoconf)"
+ autoconf
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index e35ddbe..982c035 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -144,6 +144,7 @@ SRC_URI += " \
 	   file://rpm-syck-fix-gram.patch \
 	   file://rpm-rpmdb-grammar.patch \
 	   file://rpm-disable-blaketest.patch \
+	   file://rpm-autogen-force.patch \
 "
 
 SRC_URI_append_libc-musl = "\
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index c961bac..5fea53f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -147,6 +147,7 @@ SRC_URI += " \
 	   file://rpm-syck-fix-gram.patch \
 	   file://rpm-rpmdb-grammar.patch \
 	   file://rpm-disable-blaketest.patch \
+	   file://rpm-autogen-force.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.5.0


