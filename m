Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF20C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:32:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33498.1790494341482533433
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aZllZQns;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B695CC62212;
	Sun, 27 Sep 2026 07:33:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0D6D604FF;
	Sun, 27 Sep 2026 07:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB4F0102F1E31;
	Sun, 27 Sep 2026 09:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790494338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NVMbteg07domLtieatdNW+CBNLdYfKqnSmLkNbQGTiE=;
	b=aZllZQns0MmBtdRk0cbBrsWpsG+ibg+VKHWwqRDiUBCotRCzwIZZo7gBQlKktzwZf3uql/
	BEfd4mdEpp+pWOHmCXioQX1lsUtyfp/E0oZx3eiJwpg+ZzWiTlOSqfN3GLgs6eUgcXcQQ0
	sbsqAPlhQDTV2YMIwZulVBTWqJMNMmZHWacLYERS5lsn1JccsTjuiV8eIhF1+4wAI182b+
	G/2SfMt3V85RaHDJSGLWzU588bv5cdFJvn5Vsd28kYLDf9hexWDj7TyV09tWH0TPrSrqeF
	xOmXxQm7nuWQHF7DgeQKvqVhu9v5GEkiEIHEqsE5UWZNw7zgM04sZwNVyAy1GQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 09:32:14 +0200
Message-Id: <DLPX9PXZH64F.1NP6JA01V1H00@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] tiff: add ptest support
Cc: "Randy MacLeod" <Randy.MacLeod@windriver.com>, "Shiva Komati"
 <Shiva.Komati@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <HimaniRamesh.Barde@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260921100952.2619282-1-HimaniRamesh.Barde@windriver.com>
 <20260925080552.4144665-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260925080552.4144665-1-HimaniRamesh.Barde@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246649

On Fri Sep 25, 2026 at 10:05 AM CEST, Himani Ramesh Barde via lists.openemb=
edded.org wrote:
> Run the libtiff test suite as a ptest: the C unit tests (the automake
> check_PROGRAMS) and the shell tests that drive the tiff command-line tool=
s.
>
> do_compile_ptest builds the test programs. do_install_ptest installs the
> binaries, the shell scripts, the common.sh helper, and the images/ and
> refs/ data, and points common.sh at the installed tools in ${bindir}
> instead of the build tree. The recipe lists the C programs once, in
> TIFF_PTEST_PROGS, and fills that list into run-ptest at install time.
>
> One test, test_ifd_loop_detection, opened its images through a build-time
> path instead of relative to the current directory, so it failed once
> installed. A small upstream patch makes it read the images from ".", like
> the other tests, so it now passes on every architecture.
>
> run-ptest prints automake-style PASS/FAIL/SKIP lines. Two tests skip in t=
he
> default configuration:
>
>   - the JBIG test, because jbig is not in the default PACKAGECONFIG
>   - the thumbnail test, because the thumbnail tool is not built
>
> Registered under PTESTS_SLOW in ptest-packagelists.inc; the suite runs in
> about 30s on qemux86-64.
>
> Validated on qemux86-64:
>
>   - 17 C unit tests pass
>   - 85 shell tests pass
>   - 2 skip (jbig, thumbnail)
>   - 0 fail
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> ---

Hi Himani Ramesh,

Thanks for the new version. It looks like the embedded patch fails to
apply here:

ERROR: tiff-4.7.2-r0 do_patch: QA Issue: Fuzz detected:

Applying patch test_ifd_loop_detection-relative-images.patch
patching file test/test_ifd_loop_detection.c
Hunk #1 succeeded at 45 with fuzz 2 (offset 11 lines).

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4740

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


