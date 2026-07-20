Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803DFC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:31:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.189.1784561455685242348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=w++JnR0B;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4VM0j9S0LiLjlrHmWw/TVqH95qoS30PbmMMB2rWdAFk=; b=w++JnR0BKRypwGqvNpekN/Syp4
	2JFI/+pqBY5o6Q2Yt8M1hL1wHWcgKoECbmiVDwyH33N+yPHMX+dDzLhaVfgUKJEB1f+InhGPf+aoW
	bhxzmmw6DznZ69YsGZZpPNnntbU2aaScVKyjCTZde+bTqg9vDwzAHEjYlLr7PXJ6C9MfraZ4W9a8w
	d44datWWHbWK8sR6YXm4yYOC3J52kHZkr523wJ+UYC8u3O6N7AjxciIxjc4StkPrTQbQUgEZqj2L6
	lrwKOw3Rghlc8i2hdWC2OhYZQ7yuGVqmloDwuUsInTkpStKR4IMWn8iFAJsvCblB9S12+9ATmzDiZ
	qHhuAs7Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34992 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wlpxF-0000000AZJm-1qyC;
	Mon, 20 Jul 2026 11:30:53 -0400
Date: Mon, 20 Jul 2026 11:30:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss+yocto@0leil.net>
cc: openembedded-core@lists.openembedded.org, 
    Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] kernel.bbclass: pass args instead of tuple of args to
 runstrip()
In-Reply-To: <20260720-runstrip-not-tuple-arg-v1-1-e07764fe3f41@cherry.de>
Message-ID: <636bd2fe-9b3e-16bc-7a38-ef8c110c2a49@crashcourse.ca>
References: <20260720-runstrip-not-tuple-arg-v1-1-e07764fe3f41@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241412

On Mon, 20 Jul 2026, Quentin Schulz wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> Since commit 7c99f90079e7 ("lib/package/utils: Improve
> multiprocess_launch argument passing"), runstrip() now expects arguments
> individually instead as a big tuple so let's fix the one user in OE-Core
> of that function which we forgot to migrate.
>
> Fixes: 7c99f90079e7 ("lib/package/utils: Improve multiprocess_launch argument passing")
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Closes: https://lore.kernel.org/openembedded-core/319bb00c-9712-4aa7-38b0-e1ad2bab840b@crashcourse.ca/
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Not tested. Just read the code and found an issue. Robert, can you give
> this a try maybe?
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 48e394b650..91248467be 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -750,7 +750,7 @@ python do_strip() {
>      if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
>          kernel_image_stripped = kernel_image + ".stripped"
>          shutil.copy2(kernel_image, kernel_image_stripped)
> -        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
> +        oe.package.runstrip(kernel_image_stripped, 8, strip, extra_sections)
>          bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
>              extra_sections)
>  }
>
> ---
> base-commit: aa33c4317dbe3e46e903d5350771413959462b37
> change-id: 20260720-runstrip-not-tuple-arg-97483264ad89
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
Tested-by: Robert P. J. Day <rpjday@crashcourse.ca>


