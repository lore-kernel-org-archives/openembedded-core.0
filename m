Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id BF54E73CC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:47:00 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so40391191wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=l8SVP7E1SyhNN8crkPknKaHlJ8CPUNg3luzThAzj64g=;
	b=E6lRewjkeb0Jz4t7Y9DI2PxA0Yt9Lrh77x2B/0kzChZSHj7Grfb4YN7/F8EvhMTcIU
	GjYm8dPkHd1Ojy59qY4ZHoa1t/8UL2qlKHIl1hDONxR08RgXpP91YSan675FZDC4QJWd
	AKhGa2gWHaJSDbKUu8Ub6hnbeANvljoIOfc4XbsCB0MD3a6G0D6Vfc6nCC6BxaeIORWW
	oI0UxX9ULhYs6x1Uk1MfKs5E3sMKarn0pGUMGuLjStMxNMxbZKqgWabyhYGR7Q+tFTLM
	Y9kZ5uxS/g65t8Q6sNeVzskLVa2w58kIJjYcfAklOhag08ygYabdloUn9aix+RKh7XTL
	7WzQ==
X-Received: by 10.194.71.84 with SMTP id s20mr1665548wju.89.1446119220249;
	Thu, 29 Oct 2015 04:47:00 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	bh5sm1369397wjb.42.2015.10.29.04.46.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 04:46:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <64124F70-A6D7-4B9E-BAEC-883D2AB76956@gmail.com>
Date: Thu, 29 Oct 2015 12:46:58 +0100
Message-Id: <BA125892-677A-46E4-941A-F562797EB8BD@gmail.com>
References: <64124F70-A6D7-4B9E-BAEC-883D2AB76956@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH 1/2] udev: Don't introduce usb or pci dependencies without usb or pci being featured
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
X-List-Received-Date: Thu, 29 Oct 2015 11:47:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.10.2015 um 22:37 schrieb Jens Rehsack <rehsack@gmail.com>:
>=20
>=20
> Fixes that udev always requires PCI or USB, idenpendently from =
DISTRO_FEATURES
> or PACKAGECONFIG.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> meta/recipes-core/udev/udev.inc | 13 ++++++++-----
> 1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
> index c378ae3..8d12900 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -12,7 +12,14 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>=20
> LDFLAGS +=3D "-lrt"
>=20
> -DEPENDS =3D "glib-2.0 libusb usbutils pciutils glib-2.0-native =
gperf-native libxslt-native util-linux"
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'usbhost', =
'usb', '', d)} \
> +  ${@base_contains('DISTRO_FEATURES', 'pci', 'pci', '', d)}"
> +
> +DEPENDS =3D "glib-2.0 glib-2.0-native gperf-native libxslt-native =
util-linux"
> +
> +PACKAGECONFIG[usb] =3D =
"--with-usb-ids-path=3D${datadir}/usb.ids,--without-usb-ids-path,libusb =
usbutils"
> +PACKAGECONFIG[pci] =3D "--with-pci-ids-path=3D${datadir}/pci.ids =
ac_cv_file__usr_share_pci_ids=3Dno =
ac_cv_file__usr_share_hwdata_pci_ids=3Dno =
ac_cv_file__usr_share_misc_pci_ids=3Dyes,--without-pci-ids-path,pciutils"
> +
> RPROVIDES_${PN} =3D "hotplug"
>=20
> PROVIDES =3D "libgudev"
> @@ -39,10 +46,6 @@ RDEPENDS_${PN}-ptest +=3D "make perl python"
> libexecdir =3D "${base_libdir}"
> EXTRA_OECONF =3D "--disable-introspection \
>                 --with-rootlibdir=3D${base_libdir} \
> -                --with-pci-ids-path=3D${datadir}/pci.ids \
> -                ac_cv_file__usr_share_pci_ids=3Dno \
> -                ac_cv_file__usr_share_hwdata_pci_ids=3Dno \
> -                ac_cv_file__usr_share_misc_pci_ids=3Dyes \
>                 --sbindir=3D${base_sbindir} \
>                 --libexecdir=3D${nonarch_base_libdir} \
>                 --with-rootlibdir=3D${base_libdir} \
> --=20
> 1.9.1

Ping ;)

--=20
Jens Rehsack - rehsack@gmail.com


