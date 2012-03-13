Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Zk9-0003k6-KO
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 22:58:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 14:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128621559"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 14:50:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 14:50:11 -0700
Message-Id: <1331675411-8930-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2] docbook-utils: Add check to not sed files twice
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
X-List-Received-Date: Tue, 13 Mar 2012 21:58:57 -0000

This comes about from the code configure code getting run
multiple times on the same WORKDIR and re-sed'ing already
modified files.

v2: add space after .sed_done (tested with this version)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
index c2ccef3..96459dc 100644
--- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz"
 
@@ -18,12 +18,15 @@ inherit autotools native
 
 do_configure_prepend() {
 	# Fix hard-coded references to /etc/sgml
-	sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" bin/jw.in
-	sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/man/Makefile.am
-	sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/HTML/Makefile.am
-
-	# Point jw to the native sysroot catalog
-	sed -i -e 's|^SGML_EXTRA_CATALOGS=""|SGML_EXTRA_CATALOGS=":${sysconfdir}/sgml/catalog"|g' bin/jw.in
+	if [ ! -e ${WORKDIR}/.sed_done ]; then
+		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" bin/jw.in
+		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/man/Makefile.am
+		sed -i -e "s|/etc/sgml|${sysconfdir}/sgml|g" doc/HTML/Makefile.am
+
+		# Point jw to the native sysroot catalog
+		sed -i -e 's|^SGML_EXTRA_CATALOGS=""|SGML_EXTRA_CATALOGS=":${sysconfdir}/sgml/catalog"|g' bin/jw.in
+		touch ${WORKDIR}/.sed_done
+	fi
 }
 
 do_install() {
-- 
1.7.7.6



