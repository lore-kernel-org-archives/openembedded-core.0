Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F811CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:07:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1935.1778656054239137668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PoBKr7UF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C5E641A3594;
	Wed, 13 May 2026 07:07:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97C50606CE;
	Wed, 13 May 2026 07:07:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17F9011AF8D2A;
	Wed, 13 May 2026 09:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778656051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2j2sEsHsj9/CuXkfVhBc2L7JmQj6XiGbNuCv5MpQWLE=;
	b=PoBKr7UF3i2mINsTjOgzS92QeehynCC68efRnxyY2jBGF8HQ1YMc0jLbf2nDrnlPDQz2sb
	Qxz0W0hLyVp+H+QBReYQ4ZHDOU/ufWAk2MdrhpHw0TtZs/qo5t7kCeCagAkRuzkA+KfTxW
	1bVzaQj6Lqdc7muXEjO+cvDeEuR4498Ht65XkAPg5Jshpegv2oxVwCSlM/OhzGULYSvKL8
	VcUiBQccAXK20WiEOIeD0NQr2CB2/YktqbCOeU3THcF8z6kjal0Q4PedvkVg1S3Qs6Jla8
	QOWoj1wB5CJEwz5NLYbeZnpQNzCUrCD8L0llgmftMDoh3Es/66PYxsc6brSpLg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: jeremie.dautheribes@bootlin.com, Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
Date: Wed, 13 May 2026 09:07:29 +0200
Message-ID: <YJowmpLrQSC3VUoZtQt51Q@bootlin.com>
In-Reply-To: 
 <CAJdd5GZQpHzwYaqpMQ41JgsZov_C8G_5ireXw1vK=uXRa8QvBA@mail.gmail.com>
References: 
 <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
 <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
 <CAJdd5GZQpHzwYaqpMQ41JgsZov_C8G_5ireXw1vK=uXRa8QvBA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236931

Hello Joshua,

On Wednesday, May 13, 2026 at 12:29=E2=80=AFAM, Joshua Watt wrote:
> On Tue, May 12, 2026 at 4:27=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com=
> wrote:
> >
> > On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes =
via
> > lists.openembedded.org
> > <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
> > >
> > > Add support for optional zstd compression for all types of SBOMs,
> > > including:
> > >   - image SBOM
> > >   - recipe SBOM
> > >   - SDK SBOM
>=20
> We should perhaps also implement decompression when reading in
> documents, so that the intermediate documents are compressed as well;
> if we are allowing the final documents to be compressed, I don't see a
> compelling reason why we wouldn't just compress all of them.

I am not sure this is a good idea performance-wise, mainly because
Yocto is currently relying on an external program to compress and
decompress. We need to wait for Python 3.14 to be the minimum required
Python version to be able to use the native implementation of zstd.
Indeed intermediate documents are pretty "small".

Also with SPDX2, intermediate documents were not compressed.

The goal is not to reduce the size of the build directory, but only
the size of deployed artifacts.


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




