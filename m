Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFD4CF3182
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 09:11:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2763.1763543455345853436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 01:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Tbno9Iob;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3145F1A1BCA;
	Wed, 19 Nov 2025 09:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBC8460720;
	Wed, 19 Nov 2025 09:10:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB3A3103719DE;
	Wed, 19 Nov 2025 10:10:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jiFPENNbvMbFDwUADanAK6QCavAFj1R0PE3Ubx0Qxyc=;
	b=Tbno9Iobu2CZG2zdmIdgUjK0QLnAI2D9GpopEpXm1oBhhB66lquAgb9bAsy845yfuZ0z8I
	CsEGq3f8eqFI3tII9L0Qv+eCTF8DkOU36ZDhMgh1M4fCwVyvWyRlF/3oht9+lJj3XUmlGY
	jQtM/KLuYUuejpgsxv6nU0iEa60o5quqG9ylHqPv81IHShSKVpK3vM/F8Mh2PUJqxNuaxM
	gJqSZH4nTs1r3JAbyikY+mtFRd4lQ6ajSh/qvqq0ZtoflXILHUjt1SZAFNrjvuJHCOwODX
	BAzqmWC49Qe28ObeZWV3s+VITB0GyXKoHnLXPYwEnsW1EduMmiKYQwu8XNljEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 10:10:49 +0100
Message-Id: <DECJZ8GOEY2L.1LKIW4KZNILBR@bootlin.com>
Subject: Re: [OE-core][PATCH v2] spdx30_tasks: Fix
 SPDX_CUSTOM_ANNOTATION_VARS implementation
Cc: <Peter.Marko@siemens.com>, <adrian.freihofer@siemens.com>, "Stefano
 Tondo" <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Stefano Tondo" <stondo@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251117130451.1711036-1-stondo@gmail.com>
In-Reply-To: <20251117130451.1711036-1-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226543

On Mon Nov 17, 2025 at 2:04 PM CET, Stefano Tondo wrote:
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
>
> ---
> Changes in v2:
> - Fixed test bugs: corrected SPDX file path from packages/ to recipes/
> - Fixed test bugs: removed parentheses from objset.objects() call
> - Fixed whitespace formatting in test code
> ---

Hi Stefano,

Thanks for the v2, but it looks like the test is still failing with a
similar error:

2025-11-18 18:36:56,500 - oe-selftest - INFO - spdx.SPDX30Check.test_custom=
_annotation_vars (subunit.RemotedTestCase)
2025-11-18 18:36:56,500 - oe-selftest - INFO -  ... FAIL
...
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/spdx.py", line 330, in test_custom_=
annotation_vars
    self.assertIsNotNone(build, "Unable to find Build element")
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1309, in assertIsNotNon=
e
    self.fail(self._formatMessage(msg, standardMsg))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 732, in fail
    raise self.failureException(msg)
AssertionError: unexpectedly None : Unable to find Build element

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2716
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2610
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2852

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


