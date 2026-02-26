Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143F5FCE093
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:27:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71171.1772116055643856559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sy3YAftW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 46596C40693
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:27:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9B835FDEB;
	Thu, 26 Feb 2026 14:27:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 221D8103693B4;
	Thu, 26 Feb 2026 15:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772116049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3/A+YLdPgyDDZoe/WXCwCqD5oJGljo93nOm3gqBFvKw=;
	b=sy3YAftW4iL8yFtfxU+mRGFBjhtKnztIbl1pRkMMoDG1Y5t7tOHnAP0URTQqqbKpkIezGn
	rXRi2x29LLiBJUYzY82zSx7rIW3aqhXxm+EnG4Up26oOlRbOSbAP32mahNWnu2xhrK/sdT
	1ZOyMHN0YuyYJalcEitKWFsvFZRlykmyybLYqFc0YTxq+DvuugKlcq1sKzRRz1iDAV9fd+
	B2b+rKAaHUyU4JuPpsvIi9/UFJfjNs0xZdaX4nC8+YoFFxUvlXWeNxNaQYqHyHbZwxU3CP
	zd4rUcxnH1o91STrcHl4axZ41q317JlUweFZl2bx0fqRduIpF3mzbFbk5kdlEw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: ross.burton@arm.com
Subject: Re: [OE-core][PATCH v2 0/8] Add SPDX 3 Recipe Information
Date: Thu, 26 Feb 2026 15:27:28 +0100
Message-ID: <3328290.5fSG56mABF@brobin-bootlin>
In-Reply-To: <DGOWOVJXTVRE.10V5UWB69WBCW@bootlin.com>
References: 
 <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
 <DGOWOVJXTVRE.10V5UWB69WBCW@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232030

On Thursday, February 26, 2026 at 1:52=E2=80=AFPM, Mathieu Dubois-Briand wr=
ote:
> And a second one:
>=20
> Initialising tasks...ERROR: Task virtual:multilib:lib32:/srv/pokybuild/yo=
cto-worker/qemux86-world-alt/build/layers/openembedded-core/meta/recipes-co=
re/meta/meta-world-recipe-sbom.bb:do_create_spdx has circular dependency on=
 /srv/pokybuild/yocto-worker/qemux86-world-alt/build/layers/openembedded-co=
re/meta/recipes-core/meta/meta-world-recipe-sbom.bb:do_create_spdx
> ERROR: Command execution failed: 1
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3086
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3253

=46or the second issue, it can be triggered by adding these lines in local.=
conf:

MACHINE =3D "qemux86"
OE_FRAGMENTS +=3D 'core/yocto-autobuilder/multilib-x86-lib32'

With this configuration these 2 commands failed:
 - bitbake -c create_recipe_sbom meta-world-recipe-sbom
 - bitbake world

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




