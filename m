Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C85D3F099
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 17:03:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2469.1769619823822692876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 09:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bVeRaoyr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 97B0B1A2ACF
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 17:03:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DDE56071F;
	Wed, 28 Jan 2026 17:03:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F23B119A8805;
	Wed, 28 Jan 2026 18:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769619817; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rJMX1B3aDPphwkF1cPPId0IAagsPPHawUZuu/PkPPoY=;
	b=bVeRaoyr7Ip50pS3ZAJ2BR04Xhc+hGiQSOHrNFdgePls2kubvN6KNw0xror8PWb/l3FQEN
	lHqJXka6T8YZ/EuqxBeDtbsVcDQmpZuimzaH/0Z7MHfXkZ6Rw4JRtGLrEBk44z1v3oqWyd
	ldic0FYXkVAW+nA/idMMfEhNNSpslh0+L/nHllH33EExRwsqSd5tWI5GJp2RV9Y8SGG9zR
	WevLEifW5B6mUmFXBdJJxkJoBEV2w1EZJ2omsKNrNboSkBH/a+WUnU5kZw722rUUK5qIZ3
	O8Gg8moFpvqIbNt/v3wBfsU4grWSU6zFNYgvjPIxgie7JWRHxiEK1Y3zCWluGQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 18:03:35 +0100
Message-Id: <DG0DVCEFA5HX.L3N59E48OKKP@bootlin.com>
To: <leon.anavi@konsulko.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [[PATCHv2] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260127091829.3500551-1-leon.anavi@konsulko.com>
In-Reply-To: <20260127091829.3500551-1-leon.anavi@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 17:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230105

On Tue Jan 27, 2026 at 10:18 AM CET, Leon Anavi via lists.openembedded.org =
wrote:
> Upgrade to release 0.19.1:
>
> - Fix SeekableZstdFile write table entries on 32-bits architectures
>   when there is a huge number of entries
>
> From release 0.19.0:
>
> - The project has been completely refactored to use the Zstandard
>   implementation from the standard library (PEP-784)
> - The refactor has some minor impact on public APIs, such as
>   changing the exception raised on invalid input
> - Add backports.zstd dependency for Python before 3.14
> - Changes in build dependency: remove setuptools and C build
>   toolchain, add hatchling and hatch-vcs
> - Remove git submodule usage
> - Drop support for Python 3.9 and below
> - Use ruff as formatter and linter
> - Embed type hints in Python code, and check with mypy
>
> All ptests pass following python3 upgrade from 3.13.11 to 3.14.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---

Hi Leon,

Thanks for the new version.

It looks like this is breaking some ptest:

Failed ptests:
{'python3-pyzstd': 'START: ptest-runner\n'
                   '2026-01-28T16:27\n'
                   '\n'
...
                   "E   ImportError: cannot import name 'zstd' from "
                   "'compression' (unknown location)\n"

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2996
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1005

Test results can be found here:

https://valkyrie.yocto.io/pub/non-release/20260128-86/testresults/qemux86-6=
4-ptest/core-image-ptest-python3-pyzstd/
Test results for riscv64 and arm64 are not published at this time, as
some tests are still running. They will all end-up in https://valkyrie.yoct=
o.io/pub/non-release/20260128-86/testresults/

Can you have a look at these failures?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


