Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E68D12D57
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 12:18:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13673.1764764293566650501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 04:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U+pzRln6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 96B04C13577
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 12:17:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D471B60706;
	Wed,  3 Dec 2025 12:18:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63AF6119204BB;
	Wed,  3 Dec 2025 13:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764764291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lcc2Oy3HzZbw/Eoi4C8rY1KzAn53eeFKvHHyV6UyNZU=;
	b=U+pzRln67wNeEteKxtHWcI18B6/PZ6mT4XknXDtmtHviIoYWdvqfSTDV5zzmKNLIO6uQZW
	x304oHDaK3+dI0TlisMubZ0KsSh5gDhdz97ljQMGruAEATpxPNg9Qnid2XMXKeRMl4g8ZV
	cQ0Eesc61jmdH+53kpFlgd2lybUcVxdnnWeCWeci6Z+n30gwfeg9/0IBxAjJouVEP9wwJb
	mK12LppvACkDvnJQzU1feoNRxw4CE6ee7HbyDYQSdUD4jq8dW9trCqp/nktCYAq86KxMO7
	HDnrUo93o4z25dgyyO2wqWs3lDYJfJLwhLYprceITZAbrwjs5LJ/wJTIGJCHaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 13:18:08 +0100
Message-Id: <DEOKQA0V2JMN.2N90MYX04GK3E@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/2]
 python3-sphinxcontrib-svg2pdfconverter: add new recipe
Cc: "Antonin Godard" <antonin.godard@bootlin.com>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251203-svg2pdf-v3-0-879d05cb101b@cherry.de>
 <20251203-svg2pdf-v3-1-879d05cb101b@cherry.de>
In-Reply-To: <20251203-svg2pdf-v3-1-879d05cb101b@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 12:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227222

On Wed Dec 3, 2025 at 12:32 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> This will be a dependency for building the Yocto docs soon, so let's add
> a recipe for it.
>
> This does SVG to PDF (or PNG) conversion for images used in Sphinx
> projects.
>
> It exposes three different Sphinx extensions, each using a different
> tool for the conversion:
> - cairosvg, a Python module with no available recipe,
> - inkscape, only available in seemingly unmaintained 3rd party layer,
> - rsvg-convert,
>
> So we'll only support the last extension for now.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---

Hi Quentin,

Thanks for your patch.

>  meta/conf/distro/include/maintainers.inc             |  1 +
>  .../python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb  | 20 ++++++++++++++=
++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 9f4e5e2df8..f819a21cce 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -733,6 +733,7 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery =3D=
 "Tim Orling <tim.orling@kons
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jsmath =3D "Tim Orling <tim.o=
rling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp =3D "Tim Orling <tim.o=
rling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml =3D "Tim Orli=
ng <tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-sphinxcontrib-svg2pdfconverter =3D "Antonin=
 Godard <antonin.godard@bootlin.com>"

It looks like this is not enough to make QA happy:

2025-12-03 10:53:56,449 - oe-selftest - INFO - FAIL: distrodata.Distrodata.=
test_maintainers (subunit.RemotedTestCase)
2025-12-03 10:53:56,449 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2025-12-03 10:53:56,449 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/distrodata.py", line 105, in test_m=
aintainers
    self.fail("""
  File "/usr/lib/python3.10/unittest/case.py", line 675, in fail
    raise self.failureException(msg)
AssertionError:
The following recipes do not have a maintainer assigned to them. Please add=
 an entry to meta/conf/distro/include/maintainers.inc file.
python3-sphinxcontrib-svg2pdfconverter (/srv/pokybuild/yocto-worker/oe-self=
test-debian/build/layers/openembedded-core/meta/recipes-devtools/python/pyt=
hon3-sphinxcontrib-svg2pdfconverter_2.0.0.bb)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2786
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2681

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


