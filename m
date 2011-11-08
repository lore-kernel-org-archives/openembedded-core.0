Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNkwO-0000z4-IX for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 13:38:12 +0100
Received: from f053044161.adsl.alicedsl.de ([78.53.44.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RNkqR-00088o-QS for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:32:04 +0000
Message-ID: <1320755519.3915.15.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 08 Nov 2011 13:31:59 +0100
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: [PATCH] xinit: Fix `startx` looking for `mcookie` in sysroot
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
X-List-Received-Date: Tue, 08 Nov 2011 12:38:12 -0000
X-Groupsio-MsgNum: 12082
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Wo9R/EjZikoiMvBIYAvV"

--=-Wo9R/EjZikoiMvBIYAvV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 8 Nov 2011 13:00:32 +0100

`startx` run on a system based on the demo systemd image [1] and `opkg`-ins=
talled packages fails with the following error.

	/usr/bin/startx: line 139: /OE/tentacle/build/tmp-angstrom_2010_x/sysroots=
/x68_64-linux/usr/bin/mcookie: No such file or directory

Applying commit 443bcc07 [1] from OE-classic

        Author: Tom Rini <tom_rini@mentor.com>
        Date:   Thu Apr 7 10:36:43 2011 -0700
       =20
            xinit: Fix mcookie / util-linux-ng dependency
       =20
            xinit just needs to know the runtime path of mcookie so we need=
 to
            RDEPEND on util-linux-ng and pass the runtime path in via EXTRA=
_OECONF
       =20
            Signed-off-by: Tom Rini <tom_rini@mentor.com>

fixes this issue. Commit 7f6cec6f [2]

        Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
        Date:   Sun Feb 21 18:11:30 2010 +0100
       =20
            xinit: add dependency on util-linux-ng
       =20
        [=E2=80=A6]

tried to address the same problem but apparently did not help, because Tom =
still had problems.

[1] http://www.angstrom-distribution.org/demo/beagleboard/Angstrom-systemd-=
image-eglibc-ipk-v2011.11-core-beagleboard.rootfs.tar.bz2
[2] http://git.openembedded.org/openembedded/commit/443bcc0785bc004e471b375=
0a34d12d2fd2e5dad
[3] http://git.openembedded.org/openembedded/commit/7f6cec6f0adb6203a6dbaf8=
a43c67c2c4f8bf84e

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
1. Please note that I did neither build nor run tested this patch and just =
noticed the error trying the demo image.
2. Koen mentioned something on IRC wanting to get rid of `startx` entirely.=
 But this patch should be applied nevertheless.
---
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes-g=
raphics/xorg-app/xinit_1.3.0.bb
index ee7c64d..cdfc843 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
@@ -9,9 +9,13 @@ systems. When this first client exits, xinit will kill the=
 X server and \
 then terminate."
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0d4b5eef75f1584ccbdc5e4a3431440=
7"
-PR =3D "r0"
+RDEPENDS_${PN} +=3D "util-linux-ng"
+
+PR =3D "r1"
 PE =3D "1"
=20
+EXTRA_OECONF =3D "ac_cv_path_MCOOKIE=3D${bindir}/mcookie"
+
 FILES_${PN} +=3D "${libdir}X11/xinit"
=20
 SRC_URI[md5sum] =3D "bc4e8b7d1919597cc37a0d24aa149dda"
--=20
1.7.7.2

--=-Wo9R/EjZikoiMvBIYAvV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk65IT8ACgkQPX1aK2wOHVg5ygCfZ4HdjTJE06UtniMrlsYlGK9w
f34An2Beo1jpv/+dg5MTVOCgFOYjky1m
=JQMO
-----END PGP SIGNATURE-----

--=-Wo9R/EjZikoiMvBIYAvV--
