Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOK-0005bO-2r
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351220"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:01 -0800
Message-Id: <d6691d239a3e12eda77cb91bb784d1ca6af9bc85.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 19/33] shared-mime-info: package runtime data separately
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:44 -0000

From: Joshua Lock <josh@linux.intel.com>

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
1.7.6.4



