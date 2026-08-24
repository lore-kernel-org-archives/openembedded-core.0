Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC223C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 06:28:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10903.1787552902188332660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 23:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L5UC0aJQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E60F94E4137D
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA22660378;
	Mon, 24 Aug 2026 06:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35EAB11C788F2;
	Mon, 24 Aug 2026 08:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787552895; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i4HaPs1rzHQx4yYDBViZPoZv0+zWf6/NGkktdfby+Qs=;
	b=L5UC0aJQztQJWsfMVY4OLznhLtHf7TmAhlSN1KF7qrh0Dto9P/qABJ5RVychFep7TX3c5L
	f4WCQF2h7pD5mELWiiKJIrxMbHAWiuByMsBBdSusus9GesG513HEJgtJhhz5Gxgc9mX/Bd
	7cZ8+z+m7jPelaH55TpZoUpK49qm9Qx8vJZUV+QCJ7lYJB/AQzeapp9vMoNmGD4WlzE5pn
	mj9stoNcBJ11RqMIhXRZQ3/kBWakHtm9gdM+Ve15FQWLBtvqMD9s/dMIArTAoz6hBPiIT9
	7kpKLbYhAN9OXamOebFOhF887A+nnupt/gDDD9F+wc4YL7JNt/BpUI612/k/Tw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 08:28:12 +0200
Message-Id: <DKWYM6BJ4WFN.3HWMLSORAJFPP@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <iwanicki92@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix
 lookup
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260822211734.3596359-1-iwanicki92@gmail.com>
In-Reply-To: <20260822211734.3596359-1-iwanicki92@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244064

On Sat Aug 22, 2026 at 11:17 PM CEST, iwanicki92 via lists.openembedded.org=
 wrote:
> Sub-variables (_name, _type, _comment, _id_email) were being looked
> up using the literal string "SPDX_IMAGE_SUPPLIER", "SPDX_SDK_SUPPLIER"
> "SPDX_PACKAGE_SUPPLIER", "SPDX_INVOKED_BY", "SPDX_ON_BEHALF_OF",
> instead of the value of those variables, breaking the documented
> ability to use a custom prefix (e.g. MY_COMPANY).
>

Hi,

Thanks for your patch.

This is breaking the spdx.SPDX30Check.test_extra_opts selftest:

2026-08-23 18:55:20,012 - oe-selftest - INFO - spdx.SPDX30Check.test_extra_=
opts (subunit.RemotedTestCase)
2026-08-23 18:55:20,013 - oe-selftest - INFO -  ... FAIL
...
2026-08-23 18:55:20,018 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 226, in test_extra_=
opts
    self.assertTrue(False, "Unable to find organization")
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 744, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : Unable to find organization

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4695
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4650
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4473

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


