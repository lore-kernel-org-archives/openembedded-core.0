Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62650C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 15:07:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.27370.1683904016966583797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 08:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZKX1awfG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E62D60010;
	Fri, 12 May 2023 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683904015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5mF0g7TRejFW1aroOr+2N2bwJ/K9Xshc2ZDbYVjlf3I=;
	b=ZKX1awfGGunc/dn/Lwtl/PT/HNBxC3xPi1FHtd6gJIuy8NvZXx/kaczNORfl4L/yyQPiK/
	7AELwHFRl5GZL+FbuI/BXTH8pr9xt25SzIL8UA4K+J1tlsWYwnWV/ZYKX3LjdDaaSIG3BY
	35gO3c+MiW/z8ou8BtcuxmZ6S9dZWWyVJ4ntsb9RhIRu5R0gi3JLSkN2pnfcGRYJtGPKuB
	Do9D6ywU7wo4jXKEVx5hQL7BhPGhzNlzmXcSK09aOSQenbEMECOzVqNSROM4NmL2XiZal/
	NSOS+zvxTKnI9SNgQLOy552j/BNwA9R5J9cvHRCroNkSALQ+VvF6ZpmKEj0MdA==
Date: Fri, 12 May 2023 17:06:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: rs@ti.com
Cc: afd@ti.com, reatmon@ti.com, denis@denix.org, martin.jansa@gmail.com,
	peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 0/2] Fix: allow specification of dtb directory
Message-ID: <2023051215065401e172fd@mail.local>
References: <20230511213614.466484-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511213614.466484-1-rs@ti.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 15:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181186

Hello,

This caused the following failures on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/3986/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5176/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5167/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/7160/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6067/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1406/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5126/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5205/steps/14/logs/stdio


2023-05-12 09:01:46,475 - oe-selftest - INFO - fitimage.FitImageTests.test_initramfs_bundle (subunit.RemotedTestCase)
2023-05-12 09:01:46,476 - oe-selftest - INFO -  ... FAIL

and

ERROR: When reparsing /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package, the basehash value changed from 856d8373327180fa74e88cff2bbc28b82eb24fb635dc7d3ac16d7a2b7d89ff2e to d2b77c38850e4954edc1422022fb0dbd307742cf2eafac6d8ae699d03d2ce13b. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake linux-yocto -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake linux-yocto -cdo_package -Sprintdiff

On 11/05/2023 16:36:12-0500, Randolph Sapp via lists.openembedded.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Fix a few of the oddities introduced by the previous patch that allowed
> specification of the DTB install directory and specification of vendor
> directories in that directory.
> 
> Add a recursive search for dtb and dtbo files to make sure
> upstream dtb directory standards don't break our packages.
> 
> Makes the kernel-devicetree class posix compliant again by using BB
> variables more efficiently.
> 
> Martin Jansa (1):
>   kernel-devicetree: make shell scripts posix compliant
> 
> Randolph Sapp (1):
>   kernel-devicetree: recursively search for dtbs
> 
>  meta/classes-recipe/kernel-devicetree.bbclass | 26 +++++++++++++------
>  meta/classes-recipe/kernel.bbclass            |  2 +-
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181157): https://lists.openembedded.org/g/openembedded-core/message/181157
> Mute This Topic: https://lists.openembedded.org/mt/98837534/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

