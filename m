Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOD-00085Q-Hd
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115410"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:45 -0700
Message-Id: <c46f499e54563c5f480d57ee1a81439e6f39a741.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 06/45] wpa-supplicant: add wpa_supplicant.conf to CONFFILES and don't install it twice
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
X-List-Received-Date: Fri, 25 May 2012 06:52:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* first we install ${WORKDIR}/wpa_supplicant.conf-sane
  install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
  and a bit later in do_install we were overwritting it with ${WORKDIR}/wpa_supplicant.conf
  install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
* notice that this patch also changes .conf permissions from 644 back to 600

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index b489893..efd1a66 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -22,6 +22,7 @@ PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
 FILES_${PN} += "${datadir}/dbus-1/system-services/*"
+CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
@@ -50,7 +51,6 @@ do_install () {
 	install -d ${D}${sysconfdir}/network/if-pre-up.d/
 	install -d ${D}${sysconfdir}/network/if-post-down.d/
 	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
 	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 1e0086a..7bbb8c0 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.7.6



