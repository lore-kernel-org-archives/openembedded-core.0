Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C87FD8FC4
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 15:09:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72186.1772118580160891708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 07:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZFWlIvtR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3619F4E4122B;
	Thu, 26 Feb 2026 15:09:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D2885FDEB;
	Thu, 26 Feb 2026 15:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3980210369333;
	Thu, 26 Feb 2026 16:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772118577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cMQX4/oyyEgLRkZxn4SmnWxjykT95jMz9lueI7Aq5L8=;
	b=ZFWlIvtRBLWvCbJyoF0DHcKuuqueyDEgV2yGVe/uCyjgKiTQlDqVRfArlv3OH+qkqZIYzo
	Ti1idBz/MOqCytMxZTDNCm0h1nqL7OxAE+93D+yzGGpBjyXmL2hDeRu0HkbmBaqqCyvO02
	Apay8eyL/WWnqqkEVknW5aiBE/uq+I9qv+FzH6EL4UiLiGpCu5GTy/h1HAgregQ+eL59Df
	VmZpUGVJfkkAutKxBiZQo+3orrfgEdFYfnayfbOKswWFbXo6O5grSIjiX1AL51bkRmMrfg
	8pnfC6X6N8kT0jMZmJQcG+bHynH97jIdPlUjyovQ6Izk+BcRyHYGQEPQRPTFlQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: ross.burton@arm.com
Subject: Re: [OE-core][PATCH v2 0/8] Add SPDX 3 Recipe Information
Date: Thu, 26 Feb 2026 16:09:35 +0100
Message-ID: <8690350.NyiUUSuA9g@brobin-bootlin>
In-Reply-To: <3328290.5fSG56mABF@brobin-bootlin>
References: 
 <20260220154123.376880-1-JPEWhacker@gmail.com>
 <DGOWOVJXTVRE.10V5UWB69WBCW@bootlin.com> <3328290.5fSG56mABF@brobin-bootlin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232034

On Thursday, February 26, 2026 at 3:27=E2=80=AFPM, Benjamin Robin wrote:
> On Thursday, February 26, 2026 at 1:52=E2=80=AFPM, Mathieu Dubois-Briand =
wrote:
> > And a second one:
> >=20
> > Initialising tasks...ERROR: Task virtual:multilib:lib32:/srv/pokybuild/=
yocto-worker/qemux86-world-alt/build/layers/openembedded-core/meta/recipes-=
core/meta/meta-world-recipe-sbom.bb:do_create_spdx has circular dependency =
on /srv/pokybuild/yocto-worker/qemux86-world-alt/build/layers/openembedded-=
core/meta/recipes-core/meta/meta-world-recipe-sbom.bb:do_create_spdx
> > ERROR: Command execution failed: 1
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3086
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3253
>=20
> For the second issue, it can be triggered by adding these lines in local.=
conf:
>=20
> MACHINE =3D "qemux86"
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib32'
>=20
> With this configuration these 2 commands failed:
>  - bitbake -c create_recipe_sbom meta-world-recipe-sbom
>  - bitbake world

I am proposing this fix for meta/recipes-core/meta/meta-world-recipe-sbom.b=
b:

python calculate_extra_depends() {
    exclude =3D set('${WORLD_SBOM_EXCLUDE}'.split())
    exclude.add(self_pn)
=20
    for variant in ('${MULTILIB_VARIANTS}' or "").split():
        exclude.add(f"{variant}-{self_pn}")
=20
    for p in world_target:
        if p in exclude:
            continue
        deps.append(p)
}

This fix solve the second issue (circular dependency).

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




