Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF1F760F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 15:26:12 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so30681664wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=dIUPHbbmBUGQ4j/xcZSIvXCxntmeNFEUGIlf5plmoVM=;
	b=Zp7s22uVasspGowCc79AQSkSA8V8pdp3qqB2rUBXK2tIk88ExvXyfqIv8mLFH0Rk90
	JX3B2eahsbbVGD6HqpK4km0LlGrW2XywtkYUUNwu45p1ueSWRJLmW7SE8z0BajGBj7xa
	uMp+SaPOJc/9b+D+QE//Rzg6r2pHvi7YZY9/9lt9fOcwOr0v30qtI6+3aSkcwtDeZ7R0
	2kx4OrrCThEPJyA8tlS8ImC1pgHXuDuJMCmqZGCkkLfwJT+XGW2MJwxX8wnoU5i4SNWl
	H7GkyRwg5Kxti3NNpxKbe+fdsCD9QzKjZiWED5UaluGUkRsC310MNM0fdJXTP2NBeWF2
	5AUQ==
X-Received: by 10.194.62.137 with SMTP id y9mr8631256wjr.136.1444317972094;
	Thu, 08 Oct 2015 08:26:12 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	jt3sm43675307wjc.12.2015.10.08.08.26.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 08:26:11 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <2D0D4F06-AB53-4200-B729-AB982B4CBB46@gmail.com>
Date: Thu, 8 Oct 2015 17:26:11 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 2/2] udev: Don't introduce pci dependencies without pci being featured
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
X-List-Received-Date: Thu, 08 Oct 2015 15:26:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Fixes that udev always requires PCI, idenpendently from machine or =
distro features.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/udev/udev.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
index c378ae3..573ecca 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
=20
 LDFLAGS +=3D "-lrt"
=20
-DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native =
gperf-native libxslt-native util-linux"
+DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native libxslt-native =
util-linux"
+DEPENDS +=3D " ${@base_contains('MACHINE_FEATURES', 'usbhost', 'libusb =
usbutils', '', d)}"
+DEPENDS +=3D " ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', =
'', d)}"
 RPROVIDES_${PN} =3D "hotplug"
=20
 PROVIDES =3D "libgudev"
@@ -39,10 +41,6 @@ RDEPENDS_${PN}-ptest +=3D "make perl python"
 libexecdir =3D "${base_libdir}"
 EXTRA_OECONF =3D "--disable-introspection \
                 --with-rootlibdir=3D${base_libdir} \
-                --with-pci-ids-path=3D${datadir}/pci.ids \
-                ac_cv_file__usr_share_pci_ids=3Dno \
-                ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
-                ac_cv_file__usr_share_misc_pci_ids=3Dyes \
                 --sbindir=3D${base_sbindir} \
                 --libexecdir=3D${nonarch_base_libdir} \
                 --with-rootlibdir=3D${base_libdir} \
@@ -50,6 +48,8 @@ EXTRA_OECONF =3D "--disable-introspection \
                 --without-systemdsystemunitdir \
                "
=20
+EXTRA_OECONF +=3D " ${@base_contains('MACHINE_FEATURES', 'pci', =
'--with-pci-ids-path=3D${datadir}/pci.ids =
ac_cv_file__usr_share_pci_ids=3Dno =
ac_cv_file__usr_share_hwdata_pci_ids=3Dno =
ac_cv_file__usr_share_misc_pci_ids=3Dyes', '--without-pci-ids-path', =
d)}"
+
 PACKAGES =3D+ "udev-cache"
 PACKAGES =3D+ "libudev"
 PACKAGES =3D+ "libgudev"
--=20
2.4.3

--=20
Jens Rehsack - rehsack@gmail.com


