Return-Path: <ismo.puustinen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 69EA1780D6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 13:49:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 07 Jun 2017 06:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="865507137"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2017 06:49:54 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 16:49:42 +0300
Message-Id: <20170607134942.13281-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH v2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Wed, 07 Jun 2017 13:49:54 -0000

The three libraries' (readline, gdbm, and db) licenses belong to the
GPLv3 family. Add them to to PACKAGECONFIG so they can be switched off
if the licensing doesn't allow using them. Python build system
autodetects the dependencies but doesn't allow them to be explicitly
disabled, so just deal with the dependencies.

The defaults in PACKAGECONFIG are the same as before, so there should be
no change to current users.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.3.bb | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index d7c29f2..e9a1e6b 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -1,6 +1,6 @@
 require recipes-devtools/python/python.inc
 
-DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib virtual/libintl xz"
+DEPENDS = "python3-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz"
 PR = "${INC_PR}.0"
 PYTHON_MAJMIN = "3.5"
 PYTHON_BINABI= "${PYTHON_MAJMIN}m"
@@ -76,6 +76,11 @@ export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dy
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
+PACKAGECONFIG ??= "readline gdbm db"
+PACKAGECONFIG[readline] = ",,readline"
+PACKAGECONFIG[gdbm] = ",,gdbm"
+PACKAGECONFIG[db] = ",,db"
+
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
@@ -194,7 +199,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
 RPROVIDES_${PN}-modules = "${PN}"
-RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-core = "${@bb.utils.contains('PACKAGECONFIG', 'readline', '${PN}-readline', '', d)}"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
@@ -222,3 +227,17 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
+
+# If readline is not there, don't create python3-readline package. Same
+# for gdbm and db.
+PACKAGES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', '${PN}-readline', d)}"
+PROVIDES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', '${PN}-readline', d)}"
+RDEPENDS_${PN}-modules_remove += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', '${PN}-readline', d)}"
+
+PACKAGES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '${PN}-gdbm', d)}"
+PROVIDES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '${PN}-gdbm', d)}"
+RDEPENDS_${PN}-modules_remove += "${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '${PN}-gdbm', d)}"
+
+PACKAGES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'db', '', '${PN}-db', d)}"
+PROVIDES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'db', '', '${PN}-db', d)}"
+RDEPENDS_${PN}-modules_remove += "${@bb.utils.contains('PACKAGECONFIG', 'db', '', '${PN}-db', d)}"
-- 
2.9.4


