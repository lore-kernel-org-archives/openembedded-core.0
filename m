Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BD7457FC02
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 20:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 470tFk3Z10zK1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 22:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572122538;
	bh=jHKaHGUAiSqp/Z4nO2dnrR0UK7ENmo7qOa1z9q8j1W0=;
	h=From:To:Subject:Date:From;
	b=sMhBdMR7DLR41YHTz3SCceodKf4RK1g6lPF8xWCYVKWOdoy9U1Dow4paTIjYHg5IE
	hSs6AT3Qdnv9+4WzTlBClLEUmrYrKmtBD2hV1h+I5gxVQUVp34qRIfcd+BEidm2JjJ
	TffL2bUIjh78Q/yQOyZjapLQOzYDjGUCL2exoNFSll5H1hifHKlDs85aCGmsZEuHCc
	FrC+iUzhQEzOsvc5bR9oXuTlS6Am/h95LZLWrC0WUbgM7GCu/2w62QMEXbolN3xbWZ
	hBzTs3fb3h4OocCUVOWo1jtESG3jYRJx8LBrxkZ7LetDSEqwEgj8F3B87p27b+uwOe
	4Qclgdm2zy3d+N62WfPv0x9D/bUpTG4ZneNVpCcfl7jxrKtdrWjtaRB6Qi2Pqjvfs0
	3301sG0VeQZBpoeUC3gbT1M5KK5kr25ayTjv530FPix0RmBwcYCPABmofwo5kUIK+9
	sfEbxAnOc9/S23ii4a9bdmgvbnl6fNZiWk0bUOadsmnmCc65wzta5unyD+LKZ4b1Vv
	KKKhuWil8dmOiKCedJ84S59zOQpQd8bg4LzXjMfNLS9X4PSeqgGwwxR9xYP66EGsJf
	sRwKhlULyE1SqR+BnswFBk7TiRR1UKixjl7qVGtiE0FuhXW6hWb6dQ79kqSQYaTcsn
	QMLg4busldxjZ5XzagkW2QA0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Oct 2019 23:42:14 +0300
Message-Id: <20191026204216.9298-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] screen: Upgrade 4.6.2 -> 4.7.0
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
X-List-Received-Date: Sat, 26 Oct 2019 20:42:19 -0000

Patches applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-configure-failed-while-build-dir-ha.patch | 109 --------------
 ...void-mis-identifying-systems-as-SVR4.patch |  57 --------
 ...-compile-alternatives-for-AC_TRY_RUN.patch | 137 ------------------
 ...ove-redundant-compiler-sanity-checks.patch |  65 ---------
 ...e-system-checks-when-cross-compiling.patch | 135 -----------------
 .../{screen_4.6.2.bb => screen_4.7.0.bb}      |   9 +-
 6 files changed, 2 insertions(+), 510 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
 delete mode 100644 meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
 delete mode 100644 meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
 delete mode 100644 meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
 delete mode 100644 meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
 rename meta/recipes-extended/screen/{screen_4.6.2.bb => screen_4.7.0.bb} (78%)

