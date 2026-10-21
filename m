Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11693.1792590461951432474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 06:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t7OouJmW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72CC44E4124D
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 13:47:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47E29606E3;
	Wed, 21 Oct 2026 13:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEB97103289F5;
	Wed, 21 Oct 2026 15:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792590458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o3mIjgmGBu/eD2Do5QxgVRG9KKsC4flAyWWJ/rrjDgs=;
	b=t7OouJmW9rxv76UhwhCETa6cylw6O+NQEew5FKDTQV6/vLBHU+PSIUgazmqPr/hfEDNcDZ
	4TqEIIY+oBsYx7AIi9bdukrcRPs5L6xwRT4HK/Nje5CRGX5Bi20O+NqK0lo2cDgn7Km7a9
	mKC46p1ucSxpvGyZTmBEZ2ns4i6nsANRKUVipHPNvwMNPhuV9agjh+60xQBIOKVE4TAZng
	8578wJjPkfWFfymOfWrVQD3dyOYW5ltGPh4bQTkj0wYKAQgA46NT34QV55iuZZ69lBD6GS
	row+N6/9b8rHtzUkj4uSw1T0jgwRMYh8UOXpAm0luBD2YPTwzLSJranSZqWx3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 15:47:36 +0200
Message-Id: <DMAKA726B8DQ.1SSH36F5YORHM@bootlin.com>
Subject: Re: [OE-core] [PATCH] checklayer: run bitbake once per machine for
 the machine tests
Cc: <jose.quaresma@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ricardo.salveti@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261020223910.539165-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20261020223910.539165-1-ricardo.salveti@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 13:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248401

On Wed Oct 21, 2026 at 12:39 AM CEST, Ricardo Salveti via lists.openembedde=
d.org wrote:
> With --machines, test_machine_signatures and test_machine_world each
> run "bitbake -S lockedsigs world" for every machine, with and without
> -k. When world can be built, -k makes no difference and both runs give
> the same signatures, so bitbake runs twice per machine for nothing. On
> meta-qcom, which tests 24 machines, these two tests take 1665 s of the
> 1818 s of the check.
>
> Cache the outcome of the run without -k on the test context, which is
> created for every tested layer, so that whichever test comes first runs
> bitbake and the other one reuses the result. When world can't be built,
> test_machine_signatures still runs bitbake again with -k for the
> signatures: get_signatures(failsafe=3DTrue) ignores the error of that
> run, which test_machine_world needs, so one -k run can't serve both
> tests. test_world and test_signatures have the same duplication without
> a machine; that is left for a separate change.
>
> Tested on meta-qcom (127450527f) with 16 bitbake threads, time in the
> two tests: 24 machines 1664.8 s -> 969.9 s, three machines 229.9 s ->
> 140.5 s, with the same results and logs. Adding a machine that breaks
> world, one with different zlib CFLAGS or one that doesn't parse to the
> three machines gives the same verdicts and errors as before.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---

Hi Ricardo,

Thanks for your patch.

I can see it conflicts with the patch from Otavio Salvador sent a few
days ago. I believe part of the points addressed by both patches are
similar. Any thought on that?

https://lore.kernel.org/openembedded-core/20261019143924.1521981-4-otavio@o=
ssystems.com.br/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

