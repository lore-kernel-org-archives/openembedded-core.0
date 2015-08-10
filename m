Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C8EF97685E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:07:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2015 05:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="780435981"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2015 05:06:56 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 15:08:21 +0300
Message-Id: <bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
References: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439204506.git.jussi.kukkonen@intel.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Mon, 10 Aug 2015 12:07:31 -0000

The Debian diff in SRC_URI only added a debian/-directory in to the
source tree and did not modify upstream source: So it does nothing.
This commit removes the diff and does _not_ try to apply the 19000
lines of patches in debian/patches. Any useful patches should be
added separately.

* Preserve the old 4.0.3 version (GPLv2+) and add new 4.3.1 (GPLv3+)
* Remove unused debian patch from SRC_URI of 4.0.3, increase PR
* Add a patchset to enable cross-compiling 4.3.1 (modified from
  http://savannah.gnu.org/bugs/?43223)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-extended/screen/screen.inc            |  39 ++++++
 .../Avoid-mis-identifying-systems-as-SVR4.patch    |  57 +++++++++
 ...cross-compile-alternatives-for-AC_TRY_RUN.patch | 137 +++++++++++++++++++++
 .../Remove-redundant-compiler-sanity-checks.patch  |  65 ++++++++++
 ...t-file-system-checks-when-cross-compiling.patch | 135 ++++++++++++++++++++
 .../fix-parallel-make.patch                        |   0
 .../screen/{screen-4.0.3 => screen}/screen.pam     |   0
 meta/recipes-extended/screen/screen_4.0.3.bb       |  55 ++-------
 meta/recipes-extended/screen/screen_4.3.1.bb       |  13 ++
 9 files changed, 453 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-extended/screen/screen.inc
 create mode 100644 meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
 create mode 100644 meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
 create mode 100644 meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
 create mode 100644 meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/fix-parallel-make.patch (100%)
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/screen.pam (100%)
 create mode 100644 meta/recipes-extended/screen/screen_4.3.1.bb

diff --git a/meta/recipes-extended/screen/screen.inc b/meta/recipes-extended/screen/screen.inc
new file mode 100644
index 0000000..1ae321d
--- /dev/null
+++ b/meta/recipes-extended/screen/screen.inc
@@ -0,0 +1,39 @@
+SUMMARY = "Multiplexing terminal manager"
+DESCRIPTION = "Screen is a full-screen window manager \
+that multiplexes a physical terminal between several \
+processes, typically interactive shells."
+HOMEPAGE = "http://www.gnu.org/software/screen/"
+BUGTRACKER = "https://savannah.gnu.org/bugs/?func=additem&group=screen"
+
+SECTION = "console/utils"
+DEPENDS = "ncurses \
+          ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} = "base-files"
+
+SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
+           file://fix-parallel-make.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://screen.pam"
+
+inherit autotools texinfo
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
+
+EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
+               ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+
+do_install_append () {
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
+		install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
+	fi
+}
+
+pkg_postinst_${PN} () {
+	grep -q "^${bindir}/screen$" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
+}
+
+pkg_postrm_${PN} () {
+	printf "$(grep -v "^${bindir}/screen$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
+}
diff --git a/meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch b/meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
new file mode 100644
index 0000000..e184aa1
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
@@ -0,0 +1,57 @@
+From 79afb676904653403145fda9e1a6a9d3ea1cb22a Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 7 Aug 2015 11:10:32 +0300
+Subject: [PATCH 4/4] Avoid mis-identifying systems as SVR4
+
+Linux can be misdetected as SVR4 because it has
+libelf installed. This leads to linking with libelf, even though no
+symbols from that library were actually used, and to a workaround for
+a buggy getlogin() being enabled.
+
+It is not documented which exact SVR4 system had the bug that the
+workaround was added for, so all I could do is make an educated guess
+at the #defines its compiler would be likely to set.
+
+Modified from patch by Maarten ter Huurne.
+
+Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dc928ae..65439ce 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -179,14 +179,24 @@ AC_EGREP_CPP(yes,
+ #endif
+ ], LIBS="$LIBS -lsocket -linet";seqptx=1)
+ 
++AC_CHECKING(SVR4)
++AC_EGREP_CPP(yes,
++[main () {
++#if defined(SVR4) || defined(__SVR4)
++  yes;
++#endif
++], AC_NOTE(- you have a SVR4 system) AC_DEFINE(SVR4) svr4=1)
++if test -n "$svr4" ; then
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lelf"
+ AC_CHECKING(SVR4)
+ AC_TRY_LINK([#include <utmpx.h>
+ ],,
+-[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN),
+-[AC_CHECK_HEADER(elf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN))])]
++[AC_CHECK_HEADER(dwarf.h, AC_DEFINE(BUGGYGETLOGIN),
++[AC_CHECK_HEADER(elf.h, AC_DEFINE(BUGGYGETLOGIN))])]
+ ,LIBS="$oldlibs")
++fi
++
+ AC_CHECK_HEADERS([stropts.h string.h strings.h])
+ 
+ AC_CHECKING(for Solaris 2.x)
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch b/meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
new file mode 100644
index 0000000..248bf08
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
@@ -0,0 +1,137 @@
+From cd0f7f10a3fffbc60fe55eb200474d13fe1da65b Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 7 Aug 2015 10:34:29 +0300
+Subject: [PATCH 2/4] Provide cross compile alternatives for AC_TRY_RUN
+
+Modified from patch by Maarten ter Huurne.
+
+Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 32 ++++++++++++++++++++------------
+ 1 file changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 27690a6..ce89f56 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -348,7 +348,8 @@ main()
+   exit(0);
+ }
+ ], AC_NOTE(- your fifos are usable) fifo=1,
+-AC_NOTE(- your fifos are not usable))
++AC_NOTE(- your fifos are not usable),
++AC_NOTE(- skipping check because we are cross compiling; assuming fifos are usable) fifo=1)
+ rm -f /tmp/conftest*
+ 
+ if test -n "$fifo"; then
+@@ -396,7 +397,8 @@ main()
+   exit(0);
+ }
+ ], AC_NOTE(- your implementation is ok), 
+-AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1)
++AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1,
++AC_NOTE(- skipping check because we are cross compiling; assuming fifo implementation is ok))
+ rm -f /tmp/conftest*
+ fi
+ 
+@@ -458,7 +460,8 @@ main()
+   exit(0);
+ }
+ ], AC_NOTE(- your sockets are usable) sock=1,
+-AC_NOTE(- your sockets are not usable))
++AC_NOTE(- your sockets are not usable),
++AC_NOTE(- skipping check because we are cross compiling; assuming sockets are usable) sock=1)
+ rm -f /tmp/conftest*
+ 
+ if test -n "$sock"; then
+@@ -497,7 +500,8 @@ main()
+ }
+ ],AC_NOTE(- you are normal),
+ AC_NOTE(- unix domain sockets are not kept in the filesystem)
+-AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1)
++AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1,
++AC_NOTE(- skipping check because we are cross compiling; assuming sockets are normal))
+ rm -f /tmp/conftest*
+ fi
+ 
+@@ -624,7 +628,8 @@ main()
+   exit(0);
+ }
+ ],AC_NOTE(- select is ok),
+-AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN))
++AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN),
++AC_NOTE(- skipping check because we are cross compiling; assuming select is ok))
+ 
+ dnl
+ dnl    ****  termcap or terminfo  ****
+@@ -666,7 +671,8 @@ main()
+ {
+  exit(strcmp(tgoto("%p1%d", 0, 1), "1") ? 0 : 1);
+ }], AC_NOTE(- you use the termcap database),
+-AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO))
++AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO),
++AC_NOTE(- skipping check because we are cross compiling; assuming terminfo database is used) AC_DEFINE(TERMINFO))
+ AC_CHECKING(ospeed)
+ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
+ 
+@@ -801,7 +807,8 @@ main()
+     else
+       AC_NOTE(- can't determine - assume ptys are world accessable)
+     fi
+-  ]
++  ],
++  AC_NOTE(- skipping check because we are cross compiling; assuming ptys are world accessable)
+ )
+ rm -f conftest_grp
+ fi
+@@ -885,7 +892,7 @@ AC_EGREP_CPP(yes,
+ #endif
+ ], load=1)
+ fi
+-if test -z "$load" ; then
++if test -z "$load" && test "$cross_compiling" = no ; then
+ AC_CHECKING(for kernelfile)
+ for core in /unix /vmunix /dynix /hp-ux /xelos /dev/ksyms /kernel/unix /kernel/genunix /unicos /mach /netbsd /386bsd /dgux /bsd /stand/vmunix; do
+   if test -f $core || test -c $core; then
+@@ -1078,7 +1085,7 @@ main()
+ #endif
+   exit(0);
+ }
+-],,AC_DEFINE(SYSVSIGS))
++],,AC_DEFINE(SYSVSIGS),:)
+ 
+ fi
+ 
+@@ -1158,7 +1165,7 @@ main() {
+   if (strncmp(buf, "cdedef", 6))
+     exit(1);
+   exit(0); /* libc version works properly.  */
+-}], AC_DEFINE(USEBCOPY))
++}], AC_DEFINE(USEBCOPY),,:)
+ 
+ AC_TRY_RUN([
+ #define bcopy(s,d,l) memmove(d,s,l)
+@@ -1173,7 +1180,8 @@ main() {
+   if (strncmp(buf, "cdedef", 6))
+     exit(1);
+   exit(0); /* libc version works properly.  */
+-}], AC_DEFINE(USEMEMMOVE))
++}], AC_DEFINE(USEMEMMOVE),,
++  AC_NOTE(- skipping check because we are cross compiling; use memmove) AC_DEFINE(USEMEMMOVE))
+ 
+ 
+ AC_TRY_RUN([
+@@ -1189,7 +1197,7 @@ main() {
+   if (strncmp(buf, "cdedef", 6))
+     exit(1);
+   exit(0); /* libc version works properly.  */
+-}], AC_DEFINE(USEMEMCPY))
++}], AC_DEFINE(USEMEMCPY),,:)
+ 
+ AC_SYS_LONG_FILE_NAMES
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch b/meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
new file mode 100644
index 0000000..cc62c12
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
@@ -0,0 +1,65 @@
+From 73b726c25f94c1b15514ed9249b927afdfbbfb94 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 7 Aug 2015 10:30:40 +0300
+Subject: [PATCH 1/4] Remove redundant compiler sanity checks
+
+AC_PROG_CC already performs sanity checks. And unlike the removed
+checks, it does so in a way that supports cross compilation.
+
+Modified from patch by Maarten ter Huurne.
+
+Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 27 ---------------------------
+ 1 file changed, 27 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ffe2e37..27690a6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,31 +48,6 @@ AC_PROG_GCC_TRADITIONAL
+ AC_ISC_POSIX
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+-AC_TRY_RUN(main(){exit(0);},,[
+-if test $CC != cc ; then
+-AC_NOTE(Your $CC failed - restarting with CC=cc)
+-AC_NOTE()
+-CC=cc
+-export CC
+-exec $0 $configure_args
+-fi
+-])
+-
+-AC_TRY_RUN(main(){exit(0);},,
+-exec 5>&2
+-eval $ac_link
+-AC_NOTE(CC=$CC; CFLAGS=$CFLAGS; LIBS=$LIBS;)
+-AC_NOTE($ac_compile)
+-AC_MSG_ERROR(Can't run the compiler - sorry))
+-
+-AC_TRY_RUN([
+-main()
+-{
+-  int __something_strange_();
+-  __something_strange_(0);
+-}
+-],AC_MSG_ERROR(Your compiler does not set the exit status - sorry))
+-
+ AC_PROG_AWK
+ 
+ AC_PROG_INSTALL
+@@ -1300,8 +1275,6 @@ fi
+ dnl Ptx bug workaround -- insert -lc after -ltermcap
+ test -n "$seqptx" && LIBS="-ltermcap -lc -lsocket -linet -lnsl -lsec -lseq"
+ 
+-AC_TRY_RUN(main(){exit(0);},,AC_MSG_ERROR(Can't run the compiler - internal error. Sorry.))
+-
+ ETCSCREENRC=
+ AC_MSG_CHECKING(for the global screenrc file)
+ AC_ARG_WITH(sys-screenrc, [  --with-sys-screenrc=path to the global screenrc file], [ ETCSCREENRC="${withval}" ])
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch b/meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
new file mode 100644
index 0000000..d7e55a4
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
@@ -0,0 +1,135 @@
+From d0b20e4cacc60ad62a2150ce07388cb5a25c2040 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 7 Aug 2015 11:09:01 +0300
+Subject: [PATCH 3/4] Skip host file system checks when cross-compiling
+
+Modified from patch by Maarten ter Huurne.
+
+Upstream-Status: Submitted [http://savannah.gnu.org/bugs/?43223]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ce89f56..dc928ae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -85,7 +85,7 @@ AC_ARG_ENABLE(socket-dir,
+ dnl
+ dnl    ****  special unix variants  ****
+ dnl
+-if test -n "$ISC"; then
++if test "$cross_compiling" = no && test -n "$ISC" ; then
+   AC_DEFINE(ISC) LIBS="$LIBS -linet"
+ fi
+ 
+@@ -96,10 +96,11 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
+ dnl fi
+ dnl fi
+ 
+-if test -f /sysV68 ; then
++if test "$cross_compiling" = no && test -f /sysV68 ; then
+ AC_DEFINE(sysV68)
+ fi
+ 
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for MIPS)
+ if test -f /lib/libmld.a || test -f /usr/lib/libmld.a || test -f /usr/lib/cmplrs/cc/libmld.a; then
+ oldlibs="$LIBS"
+@@ -123,6 +124,7 @@ AC_DEFINE(USE_WAIT2) LIBS="$LIBS -lbsd" ; CC="$CC -I/usr/include/bsd"
+ ))
+ fi
+ fi
++fi
+ 
+ 
+ AC_CHECKING(for Ultrix)
+@@ -132,7 +134,7 @@ AC_EGREP_CPP(yes,
+ #endif
+ ], ULTRIX=1)
+ 
+-if test -f /usr/lib/libpyr.a ; then
++if test "$cross_compiling" = no && test -f /usr/lib/libpyr.a ; then
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lpyr"
+ AC_CHECKING(Pyramid OSX)
+@@ -679,17 +681,21 @@ AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
+ dnl
+ dnl    ****  PTY specific things  ****
+ dnl
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for /dev/ptc)
+ if test -r /dev/ptc; then
+ AC_DEFINE(HAVE_DEV_PTC)
+ fi
++fi
+ 
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for SVR4 ptys)
+ sysvr4ptys=
+ if test -c /dev/ptmx ; then
+ AC_TRY_LINK([],[ptsname(0);grantpt(0);unlockpt(0);],[AC_DEFINE(HAVE_SVR4_PTYS)
+ sysvr4ptys=1])
+ fi
++fi
+ 
+ AC_CHECK_FUNCS(getpt)
+ 
+@@ -699,6 +705,7 @@ AC_CHECK_FUNCS(openpty,,
+ [AC_CHECK_LIB(util,openpty, [AC_DEFINE(HAVE_OPENPTY)] [LIBS="$LIBS -lutil"])])
+ fi
+ 
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for ptyranges)
+ if test -d /dev/ptym ; then
+ pdir='/dev/ptym'
+@@ -722,6 +729,7 @@ p1=`echo $ptys | tr ' ' '\012' | sed -e 's/^.*\(.\)$/\1/g'  | sort -u | tr -d '\
+ AC_DEFINE_UNQUOTED(PTYRANGE0,"$p0")
+ AC_DEFINE_UNQUOTED(PTYRANGE1,"$p1")
+ fi
++fi
+ 
+ dnl    ****  pty mode/group handling ****
+ dnl
+@@ -869,14 +877,16 @@ fi
+ dnl
+ dnl    ****  loadav  ****
+ dnl
++if test "$cross_compiling" = no ; then
+ AC_CHECKING(for libutil(s))
+ test -f /usr/lib/libutils.a && LIBS="$LIBS -lutils"
+ test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
++fi
+ 
+ AC_CHECKING(getloadavg)
+ AC_TRY_LINK(,[getloadavg((double *)0, 0);],
+ AC_DEFINE(LOADAV_GETLOADAVG) load=1,
+-if test -f /usr/lib/libkvm.a ; then
++if test "$cross_compiling" = no && test -f /usr/lib/libkvm.a ; then
+ olibs="$LIBS"
+ LIBS="$LIBS -lkvm"
+ AC_CHECKING(getloadavg with -lkvm)
+@@ -1094,13 +1104,18 @@ dnl    ****  libraries  ****
+ dnl
+ 
+ AC_CHECKING(for crypt and sec libraries)
++if test "$cross_compiling" = no ; then
+ test -f /lib/libcrypt_d.a || test -f /usr/lib/libcrypt_d.a && LIBS="$LIBS -lcrypt_d"
++fi
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lcrypt"
+ AC_CHECKING(crypt)
+ AC_TRY_LINK(,,,LIBS="$oldlibs")
++if test "$cross_compiling" = no ; then
+ test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
+ test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
++fi
++
+ oldlibs="$LIBS"
+ LIBS="$LIBS -lsun"
+ AC_CHECKING(IRIX sun library)
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch b/meta/recipes-extended/screen/screen/fix-parallel-make.patch
similarity index 100%
rename from meta/recipes-extended/screen/screen-4.0.3/fix-parallel-make.patch
rename to meta/recipes-extended/screen/screen/fix-parallel-make.patch
diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen.pam b/meta/recipes-extended/screen/screen/screen.pam
similarity index 100%
rename from meta/recipes-extended/screen/screen-4.0.3/screen.pam
rename to meta/recipes-extended/screen/screen/screen.pam
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 962a499..0ae08de 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -1,55 +1,14 @@
-SUMMARY = "Multiplexing terminal manager"
-DESCRIPTION = "Screen is a full-screen window manager \
-that multiplexes a physical terminal between several \
-processes, typically interactive shells."
-HOMEPAGE = "http://www.gnu.org/software/screen/"
-BUGTRACKER = "https://savannah.gnu.org/bugs/?func=additem&group=screen"
+include screen.inc
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
                     file://screen.h;endline=23;md5=9a7ae69a2aafed891bf7c38ddf9f6b7d"
 
-SECTION = "console/utils"
-DEPENDS = "ncurses \
-          ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "base-files"
+PR = "r5"
 
-PR = "r4"
+SRC_URI += "file://configure.patch \
+            file://screen-4.0.3-CVE-2009-1214.patch \
+            file://screen-4.0.2-CVE-2009-1215.patch"
 
-SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-14.diff.gz;name=patch \
-           file://configure.patch \
-           file://fix-parallel-make.patch \
-           file://screen-4.0.3-CVE-2009-1214.patch \
-           file://screen-4.0.2-CVE-2009-1215.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
-
-PAM_SRC_URI = "file://screen.pam"
-
-SRC_URI[tarball.md5sum] = "8506fd205028a96c741e4037de6e3c42"
-SRC_URI[tarball.sha256sum] = "78f0d5b1496084a5902586304d4a73954b2bfe33ea13edceecf21615c39e6c77"
-
-SRC_URI[patch.md5sum] = "5960bdae6782ee9356b7e0e0a1fa7c19"
-SRC_URI[patch.sha256sum] = "10acb274b2fb0bb7137a0d66e52fa0f18125bc5198c7a8d5af381b4b30636316"
-
-inherit autotools texinfo
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
-
-EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
-               ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
-
-do_install_append () {
-	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
-		install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
-	fi
-}
-
-pkg_postinst_${PN} () {
-	grep -q "^${bindir}/screen$" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
-}
-
-pkg_postrm_${PN} () {
-	printf "$(grep -v "^${bindir}/screen$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
-}
+SRC_URI[md5sum] = "8506fd205028a96c741e4037de6e3c42"
+SRC_URI[sha256sum] = "78f0d5b1496084a5902586304d4a73954b2bfe33ea13edceecf21615c39e6c77"
diff --git a/meta/recipes-extended/screen/screen_4.3.1.bb b/meta/recipes-extended/screen/screen_4.3.1.bb
new file mode 100644
index 0000000..4777df6
--- /dev/null
+++ b/meta/recipes-extended/screen/screen_4.3.1.bb
@@ -0,0 +1,13 @@
+include screen.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://screen.h;endline=26;md5=3971142989289a8198a544220703c2bf"
+
+SRC_URI += "file://Remove-redundant-compiler-sanity-checks.patch \
+            file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
+            file://Skip-host-file-system-checks-when-cross-compiling.patch \
+            file://Avoid-mis-identifying-systems-as-SVR4.patch"
+
+SRC_URI[md5sum] = "5bb3b0ff2674e29378c31ad3411170ad"
+SRC_URI[sha256sum] = "fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63"
-- 
2.1.4


