Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26138EE020A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:54:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65591.1767106450066059069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yknDAMMJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E377B4E41E85
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B19726072C;
	Tue, 30 Dec 2025 14:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 300EA113B0392;
	Tue, 30 Dec 2025 15:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767106447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7uSGrlIzKrnyffQE8goI441Lp3e35AUc0nDRxHscic4=;
	b=yknDAMMJfk65Go719dZ9gLMkjO/Pimx3ZiuBOHhcyp7fWosUWOLND7WwewVN1pdNkk6lOs
	iyMmxEUwnjQeOUICdOHFvyhxPojd9be9soGhZqdvhbvFcRd3nNBIfIfeRQJuP0uph3lYv8
	RpBEq2IgqTVNYS1hL7awh1iWwXBPTJ1i9qxZJ3FTSP3cfG4E73yoLTMT1F9JwKvUdrDDVS
	lGLGfWlVoUEuoO4ZDY/08LaTveQymsWxDot+6ui0rJ5V86UvqphTqAZPIx5POpMUVBUtYD
	EVyxqRBq/KoDweqebL4EevFG0A+YwBIp0wS8dfaHcxDMj75UOD/REuNMmtCmzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Dec 2025 15:54:05 +0100
Message-Id: <DFBMYE2AZW0G.2OICW0SD4EGBV@bootlin.com>
Subject: Re: [OE-core] [PATCH] libnl: upgrade 3.11.0 -> 3.12.0
Cc: "Alexander Kanavin" <alex@linutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251229124538.1535197-1-alex.kanavin@gmail.com>
In-Reply-To: <20251229124538.1535197-1-alex.kanavin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228682

On Mon Dec 29, 2025 at 1:45 PM CET, Alexander Kanavin via lists.openembedde=
d.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Remove a patch as the issue has been fixed upstream.
>
> Backport a couple patches to address ptest issues due to missing
> kernel modules (they're not built in standard linux-yocto):
> https://github.com/thom311/libnl/issues/448
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---

Hi Alexander,

Just some note: it looks like some ptest is failing intermittently on
ARM64 after this upgrade. I'm not sure how bad the whole situation is,
but it's bad enough that I already saw it fail twice today:

Failed ptests:
{'libnl': ['nl-test-util.c:Core:route_1_The_list_of_2_routes_did_not_find_a=
_one-to-one_match_with_the_list_of_3_expected_routes']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2800
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2802

Yet on both times, the rebuild succeed. No issues on other
architectures.

I will keep the patch in my branch, so I will try to monitor the failure
frequency.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


