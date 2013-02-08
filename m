Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwq-0002H5-1M
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:41 +0100
Received: by mail-wi0-f172.google.com with SMTP id ez12so1435008wid.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=zhFLVUN0xDliG4TnnT7kLm4CL/VpuJwNDsrUjzwLeiQ=;
	b=Efd9mCRQtrMxfd/2o++nz3TPIAaMaGIYb973Xk1AXxFqlqKFLqykCtOYtICCD7rSYQ
	51wrhYFl3imbjVlkgrjbnVkYeXRs6Z778krol903O9Rfl2nw2JmKyJ2OqLKS1i0ypKzJ
	ZjTKPRpd3I/VuaauyUcMoB4VrqXb7MeluU7U+2sOYXyOyjsvFxsIigsj2AFmy9twkBtw
	7Ad93SqT5i3TJ7zxXaRfAJrtImBZf3uBZpuLPUDq4bywH/thgv5CY5uK797+dbLwt6yO
	jvqtM/FpHv3+raRCa9hHwJd72A4zDa5XHOPffMkDLVn7kyhpKhafgf7RWeq6TdA3WIEX
	Q7Zw==
X-Received: by 10.180.95.166 with SMTP id dl6mr5290900wib.9.1360363541738;
	Fri, 08 Feb 2013 14:45:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.40
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:19 +0000
Message-Id: <cba1dc1c04201b8f08fca587a7433238a5ddaa33.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmac5B9yuJ5tkaAwQlm8LJFwxNrzfaYOSjJRsbhHaVXDLCphCjhmepR7KwM5jYD5hwQjvSJ
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] wpa-supplicant: Enabling with systemd
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
X-List-Received-Date: Fri, 08 Feb 2013 23:01:47 -0000

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc                 |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 89910a0..75e85ae 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -9,6 +9,11 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
 DEPENDS = "gnutls dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig-gnutls \
            file://wpa-supplicant.sh \
@@ -21,7 +26,7 @@ S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += "${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/*"
+FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
@@ -63,8 +68,10 @@ do_install () {
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
-	install -d ${D}/${systemd_unitdir}/system
-	install -m 644 ${S}/systemd/wpa_supplicant.service ${D}/${systemd_unitdir}/system
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/systemd/*.service ${D}/${systemd_unitdir}/system
+	fi
 
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
-- 
1.7.10.4



