Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1US4oT-0005gn-5Q
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:17:00 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3GBxAdg028355
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 06:59:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3GBxA3g029019
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 06:59:10 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 16 Apr 2013 06:59:10 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control version
	string
Thread-Index: AQHONrTyMEWf9/PHUkyrTD+wR8JQQZjYxijg
Date: Tue, 16 Apr 2013 11:59:10 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594F0D62@DLEE11.ent.ti.com>
References: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
	<1365685393-611-2-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1365685393-611-2-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control version string
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 12:17:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, April 11, 2013 8:03 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCHv2] u-boot: Add UBOOT_LOCALVERSION to control
> version string
>=20
> * Add a variable called UBOOT_LOCALVERSION which when set will
>   place a version string in the .scmversion file of the u-boot
>   sources.  This string will be picked up by the u-boot Makefile
>   and will be appended to the u-boot version.  This is done to
>   make it easier to identify what revision of the u-boot sources
>   are being run.  For example you can use a setting like the
>   following to add the short commit id to the u-boot version
>   string:
>=20
> UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).partition('+')[2][0:7]}"
>=20

Ping on this patch

> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> * Updated in version 2
>     * Check if the .scmversion file already exists and don't
>       overwrite it if it does.
>     * Based on feedback from
>       Bruce Ashfield <bruce.ashfield@gmail.com]
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-
> bsp/u-boot/u-boot.inc
> index ae53b90..6bbe457 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -16,6 +16,11 @@ python () {
>  		raise bb.parse.SkipPackage("because UBOOT_MACHINE is
> not set")
>  }
>=20
> +# Allow setting an additional version string that will be picked
> up by the
> +# u-boot build system and appended to the u-boot version.  If
> the .scmversion
> +# file already exists it will not be overwritten.
> +UBOOT_LOCALVERSION ?=3D ""
> +
>  # Some versions of u-boot use .bin and others use .img.  By
> default use .bin
>  # but enable individual recipes to change this value.
>  UBOOT_SUFFIX ?=3D "bin"
> @@ -40,6 +45,13 @@ do_compile () {
>  	unset LDFLAGS
>  	unset CFLAGS
>  	unset CPPFLAGS
> +
> +	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> +	then
> +		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> +		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> +	fi
> +
>  	oe_runmake ${UBOOT_MACHINE}
>  	oe_runmake ${UBOOT_MAKE_TARGET}
>  }
> --
> 1.7.0.4



