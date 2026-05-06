Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE35CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 16:19:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22549.1778084378159253914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 09:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=02YkxMku;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 238B81A354C;
	Wed,  6 May 2026 16:19:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4DA16053C;
	Wed,  6 May 2026 16:19:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BB6A107F1CAA;
	Wed,  6 May 2026 18:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778084375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N6tcAlf1xzlNsFw9gf4gULhXZ0TEB7TjzJfTNhuuQfU=;
	b=02YkxMkudlrEXHzVZvS2zMelaiuj0uq6IhyIYCeLNSyyenXOhMVIbx8qjPOQpzxQGF0g57
	jbNuhvCQlZ7d7+xoAUY5uo1wsEZpt2xNZlTbhx4mH3T3vlNEQVN0gygNFFxl55HeL+lxfa
	sJDrYBJFbyskn/0IBOenZc6GL+3kVLIKorIVi+1nWtkdWnV0e/ok3bI9jHMWoIcZO4kgHc
	6wfqVQjOEyKqiy1qht5TEKHmKteCx/r74qn7sqCVU4Q/q2y3sSqJtavJl5L7+cn48T66d8
	8fnLxnIBOAvmWspg0ckvlfVDlfwmlMJqQUt0ooVOJa2o117zGjPHsuRJ3O/ZrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 18:19:33 +0200
Message-Id: <DIBQB0RVEATG.2C6WJ1E87VNPL@bootlin.com>
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v1] gmp: add ptest support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260506074618.15882-1-pratik.farkase@est.tech>
In-Reply-To: <20260506074618.15882-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 16:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236543

On Wed May 6, 2026 at 9:46 AM CEST, Pratik Farkase wrote:
> Add ptest support for gmp, running the full upstream unit test suite
> (200 tests) covering mpz, mpn, mpf, mpq, rand, misc, and C++ bindings.
>
> Tests are compiled with 'make check TESTS=3D' to build without executing,
> then installed via libtool to the ptest directory preserving the upstream
> subdirectory structure.
>
> Tested on qemux86-64 with ptest-runner: 200 PASS, 0 FAIL (268s).
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for your patch.

I believe we are seeing some failing tests on the autobuilder:

AssertionError:
Failed ptests:
{'gmp': ['mpn/t-addaddmul']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1552
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/367
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1553

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260506-64/testresults/qemuriscv=
64-ptest/core-image-ptest-gmp/
https://valkyrie.yocto.io/pub/non-release/20260506-64/testresults/qemuarm64=
-musl-ptest/core-image-ptest-gmp/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


