Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4961A73905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 13:25:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2015 06:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,670,1432623600"; d="scan'208";a="783426614"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2015 06:25:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2015 16:26:43 +0300
Message-Id: <10269744a7e91ddf317b041f70d5810ae5c94c36.1439471616.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439471616.git.jussi.kukkonen@intel.com>
References: <cover.1439471616.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
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
X-List-Received-Date: Thu, 13 Aug 2015 13:25:14 -0000

* License is now GPLv3+
* Remove patches that are already in upstream or not applicable
  anymore
* Add a patchset to enable cross-compiling 4.3.1 (modified from
  http://savannah.gnu.org/bugs/?43223)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../screen/screen-4.0.3/configure.patch            | 979 ---------------------
 .../screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch  |  27 -
 .../screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch  |  86 --
 .../Avoid-mis-identifying-systems-as-SVR4.patch    |  57 ++
 ...cross-compile-alternatives-for-AC_TRY_RUN.patch | 137 +++
 .../Remove-redundant-compiler-sanity-checks.patch  |  65 ++
 ...t-file-system-checks-when-cross-compiling.patch | 135 +++
 .../fix-parallel-make.patch                        |   0
 .../screen/{screen-4.0.3 => screen}/screen.pam     |   0
 .../screen/{screen_4.0.3.bb => screen_4.3.1.bb}    |  34 +-
 10 files changed, 408 insertions(+), 1112 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen-4.0.3/configure.patch
 delete mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
 delete mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
 create mode 100644 meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
 create mode 100644 meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
 create mode 100644 meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
 create mode 100644 meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/fix-parallel-make.patch (100%)
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/screen.pam (100%)
 rename meta/recipes-extended/screen/{screen_4.0.3.bb => screen_4.3.1.bb} (58%)

diff --git a/meta/recipes-extended/screen/screen-4.0.3/configure.patch b/meta/recipes-extended/screen/screen-4.0.3/configure.patch
deleted file mode 100644
index e29bcc6..0000000
--- a/meta/recipes-extended/screen/screen-4.0.3/configure.patch
+++ /dev/null
@@ -1,979 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# The patch is borrowed from OE:
-# http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4ee790cc6974bdfe1c9b06c0567b1c56f56d6615
-# and was rebased to screen-4.0.3's configure.in
-# by Dexuan Cui (dexuan.cui@intel.com).
-#
-# The description of the original patch is:
-#
-# Patch by Hannes Reich (hannes@skynet.ie) 22-Jul-2005
-# Resolves _some_ of the cross-compilation issues in screen's configure.in
-#
-diff --git a/configure.in b/configure.in
-index 34c9372..d5ed48a 100644
---- a/configure.in
-+++ b/configure.in
-@@ -37,6 +37,325 @@ pat=`sed < ${srcdir}/patchlevel.h -n -e '/#define PATCHLEVEL/s/#define PATCHLEVE
- VERSION="$rev.$vers.$pat"
- AC_NOTE(this is screen version $VERSION)
- AC_SUBST(VERSION)
-+
-+AH_TOP([
-+/* Copyright (c) 1993-2000
-+ *      Juergen Weigert (jnweiger@immd4.informatik.uni-erlangen.de)
-+ *      Michael Schroeder (mlschroe@immd4.informatik.uni-erlangen.de)
-+ * Copyright (c) 1987 Oliver Laumann
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2, or (at your option)
-+ * any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program (see the file COPYING); if not, write to the
-+ * Free Software Foundation, Inc.,
-+ * 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA
-+ *
-+ */
-+
-+
-+/**********************************************************************
-+ *
-+ *	User Configuration Section
-+ */
-+
-+/*
-+ * Maximum of simultaneously allowed windows per screen session.
-+ */
-+#ifndef MAXWIN
-+# define MAXWIN 40
-+#endif
-+
-+/*
-+ * Define SOCKDIR to be the directory to contain the named sockets
-+ * screen creates. This should be in a common subdirectory, such as
-+ * /usr/local or /tmp. It makes things a little more secure if you
-+ * choose a directory which is not writable by everyone or where the
-+ * "sticky" bit is on, but this isn't required.
-+ * If SOCKDIR is not defined screen will put the named sockets in
-+ * the user's home directory. Notice that this can cause you problems
-+ * if some user's HOME directories are AFS- or NFS-mounted. Especially
-+ * AFS is unlikely to support named sockets.
-+ *
-+ * Screen will name the subdirectories "S-$USER" (e.g /tmp/S-davison).
-+ */
-+#undef SOCKDIR
-+
-+/*
-+ * Define this if the SOCKDIR is not shared between hosts.
-+ */
-+#define SOCKDIR_IS_LOCAL_TO_HOST
-+
-+/*
-+ * Screen sources two startup files. First a global file with a path
-+ * specified here, second your local $HOME/.screenrc
-+ * Don't define this, if you don't want it.
-+ */
-+#ifndef ETCSCREENRC
-+# define ETCSCREENRC "/usr/local/etc/screenrc"
-+#endif
-+
-+/*
-+ * Screen can look for the environment variable $SYSSCREENRC and -if it
-+ * exists- load the file specified in that variable as global screenrc.
-+ * If you want to enable this feature, define ALLOW_SYSSCREENRC to one (1).
-+ * Otherwise ETCSCREENRC is always loaded.
-+ */
-+#define ALLOW_SYSSCREENRC 1
-+
-+/*
-+ * Screen needs encoding files for the translation of utf8
-+ * into some encodings, e.g. JIS, BIG5.
-+ * Only needed if FONT, ENCODINGS and UTF8 are defined.
-+ */
-+#ifndef SCREENENCODINGS
-+# define SCREENENCODINGS "/usr/local/lib/screen/encodings"
-+#endif
-+/*
-+ * Define CHECKLOGIN to force Screen users to enter their Unix password
-+ * in addition to the screen password.
-+ *
-+ * Define NOSYSLOG if yo do not have logging facilities. Currently
-+ * syslog() will be used to trace ``su'' commands only.
-+ */
-+#define CHECKLOGIN 1
-+#undef NOSYSLOG
-+
-+
-+/* 
-+ * define PTYMODE if you do not like the default of 0622, which allows 
-+ * public write to your pty.
-+ * define PTYGROUP to some numerical group-id if you do not want the
-+ * tty to be in "your" group.
-+ * Note, screen is unable to change mode or group of the pty if it
-+ * is not installed with sufficient privilege. (e.g. set-uid-root)
-+ * define PTYROFS if the /dev/pty devices are mounted on a read-only 
-+ * filesystem so screen should not even attempt to set mode or group  
-+ * even if running as root (e.g. on TiVo).
-+ */
-+#undef PTYMODE
-+#undef PTYGROUP
-+#undef PTYROFS
-+
-+/*
-+ * If screen is NOT installed set-uid root, screen can provide tty
-+ * security by exclusively locking the ptys.  While this keeps other
-+ * users from opening your ptys, it also keeps your own subprocesses
-+ * from being able to open /dev/tty.  Define LOCKPTY to add this
-+ * exclusive locking.
-+ */
-+#undef LOCKPTY
-+
-+/*
-+ * If you'd rather see the status line on the first line of your
-+ * terminal rather than the last, define TOPSTAT.
-+ */
-+#undef TOPSTAT
-+
-+/*
-+ * define DETACH can detach a session. An absolute 'must'.
-+ */
-+#define DETACH
-+
-+/*
-+ * here come the erlangen extensions to screen:
-+ * define LOCK if you want to use a lock program for a screenlock.
-+ * define PASSWORD for secure reattach of your screen.
-+ * define COPY_PASTE to use the famous hacker's treasure zoo.
-+ * define POW_DETACH to have a detach_and_logout key (requires DETACH).
-+ * define REMOTE_DETACH (-d option) to move screen between terminals.
-+ * define AUTO_NUKE to enable Tim MacKenzies clear screen nuking
-+ * define PSEUDOS to allow window input/output filtering
-+ * define MULTI to allow multiple attaches.
-+ * define MULTIUSER to allow other users attach to your session
-+ *                  (if they are in the acl, of course)
-+ * define MAPKEYS to include input keyboard translation.
-+ * define FONT to support ISO2022/alternet charset support
-+ * define COLOR to include ansi color support. This may expose
-+ *        a bug in x11r6-color-xterm.
-+ * define DW_CHARS to include support for double-width character
-+ *        sets.
-+ * define ENCODINGS to include support for encodings like euc or big5.
-+ *        Needs FONT to work.
-+ * define UTF8 if you want support for UTF-8 encoding.
-+ *        Needs FONT and ENCODINGS to work.
-+ * define COLORS16 if you want 16 colors.
-+ *        Needs COLOR to work.
-+ * define BUILTIN_TELNET to add telnet support to screen.
-+ *        Syntax: screen //telnet host [port]
-+ * define RXVT_OSC if you want support for rxvts special
-+ *        change fgcolor/bgcolor/bgpicture sequences
-+ */
-+#undef SIMPLESCREEN
-+#ifndef SIMPLESCREEN
-+# define LOCK
-+# define PASSWORD
-+# define COPY_PASTE
-+# define REMOTE_DETACH
-+# define POW_DETACH
-+# define AUTO_NUKE
-+# define PSEUDOS
-+# define MULTI
-+# define MULTIUSER
-+# define MAPKEYS
-+# define COLOR
-+# define FONT
-+# define DW_CHARS
-+# define ENCODINGS
-+# define UTF8
-+# define COLORS16
-+# define ZMODEM
-+# define BLANKER_PRG
-+#endif /* SIMPLESCREEN */
-+
-+#undef BUILTIN_TELNET
-+#undef RXVT_OSC
-+#undef COLORS256
-+
-+
-+/*
-+ * If you have a braille display you should define HAVE_BRAILLE.
-+ * The code inside #ifdef HAVE_BRAILLE was contributed by Hadi Bargi
-+ * Rangin (bargi@dots.physics.orst.edu).
-+ * WARNING: this is more or less unsupported code, it may be full of
-+ * bugs leading to security holes, enable at your own risk!
-+ */
-+#undef HAVE_BRAILLE
-+
-+
-+/*
-+ * As error messages are mostly meaningless to the user, we
-+ * try to throw out phrases that are somewhat more familiar
-+ * to ...well, at least familiar to us NetHack players.
-+ */
-+#ifndef NONETHACK
-+# define NETHACK
-+#endif /* NONETHACK */
-+
-+/*
-+ * If screen is installed with permissions to update /etc/utmp (such
-+ * as if it is installed set-uid root), define UTMPOK.
-+ */
-+#define UTMPOK
-+
-+/* Set LOGINDEFAULT to one (1)
-+ * if you want entries added to /etc/utmp by default, else set it to
-+ * zero (0).
-+ * LOGINDEFAULT will be one (1) whenever LOGOUTOK is undefined!
-+ */
-+#define LOGINDEFAULT	1
-+
-+/* Set LOGOUTOK to one (1)
-+ * if you want the user to be able to log her/his windows out.
-+ * (Meaning: They are there, but not visible in /etc/utmp).
-+ * Disabling this feature only makes sense if you have a secure /etc/utmp
-+ * database. 
-+ * Negative examples: suns usually have a world writable utmp file, 
-+ * xterm will run perfectly without s-bit.
-+ *
-+ * If LOGOUTOK is undefined and UTMPOK is defined, all windows are
-+ * initially and permanently logged in.
-+ *
-+ * Set CAREFULUTMP to one (1) if you want that users have at least one
-+ * window per screen session logged in.
-+ */
-+#define LOGOUTOK 1
-+#undef CAREFULUTMP
-+
-+
-+/*
-+ * If UTMPOK is defined and your system (incorrectly) counts logins by
-+ * counting non-null entries in /etc/utmp (instead of counting non-null
-+ * entries with no hostname that are not on a pseudo tty), define USRLIMIT
-+ * to have screen put an upper-limit on the number of entries to write
-+ * into /etc/utmp.  This helps to keep you from exceeding a limited-user
-+ * license.
-+ */
-+#undef USRLIMIT
-+
-+/*
-+ * both must be defined if you want to favor tcsendbreak over
-+ * other calls to generate a break condition on serial lines.
-+ * (Do not bother, if you are not using plain tty windows.)
-+ */
-+#define POSIX_HAS_A_GOOD_TCSENDBREAK
-+#define SUNOS4_AND_WE_TRUST_TCSENDBREAK
-+
-+/*
-+ * to lower the interrupt load on the host machine, you may want to
-+ * adjust the VMIN and VTIME settings used for plain tty windows.
-+ * See the termio(4) manual page (Non-Canonical Mode Input Processing)
-+ * for details.
-+ * if undefined, VMIN=1, VTIME=0 is used as a default - this gives you
-+ * best user responsiveness, but highest interrupt frequency.
-+ * (Do not bother, if you are not using plain tty windows.)
-+ */
-+#define TTYVMIN 100
-+#define TTYVTIME 2
-+
-+/*
-+ * looks like the above values are ignored by setting FNDELAY.
-+ * This is default for all pty/ttys, you may disable it for
-+ * ttys here. After playing with it for a while, one may find out
-+ * that this feature may cause screen to lock up.
-+ */
-+#ifdef bsdi
-+# define TTY_DISABLE_FNBLOCK /* select barfs without it ... */
-+#endif
-+
-+
-+/*
-+ * Some terminals, e.g. Wyse 120, use a bitfield to select attributes.
-+ * This doesn't work with the standard so/ul/m? terminal entries,
-+ * because they will cancel each other out. 
-+ * On TERMINFO machines, "sa" (sgr) may work. If you want screen
-+ * to switch attributes only with sgr, define USE_SGR.
-+ * This is *not* recomended, do this only if you must.
-+ */
-+#undef USE_SGR
-+
-+
-+/*
-+ * Define USE_LOCALE if you want screen to use the locale names
-+ * for the name of the month and day of the week.
-+ */
-+#define USE_LOCALE
-+
-+/*
-+ * Define USE_PAM if your system supports PAM (Pluggable Authentication
-+ * Modules) and you want screen to use it instead of calling crypt().
-+ * (You may also need to add -lpam to LIBS in the Makefile.)
-+ */
-+#undef USE_PAM
-+
-+/*
-+ * Define CHECK_SCREEN_W if you want screen to set TERM to screen-w
-+ * if the terminal width is greater than 131 columns. No longer needed
-+ * on modern systems which use $COLUMNS or the tty settings instead.
-+ */
-+#undef CHECK_SCREEN_W
-+
-+/**********************************************************************
-+ *
-+ *	End of User Configuration Section
-+ *
-+ *      Rest of this file is modified by 'configure'
-+ *      Change at your own risk!
-+ *
-+ */
-+])
-+# end of AH_TOP
-+
-+AC_PREFIX_PROGRAM(screen)
-+AC_PREFIX_PROGRAM(gzip)
- AC_PREFIX_PROGRAM(screen)
- AC_PREFIX_PROGRAM(gzip)
- 
-@@ -46,6 +365,7 @@ AC_PROG_CPP
- AC_PROG_GCC_TRADITIONAL
- AC_ISC_POSIX
- 
-+AC_MSG_CHECKING([for compiler sanity])
- AC_TRY_RUN(main(){exit(0);},,[
- if test $CC != cc ; then
- AC_NOTE(Your $CC failed - restarting with CC=cc)
-@@ -54,14 +374,9 @@ CC=cc
- export CC
- exec $0 $configure_args
- fi
--])
-+],AC_MSG_WARN([skipping test due to crosscompilation]))
- 
--AC_TRY_RUN(main(){exit(0);},,
--exec 5>&2
--eval $ac_link
--AC_NOTE(CC=$CC; CFLAGS=$CFLAGS; LIBS=$LIBS;)
--AC_NOTE($ac_compile)
--AC_MSG_ERROR(Can't run the compiler - sorry))
-+AC_MSG_CHECKING([if compiler sets exit status])
- 
- AC_TRY_RUN([
- main()
-@@ -69,7 +384,8 @@ main()
-   int __something_strange_();
-   __something_strange_(0);
- }
--],AC_MSG_ERROR(Your compiler does not set the exit status - sorry))
-+],AC_MSG_ERROR(Your compiler does not set the exit status - sorry),,
-+AC_MSG_WARN(skipping test due to crosscompilation))
- 
- AC_PROG_AWK
- 
-@@ -103,6 +419,7 @@ AC_ARG_ENABLE(socket-dir,
- dnl
- dnl    ****  special unix variants  ****
- dnl
-+AH_TEMPLATE(ISC,[])
- if test -n "$ISC"; then
-   AC_DEFINE(ISC) LIBS="$LIBS -linet"
- fi
-@@ -114,11 +431,13 @@ dnl AC_DEFINE(OSF1)	# this disables MIPS again....
- dnl fi
- dnl fi
- 
-+AH_TEMPLATE([sysV68],[])
- if test -f /sysV68 ; then
- AC_DEFINE(sysV68)
- fi
- 
- AC_CHECKING(for MIPS)
-+AH_TEMPLATE([MIPS],[])
- if test -f /lib/libmld.a || test -f /usr/lib/libmld.a || test -f /usr/lib/cmplrs/cc/libmld.a; then
- oldlibs="$LIBS"
- test -f /bin/mx || LIBS="$LIBS -lmld" # for nlist. But not on alpha.
-@@ -132,6 +451,8 @@ AC_DEFINE(MIPS)
- AC_CHECKING(wait3)
- AC_TRY_LINK(,[wait3();], ,
- AC_CHECKING(wait2)
-+AH_TEMPLATE([USE_WAIT2],[On RISCOS we prefer wait2() over wait3(). rouilj@sni-usa.com])
-+dnl TODO(Hannes) shipped config.h.in wraps the define in #ifdef BSDWAIT
- AC_TRY_LINK(,[wait2();],
- dnl John Rouillard (rouilj@sni-usa.com):
- dnl need -I/usr/include/bsd in RISCOS otherwise sockets are broken, no
-@@ -154,9 +475,11 @@ if test -f /usr/lib/libpyr.a ; then
- oldlibs="$LIBS"
- LIBS="$LIBS -lpyr"
- AC_CHECKING(Pyramid OSX)
-+AH_TEMPLATE([OSX], [Pyramid OSX])
- AC_TRY_LINK(,[open_controlling_pty("")], AC_DEFINE(OSX), LIBS="$oldlibs")
- fi
- 
-+AH_TEMPLATE([POSIX],[Define POSIX if your system supports IEEE Std 1003.1-1988 (POSIX).])
- dnl ghazi@caip.rutgers.edu (Kaveh R. Ghazi):
- dnl BBN butterfly is not POSIX, but a MACH BSD system.
- dnl Do not define POSIX and TERMIO.
-@@ -183,6 +506,7 @@ main () {
- fi
- 
- AC_CHECKING(for System V)
-+AH_TEMPLATE([SYSV], [Define SYSV if your machine is SYSV complient (Sys V, HPUX, A/UX)])
- AC_TRY_COMPILE(
- [#include <sys/types.h>
- #include <signal.h>
-@@ -198,6 +522,11 @@ AC_EGREP_CPP(yes,
- oldlibs="$LIBS"
- LIBS="$LIBS -lelf"
- AC_CHECKING(SVR4)
-+AH_TEMPLATE([SVR4],[])
-+AH_TEMPLATE([BUGGYGETLOGIN],
-+[If ttyslot() breaks getlogin() by returning indexes to utmp entries
-+ of type DEAD_PROCESS, then our getlogin() replacement should be
-+ selected by defining BUGGYGETLOGIN.])
- AC_TRY_LINK([#include <utmpx.h>
- ],,
- [AC_CHECK_HEADER(dwarf.h, AC_DEFINE(SVR4) AC_DEFINE(BUGGYGETLOGIN),
-@@ -235,6 +564,9 @@ dnl   ****     Job control     ****
- dnl
- 
- AC_CHECKING(BSD job jontrol)
-+AH_TEMPLATE([BSDJOBS],
-+[Define BSDJOBS if you have BSD-style job control (both process
-+ groups and a tty that deals correctly with them)])
- AC_TRY_LINK(
- [#include <sys/types.h>
- #include <sys/ioctl.h>
-@@ -255,6 +587,10 @@ dnl
- dnl    ****  setreuid(), seteuid()  ****
- dnl
- AC_CHECKING(setreuid)
-+AH_TEMPLATE([HAVE_SETREUID],
-+[If your system has the calls setreuid() and setregid(),
-+ define HAVE_SETREUID. Otherwise screen will use a forked process to
-+ safely create output files without retaining any special privileges.])
- AC_TRY_LINK(,[
- #ifdef __hpux
- setresuid(0, 0, 0);
-@@ -269,6 +605,9 @@ dnl   NeXT, AUX, ISC, and ultrix are still broken (no saved uid support)
- dnl   Solaris seteuid doesn't change the saved uid, bad for
- dnl     multiuser screen sessions
- AC_CHECKING(seteuid)
-+AH_TEMPLATE([HAVE_SETEUID],
-+[If your system supports BSD4.4's seteuid() and setegid(), define
-+ HAVE_SETEUID.])
- AC_TRY_LINK(,[
- #if defined(linux) || defined(NeXT) || defined(_AUX_SOURCE) || defined(AUX) || defined(ultrix) || (defined(sun) && defined(SVR4)) || defined(ISC) || defined(sony_news)
- seteuid_is_broken(0);
-@@ -292,7 +631,8 @@ dnl
- dnl    ****  FIFO tests  ****
- dnl
- 
--AC_CHECKING(fifos)
-+AC_CACHE_CHECK([usable fifos],
-+       [screen_cv_sys_fifo_usable],
- AC_TRY_RUN([
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -357,12 +697,14 @@ main()
-     exit(1);
-   exit(0);
- }
--], AC_NOTE(- your fifos are usable) fifo=1,
--AC_NOTE(- your fifos are not usable))
--rm -f /tmp/conftest*
--
--if test -n "$fifo"; then
--AC_CHECKING(for broken fifo implementation)
-+], screen_cv_sys_fifo_usable=yes, screen_cv_sys_fifo_usable=no))
-+
-+if test X"$screen_cv_sys_fifo_usable" = Xyes; then
-+AH_TEMPLATE([BROKEN_PIPE],
-+[Define this if your system exits select() immediatly if a pipe is
-+ opened read-only and no writer has opened it.])
-+AC_CACHE_CHECK([broken fifo implementation],
-+          [screen_cv_sys_fifo_broken_impl],
- AC_TRY_RUN([
- #include <sys/types.h>
- #include <fcntl.h>
-@@ -407,9 +749,11 @@ main()
-     exit(1);
-   exit(0);
- }
--], AC_NOTE(- your implementation is ok), 
--AC_NOTE(- you have a broken implementation) AC_DEFINE(BROKEN_PIPE) fifobr=1)
--rm -f /tmp/conftest*
-+], screen_cv_sys_fifo_broken_impl=no,
-+screen_cv_sys_fifo_broken_impl=yes))
-+if test X"$screen_cv_sys_fifo_broken_impl" = Xyes; then
-+   AC_DEFINE(BROKEN_PIPE)
-+fi
- fi
- 
- dnl
-@@ -418,7 +762,8 @@ dnl
- dnl 	may need  	LIBS="$LIBS -lsocket" 	here
- dnl
- 
--AC_CHECKING(sockets)
-+AC_CACHE_CHECK([sockets are usable],
-+          [screen_cv_sys_sockets_usable],
- AC_TRY_RUN([
- #include <sys/types.h>
- #include <sys/socket.h>
-@@ -469,12 +814,16 @@ main()
-     exit(1);
-   exit(0);
- }
--], AC_NOTE(- your sockets are usable) sock=1,
--AC_NOTE(- your sockets are not usable))
--rm -f /tmp/conftest*
-+], screen_cv_sys_sockets_usable=yes,
-+screen_cv_sys_sockets_usable=no))
- 
--if test -n "$sock"; then
-+if test X"$screen_cv_sys_sockets_usable" = Xyes; then
- AC_CHECKING(socket implementation)
-+AH_TEMPLATE([SOCK_NOT_IN_FS],
-+[Define this if the unix-domain socket implementation doesn't
-+ create a socket in the filesystem.])
-+AC_CACHE_CHECK([if sockets are not stored in the filesystem],
-+          [screen_cv_sys_sockets_nofs],
- AC_TRY_RUN([
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -500,22 +849,25 @@ main()
-   close(s);
-   exit(0);
- }
--],AC_NOTE(- you are normal),
--AC_NOTE(- unix domain sockets are not kept in the filesystem)
--AC_DEFINE(SOCK_NOT_IN_FS) socknofs=1)
--rm -f /tmp/conftest*
-+], screen_cv_sys_sockets_nofs=no,
-+screen_cv_sys_sockets_nofs=yes))
-+
-+if test X"$screen_cv_sys_sockets_nofs" = Xyes; then
-+  AC_DEFINE(SOCK_NOT_IN_FS)
-+fi
- fi
- 
- 
- dnl
- dnl    ****  choose sockets or fifos  ****
- dnl
--if test -n "$fifo"; then
--  if test -n "$sock"; then
--    if test -n "$nore"; then
-+AH_TEMPLATE([NAMEDPIPE], [Define this if your system supports named pipes.])
-+if test X"$screen_cv_sys_fifo_usable" = Xyes; then
-+  if test X"$screen_cv_sys_sockets_usable" = Xyes; then
-+    if test X"$screen_cv_sys_sockets_nofs" = Xyes; then
-       AC_NOTE(- hmmm... better take the fifos)
-       AC_DEFINE(NAMEDPIPE)
--    elif test -n "$fifobr"; then
-+    elif test X"$screen_cv_sys_fifo_broken_impl" = Xyes; then
-       AC_NOTE(- as your fifos are broken lets use the sockets.)
-     else
-       AC_NOTE(- both sockets and fifos usable. let's take fifos.)
-@@ -525,7 +877,7 @@ if test -n "$fifo"; then
-     AC_NOTE(- using named pipes, of course)
-     AC_DEFINE(NAMEDPIPE)
-   fi
--elif test -n "$sock"; then
-+elif test X"$screen_cv_sys_sockets_usable" = Xyes; then
-   AC_NOTE(- using unix-domain sockets, of course)
- else
-   AC_MSG_ERROR(you have neither usable sockets nor usable pipes -> no screen)
-@@ -535,7 +887,11 @@ dnl
- dnl    ****  check the select implementation ****
- dnl
- 
--AC_CHECKING(select return value)
-+AH_TEMPLATE([SELECT_BROKEN],
-+[If the select return value doesn't treat a descriptor that is
-+ usable for reading and writing as two hits, define SELECT_BROKEN.])
-+AC_CACHE_CHECK([for broken select return value],
-+          [screen_cv_sys_select_broken_retval],
- AC_TRY_RUN([
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -634,17 +990,26 @@ main()
-     exit(1);
-   exit(0);
- }
--],AC_NOTE(- select is ok),
--AC_NOTE(- select can't count) AC_DEFINE(SELECT_BROKEN))
-+], screen_cv_sys_select_broken_retval=no,
-+screen_cv_sys_select_broken_retval=yes))
-+if test X"$screen_cv_sys_select_broken_retval" = Xyes; then
-+  AC_DEFINE(SELECT_BROKEN)
-+fi
- 
- dnl
- dnl    ****  termcap or terminfo  ****
- dnl
-+AH_TEMPLATE([TERMINFO],
-+[Define TERMINFO if your machine emulates the termcap routines
-+ with the terminfo database.
-+ Thus the .screenrc file is parsed for
-+ the command 'terminfo' and not 'termcap'])
- AC_CHECKING(for tgetent)
- AC_TRY_LINK(,tgetent((char *)0, (char *)0);,,
- olibs="$LIBS"
- LIBS="-lcurses $olibs"
- AC_CHECKING(libcurses)
-+AC_CHECK_LIB(ncursesw,tgetent)
- AC_TRY_LINK(,[
- #ifdef __hpux
- __sorry_hpux_libcurses_is_totally_broken_in_10_10();
-@@ -662,25 +1027,39 @@ LIBS="-lncurses $olibs"
- AC_CHECKING(libncurses)
- AC_TRY_LINK(,tgetent((char *)0, (char *)0);,,
- AC_MSG_ERROR(!!! no tgetent - no screen))))))
--
--AC_TRY_RUN([
-+AC_CACHE_CHECK([using terminfo database],[screen_cv_sys_terminfo_used],
-+   AC_TRY_RUN([
- main()
- {
-  exit(strcmp(tgoto("%p1%d", 0, 1), "1") ? 0 : 1);
--}], AC_NOTE(- you use the termcap database),
--AC_NOTE(- you use the terminfo database) AC_DEFINE(TERMINFO))
-+}
-+   ], screen_cv_sys_terminfo_used=no,
-+   screen_cv_sys_terminfo_used=yes)
-+)
-+
-+if test X"$screen_cv_sys_terminfo_used" = Xyes; then
-+   AC_DEFINE(TERMINFO)
-+fi
-+
- AC_CHECKING(ospeed)
-+AH_TEMPLATE([NEED_OSPEED],[If your library does not define ospeed, define this.])
- AC_TRY_LINK(extern short ospeed;,ospeed=5;,,AC_DEFINE(NEED_OSPEED))
- 
- dnl
- dnl    ****  PTY specific things  ****
- dnl
-+AH_TEMPLATE([HAVE_DEV_PTC],
-+[define HAVE_DEV_PTC if you have a /dev/ptc character special
-+ device.])
- AC_CHECKING(for /dev/ptc)
- if test -r /dev/ptc; then
- AC_DEFINE(HAVE_DEV_PTC)
- fi
- 
- AC_CHECKING(for SVR4 ptys)
-+AH_TEMPLATE([HAVE_SVR4_PTYS],
-+[define HAVE_SVR4_PTYS if you have a /dev/ptmx character special
-+ device and support the ptsname(), grantpt(), unlockpt() functions.])
- sysvr4ptys=
- if test -c /dev/ptmx ; then
- AC_TRY_LINK([],[ptsname(0);grantpt(0);unlockpt(0);],[AC_DEFINE(HAVE_SVR4_PTYS)
-@@ -696,6 +1075,13 @@ AC_CHECK_FUNCS(openpty,,
- fi
- 
- AC_CHECKING(for ptyranges)
-+AH_TEMPLATE([PTYRANGE0],
-+[define PTYRANGE0 and or PTYRANGE1 if you want to adapt screen
-+ to unusual environments. E.g. For SunOs the defaults are "qpr" and
-+ "0123456789abcdef". For SunOs 4.1.2
-+ #define PTYRANGE0 "pqrstuvwxyzPQRST"
-+ is recommended by Dan Jacobson.])
-+AH_TEMPLATE([PTYRANGE1],[])
- if test -d /dev/ptym ; then
- pdir='/dev/ptym'
- else
-@@ -812,6 +1198,9 @@ dnl
- dnl    ****  utmp handling  ****
- dnl
- AC_CHECKING(getutent)
-+AH_TEMPLATE([GETUTENT],
-+[If your system has getutent(), pututline(), etc. to write to the
-+ utmp file, define GETUTENT.])
- AC_TRY_LINK([
- #include <time.h> /* to get time_t on SCO */
- #include <sys/types.h>
-@@ -845,6 +1234,7 @@ AC_TRY_LINK([
- [int x = DEAD_PROCESS; pututline((struct utmp *)0); getutent();], AC_DEFINE(GETUTENT), LIBS="$olibs")
- )
- AC_CHECKING(ut_host)
-+AH_TEMPLATE([UTHOST],[Define UTHOST if the utmp file has a host field.])
- AC_TRY_COMPILE([
- #include <time.h>
- #include <sys/types.h>
-@@ -855,8 +1245,9 @@ AC_TRY_COMPILE([
- #include <utmp.h>
- #endif
- ],[struct utmp u; u.ut_host[0] = 0;], AC_DEFINE(UTHOST))
-+AH_TEMPLATE([HAVE_UTEMPTER],[Define if you have the utempter utmp helper program])
- AC_CHECK_HEADER(utempter.h, have_utempter=yes, have_utempter=no)
--if test "$have_utempter" = yes; then
-+if test X"$have_utempter" = Xyes; then
-   AC_DEFINE(HAVE_UTEMPTER)
-   LIBS="$LIBS -lutempter"
- fi
-@@ -864,20 +1255,39 @@ fi
- dnl
- dnl    ****  loadav  ****
- dnl
-+
-+AH_TEMPLATE([LOADAV],
-+[If you want the "time" command to display the current load average
-+ define LOADAV. Maybe you must install screen with the needed
-+ privileges to read /dev/kmem.
-+ Note that NLIST_ stuff is only checked, when getloadavg() is not available.
-+])
-+AH_TEMPLATE([LOADAV_NUM])
-+AH_TEMPLATE([LOADAV_TYPE])
-+AH_TEMPLATE([LOADAV_SCALE])
-+AH_TEMPLATE([LOADAV_GETLOADAVG])
-+AH_TEMPLATE([LOADAV_UNIX])
-+AH_TEMPLATE([LOADAV_AVENRUN])
-+AH_TEMPLATE([LOADAV_USE_NLIST64])
-+
-+AH_TEMPLATE([NLIST_DECLARED])
-+AH_TEMPLATE([NLIST_STRUCT])
-+AH_TEMPLATE([NLIST_NAME_UNION])
-+
- AC_CHECKING(for libutil(s))
--test -f /usr/lib/libutils.a && LIBS="$LIBS -lutils"
--test -f /usr/lib/libutil.a && LIBS="$LIBS -lutil"
-+dnl I have no idea whether "login" is an appropriate symbol to check for here - Hannes
-+AC_CHECK_LIB(utils,login)
-+AC_CHECK_LIB(util,login)
- 
- AC_CHECKING(getloadavg)
- AC_TRY_LINK(,[getloadavg((double *)0, 0);],
- AC_DEFINE(LOADAV_GETLOADAVG) load=1,
--if test -f /usr/lib/libkvm.a ; then
- olibs="$LIBS"
--LIBS="$LIBS -lkvm"
-+AC_CHECK_LIB(kvm,kvm_open,
- AC_CHECKING(getloadavg with -lkvm)
- AC_TRY_LINK(,[getloadavg((double *)0, 0);],
- AC_DEFINE(LOADAV_GETLOADAVG) load=1, LIBS="$olibs")
--fi
-+)
- )
- 
- if test -z "$load" ; then
-@@ -1019,6 +1429,12 @@ if test -n "$loadscale" ; then AC_DEFINE_UNQUOTED(LOADAV_SCALE,$loadscale) fi
- dnl
- dnl    ****  signal handling  ****
- dnl
-+
-+AH_TEMPLATE([SIGVOID],
-+[Define SIGVOID if your signal handlers return void.  On older
-+ systems, signal returns int, but on newer ones, it returns void.])
-+
-+
- if test -n "$posix" ; then
- 
- dnl POSIX has reliable signals with void return type.
-@@ -1036,6 +1452,7 @@ AC_TRY_COMPILE(
- #endif
- extern void (*signal ()) ();], [int i;], AC_DEFINE(SIGVOID))
- AC_CHECKING(sigset)
-+AH_TEMPLATE([USESIGSET], [Define USESIGSET if you have sigset for BSD 4.1 reliable signals.])
- AC_TRY_LINK([
- #include <sys/types.h>
- #include <signal.h>
-@@ -1047,6 +1464,9 @@ sigset(0, (int (*)())0);
- #endif
- ], AC_DEFINE(USESIGSET))
- AC_CHECKING(signal implementation)
-+AH_TEMPLATE([SYSVSIGS],
-+[Define SYSVSIGS if signal handlers must be reinstalled after
-+ they have been called.])
- AC_TRY_RUN([
- #include <sys/types.h>
- #include <signal.h>
-@@ -1089,13 +1509,14 @@ dnl    ****  libraries  ****
- dnl
- 
- AC_CHECKING(for crypt and sec libraries)
--test -f /lib/libcrypt_d.a || test -f /usr/lib/libcrypt_d.a && LIBS="$LIBS -lcrypt_d"
-+dnl I have no idea whether "crypt" is an appropriate symbol to check for here - Hannes
-+AC_CHECK_LIB(crypt_d,crypt)
- oldlibs="$LIBS"
--LIBS="$LIBS -lcrypt"
- AC_CHECKING(crypt)
- AC_TRY_LINK(,,,LIBS="$oldlibs")
--test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
--test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
-+AC_CHECK_LIB(crypt,crypt)
-+AC_CHECK_LIB(sec,crypt)
-+AC_CHECK_LIB(shadow,getspnam)
- oldlibs="$LIBS"
- LIBS="$LIBS -lsun"
- AC_CHECKING(IRIX sun library)
-@@ -1118,6 +1539,13 @@ dnl
- dnl    ****  misc things  ****
- dnl
- AC_CHECKING(wait union)
-+AH_TEMPLATE([BSDWAIT],
-+[Define BSDWAIT if your system defines a 'union wait' in <sys/wait.h>
-+
-+ Only allow BSDWAIT i.e. wait3 on nonposix systems, since
-+ posix implies wait(3) and waitpid(3). vdlinden@fwi.uva.nl
-+ TODO(Hannes) shipped config.h.in does that with a #ifdef
-+])
- AC_TRY_COMPILE([#include <sys/types.h>
- #include <sys/wait.h>
- ],[
-@@ -1128,6 +1556,12 @@ AC_TRY_COMPILE([#include <sys/types.h>
- #endif
- ],AC_DEFINE(BSDWAIT))
- 
-+AH_TEMPLATE([TERMIO],
-+[Define TERMIO if you have struct termio instead of struct sgttyb.
-+ This is usually the case for SVID systems, where BSD uses sgttyb.
-+ POSIX systems should define this anyway, even though they use
-+ struct termios.])
-+
- if test -z "$butterfly"; then
- AC_CHECKING(for termio or termios)
- AC_TRY_CPP([#include <termio.h>], AC_DEFINE(TERMIO),
-@@ -1137,17 +1571,34 @@ fi
- )
- fi
- 
-+AH_TEMPLATE([CYTERMIO], [Define CYTERMIO if you have cyrillic termio modes.])
- dnl AC_CHECK_HEADER(shadow.h, AC_DEFINE(SHADOWPW))
- AC_CHECKING(getspnam)
-+AH_TEMPLATE([SHADOWPW],
-+[If the passwords are stored in a shadow file and you want the
-+ builtin lock to work properly, define SHADOWPW.])
- AC_TRY_LINK([#include <shadow.h>], [getspnam("x");],AC_DEFINE(SHADOWPW))
- 
- AC_CHECKING(getttyent)
-+AH_TEMPLATE([GETTTYENT],
-+[If your system has the new format /etc/ttys (like 4.3 BSD) and the
-+ getttyent(3) library functions, define GETTTYENT.])
- AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
- 
- AC_CHECKING(fdwalk)
-+AH_TEMPLATE([HAVE_FDWALK],
-+[Newer versions of Solaris include fdwalk, which can greatly improve
-+ the startup time of screen; otherwise screen spends a lot of time
-+ closing file descriptors.])
- AC_TRY_LINK([#include <stdlib.h>], [fdwalk(NULL, NULL);],AC_DEFINE(HAVE_FDWALK))
- 
--AC_CHECKING(whether memcpy/memmove/bcopy handles overlapping arguments)
-+AH_TEMPLATE([USEBCOPY],
-+[Define USEBCOPY if the bcopy/memcpy from your system's C library
-+ supports the overlapping of source and destination blocks.  When
-+ undefined, screen uses its own (probably slower) version of bcopy().])
-+
-+AC_CACHE_CHECK([if bcopy handles overlap],
-+          [screen_cv_sys_bcopy_overlap],
- AC_TRY_RUN([
- main() {
-   char buf[10];
-@@ -1160,8 +1611,21 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEBCOPY))
-+}], screen_cv_sys_bcopy_overlap=yes,
-+screen_cv_sys_bcopy_overlap=no))
-+if test X"$screen_cv_sys_bcopy_overlap" = Xyes; then
-+  AC_DEFINE(USEBCOPY)
-+fi
- 
-+AH_TEMPLATE([USEMEMMOVE],
-+[SYSV machines may have a working memcpy() -- Oh, this is
-+ quite unlikely. Tell me if you see one.
-+ "But then, memmove() should work, if at all available" he thought...
-+ Boing, never say "works everywhere" unless you checked SCO UNIX.
-+ Their memove fails the test in the configure script. Sigh. (Juergen)
-+])
-+AC_CACHE_CHECK([if memmove handles overlap],
-+          [screen_cv_sys_memmove_overlap],
- AC_TRY_RUN([
- #define bcopy(s,d,l) memmove(d,s,l)
- main() {
-@@ -1175,9 +1639,15 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEMEMMOVE))
--
-+}], screen_cv_sys_memmove_overlap=yes,
-+screen_cv_sys_memmove_overlap=no))
-+if test X"$screen_cv_sys_memmove_overlap" = Xyes; then
-+  AC_DEFINE(USEMEMMOVE)
-+fi
- 
-+AH_TEMPLATE([USEMEMCPY],[])
-+AC_CACHE_CHECK([if memcpy handles overlap],
-+          [screen_cv_sys_memcpy_overlap],
- AC_TRY_RUN([
- #define bcopy(s,d,l) memcpy(d,s,l)
- main() {
-@@ -1191,9 +1661,19 @@ main() {
-   if (strncmp(buf, "cdedef", 6))
-     exit(1);
-   exit(0); /* libc version works properly.  */
--}], AC_DEFINE(USEMEMCPY))
-+}], screen_cv_sys_memcpy_overlap=yes,
-+screen_cv_sys_memcpy_overlap=no))
-+if test X"$screen_cv_sys_memcpy_overlap" = Xyes; then
-+  AC_DEFINE(USEMEMCPY)
-+fi
- 
- AC_MSG_CHECKING(long file names)
-+AH_TEMPLATE([NAME_MAX],
-+[If you are on a SYS V machine that restricts filename length to 14
-+ characters, you may need to enforce that by setting NAME_MAX to 14])
-+dnl TODO(Hannes) shipped config.h.in has
-+dnl #undef NAME_MAX        /* KEEP_UNDEF_HERE override system value */
-+dnl ahead of this
- (echo 1 > /tmp/conftest9012345) 2>/dev/null
- (echo 2 > /tmp/conftest9012346) 2>/dev/null
- val=`cat /tmp/conftest9012345 2>/dev/null`
-@@ -1206,17 +1686,28 @@ fi
- rm -f /tmp/conftest*
- 
- AC_MSG_CHECKING(for vsprintf)
-+AH_TEMPLATE([USEVARARGS],
-+[If your system has vsprintf() and requires the use of the macros in
-+ "varargs.h" to use functions with variable arguments,
-+ define USEVARARGS.])
- AC_TRY_LINK(,[vsprintf(0,0,0);], AC_MSG_RESULT(yes);AC_DEFINE(USEVARARGS), AC_MSG_RESULT(no))
- 
- AC_HEADER_DIRENT
- 
- AC_MSG_CHECKING(for setenv)
-+AH_TEMPLATE([USESETENV], [If your system has setenv() and unsetenv() define USESETENV])
- AC_TRY_LINK(,[setenv((char *)0,(char *)0);unsetenv((char *)0);], AC_MSG_RESULT(yes);AC_DEFINE(USESETENV),
- AC_MSG_RESULT(no)
- AC_MSG_CHECKING(for putenv)
-+AH_TEMPLATE([NEEDPUTENV],
-+[If your system does not come with a setenv()/putenv()/getenv()
-+ functions, you may bring in our own code by defining NEEDPUTENV.])
- AC_TRY_LINK(,[putenv((char *)0);unsetenv((char *)0);], AC_MSG_RESULT(yes) ,  AC_MSG_RESULT(no);AC_DEFINE(NEEDPUTENV)
- ))
- AC_MSG_CHECKING([for nl_langinfo(CODESET)])
-+AH_TEMPLATE([HAVE_NL_LANGINFO],
-+[define HAVE_NL_LANGINFO if your system has the nl_langinfo() call
-+ and <langinfo.h> defines CODESET.])
- AC_TRY_LINK([
- #include <langinfo.h>
- ],[nl_langinfo(CODESET);], AC_MSG_RESULT(yes);AC_DEFINE(HAVE_NL_LANGINFO), AC_MSG_RESULT(no))
-@@ -1266,7 +1757,8 @@ fi
- dnl Ptx bug workaround -- insert -lc after -ltermcap
- test -n "$seqptx" && LIBS="-ltermcap -lc -lsocket -linet -lnsl -lsec -lseq"
- 
--AC_TRY_RUN(main(){exit(0);},,AC_MSG_ERROR(Can't run the compiler - internal error. Sorry.))
-+AC_MSG_CHECKING(compiler sanity)
-+AC_TRY_RUN(main(){exit(0);},,AC_MSG_ERROR(Can't run the compiler - internal error. Sorry.), AC_MSG_WARN(Skipping test due to crosscompilation))
- 
- ETCSCREENRC="\"/usr/local/etc/screenrc\""
- if test -n "$prefix"; then
diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch b/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
deleted file mode 100644
index 538a8fa..0000000
--- a/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-
-This patch is a backport from screen_4.0.3-11+lenny1.diff 
-to fix CVE-2009-1215.
-
-Signed-off-by:  Shenbo Huang<shenbo.huang@windriver.com)
----
-	properly by keeping the umask instead of dropping
-	the 'public exchange file' concept. Modify dpatch 22.
-	<http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=521123>
----
- fileio.c |    5 -----
- 1 file changed, 5 deletions(-)
---- a/fileio.c
-+++ b/fileio.c
-@@ -365,11 +365,6 @@ int dump;
-   char *mode = "w";
- #ifdef COPY_PASTE
-   int public = 0;
--# ifdef _MODE_T
--  mode_t old_umask;
--# else
--  int old_umask;
--# endif
- # ifdef HAVE_LSTAT
-   struct stat stb, stb2;
-   int fd, exists = 0;
diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch b/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
deleted file mode 100644
index 104fa82..0000000
--- a/meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Upstream-Status: Backport
-
-The patch to fix CVE-2009-1214
-A security flaw was found in the screen utility in the way it used to create
-one particular temporary file. An attacker could use this flaw to perform
-a symlink attack. 
-Fix race condition creating temporary file
-
-Reference:
-https://bugzilla.redhat.com/show_bug.cgi?id=492104
-
-Signed-off-by: Chenyang Guo <chenyang.guo@windriver.com>
----
- fileio.c |   48 ++++++++++++++++++++++++++++++++----------------
- 1 file changed, 32 insertions(+), 16 deletions(-)
-
---- a/fileio.c
-+++ b/fileio.c
-@@ -414,6 +414,14 @@ int dump;
- 	}
-       public = !strcmp(fn, DEFAULT_BUFFERFILE);
- # ifdef HAVE_LSTAT
-+      /*
-+       * Note: In the time between lstat() and open()/remove() below are
-+       * called, the file can be created/removed/modified.  Therefore the
-+       * information lstat() returns is taken into consideration, but not
-+       * relied upon.  In particular, the open()/remove() calls can fail, and
-+       * the code must account for that.  Symlink attack could be mounted if
-+       * the code is changed carelessly.  --rdancer 2009-01-11
-+       */
-       exists = !lstat(fn, &stb);
-       if (public && exists && (S_ISLNK(stb.st_mode) || stb.st_nlink > 1))
- 	{
-@@ -432,28 +440,36 @@ int dump;
- #ifdef COPY_PASTE
-       if (dump == DUMP_EXCHANGE && public)
- 	{
-+	  /*
-+	   * Setting umask to zero is a bad idea -- the user surely doesn't
-+	   * expect a publicly readable file in a publicly readable directory 
-+	   * --rdancer 2009-01-11
-+	   */
-+	  /*
-           old_umask = umask(0);
-+	   */
- # ifdef HAVE_LSTAT
- 	  if (exists)
--	    {
--	      if ((fd = open(fn, O_WRONLY, 0666)) >= 0)
--		{
--		  if (fstat(fd, &stb2) == 0 && stb.st_dev == stb2.st_dev && stb.st_ino == stb2.st_ino)
--		    ftruncate(fd, 0);
--		  else
--		    {
--		      close(fd);
--		      fd = -1;
--		    }
--		}
--	    }
--	  else
--	    fd = open(fn, O_WRONLY|O_CREAT|O_EXCL, 0666);
--	  f = fd >= 0 ? fdopen(fd, mode) : 0;
-+	      if (remove(fn) == -1)
-+	        {
-+		  /* Error */
-+		  debug2("WriteFile: File exists and remove(%s) failed: %s\n",
-+			  fn, strerror(errno));
-+		  UserReturn(0);
-+	        }
- # else
--          f = fopen(fn, mode);
-+	  (void) remove(fn);
- # endif
-+	  /*
-+	   * No r/w permissions for anybody but the user, as the file may be in
-+	   * a public directory -- if the user chooses, they can chmod the file
-+	   * afterwards. --rdancer 2008-01-11
-+	   */
-+	  fd = open(fn, O_WRONLY|O_CREAT|O_EXCL, 0600);
-+	  f = fd >= 0 ? fdopen(fd, mode) : 0;
-+	  /*
-           umask(old_umask);
-+	   */
- 	}
-       else
- #endif /* COPY_PASTE */
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
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.3.1.bb
similarity index 58%
rename from meta/recipes-extended/screen/screen_4.0.3.bb
rename to meta/recipes-extended/screen/screen_4.3.1.bb
index 962a499..f95578b 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.3.1.bb
@@ -5,32 +5,26 @@ processes, typically interactive shells."
 HOMEPAGE = "http://www.gnu.org/software/screen/"
 BUGTRACKER = "https://savannah.gnu.org/bugs/?func=additem&group=screen"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
-                    file://screen.h;endline=23;md5=9a7ae69a2aafed891bf7c38ddf9f6b7d"
-
 SECTION = "console/utils"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://screen.h;endline=26;md5=3971142989289a8198a544220703c2bf"
+
 DEPENDS = "ncurses \
           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "base-files"
 
-PR = "r4"
-
-SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-14.diff.gz;name=patch \
-           file://configure.patch \
+SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://fix-parallel-make.patch \
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
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
+           file://Remove-redundant-compiler-sanity-checks.patch \
+           file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
+           file://Skip-host-file-system-checks-when-cross-compiling.patch \
+           file://Avoid-mis-identifying-systems-as-SVR4.patch"
+
+SRC_URI[md5sum] = "5bb3b0ff2674e29378c31ad3411170ad"
+SRC_URI[sha256sum] = "fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63"
 
 inherit autotools texinfo
 
-- 
2.1.4


