Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30046C77B78
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:07:51 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17445.1682201263417056890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 15:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E83340301;
	Sat, 22 Apr 2023 22:07:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 59duwN6YUZwJ; Sat, 22 Apr 2023 22:07:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7FAB140021;
	Sat, 22 Apr 2023 22:07:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 043D6163831; Sat, 22 Apr 2023 18:07:02 -0400 (EDT)
Date: Sat, 22 Apr 2023 18:07:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Petr =?utf-8?B?S3ViaXrFiMOhaw==?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of dts
 files to build
Message-ID: <20230422220701.GD9226@denix.org>
References: <20230421152325.3327461-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421152325.3327461-1-kubiznak@2n.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 22:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180324

On Fri, Apr 21, 2023 at 05:23:25PM +0200, Petr Kubiz=C5=88=C3=A1k wrote:
> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>=20
> Since many machine configs contain a list of dtb files
> (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.

Any examples of this being used? Not really clear from the description wh=
at's=20
this really used for...


> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-reci=
pe/devicetree.bbclass
> index ed2a92e447..bd50d7fa1d 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
> =20
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the dev=
ice tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to s=
elect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to =
build. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files (relative =
to DT_FILES_PATH) to build. If empty, all dts files are built."
> +DT_FILES ?=3D ""
> =20
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, use=
d as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, =
stderr=3Dsubprocess.STDOUT)
> =20
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES").split()
> +    dtfiles =3D [ re.sub(r"\.dtbo?$", ".dts", dtfile) for dtfile in dt=
files ]
>      listpath =3D d.getVar("DT_FILES_PATH")
> -    for dts in os.listdir(listpath):
> +    for dts in dtfiles or os.listdir(listpath):
>          dtspath =3D os.path.join(listpath, dts)
>          try:
>              if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts"=
) or devicetree_source_is_overlay(dtspath)):
> --=20
> 2.30.2

