Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39014C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 10:35:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10685.1716978899155967588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 03:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bnvVLZve;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 193C61BF207;
	Wed, 29 May 2024 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716978897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=soVxeAgY+oI/7nOiyt2HkokQDPsst6skUuuXS1NrlQ4=;
	b=bnvVLZveuqBj+B7URkUN8fBdD1jQj2ufrk0yH3C/qYs1uZ1BXvr5ZVdF1KyD4jhsxhOMIy
	b4tfzlBhDNccPy6Gdlxm/51ccE4K4Ci1cVo9EsJQs8Pt4Zf6FxYG4+tVh32aIbu3EA1s0+
	oZDrYH81lxrT6HBxI8mYxe4G4EPfvRXZb9ujXcaZKfLxmJT7d3AIeiC1x2+a8wg9cLH9+r
	Z3arScSFqHCgh8by6mPGl9KVf6EadDrqvS64AV2xJngCkb9Y+ewoWL2X0NEKB62elaqW1E
	7w1ysydVXw+EmMm2AZ70NAmIvVBIMSGS3rI23aHgMkf9A/53NVmLpYCunmzX6Q==
Date: Wed, 29 May 2024 12:34:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: johannes.schneider@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext image
Message-ID: <20240529103456f1e78d6a@mail.local>
References: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 10:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200001

Hello,

I believe I tested the proper series but still had the failure on
armhost:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3398/steps/15/logs/stdio

On 22/05/2024 16:11:49+0200, Johannes Schneider via lists.openembedded.org wrote:
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
> changes with v9:
> 	tests: fix singular failure in 'oe-selftest-armhost'
> 	   which was due to the built image not containing a 'kernel-image...', which the gen-pkgdb sanity
> 	   check expected, but 'packagegroup-core-boot' instead
> 
> changes with v10:
> 	tests: fix runCmd usage in relation to native-dirs
> 	   due to which only the use-pkgdbfs-ipk test would fail in a qemu run armhost environment

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199756): https://lists.openembedded.org/g/openembedded-core/message/199756
> Mute This Topic: https://lists.openembedded.org/mt/106243260/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

