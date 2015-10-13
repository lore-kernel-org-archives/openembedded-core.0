Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC7F75A52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 20:37:11 +0000 (UTC)
Received: by wieq12 with SMTP id q12so51031969wie.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=OawHsu3rZubyXfy0fdLYssxrZ19mhH4g1ONN716ulOo=;
	b=FqKFFRvym4qXwyFIHsFb33D0yQd2TvtQVTYppVhqp4pwsoFxLBk3tsmLEV3LheXBEO
	PurULAfMm5nSSCzdHca7nAeRCeyXo1Xv7EFvszLpSkJkp24u0Xi/u8mE8sFS+2H9B/y/
	nREpxJXWV2O7OO+vo6TVUpHktAf7HmfeGYbsumaRpiIpHh+zwjSzt1VzVk8g/Bgt5CSK
	xaFXssrndeQ9lgO0al2fOFgTaLXYtN9lun0cVx3HcYgbw/km0KVgM43JOrM7qSS177iA
	6rHk1xT3MyTFwKT2/0IjnexUlFQNoO7olt4CAx3VfyIbJCGU0wPlt2Zfefx5+7CPgqLi
	w/vg==
X-Received: by 10.180.36.212 with SMTP id s20mr15553wij.14.1444768631933;
	Tue, 13 Oct 2015 13:37:11 -0700 (PDT)
Received: from [172.22.60.125] (ip-109-91-252-249.hsi12.unitymediagroup.de.
	[109.91.252.249]) by smtp.gmail.com with ESMTPSA id
	wb11sm1899291wic.16.2015.10.13.13.37.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Oct 2015 13:37:11 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Tue, 13 Oct 2015 22:37:09 +0200
Message-Id: <64124F70-A6D7-4B9E-BAEC-883D2AB76956@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 1/2] udev: Don't introduce usb or pci dependencies without usb or pci being featured
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
X-List-Received-Date: Tue, 13 Oct 2015 20:37:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Fixes that udev always requires PCI or USB, idenpendently from =
DISTRO_FEATURES
or PACKAGECONFIG.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/udev/udev.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
index c378ae3..8d12900 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -12,7 +12,14 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
=20
 LDFLAGS +=3D "-lrt"
=20
-DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native =
gperf-native libxslt-native util-linux"
+PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'usbhost', =
'usb', '', d)} \
+  ${@base_contains('DISTRO_FEATURES', 'pci', 'pci', '', d)}"
+
+DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native libxslt-native =
util-linux"
+
+PACKAGECONFIG[usb] =3D =
"--with-usb-ids-path=3D${datadir}/usb.ids,--without-usb-ids-path,libusb =
usbutils"
+PACKAGECONFIG[pci] =3D "--with-pci-ids-path=3D${datadir}/pci.ids =
ac_cv_file__usr_share_pci_ids=3Dno =
ac_cv_file__usr_share_hwdata_pci_ids=3Dno =
ac_cv_file__usr_share_misc_pci_ids=3Dyes,--without-pci-ids-path,pciutils"
+
 RPROVIDES_${PN} =3D "hotplug"
=20
 PROVIDES =3D "libgudev"
@@ -39,10 +46,6 @@ RDEPENDS_${PN}-ptest +=3D "make perl python"
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
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


