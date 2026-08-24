Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76358C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 08:31:15 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12206.1787560271573482022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 01:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=cXWOCHIv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=XbEoLx9q;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9C7877A00F4;
	Mon, 24 Aug 2026 04:31:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 24 Aug 2026 04:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787560270;
	 x=1787646670; bh=R4HP0cukw4x0Lkzdi/j2PFUKgqmy+8uXKtaU/smHvEw=; b=
	cXWOCHIvtqnlS9z6AkEbbJ/a7kSfKTXx55BrRzlIPOMk4dpTIZycwYQQ/noyOQjC
	iKIpb9cEUPTXxostjFFFpqhh4ZQbhiZhefUXc7BEuGLzO3FA2X4XUyIcKcBUBlBg
	P3LI4VFAh/DiJHf5U3LoLjfiyPRTqr/ksopLtLzK6OO/YnyUfod+LeFefPmbH+ta
	5LV6oAz6wmOwFTyHQhbXotocrsCzNp91TkW/9agrdotPqjMgFOs+NRkTP7AeT30c
	qZgl5a7uYbtX7AIDpy5G2II5uOwvrTaduYofhSVQQgBAflMEF8UnhDVaIApxZr/Z
	BF3IJQAXIANvcejfk6XAOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787560270; x=1787646670; bh=R
	4HP0cukw4x0Lkzdi/j2PFUKgqmy+8uXKtaU/smHvEw=; b=XbEoLx9q///02GmvK
	IEtyaIHKS0xNVrJqLOW9r45BLxBoWmKLG45+ayimsn+K8lo90FT2JuoTO6Du2qm4
	cDcJ5KNppUe0wgdfLTDIvqlpmi+iT+CfIOOLTpKMQhvrFCcNyfOzEuEoJwf97ntS
	7YoC50mXRouWuru0hHa0/uHncG6ULsy7S1zu6z6TbeE8E4b3qByR+ndF90oAh40y
	CL9YCLl3exTowL0M1nYiEI6w+ir2QElT98cVsx+M99B/8lSnXUTSLGVGGUrzc4Jz
	WUaoTWG8PND9hMOg/c1ZiRHnOkfuKqncFNaJ0kH/LlabdsZ6gMbwo5sJaFbvJfzp
	4sVWA==
X-ME-Sender: <xms:TgGMan13190DuuTNdflUPcGBBEBWKwsSua08oK5CvWHjmJlAysUfAA>
    <xme:TgGMasHN52-Dc4NgDO5vOsXEog9cBdNrkl6iL5WGTXVUlceK8pP4m8h-ZYQh789r5
    9OWytUg9NyhNuBCDulWQkr4hSeKSPEiC5y0f-7VMQoVLovPLq_drK80>
X-ME-Received: <xmr:TgGMalj3wiiFDNg_V3ibrJNtSeNs2ei0j4Dq3AqXzZtBMY5eEvqoYWp_hb-bURxUlnyPeDndSIw_kZVIM5A5iwLH829L8xAdBBxHUw>
X-ME-Proxy-Cause: dmFkZTF+Zg8r1vNaGD4RW6NuGavsW5bHR+KPuxky/Z1nznM/iKY+PcuW0y47kj0LT5cs2M
    nVW1KCPPyyB0gOsCHMk6BhD5aYUZwmYIT+rnYvMuH4TrvsCsTlWm4FGR36UKymSkH8Zoav
    FRWvCEW29aw9uU2w2sJ6Ar3g7HjWffL4pdPXyoieO+wyflSQFBN3BXpIVvsulpxfE+l9IJ
    zEsG7sBM5tSvdFz5qqOqyMSwkLUanCESpi8EU3HQm21/Mrewe8Gu6ypa8/P+4YR5Kl+biq
    lUjbWgN5WHMtSuMwSw+7r8vyZlsp3z0vzt11cEwwfMWxrk6aZNvbze7+Yh3L0KgSVi5FeT
    xo2pBxI3zZcA6hzJF75lAIBhEVSIOV1cV6DmUtFsExjv5sxIwcihyr8as9pWgHXOocAxIz
    DveLRthj3VyUjcDQ7MGzVO5QCBqw6uePTprwa7Uwp+j3hWAaaSlFxSEBE3gh2vRYkYEKgO
    H5z7OwW89vdql3X3p5VWK0b1cLvdpyXeuBexWS9QvdDWrTV5nBe4Ps+QAafzLkxGmUScuj
    miOO7mtJHOf9+X+N0D8zPm+TA6QZt0aYXgzxYOs6Jb+wHTIweXLYpf4yA3lzZlID6UyC5A
    Gc9vmCv1JXbgQ2EY3Qt0BvYNbbYMiDjDYI0FAPYVFYMbZClG3IJNCdlaAlfg
