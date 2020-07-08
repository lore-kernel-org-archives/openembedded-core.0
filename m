Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4719.1594242489723068129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=d3tYblkH;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjM5mRCzhY
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242487;
	bh=UvvrU86cH3q6KrD4nF9HQwmHV7FQ0Efpm+XnCLbYtb0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d3tYblkHfftJvsMZLuRGabRkoe8obSSqzg31BgeobO4g2aAX9+VsN8YUMYFgBdfwr
	 5OK5KzLQKl1KEvlVGTDlTm9818NjOrLebOTRS0g9GfMHCDoq/c7+G7REBrWAM4PZiT
	 2OXQAXw026bBVXdPHx/x2NzEoOWJpHp4nJqI1DO3V1loQgOTgPOlItWqAy0AXXFdpb
	 GrQH/MyMC5gfGwXuvuFwNVAyWOu+Mhtj+qr3NQc3VO0KXXbgT81CUKWwxdfmDghwiv
	 2Xv/JWUnQ48ScXoOdKDIB+saaxn0qi06GtDwIkayKXLWNFf20bkB7JQWRZiqjPl4Cu
	 aJkoCqDGH87GfS0Qyo1ETo4S9tiP7MHjKUZmgu8B87QQE0x1Dboswl/6OIi9b1hNMu
	 pVNlk3oq2L99zDUliW7qFf36ASDcz9s0RUJVENurJcOKznY9aQm/GA32YiUP7+KlYZ
	 bCJAPU8Tvp1sW29++ck/+RLTZHDNsgwWmg0NaA4cOJDeXtea7LIny6VAwHB2XP2aBr
	 1ewwKimj4pI3ZOsfFkxH7r61++6YTXya63sBTMymGjenmP7LKsFBAMTiQDP6GRmwpt
	 Y0ZWnZi5cr0nXEfM7Q0Zr10utRO6ofNMSVu5k11CAyaKl0Am+6+caS7SXyswLXlKVH
	 9j5Owsenxmd2Zo7EH9yOne3Q=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 11/19] wpa-supplicant: remove service templates from SYSTEMD_SERVICE
Date: Thu,  9 Jul 2020 00:07:53 +0300
Message-Id: <20200708210801.5553-11-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

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
2.17.1

