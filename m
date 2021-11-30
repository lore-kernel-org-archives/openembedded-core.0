Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C92C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 06:54:31 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.72997.1638255270507047996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 22:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AU6s5V6004356
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 22:54:14 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AU6s09e028076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 22:54:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 29 Nov 2021 22:53:59 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 29 Nov 2021 22:53:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libtool: change the default AR_FLAGS from "cru" to "cr"
Date: Tue, 30 Nov 2021 14:51:11 +0800
Message-ID: <20211130065111.22688-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 06:54:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158968

From: Li Wang <li.wang@windriver.com>

Backport patch to fix warning:
`u' modifier ignored since `D' is the default (see `U')

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libtool/libtool-2.4.6.inc                 |   2 +
 ...AGS-use-cr-instead-of-cru-by-default.patch | 133 ++++++++++++++++++
 .../libool.m4-add-ARFLAGS-variable.patch      |  77 ++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 2df46aa773..a636926ef9 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -24,6 +24,8 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0010-Makefile.am-make-sure-autoheader-run-before-automake.patch \
            file://0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch \
            file://0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch \
+           file://libool.m4-add-ARFLAGS-variable.patch \
+           file://ARFLAGS-use-cr-instead-of-cru-by-default.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch b/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
new file mode 100644
index 0000000000..5c4a8fdb2d
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/ARFLAGS-use-cr-instead-of-cru-by-default.patch
@@ -0,0 +1,133 @@
+From 418129bc63afc312701e84cb8afa5ca413df1ab5 Mon Sep 17 00:00:00 2001
+From: Pavel Raiskup <praiskup@redhat.com>
+Date: Fri, 17 Apr 2015 16:54:58 +0200
+Subject: ARFLAGS: use 'cr' instead of 'cru' by default
+
+In some GNU/Linux distributions people started to compile 'ar'
+binary with --enable-deterministic-archives (binutils project).
+That, however, in combination with our previous long time working
+default AR_FLAGS=cru causes warnings on such installations:
+ar: `u' modifier ignored since `D' is the default (see `U')
+
+The 'u' option (at least with GNU binutils) did small optimization
+during repeated builds because it instructed 'ar' to not
+open/close unchanged *.o files and to rather read their contents
+from old archive file.  However, its removal should not cause a
+big performance hit for usual workflows.
+
+Distributions started using --enable-deterministic-archives
+knowing that it would disable the 'u', just to rather have a bit
+more deterministic builds.
+
+Also, to justify this change a bit more, keeping 'u' in ARFLAGS
+could only result in many per-project changes to override
+Libtool's ARFLAGS default, just to silent such warnings.
+
+Fixes bug#19967.  Reported by Eric Blake.
+
+* m4/libtool.m4 (_LT_PROG_AR): Default AR_FLAGS to 'cr'.
+(_LT_REQUIRED_DARWIN_CHECKS): Use $AR_FLAGS instead 'cru' string.
+* doc/libtool.texi: Do 's/ar cru/ar cr/' in whole documentation.
+* NEWS: Document.
+
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=418129bc63afc312701e84cb8afa5ca413df1ab5]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ NEWS             |  4 ++++
+ doc/libtool.texi | 10 +++++-----
+ m4/libtool.m4    |  6 +++---
+ 3 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 71a932d..1518f09 100644
+--- a/NEWS
++++ b/NEWS
+@@ -13,6 +13,10 @@ NEWS - list of user-visible changes between releases of GNU Libtool
+     variable, which obsoletes AR_FLAGS.  This is due to naming conventions
+     among other *FLAGS and to be consistent with Automake's ARFLAGS.
+ 
++** Important incompatible changes:
++
++  - Libtool changed ARFLAGS/AR_FLAGS default from 'cru' to 'cr'.
++
+ ** Bug fixes:
+ 
+   - Fix a race condition in ltdl dryrun test that would cause spurious
+diff --git a/doc/libtool.texi b/doc/libtool.texi
+index 0298627..4c664bb 100644
+--- a/doc/libtool.texi
++++ b/doc/libtool.texi
+@@ -602,7 +602,7 @@ Without libtool, the programmer would invoke the @command{ar} command to
+ create a static library:
+ 
+ @example
+-burger$ @kbd{ar cru libhello.a hello.o foo.o}
++burger$ @kbd{ar cr libhello.a hello.o foo.o}
+ burger$
+ @end example
+ 
+@@ -632,7 +632,7 @@ libtool are the same ones you would use to produce an executable named
+ a23$ @kbd{libtool --mode=link gcc -g -O -o libhello.la foo.o hello.o}
+ *** Warning: Linking the shared library libhello.la against the
+ *** non-libtool objects foo.o hello.o is not portable!
+-ar cru .libs/libhello.a
++ar cr .libs/libhello.a
+ ranlib .libs/libhello.a
+ creating libhello.la
+ (cd .libs && rm -f libhello.la && ln -s ../libhello.la libhello.la)
+@@ -662,7 +662,7 @@ archive, not a shared library (@pxref{Static libraries}).}:
+ @example
+ a23$ @kbd{libtool --mode=link gcc -g -O -o libhello.la foo.lo hello.lo \
+                 -rpath /usr/local/lib -lm}
+-ar cru @value{objdir}/libhello.a foo.o hello.o
++ar cr @value{objdir}/libhello.a foo.o hello.o
+ ranlib @value{objdir}/libhello.a
+ creating libhello.la
+ (cd @value{objdir} && rm -f libhello.la && ln -s ../libhello.la libhello.la)
+@@ -676,7 +676,7 @@ burger$ @kbd{libtool --mode=link gcc -g -O -o libhello.la foo.lo hello.lo \
+                 -rpath /usr/local/lib -lm}
+ rm -fr  @value{objdir}/libhello.a @value{objdir}/libhello.la
+ ld -Bshareable -o @value{objdir}/libhello.so.0.0 @value{objdir}/foo.o @value{objdir}/hello.o -lm
+-ar cru @value{objdir}/libhello.a foo.o hello.o
++ar cr @value{objdir}/libhello.a foo.o hello.o
+ ranlib @value{objdir}/libhello.a
+ creating libhello.la
+ (cd @value{objdir} && rm -f libhello.la && ln -s ../libhello.la libhello.la)
+@@ -6001,7 +6001,7 @@ in cases where it is necessary.
+ @subsection Archivers
+ 
+ On all known systems, building a static library can be accomplished by
+-running @kbd{ar cru lib@var{name}.a @var{obj1}.o @var{obj2}.o @dots{}},
++running @kbd{ar cr lib@var{name}.a @var{obj1}.o @var{obj2}.o @dots{}},
+ where the @file{.a} file is the output library, and each @file{.o} file is an
+ object file.
+ 
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index 6514196..add06ee 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1041,8 +1041,8 @@ int forced_loaded() { return 2;}
+ _LT_EOF
+       echo "$LTCC $LTCFLAGS -c -o conftest.o conftest.c" >&AS_MESSAGE_LOG_FD
+       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&AS_MESSAGE_LOG_FD
+-      echo "$AR cru libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
+-      $AR cru libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
++      echo "$AR $AR_FLAGS libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
++      $AR $AR_FLAGS libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
+       echo "$RANLIB libconftest.a" >&AS_MESSAGE_LOG_FD
+       $RANLIB libconftest.a 2>&AS_MESSAGE_LOG_FD
+       cat > conftest.c << _LT_EOF
+@@ -1505,7 +1505,7 @@ _LT_DECL([], [AR], [1], [The archiver])
+ # ARFLAGS for automake and AR_FLAGS for libtool).  FIXME: Make the AR_FLAGS
+ # variable obsoleted/removed.
+ 
+-test ${AR_FLAGS+y} || AR_FLAGS=${ARFLAGS-cru}
++test ${AR_FLAGS+y} || AR_FLAGS=${ARFLAGS-cr}
+ lt_ar_flags=$AR_FLAGS
+ _LT_DECL([], [lt_ar_flags], [0], [Flags to create an archive (by configure)])
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch b/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
new file mode 100644
index 0000000000..614961a256
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/libool.m4-add-ARFLAGS-variable.patch
@@ -0,0 +1,77 @@
+From 4335de1dfb7d2ec728427e07a54136b94a2d40f6 Mon Sep 17 00:00:00 2001
+From: Pavel Raiskup <praiskup@redhat.com>
+Date: Fri, 17 Apr 2015 15:05:42 +0200
+Subject: libool.m4: add ARFLAGS variable
+
+Libtool has used $AR_FLAGS since 2000-05-29 commit
+8300de4c54e6f04f0d, Automake ARFLAGS since 2003-04-06 commit
+a71b3490639831ca.  Even though ARFLAGS is younger, it sounds like
+better name according GNU Coding Standards.
+
+Related to bug#20082.
+
+* m4/libtool.m4 (_LT_PROG_AR): Copy ARFLAGS value into AR_FLAGS
+variable if AR_FLAGS is not set.  Add new _LT_DECL'ed variable
+'lt_ar_flags' to keep the configure-time value of AR_FLAGS.  The
+new 'lt_ar_flags' is to be used as the default value for AR_FLAGS
+at libtool-runtime.
+* NEWS: Document.
+
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=4335de1dfb7d2ec728427e07a54136b94a2d40f6]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ NEWS          |  6 ++++++
+ m4/libtool.m4 | 17 +++++++++++++++--
+ 2 files changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index d7ca434..71a932d 100644
+--- a/NEWS
++++ b/NEWS
+@@ -7,6 +7,12 @@ NEWS - list of user-visible changes between releases of GNU Libtool
+   - LT_SYS_LIBRARY_PATH can be set in config.site, or at configure time
+     and persists correctly in the generated libtool script.
+ 
++** New features:
++
++  - Libtool script now supports (configure-time and runtime) ARFLAGS
++    variable, which obsoletes AR_FLAGS.  This is due to naming conventions
++    among other *FLAGS and to be consistent with Automake's ARFLAGS.
++
+ ** Bug fixes:
+ 
+   - Fix a race condition in ltdl dryrun test that would cause spurious
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index 63acd09..6514196 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1497,9 +1497,22 @@ need_locks=$enable_libtool_lock
+ m4_defun([_LT_PROG_AR],
+ [AC_CHECK_TOOLS(AR, [ar], false)
+ : ${AR=ar}
+-: ${AR_FLAGS=cru}
+ _LT_DECL([], [AR], [1], [The archiver])
+-_LT_DECL([], [AR_FLAGS], [1], [Flags to create an archive])
++
++# Use ARFLAGS variable as AR's operation code to sync the variable naming with
++# Automake.  If both AR_FLAGS and ARFLAGS are specified, AR_FLAGS should have
++# higher priority because thats what people were doing historically (setting
++# ARFLAGS for automake and AR_FLAGS for libtool).  FIXME: Make the AR_FLAGS
++# variable obsoleted/removed.
++
++test ${AR_FLAGS+y} || AR_FLAGS=${ARFLAGS-cru}
++lt_ar_flags=$AR_FLAGS
++_LT_DECL([], [lt_ar_flags], [0], [Flags to create an archive (by configure)])
++
++# Make AR_FLAGS overridable by 'make ARFLAGS='.  Don't try to run-time override
++# by AR_FLAGS because that was never working and AR_FLAGS is about to die.
++_LT_DECL([], [AR_FLAGS], [\@S|@{ARFLAGS-"\@S|@lt_ar_flags"}],
++         [Flags to create an archive])
+ 
+ AC_CACHE_CHECK([for archiver @FILE support], [lt_cv_ar_at_file],
+   [lt_cv_ar_at_file=no
+-- 
+2.23.0
+
-- 
2.17.1


