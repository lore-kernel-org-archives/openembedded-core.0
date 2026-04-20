Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E8AF588CB
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 13:48:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19698.1776692888241268986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 06:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z07gwSDd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A87C4E42A74;
	Mon, 20 Apr 2026 13:48:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D275FFA5;
	Mon, 20 Apr 2026 13:48:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A756E1046096B;
	Mon, 20 Apr 2026 15:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776692885; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UxedgbHQkxwKubdF4m8vhecEeQYRnYDYlPyWph6UnEk=;
	b=z07gwSDd0OoPlc1rdLui14tqWjC7P+JkrGo/kepRXM9ejO74kOS6iC5KhwmbFzdN99cYLH
	FcxTkeL1yelBMjq/Ue0zlKp/+7CSj919pzb1NfZMQnMcDeLUVFsBnhF1NGerHKp159SFoK
	0cmQgBZT3oaUlNa3NvJW1Z5WYRdXhCbJnlPlIpUN4EUafNhbVM3+V0zyxv3wETQxgRdMnz
	wOKNC9bWsPid5cPjK07AM686ShaN11DGqVuUmfZGJ2yecssiv37WQGsPc5yZKI0CPqINSC
	75TyxfkvXqSCQZ3IymERFgNznIO9Yhp+R7vH/lRNXXr5JBU7Ho0afGSjucqvYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 15:48:04 +0200
Message-Id: <DHY12B5ZXWHW.216QNH8DEQW4Y@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] sanity: add check for
 own-mirrors/SOURCE_MIRROR_URL
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <corentin.guillevic@smile.fr>,
 <openembedded-core@lists.openembedded.org>
References: <20260420133804.443583-2-corentin.guillevic@smile.fr>
In-Reply-To: <20260420133804.443583-2-corentin.guillevic@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 13:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235566

Hi,

On Mon Apr 20, 2026 at 3:38 PM CEST, Corentin Guillevic via lists.openembed=
ded.org wrote:
> From: Corentin Guillevic <corentin.guillevic@smile.fr>
>
> The SOURCE_MIRROR_URL variable belongs to  the own-mirrors class. However=
, the
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
>     Changes in v2:
>     - Use addresult() / oe.utils.inherits() instead of bb.fatal() / inher=
itlist.split()
>
>  meta/classes-global/sanity.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 1a490f8d61..cd2cfa9a62 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -984,6 +984,11 @@ def check_sanity_everybuild(status, d):
>              "Please set TMPDIR to a clean path with no trailing slash or=
 "
>              "consecutive slashes (e.g. %s).\n" % (tmpdir, os.path.normpa=
th(tmpdir)))
> =20
> +    # Check whether the SOURCE_MIRROR_URL variable, belonging to the 'ow=
n-mirrors' class, is defined
> +    inheritlist =3D d.getVar('INHERIT')

This variable isn't used afterwards, you can remove it

> +    if oe.utils.inherits(d, 'own-mirrors') and not d.getVar('SOURCE_MIRR=
OR_URL'):
> +        status.addresult("own-mirrors is enabled, but SOURCE_MIRROR_URL =
is not defined")
> +
>      # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
>      import re
>      mirror_vars =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']


Antonin

