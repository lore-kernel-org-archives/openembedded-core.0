Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1T9lnM-0005E7-VF
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:47:37 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q86NZA5x021175;
	Thu, 6 Sep 2012 18:35:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q86NZ8Lq001518;
	Thu, 6 Sep 2012 18:35:10 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Thu, 6 Sep 2012 18:35:07 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Saul Wold <sgw@linux.intel.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH] u-boot: Use fw_env.config if
	available.
Thread-Index: AQHNiuLmF4ueulg96kSeh7/khIr/w5d925SAgAAeqAA=
Date: Thu, 6 Sep 2012 23:35:07 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B767E@DFLE09.ent.ti.com>
References: <1346794545-14277-1-git-send-email-fcooper27jr@gmail.com>
	<5048D2BB.3000909@linux.intel.com>
In-Reply-To: <5048D2BB.3000909@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Use fw_env.config if available.
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
X-List-Received-Date: Thu, 06 Sep 2012 23:47:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I released a second revision of this patch that should be used instead. htt=
p://patches.openembedded.org/patch/35845/

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Thursday, September 06, 2012 11:44 AM
To: Franklin S. Cooper Jr
Cc: openembedded-core@lists.openembedded.org; Cooper Jr., Franklin; Frankli=
n S. Cooper Jr
Subject: Re: [OE-core] [oe-core][PATCH] u-boot: Use fw_env.config if availa=
ble.

On 09/04/2012 02:35 PM, Franklin S. Cooper Jr wrote:
> * Add support for board specific fw_env.config file if available.
>
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot.inc           |   16 +++++++++++-----
>   meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
>   meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
>   meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 +-
>   4 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc=20
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index a8642f0..ed587a6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -49,6 +49,11 @@ do_install () {
>       install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>       ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>
> +    if [ -e ${WORKDIR}/fw_env.config ] ; then
> +        install -d ${D}${sysconfdir}
> +        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env=
.config
> +    fi
> +
>       if [ "x${SPL_BINARY}" !=3D "x" ]
>       then
>           install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE} @@ -56,16=20
> +61,17 @@ do_install () {
>       fi
>   }
>
> -FILES_${PN} =3D "/boot"
> +FILES_${PN} =3D "/boot$ {sysconfdir}"
>   FILESPATH =3D. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
>
>   do_deploy () {
>       install -d ${DEPLOYDIR}
> -	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>
> -	cd ${DEPLOYDIR}
> -	rm -f ${UBOOT_SYMLINK}
> -	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> +    cd ${DEPLOYDIR}
> +    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> +    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> +    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>
>       if [ "x${SPL_BINARY}" !=3D "x" ]
>       then
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb=20
> b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> index 8465395..a9cbeca 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42=
237583f50183a5651ecb \
>   SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>
>   PV =3D "v2011.03+git${SRCPV}"
> -PR =3D "r7"
> +PR =3D "r8"
>
>   SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb=20
> b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> index 9654795..a115ed2 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42=
237583f50183a5651ecb \
>   SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>
>   PV =3D "v2011.06+git${SRCPV}"
> -PR =3D "r2"
> +PR =3D "r3"
>
>   SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb=20
> b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> index c4ec50d..6c099b1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42=
237583f50183a5651ecb"
>   SRCREV =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"
>
>   PV =3D "v2012.04.01+git${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
>
>   SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>
>
Merged into OE-Core

Thanks
	Sau!



