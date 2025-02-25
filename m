Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB4C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 16:03:33 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.11900.1740499409676374380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 08:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=G0InkU4J;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29D3710382D2E;
	Tue, 25 Feb 2025 17:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740499407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYQhVwjYJhfBxaQ0bB/0AEE35t/yf9t2cIuZ3U7cmsU=;
	b=G0InkU4JGgN3A741ti332I5lK2/P1MfDScZOABQVe/Z/jy9TNqG7n8GhTfwKbPzjL1CxDF
	Z4JP0OCHzYN8BFJIMzZazRicS1SYDdiVEvJ+ODtOJsEHg58/2VhC6vomkJ8ySOU3y2Gpab
	xk6zkqGH/PWyuVUVUg1Zwxx9TwNYHa6rXs9BzZiHlojWV88lLMkwRMB+lJH4Ms07VJ5WSk
	NPhy7PbmJWK/VI17gKukzsHyu2+LweG/jSZW0MfCJwej4hsSYlmbyEdqqCSY9z5eLqlWlJ
	1O41mcg95JIb+57IXILE3doTxlNYpi3GSWulpWBH+1kdXKME2Sam6TD3+Tv+fQ==
Message-ID: <006a4ab5-ea6c-44f6-84cb-ebb729610f02@denx.de>
Date: Tue, 25 Feb 2025 17:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH] u-boot: kernel-fitimage: Restore
 FIT_SIGN_INDIVIDUAL="1" behavior
To: Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org, Steve Sakoman <steve@sakoman.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Jose Quaresma <jose.quaresma@foundries.io>
References: <20250225154902.98249-2-jose.quaresma@foundries.io>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250225154902.98249-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211916

On 2/25/25 4:49 PM, Jose Quaresma wrote:
> From: Marek Vasut <marex@denx.de>
> 
> OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
> where the resulting signed fitImage contains both signed
> images and signed configurations, possibly using different
> keys. This kind of signing of images is redundant, but so is
> the behavior of FIT_SIGN_INDIVIDUAL="1" and that is here to
> stay.
> 
> Adjust the process of public key insertion into u-boot.dtb
> such that if FIT_SIGN_INDIVIDUAL==1, the image signing key
> is inserted into u-boot.dtb first, and in any case the
> configuration signing key is inserted into u-boot.dtb last.
> 
> The verification of the keys inserted into u-boot.dtb against
> unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=1 due to
> mkimage limitation, which does not allow mkimage -f auto-conf
> to update the generated unused.itb, and instead rewrites it.
> 
> Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 0106e5efab99c8016836a2ab71e2327ce58a9a9d)
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Shouldn't Steve Sakoman be on CC ? (now added on To)

