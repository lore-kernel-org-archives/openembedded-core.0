Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6236C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:12:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5775.1790068343553635128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jd6lqpmP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 517641A0FCD;
	Tue, 22 Sep 2026 09:12:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25DBD60580;
	Tue, 22 Sep 2026 09:12:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 212F21032922B;
	Tue, 22 Sep 2026 11:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790068340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e06U/l+Td+mcZl++0EzzM8P/z1K+PXeWp45gOBn5TyM=;
	b=jd6lqpmPstJkuf8IHqbTCUqJ9kwpAApgMJkjsyHGLwy0SGeMPy5PjHTlijIyelxcY8KqTI
	FcSKe25K4r9lXgcs4RQQGEjzi8wZy/6Ixn/ig+n2iQ1VMsAhYWcU/9CxvSP+cVF5pYtYT9
	4Zd+SadwpxDsiXGRpdbD4YHnCsqHYGwFiPmYAG8cQMwBUCGJSJusgwr3vKRI5o68aYiDE6
	rfk20MxFm+qw8IeO8cx7qN3fdKn8yXvqw/tKZ/xpKrP7CSe3r0fpzkQd6yBolYqwhsxxKp
	0UbjWmgC/iPeHdoea5j0lYvbHkVtjRg0dP7ITTj3iwV3nd9cRKEU3f7mJ/ujRw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 11:12:17 +0200
Message-Id: <DLLQ9LLMY585.1LEHNNH5I80QP@bootlin.com>
Cc: "Randy MacLeod" <Randy.MacLeod@windriver.com>, "Shiva Komati"
 <Shiva.Komati@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] tiff: add ptest support
References: <20260915073518.2271284-1-HimaniRamesh.Barde@windriver.com>
 <20260921101102.2619364-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260921101102.2619364-1-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246391

Hi,

On Mon Sep 21, 2026 at 12:11 PM CEST, Himani Ramesh Barde via lists.openemb=
edded.org wrote:
> Enable ptest for tiff (libtiff), running the upstream test suite shipped
> in the source test/ directory: the C unit-test programs (check_PROGRAMS)
> plus the shell-script tests that exercise the tiff command-line tools.
>
> do_compile_ptest builds the test programs via "make check TESTS=3D" (buil=
d
> only, no run). do_install_ptest installs the compiled test binaries (real
> ELF from test/.libs, static testtypes from test/), the shell test scripts=
,
> the shared common.sh helper, and the images/refs data. common.sh is
> adjusted so the scripts find the installed tiff tools in ${bindir} rather
> than the build tree's ../tools, and run-ptest recreates the SOURCE_DIR
> path that test_ifd_loop_detection was compiled with so its images resolve
> on target.
>
> The list of C test programs is defined once in the recipe (TIFF_PTEST_PRO=
GS)
> and substituted into run-ptest at install time to avoid duplication. The
> wrapper emits automake-style PASS/FAIL/SKIP results and skips two tests
> whose optional support is not built in the default configuration: the JBI=
G
> test (jbig is not in the default PACKAGECONFIG) and the thumbnail test (t=
he
> thumbnail tool is not built).
>
> Registered in ptest-packagelists.inc under PTESTS_SLOW; the suite runs in
> roughly 30s on qemux86-64.
>
> Validated on qemux86-64: 17 C unit tests and 85 shell-script tests pass,
> 2 skipped (jbig, thumbnail), 0 failed.

This fails on different architectures on our test infra:

Failed ptests:
{'tiff': ['test_ifd_loop_detection']}

Full log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/9053625=
/raw_inline
Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/b=
uilds/4607
Other archs:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1249
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1234

Can you have a look?

Thanks,
Antonin

