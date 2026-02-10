Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D56EA3F2F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:05:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15872.1770714312269434550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qZBz08Jj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 153354E40BC5;
	Tue, 10 Feb 2026 09:05:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43ED606BD;
	Tue, 10 Feb 2026 09:05:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C9C0119D0F6E;
	Tue, 10 Feb 2026 10:05:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770714309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZuTEEWSRZphqAvqwziisjbLOiYynwhcaNQpEYuzUBcQ=;
	b=qZBz08JjNXGMKYnnGn97zr/Yble/TpI13gnnpC0n3dyPlwBO+KoWoZ0qFKuNdyqQF1QYp8
	otAeJCP7XvHd6RpcFZiNCfmpeXAb2OWUU8M7X39jtrC+ofEddDRSvtWShJ80BVAHUmASrS
	bkAAmHyEC/+mZ0yp2j5hly9MLT4vGRS1RwugHtK00vrmNelG2fjohExPs9WJreh01jlpNs
	kUh1/QT0A59Ey1iLX5+sHqZeD+eyYFwnLmgVORADCgWlOsmxuO/qoXAQ5ajOwNEXf5M4Xh
	bxxlmWc3Kx2IoGZ2jNnEu83DeU+i3YyiCP2tU29jX6ElGCzc655LtPU99a9yRw==
Message-ID: <9a9d7324-dbf0-4fd5-991f-311057f12237@bootlin.com>
Date: Tue, 10 Feb 2026 10:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] linux-yocto: relocate KERNEL_FEATURES_RISCV
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>,
 "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>
References: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
 <20260107151436.964819-3-joaomarcos.costa@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260107151436.964819-3-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230868

Hello,

I hope this email finds you well.

On 1/7/26 16:14, Jo=C3=A3o Marcos Costa wrote:
> In a custom linux recipe that requires linux-yocto.inc, the metadata
> files (*.scc) end up in KERNEL_FEATURES. However, the custom recipe's
> FILESPATH does not contain the path to oe-core's linux-yocto directory
> (as expected), which leads to the error below:
>=20
> ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
> Feature 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cau=
se configuration failures.
> ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
> Check the SRC_URI for meta-data repositories or directories that may be=
 missing
>=20
> Move KERNEL_FEATURES_RISCV - along with the appends - to a new file:
> linux-yocto-features.inc.
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-dev.bb     |  1 +
>   .../linux/linux-yocto-features.inc               | 15 +++++++++++++++
>   meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb |  1 +
>   meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb |  1 +
>   meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb |  1 +
>   .../linux/linux-yocto-tiny_6.12.bb               |  1 +
>   .../linux/linux-yocto-tiny_6.16.bb               |  1 +
>   .../linux/linux-yocto-tiny_6.18.bb               |  1 +
>   meta/recipes-kernel/linux/linux-yocto.inc        | 16 ---------------=
-
>   meta/recipes-kernel/linux/linux-yocto_6.12.bb    |  1 +
>   meta/recipes-kernel/linux/linux-yocto_6.16.bb    |  1 +
>   meta/recipes-kernel/linux/linux-yocto_6.18.bb    |  1 +
>   12 files changed, 25 insertions(+), 16 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-features.inc
>=20
(...)

I just saw that the previous patch (same fix, but in u-boot) made its=20
way into oe-core/master, but this linux-yocto patch here didn't.

Would you have any feedbacks about it? Something to be=20
reworked/rephrased, otherwise I'd say this patch is needed just as much=20
as the u-boot one.

Also, my original intent was to provide a fix a problem I faced in=20
Whinlatter, so backporting those patches should be needed as well. I=20
will work on it, of course, but I'd like first to make sure the=20
linux-yocto patch is not left outside.

Thanks!
--=20
Best regards,
Jo=C3=A3o Marcos Costa

