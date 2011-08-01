Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7L-0006a3-9q
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147064"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:35:57 -0700
Message-Id: <358ebe8d2a6ae087711c142fe29e66fa8fea2e8a.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 05/22] docbook-dsssl-stylesheets-native: Write a bak file for shared state
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:51 -0000

This patch writes a sgml-docbook.bak that is read by the sgml-common during a shared
state sysroot populate, because it comes out of order.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../docbook-dsssl-stylesheets-native_1.79.bb       |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index a776ea5..c70e76d 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=41;endline=74;md5=875385159b2ee76ecf
 
 DEPENDS = "sgml-common-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-dsssl-${PV}.tar.bz2"
 
@@ -45,6 +45,9 @@ docbook_dsssl_stylesheets_sstate_postinst () {
 		# Ensure that the catalog file sgml-docbook.cat is properly
 		# updated when the package is installed from sstate cache.
 		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl \
+			--add ${sysconfdir}/sgml/sgml-docbook.bak \
+			${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
+		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl \
 			--add ${sysconfdir}/sgml/sgml-docbook.cat \
 			${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
 	fi
-- 
1.7.3.4



