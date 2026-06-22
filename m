Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CD8CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 17:16:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2271.1782148608790923785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 10:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XN7s1H4+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 773044E404A0
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 17:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C3ED601BB;
	Mon, 22 Jun 2026 17:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6AA7106C8B22;
	Mon, 22 Jun 2026 19:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782148605; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YZKF5QXuidZOftvmybO3klwZ4kRjld5bkOHgUbszVIA=;
	b=XN7s1H4+uwkas4+2MXAbRdtL5u6jPnwHT+7NjL/JDyf2KU1d3Ur9R8rUntP8wLVUfeORSg
	0aaEJpYSDXr21gNEaDBuHlKmOhlPGJT3dHiAvMZLbrKyzHW1vtUibseD0E4ZAFmMbLUK3T
	6v4m7ZIlU5x5SjNneLk8CUM95PgE6iwz9QRi57tvX6zwS4AYetLKgY7WqId7tB9VZo7Ate
	S1hEICt7+RLT23+HPXCvi00z7F8lEp4komchpbvfyCOgtfVziAH4Ar8qXJFLwsNYKnasIp
	rLPL6VzO3yMJDx0XMo+kdS/fztMeYH63MH+NFqnW/9UxZnvBhhppL0HmzFpzHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 19:16:43 +0200
Message-Id: <DJFQYE552JEX.3LNGCAC1HPXNB@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 2/2] oeqa/selftest: add copydebugsources
 tests
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Anders Heimer" <anders.heimer@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1781796358.git.anders.heimer@est.tech>
 <8aab102dc05984d47067c2f50c834b1ac71a1554.1781796358.git.anders.heimer@est.tech>
In-Reply-To: <8aab102dc05984d47067c2f50c834b1ac71a1554.1781796358.git.anders.heimer@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 17:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239312

On Thu Jun 18, 2026 at 5:57 PM CEST, Anders Heimer wrote:
> Cover multiple source-prefix mappings, recipe-sysroot and compiler
> entry filtering, filenames requiring safe argument handling, symlink
> dereferencing, tolerated cpio copy failures, empty-directory cleanup,
> and externalsrc relocation.
>
> Exercise paths containing spaces and glob metacharacters, leading-dash
> filenames, mv overwrite behavior, an empty relocation directory, and a
> source copy failure which leaves the prefix-specific destination
> uncreated.
>
> AI-Generated: Claude Opus 4.6
>
> Signed-off-by: Anders Heimer <anders.heimer@est.tech>
> ---

Hi Anders,

Thanks for the new version.

>  meta/lib/oeqa/selftest/cases/oelib/package.py | 265 ++++++++++++++++++
>  1 file changed, 265 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeq=
a/selftest/cases/oelib/package.py
> index 5751057a8d..d1b0e2ed4f 100644
> --- a/meta/lib/oeqa/selftest/cases/oelib/package.py
> +++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
> @@ -6,9 +6,12 @@
> =20

I suspect this is based on the previous version and not directly on top
of master, as I believe this file does not exist on master.

Can you send a correctly based version?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


