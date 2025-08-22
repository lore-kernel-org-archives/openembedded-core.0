Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BECDCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 10:40:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.6814.1755859245386442299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 03:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WaiYCjAs;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DE88C653F7
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 10:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154B1604AD;
	Fri, 22 Aug 2025 10:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 876831C22D227;
	Fri, 22 Aug 2025 12:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755859242; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9//AtQTli/M6p4O0e5xBOxqYGkxGvu2J2BSb/mcxa+Q=;
	b=WaiYCjAsmpEs54nGO3+LOF1/ai9tczsn0vgicNGoDuZdSodUu+aXNhhQwaRrIRkKvw2FdI
	tcZQWZWTGDRe807hPh4UChn//JF+aGvY+4U1XISN4hLKahNhLl8ZX+UwfRZv1I1miArzvZ
	XAIq59Ot1jlPmsyAqNMVXIXZyBfwrdBfsHkj4uC1ZnafwciXqxtIsruonp1eKn20qgDyo7
	vHssvnn+mTZBHLGZZ0ed/RomaMa/UIw0nsDFn5cEm1ZWIIezP2ZWRA7W6AH6Z0pN0KQ3WK
	pSkx4ySjGX0yhEUxI1tuBwuuOnIsGCm5loKPPIoY+N5vLuYjvewoGw5C0Rjv8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Aug 2025 12:40:38 +0200
Message-Id: <DC8W5II3V0GO.NM0SUO2KYRTW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] gettext: Skip test known to fail on musl
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250822051726.2429206-1-raj.khem@gmail.com>
 <20250822051726.2429206-2-raj.khem@gmail.com>
In-Reply-To: <20250822051726.2429206-2-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 10:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222312

On Fri Aug 22, 2025 at 7:17 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> * Use posix thread on musl and cache
> * Force using system posix complaint printf
> * Add coreutils to ptest dependencies
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-tests-needing-BIG5-encoding-on-musl.patch | 84 +++++++++++++++++++
>  meta/recipes-core/gettext/gettext_0.23.1.bb   |  7 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/gettext/gettext/0001-Ignore-failing=
-tests-needing-BIG5-encoding-on-musl.patch
>
> diff --git a/meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-=
needing-BIG5-encoding-on-musl.patch b/meta/recipes-core/gettext/gettext/000=
1-Ignore-failing-tests-needing-BIG5-encoding-on-musl.patch
> new file mode 100644
> index 00000000000..481bcc0cb27
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext/0001-Ignore-failing-tests-needing=
-BIG5-encoding-on-musl.patch

Hi Khem,

I had some patch fuzz with this patch, probably because of the unicode
chars on the last line.

I did fix it manually on my branch, and it looks like the issue is gone.
So as long as you are fine with this, no action required.

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathieu/=
master-next&id=3D1da6cc16bfe20e49007716511ea2d1cff0660006

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


