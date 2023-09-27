Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AAAE810BC
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:16:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.14192.1695809777612482504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i/q9grW9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB6C46000D;
	Wed, 27 Sep 2023 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695809775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4pri5nI3etDEH+9kE9vN37gEyL5jO0YWQF1j4ha2hzM=;
	b=i/q9grW9h9YX/HCrnsQt/J26UOJy9oVuuPin42xhaLOkf5iSs8jzJHo8AHgg4O4GQQQlgb
	/xqojNL+NgaBseZG5VG2R5HPiimmlhr8v1v20EfJJZgu+r4eWaOddO3VGWFsiLZ6FHU21Y
	b1lvG+k5xogxcQLrLC46k4bABSKLYai15qIEMyLTTHUMiGIWg3Ce/Pht6iYMVdwZLbfL7q
	cbfNrQZ5luRY/8XBRFu/l4flnfckQppOXrk4HhZHD7e0a0+AL4Z+BsRRmb6IONGhCkMznq
	KiNBYUBYe8jjPVbXzQwzCdEA4bVSNwXuYq+7Zv6BuQ0AgYwQ6rN/HzW1NJdovg==
Date: Wed, 27 Sep 2023 12:16:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
Message-ID: <20230927101614dd0d974d@mail.local>
References: <20230925080452.803540-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925080452.803540-1-jstephan@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 10:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188297

Hello,

I had a build were all the tests passed, then I had this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/steps/14/logs/stdio

On 25/09/2023 10:04:47+0200, Julien Stephan wrote:
> Hi all,
> 
> This is v5 for bblock script.
> 
> Improvement from v4:
> * Fix self test error reported by autobuilder
> * Allow to specify task with/without the "do_" prefix:
>   example: bblock bc -t compile,do_install
> * Fix test_lock_single_recipe_all_tasks
> * Fix getTaskSignatures: now retrieve all tasks and filter out the
> * setscene and nostamps ones
> 
> Limitations:
> * Silently does nothing if given task doesn't exist
> * Silently does nothing when resetting a recipe that doesn't exist
> 
> Improvement from v3:
> * Add self test
> * Add a new "info" level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK: this allows to
>   display a Note when recipe contains locked task(s)
> 
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
> V3: https://lists.openembedded.org/g/openembedded-core/message/184932
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
> Julien Stephan (5):
>   bitbake.conf: include bblock.conf
>   bitbake: cooker: add a new function to retrieve task signatures
>   sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
>   scripts/bblock: add a script to lock/unlock recipes
>   oeqa/selftest/bblock: add self test for bblock tool
> 
>  bitbake/lib/bb/command.py              |   6 +
>  bitbake/lib/bb/cooker.py               |  31 ++++
>  bitbake/lib/bb/event.py                |   8 +
>  meta/conf/bitbake.conf                 |   1 +
>  meta/lib/oe/sstatesig.py               |  18 ++-
>  meta/lib/oeqa/selftest/cases/bblock.py | 201 +++++++++++++++++++++++++
>  scripts/bblock                         | 184 ++++++++++++++++++++++
>  7 files changed, 448 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/bblock.py
>  create mode 100755 scripts/bblock
> 
> --
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188174): https://lists.openembedded.org/g/openembedded-core/message/188174
> Mute This Topic: https://lists.openembedded.org/mt/101570279/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

