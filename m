Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1RtR42-0001B5-6f
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 22:53:02 +0100
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q13Lhreu015137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 15:43:53 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q13LhrWA011639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Feb 2012 15:43:53 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 3 Feb 2012 15:43:53 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] u-boot inc: update inc file for newer u-boot versions
Thread-Index: AQHM4rxXFGUKbBfvPUajoHn7Z2ryvpYrs7HQ
Date: Fri, 3 Feb 2012 21:43:53 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10127649BE9@DFLE34.ent.ti.com>
References: <1328305049-18696-1-git-send-email-Chase.Maupin@ti.com>
	<1328305049-18696-2-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1328305049-18696-2-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] u-boot inc: update inc file for newer u-boot versions
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
X-List-Received-Date: Fri, 03 Feb 2012 21:53:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, February 03, 2012 3:37 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH 1/1] u-boot inc: update inc file for newer u-boot
> versions
>=20
> * Add support for different suffixes found with later u-boot
>   versions which have switched from .bin to .img
> * Allow recipes that include u-boot.inc to also package an
>   SPL if they build one.
>     * Minimum requirement is to set the SPL_BINARY value to add
>       the SPL to the u-boot package as well as into the deploy
>       directory.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc |   37
> ++++++++++++++++++++++++++++++++---
>  1 files changed, 33 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-
> bsp/u-boot/u-boot.inc
> index 4180345..dcf5463 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -19,11 +19,22 @@ python () {
>  		raise bb.parse.SkipPackage("because UBOOT_MACHINE is
> not set")
>  }
>=20
> -UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.bin"
> -UBOOT_BINARY ?=3D "u-boot.bin"
> -UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.bin"
> +# Some versions of u-boot use .bin and others use .img.  By
> default use .bin
> +# but enable individual recipes to change this value.
> +UBOOT_SUFFIX ?=3D "bin"
> +UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
>  UBOOT_MAKE_TARGET ?=3D "all"
>=20
> +# Some versions of u-boot build an SPL (Second Program Loader)
> image that
> +# should be packaged along with the u-boot binary as well as
> placed in the
> +# deploy directory.  For those versions they can set the following
> variables
> +# to allow packaging the SPL.
> +SPL_BINARY ?=3D ""
> +SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
> +SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
> +
>  do_compile () {
>  	unset LDFLAGS
>  	unset CFLAGS
> @@ -36,15 +47,33 @@ do_install () {
>      install -d ${D}/boot
>      install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>      ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +
> +    if [ "x${SPL_BINARY}" !=3D "x" ]
> +    then
> +        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
> +        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
> +    fi
>  }
>=20
>  FILES_${PN} =3D "/boot"
> +# no gnu_hash in uboot.bin, by design, so skip QA
> +INSANE_SKIP_${PN} =3D True

BTW, I believe I can remove this line since I didn't see any QA warnings wh=
en building without it.  I have seen versions of u-boot.inc that use the IN=
SANE_SKIP and versions that don't so I'm not sure what the right thing is h=
ere.

>=20
>  do_deploy () {
> -	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
> +    install -d ${DEPLOYDIR}
> +	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>=20
>  	cd ${DEPLOYDIR}
>  	rm -f ${UBOOT_SYMLINK}
>  	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> +
> +    if [ "x${SPL_BINARY}" !=3D "x" ]
> +    then
> +        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> +        rm -f ${DEPLOYDIR}/${SPL_BINARY}
> ${DEPLOYDIR}/${SPL_SYMLINK}
> +        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
> +        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
> +    fi
>  }
> +
>  addtask deploy before do_build after do_compile
> --
> 1.7.0.4



