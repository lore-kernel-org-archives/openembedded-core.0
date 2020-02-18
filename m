Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id CF6DE613C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=3510; q=dns/txt; s=axis-central1;
	t=1582067934; x=1613603934;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=bMLIjm8w38VH+qYUtjcRm9ZxDzj+g+m9VnQYdFOwkaA=;
	b=cCBSDYdukkCVObTfpTFLKrRtFI2nc7pafNLeA6WICNY+mLjhcpoMf/7L
	9YD25WeEZ6xYmlC6Z6BNDHA0JberDy8gxVQE1kmYBYKP5FwQ86yGUf9DS
	o36byXuZx7MmDSBFNpdXskUrq72bXpqhpgua25LBqcLxgaGZsnsMwPABm
	rXvwWw8kQ67rVrppe9Ms+riIqGireCfyjcnmaehioyBzAaXt5KdbsCPiQ
	4rOBaGEbyArzNJ9uFRR8sJlzdKffaYy1hPrHgSf6UZHvseORpdxDAIqB1
	n98kbKDRJXBjbu98clR8Pe0qra/GZhy9RT70CIhtCykkTBKmT1enD2uwr Q==;
IronPort-SDR: KT5FofYYiG1Zl9vOarNFdj34P7ftA6IvegSgtBw0ZMezw1fuijUuSEvEjb67dFVs19KSdd2g76
	u3PXrYfstHI0AVinNXHzaKg3CYRm8VNgD3hp18FVyZQaUS1yaaJtIDg+KTCv5ORftSyx5uBFNs
	YpA+ic4TOe4I7YIcGTtRjUo8QT/b70MlX+u02L9VAPYbVpMxPcZNETF706HLW9gxak/w2IYYZ2
	NP802JB8pBgekzmGAQzZhpVHaDpSVcic6BjqN3m+5lcVRWEvQxX6H5j9i+jX2P4SZgI2y12lxc
	rVE=
X-IronPort-AV: E=Sophos;i="5.70,458,1574118000"; 
   d="scan'208";a="5573412"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Scott Branden <scott.branden@broadcom.com>
Thread-Topic: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink support to
	iproute2
Thread-Index: AQHV5q0UR+hsPlXdWkq5SqeeQn0U+aghj9xg
Date: Tue, 18 Feb 2020 23:18:51 +0000
Message-ID: <20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
References: <20200218224455.14551-1-scott.branden@broadcom.com>
In-Reply-To: <20200218224455.14551-1-scott.branden@broadcom.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] iproute2: add devlink support to	iproute2
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
X-List-Received-Date: Tue, 18 Feb 2020 23:18:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Scott Branden via
> Openembedded-core
> Sent: den 18 februari 2020 23:45
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink support to
> iproute2
>=20
> Add devlink support to iproute2 recipe.
>=20
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index fc31b8444e..98793af88e 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
>=20
>  CLEANBROKEN =3D "1"
>=20
> -PACKAGECONFIG ??=3D "tipc elf"
> +PACKAGECONFIG ??=3D "tipc elf devlink"
>  PACKAGECONFIG[tipc] =3D ",,libmnl,"
>  PACKAGECONFIG[elf] =3D ",,elfutils,"
> +PACKAGECONFIG[devlink] =3D ",,libmnl,"
>=20
>  EXTRA_OEMAKE =3D "CC=3D'${CC}' KERNEL_INCLUDE=3D${STAGING_INCDIR} DOCDIR=
=3D${docdir}/iproute2 SUBDIRS=3D'lib tc ip bridge misc genl \
> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlin=
k', '', d)}                                               \
>                  ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', ''=
, d)}' SBINDIR=3D'${base_sbindir}' LIBDIR=3D'${libdir}'"

You can simplify the above to:

EXTRA_OEMAKE =3D "CC=3D'${CC}' KERNEL_INCLUDE=3D${STAGING_INCDIR} DOCDIR=3D=
${docdir}/iproute2 SUBDIRS=3D'lib tc ip bridge misc genl \
                ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' SB=
INDIR=3D'${base_sbindir}' LIBDIR=3D'${libdir}'"

but I also recommend to reformat it to make it more readable:

EXTRA_OEMAKE =3D "\
    CC=3D'${CC}' \
    KERNEL_INCLUDE=3D${STAGING_INCDIR} \
    DOCDIR=3D${docdir}/iproute2 \
    SUBDIRS=3D'lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG=
', 'devlink tipc', d)}' \
    SBINDIR=3D'${base_sbindir}' \
    LIBDIR=3D'${libdir}' \
"

>=20
>  do_configure_append () {
> @@ -46,7 +48,8 @@ PACKAGES =3D+ "${PN}-tc \
>               ${PN}-rtacct \
>               ${PN}-nstat \
>               ${PN}-ss \
> -             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc',=
 '', d)}"
> +             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc',=
 '', d)} \
> +             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-dev=
link', '', d)}"

Assuming that the tipc and devlink binaries are only created when tipc=20
and devlink are included in SUBDIRS above, which seems reasonable, you=20
can simplify the above and remove the PACKAGECONFIG checks since the=20
packages will only be created if there actually are files to put in=20
them, e.g.:

PACKAGES =3D+ "\
    ${PN}-tc \
    ${PN}-lnstat \
    ${PN}-ifstat \
    ${PN}-genl \
    ${PN}-rtacct \
    ${PN}-nstat \
    ${PN}-ss \
    ${PN}-tipc \
    ${PN}-devlink \
"

>  FILES_${PN}-tc =3D "${base_sbindir}/tc* \
>                    ${libdir}/tc/*.so"
>  FILES_${PN}-lnstat =3D "${base_sbindir}/lnstat \
> @@ -58,6 +61,7 @@ FILES_${PN}-rtacct =3D "${base_sbindir}/rtacct"
>  FILES_${PN}-nstat =3D "${base_sbindir}/nstat"
>  FILES_${PN}-ss =3D "${base_sbindir}/ss"
>  FILES_${PN}-tipc =3D "${base_sbindir}/tipc"
> +FILES_${PN}-devlink =3D "${base_sbindir}/devlink"
>=20
>  ALTERNATIVE_${PN} =3D "ip"
>  ALTERNATIVE_TARGET[ip] =3D "${base_sbindir}/ip.${BPN}"
> --
> 2.17.1

//Peter

