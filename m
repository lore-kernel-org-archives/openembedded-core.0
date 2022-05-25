Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0592BC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 08:29:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4452.1653467348719678778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 01:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C4jbd8Wq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5025D1C0006;
	Wed, 25 May 2022 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653467347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZMV5JaO4uXMooQKHsirLWHpkq1KaT1m+lgG92bl1tg=;
	b=C4jbd8Wq8aqxFMLplOAcUtaOcn9IUj6EMbGX+jq8IOepSzOuVtrpQD2MUHyMrgAHpQo63H
	x/gpCKUIFckLgS0N5qDpuCzX2lEOhlGKhg9jFuiFPItLCea7N2yN/lAfQe+egHXwoMq0bw
	w25lQNeca/mZA56QP7PfI6rASnAJXefJlkPYPu8DaCoYIPdYCzzmOV7XjDJ7AY2yBGGIzx
	OOzazo3iEjQUHGXeyC3DjbUUBs2IYCeLfYS3CzTSJ8EJGcNYBrtIbStdUOTCHbCIloD+QY
	lKay00oFy0cAQRFw4s4XVJCiQMscCuajcyFBkXsImVj1MRtUx78CcKWZT4hQxw==
Date: Wed, 25 May 2022 10:29:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] apt: fix upstream version check
Message-ID: <20220525102904.016e5c61@melee>
In-Reply-To: <20220524173622.4033177-1-alex@linutronix.de>
References: <20220524173622.4033177-1-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 08:29:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166107

Hi Alex,

Il giorno Tue, 24 May 2022 19:36:22 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/apt/apt_2.4.5.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
> index 95c25e3036..1d94dd118c 100644
> --- a/meta/recipes-devtools/apt/apt_2.4.5.bb
> +++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
> @@ -31,8 +31,14 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  # the package is taken from snapshots.debian.org; that source is static and goes stale
>  # so we check the latest upstream from a directory that does get updated
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
> -
> -inherit cmake perlnative bash-completion upstream-version-is-even useradd
> +# apt seems to follow a peculiar version policy, where every *other* even version
> +# is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there is no way
> +# to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.

Or, "how to reinvent the wheel in order to uselessly complicate other
people's lives".

I'm taking your patch for testing, but I have a question.

Is this  policy documented? If so, IMO a URL here would be nice.
Otherwise, is it wise to encode future stable releases here without
really knowing whether the practice seen so far will go on in the
future?

> +UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"

Maybe this would be more generic (untested):

  (([2468\.[26])|([3579]\.[048]))

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

