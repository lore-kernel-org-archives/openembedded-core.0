Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71717C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:13:02 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.5894.1659445972997267897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H/QU4K32;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C0697100002;
	Tue,  2 Aug 2022 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659445970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WultvtDlGI7mrnm0OUEfIosS7+Ij3PvaDn0x8EY6Ee0=;
	b=H/QU4K32+SvynFS7TPqy3Rh9ZQ0HlQfyhHf/1+6CVivfUSRyvY0x+pYPEG2f/7i2GjYjc3
	bj6HFCKlrJZ+r9gvs8GrY6Gnfg9PqHHdD0opw4mFr4hSMJdyof65/qpYHDzT08zMx2CyQa
	7WUUzUovlM4scKFgHnGt5ncpZm7b2skDne6xuQG/rFdnvlMv1VJXzAmRVqq6Z1BM0uHR5B
	dInuJUnWSQn+iALQ7T/USfAHKCA9MrW+W2/XVVvImbUa156+HMaSMeiFdapwY2EVBeqz82
	aHmo/XsCEwHHuYrmgE2ta1Ov8E3ctVNwnVjQJ/xbGfegv1G7RVDuH5WIn4Z6tA==
Date: Tue, 2 Aug 2022 15:12:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 5/6] scripts/oe-setup-layers: add a script
 that restores the layer configuration from a json file
Message-ID: <20220802151248.3183f672@booty>
In-Reply-To: <20220729141049.835733-5-alex@linutronix.de>
References: <20220729141049.835733-1-alex@linutronix.de>
	<20220729141049.835733-5-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 13:13:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168780

Hi Alex,

On Fri, 29 Jul 2022 16:10:48 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> This script can be used directly from poky, or can be copied directly into a
> layer or any other repository - it is self-suffucient and requires only python3
> and git on the host where it will run. It is also copied by the bitbake-layers
> layers-setup plugin together with the json, unless requested otherwise.
> 
> 1. How to restore the layers from the saved configuration:
> 
> a) Clone the bootstrap layer or some other repository to obtain the json config and the setup script that can use it.
> (use 'bitbake-layers create-layer-setup' from the previous commit to create them)
> 
> b) Running with default options:
> (note: this will work to update an existing checkout as well)
> 
> alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
> Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
> 
> Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
> Running 'git init -q /srv/work/alex/my-build/meta-intel'
> Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
> Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
> Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel
> 
> Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
> Running 'git init -q /srv/work/alex/my-build/poky'
> Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
> Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
> Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
> Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
> Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky
> 
> Available build configurations:
> /srv/work/alex/my-build/meta-alex/conf/templates/configuration-gadget
> /srv/work/alex/my-build/meta-alex/conf/templates/configuration-gizmo
> /srv/work/alex/my-build/poky/meta-poky/conf
> 
> You can set up a build with:
> TEMPLATECONF=one/of/the/above . /srv/work/alex/my-build/poky/oe-init-build-env
> 
> 2. Command line options:
> 
> alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers -h
> usage: setup-layers [-h] [--force-bootstraplayer-checkout] [--destdir DESTDIR] [--jsondata JSONDATA]
> 
> A self contained python script that fetches all the needed layers and sets them to correct revisions
> 
> optional arguments:
>   -h, --help            show this help message and exit
>   --force-bootstraplayer-checkout
>                         Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).
>   --destdir DESTDIR     Where to check out the layers (default is /srv/work/alex/my-build).
>   --jsondata JSONDATA   File containing the layer data in json format (default is /srv/work/alex/my-build/meta-alex/setup-layers.json).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

This patch triggers an AB error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3916/steps/15/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

