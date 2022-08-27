Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CBDECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 19:32:24 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.52109.1661628734093826422
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ntg/ZL/9;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E156200007;
	Sat, 27 Aug 2022 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661628732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFNTKsPaTNBI45nEJJtfB3Ae19LyIdujHC8GrxChqC8=;
	b=Ntg/ZL/9oXSO39O8+CFgttNn7RwLjps2GpsPeReHXavZOT/KgwP7DNpo+pXF1Tkj0zAqEs
	VKfZDk8fYmZr4oNqcz1eCY/zaMzU/AoBMWTa4lNf6ydyXuYNmev6o6IT9e2gSB4WLo7b3c
	lDHu+qBtIPzXpdux3IeXT96ix9F0JIAjnYGbeGQskQcSKea4sAJZEZ5Le/1OCH2lmKo0S1
	Mlaoz3e+7ocCYxIIo4n9/5J9117psZB5Fwz3s+JnHi/hAOmOIhe4bzkRjjQKwoA1Ztdi3W
	p/V5B188W/E/6mvs67efBkUlezuhMyEK4I6+HtahT48mASxqIVf0ab6+wm43nA==
Date: Sat, 27 Aug 2022 21:32:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Alexander Kanavin" <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>, Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH 1/5] bitbake-layers: add a command to save the
 active build configuration as a template into a layer
Message-ID: <20220827213209.02c7bba4@booty>
In-Reply-To: <170EEE7825BF9D73.11791@lists.openembedded.org>
References: <20220825203451.2074080-1-alex@linutronix.de>
	<170EEE7825BF9D73.11791@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 19:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169971

Hi Alex,

On Fri, 26 Aug 2022 17:25:07 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hi Alex,
> 
> On Thu, 25 Aug 2022 22:34:47 +0200
> "Alexander Kanavin" <alex.kanavin@gmail.com> wrote:
> 
> > This is the reverse of setting up a build by pointing TEMPLATECONF to a directory
> > with a template and running '. oe-init-build-env': this takes the config files from build/conf,
> > replaces site-specific paths in bblayers.conf with ##OECORE##-relative paths, and copies
> > the config files into a specified layer under a specified template name.
> > 
> > In many or perhaps most cases such static prefabricated configurations (that require no
> > further editing) are just enough, and I believe they should be offered by the
> > official configuration management. On the other hand, generating build configurations with a
> > sufficiently versatile tool is a far more complex problem, and one we should try to tackle
> > once we see where and how static configs fall short.
> > 
> > Tooling to discover and select these templates when setting up a build will be provided later on.
> > 
> > How to use:
> > 
> > alex@Zen2:/srv/work/alex/poky/build-layersetup$ bitbake-layers save-build-conf ../../meta-alex/ test-1
> > NOTE: Starting bitbake server...
> > NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
> > Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
> > You can try out the configuration with
> > TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
> > alex@Zen2:/srv/work/alex/poky/build-layersetup$
> > 
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>  
> 
> Testing with this series produced some failures:
> 
>   error: pathspec 'yocto-4.0' did not match any file(s) known to git
> 
> Looks like is is adding the poky-contrib remote but not poky itself.
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3996/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4010/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4064/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4052/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/26/steps/14/logs/stdio
> 

This series appears to have generated other errors on several qemu
builds:

  ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the extensible SDK:

To me the correlation with your code was not immediately obvious, but
as Ross suggested I removed your patches and the failure disappeared.

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/5114/steps/16/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5737/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5724/steps/16/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5721/steps/16/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

