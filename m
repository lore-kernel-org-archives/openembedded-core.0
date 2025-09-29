Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95720CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:14:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.48700.1759133688681344272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GEHy1RUl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B25AC00794
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5C85606AE;
	Mon, 29 Sep 2025 08:14:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBBBD102F184A;
	Mon, 29 Sep 2025 10:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759133686; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rQ6Ma6p0h9omh7GL/U5sYthjy/xn9+TTMzM7w9zlo/8=;
	b=GEHy1RUl0UVR8W6XtS+UcFq8+0sHTuI53907cu9ziyjYLGntjtOXMzF0sE35fGv2tD3xkH
	GRWT80h1Uq7MSiDLgAmDwwb/XEH2wkrR0XghBoDZ8ZcVGDJTBiNAtbwIAbAdoH9DgkgqHn
	dut4jxeN0GFs2ro0V12GcbGNmpTHD1ku67WWWvtvN6gcUpefdf9AdUirgjzzAcTqGV2F/X
	esQ4BE0uL8J3Z1jPyF79zJPLnqLmG1caNmFrqfA1CxJzODrec52Vc39xbO0nIHlL/FpY4E
	TERQ0LJ4IjPgvDxLrqFasqy2fEDYwHti2qhKsT4yfnWekrkQbhzOIG7uoUy3Jw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 10:14:45 +0200
Message-Id: <DD54UINT52DH.VW1D1BWNHWD6@bootlin.com>
Subject: Re: [OE-core] [PATCH] perf: do builds in a clean build tree
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250925152651.3059868-1-ross.burton@arm.com>
In-Reply-To: <20250925152651.3059868-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224123

On Thu Sep 25, 2025 at 5:26 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Set B to WORKDIR/build and clean that on configure so we ensure that the
> build tree is clean.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like this is breaking some arm64 builds:

ERROR: perf-1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/qe=
muarm64-alt/build/build/tmp/work/qemuarm64-poky-linux/perf/1.0/temp/run.do_=
compile.221036' failed with exit code 1
...
| make[2]: *** No rule to make target 'tools/arch/arm64/include/uapi/asm/un=
istd.h', needed by '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/t=
mp/work/qemuarm64-poky-linux/perf/1.0/build/arch/arm64/include/generated/as=
m/syscalls.c'.  Stop.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2440
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2487

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


