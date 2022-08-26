Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC92DECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 15:25:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.38585.1661527511381491389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 08:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RgwmFKpl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9A239E0008;
	Fri, 26 Aug 2022 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661527509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Q+byflHSB5iCFguse73ZOrxbFofO+MhSJw02xMQlb0=;
	b=RgwmFKplCByW4g/HTgm0BiA/oPVJKWafARcSNQmXTHAPu3hPuIhYvLL+p1EOcOgGoC4QpA
	e7yVsYxIbIBz1HnrWUx6UWWe5o/uA7XEjcLxiz/QdeT91UWgKR1uoqIvC8FFgLArQtFSz3
	KseL1lDFWPiSE6QhCVpkq2F8lcuokGBMZzVvCP22Cm7NDfjHEolteoY4dzp+Qhh491RVj2
	fk4Ljhe0RaI+xTwpMte0IQZswlRNPXX05An0x8nDoFKebq8q48MYNDUUUPOD16JhIYg7XG
	SNgzoW7OVHD2bLMTo52OUp/rnMPdSvzV4cQmfA6L5KtXuqKF+XZhVabm9twr/Q==
Date: Fri, 26 Aug 2022 17:25:07 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
Message-ID: <20220826172507.4e75a7de@booty>
In-Reply-To: <20220825203451.2074080-1-alex@linutronix.de>
References: <20220825203451.2074080-1-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 15:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169922

Hi Alex,

On Thu, 25 Aug 2022 22:34:47 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> This is the reverse of setting up a build by pointing TEMPLATECONF to a directory
> with a template and running '. oe-init-build-env': this takes the config files from build/conf,
> replaces site-specific paths in bblayers.conf with ##OECORE##-relative paths, and copies
> the config files into a specified layer under a specified template name.
> 
> In many or perhaps most cases such static prefabricated configurations (that require no
> further editing) are just enough, and I believe they should be offered by the
> official configuration management. On the other hand, generating build configurations with a
> sufficiently versatile tool is a far more complex problem, and one we should try to tackle
> once we see where and how static configs fall short.
> 
> Tooling to discover and select these templates when setting up a build will be provided later on.
> 
> How to use:
> 
> alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers save-build-conf ../../meta-alex/ test-1
> NOTE: Starting bitbake server...
> NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
> Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
> You can try out the configuration with
> TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
> alex@Zen2:/srv/work/alex/poky/build-layersetup$
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Testing with this series produced some failures:

  error: pathspec 'yocto-4.0' did not match any file(s) known to git

Looks like is is adding the poky-contrib remote but not poky itself.

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3996/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4010/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4064/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4052/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/26/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

