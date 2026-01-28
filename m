Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D15D3569E
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 10:30:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10027.1769596228350295924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 02:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XTf0fEe/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 290E31A2AA3
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 10:30:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2AC96071A;
	Wed, 28 Jan 2026 10:30:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC145119A8809;
	Wed, 28 Jan 2026 11:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769596225; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d7btSEJJ8Qx4WFHndTDYuBiAqln/t25DSUNzbs/8JIc=;
	b=XTf0fEe/JZE/qw9ZuYTks7nxyqe/E4oWLma58xZ04eKTid406Y32hupNBZoFnen7/dDxXg
	AfL/uH+idLvufJX5hyeYM3UXFZ26xFA9iz1TEi6XaO1/gyie0dQ80C4/q6ZI8V8ahSHHvp
	9jmEykJt7RYzEwlt23X6Zxx4D/7ERRFhLMdQrJXQKF/1tbHAq7x/D0ZNJXjGYr1aIunGvW
	M1gGQDl/mP6LQ3Luvt4blqlzzr9V9lpnAa1LnVRhwvnmsdmt6RUOxdUdQfFyTi6XixHSK6
	db9aSfZrdOH7UGaHzcDgTsKJwjQxFaVebuYyM7T4FHatbMGEeYiEihqASQVmIw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 11:30:23 +0100
Message-Id: <DG05IA8FS2FN.2EVV3XH9J40UG@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <reatmon@ti.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] uboot: Deprecate legacy UBOOT_CONFIG flow
References: <20260127223433.23270-1-reatmon@ti.com>
In-Reply-To: <20260127223433.23270-1-reatmon@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 10:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230087

Hi,

On Tue Jan 27, 2026 at 11:34 PM CET, Ryan Eatmon via lists.openembedded.org=
 wrote:
> Mark the legacy flow for settings the UBOOT_CONFIG options in a comma
> separated list.  This code will still work through wrynose, but will be
> removed once wrynose is released.
>
> Add warnings to point people in the right direction for fixing their
> configs:
>
> WARNING: Legacy use of UBOOT_CONFIG[foo] =3D "foo_config,foo_image,foo_bi=
nary" is deprecated.  Please move to using UBOOT_CONFIG_* variables:
> WARNING:     UBOOT_CONFIG[foo] =3D "foo_config"
> WARNING:     UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D "foo_image"
> WARNING:     UBOOT_CONFIG_BINARY[foo] =3D "foo_binary"
> WARNING: Legacy use of UBOOT_CONFIG[bar] =3D "bar_config,bar_image" is de=
precated.  Please move to using UBOOT_CONFIG_* variables:
> WARNING:     UBOOT_CONFIG[bar] =3D "bar_config"
> WARNING:     UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "bar_image"
> WARNING: Legacy use of UBOOT_CONFIG[bing] =3D "bing_config,,bing_binary" =
is deprecated.  Please move to using UBOOT_CONFIG_* variables:
> WARNING:     UBOOT_CONFIG[bing] =3D "bing_config"
> WARNING:     UBOOT_CONFIG_BINARY[bing] =3D "bing_binary"

Will you please add a note for that in
https://docs.yoctoproject.org/dev/migration-guides/migration-6.0.html?

> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v2: Fix spelling error in comment.
>
>  meta/classes-recipe/uboot-config.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-reci=
pe/uboot-config.bbclass
> index 823a66157a..112fea2de4 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -27,6 +27,9 @@
>  # deemed to be limiting in terms of expanding support to more and more k=
nobs
>  # that might need to be turned to customize a config build.
>  #
> +# NOTE: Suport for this legacy flow is now deprecated and will be remove=
d from

Typo: Suport

> +#       master after the wrynose LTS release.
> +#
>  # UBOOT_MACHINE =3D ""
>  # UBOOT_CONFIG ??=3D <default>
>  # UBOOT_CONFIG[foo] =3D "foo_config,images,binary"
> @@ -181,14 +184,19 @@ python () {
>                  if config =3D=3D f:=20
>                      found =3D True
>                      items =3D v.split(',')
> +                    if items[0] and len(items) > 1:
> +                        bb.warn('Legacy use of UBOOT_CONFIG[%s] =3D "%s"=
 is deprecated.  Please move to using UBOOT_CONFIG_* variables:' % (f, v))

Add a link to the migration guide here?

I'm anticipating, but that will be
https://docs.yoctoproject.org/migration-guides/migration-6.0.html

(without the /dev, but when the release will be out the link will be valid)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


