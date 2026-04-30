Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD19DFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:00:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17428.1777546835295565593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Fu+Nnloi;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D62AC5CD62
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FF2B60495;
	Thu, 30 Apr 2026 11:00:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7882C102F0D76;
	Thu, 30 Apr 2026 13:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777546832; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aPZ34p/g4kTjpdsSlPiEMMoYyECcIsGH+pfa4a0HPCQ=;
	b=Fu+Nnloin8itRhDNmTyPUW36N7qTDgwbQlG8AHSNChfkci0JTvFL4X+3rTcsyvAKSfHuWN
	Q6426ExjU8xMp42XtDuzxdyNG6HXx3jKjti6laYmvZ8gGX5qC2hADfvnsrTuRXVqXdx1Z5
	kbOLuNUR9yCLllA1uNYxbYcDV2WGqpmHILFO+6Ls3NAkv5dpjlRqBa3J9X7rIQ6183bltP
	20nk4p8NqAZ9H/XAtYqIvmrRfl16VxnZxuc/2wvRgn/v1ht7svvsqtdG4WshAG8mIMDPpY
	r5VJpHlfpuoRxOpuVH5H2RX7JTMvZVGtCdfiwbW0dt5D7RTPbc5imvlI+KOCtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 13:00:29 +0200
Message-Id: <DI6FRG24ML1X.2ZC8GRH4ATM19@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/3] oeqa/selftest/pkgdata: add multilib
 LICENSE consistency test
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jaeyoon.jung@lge.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260429143104.684760-1-jaeyoon.jung@lge.com>
 <20260429143104.684760-3-jaeyoon.jung@lge.com>
In-Reply-To: <20260429143104.684760-3-jaeyoon.jung@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 11:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236158

On Wed Apr 29, 2026 at 4:31 PM CEST, Jaeyoon Jung (LGE) via lists.openembed=
ded.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> Add a selftest to verify that pkgdata variables such as LICENSE
> are identical between base and multilib variants (e.g. lib32).
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---

Hi Jaeyoon,

Thanks for your patch.

It looks like the new test is failing on the autobuilder:

2026-04-30 08:14:06,391 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests.t=
est_multilib_variables (subunit.RemotedTestCase)
2026-04-30 08:14:06,391 - oe-selftest - INFO -  ... FAIL
...
2026-04-30 08:13:46,986 - oe-selftest - INFO - Build with multilib lib32 en=
abled
2026-04-30 08:14:06,391 - oe-selftest - INFO - 13: 19/53 356/686 (19.41s) (=
2 failed) (pkgdata.OePkgdataUtilTests.test_multilib_variables)
2026-04-30 08:14:06,391 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/pkgdata.py", line 237, in test_mult=
ilib_variables
    bitbake('systemd lib32-systemd')
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 236, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **o=
ptions)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  systemd lib32-systemd' returned non-zero =
exit status 1:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 1031 .bb files complete (0 cached, 1031 parsed). 3100 targets, 1=
45 skipped, 0 masked, 0 errors.
Removing 18 recipes from the allarch sysroot...done.
Removing 18 recipes from the qemux86_64 sysroot...done.
ERROR: Nothing PROVIDES 'systemd'
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_=
FEATURES: 'systemd usrmerge'
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_=
FEATURES: 'systemd usrmerge'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3649
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3770
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3880

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


