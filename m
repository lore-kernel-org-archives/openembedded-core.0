Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA16C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 17:13:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1070.1690823598581319756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 10:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YOxKtfmv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 482A11C0006;
	Mon, 31 Jul 2023 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690823596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BNQaxkCGEAu6uN5uo5XZKSuk+mE4KWmpaSKUDUqpvQ=;
	b=YOxKtfmvTMndYuZsNYaubvqoRKuKRLaTzQLaR0yv7pawdJZbn/hYoTO3hyeyzQXC+8spfR
	kkuQRboR2dUg0kKxk+PxS0+ETTZDQHFIJ05PLe6xZpB9kVJ6EIRmEnj2pUStMRSqZ35BN2
	yt1cyE4Pn2QNiv5+VnKYjQuniOPtSMs2BuI4Ye1Bo2Mw56eutSbWjYIxoBxYruCHinaLqZ
	dx9RYJm9aSzi3EyvTZb1tHg3qsf8QQPAKrrVbGtVueCSpDpsahYjqqDreY+MD/izIpaRiz
	zKVvdFbuhY6yf+hy3QKjQ4p5zXw51SisKr1VTTaPBcQU5+3RgghkdKuy7yKoug==
Date: Mon, 31 Jul 2023 19:13:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
Message-ID: <202307311713165bd45fd1@mail.local>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com>
 <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 17:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185151

On 31/07/2023 17:56:05+0100, Luca Bocassi wrote:
> On Mon, 31 Jul 2023 at 17:40, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > This causes the following failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5570/steps/14/logs/stdio
> >
> > 2023-07-30 21:25:44,944 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 297, in test_all_required_variables_set
> >     self.assertTrue(line, msg=res.output)
> >   File "/usr/lib/python3.10/unittest/case.py", line 687, in assertTrue
> >     raise self.failureException(msg)
> > AssertionError: None is not true : NOTE: Reconnecting to bitbake server...
> > Loading cache...done.
> > Loaded 0 entries from dependency cache.
> > Parsing recipes...done.
> > Parsing of 954 .bb files complete (0 cached, 954 parsed). 1878 targets, 53 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'pam-plugin-umask' (but /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd_254.bb RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'pam-plugin-umask' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['pam-plugin-umask']
> > NOTE: Runtime target 'udev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['udev', 'pam-plugin-umask']
> > NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > ERROR: Required build target 'core-image-minimal' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['core-image-minimal', 'packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> >
> > It repeats for other runtime tests.
> 
> I added that on Alex's request. So it's either that failure, or the
> ignorable log message? I'll send a v5 without the recommends then.

In any case, you are going to have to fix the tests

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185149): https://lists.openembedded.org/g/openembedded-core/message/185149
> Mute This Topic: https://lists.openembedded.org/mt/100459438/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

