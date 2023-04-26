Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E464C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 13:56:09 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.8642.1682517361157074934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 06:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prfcl-00019t-6U; Wed, 26 Apr 2023 15:55:59 +0200
Message-ID: <1679ac7d473423d90fdff3967ecf98163a9c7803.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v3 0/9] Add barebox bootloader support (and
 testing)
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
 <alex.kanavin@gmail.com>,  alexandre.belloni@bootlin.com
Date: Wed, 26 Apr 2023 15:55:58 +0200
In-Reply-To: <20230426141241.3a5d7a29@booty>
References: <20230425184720.456896-1-ejo@pengutronix.de>
	 <20230426141241.3a5d7a29@booty>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 13:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180444

Hello Luca,

Am Mittwoch, dem 26.04.2023 um 14:12 +0200 schrieb Luca Ceresoli:
> Hello Enrico,
> 
> On Tue, 25 Apr 2023 20:47:11 +0200
> Enrico Jörns <ejo@pengutronix.de> wrote:
> 
> > This adds support for the barebox bootloader (and tools) to oe-core.
> > 
> > In order to have proper testing, this extends oe-selftest to allow
> > basic testing of bootloaders. While at it, cover both barebox and u-boot.
> 
> Some tests are failing with this series applied. Logs looking like:

thank you for the test results.

> --------------------------------8<--------------------------------
> 
> 2023-04-26 02:45:38,232 - oe-selftest - INFO - barebox.BareboxTest.test_boot_barebox
> (subunit.RemotedTestCase)
> 2023-04-26 02:45:38,232 - oe-selftest - INFO -  ... skipped 'Test skipped on x86_64\n'
> 2023-04-26 02:45:38,232 - oe-selftest - INFO - 1: 1/47 2/530 (0.00s) (0 failed)
> (barebox.BareboxTest.test_boot_barebox)
> 2023-04-26 02:45:38,232 - oe-selftest - INFO - Test skipped on x86_64
> 2023-04-26 02:46:47,829 - oe-selftest - INFO - fetch.Dependencies.test_dependencies
> (subunit.RemotedTestCase)
> 2023-04-26 02:46:47,829 - oe-selftest - INFO -  ... ok
> 2023-04-26 02:46:47,829 - oe-selftest - INFO - 12: 2/20 3/530 (70.93s) (0 failed)
> (fetch.Dependencies.test_dependencies)
> 2023-04-26 02:46:54,605 - oe-selftest - INFO - barebox.BareboxTest.test_boot_barebox_efi
> (subunit.RemotedTestCase)
> 2023-04-26 02:46:54,605 - oe-selftest - INFO -  ... FAIL
> Stderr:
> 2023-04-26 02:45:38,230 - oe-selftest - INFO - Adding: "include selftest.inc" in
> /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3126928/conf/local.conf
> 2023-04-26 02:45:38,231 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> 2023-04-26 02:46:54,606 - oe-selftest - INFO - 1: 2/47 4/530 (76.37s) (0 failed)
> (barebox.BareboxTest.test_boot_barebox_efi)
> 2023-04-26 02:46:54,606 - oe-selftest - INFO - testtools.testresult.real._StringException:
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-
> debian/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/oe-selftest-
> debian/build/meta/lib/oeqa/selftest/cases/barebox.py", line 63, in test_boot_barebox_efi
>     bitbake(image)
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py",
> line 234, in bitbake
>     return runCmd(cmd, ignore_status, timeout, output_log=output_log, **options)
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py",
> line 212, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command,
> result.status, exc_output))
> AssertionError: Command 'bitbake  core-image-minimal' returned non-zero exit status 1:
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 955 .bb files complete (0 cached, 955 parsed). 1872 targets, 55 skipped, 0 masked, 0
> errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'barebox' (but /home/pokybuild/yocto-worker/oe-selftest-
> debian/build/meta/recipes-core/images/core-image-minimal.bb, /home/pokybuild/yocto-worker/oe-
> selftest-debian/build/meta/recipes-core/packagegroups/packagegroup-core-boot.bb RDEPENDS on or
> otherwise requires it)
> barebox was skipped: PREFERRED_PROVIDER_virtual/bootloader set to u-boot, not barebox
> NOTE: Runtime target 'barebox' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['barebox']
> ERROR: Required build target 'core-image-minimal' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-minimal', 'barebox']
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
> 
> --------------------------------8<--------------------------------

It seems as if I did not re-test the EFI test after having set PREFERRED_PROVIDER_virtual/bootloader
to "u-boot" in the machine conf. I will add a PREFERRED_PROVIDER_virtual/bootloader = "barebox" to
the test case.
> 
> Some logs are here:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5054/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5096/steps/14/logs/stdio

There are some wic failures where I am not sure yet if these are caused by my patchset or not.

> FYI I had to manually solve a trivial conflict on patch 5 due to
> another patch in my branch that is touching the same file:
> https://lore.kernel.org/openembedded-core/20230411150503.2105880-2-lrannou@baylibre.com/

I am not really unconvinced that this patch set should be applied as-is.
It copies most of the run_serial() method 'just' to change the return value.
It would also require to duplicate my adaptions.


Thanks and regards

Enrico

> Best regards,
> Luca
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


