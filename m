Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.1208.1626027559550729558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 11:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=KOuz5n4+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C693E803B2;
	Sun, 11 Jul 2021 20:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1626027547;
	bh=cwLbNb4FirlTaF0b7CT/TsRDI/sDHSP6rDpc+T3Oy5c=;
	h=From:To:Cc:Subject:Date:From;
	b=KOuz5n4+EhEX2NREUg0cCvLPNeLs46jFD82/TfD9F2yYxwMk6DIJfMkN2keL97Int
	 PiP6/jlPPr1taYpFOalPg/+ymJroUhbHjtoRgoB5W4a//sWoYQ9nCUpK0o70sB+23B
	 yN7W9I0DxVyj8kbe26BN4iB+ayX/w9FlD/nsDrnlLFz4PTr/aVK0iJ4StsgPnDekOp
	 Y3PLg47edfm32DbDr1sHXa881S2xmJvwJcjUY+DdhYSw7+zk4tprrbKPJ2jErakFXs
	 ss8fUqjveXRDARYFj8EcT7ez78aEqjywQeFaDsylrBz5M0Hhd9u1IVtlQ3G9vr6Ofk
	 CF30as9ZxtBHg==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][hardknott] linux-firmware: Package RSI 911x WiFi firmware
Date: Sun, 11 Jul 2021 20:18:42 +0200
Message-Id: <20210711181842.30510-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

The RSI 911x WiFi firmware is already part of the linux-firmware
repository, package it to make it easily available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
---
NOTE: Small firmware backport, similar to the one picked for dunfell
---
 .../linux-firmware/linux-firmware_20210511.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index ed6e78175a..26091fba70 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
@@ -229,6 +229,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx $=
{PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
+             ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl81=
92ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
@@ -529,6 +530,16 @@ RDEPENDS_${PN}-nvidia-gpu +=3D "${PN}-nvidia-license=
"
 RDEPENDS_${PN}-nvidia-tegra +=3D "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra-k1 +=3D "${PN}-nvidia-license"
=20
+# For RSI RS911x WiFi
+LICENSE_${PN}-rs9113 =3D "WHENCE"
+LICENSE_${PN}-rs9116 =3D "WHENCE"
+
+FILES_${PN}-rs9113 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps=
 "
+FILES_${PN}-rs9116 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps=
 "
+
+RDEPENDS_${PN}-rs9113 +=3D "${PN}-whence-license"
+RDEPENDS_${PN}-rs9116 +=3D "${PN}-whence-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 =3D "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu =3D "Firmware-rtlwifi_firmware"
--=20
2.30.2

