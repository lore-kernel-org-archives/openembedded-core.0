Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984E4CD37B9
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 12:25:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48539.1778502322683121513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 05:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sRLXEwus;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 67FFE1A34FF;
	Mon, 11 May 2026 12:25:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F73360646;
	Mon, 11 May 2026 12:25:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67F9C102F2475;
	Mon, 11 May 2026 14:25:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778502319; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z2jlGaxkouCueYpHzEz6IzKSlZAhdn7KW4LAcyCHX4w=;
	b=sRLXEwusXDJ3X9XJnPHMo1KzNaN7y+ewN5hgmyPAYafVUX7R2NdpeLphMy10wz/+sHI8Gn
	QLkOWlsGWX44JMYdUexKDylkxbXbe9ysw7P+3t7TtMl9hFSjzzfUouloZHYva9SP7wtGme
	Sm6xVPJ6zZxjRzPLlELMHrmYeyqw7k7HT0zz3bimmprqjMwQ2dZ9gDbXPDHl9xcM47xMln
	RPuP+S38PRu1ItlWdZDUI3NiHbYQHctsIejad92WT84J7adbYyYdxAShvoBN+fWDWCdttg
	Hhl2AmaHXh4D9omNU3OI942FaeYKUIbeOndEIn2zRmKow9BwS7XyL0FjmrCliQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 14:25:17 +0200
Message-Id: <DIFUGDKJKE7Y.SDTF3FXFC43W@bootlin.com>
Subject: Re: [OE-core][PATCH v3] libffi: add ptest support
Cc: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260508102405.16791-1-pratik.farkase@est.tech>
 <20260508113653.21478-1-pratik.farkase@est.tech>
 <DIFMGYW1190K.3MKM3KN0DWQMB@bootlin.com>
 <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <GV2P189MB3005B33FD42B8B07EF9ECC76FE382@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 12:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236810

On Mon May 11, 2026 at 11:00 AM CEST, Pratik Farkase wrote:
> Hi Mathieu,
>
>   Thanks for looking into this.
>
>   The glib-2.0 locale issue looks pre-existing =E2=80=94 my patch only mo=
difies
>   ptest-packagelists.inc which likely invalidated sstate and exposed it.
>
>   The multilib symlinks conflict I can address in v4 if confirmed.
>
>   The complex_int failure on riscv64 could be arch-specific =E2=80=94 hap=
py to
>   exclude it if it reproduces consistently.
>
>   Let me know what you find after further testing.
>
> Best Regards,
> Pratik
>

So I tired again and applied this series on top of an otherwise fully
working branch. I basically got all the same failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1577

This does include the ptest one, so I believe we should disable the
'libffi.complex/complex_int' test.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


