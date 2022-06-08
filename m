Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21D8C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:53:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.5916.1654692790726055457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YcdYPMT7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E7E140004;
	Wed,  8 Jun 2022 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654692788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YK9VeNj8lc1bpNE9m9i/SC6/VLFf0e2SZG3qG+0ZBCk=;
	b=YcdYPMT7JK6wv0ouU6XFGL1SUZ/KGdIS3IDRi8oNOi5cPkLzn1PUBWiEwtv8EWiY5a+qoU
	A6bfq7xJAO0FrmicFuoLzHs/qqjgTFH5n6tnPGtgANZ023+gaNa0VMRSIQeY1rZShJfIGQ
	6iZ5WFrHE/W21l9KN4sl0UHFOMLho0ASLjh4WHl+uEjG1ToTr7z778o16o5LvpyAc1rVfs
	WZOY831OWBYhVajhe3yJZ07t/s2s9LmvrDnhIWCgIfQjvJxFkxBZE4LG9K3HOr4OMgETj7
	Ri903aOFxjDvFr+9OYYrDr0f9sxZQf7y+dWf0JrozvPMFzx6fC5p+axWtPe9bQ==
Date: Wed, 8 Jun 2022 14:53:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Paulo Neves" <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Message-ID: <20220608145305.4be602f2@booty>
In-Reply-To: <20220607151123.3588947-4-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
	<20220607151123.3588947-1-ptsneves@gmail.com>
	<20220607151123.3588947-4-ptsneves@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 12:53:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166706

Hi Paulo,

On Tue,  7 Jun 2022 17:11:22 +0200
"Paulo Neves" <ptsneves@gmail.com> wrote:

> Make sure we do not stage any executable with a bigger shebang
> than 128. Fixes [1]
> 
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
> 
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>

This check seems to be working very well!! It triggered a huge amount
of build failures on the autobuilders due to libcheck having a shebang
too long in the checkmk script, e.g.:

#! /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/x86_64-linux/libcheck-native/0.15.2-r0/recipe-sysroot-native/usr/bin/gawk -f

Here are a few logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/14/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/12/logs/errors

It would be great if you could add another patch to your series to fix
libcheck, and also to do 'bitbake world' to test as many packages as
possible before discovering from the autobuilders.

Thank you!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

