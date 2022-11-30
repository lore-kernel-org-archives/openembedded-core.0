Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BEEC352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 11:02:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8209.1669806163812694188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 03:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jAs3Y5/P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 33F5C20002;
	Wed, 30 Nov 2022 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669806161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1N96FcN/ROjLUMUe5bJthkeL9WkwFZAAtm1PPOzAW/o=;
	b=jAs3Y5/P/ZRKIVIIzETN7t6Lib2hYvzjwbksGmFsQHcF4Db9Hp2Qn81cpNeB1IApEc+TId
	Pdbo6FffGFyuNNuMVrBctQct98Yykl2GNeQrJkH/Tp0+JFVn0hjXlBt1+RcwmP3W9XW+yk
	AliabD4JiDssr9lPVZuTHLH1zVRE6VdKZLnS0qgN6wuSuvn7jC9tzQh3Kfusx3Y1Gm+TYy
	3erxZ9EpsOoMcpG9Xwopkv8/mhnIUn+aOz9J+pxEf8KzXfxVOzfg1QXEG5eMcqyk9+D0KC
	XBPoN/lve9YnbwmPuBTQ+DMONznu0pSt8xXBUXo8JxnVhjqAODnFbIRcno1OFw==
Date: Wed, 30 Nov 2022 12:02:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Y2038 proposal
Message-ID: <Y4c4UBryAjx5t2gl@mail.local>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 11:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174001

On 30/11/2022 09:07:50+0100, Alexander Kanavin wrote:
> On Tue, 29 Nov 2022 at 16:45, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote:
> > We’d welcome a proposal/series on how to move forward with the Y2038 work for 32 bit platforms.
> 
> I have the following proposal:
> 
> 1. A branch is made where:
> a. "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" is enabled globally.
> b. qemu is always started with "-rtc base=2040-01-01", simulating
> Y2038 actually occurring.
> c. an additional runtime test verifies that both RTC clock and system
> clock report 2040.
> 
> 2. This branch is run through a-full on the autobuilder. Any uncovered
> issues are filed as bugs.
> 

I ran a-full with "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" last week, it
didn't go too well gcc-sanitizer and pulseaudio being the main offenders
but buildtools needs to be investigated.


> 3. Once *all* of the bugs are addressed, repeat point 2.
> 
> 4. Once there are no more open bugs, 1a is merged into master.
> 
> Any fatal flaws in the plan?
> 
> It's not hard to see that Y2038 problem is real and serious, e.g. on
> qemux86 core-image-full-cmdline built from master:
> 
> root@qemux86:~# ls /
> bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> run  sbin  sys  tmp  usr    var
> root@qemux86:~# date -s "2040-01-01"
> Sun Jan  1 00:00:00 UTC 2040
> root@qemux86:~# ls /
> bin  boot  dev    etc  home  lib    lost+found  media  mnt    proc
> run  sbin  sys  tmp  usr    var
> root@qemux86:~# ls /
> -sh: ls: command not found
> 
> On qemux86_64 the same sequence works as expected, of course.
> 

The main issue with the plan is that we are not running tests on 32
qemu anymore.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

