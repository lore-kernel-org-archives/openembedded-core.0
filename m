Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id E014371C96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:16 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 094F3B88D8E; Thu,  8 Dec 2016 22:47:59 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:38 +0100
Message-Id: <1481233677-27298-15-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Subject: [PATCH v2 14/33] apt-native: drop obsolete patches
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch and
noconfigure.patch are obsolete due to dpkg's new --force-script-chrootless
option.

db_linking_hack.patch and environment.patch are marked as backports
from 2007.

no-curl.patch: curl-native is already a prerequisite.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt-native_1.2.12.bb     |   6 +-
 ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 126 ---------------------
 meta/recipes-devtools/apt/apt/noconfigure.patch    |  37 ------
 .../apt/files/db_linking_hack.patch                |  29 -----
 meta/recipes-devtools/apt/files/environment.patch  |  15 ---
 meta/recipes-devtools/apt/files/no-curl.patch      |  54 ---------
 6 files changed, 1 insertion(+), 266 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/noconfigure.patch
 delete mode 100644 meta/recipes-devtools/apt/files/db_linking_hack.patch
 delete mode 100644 meta/recipes-devtools/apt/files/environment.patch
 delete mode 100644 meta/recipes-devtools/apt/files/no-curl.patch

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
index 695e21d..8d32ef9 100644
--- a/meta/recipes-devtools/apt/apt-native_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
@@ -5,12 +5,8 @@ DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
 PACKAGES = ""
 USE_NLS = "yes"
 
-SRC_URI += "file://db_linking_hack.patch \
-            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-            file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
+SRC_URI += "file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
             file://0001-fix-the-gcc-version-check.patch \
