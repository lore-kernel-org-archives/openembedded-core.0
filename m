Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152BDC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 06:36:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8919.1789540608090797804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 23:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rHgFZnUZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9AEB01A0887;
	Wed, 16 Sep 2026 06:36:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D34960337;
	Wed, 16 Sep 2026 06:36:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7C8511C7AFD8;
	Wed, 16 Sep 2026 08:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789540604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+cIxY2MJDDjBxUxKnecmipIkZW7YYSXWbiNvhF5ZEVU=;
	b=rHgFZnUZoDEleyLa7ckepDPk4/ISV0ofKv9phzuUpHNjmkzOKaQegZqvGZeYfQBAY8Ds76
	PztCOGaa9wACDvzPeWjO4HqyMTbugMlxYHwcAK0Mt0u00+9pHMSWaM88Uplgh35fuucE5F
	qg/zZhTQXavkPgWVWTIvzb8UuTfDSgEMdPY3bO8L4cfm6yct0UMRI0BclsNDCV/buBDnN/
	OBzxoGU+l189FlBzA5U+7DGmFrG/bPv6h5g5P1ElWQhfY5TMModkNkoGqenPZ8al23i9D7
	xRvxcozuszmguAktfmPQrCEXumDsshHkTVbrDkzQwUjl+zO5Ewahtqi+KUYY0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 08:36:42 +0200
Message-Id: <DLGJ77DHTM2P.IQVGF1XGUBW1@bootlin.com>
Subject: Re: [OE-core] [PATCH] tiff: add ptest support
Cc: "Randy MacLeod" <Randy.MacLeod@windriver.com>, "Shiva Komati"
 <Shiva.Komati@windriver.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260915073620.2271352-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260915073620.2271352-1-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245927

Hi,

On Tue Sep 15, 2026 at 9:36 AM CEST, Himani Ramesh Barde via lists.openembe=
dded.org wrote:
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
> The run-ptest wrapper emits automake-style PASS/FAIL/SKIP results and
> skips the JBIG test (JBIG is not in the default PACKAGECONFIG) and the
> thumbnail test (the thumbnail tool is not built by default).
>
> The recipe is registered in ptest-packagelists.inc (PTESTS_SLOW), and
> buildpaths QA is skipped for the -ptest package since the compiled test
> binaries legitimately embed build paths.
>
> Validated on qemux86-64: all C tests and shell tests pass, 2 skipped
> (jbig, thumbnail), 0 failed.

This fails on:

- riscv64: https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/2415
- arm64: https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds=
/4537
- x86-64: https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/build=
s/4564
- musl: https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds=
/1209
        https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds=
/1192

Can you have a look?

Thanks,
Antonin

