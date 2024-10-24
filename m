Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997B0D0BB68
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 06:56:35 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.8681.1729752987508958704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 23:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ev++z/dy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B8CE1C0007;
	Thu, 24 Oct 2024 06:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729752985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RLV5ijyOzBezmu+DRtqWWzEc89ck22XCwS1fLrqWWP0=;
	b=Ev++z/dyvh70fE3ejCfKPtncuAoQqwkQBDYs7AUnfz1ZEvxIPvXaXkdLgPBJJRCHQ2zVDo
	ywdTRYHkxD30xMCKEbXFxAg6waxLNgnV1xweRTnXBJGe/mFRy9JUGvDWnBrYGSrPRSjVFz
	OXZQbDjzW0Iz5RzPqFW0HO5J6Ks5tFH9I7N+g4hFTjQAA2bPr5gHWPumv0yInzEEX1t/zi
	X16q0AfBcSz1urEjYPP6ESfKP3ZIDr+XAq9FBoedu2w7NdPxf2V9mgPp6x7S4FWsE1SNjX
	GKW+t78tqCImV8LI/LMmrhgMcRqQC6cna1YnJPx2PbX3dx0b+Az7xyUq91m9zg==
Date: Thu, 24 Oct 2024 08:56:23 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 4/4 v2] python3-dtc: upgrade 1.7.0 -> 1.7.1
Message-ID: <Zxnvl_Ghdbxjz-R6@bootlin-mathieu>
Mail-Followup-To: Trevor Gamblin <tgamblin@baylibre.com>,
	Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
References: <20240924150001.2586819-1-tgamblin@baylibre.com>
 <20240924150001.2586819-4-tgamblin@baylibre.com>
 <5E176A0E-4995-428E-AF5A-F625EF7A2000@arm.com>
 <457AF752-98B2-4032-8720-DD0EA976DFF8@arm.com>
 <17F8CB639310258B.14701@lists.openembedded.org>
 <86d505f3-e6e7-4c30-85f6-2f12848e3dce@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86d505f3-e6e7-4c30-85f6-2f12848e3dce@baylibre.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 06:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206277

On Mon, Oct 21, 2024 at 03:04:21PM -0400, Trevor Gamblin wrote:
> 
> On 2024-09-26 08:34, Trevor Gamblin via lists.openembedded.org wrote:
> > 
> > On 2024-09-26 07:51, Ross Burton wrote:
> > > I suspect the problem is the rebase of the symbol visibility patch
> > > went wrong?
> > Possibly. I'll take another look.
> I came back to this today. Looks like there was an update to lopper in
> meta-virt on September 30th. I can't reproduce this failure with MACHINE =
> "qemuarm64" and building either lopper or lopper-native. I do, however, run
> into a do_rootfs dnf error that I'm assuming is a problem with me forgetting
> something for meta-virt:
> 
> |No match for argument: kernel-module-xen-blkback
> |No match for argument: kernel-module-xen-gntalloc
> |No match for argument: kernel-module-xen-gntdev
> |No match for argument: kernel-module-xen-netback
> |No match for argument: kernel-module-xen-wdt
> |Error: Unable to find a match: kernel-module-xen-blkback
> kernel-module-xen-gntalloc kernel-module-xen-gntdev
> kernel-module-xen-netback kernel-module-xen-wdt
> 
> Could this patch be re-tested (assuming that error isn't hiding the issue)?

Hi Trevor,

Sorry, I retested your patch, and it seems the issue is still there:

https://valkyrie.yoctoproject.org/#/builders/89/builds/274/steps/16/logs/stdio

| [WARNING]: cant load yaml, disabling support: No module named 'ruamel'
| Traceback (most recent call last):
|   File
"/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/lopper/fdt.py",
line 39, in <module>
|     import libfdt
|   File
"/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/libfdt.py",
line 12, in <module>
|     import _libfdt
| ImportError:
/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/_libfdt.cpython-312-x86_64-linux-gnu.so:
undefined symbol: fdt_get_symbol
| 

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