-            file://noconfigure.patch \
-            file://no-curl.patch \
             file://apt.conf.in \
 "
 
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
deleted file mode 100644
index b3a883b..0000000
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From dfc1370d50322e2e9d225a7a63b44993fc01a727 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Fri, 22 May 2015 08:05:15 +0800
-Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
- dpkg callings"
-
-Upstream-Status: Inappropriate [embedded specific]
-
-This reverts commit a2a75ff4516f7609f4c55b42270abb8d08943c60, which
-always run 'dpkg --configure -a' at the end of our dpkg callings,
-but it does not work for cross-compile, since the rootfs dir can not
-be passed into dpkg, and lead to the below similar error:
-   -------
-   |mkdir: cannot create directory '/usr/lib/opkg': Permission denied
-   -------
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- apt-pkg/deb/dpkgpm.cc                                     |  9 ++-------
- test/integration/test-apt-progress-fd-deb822              | 14 +++++++-------
- test/integration/test-no-fds-leaked-to-maintainer-scripts |  6 ++----
- 3 files changed, 11 insertions(+), 18 deletions(-)
-
-diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 834cb0e..84ded3a 100644
---- a/apt-pkg/deb/dpkgpm.cc
-+++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1037,12 +1037,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
- 	 PackagesTotal++;
-       }
-    }
--   /* one extra: We don't want the progress bar to reach 100%, especially not
--      if we call dpkg --configure --pending and process a bunch of triggers
--      while showing 100%. Also, spindown takes a while, so never reaching 100%
--      is way more correct than reaching 100% while still doing stuff even if
--      doing it this way is slightly bending the rules */
--   ++PackagesTotal;
- }
-                                                                         /*}}}*/
- bool pkgDPkgPM::Go(int StatusFd)
-@@ -1250,8 +1244,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
- 
-    // support subpressing of triggers processing for special
-    // cases like d-i that runs the triggers handling manually
-+   bool const SmartConf = (_config->Find("PackageManager::Configure", "all") != "all");
-    bool const TriggersPending = _config->FindB("DPkg::TriggersPending", false);
--   if (_config->FindB("DPkg::ConfigurePending", true) == true)
-+   if (_config->FindB("DPkg::ConfigurePending", SmartConf) == true)
-       List.push_back(Item(Item::ConfigurePending, PkgIterator()));
- 
-    // for the progress
-diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/integration/test-apt-progress-fd-deb822
-index 58fd732..3359762 100755
---- a/test/integration/test-apt-progress-fd-deb822
-+++ b/test/integration/test-apt-progress-fd-deb822
-@@ -27,36 +27,36 @@ Message: Installing testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 16.6667
-+Percent: 20
- Message: Preparing testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 33.3333
-+Percent: 40
- Message: Unpacking testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 50
-+Percent: 60
- Message: Preparing to configure testing (amd64)
- 
- Status: progress
--Percent: 50
-+Percent: 60
- Message: Running dpkg
- 
- Status: progress
- Package: testing:amd64
--Percent: 50
-+Percent: 60
- Message: Configuring testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 66.6667
-+Percent: 80
- Message: Configuring testing (amd64)
- 
- Status: progress
- Package: testing:amd64
--Percent: 83.3333
-+Percent: 100
- Message: Installed testing (amd64)
- 
- Status: progress
-diff --git a/test/integration/test-no-fds-leaked-to-maintainer-scripts b/test/integration/test-no-fds-leaked-to-maintainer-scripts
-index d86e638..ef6d23b 100755
---- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
-+++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
-@@ -59,8 +59,7 @@ startup packages configure
- configure $PKGNAME 1.0 <none>
- status unpacked $PKGNAME 1.0
- status half-configured $PKGNAME 1.0
--status installed $PKGNAME 1.0
--startup packages configure" cut -f 3- -d' ' rootdir/var/log/dpkg.log
-+status installed $PKGNAME 1.0" cut -f 3- -d' ' rootdir/var/log/dpkg.log
- }
- checkinstall
- 
-@@ -85,8 +84,7 @@ status config-files $PKGNAME 1.0
- status config-files $PKGNAME 1.0
- status config-files $PKGNAME 1.0
- status config-files $PKGNAME 1.0
--status not-installed $PKGNAME <none>
--startup packages configure" cut -f 3- -d' ' rootdir/var/log/dpkg.log
-+status not-installed $PKGNAME <none>" cut -f 3- -d' ' rootdir/var/log/dpkg.log
- }
- checkpurge
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/apt/apt/noconfigure.patch b/meta/recipes-devtools/apt/apt/noconfigure.patch
deleted file mode 100644
index ebc6720..0000000
--- a/meta/recipes-devtools/apt/apt/noconfigure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-
-diff --git a/apt-pkg/packagemanager.cc b/apt-pkg/packagemanager.cc
-index 249542c..0a1911f 100644
---- a/apt-pkg/packagemanager.cc
-+++ b/apt-pkg/packagemanager.cc
-@@ -952,10 +952,12 @@ bool pkgPackageManager::SmartUnPack(PkgIterator Pkg, bool const Immediate, int c
-       return false;
- 
-    if (Immediate == true) {
-+#if 0
-       // Perform immedate configuration of the package. 
-          if (SmartConfigure(Pkg, Depth + 1) == false)
-             _error->Error(_("Could not perform immediate configuration on '%s'. "
-                "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
-+#endif
-    }
-    
-    return true;
-@@ -1038,6 +1040,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
-       }
-    }
- 
-+#if 0
-    // Final run through the configure phase
-    if (ConfigureAll() == false)
-       return Failed;
-@@ -1052,6 +1055,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
- 	 return Failed;
-       }
-    }
-+#endif
- 	 
-    return Completed;
- }
diff --git a/meta/recipes-devtools/apt/files/db_linking_hack.patch b/meta/recipes-devtools/apt/files/db_linking_hack.patch
deleted file mode 100644
index a61d4b0..0000000
--- a/meta/recipes-devtools/apt/files/db_linking_hack.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-
-Index: apt-0.7.3/configure.ac
-===================================================================
---- apt-0.7.3.orig/configure.ac	2007-07-01 10:38:45.000000000 +0000
-+++ apt-0.7.3/configure.ac	2007-08-21 13:39:26.000000000 +0000
-@@ -67,8 +67,20 @@
-       [AC_DEFINE(HAVE_BDB)
-        BDBLIB="-ldb"
-        AC_MSG_RESULT(yes)],
--      [BDBLIB=""
--       AC_MSG_RESULT(no)]
-+
-+       LIBS="$LIBS -lpthread"
-+       [AC_MSG_CHECKING(if we can link against BerkeleyDB with pthread)
-+        AC_LINK_IFELSE(
-+        [AC_LANG_PROGRAM(
-+         [#include <db.h>],
-+         [int r, s, t; db_version(&r, &s, &t);]
-+        )],
-+        [AC_DEFINE(HAVE_BDB)
-+         BDBLIB="-ldb -lpthread"
-+         AC_MSG_RESULT(yes)],
-+        [BDBLIB=""
-+         AC_MSG_RESULT(no)]
-+      )]       
-     )]
- )
- 
diff --git a/meta/recipes-devtools/apt/files/environment.patch b/meta/recipes-devtools/apt/files/environment.patch
deleted file mode 100644
index 9a03038..0000000
--- a/meta/recipes-devtools/apt/files/environment.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport
-
-Index: apt-0.6.46.2/buildlib/environment.mak.in
-===================================================================
---- apt-0.6.46.2.orig/buildlib/environment.mak.in	2007-03-29 11:38:58.000000000 +0100
-+++ apt-0.6.46.2/buildlib/environment.mak.in	2007-03-29 11:39:12.000000000 +0100
-@@ -62,7 +62,7 @@
- 
- # Shared library things
- HOST_OS = @host_os@
--ifneq ($(words $(filter linux-gnu gnu% %gnu,$(HOST_OS))),0)
-+ifneq ($(words $(filter linux-gnu linux-gnueabi gnu% %gnu,$(HOST_OS))),0)
-    SONAME_MAGIC=-Wl,-soname -Wl,
-    LFLAGS_SO=
- else
diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/recipes-devtools/apt/files/no-curl.patch
deleted file mode 100644
index 0838552..0000000
--- a/meta/recipes-devtools/apt/files/no-curl.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-From 5d61ac822fd9a3871cd5089389c210606232ecdc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Thu, 26 May 2016 15:34:45 -0500
-Subject: [PATCH] Upstream-Status: Inappropriate [configuration]
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
----
- configure.ac     | 7 -------
- methods/makefile | 7 -------
- 2 files changed, 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e47f459..cd24264 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -83,13 +83,6 @@ AC_CHECK_HEADER(db.h,
- 
- LIBS="$saveLIBS"
- 
--AC_CHECK_LIB(curl, curl_easy_init,
--     [AC_CHECK_HEADER(curl/curl.h,
--        curl_ok=yes,
--        curl_ok=no)],
--     AC_MSG_ERROR([failed: I need CURL due https support]),
--)
--
- AC_SUBST(BDBLIB)
- 
- HAVE_ZLIB=no
-diff --git a/methods/makefile b/methods/makefile
-index 3274e92..255086b 100644
---- a/methods/makefile
-+++ b/methods/makefile
-@@ -51,13 +51,6 @@ LIB_MAKES = apt-pkg/makefile
- SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc server.cc
- include $(PROGRAM_H)
- 
--# The https method
--PROGRAM=https
--SLIBS = -lapt-pkg -lcurl $(INTLLIBS) -lresolv
--LIB_MAKES = apt-pkg/makefile
--SOURCE = https.cc server.cc
--include $(PROGRAM_H)
--
- # The ftp method
- PROGRAM=ftp
- SLIBS = -lapt-pkg $(SOCKETLIBS) $(INTLLIBS) -lresolv
--- 
-2.1.4
-
-- 
2.7.4


