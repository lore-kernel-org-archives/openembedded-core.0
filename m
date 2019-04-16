Return-Path: <john.ernberg@actia.se>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Apr 2019 12:17:06 UTC
Received: from mail.actia.se (mail.actia.se [195.67.112.82])
	by mail.openembedded.org (Postfix) with ESMTP id 11F327D6BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 12:17:06 +0000 (UTC)
Received: from S036ANL.actianordic.se (192.168.16.117) by
	S036ANL.actianordic.se (192.168.16.117) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Tue, 16 Apr 2019 14:02:04 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
	S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
	15.01.1713.004; Tue, 16 Apr 2019 14:02:04 +0200
From: John Ernberg <john.ernberg@actia.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] i2c-tools: Split binaries and library
Thread-Index: AQHU9Ew0MlRN6nF6G0ukxnQHcxTbrg==
Date: Tue, 16 Apr 2019 12:02:04 +0000
Message-ID: <20190416120224.6737-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-originating-ip: [10.11.11.53]
MIME-Version: 1.0
Subject: [PATCH] i2c-tools: Split binaries and library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 12:17:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: John Ernberg <john.ernberg@actia.se>

Since the library is differently licensed, split it from the executables.

According to the README of i2c-tools the library is LGPLv2.1 while the
executables are GPLv2.

License-update: Additional license file.

Signed-off-by: John Ernberg <john.ernberg@actia.se>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipe=
s-devtools/i2c-tools/i2c-tools_4.1.bb
index 2b4563d4f0..b827a8274a 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
@@ -1,8 +1,10 @@
 SUMMARY =3D "Set of i2c tools for linux"
 HOMEPAGE =3D "https://i2c.wiki.kernel.org/index.php/I2C_Tools"
 SECTION =3D "base"
-LICENSE =3D "GPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
+LICENSE =3D "LGPLv2.1 & GPLv2+"
+LICENSE_${PN} =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e \
+                    file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364=
516c"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
@@ -21,20 +23,23 @@ do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
 }
=20
-PACKAGES =3D+ "${PN}-misc"
+PACKAGES =3D+ "${PN}-misc ${PN}-utils "
 FILES_${PN}-misc =3D "${sbindir}/i2c-stub-from-dump \
                         ${bindir}/ddcmon \
                         ${bindir}/decode-edid \
                         ${bindir}/decode-dimms \
                         ${bindir}/decode-vaio \
                        "
+FILES_${PN}-utils =3D "${sbindir}"
+RRECOMMENDS_${PN}_class-target =3D "${PN}-utils"
+
 RDEPENDS_${PN}-misc =3D "${PN} perl perl-module-posix \
                        perl-module-constant perl-module-file-basename \
                        perl-module-fcntl perl-module-strict perl-module-va=
rs \
                       "
=20
 ALTERNATIVE_PRIORITY =3D "100"
-ALTERNATIVE_${PN} =3D "i2cdetect i2cdump i2cget i2cset"
+ALTERNATIVE_${PN}-utils =3D "i2cdetect i2cdump i2cget i2cset"
 ALTERNATIVE_LINK_NAME[i2cdetect] =3D "${sbindir}/i2cdetect"
 ALTERNATIVE_LINK_NAME[i2cdump] =3D "${sbindir}/i2cdump"
 ALTERNATIVE_LINK_NAME[i2cget] =3D "${sbindir}/i2cget"
--=20
2.21.0

