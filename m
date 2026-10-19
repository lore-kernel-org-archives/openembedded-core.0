Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F993CCF2D3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:19:54 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29943.1792397990234512469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=d4P+OfQ1;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=pKRjsCAz;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 6267D1D000B5
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 04:19:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 19 Oct 2026 04:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792397989;
	 x=1792484389; bh=N1nmJKUJzAozP74iMYUbSqr0KpmRm+St55SWmEIW69Y=; b=
	d4P+OfQ1rGa5xFdAzJ9A1YQqwtGFRbvt0bIrX52sGzmKh8PIKW+vL/1w65/9LThg
	0DxhPZLY5BDYllYHrXoIe9t09GZYmuIe6JuLGqq/f9ZAxw3PrOGbsNlU8iTqDuhQ
	sni9Y8x3eRlb2exl0yw6E7cvSaa9S5WycWFgpwh2xOGA8RoCciaG8NFgyryugx+q
	hClKAH1rgj6KOkfbCMokiImvrHIl64kctSNdOKDqLTyPmy/wJqYC8+VVCGRNASgP
	KdYbbvT1RrjByk9EoYL2wjQzLSfW06PAMPDDlUlHtz80UJ39oalLF0Qek+KbFHAi
	gHLESbufbSfgo9/KwGMZcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792397989; x=
	1792484389; bh=N1nmJKUJzAozP74iMYUbSqr0KpmRm+St55SWmEIW69Y=; b=p
	KRjsCAzMHp8ToE8IPGSkN1SUAKsvwvaAwFKaysgFiHf0hmMhOFgg1pESiPbEa8wV
	hY99RU4NQmbgrE6Ga9wHqgI3Qx6MhrOngHhi205dH7qJpNVM1SH6PnTqFbheLy/k
	OhZ6ueUGAkzdKJCoI1wDF44jo9KtGj/AmHDkxiezI8cLkRnCX+JXNXcU2i1/3Net
	WVXcY3LcXo7WYpakdNrqgkHPV5bcgDQ5gNEqYYXVkHUCUQhffeB2KLWXQd24zioJ
	36qYNkkGpmPPEGf9srnJ4pVZsXfyoylS1eFQVsm0JNTU90EZoEBNvUskJTZYpvkx
	UhQBPm/D4akYMEpxscmYg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792397989; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:CidOS01KnlqskTwMWQwtVNYZPWEkGrLuKUesg3t26jRQ1ud
	upF3/XS0DEPVP0ipZz9xQtsJuYssVfyw96aq0H0zjtSGytDXzQIVhbpt8CizQ8AN
	RRtxnmXqBjzDXTu9qfiujnJ2lysHk29NDsik/v3dYAYdWUDmdBCS7G2e+fwEjoDX
	bzl1Z0phYyww+a+GcDSCY5jDewEHlO/7bCiaVFo3N4HAUJc1dP4t7604sLxBMXJ8
	/b6TJMXbXPI+wU0yQW5RKnJ+Me5s3zie8MFj6sv7mRV/xvaQZpRsYXwTfsqDVaSp
	74keu/LbYEDVmS3r6cvPSLgNzy09MDO4Jix9qgQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:f6wy1ZYo3UDyGkHY8W1rrb1GrwvHZOOZbI9iHSJmu0E=:N1nmJKUJzAozP74iMYUbSqr0KpmRm+St55SWmEIW69Y=;
X-ME-Sender: <xms:pNLVapSZHJkFnP_QgB3Qix59sJRyQSqQUMZAodOEyYZ8GAyAVwCRmQ>
    <xme:pNLVai7dKdpGNnXHSOy5wS4Y7xNl6UfeKrcVI1H_BEB-5roEHqludf7-7B458LeOs
    Wt97iGT_ets93Md1oRO69UVCx1rhCZ8R5ni0aIPWACSUJGecjkVp2qj>
