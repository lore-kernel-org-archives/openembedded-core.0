Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD08FE7106B
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:11:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.16700.1695301895100380344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IefYCJ6u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B21064000F;
	Thu, 21 Sep 2023 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695301893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0SRBGEwZGGR0OHDoMQBuDJIHqLwqdonjDnNrSlOvYkw=;
	b=IefYCJ6uvCBc14U75lc0+z114ZiseRywy3/y75wiqiRTpfQyLbXoWbwPXUi/RhslfB5Xno
	0OUm4oA/qYqQzacW1shShafna4yB+/N0mB1Xh0mwD3gX0beGw85DQc5YYf0hRG1BOOGWVT
	yIwXgpIxCbrJW2oidr4mcAsuR/dF5rc2NS8PtbYYe3ONbTNunNR8258g7u/IVhF6iBNIkl
	trWNlD6C8LhM1nRUqXAYNgBwsMst8scDhj+0HZccFB0shQKP+w+4Mu8bs8yfJOBdZlma0E
	ZMc8RqOYWztfgRnQvbB1kEFT73hB8KgVi+E13TUL1VIZAa4CAnxGB1WCtmjldg==
Date: Thu, 21 Sep 2023 15:11:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
Message-ID: <202309211311328bf3a025@mail.local>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230810132113aee9ceff@mail.local>
 <20230811080027d7b75a14@mail.local>
 <202308110845568593abfe@mail.local>
 <CAEHHSvaS6cuNeu3gidGmOnnRiDkOY-ST7M1+NS6BNk4S1Y0BJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvaS6cuNeu3gidGmOnnRiDkOY-ST7M1+NS6BNk4S1Y0BJw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187994

Hello,

On 20/09/2023 16:20:42+0200, Julien Stephan wrote:
> Hi Alexandre,
> sorry for the late reply.
> 
> I was not able to reproduce this issue on my local setup, but I did
> find another (similar??)  bug, I fixed it, so hopefully it will also
> fix the one detected by the autobuilder.
> I updated my branch on poky-contrib
> (https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/bblock)
> (with this fix and a few other ones), can you try it on autobuilder? I
> didn't send a newer version of the series in case the issue is still
> there.

This was sent to the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5785/steps/14/logs/stdio

> 
> Please let me know if I can do anything else
> Cheers
> Julien
> 
> Le ven. 11 ao�t 2023 � 10:45, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a �crit :
> >
> > On 11/08/2023 10:00:33+0200, Alexandre Belloni wrote:
> > > On 10/08/2023 15:21:14+0200, Alexandre Belloni wrote:
> > > > Hello, this causes oe-selftest failures on the autobuilders:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5589/steps/14/logs/stdio
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5577/steps/14/logs/stdio
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5536/steps/14/logs/stdio
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5613/steps/14/logs/stdio
> > > >
> > > > 2023-08-10 09:44:34,071 - oe-selftest - INFO - bblock.BBLock.test_lock_architecture_specific (subunit.RemotedTestCase)
> > > > 2023-08-10 09:44:34,072 - oe-selftest - INFO -  ... FAIL
> > > > Stderr:
> > > > 2023-08-10 09:40:23,454 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2290072/conf/local.conf
> > > > 2023-08-10 09:40:23,455 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> > > > 2023-08-10 09:44:34,072 - oe-selftest - INFO - 3: 1/34 29/533 (250.62s) (0 failed) (bblock.BBLock.test_lock_architecture_specific)
> > > > 2023-08-10 09:44:34,072 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> > > >   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/bblock.py", line 103, in test_lock_architecture_specific
> > > >     self.assertNotIn(info_message, result.output)
> > > >   File "/usr/lib64/python3.9/unittest/case.py", line 1111, in assertNotIn
> > > >     self.fail(self._formatMessage(msg, standardMsg))
> > > >   File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
> > > >     raise self.failureException(msg)
> > > > AssertionError: 'NOTE: The following recipes have locked tasks: quilt' unexpectedly found in 'NOTE: Reconnecting to bitbake server...
> > > >
> > >
> > > Hum, wait, I got this without the patch series. Let me investigate.
> >
> > Actually, I still had the series :)
> >
> 
> Hi Alexandre,
> 
> I am not able to reproduce it locally, so it is difficult to fix the issue.
> 
> 
> 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

