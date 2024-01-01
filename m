Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F127FC4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 12:57:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.4338.1704113852367223295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 04:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rn6U29Jq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA8B7C0002;
	Mon,  1 Jan 2024 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704113849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VVEcQsJ4+NCUKil2c0RF+wt3BtoNOY/lzaYSelcYPHo=;
	b=Rn6U29JqEkrJ2meBfm7miChui4XisVs5mYHX5UuevVzF2YttY8/yN5h1fElkk4r3TjekQ/
	56lLV2SDHaqoepIHqrM3eV6vo4OEiy9oIokDbJOvjtrHIttTmkSw6TwKXG5lzVwmHSQz6P
	4U0UiKhmyTSdKXtlR/2GXMrJaK1qFheChU2iTa0TTDjuPqgP39bpg0w9KxEA7Ft1CDQXoA
	2Yr+5k5qa+4XT2R6M5lFmZjhUKRRXml0hV4IXNKMah3tXdIk5YV6T7esWfI+72ojJ8ruv/
	bj28vBi6+d4PPzT4AoPKkOSMMLYrMma6OPAuYX/mzBRrJr38KeYC5cWfeuF8HQ==
Date: Mon, 1 Jan 2024 13:57:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Zhukov <pazhukov@suse.de>
Cc: Pavel Zhukov <pavel@zhukoff.net>,
	openembedded-core@lists.openembedded.org, luca.ceresoli@bootlin.com,
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v3 1/4] dummy-sdk-package.inc: Filter packages
 which are marked for installation
Message-ID: <20240101125728eaff00a0@mail.local>
References: <20231009144001.21150-1-pavel@zhukoff.net>
 <20231012093603.53a79e61@booty>
 <b65cec4ff5d003bef56f96ffdd7ef52b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b65cec4ff5d003bef56f96ffdd7ef52b@suse.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 12:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193094

Hello,

This still causes issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6252/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6203/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6256/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6263/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2682/steps/15/logs/stdio

2023-12-31 22:35:38,306 - oe-selftest - INFO - 5: 63/78 555/579 (65.04s) (0 failed) (spdx.SPDXCheck.test_spdx_base_files)
2023-12-31 22:35:38,306 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/spdx.py", line 54, in test_spdx_base_files
    self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files")
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/spdx.py", line 50, in check_recipe_spdx
    self.assertExists(full_file_path)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/case.py", line 251, in assertExists
    raise self.failureException(msg)
AssertionError: '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3943718/tmp/deploy/spdx/qemux86_64/packages/base-files.spdx.json' does not exist



On 18/12/2023 11:28:04+0100, Pavel Zhukov wrote:
> Hi Alex, Luca,
> 
> Can you please retest this patchset one more time please?
> Neither myself nor RP could reproduce build failure with recent
> master/sstate so it might be fixed in the meantime.
> 
> -- 
> Pavel
> 
> On 2023-10-12 09:36, Luca Ceresoli via lists.openembedded.org wrote:
> > Hello Pavel,
> > 
> > On Mon,  9 Oct 2023 16:39:58 +0200
> > "Pavel Zhukov" <pavel@zhukoff.net> wrote:
> > 
> > > if packages is provided by dummysdk and in the same time marked for
> > > installation with IMAGE_INSTALL it causes conflict in apt because
> > > virtual providers are
> > > not taken into account if package is asked to be installed explicitly.
> > > Filter such packages from provides/conflicts to workaround this
> > > problem.
> > > This workaround brakes RPM usecase because of file conlicts with
> > > DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
> > > doesn't include file based conflicts).
> > > While this is needed for the case of package_deb only adding it for
> > > all
> > > package managers to not complicate the code.
> > > 
> > > Fixes: [Yocto #13338] [Yocto #14066]
> > > 
> > > Fixes:
> > > The following information may help to resolve the situation:
> > > 
> > > The following packages have unmet dependencies:
> > >  target-sdk-provides-dummy : Conflicts: bash
> > > E: Unable to correct problems, you have held broken packages.
> > > 
> > > Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> > 
> > Testing with this series applied results in lots of errors like these:
> > 
> > stdio: ERROR: core-image-minimal-1.0-r0 do_rootfs: No SPDX file found
> > for package base-files, False
> > sstate:base-files:qemux86_64-poky-linux:3.0.14:r0:qemux86_64:11:
> > sstate:base-files::3.0.14:r0::11:
> > stdio: ERROR: core-image-minimal-mtdutils-1.0-r0 do_rootfs: No SPDX
> > file found for package base-files, False
> > sstate:base-files:qemux86_64-poky-linux:3.0.14:r0:qemux86_64:11:
> > sstate:base-files::3.0.14:r0::11:
> > 
> > See the full log at:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5894/steps/14/logs/stdio
> > 
> > Luca
> > 
> > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192628): https://lists.openembedded.org/g/openembedded-core/message/192628
> Mute This Topic: https://lists.openembedded.org/mt/101853406/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

