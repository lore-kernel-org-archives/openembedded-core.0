Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43D2C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 10:01:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6104.1634119313020609305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 03:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7A1E720009;
	Wed, 13 Oct 2021 10:01:50 +0000 (UTC)
Date: Wed, 13 Oct 2021 12:01:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ?ukasz Majewski <lukma@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nathan Rossi <nathan@nathanrossi.com>,
	Khem Raj <raj.khem@gmail.com>,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RESEND 2/2] glibc: ptest: Add support for
 running glibc test suite with ptest
Message-ID: <YWaujmnLKEwEh9vm@piout.net>
References: <20210930104357.3906-1-lukma@denx.de>
 <20210930104357.3906-2-lukma@denx.de>
 <20211013103522.3f15e078@ktm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013103522.3f15e078@ktm>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 10:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156898

Hello,

On 13/10/2021 10:35:22+0200, ?ukasz Majewski wrote:
> Dear Community,
> 
> > This patch introduces new recipe - namely 'glibc-tests', which
> > builds and installs glibc test suite to OE/Yocto built image.
> > 
> > It reuses code from already available 'glibc-testsuite' recipe,
> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > to execute remotely (via SSH) tests on some emulated machine.
> > 
> > This recipe installs eligible tests on some rootfs image.
> > Afterwards, either all of them or only time related subset, those
> > tests can be executed on the real hardware, to facilitate validation
> > of this platform with for example Y2038 problem compliance.
> > 
> > By default all tests are executed, with 'ptest-runner glibc-tests'.
> > To test only time related subset - one needs to call:
> > cd /usr/lib/glibc-tests/ptest/; rm run-ptest; \
> > ln -s run-ptest-time run-ptest; cd -; ptest-runner glibc-tests
> > 
> > To facilitate debugging, source files are provided by default with
> > the unstripped debugging symbols. Such approach would reduce the
> > already complex recipe (as it inherits base glibc one), so there
> > is no need to also install *-dbg and *-src packages.
> > 
> 
> Gentle ping on this patch set.
> 

This caused failures on the autobuilders as per my previous email from
the 4th of october:

ERROR: Nothing RPROVIDES 'glibc-tests-ptest' (but
/home/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/recipes-core/images/core-image-ptest-all.bb RDEPENDS on or
otherwise requires it)

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2341/steps/11/logs/stdio


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

