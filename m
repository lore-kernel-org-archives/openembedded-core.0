Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66330C7EE29
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:13:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.15884.1685031205392560917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 09:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A/DNWCuP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685031203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcPux0vM8s89RlAqS3ZhEsIuIpODL3lFFkJvO1owzEs=;
	b=A/DNWCuPeNXe0ymQQaQa2ElJwBN1HNDyYcQ4cPy80+1GL1eD3XewGyV7zEjD9Jqv/v5zLW
	Rib5lLMJgreSgbsjX1E51XOV/D6m4XdOphd7phTcOVKqEs0cQvLUXxKTH5kQ0LUHVbA+D7
	g8cgyOi9BzMXjOl7p/TKjfOzvbD7uJ5q9HyhiQtlSlMQHoLK2D7uO9A9y/ZkgKDqFd9xXG
	Nq29xh6LAmcSJy4bMi3aoHzT3qmLQuW2f6r5+aWRA0rO0v1sdbCT3vyupE7wsO20fDKgws
	5D6/m5TQnCBR7MvYM1pcw5VVJPHZg/vqoXXaSMKQCPmbcVX41UmD2wgBmjLLFQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E605FC0002;
	Thu, 25 May 2023 16:13:22 +0000 (UTC)
Date: Thu, 25 May 2023 18:13:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: andrej.valek@siemens.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] busybox: 1.36.0 -> 1.36.1
Message-ID: <20230525161322adee6d2f@mail.local>
References: <20230525084328.77920-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525084328.77920-1-andrej.valek@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181720

Hello,

On the autobuilders, this causes:

WARNING: busybox-1.36.1-r0 do_package_qa: QA Issue: busybox: ELF binary /bin/busybox.nosuid has relocations in .text [textrel]

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7460/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6057/steps/11/logs/stdio


On 25/05/2023 10:43:28+0200, Andrej Valek via lists.openembedded.org wrote:
> - regresion has been fixed, re-enable SHA*HWACCEL on x86
>   - 8d198665a0d09c3f22f3a12234809f46b1c2b04a
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../{busybox-inittab_1.36.0.bb => busybox-inittab_1.36.1.bb}  | 0
>  meta/recipes-core/busybox/busybox/sha_accel.cfg               | 2 --
>  .../busybox/{busybox_1.36.0.bb => busybox_1.36.1.bb}          | 4 +---
>  3 files changed, 1 insertion(+), 5 deletions(-)
>  rename meta/recipes-core/busybox/{busybox-inittab_1.36.0.bb => busybox-inittab_1.36.1.bb} (100%)
>  delete mode 100644 meta/recipes-core/busybox/busybox/sha_accel.cfg
>  rename meta/recipes-core/busybox/{busybox_1.36.0.bb => busybox_1.36.1.bb} (91%)
> 
> diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
> rename to meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
> diff --git a/meta/recipes-core/busybox/busybox/sha_accel.cfg b/meta/recipes-core/busybox/busybox/sha_accel.cfg
> deleted file mode 100644
> index 8900305a11..0000000000
> --- a/meta/recipes-core/busybox/busybox/sha_accel.cfg
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# CONFIG_SHA256_HWACCEL is not set
> -# CONFIG_SHA1_HWACCEL is not set
> diff --git a/meta/recipes-core/busybox/busybox_1.36.0.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
> similarity index 91%
> rename from meta/recipes-core/busybox/busybox_1.36.0.bb
> rename to meta/recipes-core/busybox/busybox_1.36.1.bb
> index 8014a5c7bf..b34d60cded 100644
> --- a/meta/recipes-core/busybox/busybox_1.36.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> @@ -51,6 +51,4 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
>             "
>  SRC_URI:append:libc-musl = " file://musl.cfg "
> -# TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
> -SRC_URI:append:x86 = " file://sha_accel.cfg"
> -SRC_URI[tarball.sha256sum] = "542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
> +SRC_URI[tarball.sha256sum] = "b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314"
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181704): https://lists.openembedded.org/g/openembedded-core/message/181704
> Mute This Topic: https://lists.openembedded.org/mt/99126049/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

