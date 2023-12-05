Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2E1C10F04
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 11:35:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.97344.1701776125566691507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 03:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c3d5TJNL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80444C0005;
	Tue,  5 Dec 2023 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701776123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sibwVgg+6SgNqSMbPYaeA3XNpJtj+MD2X6BNKNTJfTE=;
	b=c3d5TJNL2OjVwyrEDj4tuWSXdwhJXaWc5UhM8YQR9nJUKy3AU/9rO6f8l8vzJW+/FeeFCg
	zUM8mss+LvruRmtmFZzG73kGzseZ/FKRQLtlNvZAwZNalbQADgSnqLeime7cgdweA6uOy1
	3JdCyBFsaNNfQ/+6i5ER2IF1NbQXvA4fuMifif6RgHLEs0KPUyYRvbZYgEA43iXNwNky5Z
	pBlEwwzOwzCv66eHPgdZDdI8dnNJ/F4mlbf9NcEtybhnyjbo+1tURNqWUbOI0OK7Jgi1tE
	2oxkU2LnjmxXqmx8Q4t094NJowpFn9K9OgH6P3az6/2d78nMK2l4wccKs5wRqg==
Date: Tue, 5 Dec 2023 12:35:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
Message-ID: <2023120511352263f2aca6@mail.local>
References: <20231205014155.3991250-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205014155.3991250-1-changqing.li@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 11:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191815

This causes:

stdio: WARNING: libxcrypt-4.4.36-r0 do_package: libxcrypt: alternative target (/usr/bin/crypt_r.3 or /usr/bin/crypt_r.3.libxcrypt) does not exist, skipping...
stdio: WARNING: libxcrypt-4.4.36-r0 do_package: libxcrypt: NOT adding alternative provide /usr/bin/crypt_r.3: /usr/bin/crypt_r.3.libxcrypt does not exist
stdio: WARNING: libxcrypt-4.4.36-r0 do_package: libxcrypt: alt_link == alt_target: /usr/bin/crypt_r.3 == /usr/bin/crypt_r.3

On 05/12/2023 09:41:55+0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> To fix:
> 
> Error: Transaction test error:
>   file /usr/share/man/man3/crypt.3 from install of
>   libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
>   man-pages-6.04-r0.x86_64
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/libxcrypt/libxcrypt.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
> index ba93d91aef..fe90ef4762 100644
> --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
>                      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
>                      "
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig update-alternatives
>  
>  SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
>  SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
> @@ -26,4 +26,9 @@ CPPFLAGS:append:class-nativesdk = " -Wno-error"
>  API = "--disable-obsolete-api"
>  EXTRA_OECONF += "${API}"
>  
> +ALTERNATIVE_PRIORITY = "90"
> +ALTERNATIVE:${PN}-doc = "crypt.3 crypt_r.3"
> +ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
> +ALTERNATIVE_LINK_NAME[crypt_r.2] = "${mandir}/man3/crypt_r.3"
> +
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191771): https://lists.openembedded.org/g/openembedded-core/message/191771
> Mute This Topic: https://lists.openembedded.org/mt/102984309/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

