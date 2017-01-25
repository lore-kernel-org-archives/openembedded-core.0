Return-Path: <ismo.puustinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4F57C731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:03:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2017 05:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="926476156"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga003.jf.intel.com with ESMTP; 25 Jan 2017 05:03:44 -0800
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 15:03:36 +0200
Message-Id: <20170125130336.20833-2-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170125130336.20833-1-ismo.puustinen@intel.com>
References: <20170125130336.20833-1-ismo.puustinen@intel.com>
Subject: [PATCH 2/2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Wed, 25 Jan 2017 13:03:44 -0000

The three libraries' (readline, gdbm, and db) licenses belong to the
GPLv3 family. Add them to to PACKAGECONFIG so they can be switched off
if the licensing doesn't allow using them. Python build system
autodetects the dependencies but doesn't allow them to be explicitly
disabled, so just deal with the dependencies.

The defaults in PACKAGECONFIG are the same as before, so there should be
no change to current users.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.2.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 2ff7c9e..1a78a36 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
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
 RPROVIDES_${PN}-core = "${PN}"
-RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-core = "${@bb.utils.contains('PACKAGECONFIG', 'readline', '${PN}-readline', '', d)}"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
@@ -222,3 +227,8 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
+
+# if readline is not there, don't create python3-readline package
+PACKAGES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', '${PN}-readline', d)}"
+PROVIDES_remove += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', '${PN}-readline', d)}"
+RDEPENDS_${PN}-modules_remove += "${@bb.utils.contains('PACKAGECONFIG', 'readline', '', '${PN}-readline', d)}"
-- 
2.9.3


