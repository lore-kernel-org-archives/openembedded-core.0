Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA4BC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 19:09:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.2786.1715800149701672399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 12:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ds/ow1Lv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97B9A20002;
	Wed, 15 May 2024 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715800148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pNzGtuE9AdyU5PN0w49n6keLB9D5q/2HA1JzLh++vy8=;
	b=ds/ow1Lv9EZJpInHJNHOXuOjkqldJQVZR/aY0xQFOlMkamWVemCrN3rrxseKJ2dJyizxwe
	H88Fbi18oFT/1APw1g6AAUdU+wS6s0EAB7GeyAxWTKyIC+kOjLYN4NLZLBFjhBUDS51Eil
	3wBz1B45vAi4W0DTKUsQ2BhcU/Ix2b2dpCGovbjgTXvULst28exNI9JIAOZhiBhvZYS0KW
	+T3i/FzrlVFfj+4M550dKHCg9/FmApwbOtmIGnYNfbvuGjO6Oz2varG6lKkTi86naWQ9Gm
	XTqFJxl0/4t3SD3UVP4JKVciGZK7sTiWQBw335B1CMW/jxyYvCEGWW3Sbb8BHg==
Date: Wed, 15 May 2024 21:09:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: johannes.schneider@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v8 0/3] pkg-database and systemd-sysext image
Message-ID: <2024051519090741f660dd@mail.local>
References: <20240512063159.1249522-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512063159.1249522-1-johannes.schneider@leica-geosystems.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 19:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199429

Hello,

It seems that this reliably fails oe-selftest-armhost. I didn't really
pay attention until now beause we had other issues but in this build,
those are the only failing tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3322/steps/15/logs/stdio

On 12/05/2024 08:31:56+0200, Johannes Schneider via lists.openembedded.org wrote:
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
> changes with v3:
> 	incorporate review suggestions for simplification
> 	add task dependency handling
> 	add oe-selftest for the pkgdb handling
> 	add variable documentation and
> 	some more comments, and examples in the commit-msg
> 
> changes with v4:
> 	rebase onto 'master' => no functional changes
> 	fixed patchtest findings
> 
> changes with v5:
>         rebase onto 'master'
> 	add '.sysext' to the deployed symlink name
>         sidenote on the tests and autobuilder failure: run locally they succeed, e.g.:
>           #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_image_gen_pkgdbfs
> 
> changes with v6:
> 	tests: restructure to call 'bitbake' only once in the testcase itself
> 	  (in hopes of solving the autobuilder problem; local test runs succeed)
> 
> changes with v7:
>         tests: undo the restructuring of done in v6, in favour of explicitly forcing steps:
> 	  '-c rootfs -f'.  since concurrency of the autobuilder, and reusing artifacts/sstate-caching is probably the issue?
> 
> changes with v8:
>         tests: fixed missing feature=PACKAGE_CLASSES during 'test_image_gen_pkgdbfs'
> 	   which is now split into three, one for each of the three available packagemanager: ipk, deb, rpm

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199209): https://lists.openembedded.org/g/openembedded-core/message/199209
> Mute This Topic: https://lists.openembedded.org/mt/106051545/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

