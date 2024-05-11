Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5E1C04FFE
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 23:07:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.25066.1715468854033063581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 May 2024 16:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iDNDTbcW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF3E120002;
	Sat, 11 May 2024 23:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715468852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTugFaNBLw+C1Sl4k1dow8tog0axaBzBbLcBDCFe/8A=;
	b=iDNDTbcWBWUDn9YoPqnl2OMjhHNKHOUEoBKsufe6475kKh/Hlw3pm2W0b321/qVHyG6CM6
	P/jaj9AhSGVOSaLffae50l+9hAInT0EeCFdqTVwxCIYFKREWE2JoP3VZRbDdHLG5hIfPZS
	1jflr/bTApj5FEvTSzE+V6b3JVyNP7G7eSBQVYspIAqfY5vFGdm5Ext/b9zxhYIGjlDfSj
	7tQ7NMDjzFIo2z6PjtvWO4/0a9MembqPf339nc4cU5a2+2J/q9wGN+JLj9pJo+lPe2DDO0
	T7Rii3IQrkirlZbMrG7msZX6ORdXASPyWEOiyoHIUvCKA1BSAEq/VSA7vYhuUA==
Date: Sun, 12 May 2024 01:07:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Subject: Re: [PATCH v6 0/3] pkg-database and systemd-sysext image
Message-ID: <202405112307317b125d6b@mail.local>
References: <20240510030937.3789910-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510030937.3789910-1-johannes.schneider@leica-geosystems.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 May 2024 23:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199207

Hello,

This still fails on the autobuilders, I'm pretty sure the config for the
build folder has:
PACKAGE_CLASSES = "package_rpm"

This explains this:

build-st-4166614$ tree tmp/deploy/images/qemux86-64/var/lib/
tmp/deploy/images/qemux86-64/var/lib/
├── dnf
│   ├── history.sqlite
│   ├── history.sqlite-shm
│   └── history.sqlite-wal
└── rpm
    ├── rpmdb.sqlite
    ├── rpmdb.sqlite-shm
    └── rpmdb.sqlite-wal

3 directories, 6 files

Are you testing with plain poky?


On 10/05/2024 05:09:34+0200, Johannes Schneider wrote:
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

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

