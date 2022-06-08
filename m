Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6447FC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 15:06:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.7573.1654700790089479967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 08:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E+lrBeXS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A046C20013;
	Wed,  8 Jun 2022 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654700788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqDP2aF75tH0mPHg+SYXSqQIjWO9KB3T0xFEHuBx5hg=;
	b=E+lrBeXSKN+kk6Fbf0Q1BZmjGuAR6nAbltAmKVV6dIW44UnaoJDLa3YSkjrdhKzVmdDxE0
	h/oU7ec+mMYW1vzEjnXzlz0I/IQm2OCjBszkQdxH4kpPvPF8w+0VOVkg7kZmGPRFVrcl3v
	rl20yiOcnGUu5j09Bn/7JnspiHHJIHlay06nD4WJy2bsT5wOEB9uR7+ZWc+E52VX0p7Wo0
	ur9B/LZQTLPdX8blvei873LhfNZysOwKKkW+q5ZZ4gZF7VNHIztqkRZQL210dn0Zu1Wtwh
	eygD5agPR3k4tpzVFRZd3cpTPGnIyZzN/d5WlpHeeUHiYkkjpqttODeCI7HqRQ==
Date: Wed, 8 Jun 2022 17:06:26 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Paulo Neves" <ptsneves@gmail.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Message-ID: <20220608170626.4d97c4b7@booty>
In-Reply-To: <16F6A653C457F871.26104@lists.openembedded.org>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
	<20220607151123.3588947-1-ptsneves@gmail.com>
	<20220607151123.3588947-4-ptsneves@gmail.com>
	<16F6A653C457F871.26104@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 15:06:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166752

Hi Paulo,

On Wed, 8 Jun 2022 14:53:05 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hi Paulo,
> 
> On Tue,  7 Jun 2022 17:11:22 +0200
> "Paulo Neves" <ptsneves@gmail.com> wrote:
> 
> > Make sure we do not stage any executable with a bigger shebang
> > than 128. Fixes [1]
> > 
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
> > 
> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>  
> 
> This check seems to be working very well!! It triggered a huge amount
> of build failures on the autobuilders due to libcheck having a shebang
> too long in the checkmk script, e.g.:
> 
> #! /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/x86_64-linux/libcheck-native/0.15.2-r0/recipe-sysroot-native/usr/bin/gawk -f
> 
> Here are a few logs:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/14/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/12/logs/errors
> 
> It would be great if you could add another patch to your series to fix
> libcheck, and also to do 'bitbake world' to test as many packages as
> possible before discovering from the autobuilders.

Here are more failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/12/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5340/steps/12/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5340/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/13/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/13/logs/stdio

This time the error is:

stdio: ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain <...> is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .

I'm not sure exactly how your code triggers such error, but it appeared
when testing on the autobuilders with this patch series and disappeared
when I removed only these 5 patches, thus it seems related.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

