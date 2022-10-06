Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931EFC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:37:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3827.1665049073024365378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V0rlSYBG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8EF241C0009;
	Thu,  6 Oct 2022 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665049071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6CceL0LSJy5EviUj/0A6fewBxcuFF0V+0yLnqm09NE=;
	b=V0rlSYBGhfNBC9oIu2nPsJzMxoCpIQ1EAMSHM8/rtLNxOxC2WOvfJHY936r8m+q9FTTBGR
	8OOX2VBHqF01r5+Y8P6DWcZY3wbOrsupjwpvMTKkGkTObIiy0GVrNo3guyu4I5de4aFO5U
	3AEJRhYZNgXvnT/ZOvrGv+1XE9yq7q5qtHlS/Yteww0+M/I0kNzApNEoPXiBh5IOqILqFi
	9xswOpol3DI0/8NqiNFf6ihSZ8DuBMmcliGnTWl6AxsETkTbw9Sz9dXB2SU8TD9Afn8Fpz
	n090lap0nZnQsV6Px5YxyI4MSnunSN4MdiURoA3q+xP474JSbNRse/Jg4JSUVg==
Date: Thu, 6 Oct 2022 11:37:49 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ming Liu" <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3] bluez5: change configuration directory
 mode
Message-ID: <20221006113749.4219c095@booty>
In-Reply-To: <20221005195128.9978-1-liu.ming50@gmail.com>
References: <20221005195128.9978-1-liu.ming50@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171487

Hello Ming Liu,

On Wed,  5 Oct 2022 21:51:28 +0200
"Ming Liu" <liu.ming50@gmail.com> wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> Change configuration directory mode from 0755 to 0555, this fixes a
> following warning when bluetoothd starts:
> | ConfigurationDirectory 'bluetooth' already exists but the mode is different.
> | (File system: 755 ConfigurationDirectoryMode: 555)
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 79d4645ca8..9f5c78b81e 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -82,7 +82,7 @@ do_install:append() {
>  	install -d ${D}${INIT_D_DIR}
>  	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
>  
> -	install -d ${D}${sysconfdir}/bluetooth/
> +	install -m 0555 -d ${D}${sysconfdir}/bluetooth/

This change triggers errors in the do_testsdk task of core-image-sato,
as reported by the autobuilders:

Exception: subprocess.CalledProcessError: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/qemumips64/build/build/tmp/work/qemumips64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/']' returned non-zero exit status 1.

Some logs are:

https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/5911/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5909/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5960/steps/16/logs/stdio

The reason, not visible in those logs, is that the new permissions do
not allow removing files in ${sysconfdir}/bluetooth/.

Your patch looks legitimate after the upstream change [1] so I'm afraid
I don't know which would be the best solution here. Some ideas that
come to mind, least ugly first:

1) chmod -R ugo+w on the entire tree before calling 'rm'
2) revert the upstream patch -- not good for oe-core maintainability

BTW please mention [1] in your commit message should you send a new
patch to handle this issue.

[1]
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=00cfb36e20e3c35db2150e7d0351ad7b8442e2d8

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

