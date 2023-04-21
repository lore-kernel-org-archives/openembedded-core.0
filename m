Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9459BC7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 07:41:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.6501.1682062857618186663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 00:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FGViQjIg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8701E240013;
	Fri, 21 Apr 2023 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682062855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2P/kL/LiuNi4bBjuYx/cLN45a6xXjvNeIZG6aMyRUg=;
	b=FGViQjIgBttWyFQzSdT3LEgoR4G5Y2xN+v9lDkSR8whSaiQqorHu9+Bp9icbXUnBsfB4M0
	Pycy+KNnUHjCIRj6fVgam5aLApNSmDxOzMziilOBhO6+uVd+E46TWapiJlFaeKyTY6fYtI
	q09aZLOxmOi+S/TLZ/cAVUB+uiN9UixJHp9+h+3Mkd0tKr3US4iJ7pNIZ5l75I1NaodG/G
	wnltLqVRMd8utBtRO2Ih/0iPEwkiyE65Of0L6YtVpPGpiqC1PHYOCyZAMXfF/6ycPUZGRj
	DdfnBSK0l9tPZPYKN/qB54i7eQxJbrZ9tVsNW6UVYD35jM60q1jGSg6Uu0Wrbw==
Date: Fri, 21 Apr 2023 09:40:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] devicetree.bbclass: Allow selection of dts
 files to build
Message-ID: <20230421094053.317c2d9c@booty>
In-Reply-To: <20230420114046.873360-1-kubiznak@2n.com>
References: <20230420114046.873360-1-kubiznak@2n.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 07:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180279

Hello Petr,

On Thu, 20 Apr 2023 13:40:46 +0200
Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrote:

> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>=20
> Since many machine configs contain a list of dtb files
> (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.
>=20
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ed2a92e447..fb73c44e22 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
> =20
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files to build. If=
 empty, all dts files are built."
> +DT_FILES ?=3D ""
> =20
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,7 +127,10 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)
> =20
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES")
> +    filter =3D [ re.sub('dtb[o]?', 'dts', dtfile) for dtfile in dtfiles.=
split() ]

I think the regexp be simplified as 'dtbo?', right?

Otherwise looks good.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

