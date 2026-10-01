Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A98CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:13:30 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12126.1790864004919506521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=bxaqhcpH;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=ASWxRUUW;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1CEA77A00E2
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 10:13:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 10:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790864003;
	 x=1790950403; bh=uJ/Ywx0kDMzglXz6CJKvFUelmH/ImDOopDISBtrT9Dc=; b=
	bxaqhcpHaGog0Uohfsbydyzob5zJpYx+3lN1V40pb6dg5Ry3nwubG6F4UUeIzjp8
	cySK7QP3sDpYyx0bUY6HCeaY23JGP2f5onoJ5mr1yuvXZhpayXcKNvTq7Oj0ZP6+
	PPebUtCmN0ERaB4LZGtAsFzL00XPeH63NBFbDaeBgnI7o4r102FLlmNbZL08nHck
	T8UFuky0+UKSh2Phk58hR0/4DbxDDDmDa+HFb782SjTxeBo/8Uy+v3rpjd+tLeiA
	gJOD0uRQ2TgR2hbZng2arTae5+kTURrTLIGOGfEkW3AwelIEndoSKYifZYPcSx4o
	DnUvzp1IdQT4wm12tFIB6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790864003; x=
	1790950403; bh=uJ/Ywx0kDMzglXz6CJKvFUelmH/ImDOopDISBtrT9Dc=; b=A
	SWxRUUWyHfUpnlCiW+eYqipyFemYcG9nLaXFQp1eYDVqIqLrfQGxi05z2Q2bvSSB
	J5TkIy3swXDABLBkpZToU4ZGlNox4xEMUgLwKiCCKKy1AUqATE1f1ri+fjxWyHC3
	ogZJOIv+xU5O2LoLvJFnLaZuDcdgJ4zfm1/z2Hd0AZCmX5swDZDfza6Svyy1oMTV
	ANSuVN0x/dar4ZX2S654JMpwOd1mY4JXkr9mmNjYxQh282PwZX6OcvAX8epPHWH3
	rRs6EW7oPSB37ol778WuoR2mBG05oj+aiw1Fhpv0KQWEZXrtr7/dYbGE8qmc6ESL
	bja5O7LES0ec+x2oNznuw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790864003; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:IKHiHLY2gwSDrNZeTdVKWbdxredlXpqtR6IF7NdcOUBBUNw
	Tv/296RwrZT1E9wZf7MV38S1ol/XSKA5r6cdX46iWeZW/iE+HAdtCAXDmw9Djqw6
	COKQBT6fgdx3mfF14yN+R0gnbVDzFl1GaX9vT78V4mC/uPWObw6ihEUuXVvtz3pS
	CFh5HgE5sLY62k1Owt7RkuhPzAy29Bd+xfmLnHtuGpy5BQmmnl5PRUPQjUAwD8Ff
	Si0YSpaAIUWREpGdlk/BA2nHxJwFlDRK+MnQsr4B8u1ZLeHpgcwEhkW1hr9Dz/pB
	SwCBjKqgfwPXEY+KQlZoSXCEdX9mEFID/lvouXw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:2vdL/Q8ag9nTMk3Z1NulzwoEe/Q2DAj7glCCiyOYBgg=:vF33IuJA7f+L2oG5CNPsks+/ExzWuM6BaG8YDE6G5Zw=;
X-ME-Sender: <xms:g2q-al5zk_STjv581ReZ3VxFm2GgVdxf_7gvmQlI2UoHOK6zg26b6Q>
    <xme:g2q-aqWK6CwyCJrzNRCxPYyK69toV1AsznrOZiSzldFOW9ezSavxx6WidWBn1x68e
    BnQ7hsDS1N16DvezBoJJaLdDgZl7fUET7hQSb20XqEiWLmt4teRSG0E>
