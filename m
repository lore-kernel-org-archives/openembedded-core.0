Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBE2C5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 18:23:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.403.1787250204076324477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 11:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=japBF5Ii;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABE661A1775;
	Thu, 20 Aug 2026 18:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F7115FF59;
	Thu, 20 Aug 2026 18:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EDC811C76674;
	Thu, 20 Aug 2026 20:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787250201; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ChM9AvxOCm6rBdZH4Eb5Sa8JoZgbbeE8HSrl1U6qx5s=;
	b=japBF5Iiq3OI9H7B+xysJpY8buRPs3j1ZKgFvXqbdJTHdTNjH4goq4GMV+MBS8d6oBbXq9
	pOeMzpZxzhAH07dVDez9eY0YtWiknLg1QofTLcfcBTSlwyzIo05fXbSfKCklNt3v99pFA8
	Cto6h5SxAgh1BMkXBaIua/pr/zTo+1I+gf5kE2IQj0zjNAvuY6E2JZC7+HHTBVSorJKrCv
	20jwvh95+PqwDUOP2SpsPvlaW8SAkuDMnlfX3rnyV1xE7t1XGm2+tMaGqo54yMXCPag1R4
	9T1w+O5Y6OtY7AmAP29U4DWGDGSAovk4UaiG8VTIKxiXQHREL4wvvrE/Tiqj4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 20:23:18 +0200
Message-Id: <DKTZBID643D1.32TNBAOVEGVF0@bootlin.com>
Subject: Re: [OE-core] [PATCH] kernel-fit-image: Don't add hash node when
 signing is enabled
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jonas.juffinger@liebherr.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260819-bugfix-dont-add-hash-node-to-signed-fit-images-v1-1-c0ffc1a0fc17@liebherr.com>
In-Reply-To: <20260819-bugfix-dont-add-hash-node-to-signed-fit-images-v1-1-c0ffc1a0fc17@liebherr.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 18:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243881

On Wed Aug 19, 2026 at 10:21 AM CEST, Jonas Juffinger via B4 Relay via list=
s.openembedded.org wrote:
> From: Jonas Juffinger <jonas.juffinger@liebherr.com>
>
> When configuration signing is enabled, mkimage does not fill
> the hash node even if it present. This causes the verification
> to fail with a "Bad Data Hash' error because the hash exists
> but it empty.
>
> This patch adds a check to only add the hash node if signing
> is not enabled.
>
> The example FIT from the official documentation also shows
> the configuration field with only the signature, without the
> hash field:
> https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configu=
rations
>
> Signed-off-by: Jonas Juffinger <jonas.juffinger@liebherr.com>
> ---

Hi Jonas,

Thanks for your patch.

I believe this is breaking some selftests:

2026-08-20 12:42:24,754 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs (subunit.RemotedTestCase)
2026-08-20 12:42:24,755 - oe-selftest - INFO -  ... FAIL
...
2026-08-20 12:42:24,755 - oe-selftest - INFO - 13: 7/33 386/767 (109.78s) (=
0 failed) (fitimage.KernelFitImageRecipeTests.test_fit_image_sign_initramfs=
)
2026-08-20 12:42:24,755 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 1412, in test_fi=
t_image_sign_initramfs
    self._test_fitimage(bb_vars)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 656, in _test_fi=
timage
    self._check_its_file(bb_vars, fitimage_its_path)
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/fitimage.py", line 538, in _check_i=
ts_file
    self.fail('Missing path in its file: %s (%s)' % (req_path, its_file_pat=
h))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buildtools/sys=
roots/x86_64-pokysdk-linux/usr/lib/python3.13/unittest/case.py", line 732, =
in fail
    raise self.failureException(msg)
AssertionError: Missing path in its file: ['/', 'configurations', 'conf-1',=
 'hash-1'] (/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-6=
69766/tmp/deploy/images/qemux86-64/fit-image.its)
...
2026-08-20 12:46:30,607 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs_bundle (subunit.RemotedTestCase)
2026-08-20 12:46:30,608 - oe-selftest - INFO -  ... FAIL
...
2026-08-20 12:48:03,259 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_sign_fit_image_configurations (subunit.RemotedTestCase)
2026-08-20 12:48:03,260 - oe-selftest - INFO -  ... FAIL
...
2026-08-20 12:48:58,824 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_sign_fit_image_individual (subunit.RemotedTestCase)
2026-08-20 12:48:58,824 - oe-selftest - INFO -  ... FAIL
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4439
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4614
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4664

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


