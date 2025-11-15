Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D18CEBF73
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 19:18:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14940.1763234301279221134
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 11:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qCNHCOfX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EC1D4E416E3
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 19:18:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCCB4606F6;
	Sat, 15 Nov 2025 19:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BFBF103713B0;
	Sat, 15 Nov 2025 20:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763234298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7nhSUwZ+CRvXAb54hx/sHvnTOuz8jXMnswg0Ix4QBdA=;
	b=qCNHCOfXkX3UMQBRpeHwTXK0MHvZBBCLsgrT0EhdmI6UdKZiHb6YXKMPLrJggoc1z+jQow
	tRBPKnZCA8ftmKIPGF1kANda4Y/8PxhKiv3cNvZqG+ojFJ2DPkejctJXnSHVmC1LPel3kY
	72qlL5qiszp6l01xsEZdGEvPPJ/72G4g6ADbqLBhXuJX9bUWcWg/GtY4D/dFgiv5Zz6chL
	VHPdojpd2Yc5dV253sZBsr5Zeh/50f29nK62lwyiQGPRGlanNeTn3kvV8937n6BJkDX4YS
	hXoj+EEpbelXwXBjOLJcCoOqnIkiHk5h7xOIO6qAv6GUEtAI23iLm8FCRHeVxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 20:18:13 +0100
Message-Id: <DE9IE460UL2U.310AM5A9ZWXKN@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [OE-core 1/2] spdx30_tasks: Fix
 SPDX_CUSTOM_ANNOTATION_VARS implementation
Cc: "Stefano Tondo" <stefano.tondo.ext@siemens.com>,
 <peter.marko@siemens.com>, <adrian.freihofer@siemens.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251113184151.511039-1-stondo@gmail.com>
 <20251113184151.511039-2-stondo@gmail.com>
In-Reply-To: <20251113184151.511039-2-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 19:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226464

On Thu Nov 13, 2025 at 7:41 PM CET, Stefano Tondo via lists.openembedded.or=
g wrote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Fix incorrect function call when processing SPDX_CUSTOM_ANNOTATION_VARS.
> The code was calling new_annotation() as a standalone function, but it
> should be called as a method on the build_objset object.
>
> Error:
>     new_annotation(d, build_objset, build, ...)
>
> Corrected to:
>     build_objset.new_annotation(d, build_objset, build, ...)
>
> This bug would cause a NameError at runtime if SPDX_CUSTOM_ANNOTATION_VAR=
S
> was set to a non-empty value, preventing SPDX document generation.
>
> The fix aligns with how new_annotation() is called elsewhere in the
> codebase and matches the SBOMObjset class method signature.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---

Hi Stefano,

Thanks for your patch.

It looks like the new test is failing on the autobuilder:

2025-11-15 11:49:34,729 - oe-selftest - INFO - spdx.SPDX30Check.test_custom=
_annotation_vars (subunit.RemotedTestCase)
2025-11-15 11:49:34,730 - oe-selftest - INFO -  ... FAIL
...
2025-11-15 11:49:34,730 - oe-selftest - INFO - 3: 37/41 297/643 (40.52s) (0=
 failed) (spdx.SPDX30Check.test_custom_annotation_vars)
2025-11-15 11:49:34,730 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 330, in test_custom=
_annotation_vars
    self.assertIsNotNone(build, "Unable to find Build element")
  File "/usr/lib/python3.12/unittest/case.py", line 1287, in assertIsNotNon=
e
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: unexpectedly None : Unable to find Build element

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2835
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2699
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2593

Can you have a loot at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


