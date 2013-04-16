Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1US4oG-0005fl-GJ
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:16:31 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3GBwvtX008851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 06:58:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3GBwvBG028631
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 06:58:57 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 16 Apr 2013 06:58:57 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCHv2] kernel: Add KERNEL_LOCALVERSION to control version
	string
Thread-Index: AQHONrTywyNMnCve6k2A2qI6lDco8pjYxghA
Date: Tue, 16 Apr 2013 11:58:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594F0D29@DLEE11.ent.ti.com>
References: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1365685393-611-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2] kernel: Add KERNEL_LOCALVERSION to control version string
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
X-List-Received-Date: Tue, 16 Apr 2013 12:16:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Thursday, April 11, 2013 8:03 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCHv2] kernel: Add KERNEL_LOCALVERSION to control
> version string
>=20
> * Add a variable called KERNEL_LOCALVERSION which when set will
>   place a version string in the .scmversion file of the kernel
>   sources.  This string will be picked up by the kernel Makefile
>   and will be appended to the kernel version.  This is done to
>   make it easier to identify what revision of the kernel sources
>   are being run.  For example you can use a setting like the
>   following to add the short commit id to the kernel version
>   string:
>=20
> KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> True).partition('+')[2][0:7]}"

Ping on this patch

>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> * Updated in version 2
>     * Check if the .scmversion file already exists and don't
>       overwrite it if it does.
>     * Based on feedback from
>       Bruce Ashfield <bruce.ashfield@gmail.com]
> ---
>  meta/classes/kernel.bbclass |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> index af58887..3d82641 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -48,6 +48,9 @@ export CMDLINE_CONSOLE =3D
> "console=3D${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
>=20
>  KERNEL_VERSION =3D "${@get_kernelversion('${B}')}"
>=20
> +# Setting KERNEL_LOCALVERSION will place a string in the
> .scmversion file
> +# of the kernel tree.  This string will be picked up by the
> build system
> +# of the kernel and appended to the kernel version.
>  KERNEL_LOCALVERSION ?=3D ""
>=20
>  # kernels are generally machine specific
> @@ -210,7 +213,12 @@ kernel_do_configure() {
>  	# $ scripts/setlocalversion . =3D> +
>  	# $ make kernelversion =3D> 2.6.37
>  	# $ make kernelrelease =3D> 2.6.37+
> -	touch ${B}/.scmversion ${S}/.scmversion
> +
> +	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> +	then
> +		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> +		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> +	fi
>=20
>  	# Copy defconfig to .config if .config does not exist. This
> allows
>  	# recipes to manage the .config themselves in
> do_configure_prepend().
> --
> 1.7.0.4



