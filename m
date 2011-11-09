Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNwVu-0001qx-4Q
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 01:59:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2011 16:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,479,1315206000"; d="scan'208";a="34688324"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.16])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 16:53:21 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 16:53:18 -0800
Message-Id: <552def63eb1b587a3f0685c7e604ab1b9a1ac7e5.1320799787.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320799787.git.josh@linux.intel.com>
References: <cover.1320799787.git.josh@linux.intel.com>
In-Reply-To: <cover.1320799787.git.josh@linux.intel.com>
References: <cover.1320799787.git.josh@linux.intel.com>
Subject: [PATCH 1/3] shared-mime-info: package runtime data separately
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
X-List-Received-Date: Wed, 09 Nov 2011 00:59:38 -0000

The freedesktop.org.xml is required when updating the mime database but
otherwise not much use. Therefore package it separately, rather than
removing it completely, so that it can be used as required for on-device
updates without adding almost 2MB to every image which hase shared-mime-info.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../shared-mime-info/shared-mime-info.inc          |    9 ++++++---
 .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index c8cab29..57e829c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -17,13 +17,16 @@ EXTRA_OECONF = "--disable-update-mimedb"
 FILES_${PN} += "${datadir}/mime"
 FILES_${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc"
 
+# freedesktop.org.xml is only required when updating the mime database,
+# package it separately
+PACKAGES += "shared-mime-info-data"
+FILES_shared-mime-info-data = "${datadir}/mime/packages/freedesktop.org.xml"
+RDEPENDS_shared-mime-info-data = "shared-mime-info"
+
 do_install () {
 	autotools_do_install
 
 	update-mime-database ${D}${datadir}/mime
-
-	# we do not need it on device and it is huge
-	rm ${D}${datadir}/mime/packages/freedesktop.org.xml
 }
 
 do_install_virtclass-native () {
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
index 0c3b01c..bc4a8f7 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
@@ -1,5 +1,5 @@
 require shared-mime-info.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
 SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
-- 
1.7.7



