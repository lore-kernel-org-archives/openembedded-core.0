Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F2CCD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 05:18:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38857.1781155111501836770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 22:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AheIgDCG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D4A111A3878
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 05:18:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A96F06000D;
	Thu, 11 Jun 2026 05:18:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5372106B9BEB;
	Thu, 11 Jun 2026 07:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781155109; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OQsI8iB/zqSruzTvYsQph8pRhsYvMopxRYk769HwmjA=;
	b=AheIgDCGagFIGiSj3FOENSSjRYXkbQ5zG5m19JN2xwESKCyzUSCzjFBolx+UBIs4ZMdeIa
	ee/9wUuutyiNCxfm4BJzfqzQviaBXrhhW/nf9Vep0y5IYq/OGAcJA+QLdpoKdPv+eX6iOH
	fhouezHnUhFBomnD1dP25OEd/ca2ZvpmfJ9sXW7Hg3MD2uKPoOv6ZvNqg1WRtUOftkA4OG
	02RIrBGti5mNgM6yvgRqnvRUW4/LEdZp+AA8HsVNYpRb1b0tbdO5qGGfnOpzWAua01L+bc
	qbGd2AZ3YtmoizVJtILPYFCrmNg9cHTWLQ37kC6wGhaGGQRMOYttv0xANaqmaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 07:18:27 +0200
Message-Id: <DJ5YSG3O3Q40.3I3CWDSCY07FA@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Shilong.Jiao@eng.windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
 <18B75E544A0EA1A3.61226@lists.openembedded.org>
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com> <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com> <SJ0PR11MB48297A9B780C8DD714642A48801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB48297A9B780C8DD714642A48801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 05:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238420

On Thu Jun 11, 2026 at 4:06 AM CEST, Shilong via lists.openembedded.org Jia=
o wrote:
> Hi Mathieu,
>
> Thanks for testing and confirming the issue.
>
> I've investigated the test failures. The problem is that test_lazy()
> requires html.parser to not be in sys.modules, but when test_move_items()
> runs first (which happens in pytest's alphabetical order), it imports
> these modules, causing test_lazy() and the related test_move_items
> parametrized tests to fail.
>
> This appears to be a test order dependency issue in six's test suite
> itself, not specific to Yocto.
>
> I have two options to fix this:
>
> 1. Patch six's test_six.py to clean up module state before test_lazy runs
>    (but this modifies upstream test code)
>
> 2. Skip these problematic tests in run-ptest for now
>    (cleaner for Yocto, but reduces test coverage)
>
> Which approach would you prefer? Or do you have other suggestions?

I believe the best solution would be something like 1. , but submitting
the changes upstream, as it looks like we won't be the only one it might
help.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


