Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1623EC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504050"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504050"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298254"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 23/33] libtool: change the default AR_FLAGS from
 "cru" to "cr"
Date: Thu,  9 Dec 2021 09:29:22 +0800
Message-Id: 
 <1e95bed5e6fae2f80a5b83bcd52bef9777cd48eb.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159424

From: Li Wang <li.wang@windriver.com>

Backport patch to fix warning:
`u' modifier ignored since `D' is the default (see `U')

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d5092e7ee63fb8119a22b3d9de1f23e94791b56)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index 0000000000..447640cef6
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
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=418129bc63afc312701e84cb8afa5ca413df1ab5]
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
index 0000000000..bb11887cda
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
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=4335de1dfb7d2ec728427e07a54136b94a2d40f6]
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
2.33.1


