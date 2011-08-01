Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7M-0006ZU-Lz
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147068"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:35:59 -0700
Message-Id: <5bf947f68ef666aeda554b9d2981ec5dee506413.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 07/22] sgml-common-native: Read a catalog backup to repopulate sgml-docbook.cat
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:52 -0000

This reads the sgml-docbook.bak and adds the entries into sgml-docbook.cat since
this occurs out of order during shared state sysroot populate.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sgml-common/sgml-common-native_0.6.3.bb        |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
index 2c8d874..af7e104 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
@@ -13,7 +13,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE-GPLv2;md5=ab8a50abe86dfc859e148baae043c89b"
 SECTION = "base"
 
-PR = "r0"
+PR = "r1"
 
 require sgml-common_${PV}.bb
 inherit native
@@ -21,6 +21,8 @@ inherit native
 S = "${WORKDIR}/sgml-common-${PV}"
 
 SYSROOT_PREPROCESS_FUNCS += "sgml_common_native_mangle"
+SSTATEPOSTINSTFUNCS += "sgml_common_sstate_postinst"
+
 
 do_install_append() {
 	# install-catalog script contains hard-coded references to
@@ -46,3 +48,17 @@ sgml_common_native_mangle () {
 	# Remove ${D} path from catalog file created by install-catalog script
 	sed -i -e "s|${D}||g" ${SYSROOT_DESTDIR}${sysconfdir}/sgml/catalog
 }
+
+sgml_common_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+		if [ -e ${sysconfdir}/sgml/sgml-docbook.bak ]; then
+			for catalog in `awk '{print $2}' ${sysconfdir}/sgml/sgml-docbook.bak`; do
+				if [ ! `grep $catalog ${sysconfdir}/sgml/sgml-docbook.cat 1> /dev/null 2>&1` ]; then
+					${bindir}/install-catalog \
+						--add ${sysconfdir}/sgml/sgml-docbook.cat $catalog
+				fi
+			done
+		fi
+	fi
+}
-- 
1.7.3.4



