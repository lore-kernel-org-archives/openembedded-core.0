Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D29ECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 07:01:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.46802.1661583653753231552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 00:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MI113rN4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF2A84000B;
	Sat, 27 Aug 2022 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661583651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QNhcO93ZnGhlYLGFt2LS/VpyvY9DS+e0M555N4bcPUY=;
	b=MI113rN4HnKbLFmNCLIPUBVbv61RLuNyiuiJnafGzPfN8asc4or8Msy4TYdHBFuvS0AuVQ
	JRUeuRZXHMlGCXPd5Y8kH6CwpcFtWllgglpEQR8NF26CeoM4Evq6d7HRlWQxRvpKzOWjid
	EKQ7cKHctCCO7NYWn8xmQlC/w9N6NrypiGtQPKtnwa9W33xPl+qs+JhOtWIVFtQs+wABLc
	TQDX1lZwun4Zr7xbt98Z6v3giw/tBj3fE1KUDDB6EJaotLjSpxJ9aQ1g0kL99Rs7ovz7Aj
	0wD4dhYU+v1elJpJRVDmUANOUTy3uFbH27gcd61dHI4q3koQ4NG1lRt3bJTJRA==
Date: Sat, 27 Aug 2022 09:00:49 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check
 that TEMPLATECONF is valid
Message-ID: <20220827090049.1d19b479@booty>
In-Reply-To: <20220824124234.3549247-2-alex@linutronix.de>
References: <20220824124234.3549247-1-alex@linutronix.de>
	<20220824124234.3549247-2-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 07:01:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169927

Hi Alex,

On Wed, 24 Aug 2022 14:42:34 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> specifically that ../../layer.conf exists, and that second-from-last
> component in the path is 'templates'.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 975619789a..db26e3b138 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
>              echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
>              exit 1
>          fi
> +        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
> +        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
> +            echo >&2 "Error: TEMPLATECONF value must point to meta-some-layer/conf/templates/template-name"
> +            exit 1
> +        fi

This is making the AB fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4140/steps/7/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

