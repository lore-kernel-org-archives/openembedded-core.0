Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8307CECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:44:05 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.35647.1661510642936936147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m/3/WzkZ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 414E7240008;
	Fri, 26 Aug 2022 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661510640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5JWL7WURkTbovvGtbQzp5p382lXEyRjLIhJK/9/6eg=;
	b=m/3/WzkZIM0cpNzJ5HcGKbg1anJsFocSbhqP1w/M++uMgfClMmPUYW/GzOGeYyb2qWbARH
	zD6WvoDwQAKvs5GO54i+WHLU9Up3Z8Zog1L7S7vyts5aoy8QhweS/skhNJlyWKIgxwVgiN
	Hu1jJ4B3EOy/wYRZ2GGbFKQWAD5LVtSKjnt8ytGQ6iL0P8L4L/kvgCuEujAAKUT4izGsqu
	waELcPdsKciL1maYokxc2owe2PZbSVTc+HGlbY2Xz5gutIMZCo6EOCO1+1Xv3tvWJhOVm7
	3ZzrFMtt8u+OxvpW/mGRItwunjxJvXvqRK0Mw/VtZbqhXF0XNbEDVE5hgAJKtQ==
Date: Fri, 26 Aug 2022 12:43:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Neil Horman" <nhorman@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [poky][PATCH] Fix npm to use https rather than http
Message-ID: <20220826124358.4118f92b@booty>
In-Reply-To: <20220825204250.3241214-1-nhorman@gmail.com>
References: <20220825204250.3241214-1-nhorman@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 10:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169910

Hello Neil,

thank you for your patch.

On Thu, 25 Aug 2022 16:42:50 -0400
"Neil Horman" <nhorman@gmail.com> wrote:

> Hit this error while building nlf-native recently:
> {
>   "error": {
>     "summary": "URI malformed",
>     "detail": ""
>   }
> }
> 
> Some poking about led me to discover that:
> 1) The npm.py tool replaces npm:// with http://, not https://
> 2) Some versions of the npm tool don't handle 301 redirects properly,
>    choosing to display the above error instead when using the default
>    nodejs registry
> 
> It would be good to go fix npm to handle the redirect properly, but it
> seems like it would also be good to assume secure http when contacting a
> registry, hence, this patch
> 
> Signed-off-by: Neil Horman <nhorman@gmail.com>
> ---
>  bitbake/lib/bb/fetch2/npm.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bitbake/lib/bb/fetch2/npm.py b/bitbake/lib/bb/fetch2/npm.py

Apparently you prepared this patch within the poky git repository. You
shouldn't do that, poky is an integration layer and should not be used
for bitbake development.

Since you want to patch bitbake, you should:
- clone the bitbake repository
- make your commit there
- send it to the bitbake mailing list.

Look at the README.md in the poky root directory for more info.

Thanks!

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

