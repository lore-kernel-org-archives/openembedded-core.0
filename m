Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2KXF-0001H9-R0
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:48:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 03:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="286266281"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2013 03:32:39 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 13:33:26 +0200
Message-Id: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] pseudo: fix sqlite path and package missing files
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
X-List-Received-Date: Mon, 04 Feb 2013 11:48:31 -0000

- replace --enable-sqlite-static with --with-sqlite-static=.. in order
to pass ${baselib} to configure (/lib doesn't work for the multilib
lib32 build)
- use ${exec_prefix}/lib instead of ${libdir} because pseudo always
uses /usr/lib

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../pseudo/files/modify-static-sqlite-option.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc            |  9 ++++---
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |  2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  2 +-
 4 files changed, 38 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/modify-static-sqlite-option.patch

diff --git a/meta/recipes-devtools/pseudo/files/modify-static-sqlite-option.patch b/meta/recipes-devtools/pseudo/files/modify-static-sqlite-option.patch
new file mode 100644
index 0000000..e34da73
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/modify-static-sqlite-option.patch
@@ -0,0 +1,31 @@
+Replace --enable-static-sqlite with --with-static-sqlite=... so that
+the user can pass the sqlite location
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: pseudo-1.4.1/configure
+===================================================================
+--- pseudo-1.4.1.orig/configure
++++ pseudo-1.4.1/configure
+@@ -36,7 +36,7 @@ usage()
+     echo >&2 "           [--libdir=...]"
+     echo >&2 "           [--suffix=...]"
+     echo >&2 "           [--with-sqlite=...]"
+-    echo >&2 "           [--enable-static-sqlite]"
++    echo >&2 "           [--with-static-sqlite=...]"
+     echo >&2 "           [--with-rpath=...|--without-rpath]"
+     echo >&2 "           [--cflags='']"
+     echo >&2 "           [--bits=32|64]"
+@@ -58,8 +58,9 @@ do
+     --libdir=*)
+         opt_libdir=${arg#--libdir=}
+         ;;
+-    --enable-static-sqlite)
+-        sqlite_ldarg='$(SQLITE)/lib/libsqlite3.a'
++    --with-static-sqlite=*)
++        opt_static_sqlite=${arg#--with-static-sqlite=}
++        sqlite_ldarg='$(SQLITE)'/${opt_static_sqlite}
+         use_maybe_rpath=false
+         ;;
+     --with-sqlite=*)
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 98f706c..596f490 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -12,9 +12,10 @@ DEPENDS = "sqlite3"
 SRC_URI_append_class-nativesdk = " file://symver.patch"
 
 SRC_URI_append_class-native = " file://symver.patch"
+SRC_URI_append = " file://modify-static-sqlite-option.patch"
 
-FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
-FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
+FILES_${PN} = "${exec_prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
+FILES_${PN}-dbg += "${exec_prefix}/lib/pseudo/lib*/.debug"
 PROVIDES += "virtual/fakeroot"
 
 MAKEOPTS = ""
@@ -30,9 +31,9 @@ NO32LIBS ??= "1"
 # Compile for the local machine arch...
 do_compile () {
 	if [ "${SITEINFO_BITS}" = "64" ]; then
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite=${baselib}/libsqlite3.a --without-rpath
 	else
-	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite=${baselib}/libsqlite3.a --without-rpath
 	fi
 	oe_runmake ${MAKEOPTS}
 }
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
index 70fe9c0..8367a34 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index e394ffb..c8ec5ad 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,7 +2,7 @@ require pseudo.inc
 
 SRCREV = "398a264490713c912b4ce465251a8a82a7905f45"
 PV = "1.4.1+git${SRCPV}"
-PR = "r28"
+PR = "r29"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.11.7



