Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAE9F30922
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:26:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40283.1772702773917428184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bpoDFoDz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1FDA4E4256A
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 09:26:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99D905FDEB;
	Thu,  5 Mar 2026 09:26:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DBAE1036837B;
	Thu,  5 Mar 2026 10:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772702771; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=58DfDim+KlVXY59np2nrGKzzgjSFkTO2HfQZ0RCZSdM=;
	b=bpoDFoDz7VTV9HwIiOXIr48jWhrGVWK03rJHS2WiP+u6vb9GFGMNXY3igSxZQxJDpghUAn
	VPtqv9vUu188rgoN8NuQu1x6vGTK320CjRvKqB7irEu7iI+9vq8rumrda2q8fW3TyxSpRF
	EYSeNwDxQeYFLNm+Pj61+TQBKKNSWLJlFV14MYpJQhAeLlJT+gEBuCCudS06JqFiC1QIHp
	QbN8U/+sAUdlFEz/Ao2u+tR/kLFwhT8/olBax01kNyetN7a6zwtXIloxD7UQLYOWBVluUh
	wSrJlefkikw8SJIkFwwTSZoePOfZF4CgLYkrXCjwLY89vJl6MAbVV7l4NVziGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:26:09 +0100
Message-Id: <DGUQOQ0C16AT.FQCT2MG2U3K1@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] tcl: rewrite ptest (again)
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303172009.2064612-1-ross.burton@arm.com>
In-Reply-To: <20260303172009.2064612-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232469

On Tue Mar 3, 2026 at 6:20 PM CET, Ross Burton via lists.openembedded.org w=
rote:
> I discovered that running a single test case with tcltest doesn't let
> you know if the test failed or not, so when run-ptest moved away from
> using all.tcl[1] we were always marking the tests as passing.
>
> So, revert that commit and use all.tcl as a test runner. This is more
> noisy, but importantly will let us know if a test failed.
>
> Remove our un-upstreamable tweaks to the interp tests and instead skip
> the test that is known to be fragile, so we don't have to carry a patch
> forever.
>
> Don't install another copy of the entire Tcl library for the tests, as
> there is no real point.  This does then expose a bug in the tests where
> clock-59.2 assumes that it is running in a source tree and behaves
> differently if the system tzdata is being used.  This is being worked on
> upstream[2], for now skip this test.
>
> Clean up musl overriding so it's more resiliant.
>
> Exit 1 if a test fails.
>
> [1] oe-core 9c41887f2a ("tcl: improve test execution loop")
> [2] https://core.tcl-lang.org/tcl/tktview/51aa53616067cb63900b17ca1d71f07=
b094ffa1a
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

So now, of course we have ptest failures :)

Both for tcl and tcl8:

Failed ptests:
{'tcl8': ['tests/unixFile.test']}
...
Failed ptests:
{'tcl': ['tests/cmdAH.test', 'tests/unixFile.test', 'tests/zipfs.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3180
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3209

Ptest logs are there:

https://valkyrie.yocto.io/pub/non-release/20260305-50/testresults/qemuarm64=
-ptest/core-image-ptest-tcl8/
https://valkyrie.yocto.io/pub/non-release/20260305-50/testresults/qemuarm64=
-ptest/core-image-ptest-tcl/

https://valkyrie.yocto.io/pub/non-release/20260305-50/testresults/qemux86-6=
4-ptest/core-image-ptest-tcl8/
https://valkyrie.yocto.io/pub/non-release/20260305-50/testresults/qemux86-6=
4-ptest/core-image-ptest-tcl/

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


