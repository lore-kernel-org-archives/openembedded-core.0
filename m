Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F1F588E3
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 14:42:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21383.1776696146009270980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 07:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A94KRiWf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D571C1A336C
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 14:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC74D5FFA5;
	Mon, 20 Apr 2026 14:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B77410460908;
	Mon, 20 Apr 2026 16:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776696143; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IBwN/Cq+Fu4g7CZiPmuJoK74mpw4sFezeOKr+S33txI=;
	b=A94KRiWf4fDcdNXvmHoaCHtDexr2becbW/0heHBagRgU0x9q9T3i3rsMYR1O2DAb3N4cD8
	pDIUxWKdD2DR1xglN8eGodahJymawY5qO9nDdubHuvVCucS3bwxANo3we3cSX7GtX3bARN
	mQDcHk3Vl8Re6hM/a+1wHx6C5qXqkv3h2hdBSGceRIy1lptlsoAYn45vOradByqYlik/0R
	qocyRrXcXZxBTIYapQ9DNKhE1wd0Z5JAuizECUkLY1WOIWYSaTzKDt2GimvtfY+zlqSEMB
	v2RlblCyAh2VbNBx+rwNghRBNpBa40ud3p2zH2Uq0rUg5NyWau2ItM/F3+abqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:42:21 +0200
Message-Id: <DHY27VP0PXS1.3BCMSWT6AHOW9@bootlin.com>
To: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] sanity: add check for
 own-mirrors/SOURCE_MIRROR_URL
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260420143154.452247-2-corentin.guillevic@smile.fr>
In-Reply-To: <20260420143154.452247-2-corentin.guillevic@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 14:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235570

On Mon Apr 20, 2026 at 4:31 PM CEST, Corentin Guillevic via lists.openembed=
ded.org wrote:
> From: Corentin Guillevic <corentin.guillevic@smile.fr>
>
> The SOURCE_MIRROR_URL variable belongs to the own-mirrors class. However,=
 the
> user may forget to define it. This will cause the class to inject incorre=
ct
> content into PREMIRRORS, resulting in the following error:
>
> ERROR: gettext-minimal-native-1.0-r0 do_fetch: Bitbake Fetcher Error: Mal=
formedUrl('${SOURCE_MIRROR_URL}')
> ERROR: Logfile of failure stored in: /path/to/tmp/work/x86_64-linux/gette=
xt-minimal-native/1.0/temp/log.do_fetch.258066
> ERROR: Task (/path/to/layers/poky/meta/recipes-core/gettext/gettext-minim=
al-native_1.0.bb:do_fetch) failed with exit code '1'
>
> Add a check to the sanity class, to detect this case and raise an error.
>
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---
>
> Notes:
>     Changes in v3:
>     - Unused variable removed.
>
>  meta/classes-global/sanity.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 1a490f8d61..3142ff61f2 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -984,6 +984,10 @@ def check_sanity_everybuild(status, d):
>              "Please set TMPDIR to a clean path with no trailing slash or=
 "
>              "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpa=
th(tmpdir)))
> =20
> +    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'ow=
n-mirrors' class, is defined
> +    if oe.utils.inherits(d, 'own-mirrors') and not d.getVar('SOURCE_MIRR=
OR_URL'):
> +        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_URL =
is not defined")
> +
>      # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
>      import re
>      mirror_vars =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

This should be added to
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/qa-ch=
ecks.rst
if merged and if you have some time and can send a patch to docs@lists.yoct=
oproject.org :)

Thanks,
Antonin

