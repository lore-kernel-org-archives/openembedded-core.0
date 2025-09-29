Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFE4CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 11:19:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.51199.1759144783291672854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 04:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UXafjq0r;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0447A4E40DF5
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:19:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC8B7606AE;
	Mon, 29 Sep 2025 11:19:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E41AD102F1838;
	Mon, 29 Sep 2025 13:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759144781; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wcNsh6rV0ZYeMX0g2T8+LJ+rZcVDq2l1kKPfANt8ERo=;
	b=UXafjq0rm40GzqearirD+zBeDCLK4tMg94A6mgRFRr/4ImuIW041oL+X7HLUIaifuxGrXt
	VyZ6ag1FLZkueTFYFUvSikhm5sjBQ6MaO7i1kQnwUjZndkgcvKywiRvUGv7cG8X6tYZjdq
	4rIWInVn/wj8qJyYW1ize4qr5/qHs+pLhp+KtTNvhMvP3FQoIqxZqC8vGOhzez0wmM25P5
	Qu5kenT6CrZPr6lFOEAwP0dHkwkCu56tHVaxyQeVtr9Sb/7jKWOGD67biC5AxoZEu8kNAd
	cSTHDNWJg2kVablcvRgXjgmWiy5s/uBARSpMqqu+ibMhQeyLeqimU/XMVo482A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 13:19:35 +0200
Message-Id: <DD58S1JBO8QQ.1O3KA6E2WCT9T@bootlin.com>
Subject: Re: [OE-core][PATCH] busybox: patch CVE-2025-46394
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250928221332.1308547-1-peter.marko@siemens.com>
In-Reply-To: <20250928221332.1308547-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224139

On Mon Sep 29, 2025 at 12:13 AM CEST, Peter Marko via lists.openembedded.or=
g wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit mentioning this CVE.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for your patch.

It looks like this is breaking some ptest:

AssertionError:
Failed ptests:
{'busybox': ['tar_Pax-encoded_UTF8_names_and_symlinks']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/543
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2324
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2363

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250929-53/testresults/qemuriscv=
64-ptest/core-image-ptest-busybox/
https://valkyrie.yocto.io/pub/non-release/20250929-53/testresults/qemux86-6=
4-ptest/core-image-ptest-busybox/
https://valkyrie.yocto.io/pub/non-release/20250929-53/testresults/qemuarm64=
-ptest/core-image-ptest-busybox/

Can you have a look at these, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


