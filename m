Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03F0C433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 13:03:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.3538.1665234204795394022
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 06:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I8ByzbWV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E0104C0003;
	Sat,  8 Oct 2022 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665234202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9vP+lOtBUOck52SUByz+6UkTFoEjb31MXV7QvutsvY=;
	b=I8ByzbWVBm6QuamXQBrzy9cFUfvwyAGnhxAfCPOCXXD0umFjvMLXE/T0lzgCPgnZwnaj/x
	5zXGvUn6bcx5WDyo6lpOJJ/P6UpiU8QOS8DYebqBZy4LI+E9krhFB897/P3OSsmfWAHsnN
	TrcGjjHQ0pn958rKaSvB/jx8Pfmrlm3Y9wYOunOhAKwj4v6mLGOTPw2rS6yd7WDKb3BVHD
	93ZLvk7m735ErH5eSDGhlXI1au2ptoBl5WLN8IZe+F/BHT0H8dJgBkinI+w/PIkghi+yLH
	6TcvD/t1/0+YnaR88BpeaEddvjrhSckHlnCpI3nsQbg1GNgz63MNl3/vsWPeoQ==
Date: Sat, 8 Oct 2022 15:03:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] wic-imager-direct.py: use fstab update also
 for root device
Message-ID: <Y0F1GfFyeQfLRJcW@mail.local>
References: <20220930041807.2509199-1-f_l_k@t-online.de>
 <Yzd3sgaUonex6igX@mail.local>
 <OHQFJR.BSWQE91JLN3H@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OHQFJR.BSWQE91JLN3H@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 13:03:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171534

On 08/10/2022 14:53:48+0200, Markus Volk wrote:
> Am Sa, 1. Okt 2022 um 01:11:46 +0200 schrieb Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org>:
> > This causes the following failure:
> > <https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4140/steps/14/logs/stdio>
> 
> Hi Alexandre,
> 
> I've looked at the problem and can reproduce the errors when I run
> 'oe-selftest -v -r overlay-fs', but unfortunately I can't really see what
> exactly the problem is. qemu just ends unexpectedly and doesn't give much
> useful information in its output. At least I am not able to find it.
> 

The issue is probably that one:
AssertionError: None is not true : diff: can't stat '/data/overlay-etc/lower/lower-layer-test.txt': No such file or directory

is /data in /etc/fstab?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

