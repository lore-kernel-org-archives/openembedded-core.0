Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74293CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 09:00:50 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7111.1790931646273257793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 02:00:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=H+qoqWwo;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=RgdHVQRP;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 646447A0159
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 05:00:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 02 Oct 2026 05:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790931645;
	 x=1791018045; bh=WSpCms1FzvuHmjS0eqqtfVwl8WLcgBc/+ZsbcATW5LM=; b=
	H+qoqWwoukqY3u431AZsQiUVMm8GssI3TvJKYzBsT7Uz0B6mYisP24hEkqqYBgOJ
	SN1r4vuiYOCRQqYDNLwjNZRiXwi25Ar8m784K3DwPyXGWo34qCeOWpS8YtaHnRPJ
	mZtnW4XQFzH6QQPdJJGRn7a0ZitvBas+uaKa2QyifxUrHrTtA+GbMvFSDEyYSUdM
	QJvpQhtoja5LKdLv4LGd6BsZFJ4qdzQSaEbacnIJaT1Geu0otKb9Wkvb76IqO2hd
	fQmUH4KOOKqIW3nQRlgNDtOcYlDlWnDJAlOuJq1U/AG2oJEyOqJ7GojGle8KVVRx
	v4KDKRf61/tFlfAulf4GBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790931645; x=
	1791018045; bh=WSpCms1FzvuHmjS0eqqtfVwl8WLcgBc/+ZsbcATW5LM=; b=R
	gdHVQRPyRyeQTxrEXbq5dTw7uZDRdjMaUtLfNcFRJ3x7ObQpYBqgewygdWnkjAea
	yhqEfcVZEfKbJbHwuNKPc9c22cyVgpQ6njQnZvbyYYFSTcmt+pyipBFcWli+gOj6
	eWKeuE8Lav/wmzDG1lCAFqoj7pjWN6SJBDF8D/oy5U0J+uBsFna8nD55FzwzuwxT
	0Qjim/GRyWxep468vy/p94Mu5UXXIIRD34vaXqw5LrqsIs3ZLogqc0ZhYoDE2nWu
	VvCow47T9bTseqOgCfnTkFKzAzNCjLEBZtaHXLOocg9SY0PkpJfLDmgbNK4OTKPc
	u0QXU379KtltywSiixT8A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790931645; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:jIrVrYchLxghW8Y5I7ZIc8lr7anLQQ5zEhAOcWWcqULczGM
	buC4UEuFDhAApa3Q4GrsGCaDkGv8eP+Cv6E3gAsHzth0vBkodCK6Hswv8YQZdwtv
	3cbVzHB1sIS1yRPMmLue3DYGia0ALRhEsCAJbkfHtemCvnSkjKWLGWwOxzLGyKLM
	hKYT1uBMoAikBNRq4NosjehOO+3+LOqfEj97dCxn9d5KNMTpCaKQPyWm4X+PEiVU
	mto65Gafb5wnDaq7Ubpp8qQLn/jFJTgMjC1rEzXb1sZP23f3oS2CD71DuS16X9pZ
	+ZyKqLQL2vp2blRA0iIFxA0TZrOcvlgnU26wMoQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:PtkDXhE5csTNonTfAxACXBnzRaNA2wG1AK9S3dU23IY=:WSpCms1FzvuHmjS0eqqtfVwl8WLcgBc/+ZsbcATW5LM=;
X-ME-Sender: <xms:vHK_alXvXJOOtdlyLd4dgSinG9n-ZOAWXb3jiv5_JTQNfPHgJxs0_Q>
    <xme:vHK_atA8xkfkEjhRGFxh6FBCNGhBCpCbPrBlJzni9IX-tL0uGiRKFKw9ePa-aRFT1
    4eM5HJyOXFqXpnGr9v8DpKIbuUcovMtrrQ21X-BYCdJd5tYJ-jpT-4>
