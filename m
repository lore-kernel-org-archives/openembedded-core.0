Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D20C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 06:59:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1584.1788850764020071555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 23:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YZfH/wNt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF2D24E41587;
	Tue,  8 Sep 2026 06:59:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C794603C4;
	Tue,  8 Sep 2026 06:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8976D11C7AF32;
	Tue,  8 Sep 2026 08:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788850756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EnX8FcTFhvQuVcvaryNDIhPJrqqtddd+r/JnuY4BVro=;
	b=YZfH/wNtMIo3VCUhaztES9EziZhxfr/GMxN3OFlfeSUuR+Et+uXF197O9fFGpdRKE0CtzA
	M/ZVJi+h6k2vOPQIONXaITU1v7zfq3t8Kk0piv5jFb8RmBtOR+yvDpaF04L2ffO7lO9zeA
	pXHELG4En7v3ZbIvXr1F1cFxgijR4/2NNfgeZ94ufGDazJK/GvxRJcsFgSMFzqhx9DBKi+
	7mSmaoCUWGvsM91CTxRszvV68I1zf3xasuxc94D1MZl7u8zdTjUmBm6V0CdWg29afuynK7
	hca1Csrbrrr4eNGcSJ0AUrGO0qAF7rKCfQCFTieIylhyslxA7pLCTTRFemEeXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 08:59:13 +0200
Message-Id: <DL9QO37EJTBL.1CBZPRPTN8QNP@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] systemd: re-enable ptest support
Cc: <Randy.MacLeod@windriver.com>, <ross.burton@arm.com>,
 <jose.quaresma@oss.qualcomm.com>, <raj.khem@gmail.com>,
 <richard.purdie@linuxfoundation.org>, <Shiva.Komati@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 06:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245332

On Mon Sep 7, 2026 at 1:45 PM CEST, Himani Ramesh Barde via lists.openembed=
ded.org wrote:
> ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
> when the recipe switched to meson, as there was no easy way to install
> and run the test suite. Current systemd and meson resolve this: the
> meson 'install-tests' option installs the unit-test binaries and a
> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
> run-unit-tests.py already emits PASS:/SKIP: results per test.
>
> Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests
> and -Dinstall-tests and pulls in python3-pefile-native (needed to build
> the boot hwids test). do_install_ptest relocates the installed tests
> into ${PTEST_PATH} and drops the mkosi/integration-tests harness (which
> needs a booted system). A run-ptest wrapper drives run-unit-tests.py,
> and systemd is registered in ptest-packagelists.inc.
>
> The test/units integration tests, which require a booted system, are
> out of scope here and can be addressed separately.
>
> Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 342
> unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} and
> systemd-ptest packages cleanly with no QA errors.
>
> [YOCTO #16386]
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---

Hi Himani Ramesh,

This is failing on the autobuilder, as we are running ptests using the
poky distro, but poky does not have systemd DISTRO_FEATURES. I'm not
sure how we can fix this, but we might need to hack a bit.

Do you know how it was working before it was dropped in 2018?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


