Received: from mail-ia0-f174.google.com ([209.85.210.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stanhu@gmail.com>) id 1TslmK-0001ix-Ae
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 03:53:14 +0100
Received: by mail-ia0-f174.google.com with SMTP id y25so1014364iay.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 18:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=uAiF9mmHx2sQeUY83gXJdEUkDdudHIEyj6iFw5OTABQ=;
	b=Txf9uUpmqwP7BcI+UNnO0LToURJZTEGC1/x085Vvhz5w75VV11/POp4cmln4Myo/2X
	16tNDaVpb/0EHZ6kgfIt3wzTh3E/Xxl1T3hxUSQmN8K6ObSFBOSJ2cy+YvHPGqYjeF85
	D6zfDj2Mvk/wvFBEXIRFXzstIaHKH7luCVjc/Zj1eOUV5PNSjdev6PSVymLMiUgOPlDH
	S1r3QKJyv7mQnTv2QtOT9kARioiZQuo8DLMjhUmBA9K/2wt4R6YtP6wgJKAnzen8j23Q
	LHMzUP/sHalOBLGl95hmDqgmXc2Jn6Rv1UlG9ku59Dat+isNyZna7uKwfWFplUOV23+T
	OnIg==
X-Received: by 10.43.71.81 with SMTP id yj17mr41147384icb.0.1357699040404;
	Tue, 08 Jan 2013 18:37:20 -0800 (PST)
Received: from robin.box.local ([76.73.74.194])
	by mx.google.com with ESMTPS id i10sm1096974igb.12.2013.01.08.18.37.18
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Jan 2013 18:37:19 -0800 (PST)
From: Stan Hu <stanhu@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 19:37:03 -0700
Message-Id: <1357699023-8463-1-git-send-email-stanhu@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] wpa-supplicant: Include wpa_supplicant.service file in package for dbus to work
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
X-List-Received-Date: Wed, 09 Jan 2013 02:53:17 -0000

The dbus service files include a reference to wpa_supplicant.service, but if it
does not exist the dbus-daemon warns:

[system] Activating via systemd: service name='fi.w1.wpa_supplicant1' unit='wpa_supplicant.service'
[system] Activation via systemd failed for unit 'wpa_supplicant.service': Unit wpa_supplicant.service failed to load: No such file or directory.  See system logs and 'systemctl status wpa_supplicant.service' for details.

If this happens, wpa_supplicant is not run automatically.

Signed-off-by: Stan Hu <stanhu@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant-1.0.inc          |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
index ff5cddc..0645193 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
@@ -21,7 +21,7 @@ S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += "${datadir}/dbus-1/system-services/*"
+FILES_${PN} += "${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
@@ -63,6 +63,9 @@ do_install () {
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
+	install -d ${D}/${systemd_unitdir}/system
+	install -m 644 ${S}/systemd/wpa_supplicant.service ${D}/${systemd_unitdir}/system
+
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
-- 
1.7.9.5



