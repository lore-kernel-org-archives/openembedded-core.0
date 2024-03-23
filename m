Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060BECD11BF
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 13:40:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8817.1711201225417583474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 06:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pVdR3RA+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ACF540004;
	Sat, 23 Mar 2024 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711201223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JosB2GMoHRc0tNGPDNiDY71Zl91v4GIpC4Ggg9MN648=;
	b=pVdR3RA+vQ/xHOeg1yWKldc11zjjD+PuRXBFLeXPU75/i53bUCs3YyVe1c9D9jEmRbKdsY
	B8/6ZYFXXE9NJdPgfztREoyNmG+c8TGNTk1ilHY0TaVqcCcTzaKc5jKCrCJcvThJYAuZJf
	VHV7JfnG3LxHqbw+PO7D9yQBcU9gDqnFsT5fNmVTVT2wClcEbVwvZ6HQT/RvarW3Xm+ORg
	EFcgKgYcjVHTrpk3oeFk3bRzgsGumJUxtw6cXP6lAHEwz265j0useL57KFEULtTA+47gjX
	8LwKvSk7JtKA2Nd0eLE2DMNFg8gtk039QjExIgGs5T5nXDOPxywS1ImeyWL7Fg==
Date: Sat, 23 Mar 2024 14:40:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: johannes.schneider@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v4 0/3] pkg-database and systemd-sysext image
Message-ID: <202403231340237d0319a2@mail.local>
References: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 13:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197452



Hello,

The series causes failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6548/steps/14/logs/stdio


2024-03-21 21:05:49,848 - oe-selftest - INFO - 6: 20/46 500/587 (137.73s) (0 failed) (imagefeatures.ImageFeatures.test_image_gen_pkgdbfs)
2024-03-21 21:05:49,848 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 327, in test_image_gen_pkgdbfs
    self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_IMAGE'], 'var/lib/opkg/status')), 'opkg\'s status file was not present in: %s' % tar_file)
  File "/usr/lib64/python3.9/unittest/case.py", line 688, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : opkg's status file was not present in: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3332915/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-pkgdb.tar.gz


On 04/03/2024 07:15:50+0100, Johannes Schneider via lists.openembedded.org wrote:
> systemd-sysext allows to overlay another image (or multiple) ontop of
> a "base-image" = the current rootfs, via the use of overlayfs; to add
> tools and features meant for development purposes.
> 
> To quote the documentation on systemd-sysext:
> " ...addition in order to make debugging/development easier). System
> extension images should not be misunderstood as a generic software
> packaging framework, ..."
> 
> To build a lean image, that only holds packages that are not already
> part of the base-image, a snapshot of the package-database is taken
> after the installation of the base-rootfs is done, and picked up again
> when collecting the rootfs of such a extension image.
> 
> with all this in place an example usage could look like this:
> some-core-image.bb
>   inherit core-image
>   IMAGE_GEN_PKGDBFS = "1"
> 
> extending-image.bb
>   inherit image-sysext
>   IMAGE_FSTYPES = "squashfs"
>   IMAGE_BASE_PKGDB = "some-core-image"
>   # the above pointing at a package-db similar to:
>   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-pkgdb.rootfs.tar.gz
> 
> then on the device, running some-core-image, with the extension image placed at FN:
> $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> $> systemd-sysext list
> $> SYSTEMD_LOG_LEVEL=debug systemd-sysext merge
> 
> As long as the VERSION_ID of the extension image matches the os-release
> in the base image, the above commands return sucessfully;
> for details on the compativility check see the docs for systemd-sysext.
> 
> =========
> 
> changes with v2:
>         rebase from 'kirkstone' onto 'master'
> 
> changes with v3;
> 	incorporate review suggestions for simplification
> 	add task dependency handling
> 	add oe-selftest for the pkgdb handling
> 	add variable documentation and
> 	some more comments, and examples in the commit-msg
> 
> changes with v4;
> 	rebase onto 'master' => no functional changes
> 	fixed patchtest findings

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196588): https://lists.openembedded.org/g/openembedded-core/message/196588
> Mute This Topic: https://lists.openembedded.org/mt/104717642/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