X-ME-Received: <xmr:vHK_auzMSE4Fhafx8ylLHK7bHHDC9400yxOVUN0V2LgwwcgDxLkZ7HLNU9shfjLnArI>
X-ME-Proxy-Cause: dmFkZTGDKOgTxPkLDDQx0Z5yq3iR6ockhavp/JUQXerGQ4aKB/7W713gIhOyk66UaHMPmg
    GaGqh+/iQ47+yip8126ARvktMxmTGTQN8Ml6cDWSafsUSrJG5YMke9yTSvdUQK9VN4NdYr
    wDBbYp/O3LbbUmwIcJGO9McvolkzmPqTAC+M2bbKtax+tHQ0jqU4WSzSFzpxODf69dA9vR
    3HckKpaUYAnLRlZZtonp180QoaYcDUeBBl16129litJyU2DEs4hugb1KIdqoBGaAKb1sRi
    MdNDA/rqfdbUOsjiOJWPNqBtKLmZjktPo8LOFLBCQ+Rphwfw6xj0Qx8QYgStuSVtSIMGQh
    TIqolLPYuxw6T0XO5wWk2RYOP7ehMeWh3DaK+MC4t2oitpvIQrVzd+inf5hLrEcbJWbQu0
    4c8fIPpbn+BihsAH9EaFFrOSVTetDJ4FC6IVGeZ3ruNydLv3Dxwktx6ZVMdqi6XMqQC8yB
    1Jn/iXn5IS6TdI4bqo/+ANcea3Wv7v5tBJb1rR2cBVOWe5onOnLSGIlp5P113FSPB39Fz8
    5mw9ZPCAATCauy9/r34nZbTm1zXbzCjixfqW4F4ZvUnHLbBB2E6ZTJe9eAAjizVWppDwY+
    gpNjLmET1/pXopEmhB6sJat84VT7b9wy9PSK3IdaI58fdSSdq0n1Bo1LS4Ng
X-ME-Proxy: <xmx:vHK_aiDMdTci51snpmPj8DIzDzeqApbIYxD1lkDvRJjfjjMEeX9HRw>
    <xmx:vHK_ajYlbsoi3epDZsk3AKwCFxuQzoxfgQM1nBFU8yQaWVkph9XoIA>
    <xmx:vHK_aijdrVKODOKkF_5wIv8G4r3ztV7OT02S9dSJh8x9gNZ4GiiuqQ>
    <xmx:vHK_at4jbGcU9yjNFdqut2Tv2e0IkWe4x--_QkIQcFbgyq38LFebPA>
    <xmx:vXK_apRsWZnn2ptpaDZ0walCdFpXcp1EC_D2KxdNFN862EObJ-wPtdLk>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 05:00:43 -0400 (EDT)
Message-ID: <279396b65a17a09d66e6f191bab1e1be7082d589.camel@pbarker.dev>
Subject: Re: [PATCH 0/2] rust: add rust-analyzer support
From: Paul Barker <paul@pbarker.dev>
To: Benhur T <benhur.tessele@est.tech>, 
	openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Fri, 02 Oct 2026 10:00:39 +0100
In-Reply-To: <693a4702-0920-4cb2-8669-1aae65b5e07d@est.tech>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
	 <6ded5087cc73adf490441e55b296d3130da129f6.camel@pbarker.dev>
	 <693a4702-0920-4cb2-8669-1aae65b5e07d@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 09:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247092

On Thu, 2026-10-01 at 17:47 +0200, Benhur T wrote:
> > 1) What's the intended use case for rust-analyzer, particularly on the
> > =C2=A0=C2=A0=C2=A0=C2=A0target? I think we need at least a brief reason=
 why it's worth
> > =C2=A0=C2=A0=C2=A0=C2=A0enabling this.
> >=20
> > 2) What impact does this have on the build and package creation time fo=
r
> > =C2=A0=C2=A0=C2=A0=C2=A0rust?
> Hi Paul, thanks for the relevant comments.
>=20
> 1) Short answer: I don't know. I agree with you seems odd, but I just=20
> followed what's already done for the other tools (clippy, rustfmt). I'm=
=20
> more than happy to remove it from target is that's the right approach.

I think we need to be careful here. Adding more features is great, but
they often also add complexity and maintenance burden. Even simple
addition of a new component within an existing recipe is one more thing
that can fail, as seen in Mathieu's reply [1].

[1]: https://lore.kernel.org/all/DLTK70W1LZPD.1WPEJTEXRP8Q1@bootlin.com/

We definitely want to take new features that people will use, but we
should avoid enabling things just for the sake of it if there is no
clear use case.

Are you using rust-analyzer from the SDK?

>=20
> 2) On my build environment (poky/qemux86-64) there's a build time increas=
e.
>=20
> master
> > - do_install: Elapsed time: 524.36 seconds
> `- do_package: Elapsed time: 16.49 seconds
>=20
> with my patches
> > - do_install: Elapsed time: 619.82 seconds
> `- do_package: Elapsed time: 17.16 seconds

This is a noticeable jump. We should put this behind a PACKAGECONFIG
option which is disabled by default.

Best regards,

--=20
Paul Barker