X-ME-Proxy: <xmx:TgGMan-pNgKPomkRRbwugjW9IcVG2mLXYTEzAZxDk7vMQQB6IZDJKA>
    <xmx:TgGMasrCaFqx6WqRJrIa9YoMeTgOpz7ZMR4pupFNm3J8B09NqbVWsw>
    <xmx:TgGMam9XbPkBKndMLtA4YuAZHwUsk79FGaJjGKDuE2-PtoxKnoKSSA>
    <xmx:TgGMagWnl0Etn0WOwg31eOIYnZpdecd2xh-laN-BLC74TKlWshbSHg>
    <xmx:TgGMahY4Gpi9qTm7hXdEKBhRhuFzryrLCc2gE6C9PuHjOLXea6naU02U>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Aug 2026 04:31:09 -0400 (EDT)
Message-ID: <f94020c9d3d9a7a9a49c1ddfaa56b2af3d7cfe2c.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] cve-exclusions: set status for CVE-2022-0400
From: Paul Barker <paul@pbarker.dev>
To: Junjie Cao <junjie.cao@linux.dev>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2026 09:31:08 +0100
In-Reply-To: <20260824043034.1457687-1-junjie.cao@linux.dev>
References: <20260824043034.1457687-1-junjie.cao@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 08:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244073

On Sun, 2026-08-23 at 23:30 -0500, Junjie Cao wrote:
> The CVE describes an out-of-bounds read in the SMC protocol stack, but
> the originating report, Red Hat bug 2040604, was never made public and
> no tracker records affected code or a fix.
>=20
> On request, Red Hat PSIRT identified the affected code (ticket
> PSIRTSUPT-22046, summarized in the public bug [1]): the v2_ext_offset
> field of an incoming CLC proposal message is used to compute a memory
> offset without validation, in the chain smc_clc_msg_hdr_valid() ->
> smc_clc_msg_prop_valid() -> smc_get_clc_v2_ext() (net/smc/smc_clc.h).
>=20
> The unchecked read dates from the introduction of V2 CLC proposal
> parsing in v5.10 (8c3dca341aea); at the time of the report,
> smc_get_clc_v2_ext() checked the offset only for zero and
> smc_clc_msg_prop_valid() dereferenced the resulting pointer. It is
> closed by the v6.13 validation of exactly these fields:
>=20
>   https://git.kernel.org/linus/7863c9f3d24ba49dbead7e03dfbe40deb5888fdf
>   ("net/smc: check v2_ext_offset/eid_cnt/ism_gid_cnt when receiving
>    proposal msg", v6.13)
>=20
> The kernel CVE team assigned that commit CVE-2024-49568, recording the
> issue introduced in 5.10 and fixed in 6.6.68, 6.12.7 and 6.13:
>=20
>   https://lore.kernel.org/linux-cve-announce/2025011142-CVE-2024-49568-e5=
f6@gregkh/
>=20
> CVE-2022-0400 predates the kernel CNA and no tracker has connected it
> to this fix.
>=20
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575#c23
>=20
> CC: Paul Barker <paul@pbarker.dev>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

Thanks for following this up!

One nitpick...

> +# The originating report (Red Hat bug 2040604) is not public. On request=
,
> +# Red Hat PSIRT identified the affected code: the v2_ext_offset of an
> +# incoming SMC CLC proposal message was used without validation in
> +# net/smc/smc_clc.h. Introduced in v5.10, fixed by the v6.13 proposal
> +# message validation, which upstream tracks as CVE-2024-49568.
> +# https://bugzilla.redhat.com/show_bug.cgi?id=3D2044575#c23
> +# Fix https://git.kernel.org/linus/7863c9f3d24ba49dbead7e03dfbe40deb5888=
fdf
> +CVE_STATUS[CVE-2022-0400] =3D "fixed-version: Fixed from version 6.13"

We can say 6.13rc4 here.

Best regards,

--=20
Paul Barker


