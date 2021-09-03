Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web09.4402.1630676768443049688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=CS1j3uSw;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1630676764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ErLrEUriKTEKoZVcV5zzxeDOFWIJNwaV9T2MKWwJeuU=;
	b=CS1j3uSwa5pOmpf2cjoZS23VoArzn0a7Z/icfuK54GQ7UScRCwPqJ04qnVGld9xzTC0QBz
	hIXakgaXzq0ZG+4wxSmGh+VGaGaElZEV1ibWShCUnI2pUqTo7m7qV/4NfYnIkPKhrNcVCv
	7L8k7lPyrTiRzh1VVrw7Uk8uPPhqHZo=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] systemd: Add homed PACKAGECONFIG
Date: Fri,  3 Sep 2021 15:45:52 +0200
Message-Id: <20210903134552.22033-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If systemd is built with fdisk support[1] and the openssl and cryptsetup
PACKAGECONFIG are enabled, systemd-homed[1] is automatically enabled.
The org.freedesktop.home1.conf file was forgotten, so this commit adds
the file and make enabling homed a explicit choice.

[1] Automatically enabled if the fdisk dependency is installed which it
    is as util-linux is pulled in by systemd
[2] https://www.freedesktop.org/software/systemd/man/systemd-homed.servic=
e.html

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 meta/recipes-core/systemd/systemd_249.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-co=
re/systemd/systemd_249.3.bb
index c2d4343f10..bebb608db1 100644
--- a/meta/recipes-core/systemd/systemd_249.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.3.bb
@@ -133,6 +133,7 @@ PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-li=
bdir=3D${STAGING_LIBDIR} -Defi-in
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
+PACKAGECONFIG[homed] =3D "-Dhomed=3Dtrue,-Dhomed=3Dfalse"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue,-Dgcrypt=3Dfalse,libgcrypt"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
@@ -619,6 +620,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.con=
f \
                 ${datadir}/dbus-1/system.d/org.freedesktop.portable1.con=
f \
                 ${datadir}/dbus-1/system.d/org.freedesktop.oom1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.home1.conf \
                "
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
@@ -717,6 +719,9 @@ python __anonymous() {
=20
     if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and =
not bb.utils.contains('PACKAGECONFIG', 'openssl', True, False, d):
         bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl]"=
)
+
+    if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and n=
ot bb.utils.contains('PACKAGECONFIG', 'openssl cryptsetup', True, False, =
d):
+        bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[openssl] a=
nd PACKAGECONFIG[cryptsetup]")
 }
=20
 python do_warn_musl() {
--=20
2.25.1

