Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9921C001DC
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 22:44:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.63891.1690670658269791543
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 15:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L8cGBM5r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A331BF203;
	Sat, 29 Jul 2023 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690670656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3np9VtgZTndBiOxcKMhYq4GMOKUqxFrGb73rAlPXcYQ=;
	b=L8cGBM5rKd/YuhNPAACPotdvgov1XFNnAo9eFgMcu7t9zMqOvP8j1REz0x+l/udxF+FXwM
	W4i0Qx7QP3Kde5UprOi3OZdzwknkgOzhTTPJhAPMQqJTLw+quFfkTLy2RxAlMU2k9kggXt
	ksUD/HE/9VtzG9iAhWq7ul3rH/ShfkyFDy0DGbgLA1MB8d01InP02OZdP9I2eU7aQd88rH
	WZ6UioS7HyA7+usJDi/8hW9uyxrORmmnnoHJ21jq93IQwJVRUW8hrGn1p1euNG9QfPbPFi
	0nt3l692yhl0CpXaVHor9wErqulwXCzL1CmolouWehXVnpCNu+fXG1Wg7oKrVw==
Date: Sun, 30 Jul 2023 00:44:10 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 0/3] Add bblock helper scripts
Message-ID: <202307292244101a8e8cea@mail.local>
References: <20230727135612.951926-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727135612.951926-1-jstephan@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 22:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185060

Hello,

On 27/07/2023 15:56:09+0200, Julien Stephan wrote:
> Hi all,
> 
> This is v3 from bblock script.
> 

This doesn't apply cleanly on master, can you rebase?

Thanks!

> Improvement from v2:
> * Add a function in bb.cooker to compute task signatures
> * Replace the findSigInfo function by the new created one. This has the
>   following advantages:
>     * findSigInfo needs the task to be already built to get the siginfo
>       file, meaning we cannot lock a recipe on a fresh build
>     * we can now generate the signatures for all available task of a given
>       recipe
> * Check if a given task is already locked. If so, don't duplicate
>   entry in bblock.conf
> 
> Limitations:
> * Needs to taint tasks that are locked, to display a warning
> * I may be still missing some checks on user input
> * Silently does nothing if given task doesn't exist
> * Silently does nothing when resetting a recipe that doesn't exist
> 
> I did some tests using qemux86-64 and qemuarm but I may be missing some
> corner cases.
> 
> Improvement from V1:
> * Signatures are now package architecture specific meaning that if you
>   switch MACHINE, the lock sig will not be taken into account
> * I added the -r option to unlock recipes
> * I added a -d option to display the current bblock.conf
> * Added an include directive for conf/bblock.conf inside bitbake.conf
> * Added -t option to specify the tasks to lock/unlock
> 
> Limitations:
> * I may be still missing some checks on user input
> * I need to find a way to get the list of tasks ( by default still lock
>   only the do_compile for now, unless -t is specified)
> * Do not check if a particular recipe/task is already locked when trying
>   to add lock. So entries may appear multiple times
> * We still need the signature of the tasks to be already computed before
>   locking. Need to find a way to generate it if missing
> 
> V2: https://lists.openembedded.org/g/openembedded-core/message/184697
> V1: https://lists.openembedded.org/g/openembedded-core/message/184584
> 
> My branch is available here [1]
> 
> Cheers
> Julien
> 
> [1]: https://git.yoctoproject.org/poky-contrib/commit/?h=jstephan/bblock
> 
> Julien Stephan (3):
>   bitbake.conf: include bblock.conf
>   bitbake: cooker: add a new function to retrieve task signatures
>   scripts/bblock: add a script to lock/unlock recipes
> 
>  bitbake/lib/bb/command.py |   6 ++
>  bitbake/lib/bb/cooker.py  |  16 ++++
>  bitbake/lib/bb/event.py   |   8 ++
>  meta/conf/bitbake.conf    |   1 +
>  scripts/bblock            | 182 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 213 insertions(+)
>  create mode 100755 scripts/bblock
> 
> --
> 2.41.0

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184932): https://lists.openembedded.org/g/openembedded-core/message/184932
> Mute This Topic: https://lists.openembedded.org/mt/100390731/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

