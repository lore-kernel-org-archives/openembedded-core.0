Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1U2hgS-0003uJ-Ah
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 13:31:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15CFg6K018473
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 04:15:42 -0800 (PST)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 5 Feb 2013 04:15:41 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 14:15:33 +0200
Message-ID: <1360066533-20693-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] wpa-supplicant: Package systemd service in -systemd
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
X-List-Received-Date: Tue, 05 Feb 2013 12:31:39 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |    6 ++++--
 .../wpa-supplicant/wpa-supplicant_2.0.bb           |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 89910a0..7ce85a6 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -18,10 +18,12 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
 
 S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 
-PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
+PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli wpa-supplicant-systemd "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += "${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/*"
+FILES_wpa-supplicant-systemd = "${systemd_unitdir}/system/*"
+FILES_${PN} += "${datadir}/dbus-1/system-services/*"
+
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
index 22e42dd..a8b0dad 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-2.0.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3be2ebfdcced52e00eda0afe2889839d"
 SRC_URI[sha256sum] = "2c115609fbb5223d51381084a5c944455a8afcda81d584173ff55ba233379e09"
-- 
1.7.5.4



