Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C86EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 20:16:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.245.1687292168459053043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 13:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fPLxZKi1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687292166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nNnxTguw81PR1w1taPxHB3wC0e4xVuVWJJUgxOPSV1U=;
	b=fPLxZKi1jEHbQuf4ZL5rTeqg0aAMG8GgCQ9k8EYlNKFR+CsGp2PgKAAgnqWW2i77tJlNh0
	+wUfgMEWVF6p3/hJ3KcX6rwOevigiPMg91D1FSjO78ng5sK4uT29XyAJw+aenir7ofkNsp
	u8eFCph+Vp6vxUj7X434W3+Ry/h5gLozwobDhjpGMSzwC9v0SqiZMsk8ebtSvmNy4wciGG
	2tTkzm3ADhRHC2pg/LH56yEzkROLI0itWKrtjOcy/+yxnV4Kwtr7tbPREhuwUxmkf2H9di
	ZnVwRtzMOp9aX9LWcS6Qq7TMx3f6dKk2UYTCi105/+LDe0eZ37RTG23SYvZACA==
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF9F5240003;
	Tue, 20 Jun 2023 20:16:05 +0000 (UTC)
Date: Tue, 20 Jun 2023 22:16:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] insane: Improve patch-status layer
 filtering
Message-ID: <20230620221604.751c44f4@booty>
In-Reply-To: <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
References: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
	<20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 20:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183155

Hi Richard,

On Mon, 19 Jun 2023 15:06:02 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> Now that we have layer overrides, we can easily enable patch-status in
> ERROR_QA without the hardcoded code making it easier for other layers
> to opt into the checks.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I love the cleanup this patch introduces, however I'm afraid it seems
to be causing some failures on selftest:

AssertionError: Command 'bitbake  dos2unix -c patch' returned non-zero exit status 1:
...
ERROR: dos2unix-7.5.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5367/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5402/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5325/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5375/steps/15/logs/stdio

Luca

PS: I noticed you seems to already have a fix under test on
origin/master-next!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

