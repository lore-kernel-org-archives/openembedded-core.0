Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RvGkS6aT5VHpMRcoUqq7tayTU4NlUXyDV30dwNE/tVzVMyTxbWeheBSC6crrtvAh7fzQLmjqRP
 TQJexS1B9JFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699693"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699693"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:53 -0700
IronPort-SDR: FYQZovZM6yHXnZv8+Op9RIb+pIvGnRP5SmS/aHtUSNucSMV3b4CPd5QPILhOry/fsfVPvx4bEH
 zZ9FetZE5ujQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245767"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 10/32] wpa-supplicant: remove service templates from SYSTEMD_SERVICE
Date: Tue, 28 Jul 2020 16:51:11 +0800
Message-Id: <c6c26311e846a688f2981b541be0966c73cd69d8.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Remove service templates wpa_supplicant-nl80211@.service and
wpa_supplicant-wired@.service from SYSTEMD_SERVICE that they should NOT
be started/stopped by calling 'systemctl' in postinst and prerm scripts.

(From OE-Core rev: 7910a0d6f332253608767a9576a0d521dd87efd7)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
(cherry picked from commit fe9b8e50461ab00ab3ad8b065ebd32f0eea2a255)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../wpa-supplicant/wpa-supplicant_2.9.bb                    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 2db09ad2c6..0e74d21a76 100644
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
2.25.4

