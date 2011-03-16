Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q00B0-0003kf-FE
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 00:30:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GNT1gu014305
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 16:29:01 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 16:29:00 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@lists.pokylinux.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2011 18:30:02 -0500
Message-ID: <526eb0e9906e6fae324d087708a71626563f5457.1300318053.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1300318053.git.mark.hatle@windriver.com>
References: <cover.1300318053.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 7/7] sat-solver: Fix solution DB generation and general cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 23:30:50 -0000
Content-Type: text/plain

Uprev sat-solver to the latest git version.  This corrects the solv db
generation with RPM5.

Refactor the patches for RPM5 support, cleaning up components of the
cmake.patch for submission upstream.  (Also fix a problem remaining
in the upstream with a mismatched function name.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 .../sat-solver/sat-solver/cmake.patch              |   58 ++---------------
 .../sat-solver/sat-solver/rpm5-solvdb.patch        |   30 ---------
 .../sat-solver/sat-solver/rpm5.patch               |   53 ---------------
 .../sat-solver/sat-solver/sat-solver_rpm5.patch    |   67 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    7 +-
 6 files changed, 78 insertions(+), 139 deletions(-)
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch
 delete mode 100644 meta/recipes-extended/sat-solver/sat-solver/rpm5.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch

diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
index cc1e188..9a0a32f 100644
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ b/meta/conf/distro/include/poky-default-revisions.inc
@@ -165,7 +165,7 @@ SRCREV_pn-qemu-nativesdk ??= "${QEMUSRCREV}"
 SRCREV_pn-qemu ??= "${QEMUSRCREV}"
 SRCREV_pn-qemugl ??= "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 SRCREV_pn-qemugl-nativesdk ??= "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
-SRCREV_pn-sat-solver = "20212ccd92c6b3a5a93a83da5d7d60e9c305e75c"
+SRCREV_pn-sat-solver = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 SRCREV_pn-screenshot ??= "292"
 SRCREV_pn-settings-daemon ??= "0f174f463dfed500b65533e249cd22942e439c77"
 SRCREV_pn-swabber-native ??= "a0792390c5d6d5a5bade7ab155c80eef3f30fa52"
diff --git a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
index 854bd40..52319f0 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
@@ -1,59 +1,15 @@
-check rpm
+Enable debugging for all builds
 not building docs (need oxygen)
 
 8/19/2010 - created by Qing He <qing.he@intel.com>
 1/24/2011 - Disable Fedora/Debian checking/settings by Mark Hatle <mark.hatle@windriver.com>
 3/15/2011 - Updated to newer version of sat-solver by Mark Hatle <mark.hatle@windriver.com>
+3/16/2011 - Split original patch and simplify by Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur git.orig/CMakeLists.txt git/CMakeLists.txt
---- git.orig/CMakeLists.txt	2011-03-15 17:14:22.000000000 -0500
-+++ git/CMakeLists.txt	2011-03-15 17:20:09.648880770 -0500
-@@ -35,22 +35,15 @@
- FIND_PACKAGE(Check REQUIRED)
- FIND_PACKAGE(ZLIB REQUIRED)
- 
--IF ( FEDORA )
--MESSAGE(STATUS "Building for Fedora")
--ADD_DEFINITIONS( -DFEDORA )
--ENDIF ( FEDORA)
--
--IF ( DEBIAN )
--MESSAGE(STATUS "Building for Debian")
--ADD_DEFINITIONS( -DDEBIAN -DDEBIAN_SEMANTICS)
--ENDIF ( DEBIAN )
--
- IF ( MULTI_SEMANTICS )
- MESSAGE(STATUS "Enabling multi dist support")
- ADD_DEFINITIONS( -DMULTI_SEMANTICS)
- ENDIF ( MULTI_SEMANTICS )
- 
--IF ( NOT DEBIAN )
-+FIND_PACKAGE(PkgConfig REQUIRED)
-+PKG_CHECK_MODULES(RPM REQUIRED rpm)
-+INCLUDE_DIRECTORIES( ${RPM_INCLUDE_DIRS} )
-+
- FIND_LIBRARY(RPMDB_LIBRARY NAMES rpmdb)
- IF ( NOT RPMDB_LIBRARY )
- FIND_LIBRARY(RPMDB_LIBRARY NAMES rpm)
-@@ -59,13 +52,14 @@
- IF ( RPMIO_LIBRARY )
- SET( RPMDB_LIBRARY ${RPMIO_LIBRARY} ${RPMDB_LIBRARY} )
- ENDIF ( RPMIO_LIBRARY )
--IF ( FEDORA )
-+FIND_LIBRARY(RPMMISC_LIBRARY NAMES rpmmisc)
-+IF ( RPMMISC_LIBRARY )
-+SET( RPMDB_LIBRARY ${RPMMISC_LIBRARY} ${RPMDB_LIBRARY} )
-+ENDIF ( RPMMISC_LIBRARY )
- FIND_LIBRARY(DB_LIBRARY NAMES db)
- IF ( DB_LIBRARY )
- SET( RPMDB_LIBRARY ${DB_LIBRARY} ${RPMDB_LIBRARY} )
- ENDIF ( DB_LIBRARY )
--ENDIF ( FEDORA )
--ENDIF ( NOT DEBIAN )
- 
- INCLUDE ( CheckFunctionExists )
- INCLUDE ( TestBigEndian )
-@@ -164,7 +158,7 @@
+diff -ur git.orig2/CMakeLists.txt git/CMakeLists.txt
+--- git.orig2/CMakeLists.txt	2011-03-16 16:29:43.532032285 -0500
++++ git/CMakeLists.txt	2011-03-16 16:32:59.982034501 -0500
+@@ -177,7 +177,7 @@
  
  MESSAGE(STATUS "Looking modules in ${CMAKE_MODULE_PATH}")
  
@@ -62,7 +18,7 @@ diff -ur git.orig/CMakeLists.txt git/CMakeLists.txt
  set ( CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -g -O3" )
  set ( CMAKE_C_FLAGS_DEBUG     "${CMAKE_C_FLAGS} -g3 -O0" )
  
-@@ -173,7 +167,7 @@
+@@ -186,7 +186,7 @@
  ADD_SUBDIRECTORY(tools)
  ADD_SUBDIRECTORY(tests)
  ADD_SUBDIRECTORY(examples)
diff --git a/meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch b/meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch
deleted file mode 100644
index 8ce1b15..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/rpm5-solvdb.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-sat-solver rpmdb based solv database construction
-
-The first time the database is created on an RPM5 system it works 
-correctly.  However any subsequent rebuilds cause an empty database to 
-occur.
-
-The following is from Michael Schroeder <mls@suse.de>:
-> rpmdb2solv contains a hack that makes it use the unchanged already
-> converted packages. To do this, it needs to get the database id
-> for every installed packages by reading the "Name" index. This
-> somehow doesn't seem to work with rpm5.
->
-> As a workaround you can add a "ref = 0;" line at the top of the
-> repo_add_rpmdb() function in ext/repo_rpmdb.c.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur git.orig/ext/repo_rpmdb.c git/ext/repo_rpmdb.c
---- git.orig/ext/repo_rpmdb.c	2011-03-16 09:43:50.470008215 -0500
-+++ git/ext/repo_rpmdb.c	2011-03-16 09:47:55.503989694 -0500
-@@ -1344,6 +1344,9 @@
-   memset(&dbkey, 0, sizeof(dbkey));
-   memset(&dbdata, 0, sizeof(dbdata));
- 
-+  /* Workaround for RPM 5 database construction */
-+  ref = 0;
-+
-   if (!rootdir)
-     rootdir = "";
- 
diff --git a/meta/recipes-extended/sat-solver/sat-solver/rpm5.patch b/meta/recipes-extended/sat-solver/sat-solver/rpm5.patch
deleted file mode 100644
index 5ab6321..0000000
--- a/meta/recipes-extended/sat-solver/sat-solver/rpm5.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-fix rpm5 build
-
-8/19/2010 - created by Qing He <qing.he@intel.com>
-
-
-pgpDigNew/pgpDigFree has changed in RPM 5.4.0
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/ext/repo_rpmdb.c b/ext/repo_rpmdb.c
-index 34f2b65..3c6ab9a 100644
---- a/ext/repo_rpmdb.c
-+++ b/ext/repo_rpmdb.c
-@@ -21,10 +21,11 @@
- #include <string.h>
- #include <unistd.h>
- #include <assert.h>
-+#include <stdint.h>
- 
- #include <rpm/rpmio.h>
- #include <rpm/rpmpgp.h>
--#include <rpm/header.h>
-+//#include <rpm/header.h>
- #include <rpm/rpmdb.h>
- 
- #ifndef DB_CREATE
-@@ -2466,7 +2467,7 @@ rpm_byrpmh(Header h, void **statep)
-   int sigdsize, sigcnt, l;
-   RpmHead *rpmhead;
- 
--  uh = headerUnload(h);
-+  uh = headerUnload(h, NULL);
-   if (!uh)
-     return 0;
-   sigcnt = getu32(uh);
-@@ -2982,7 +2983,7 @@ pubkey2solvable(Solvable *s, Repodata *data, char *pubkey)
-   parsekeydata(s, data, pkts, pktsl);
-   /* only rpm knows how to do the release calculation, we don't dare
-    * to recreate all the bugs */
--  dig = pgpNewDig();
-+  dig = pgpDigNew(RPMVSF_DEFAULT, 0);
-   (void) pgpPrtPkts(pkts, pktsl, dig, 0);
-   btime = dig->pubkey.time[0] << 24 | dig->pubkey.time[1] << 16 | dig->pubkey.time[2] << 8 | dig->pubkey.signid[3];
-   sprintf(evrbuf, "%02x%02x%02x%02x-%02x%02x%02x%02x", dig->pubkey.signid[4], dig->pubkey.signid[5], dig->pubkey.signid[6], dig->pubkey.signid[7], dig->pubkey.time[0], dig->pubkey.time[1], dig->pubkey.time[2], dig->pubkey.time[3]);
-@@ -2996,7 +2997,7 @@ pubkey2solvable(Solvable *s, Repodata *data, char *pubkey)
-   repodata_set_str(data, s - s->repo->pool->solvables, PUBKEY_KEYID, keyid);
-   if (dig->pubkey.userid)
-     setutf8string(data, s - s->repo->pool->solvables, SOLVABLE_SUMMARY, dig->pubkey.userid);
--  pgpFreeDig(dig);
-+  (void) pgpDigFree(dig);
-   sat_free((void *)pkts);
-   return 1;
- }
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
new file mode 100644
index 0000000..1776f6c
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
@@ -0,0 +1,67 @@
+Add RPM5 configuration support
+
+Update the cmake configuration to detect additional files needed by RPM5.
+
+Original work by Qing He <qing.he@intel.com>.
+
+Merged and updated to make this more likely to be accepted upstream.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/CMakeLists.txt git/CMakeLists.txt
+--- git.orig/CMakeLists.txt	2011-03-16 16:16:29.152786178 -0500
++++ git/CMakeLists.txt	2011-03-16 16:29:43.532032285 -0500
+@@ -50,7 +50,16 @@
+ ADD_DEFINITIONS( -DMULTI_SEMANTICS)
+ ENDIF ( MULTI_SEMANTICS )
+ 
+-IF ( NOT DEBIAN )
++if ( RPM5 )
++MESSAGE(STATUS "Enabling RPM 5 support")
++ADD_DEFINITIONS( -DRPM5)
++
++FIND_PACKAGE(PkgConfig REQUIRED)
++PKG_CHECK_MODULES(RPM REQUIRED rpm)
++INCLUDE_DIRECTORIES( ${RPM_INCLUDE_DIRS} )
++ENDIF ( RPM5 )
++
++IF ( RPM5 OR NOT DEBIAN )
+ FIND_LIBRARY(RPMDB_LIBRARY NAMES rpmdb)
+ IF ( NOT RPMDB_LIBRARY )
+ FIND_LIBRARY(RPMDB_LIBRARY NAMES rpm)
+@@ -59,13 +68,17 @@
+ IF ( RPMIO_LIBRARY )
+ SET( RPMDB_LIBRARY ${RPMIO_LIBRARY} ${RPMDB_LIBRARY} )
+ ENDIF ( RPMIO_LIBRARY )
+-IF ( FEDORA )
++FIND_LIBRARY(RPMMISC_LIBRARY NAMES rpmmisc)
++IF ( RPMMISC_LIBRARY )
++SET ( RPMDB_LIBRARY ${RPMMISC_LIBRARY} ${RPMDB_LIBRARY} )
++ENDIF ( RPMMISC_LIBRARY )
++IF ( RPM5 OR FEDORA )
+ FIND_LIBRARY(DB_LIBRARY NAMES db)
+ IF ( DB_LIBRARY )
+ SET( RPMDB_LIBRARY ${DB_LIBRARY} ${RPMDB_LIBRARY} )
+ ENDIF ( DB_LIBRARY )
+-ENDIF ( FEDORA )
+-ENDIF ( NOT DEBIAN )
++ENDIF ( RPM5 OR FEDORA )
++ENDIF ( RPM5 OR NOT DEBIAN )
+ 
+ INCLUDE ( CheckFunctionExists )
+ INCLUDE ( TestBigEndian )
+diff -ur git.orig/ext/repo_rpmdb.c git/ext/repo_rpmdb.c
+--- git.orig/ext/repo_rpmdb.c	2011-03-16 18:03:55.401907738 -0500
++++ git/ext/repo_rpmdb.c	2011-03-16 18:04:47.472989651 -0500
+@@ -3039,7 +3039,11 @@
+   repodata_set_str(data, s - s->repo->pool->solvables, PUBKEY_KEYID, keyid);
+   if (dig->pubkey.userid)
+     setutf8string(data, s - s->repo->pool->solvables, SOLVABLE_SUMMARY, dig->pubkey.userid);
++#ifndef RPM5
+   (void)pgpFreeDig(dig);
++#else
++  (void)pgpDigFree(dig);
++#endif
+   sat_free((void *)pkts);
+   return 1;
+ }
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index a6519d5..ba5af67 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,12 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
+           file://sat-solver_rpm5.patch \
            file://cmake.patch \
-           file://rpm5.patch \
-           file://rpm5-solvdb.patch \
            file://db5.patch \
            file://builtin-arch.patch;apply=no \
            file://no-builtin-arch.patch;apply=no \
@@ -20,7 +19,7 @@ SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE += "-DLIB=lib"
+EXTRA_OECMAKE += "-DLIB=lib -DRPM5=RPM5"
 
 inherit cmake pkgconfig
 
-- 
1.7.3.4



