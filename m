Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F52EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 20:59:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.173.1689022745574173510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 13:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bgfKE5Jf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0351220004;
	Mon, 10 Jul 2023 20:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689022743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3iFHtDJxZH51yT1Evyy4CiwweAeQLVxeIWhrNtFa8g=;
	b=bgfKE5Jfya4rY+fu3rdeDhDCSob83cVsaggstUQbPoHQvaZPfncSfxKCytGhIVvvoRflzm
	G+pdkzSk6+k306BHKhjGkqWFQyM2wDTQ6QepCS1V1NDBH886TiQDPDPyhrBPqV4EaCNJKE
	m8R9M1OBcca4DsZHeiPKvGI99cCHzKirtV0zEai0zacL2fgE6jEy17WCqszm6aqm4gU0P3
	OIeQP6qcOCnXK9B0K4PH36VaPjL7RE6umobN6QfVYykn8bRAXWzvYisdgKrZwnbaBQmSAP
	QdXDAfk7xMp/z3Q8zJ8/o+B6friiaOjghh2fwgzSVeFMQrFLYfepJekFEQHGUQ==
Date: Mon, 10 Jul 2023 22:59:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 00/15] kernel: consolidated pull request
Message-ID: <20230710205902398898f0@mail.local>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <CDACE6FE-F991-4E69-BC69-B1BEC6B6B761@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CDACE6FE-F991-4E69-BC69-B1BEC6B6B761@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 20:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184097

Hello,

On 10/07/2023 14:54:50+0000, Ross Burton wrote:
> On 10 Jul 2023, at 04:20, Bruce Ashfield via lists.openembedded.org <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > Here's the latest queued kernel changes. There are the expectd -stable updates
> > 6.1, but those of course aren't the most interesting part of this queue.
> 
> 
> I’ve not triaged them yet as it’s still building, but https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5577 is just this branch on top of master and has some new failures/warnings.
> 

It mostly worked on my branch, there is this new failure though:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7413/steps/12/logs/stdio

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 393, in test_parselogs
    self.assertEqual(errcount, 0, msg=self.msg)
AssertionError: 4 != 0 : No ignore list found for this machine, using default
No ignore list found for this machine, using default
No ignore list found for this machine, using default
No ignore list found for this machine, using default
No ignore list found for this machine, using default
No ignore list found for this machine, using default
No ignore list found for this machine, using default
No ignore list found for this machine, using default
Log: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0-r0/target_logs/Xorg.0.log
-----------------------
Central error: [    17.416] (II) FBDEV(0): 	mode "640x480" test failed
***********************
[    17.381] 	compiled for 1.21.1.8, module version = 0.0.2
[    17.381] 	ABI class: X.Org Video Driver, version 25.2
[    17.384] (II) FBDEV(0): using default device
[    17.389] (==) FBDEV(0): Depth 24, (==) framebuffer bpp 32
[    17.389] (==) FBDEV(0): RGB weight 888
[    17.389] (==) FBDEV(0): Default visual is TrueColor
[    17.403] (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
[    17.406] (II) FBDEV(0): hardware: virtio_gpudrmfb (video memory: 4000kB)
[    17.407] (DB) xf86MergeOutputClassOptions unsupported bus type 0
[    17.411] (II) FBDEV(0): checking modes against framebuffer device...
[    17.416] (II) FBDEV(0): 	mode "640x480" test failed
[    17.417] (II) FBDEV(0): 	mode "640x480" test failed
[    17.418] (II) FBDEV(0): 	mode "640x480" test failed
[    17.419] (II) FBDEV(0): 	mode "640x480" test failed
[    17.441] (II) FBDEV(0): 	mode "640x480" not found
[    17.442] (II) FBDEV(0): checking modes against monitor...
[    17.444] (II) FBDEV(0): Virtual size is 1280x800 (pitch 1280)
[    17.445] (**) FBDEV(0):  Built-in mode "current"
[    17.446] (==) FBDEV(0): DPI set to (96, 96)
[    17.447] (II) Loading sub module "fb"
[    17.448] (II) LoadModule: "fb"

> Ross

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184081): https://lists.openembedded.org/g/openembedded-core/message/184081
> Mute This Topic: https://lists.openembedded.org/mt/100051814/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

