Return-Path: <komar@komar.bionik.tu-berlin.de>
Received: from mo4-p05-ob.smtp.rzone.de (mo4-p05-ob.smtp.rzone.de
	[81.169.146.181])
	by mail.openembedded.org (Postfix) with ESMTP id C35F765D28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; t=1398424948; l=2511;
	s=domk; d=evologics.de;
	h=Content-Type:MIME-Version:Reply-To:Subject:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH; bh=s0Xg9y4R6CDS6x6N7XCnnQpaQlQ=;
	b=VEBf+GBZMJuoD9KSgXKN/A/IYi8PsWcO6YSBtROZai4eRhpuTstas07Yop1IvWAFLt2
	SJIEZRic9lVrd1lzP1bz6ugrZlrNaWQpqUeALEKInPuCd1AAowrvADD8LCjtxdD2QyAz/
	U43hLCjiDn10GLrtnvH836Qdp5Aurh+rrCk=
X-RZG-AUTH: :J2MJdFKIfukmJ5nsom3zZ+ltBBdf16KfU3Oeu279H3e/0njMlfC6YEeAELeL659Z
X-RZG-CLASS-ID: mo05
Received: from komar.lab.evologics.de (mapocho.bionik.tu-berlin.de
	[130.149.198.84]) by smtp.strato.de (RZmta 32.39 AUTH)
	with ESMTPSA id a003a3q3PBMS04N
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 13:22:28 +0200 (CEST)
Received: from komar by komar.lab.evologics.de with local (Exim 4.82)
	(envelope-from <komar@komar.lab.evologics.de>) id 1WdeD6-0002b5-7f
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Apr 2014 13:22:28 +0200
Date: Fri, 25 Apr 2014 13:22:28 +0200
From: Maksym Komar <komar@evologics.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140425112228.GB31049@komar.lab.evologics.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] bitbake do not show error if mkfs.ubifs fail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: Maksym Komar <komar@evologics.de>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 11:22:33 -0000
X-Groupsio-MsgNum: 52599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: multipart/mixed; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I spend some time to find why .ubifs generate, but .ubi image do not.
In IMAGE_CMD_ubi it's like "mkfs.ubifs ... && ubinize", and while && is the=
re, "set -e" do not work.

--=20
EvoLogics GmbH
Ackerstra=C3=9Fe 76, 13355 Berlin
Tel.: + 49- (0) 30- 46 06 82 26
Fax:  + 49- (0) 30- 46 06 82 15
Gesch=C3=A4ftsf=C3=BChrer: Dr. Rudolf Bannasch, Dr. Kostyantyn Kebkal
Amtsgericht Berlin, Charlottenburg (unter der) Nummer HR B 77787
Steuer- Nr.: 37/296/20446

--zx4FCpZtqtKETZ7O
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-fix-not-show-error-if-mkfs.ubifs-fail.patch"
Content-Transfer-Encoding: quoted-printable

From e75f2ce250198e12f855f3492168b661b2e672b9 Mon Sep 17 00:00:00 2001
From: Maksym Komar <komar@evologics.de>
Date: Fri, 25 Apr 2014 12:59:52 +0200
Subject: [PATCH] fix not show error if mkfs.ubifs fail

---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class
index f38e3b6..a7d18c7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -93,7 +93,8 @@ IMAGE_CMD_ubi () {
 	echo vol_type=3Ddynamic >> ubinize.cfg=20
 	echo vol_name=3D${UBI_VOLNAME} >> ubinize.cfg=20
 	echo vol_flags=3Dautoresize >> ubinize.cfg
-	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs=
.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.root=
fs.ubi ${UBINIZE_ARGS} ubinize.cfg
+	mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs=
.ubifs ${MKUBIFS_ARGS}
+	ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} u=
binize.cfg
 }
 IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/=
${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
=20
--=20
1.9.1


--zx4FCpZtqtKETZ7O--

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlNaRW4ACgkQr4+vp6uhAeIx/QCfQjOirSEm9zJkkl0H63Bg6pR5
SKkAoJajD1z5dBdD5iyjmhFrCWMw84MW
=vvCI
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
