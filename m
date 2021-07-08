Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.12101.1625751248736149851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 06:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=zd/EYMY6;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 926E38318E;
	Thu,  8 Jul 2021 15:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1625751245;
	bh=XSmRb/VDXOLpHLYsXoskqGWWnpPXyDf1xMYcW+Bidtk=;
	h=From:To:Cc:Subject:Date:From;
	b=zd/EYMY65XqXEQKsMI29CoUdWBqiGPI7UNts2x0qzCBg4VtrPEcNWtqPIqGBZxJqX
	 QxBLR9RfG42ajbaPw+7klnpnp5AiV8kF74nmLKtv4dC66LIOxUIJJ2/NwQikagjG3e
	 YGq3p/4EyGrT6pMmdaTrESZZ27cj61RHPmIB0as7jamWVr2g+F7kfPRuV8R4IM/W+r
	 fIAm3ZQAXnLqfcyrcXD3bix8LLckX0vR3+Psw5OsMH4iBaMgYWXG8EAQZ9+yZSoUdy
	 ug6BdmeJWZNi4oJ7Wv/EjRX/2ZVNldB5IDqDHK0TTpKxVC5GaEp/wuiDXfn1YlLTDM
	 HpHqR164TNafQ==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: ch@denx.de,
	Marek Vasut <marex@denx.de>,
	Tanu Kaskinen <tanuk@iki.fi>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] pulseaudio: Drop pulseaudio-conf
Date: Thu,  8 Jul 2021 15:33:49 +0200
Message-Id: <20210708133349.66014-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

The pulseaudio.inc currently contains these two assignments:
  FILES_${PN}-conf =3D "${sysconfdir}"
  FILES_${PN}-server =3D "... ${sysconfdir} ..."
This results in pulseaudio-server shipping the configuration
in /etc/pulse/ , and based on CONFFILES_${PN}-server and co.,
this is how it was intended to work.

However, that also means FILES_${PN}-conf is not useful. In fact,
FILES_${PN}-conf is likely meant for MACHINE specific configuration,
which would better be packaged in separate recipe like e.g. systemd
does in systemd-conf_%.bb . Better yet, such pulseaudio-conf_%.bb
could ship MACHINE specific configuration overrides, which according
to pulse-daemon.conf(5) are picked from /etc/pulse/daemon.conf.d ,
while pulseaudio-server would ship the default configuration files.

Remove FILES_${PN}-conf .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Tanu Kaskinen <tanuk@iki.fi>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index 005cb36b8e..2c9e8167c4 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -183,7 +183,6 @@ FILES_libpulse-simple =3D "${libdir}/libpulse-simple.=
so.*"
 FILES_libpulse-mainloop-glib =3D "${libdir}/libpulse-mainloop-glib.so.*"
=20
 FILES_${PN}-dev +=3D "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala=
 ${libdir}/cmake"  =20
-FILES_${PN}-conf =3D "${sysconfdir}"
 FILES_${PN}-bin +=3D "${sysconfdir}/default/volatiles/04_pulse"
 FILES_${PN}-pa-info =3D "${bindir}/pa-info"
 FILES_${PN}-server =3D "${bindir}/pulseaudio ${bindir}/start-* ${sysconf=
dir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${sy=
stemd_user_unitdir}/*"
--=20
2.30.2

