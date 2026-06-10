Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D6DCD8C90
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 17:11:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25694.1781111465509476109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 10:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U04aJ8Hg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7ECB9C4FEE2;
	Wed, 10 Jun 2026 17:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E99E5FFC9;
	Wed, 10 Jun 2026 17:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC98C106B9960;
	Wed, 10 Jun 2026 19:11:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781111463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T0rRvwhwv5nvJYLhb2Y8xsIDPDWHe77D+8ntJtyWb9g=;
	b=U04aJ8HgzXmvkYbW8Bg6JVc5c/jkyLmLd6XpAaEvAK0/w9TL2aPlSYluw8Ev6XiTkpeYu4
	6PlIFHdmwsbn5ISkY3X5wTCqFOAPuWQpx+Odyv7MHeydXsP3rzOogdQVoPEdxmXKut4dce
	urCu2JuqHuE162MCFYfW0WdA+ejs0bhr76aPEfNpTKPhJ7P1NEsLYkCxrWfqfqLwMdRse6
	eUib/ZSRqx3qqVmPFZvSF4RPVT2+3k2/QazeiaiUTmSHWzlBTY7VC6x10/bdhVCpKqFkLz
	GVKBP6wPNMR1bzkzUQG+epF1HY7LwKjUzFhvP6ybB6hgGyv2TvtrV9xrI+MOaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 19:11:01 +0200
Message-Id: <DJ5JBHEBG48P.1M8Z5YPHYEXTK@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adityags2004@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] patchtest: warn if Upstream-Status is after
 patch scissors
Cc: <tgamblin@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609084704.2765-1-adityags2004@gmail.com>
In-Reply-To: <20260609084704.2765-1-adityags2004@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 17:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238390

On Tue Jun 9, 2026 at 10:47 AM CEST, Aditya GS via lists.openembedded.org w=
rote:
> Detect cases where Upstream-Status is placed after the patch
> scissors ("---") and emit a warning instead of failing.
>
> Such placement may be intentional in some workflows to avoid
> including the tag in upstream commits.
>
> Signed-off-by: Aditya GS <adityags2004@gmail.com>
> ---
>  meta/lib/patchtest/tests/test_patch.py | 187 ++++++++++++-------------
>  1 file changed, 89 insertions(+), 98 deletions(-)
>
> diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/=
tests/test_patch.py
> index f427b7a8b0..79aa8f100c 100644
> --- a/meta/lib/patchtest/tests/test_patch.py
> +++ b/meta/lib/patchtest/tests/test_patch.py
> @@ -40,116 +40,107 @@ class TestPatch(base.Base):
>              self.skip('No new CVE patches introduced')
> =20
>      def test_upstream_status_presence_format(self):
> -        if not TestPatch.newpatches:
> -            self.skip("There are no new software patches, no reason to t=
est Upstream-Status presence/format")
> +    if not TestPatch.newpatches:
> +        self.skip("There are no new software patches, no reason to test =
Upstream-Status presence/format")


Hi Aditya,

Thanks for your patch.

Maybe I'm missing something, but the whole re-indentation of the file
looks wrong. Particularly here, the "if" block is at the same level as
the function definition. Can you confirm this is intended?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


