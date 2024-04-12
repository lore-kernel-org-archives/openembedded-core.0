Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49D6C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 21:58:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3480.1712959100827399242
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 14:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eZ6VntpV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7240360002;
	Fri, 12 Apr 2024 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712959098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PUwuggflBnQ3tb3vsXdy3kfExp+MHSl7FZgTXzCklXw=;
	b=eZ6VntpVvvSm6wYFjyq/5Bn+mAjaS5bfwS9febWz6i51YUwQQm8KY6/FPViHOcSeTV+AIJ
	6twhLQCYm6R5F24O2a7cVxNRsifdIO6NeBWn+R2kgs8b9ozLSPmmHWU0YcSeCT2jbXeGzU
	RtejkxSQ+NoB1Z583GAQikvczL/A49P0CGnpJ8W41e1+PeIidbnTYm5orPm7FilguQ0ig0
	3dBLLSrjRqUDrLqnD8+2g3FJXknpL634/qbDXB4mEtCgKS+01CqVPL27vwGY5yIZ1O2J9y
	vmb1ydvfkQbXNpRZB2iSkiaYeREcwR+mES7pPHcp+4rgaDkqwOD8HWQOGeGvuw==
Date: Fri, 12 Apr 2024 23:58:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: johannes.schneider@leica-geosystems.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH v5 0/3] pkg-database and systemd-sysext image
Message-ID: <20240412215818ec4e64de@mail.local>
References: <20240410071827.4099903-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410071827.4099903-1-johannes.schneider@leica-geosystems.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 21:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198187

On 10/04/2024 09:18:24+0200, Johannes Schneider via lists.openembedded.org wrote:
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

This still fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6639/steps/14/logs/stdio

2024-04-12 13:58:27,614 - oe-selftest - INFO - 6: 20/46 442/588 (108.93s) (0 failed) (imagefeatures.ImageFeatures.test_image_gen_pkgdbfs)
2024-04-12 13:58:27,614 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 327, in test_image_gen_pkgdbfs
    self.assertTrue(os.path.exists(os.path.join(img_vars['DEPLOY_DIR_IMAGE'], 'var/lib/opkg/status')), 'opkg\'s status file was not present in: %s' % tar_file)
  File "/usr/lib/python3.11/unittest/case.py", line 715, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : opkg's status file was not present in: /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-3521802/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-pkgdb.tar.gz


You can fnd the content of auto.conf here: https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6639/steps/13/logs/stdio



> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198080): https://lists.openembedded.org/g/openembedded-core/message/198080
> Mute This Topic: https://lists.openembedded.org/mt/105437784/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

