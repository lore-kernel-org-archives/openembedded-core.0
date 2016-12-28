Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC30719E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:21:07 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cMEAH-0006zG-Ec from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2016 05:21:09 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Wed, 28 Dec 2016 13:21:06 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Wed, 28 Dec 2016 13:21:06 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] core-image-minimal-initramfs: fix extrausers
	functionality
Thread-Index: AQHSYQqyG2iHEMmPGU+9kL7Mkp7/qaEdV+F7
Date: Wed, 28 Dec 2016 13:21:06 +0000
Message-ID: <1482931266137.39621@mentor.com>
References: <1482930090-10835-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1482930090-10835-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] core-image-minimal-initramfs: fix extrausers	functionality
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
X-List-Received-Date: Wed, 28 Dec 2016 13:21:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore the below patch. The issue was actually fixed in master at=0A=
http://cgit.openembedded.org/openembedded-core/commit/meta/classes/extrause=
rs.bbclass?id=3Dfa541362e2d2cc0494a86a413b7b52dfe3eee908=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Belal, Awais=0A=
Sent: Wednesday, December 28, 2016 6:01 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] core-image-minimal-initramfs: fix extrausers fun=
ctionality=0A=
=0A=
The extrausers functionality requires base-passwd and shadow=0A=
to be installed before it can be leveraged. Otherwise while=0A=
using the features of the class we get into build errors=0A=
like the following=0A=
ERROR: core-image-minimal-initramfs-1.0-r0 do_rootfs: core-image-minimal-in=
itramfs: useradd command did not succeed.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/met=
a/recipes-core/images/core-image-minimal-initramfs.bb=0A=
index 5794a25..8186ddc 100644=0A=
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb=0A=
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb=0A=
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Small image capable of booting a device. T=
he kernel includes \=0A=
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the=
 \=0A=
 first 'init' program more efficiently."=0A=
=0A=
-PACKAGE_INSTALL =3D "initramfs-live-boot initramfs-live-install initramfs-=
live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BO=
OTSTRAP_INSTALL}"=0A=
+PACKAGE_INSTALL =3D "initramfs-live-boot initramfs-live-install initramfs-=
live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd shadow ${RO=
OTFS_BOOTSTRAP_INSTALL}"=0A=
=0A=
 # Do not pollute the initrd image with rootfs features=0A=
 IMAGE_FEATURES =3D ""=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

