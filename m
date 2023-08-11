Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F56CC001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 08:46:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.38593.1691743561103012326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 01:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Eb39GEg+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C16BE4000D;
	Fri, 11 Aug 2023 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691743558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zUFWvRlnjdb+Bbxu+OGxlws+RG3o4eK88W+on5n6FzU=;
	b=Eb39GEg+4rmhkROB2RgdhZktua/V5uf38vUD0v5tHuPk9zmNzuDzMxGBeucWHTSnR+y2YY
	Z9ZS0TkrxDa9SfWOCQ45zhyGnB3dluW4uOmIJtzjgTp8v04iD7qzguqKgCyt7Lrbo3DkjZ
	F5vaGkRVdK+48CaGWssSrFET130qJ2Rz6wafnJ1yinJkpP1QETCYQaFiqqZztokM+Qaydz
	+xC0s+p6PvsW8ukTQwOltzwKddw8VrU5OFmi5mWVBweLjkUbJXo2tyXRWKDCkwPQok35gC
	VUt6HzIsG40CmqakPAW54s+9ds+SR6z4qhyG18QPEVyimCBqBiSyASzGmP50uw==
Date: Fri, 11 Aug 2023 10:45:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
Message-ID: <202308110845568593abfe@mail.local>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230810132113aee9ceff@mail.local>
 <20230811080027d7b75a14@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811080027d7b75a14@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 08:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185834

On 11/08/2023 10:00:33+0200, Alexandre Belloni wrote:
> On 10/08/2023 15:21:14+0200, Alexandre Belloni wrote:
> > Hello, this causes oe-selftest failures on the autobuilders:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5589/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5577/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5536/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5613/steps/14/logs/stdio
> > 
> > 2023-08-10 09:44:34,071 - oe-selftest - INFO - bblock.BBLock.test_lock_architecture_specific (subunit.RemotedTestCase)
> > 2023-08-10 09:44:34,072 - oe-selftest - INFO -  ... FAIL
> > Stderr:
> > 2023-08-10 09:40:23,454 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2290072/conf/local.conf
> > 2023-08-10 09:40:23,455 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> > 2023-08-10 09:44:34,072 - oe-selftest - INFO - 3: 1/34 29/533 (250.62s) (0 failed) (bblock.BBLock.test_lock_architecture_specific)
> > 2023-08-10 09:44:34,072 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/bblock.py", line 103, in test_lock_architecture_specific
> >     self.assertNotIn(info_message, result.output)
> >   File "/usr/lib64/python3.9/unittest/case.py", line 1111, in assertNotIn
> >     self.fail(self._formatMessage(msg, standardMsg))
> >   File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
> >     raise self.failureException(msg)
> > AssertionError: 'NOTE: The following recipes have locked tasks: quilt' unexpectedly found in 'NOTE: Reconnecting to bitbake server...
> > 
> 
> Hum, wait, I got this without the patch series. Let me investigate.

Actually, I still had the series :)

> 
> > 
> > 
> > On 02/08/2023 16:24:27+0200, Julien Stephan wrote:
> > > Hi all,
> > > 
> > > This is v4 for bblock script.
> > > 
> > > Improvement from v3:
> > > * Add self test
> > > * Add a new "info" level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK: this allows to
> > >   display a Note when recipe contains locked task(s)
> > > 
> > > Limitations:
> > > * Silently does nothing if given task doesn't exist
> > > * Silently does nothing when resetting a recipe that doesn't exist
> > > 
> > > Improvement from v2:
> > > * Add a function in bb.cooker to compute task signatures
> > > * Replace the findSigInfo function by the new created one. This has the
> > >   following advantages:
> > >     * findSigInfo needs the task to be already built to get the siginfo
> > >       file, meaning we cannot lock a recipe on a fresh build
> > >     * we can now generate the signatures for all available task of a given
> > >       recipe
> > > * Check if a given task is already locked. If so, don't duplicate
> > >   entry in bblock.conf
> > > 
> > > Limitations:
> > > * Needs to taint tasks that are locked, to display a warning
> > > * I may be still missing some checks on user input
> > > * Silently does nothing if given task doesn't exist
> > > * Silently does nothing when resetting a recipe that doesn't exist
> > > 
> > > I did some tests using qemux86-64 and qemuarm but I may be missing some
> > > corner cases.
> > > 
> > > Improvement from V1:
> > > * Signatures are now package architecture specific meaning that if you
> > >   switch MACHINE, the lock sig will not be taken into account
> > > * I added the -r option to unlock recipes
> > > * I added a -d option to display the current bblock.conf
> > > * Added an include directive for conf/bblock.conf inside bitbake.conf
> > > * Added -t option to specify the tasks to lock/unlock
> > > 
> > > Limitations:
> > > * I may be still missing some checks on user input
> > > * I need to find a way to get the list of tasks ( by default still lock
> > >   only the do_compile for now, unless -t is specified)
> > > * Do not check if a particular recipe/task is already locked when trying
> > >   to add lock. So entries may appear multiple times
> > > * We still need the signature of the tasks to be already computed before
> > >   locking. Need to find a way to generate it if missing
> > > 
> > > V3: https://lists.openembedded.org/g/openembedded-core/message/184932
> > > V2: https://lists.openembedded.org/g/openembedded-core/message/184697
> > > V1: https://lists.openembedded.org/g/openembedded-core/message/184584
> > > 
> > > My branch is available here [1]
> > > 
> > > Cheers
> > > Julien
> > > 
> > > [1]: https://git.yoctoproject.org/poky-contrib/commit/?h=jstephan/bblock
> > > Julien Stephan (5):
> > >   bitbake.conf: include bblock.conf
> > >   bitbake: cooker: add a new function to retrieve task signatures
> > >   sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
> > >   scripts/bblock: add a script to lock/unlock recipes
> > >   oeqa/selftest/bblock: add self test for bblock tool
> > > 
> > >  bitbake/lib/bb/command.py              |   6 +
> > >  bitbake/lib/bb/cooker.py               |  16 +++
> > >  bitbake/lib/bb/event.py                |   8 ++
> > >  meta/conf/bitbake.conf                 |   1 +
> > >  meta/lib/oe/sstatesig.py               |  13 +-
> > >  meta/lib/oeqa/selftest/cases/bblock.py | 146 ++++++++++++++++++++
> > >  scripts/bblock                         | 182 +++++++++++++++++++++++++
> > >  7 files changed, 371 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/lib/oeqa/selftest/cases/bblock.py
> > >  create mode 100755 scripts/bblock
> > > 
> > > --
> > > 2.41.0
> > 
> > > 
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#185403): https://lists.openembedded.org/g/openembedded-core/message/185403
> > > Mute This Topic: https://lists.openembedded.org/mt/100506390/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > 
> > 
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

