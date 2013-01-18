Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TwAX6-0001jf-MV
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 12:55:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2013 03:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="275442370"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2013 03:39:21 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:39:31 +0200
Message-Id: <1358509171-19924-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1358509171-19924-1-git-send-email-cristian.iorga@intel.com>
References: <1358509171-19924-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/2] alsa-utils: upgrade to 1.0.26
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
X-List-Received-Date: Fri, 18 Jan 2013 11:55:11 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../alsa/alsa-utils-1.0.25/ncursesfix.patch        |   44 --------------------
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |    0
 .../obsolete_automake_macros.patch                 |    0
 .../uclibc-exp10-replacement.patch                 |    0
 .../{alsa-utils_1.0.25.bb => alsa-utils_1.0.26.bb} |    7 ++--
 5 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.25 => alsa-utils}/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.25 => alsa-utils}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.25 => alsa-utils}/uclibc-exp10-replacement.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.25.bb => alsa-utils_1.0.26.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
deleted file mode 100644
index 9936ded..0000000
--- a/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/ncursesfix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Rebase the patch to fit 1.0.24.2
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN alsa-utils-1.0.24.2-orig//configure.in alsa-utils-1.0.24.2/configure.in
---- alsa-utils-1.0.24.2-orig//configure.in	2011-04-13 13:51:20.337665010 +0800
-+++ alsa-utils-1.0.24.2/configure.in	2011-04-13 13:51:54.437664986 +0800
-@@ -127,34 +127,16 @@
-   NCURSESLIBSUFFIX=""
-   CURSES_NLS="no"
-   if test "$curseslib" = "ncursesw" -o \( "$curseslib" = "auto" -a "$USE_NLS" = "yes" \); then
--    AC_CHECK_PROG([ncursesw5_config], [ncursesw5-config], [yes])
--    if test "$ncursesw5_config" = "yes"; then
--      CURSESINC="<ncurses.h>"
--      CURSESLIB=`ncursesw5-config --libs`
--      CURSESLIBDIR=`ncursesw5-config --libdir`
--      CURSES_CFLAGS=`ncursesw5-config --cflags`
--      curseslib="ncursesw"
--    else
-       AC_CHECK_LIB(ncursesw, initscr,
-                  [ CURSESINC='<ncurses.h>'; CURSESLIB='-lncursesw'; curseslib="ncursesw"])
--    fi
-     if test -n "$CURSESINC"; then
-       NCURSESLIBSUFFIX="w"
-       CURSES_NLS="yes"
-     fi
-   fi
-   if test "$curseslib" = "ncurses" -o "$curseslib" = "auto"; then
--    AC_CHECK_PROG([ncurses5_config], [ncurses5-config], [yes])
--    if test "$ncurses5_config" = "yes"; then
--      CURSESINC="<ncurses.h>"
--      CURSESLIB=`ncurses5-config --libs`
--      CURSESLIBDIR=`ncurses5-config --libdir`
--      CURSES_CFLAGS=`ncurses5-config --cflags`
--      curseslib="ncurses"
--    else
-       AC_CHECK_LIB(ncurses, initscr,
-                  [ CURSESINC='<ncurses.h>'; CURSESLIB='-lncurses'; curseslib="ncurses"])
--    fi
-   fi
-   if test "$curseslib" = "curses" -o "$curseslib" = "auto"; then
-     AC_CHECK_LIB(curses, initscr,
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.25/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
rename to meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/obsolete_automake_macros.patch b/meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.25/obsolete_automake_macros.patch
rename to meta/recipes-multimedia/alsa/alsa-utils/obsolete_automake_macros.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.25/uclibc-exp10-replacement.patch b/meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-1.0.25/uclibc-exp10-replacement.patch
rename to meta/recipes-multimedia/alsa/alsa-utils/uclibc-exp10-replacement.patch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
index ab8d845..1c537af 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
@@ -6,17 +6,16 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://ncursesfix.patch \
            file://uclibc-exp10-replacement.patch \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
            file://obsolete_automake_macros.patch \
           "
 
-SRC_URI[md5sum] = "f81f9dcb9a014fd32cb3a70066a5b9a9"
-SRC_URI[sha256sum] = "2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb615705b302c"
+SRC_URI[md5sum] = "4dcf1017fafc91603af96705c073eca9"
+SRC_URI[sha256sum] = "f85f2a3aa6e78475bbe35b0cad3a8cabb99f45ebc5f37962f2137b8df8b081e7"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
-- 
1.7.10.4



