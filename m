Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2290C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 21:57:30 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.17077.1664920643847028797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 14:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XoykBxQU;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 009F8240004;
	Tue,  4 Oct 2022 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664920641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lm3juGaqANhCJnO8gFE4TOpFeiAAjrJJ/d5HSBEU9LI=;
	b=XoykBxQUMWY/mYLL/097wJrHsE61T4EL6ZgXbgVTYYP4xBKFKEj8CUFJN4gSZGfIusXU7v
	KFM3ZZ9bxLQ+ZM/17vzFXLJMYrF92bWqQasq+5W7rCpbSEs1UXwPV0kO9bn15M0YTt7y4E
	+8fJ1fFO79n6HtiiF2buzk4y1M5rg0ZrnNz4Bj0Q0MTGXNJqh8CSy1csn9iccSoVNRUdZy
	9xZOEKsb543d8oVYk+piOzNYXKecJJq8mZiRp7e1j97MBBeC5M6tRldYWHxCxKvSjrhFTa
	38HNGj1HMBQTt1uvauCKw6tvVU5Lx8gxBm84U4M4g/2dN4CVMiNA7iqY0hjk0w==
Date: Tue, 4 Oct 2022 23:57:19 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/5] u-boot: use openssl-native.bbclass
Message-ID: <20221004235719.0e2bd17b@booty>
In-Reply-To: <20221004152807.987313-1-mikko.rapeli@linaro.org>
References: <20221004152807.987313-1-mikko.rapeli@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 21:57:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171434

Hello Mikko,

On Tue,  4 Oct 2022 18:28:07 +0300
"Mikko Rapeli" <mikko.rapeli@linaro.org> wrote:

> It sets all environment variables correctly for openssl-native.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

I'm taking this patch for testing, however I have a question, see below.

> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index f022aed732..cd9c578962 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -17,7 +17,8 @@ PACKAGECONFIG ??= "openssl"
>  # u-boot will compile its own tools during the build, with specific
>  # configurations (aka when CONFIG_FIT_SIGNATURE is enabled) openssl is needed as
>  # a host build dependency.
> -PACKAGECONFIG[openssl] = ",,openssl-native"
> +OPENSSL_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'openssl-native', '', d)}"

What is the reason to use '.=' and not just '=' here?

> +inherit ${OPENSSL_INHERIT}
>  
>  # Allow setting an additional version string that will be picked up by the
>  # u-boot build system and appended to the u-boot version.  If the .scmversion



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

