Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92B5CD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:22:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37495.1777983769009217206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 05:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NrWNmegZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABC784E42BC6
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 12:22:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 826AE6053C;
	Tue,  5 May 2026 12:22:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F73A11AD0100;
	Tue,  5 May 2026 14:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777983766; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5U3Rhk98ppzW0GaMlUbJfrA0ftEFW89iMbPzeocBVZA=;
	b=NrWNmegZYEXGVcjCSY3r+4JdbuyIV+hFO0zkU/dS0wcuC9oLII0kKyiLb1gDniTZAVHEeO
	G0SPyai74Tvdkor6Dfjhy5swiX0MXcDwMdRVqsWvUdQXdTsCme0SflpqBkB87qvRdFWVrh
	G3pQTSyzGccYPMQz1aQp/OAVzV94L/VaiDQrubrKQi+M0bFvJlflWG8CR9F/DybS19MnNL
	fUFoHJLQboSsuJ83OU6UY/p/YJiBW92uYdQj8lJZjUUdOO0xk4KozMfvHbZt5Nrdfs+JHV
	DEU+3woMdP46XXzWQL8EV9ZHn4nrmmSVNOQHgiJOZHCWtReV5Q4YC4KcnvodpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 14:22:44 +0200
Message-Id: <DIAQN5I2W6DN.367LM1KWJH8XC@bootlin.com>
To: <rybczynska@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] uboot-sign: sign SPL FIT configurations
 instead of images
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260504110803.67431-1-marta.rybczynska@ygreky.com>
In-Reply-To: <20260504110803.67431-1-marta.rybczynska@ygreky.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 12:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236487

On Mon May 4, 2026 at 1:08 PM CEST, Marta Rybczynska via lists.openembedded=
.org wrote:
> From: Marta Rybczynska <rybczynska@gmail.com>
>
> The SPL FIT signing patch was signing individual images, but not the conf=
iguration.
>
> Introduce signing of configuration with images under a separate option SP=
L_SIGN_CONF,
> enabled by default. It implies changes in the DTB content.
>
> The old behaviour is possible with SPL_SIGN_INDIVIDUAL, but should be rem=
oved in
> a subsequent patch.
>
> Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
> ---

Hi Marta,

Thanks for your patch.

It looks like this is breaking some of the selftests:

2026-05-05 09:18:40,306 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
2026-05-05 09:18:40,307 - oe-selftest - INFO -  ... FAIL
...
ERROR: u-boot-1_2026.04-r0 do_uboot_assemble_fitimage: Execution of '/srv/p=
okybuild/yocto-worker/oe-selftest-debian/build/build-st-2290997/tmp/work/qe=
muarm-poky-linux-gnueabi/u-boot/2026.04/temp/run.do_uboot_assemble_fitimage=
.3103596' failed with exit code 1
...
| Signature written to 'u-boot-fitImage', node '/configurations/conf/signat=
ure'
| Public key written to 'spl/u-boot-spl.dtb', node '/signature/key-spl-casc=
aded-oe-selftest'
| Signature check bad (error 1)
| Verifying Hash Integrity for node 'conf'... sha256,rsa2048:spl-cascaded-o=
e-selftest-
|  error!
| Verification failed for '(null)' hash node in 'conf' config node
| Failed to verify required signature 'key-spl-cascaded-oe-selftest'
| WARNING: exit code 1 from a shell command.
...
2026-05-05 09:19:22,128 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_atf_tee_fit_image (subunit.RemotedTestCase)
2026-05-05 09:19:22,128 - oe-selftest - INFO -  ... FAIL
...
2026-05-05 09:20:03,281 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_standalone_uboot_fit_image (subunit.RemotedTestCase)
2026-05-05 09:20:03,282 - oe-selftest - INFO -  ... FAIL
...
2026-05-05 09:20:46,932 - oe-selftest - INFO - fitimage.UBootFitImageTests.=
test_sign_uboot_fit_image_without_spl (subunit.RemotedTestCase)
2026-05-05 09:20:46,932 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3792
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3665

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


