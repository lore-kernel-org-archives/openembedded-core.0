Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47393CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 06:25:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13427.1781763938568031379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 23:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G7RobHm6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3B7D31A39F1
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 06:25:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E3BE5FF03;
	Thu, 18 Jun 2026 06:25:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DD46106C88A7;
	Thu, 18 Jun 2026 08:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781763935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8LGOkg6Zn1yTr6TnFgjeFhmOQ5RapNRnZPpD+DiEP6M=;
	b=G7RobHm6IDPAAadapZUDGFVjmy4kFZp2mFjgGK0YqhyeFS4puyoKaAUlXfRoQG18+JlDKR
	sS3VXjRn7gu3Eik9qUAZ4Un4PRZ2TrhdIoAGjiqnBvCzTIXZA9h5tIF4JjEmR+2feHJsSc
	M2JDkTgysv90hKq30YcrctkvJ3DBtzgnx1gZ47xRwaO1i1wj2vvk2+J2yeIPybIsnTIxjh
	QCQ1UeHeV8KD5ZWwrp5SgGj7y+C4xow07ZrbDEJd2nlIQz+dBWdu7mnkwDGMp0ftAXZPv8
	9LtTCs9DftNQLSVpRgrqeD0PWNdzVvvQfje4KQQfWs9HKSkMLofzEiR/hsMEdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 08:25:30 +0200
Message-Id: <DJBYLLSOVDCK.3V9DIPDH2YV6M@bootlin.com>
To: <marek.vasut@mailbox.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fit-image.bbclass: Fix operation with
 KERNEL_DTBVENDORED = "1"
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Yoann Congal"
 <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260616214945.40714-1-marek.vasut@mailbox.org>
In-Reply-To: <20260616214945.40714-1-marek.vasut@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 06:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239053

On Tue Jun 16, 2026 at 11:49 PM CEST, Marek Vasut via lists.openembedded.or=
g wrote:
> In the case KERNEL_DTBVENDORED =3D "1" , the fitImage configuration
> subnode names used to contain the vendor prefix in OE 5.0 , e.g.:
> "
> $ mkimage  -l fitImage
> ...
>  Configuration 0 (conf-freescale_imx8mn-board.dtb)
>                        ^^^^^^^^^^
> ...
> "
>
> With OE 6.0 this is no longer the case and KERNEL_DTBVENDORED =3D "1"
> and KERNEL_DTBVENDORED =3D "0" behave exactly the same way:
> "
> $ mkimage  -l fitImage
> ...
>  Configuration 0 (conf-imx8mn-board.dtb)
> ...
> "
>
> Users depend on the correct configuration subnode names as those
> are used in the U-Boot "bootm" command when booting fitImages.
>
> Fix this by converting each entry in the KERNEL_DEVICETREE list
> into the configuration subnode name by replacing all of its path
> separators with underscores.
>
> Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image imple=
mentation")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> ---
> NOTE: This should ideally be added into OE 6.0 too
> ---

Hi Marek,

Thanks for your patch.

It looks like this is breaking the
fitimage.KernelFitImageRecipeTests.test_fit_image_ext_dtb_dtbo selftest:

2026-06-17 18:15:46,751 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_ext_dtb_dtbo (subunit.RemotedTestCase)
2026-06-17 18:15:46,752 - oe-selftest - INFO -  ... FAIL
...
2026-06-17 18:15:46,752 - oe-selftest - INFO - 9: 36/79 281/688 (28.27s) (0=
 failed) (fitimage.KernelFitImageRecipeTests.test_fit_image_ext_dtb_dtbo)
2026-06-17 18:15:46,752 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1259, in test_fi=
t_image_ext_dtb_dtbo
    self._test_fitimage(bb_vars)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 646, in _test_fi=
timage
    self._check_its_file(bb_vars, fitimage_its_path)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 566, in _check_i=
ts_file
    self.assertTrue(found_all,
  File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : Fields in Image Tree Source File /srv/p=
okybuild/yocto-worker/oe-selftest-debian/build/build-st-2472397/tmp/deploy/=
images/qemux86-64/fit-image.its did not match, error in finding fdt =3D "fd=
t-test-overlay.dtbo";

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4062
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4140
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3912

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