X-ME-Received: <xmr:g2q-ap1OLSZ3UqgB4wbujXMMImvBQbJRsUbk-xRXC_C3wWsxU259w24c9lnW_GLhXHLoUXxq5F98qYgViCuutbOz6PLCq9o9Jeur>
X-ME-Proxy-Cause: dmFkZTE2XYPurllPLyT6IaQTdnZs0HAKPIGpfF4dHX9Wt3825SV/lq81qke11+vH/rrYcw
    sg3i6Ox8a6iIODJbAhwbztUwaRSCnqb/OEg/vNvGKUCPgrW11JOGIPquQAwdT3UudDDcWj
    4DoaDK3yfKI0wMrHzvNho6ufW8IN+Bhm9UpanNtolfHiO2fJj41KINQOzYf4ZgntHfOFSv
    qGI3u+9Axl2R7USoIHR5Tv/pZ3d6L2eRoMoZVjOgkNx2yL8vEYKXGw5Iiz47zS/uE91XwO
    9jr/BlPJOfRwv29gZsON72QJvq4NhSaCDq+hWK5iTPvM/rUQ9K2XTFPHTlhKftNdyuwijB
    GevrC74pkF4RU6CaTtnFB8SigtxIkKfFZLdTc72B1VAVmsSqWLIovWGLlKiSlacapIssTW
    LfoLEP1kj/ToZjIygHhmA+M7PMDYaHbDTrqKnleQdUoxbSiuhDqSrfZYaizm7T356EMNwJ
    i9hhgLgf5MxDffRQf+YSuENa2ylbeBTDIGUzLiZs5Gap6Bvgop/LUCh4mRhoviT2A/bZ1j
    zczdpY7+cqWWpkLyJaSwO7SXG+HF1V8e1aZ428YBinw2PA8KnwVo9qoMDVo33zvC0B3RB5
    MXHhle5n7Ke3lW152ypb95efSCLAbK4dBuQ5jmPOsAIkd9ePDPhLqMB9szGA
X-ME-Proxy: <xmx:g2q-an0Kcn3HKOw0w6vc2QMzsX4EoeDxV_Z1-I9Ib08GMXtekkf-PQ>
    <xmx:g2q-as9AmFr0yzEaCSsSe2tSugMKmz7YeOChGnrgXQbX_ZcLt0Pdvg>
    <xmx:g2q-ak0Tc6i7GgT34tJW6Gl5qWLUw5DDcD_wfJWeuBCAP7ppreVIaQ>
    <xmx:g2q-ap9vJRsQOnojVjaFWCENT_x9SuQar5b-xsEeslcqZ0VQYHWD5Q>
    <xmx:g2q-arEO36Bzs_W2Zz9aiGzJ98MxIExHkce3H1RUSTp9ay2kwt9QggPW>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 10:13:23 -0400 (EDT)
Message-ID: <6ded5087cc73adf490441e55b296d3130da129f6.camel@pbarker.dev>
Subject: Re: [PATCH 0/2] rust: add rust-analyzer support
From: Paul Barker <paul@pbarker.dev>
To: Benhur Tessele <benhur.tessele@est.tech>, 
	openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Thu, 01 Oct 2026 15:13:21 +0100
In-Reply-To: <20261001125630.760962-1-benhur.tessele@est.tech>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 14:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247038

On Thu, 2026-10-01 at 14:56 +0200, Benhur Tessele wrote:
> rust-analyzer is built as part of the Rust tools but was neither
> installed nor packaged. This series packages it and wires it into the
> Rust SDK next to clippy and rustfmt.
>=20
> Patch 1 adds a rust-tools-analyzer package for the target and nativesdk
> variants. Beyond the frontend binary it also ships the proc-macro server
> and depends on the standard library sources, both of which are required
> for rust-analyzer to actually function.
>=20
> Patch 2 adds it to the cross-canadian toolchain so that an SDK built with
> SDK_FEATURES =3D "rust" provides rust-analyzer out of the box.
>=20
> Testing:
>  - Patches validated with patchset.
>  - Built an SDK with SDK_FEATURES =3D "rust", installed it in a container=
,
>    and confirmed rust-analyzer resolves the standard library and expands
>    proc-macros end to end: diagnostics/analysis-stats on a crate using a
>    derive macro succeed, with the proc-macro server started from
>    <sysroot>/libexec.
>  - Built core-image-minimal with rust-tools-analyzer installed, booted it
>    under qemu, and confirmed the rust-analyzer frontend and the
>    rust-analyzer-proc-macro-srv binary are present with their libraries
>    resolving.
>=20
> Benhur Tessele (2):
>   rust: package rust-analyzer as rust-tools-analyzer
>   packagegroup-rust-cross-canadian: add rust-analyzer to the SDK

Hi,

Two quick questions here:

1) What's the intended use case for rust-analyzer, particularly on the
   target? I think we need at least a brief reason why it's worth
   enabling this.

2) What impact does this have on the build and package creation time for
   rust?

Best regards,

--=20
Paul Barker