X-ME-Received: <xmr:pNLVamyKxbixM4QPJNIaMPa4CF4BINxpRL5y-iHxM9kiMoq4erJhla12IuLkQSKNsiyiM6Y2NlqK6GLEltWLYAsuLhtvngJmlXdx>
X-ME-Proxy-Cause: dmFkZTEd9MYf9c/fBQK57hPuV78foi2Ga1e0+sr8M9A1qDe3cUV6n92k1TcZle77cXolKT
    iVzHM38WX9v0nkDGD8fLZ7G+anh6reDCikdKAyxHrSCLeWGrb2VCQJLkcdEaAOtfMp/6SM
    joIG5/BQCSBmq8wUtTpAaPoPzot6UzncTByKX1CoqBFcE1J+1XweQsXUmvVPbXCt+F/qFp
    /MFjd6SbL2z3sxF1n+UApu6R6wF8e4iT83JKRy5AOH8o+GnGrWoso8wxb/CF8XhZbccBW1
    B8te4OB0O1oQA6FL4dHe288V8qFF3mAUt3+uEQPVe1M8A58NQErXPeOZVQrrkpLTG5Lipt
    n1pnw7afb93v7m0jk8nBkQw70Y/RR8uBKEYuJOYQq/wPFt3UfVAfu6TuJKKx1wgVCp9ivH
    NCLdMddFaXxC2OfhKOJTYRAABnRBj9zASZ9QGo3Fyf8O5U43medDoxrCeT+6DS5dEsZF8C
    ltAdp5yqTz9larKQbY9cSM429+0dQ33uHO0U0xX+rsBy5qTSEwuSnRTouvSTM4clgC5bMm
    5ZYbNEoRXFuGiaQ5tno8dfOJHeVoYsAAQ0/irkCtrvw/QzWpzNW00qBKvI3FWiKQiVfFFR
    WTTtVY+Cy03ddD2t+V6O/Z7c9eAPMZXiANYLoSQCAsVQYhUpV2TRp2Cdn1yw
X-ME-Proxy: <xmx:pNLVapS4N80b3KZF79Ab3MSqltFBt7OFhq5l0ZOcKe8qbSJ0wO7OBg>
    <xmx:pNLVatWc6F42bV6Ui4DpbU80ZdPmG1mmZRAQkdp8QK9iWOCB6Jhodw>
    <xmx:pNLVarYyboloS4GPSHFeUz3oo4D_LvyObyxsD3u_jnR1FN2i3IM5ew>
    <xmx:pNLVaj1RhMaE_7PfdyUQ5d8kODEYjvxPt10Z8djEDK39csdXMoCSyQ>
    <xmx:pdLVaqXUSsjjKZmcnqTRNNHjc_BGvgTwJUtTBniYYv0-4dbPVtH-l--d>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 04:19:48 -0400 (EDT)
Message-ID: <83b27a0e093d6e6df87ab2106b3a163064226f39.camel@pbarker.dev>
Subject: Re: [PATCH 1/3] yocto-check-layer: Add --run-tests to select the
 tests to run
From: Paul Barker <paul@pbarker.dev>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Cc: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Date: Mon, 19 Oct 2026 09:19:46 +0100
In-Reply-To: <20261017225656.680168-2-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
	 <20261017225656.680168-2-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248140

On Sat, 2026-10-17 at 19:56 -0300, Otavio Salvador wrote:
> The common and distro tests ignore --machines, so a BSP layer checked in
> several runs, one per group of machines, repeats them in each. Add
> --run-tests, taking <module>[.<class>[.<name>]] as oe-test does, so the
> common tests can run once and only the BSP ones in the others. A name
> matching no test is an error rather than a run that checked nothing.
>=20
> Tested on meta-freescale with "--run-tests common distro" and
> "--run-tests bsp --machines imx8mm-ddr4-evk imx8mn-ddr4-evk".
>=20
> Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Hi Otavio,

Why would yocto-check-layer be executed several times to repeatedly test
a BSP layer? Why not just run it once with all the MACHINEs to be tested
listed?

I ask because one of the things on my list to add is automatic discovery
of MACHINEs in a BSP layer so you don't need to specify them all on the
command line. That would by design test all the MACHINEs in one go.

If we allow running a subset of tests in yocto-check-layer, we need to
update the docs [1] and/or the YP compatible application form [2] to
explicitly say that *all* test cases must pass for a layer to be YP
compatible.

[1]: https://docs.yoctoproject.org/current/dev-manual/layers.html#yocto-che=
ck-layer-script
[2]: https://www.yoctoproject.org/compatible-registration/

Best regards,

--=20
Paul Barker


