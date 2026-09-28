Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF546CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:11:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56011.1790593879586973167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SYpU1lkC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5ED8A1A0FDB;
	Mon, 28 Sep 2026 11:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C981601BD;
	Mon, 28 Sep 2026 11:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05F50102F1ED3;
	Mon, 28 Sep 2026 13:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790593872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OSau7TWrxDxK0dDV8EIGmOyioLFlkZpTLoUpiNupLug=;
	b=SYpU1lkCqDSDbrDIG/9RmmmaAqbiIoZINfQT3LOzGD5p6nUQQ5u785hGh1hfTn4oowcplI
	EgAMqtRM4hjn+kbr5ARSxhY+G6Key89E8YGvT70KlgBzjsjpCABHNMkSNw6W6tf/Shhdcb
	/rJPg8ugp2Og+21Gp8tnjRcehDbdwu/e3qALGa2eOeFLE90f2JC3VJemV6035J5Wj/PmK2
	sUwhchKWKhRg0DOXOn4rcddZJFnqcPLry/Apy73auL0ieR8tfUz4U4yC8qHw669/zCfVYT
	S0saWhp9CJGSp4Zxsp6ckrp1o3IzrdBDqXzKW1a/GuCTdUs91AigW3iXVw7XXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 13:11:10 +0200
Message-Id: <DLQWJW3MP16M.122HC23ZP8FQS@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] elfutils: Fix backtrace ptests on musl
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260928050036.3640902-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260928050036.3640902-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246752

On Mon Sep 28, 2026 at 7:00 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> musl is built with -fno-asynchronous-unwind-tables, so libc.so carries
> almost no .eh_frame and its CFI only lives in .debug_frame. Without it th=
e
> unwinder cannot get out of abort () and run-backtrace-dwarf.sh fails with
> "No DWARF information found". Add musl-dbg to the ptest dependencies, lik=
e
> glibc-dbg for glibc.
>
> run-backtrace-native-core.sh then unwinds the thread correctly but loops =
on
> musl's __clone, which has no end-of-stack CFI. That is the same reason
> run-backtrace-native.sh is already an expected failure on musl, so mark t=
he
> core variant as one too.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

I suspect this is breaking elfutils ptest on qemux86-64:

AssertionError:
Failed ptests:
{'elfutils': 'START: ptest-runner\n'
             '2026-09-28T06:47\n'
             'make  \\\n'
	     ...
	  '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
             '2 of 258 tests did not behave as expected (2 unexpected passe=
s)\n'
             '(44 tests were not run)\n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1263

Ptest logs can be found here:
https://valkyrie.yocto.io/pub/non-release/20260928-40/testresults/qemux86-6=
4-musl-ptest/core-image-ptest-elfutils/

It does look like it reproduces on every builds, but does not affect
other platforms.

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


