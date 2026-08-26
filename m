Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A647C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:56:18 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9051.1787738173227361087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=C//kUqj0;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Hrc1Fr1g;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 560607A0134;
	Wed, 26 Aug 2026 05:56:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 26 Aug 2026 05:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787738172;
	 x=1787824572; bh=E/c40iO5+1x5V1NUf0MWltzDMjcuHa4V8HQZbduVYvA=; b=
	C//kUqj0rtXl+VFev6eQU2taFnAnWSGSRIEx6diWIMagGNXL08ipyMm33s36HR/t
	DRgvAJrbPtP4aVbvfhdlkVRg47SawTP7pH8I4jUVAZs/ZDIg1tWfa8VSBegGDn64
	TO1EJGZOoEnYzDRVJp5vHcXgaa2P92sMIO6+ZO7JBfAhgNZQdccTmyexoliYX7US
	N9WHLsg+qxk6u1Gu8gUc2j4eOQSe7tS9lKg0tU6Yxuj5Sjf9iU2BfzTKdzm8wNJc
	x6P94dZHgdKKm7WFdlIgxuHhBzAsUOLMrq+fhvCw1R5P1x+VcfYlw+wow4sCvNDD
	/Wyk3jvnET82w3yN5U6K6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787738172; x=
	1787824572; bh=E/c40iO5+1x5V1NUf0MWltzDMjcuHa4V8HQZbduVYvA=; b=H
	rc1Fr1gQc5/4jH57wXgk5t/Ybb/dG55VxdTUuuw+H+J92BEt5QLKBk08MU1HlPBL
	QSf93n5MUAk50WTdlWI6zpdUyoIMH5eSiDptnXYXrYsQQQzThW5LqBITMl8BuTKi
	nm5lbvrRC9mySHgGuZEqQ1hTXiX4pwzNI5AnWXpo7Z6NBxpCC3sMMeCAXTBtzYmG
	wmd8ybmSrNROa8tLBGht3GP7V7itx6QpIhxbuhVJXaUwpuNPa232+ex3ioc0pkgk
	YJtqHGMYZKcMDQQ1PE8yDWDE17gOSellUupCLiWjf0/NqxKx2XWfjB77S9Egv+TB
	JZJ21IW9LNFMdDeZANG3g==
X-ME-Sender: <xms:O7iOam3HCOE6oY9cO8qs6HH0NwhG3lPBohlbzI_qHhmDDhfA9SNqIg>
    <xme:O7iOagjPNsT2VTZ-P50gZi9L9NlLaXMdjgnZ9cykiVYlGax8J-wKtyfOIjRaflw4V
    2GE1fbuG_9JHT2alUoMjZPBwb5pNtvc8IZ50KZHYGAk0TL2Jerkiw>
X-ME-Received: <xmr:O7iOasReNclx68rt1Wqj7MGgjMO6PaNdx1BsaTo_cPwigCDYhz7bJizSi3YhR2tqe0Si-bXvP6BMdlUN7AGML6iuda04hjo_Rplt3NjIEMrU>
X-ME-Proxy-Cause: dmFkZTGbGjCFHyc9G+XPy6bljDczNEIQ1EKRA+bKBOc7fR4LhGbyYlVL/Tta+WIV4DDtHs
    LKj0f8zQBaVbkbiw0jL26mpQb1wPmQhjVRRtccAeY2yWCn12gYA+Xj+YgzqdCV4uoiDMwo
    NoB1Ey/EEUe7IdhmSs5IDxLNah6snty0Ypy9LSzKw0CnuqbhItknIRIRBd+JbR+N/7QSON
    ogpa14t9qkjFW8VP5SzU/7h2PopE31B2EGL600qsFkSPkAEfb3FlOTdMOdcpU6ojZRBmaA
    qro+nquuGJFKidQIFe9BV2yK9KiXuHyJvcm1i/6VAUDGt6szCis1OQAovHKO547jFATbni
    zpziwMLPGXn6oiH0ZAua7SaLz6Nx+HezREgs55x90NS7Q4qDlbkUzXcKCvq8QlccdrMfzQ
    pESQPI8E9AdXLxbKnGquNiJTJUFaxmwihV2w/GaPMO4FRlRcT/VFrv1e5N9Debv6KJ9nEc
    GvqH2ufbzKSw6DiBeliOt06wW8zdaAYoaNN0p5UVNhHFmdCg4BPJTEGyp8+LMuJ2mbI1qH
    vT84XKrN7gV+TL00sQeIOgBxY+ywHRDPDeOLMdLQ4bB/KX+TXUYBJQ4SbNgB7Y7uWMq5W+
    gXbOv8/2Xoiv1fT76FKsDR2d4AVgHKJKPKNVs0tEWdNFiubtFDzMHifUNIhA
X-ME-Proxy: <xmx:O7iOahj1V9yPLUwRWjv5zX7fbFHzJQqf-07_lSEdS1WR_ahYbIVw9g>
    <xmx:O7iOas5mKARGtlvBNCldKhkm0NByFkiu_B4fVvvkvTWvupb82v5BhQ>
    <xmx:O7iOauBaCoaqMMdR2CyktBzxD8lKyl-5jMZiui8i0FbgpkmGflO9Uw>
    <xmx:O7iOajb7YNQqXtUM8ebq9Mp2DYv9N0NunMG74Voq0I0NBW1ILtsdmw>
    <xmx:PLiOavgDwwfSf8D9FP0Zdv0qgber4ryUtY0cDqNaV6aEzmT4ZXVB2uvE>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 05:56:11 -0400 (EDT)
Message-ID: <a801b816ecbff66fc39732801eec691af21ce3ac.camel@pbarker.dev>
Subject: Re: [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
From: Paul Barker <paul@pbarker.dev>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>, 
	openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 26 Aug 2026 10:56:10 +0100
In-Reply-To: <2789044.1787732076156082495@lists.openembedded.org>
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
	 <042a154cf3f65594e4d46156f4df835195b68f90.camel@pbarker.dev>
	 <2789044.1787732076156082495@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244391

On Wed, 2026-08-26 at 01:14 -0700, Jakub Szczudlo (Nokia) wrote:
> Hi,
>=20
> I understand this CVE is bigger than I thought CVE patch can be.
> Maybe we can think about updating expat beyond the fixed version?
> I now it's not the best because it is stable branch but I can't think abo=
ut correct solution.

Hi,

Upgrading expat on wrynose & scarthgap may be possible. We are carrying
a *lot* of patches for expat, especially on scarthgap, so it's worth
considering.

It would need a few things:

- Review of the delta between the current version on these branches,
  including the patches we're carrying, and the latest version. Check
  that there are no features removed or other backwards-incompatible
  changes.

- Confirmation that the SONAME changes won't break anything.

- Testing.

- RFC patch on the mailing list with a clear subject so people can see
  it's an exception to the usual stable upgrade policy, explain the
  review and testing done. This gives chance for people to object if it
  will cause issues for them.

- Agreement from the Yocto TSC, based on the above info.

That all needs some time investment beyond what we currently have
available, so if you have the bandwidth to look in to it then that would
be welcome.

Best regards,

--=20
Paul Barker


