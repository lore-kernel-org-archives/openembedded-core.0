Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.7345.1591536147717570396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 06:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 057DMQvS025666
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Jun 2020 06:22:27 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 7 Jun 2020 06:22:26 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] wpa-supplicant: remove service templates from SYSTEMD_SERVICE
Date: Sun, 7 Jun 2020 21:21:57 +0800
Message-ID: <20200607132157.9417-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607132157.9417-1-kai.kang@windriver.com>
References: <20200607132157.9417-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove service templates wpa_supplicant-nl80211@.service and
wpa_supplicant-wired@.service from SYSTEMD_SERVICE that they should NOT
be started/stopped by calling 'systemctl' in postinst and prerm scripts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../wpa-supplicant/wpa-supplicant_2.9.bb                    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 3e92427bb0..2936e89eed 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 inherit pkgconfig systemd
 
-SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
+SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
@@ -37,13 +37,13 @@ S = "${WORKDIR}/wpa_supplicant-${PV}"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += "${datadir}/dbus-1/system-services/*"
+FILES_${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
 	install -m 0755 ${WORKDIR}/defconfig wpa_supplicant/.config
-	
+
 	if echo "${PACKAGECONFIG}" | grep -qw "openssl"; then
         	ssl=openssl
 	elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then
-- 
2.17.1