diff --git a/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch b/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
deleted file mode 100644
index 1274b27940..0000000000
--- a/meta/recipes-extended/screen/screen/0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 4b258c5a9078f8df60684ab7536ce3a8ff207e08 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 12 Oct 2017 10:03:57 +0000
-Subject: [PATCH] configure.ac: fix configure failed while build dir contains "yes"
-
-While the name of build dir contains "yes", the AC_EGREP_CPP
-test always return true.
-
-We rarely use "yes;" to name build dir, so s/yes/yes;/g
-could fix the issue
-
-Upstream-Status: Accepted
-https://git.savannah.gnu.org/cgit/screen.git/commit/?h=screen-v4&id=8c2b4061d16756ee2ed37f08db063b8215656943
-
-Signed-off-by: Jian Kang <jian.kang@windriver.com>
----
- configure.ac | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 12996cd..4765af6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -128,7 +128,7 @@ fi
- 
- 
- AC_CHECKING(for Ultrix)
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#if defined(ultrix) || defined(__ultrix)
-    yes;
- #endif
-@@ -145,7 +145,7 @@ dnl ghazi@caip.rutgers.edu (Kaveh R. Ghazi):
- dnl BBN butterfly is not POSIX, but a MACH BSD system.
- dnl Do not define POSIX and TERMIO.
- AC_CHECKING(for butterfly)
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#if defined(butterfly)
-   yes;
- #endif
-@@ -156,7 +156,7 @@ if test -n "$ULTRIX"; then
-   test -z "$GCC" && CC="$CC -YBSD"
- fi
- AC_CHECKING(for POSIX.1)
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#include <sys/types.h>
- #include <unistd.h>
- main () {
-@@ -173,14 +173,14 @@ AC_TRY_COMPILE(
- #include <fcntl.h>], [int x = SIGCHLD | FNDELAY;], , AC_DEFINE(SYSV))
- 
- AC_CHECKING(for sequent/ptx)
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#ifdef _SEQUENT_
-   yes;
- #endif
- ], LIBS="$LIBS -lsocket -linet";seqptx=1)
- 
- AC_CHECKING(SVR4)
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [main () {
- #if defined(SVR4) || defined(__SVR4)
-   yes;
-@@ -200,9 +200,9 @@ fi
- AC_CHECK_HEADERS([stropts.h string.h strings.h])
- 
- AC_CHECKING(for Solaris 2.x)
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#if defined(SVR4) && defined(sun)
--  yes
-+  yes;
- #endif
- ], LIBS="$LIBS -lsocket -lnsl -lkstat")
- 
-@@ -697,7 +697,7 @@ else
- pdir='/dev'
- fi
- dnl SCO uses ptyp%d
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#ifdef M_UNIX
-    yes;
- #endif
-@@ -880,7 +880,7 @@ fi
- )
- 
- if test -z "$load" ; then
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#if defined(NeXT) || defined(apollo) || defined(linux)
-   yes;
- #endif
-@@ -1112,7 +1112,7 @@ AC_CHECKING(syslog in libbsd.a)
- AC_TRY_LINK(, [closelog();], AC_NOTE(- found.), [LIBS="$oldlibs"
- AC_NOTE(- bad news: syslog missing.) AC_DEFINE(NOSYSLOG)])])
- 
--AC_EGREP_CPP(yes,
-+AC_EGREP_CPP(yes;,
- [#ifdef M_UNIX
-    yes;
- #endif
--- 
-2.13.3
-
diff --git a/meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch b/meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
deleted file mode 100644
index e184aa1f31..0000000000
--- a/meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 79afb676904653403145fda9e1a6a9d3ea1cb22a Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Aug 2015 11:10:32 +0300
-Subject: [PATCH 4/4] Avoid mis-identifying systems as SVR4
-
-Linux can be misdetected as SVR4 because it has
-libelf installed. This leads to linking with libelf, even though no
-symbols from that library were actually used, and to a workaround for
-a buggy getlogin() being enabled.
-
-It is not documented which exact SVR4 system had the bug that the
-workaround was added for, so all I could do is make an educated guess
-at the #defines its compiler would be likely to set.
-
-Modified from patch by Maarten ter Huurne.
-
-Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index dc928ae..65439ce 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -179,14 +179,24 @@ AC_EGREP_CPP(yes,
- #endif
- ], LIBS="$LIBS -lsocket -linet";seqptx=1)
- 
-+AC_CHECKING(SVR4)
-+AC_EGREP_CPP(yes,
-+[main () {
-+#if defined(SVR4) || defined(__SVR4)
-+  yes;
-+#endif
-+], AC_NOTE(- you have a SVR4 system) AC_DEFINE(SVR4) svr4=1)
-+if test -n "$svr4" ; then
- oldlibs="$LIBS"
- LIBS="$LIBS -lelf"
- AC_CHECKING(SVR4)
- AC_TRY_LINK([#include <utmpx.h>
- ],,
--[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN),
--[AC_CHECK_HEADER(elf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN))])]
-+[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(BUGGYGETLOGIN),
-+[AC_CHECK_HEADER(elf.h, AC_DEFINE(BUGGYGETLOGIN))])]
- ,LIBS="$oldlibs")
-+fi
-+
- AC_CHECK_HEADERS([stropts.h string.h strings.h])
- 
- AC_CHECKING(for Solaris 2.x)
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch b/meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
deleted file mode 100644
index 248bf087e2..0000000000
--- a/meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From cd0f7f10a3fffbc60fe55eb200474d13fe1da65b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Aug 2015 10:34:29 +0300
-Subject: [PATCH 2/4] Provide cross compile alternatives for AC_TRY_RUN
-
-Modified from patch by Maarten ter Huurne.
-
-Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 32 ++++++++++++++++++++------------
- 1 file changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 27690a6..ce89f56 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -348,7 +348,8 @@ main()
-   exit(0);
- }
- ], AC_NOTE(- your fifos are usable) fifo=1,
--AC_NOTE(- your fifos are not usable))
-+AC_NOTE(- your fifos are not usable),
-+AC_NOTE(- skipping check because we are cross compiling; assuming fifos are usable) fifo=1)
- rm -f /tmp/conftest*
- 
- if test -n "$fifo"; then
-@@ -396,7 +397,8 @@ main()
-   exit(0);
- }
- ], AC_NOTE(- your implementation is ok), 
--AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1)
-+AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1,
-+AC_NOTE(- skipping check because we are cross compiling; assuming fifo implementation is ok))
- rm -f /tmp/conftest*
- fi
- 
-@@ -458,7 +460,8 @@ main()
-   exit(0);
- }
- ], AC_NOTE(- your sockets are usable) sock=1,
--AC_NOTE(- your sockets are not usable))
-+AC_NOTE(- your sockets are not usable),
-+AC_NOTE(- skipping check because we are cross compiling; assuming sockets are usable) sock=1)
- rm -f /tmp/conftest*
- 
- if test -n "$sock"; then
-@@ -497,7 +500,8 @@ main()
- }
- ],AC_NOTE(- you are normal),
- AC_NOTE(- unix domain sockets are not kept in the filesystem)
--AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1)
-+AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1,
-+AC_NOTE(- skipping check because we are cross compiling; assuming sockets are normal))
- rm -f /tmp/conftest*
- fi
- 
-@@ -624,7 +628,8 @@ main()
-   exit(0);
- }
- ],AC_NOTE(- select is ok),
--AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN))
-+AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN),
-+AC_NOTE(- skipping check because we are cross compiling; assuming select is ok))
- 
- dnl
- dnl    ****  termcap or terminfo  ****
-@@ -666,7 +671,8 @@ main()
- {
-  exit(strcmp(tgoto("%p1%d", 0, 1), "1") ? 0 : 1);
- }], AC_NOTE(- you use the termcap database),
--AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO))
-+AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO),
-+AC_NOTE(- skipping check because we are cross compiling; assuming terminfo database is used) AC_DEFINE(TERMINFO))
- AC_CHECKING(ospeed)
- AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
- 
-@@ -801,7 +807,8 @@ main()
-     else
-       AC_NOTE(- can't determine - assume ptys are world accessable)
-     fi
--  ]
-+  ],
-+  AC_NOTE(- skipping check because we are cross compiling; assuming ptys are world accessable)
- )
- rm -f conftest_grp
- fi
-@@ -885,7 +892,7 @@ AC_EGREP_CPP(yes,
- #endif
- ], load=1)
- fi
--if test -z "$load" ; then
-+if test -z "$load" && test "$cross_compiling" = no ; then
- AC_CHECKING(for kernelfile)
- for core in /unix /vmunix /dynix /hp-ux /xelos /dev/ksyms /kernel/unix /kernel/genunix /unicos /mach /netbsd /386bsd /dgux /bsd /stand/vmunix; do
-   if test -f $core || test -c $core; then
-@@ -1078,7 +1085,7 @@ main()
- #endif
-   exit(0);
- }
--],,AC_DEFINE(SYSVSIGS))
-+],,AC_DEFINE(SYSVSIGS),:)
- 
- fi
- 
-@@ -1158,7 +1165,7 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEBCOPY))
-+}], AC_DEFINE(USEBCOPY),,:)
- 
- AC_TRY_RUN([
- #define bcopy(s,d,l) memmove(d,s,l)
-@@ -1173,7 +1180,8 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEMEMMOVE))
-+}], AC_DEFINE(USEMEMMOVE),,
-+  AC_NOTE(- skipping check because we are cross compiling; use memmove) AC_DEFINE(USEMEMMOVE))
- 
- 
- AC_TRY_RUN([
-@@ -1189,7 +1197,7 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEMEMCPY))
-+}], AC_DEFINE(USEMEMCPY),,:)
- 
- AC_SYS_LONG_FILE_NAMES
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch b/meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
deleted file mode 100644
index cc62c12e05..0000000000
--- a/meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 73b726c25f94c1b15514ed9249b927afdfbbfb94 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Aug 2015 10:30:40 +0300
-Subject: [PATCH 1/4] Remove redundant compiler sanity checks
-
-AC_PROG_CC already performs sanity checks. And unlike the removed
-checks, it does so in a way that supports cross compilation.
-
-Modified from patch by Maarten ter Huurne.
-
-Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 27 ---------------------------
- 1 file changed, 27 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ffe2e37..27690a6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,31 +48,6 @@ AC_PROG_GCC_TRADITIONAL
- AC_ISC_POSIX
- AC_USE_SYSTEM_EXTENSIONS
- 
--AC_TRY_RUN(main(){exit(0);},,[
--if test $CC != cc ; then
--AC_NOTE(Your $CC failed - restarting with CC=cc)
--AC_NOTE()
--CC=cc
--export CC
--exec $0 $configure_args
--fi
--])
--
--AC_TRY_RUN(main(){exit(0);},,
--exec 5>&2
--eval $ac_link
--AC_NOTE(CC=$CC; CFLAGS=$CFLAGS; LIBS=$LIBS;)
--AC_NOTE($ac_compile)
--AC_MSG_ERROR(Can't run the compiler - sorry))
--
--AC_TRY_RUN([
--main()
--{
--  int __something_strange_();
--  __something_strange_(0);
--}
--],AC_MSG_ERROR(Your compiler does not set the exit status - sorry))
--
- AC_PROG_AWK
- 
- AC_PROG_INSTALL
-@@ -1300,8 +1275,6 @@ fi
- dnl Ptx bug workaround -- insert -lc after -ltermcap
- test -n "$seqptx" && LIBS="-ltermcap -lc -lsocket -linet -lnsl -lsec -lseq"
- 
--AC_TRY_RUN(main(){exit(0);},,AC_MSG_ERROR(Can't run the compiler - internal error. Sorry.))
--
- ETCSCREENRC=
- AC_MSG_CHECKING(for the global screenrc file)
- AC_ARG_WITH(sys-screenrc, [  --with-sys-screenrc=path to the global screenrc file], [ ETCSCREENRC="${withval}" ])
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch b/meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
deleted file mode 100644
index d7e55a4451..0000000000
--- a/meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From d0b20e4cacc60ad62a2150ce07388cb5a25c2040 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Aug 2015 11:09:01 +0300
-Subject: [PATCH 3/4] Skip host file system checks when cross-compiling
-
-Modified from patch by Maarten ter Huurne.
-
-Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 23 +++++++++++++++++++----
- 1 file changed, 19 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ce89f56..dc928ae 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -85,7 +85,7 @@ AC_ARG_ENABLE(socket-dir,
- dnl
- dnl    ****  special unix variants  ****
- dnl
--if test -n "$ISC"; then
-+if test "$cross_compiling" = no && test -n "$ISC" ; then
-   AC_DEFINE(ISC) LIBS="$LIBS -linet"
- fi
- 
-@@ -96,10 +96,11 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
- dnl fi
- dnl fi
- 
--if test -f /sysV68 ; then
-+if test "$cross_compiling" = no && test -f /sysV68 ; then
- AC_DEFINE(sysV68)
- fi
- 
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for MIPS)
- if test -f /lib/libmld.a || test -f /usr/lib/libmld.a || test -f /usr/lib/cmplrs/cc/libmld.a; then
- oldlibs="$LIBS"
-@@ -123,6 +124,7 @@ AC_DEFINE(USE_WAIT2) LIBS="$LIBS -lbsd" ; CC="$CC -I/usr/include/bsd"
- ))
- fi
- fi
-+fi
- 
- 
- AC_CHECKING(for Ultrix)
-@@ -132,7 +134,7 @@ AC_EGREP_CPP(yes,
- #endif
- ], ULTRIX=1)
- 
--if test -f /usr/lib/libpyr.a ; then
-+if test "$cross_compiling" = no && test -f /usr/lib/libpyr.a ; then
- oldlibs="$LIBS"
- LIBS="$LIBS -lpyr"
- AC_CHECKING(Pyramid OSX)
-@@ -679,17 +681,21 @@ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
- dnl
- dnl    ****  PTY specific things  ****
- dnl
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for /dev/ptc)
- if test -r /dev/ptc; then
- AC_DEFINE(HAVE_DEV_PTC)
- fi
-+fi
- 
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for SVR4 ptys)
- sysvr4ptys=
- if test -c /dev/ptmx ; then
- AC_TRY_LINK([],[ptsname(0);grantpt(0);unlockpt(0);],[AC_DEFINE(HAVE_SVR4_PTYS)
- sysvr4ptys=1])
- fi
-+fi
- 
- AC_CHECK_FUNCS(getpt)
- 
-@@ -699,6 +705,7 @@ AC_CHECK_FUNCS(openpty,,
- [AC_CHECK_LIB(util,openpty, [AC_DEFINE(HAVE_OPENPTY)] [LIBS="$LIBS -lutil"])])
- fi
- 
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for ptyranges)
- if test -d /dev/ptym ; then
- pdir='/dev/ptym'
-@@ -722,6 +729,7 @@ p1=`echo $ptys | tr ' ' '\012' | sed -e 's/^.*\(.\)$/\1/g'  | sort -u | tr -d '\
- AC_DEFINE_UNQUOTED(PTYRANGE0,"$p0")
- AC_DEFINE_UNQUOTED(PTYRANGE1,"$p1")
- fi
-+fi
- 
- dnl    ****  pty mode/group handling ****
- dnl
-@@ -869,14 +877,16 @@ fi
- dnl
- dnl    ****  loadav  ****
- dnl
-+if test "$cross_compiling" = no ; then
- AC_CHECKING(for libutil(s))
- test -f /usr/lib/libutils.a && LIBS="$LIBS -lutils"
- test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
-+fi
- 
- AC_CHECKING(getloadavg)
- AC_TRY_LINK(,[getloadavg((double *)0, 0);],
- AC_DEFINE(LOADAV_GETLOADAVG) load=1,
--if test -f /usr/lib/libkvm.a ; then
-+if test "$cross_compiling" = no && test -f /usr/lib/libkvm.a ; then
- olibs="$LIBS"
- LIBS="$LIBS -lkvm"
- AC_CHECKING(getloadavg with -lkvm)
-@@ -1094,13 +1104,18 @@ dnl    ****  libraries  ****
- dnl
- 
- AC_CHECKING(for crypt and sec libraries)
-+if test "$cross_compiling" = no ; then
- test -f /lib/libcrypt_d.a || test -f /usr/lib/libcrypt_d.a && LIBS="$LIBS -lcrypt_d"
-+fi
- oldlibs="$LIBS"
- LIBS="$LIBS -lcrypt"
- AC_CHECKING(crypt)
- AC_TRY_LINK(,,,LIBS="$oldlibs")
-+if test "$cross_compiling" = no ; then
- test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
- test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
-+fi
-+
- oldlibs="$LIBS"
- LIBS="$LIBS -lsun"
- AC_CHECKING(IRIX sun library)
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/screen/screen_4.6.2.bb b/meta/recipes-extended/screen/screen_4.7.0.bb
similarity index 78%
rename from meta/recipes-extended/screen/screen_4.6.2.bb
rename to meta/recipes-extended/screen/screen_4.7.0.bb
index 21b476ddb0..67aa5f1fc6 100644
--- a/meta/recipes-extended/screen/screen_4.6.2.bb
+++ b/meta/recipes-extended/screen/screen_4.7.0.bb
@@ -17,18 +17,13 @@ RDEPENDS_${PN} = "base-files"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
-           file://Remove-redundant-compiler-sanity-checks.patch \
-           file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
-           file://Skip-host-file-system-checks-when-cross-compiling.patch \
-           file://Avoid-mis-identifying-systems-as-SVR4.patch \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
-           file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
           "
 
-SRC_URI[md5sum] = "a0f529d3333b128dfaa324d978ba73a8"
-SRC_URI[sha256sum] = "1b6922520e6a0ce5e28768d620b0f640a6631397f95ccb043b70b91bb503fa3a"
+SRC_URI[md5sum] = "b8971ebd68d046f2814d1040cb8e6641"
+SRC_URI[sha256sum] = "da775328fa783bd2a787d722014dbd99c6093effc11f337827604c2efc5d20c1"
 
 inherit autotools texinfo
 
-- 
2.17.1


