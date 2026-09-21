Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7427BC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:09:36 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45787.1789985375664802309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=HhJeLb6U;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=pDhHoE+z;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A8E577A0100;
	Mon, 21 Sep 2026 06:09:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 21 Sep 2026 06:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789985374;
	 x=1790071774; bh=Bf1eT0poPwgib1nHDqPH3MLWDGG321XqAB6gKJ9s4gs=; b=
	HhJeLb6UvtLIAc0YfV5U3YOuHOrIh+Qy2xU2PXdMofKQdTcxFn4QRacDM0kaROlM
	K1vTXid1KCRx6JZJHxmjQArJoVdIqHBpSD3IoGVBolFr2rZbFyDH5Su0aHQF3Y4Z
	gWoAqnV1KUF5ydL2abkLUHne9XviUshp9gY5MRqWn/p+wiMBHhzNNorCFReJROPC
	bFKaE3+3KzD2fsBG9p0KL6slltOHjQaMRFwQKMEZDfd07HM+rdXCOyQhfL+VDE/R
	fIi7RyJ1rukFaQ5+2s7KrCR+N00QUcg40Bhv2kNgXd4uSAWiDo80wu5OYXXxv86o
	bx3ALcXnWECMpk0hj1YOEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789985374; x=1790071774; bh=B
	f1eT0poPwgib1nHDqPH3MLWDGG321XqAB6gKJ9s4gs=; b=pDhHoE+zvT/roP3vq
	kxOFh+35YbBCWnm0zC/iwdu3NYW9jGUwcS377gfAvb9DJdrz/hiiPHmuemc4kCM4
	QofN6Hir1x2TRkyfahp3FwpBeSkM0uSKAbxjsj/jBhtvUAkp6xM/B0FpHbcpOqnR
	JCKjA5Ipch11rU381KRCt2ydly0GC70p03ACLsdJOm+N6l9pAPcFkCcaztiM/ftb
	cSPRBbKEzux6LLWQi3206jgJUal9YJz2Po2riAaJKth8p/91hK+TrzMPI5sGDchy
	NeOcuvyTBzhqICLBhQuiYDZMyGGdyJK8N+paNSDlUPIv3zZksV+KJ28fLFFXEDVN
	DzRJg==
X-ME-Sender: <xms:XgKxajfnR1DohGsJmBzdMiSwwz0BOH7PzzoPAmJPHnKuIEIJA_GPug>
    <xme:XgKxavN7oHmx4bItvnJm_2zWwlzZiSNPGLM8xRFT77_glPzJr8jTV2QNF1hlkZ9iG
    aF5KmsqCg2AWixKy8cxBoevS45j9uXkMu_seHLXVOxpMTEqErxCV2fi_w>
X-ME-Received: <xmr:XgKxaqIO_ipQ6rfVnr95LdJ_gAZOwkRVlosN-WB_6myAU6QAAFMN_NRivze2R2c5lLLV>
X-ME-Proxy-Cause: dmFkZTEjXDH23i0XBRnpA+Qtk4KsMqIhrmnvPMJthRRzhu0eSsRuT14aEz1+/Z0i+PtnHO
    IBTz9g0Cc1r7Kcek7pQojIvG97w9/wk+YK/hR0IQ3wnNZzDUTFEjYceQEaz4sGMprmt8pj
    bQ7bZ3PfzZsvH9WSD3xAFAniVszImyv0VrfOPNz3B2n+HfihAiYasVO1mIVVx9YdFdOdVs
    g3KMl/t6TGxr+Mxp2LhVHAVgBFL9QT9ZApveBOUz5zUcacdmAQm2lo20SSYp+wkOvlUVMs
    X7sMaddvuQZCqACCRKnVtIJjinsq+RAVWrArvt6jeTsRdeY1GawK5zjBc1izr/5WDDjbRw
    /QbZBo+N+3v6l3GcSvD+y2tSLghCZu0z38arMIxMd8CIz6kdNYPdHTfxC4MUAPQP1j27Q3
    oSqSK8In7Pktnt9hwh5hjGZa0bKQTXoL6wKE41YevYfa2BhB6+ME7F1W3cbySg8ulxFYv8
    zmznTBql0B20bcSYXZMyvo4kh9mhm7UAq2NN1YQ+EFGjHN7Lf2bmHue59F0qH5o8BsxIX/
    FlVzfi5vJmaHdUyS5oWgiYzCiSnXxTteAAWpn/ZfGBN4DbMkAySO1S2LcRXNVhuAetAKki
    OeHUJSCgVgmNCPKInxzC37k9wl50hlmsNIow+qBmSIxEJUgEKUuimyeJ8nIQ
X-ME-Proxy: <xmx:XgKxagEQhLBZ7_3zx7Sj0fS5qD5NhnesrdbYS_uSfyqmfEUN4658Cw>
    <xmx:XgKxaiQ0TlfsJ_tYKT_AtdutGMTphhhUuX11wsZlDluc_RnaIFZj9g>
    <xmx:XgKxasF27FViN7FfdFm1og4PEZ2NjHO08uDvAHMRSmSeY8oDFoDMZg>
    <xmx:XgKxau-o4LsUJhmM8rT_ziuIUnIFA2KZG5_R1tn8yK3dxxQtbseLzA>
    <xmx:XgKxaot3Pk9l19WDQmHCmn_zy4YfNp_qnNDnIsOGwGqU7w_GD5Knlqne>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 06:09:33 -0400 (EDT)
Message-ID: <01a751a4b7c8ef88a647674659aeffa6c3d3dd51.camel@pbarker.dev>
Subject: Re: [meson.bbclass] bindgen_clang_arguments lacks C++ include
 paths, breaks C++ bindgen (mesa rusticl)
From: Paul Barker <paul@pbarker.dev>
To: Royyan Zahir <royzah@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2026 11:09:32 +0100
In-Reply-To: <20260921091118.3545921-1-royzah@gmail.com>
References: <20260919172851.1564760-1-royzah@gmail.com>
	 <20260921091118.3545921-1-royzah@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246313

On Mon, 2026-09-21 at 13:11 +0400, Royyan Zahir wrote:
> Hi Paul,
>=20
> Thanks for looking. Versions first, then the trigger, then what I have no=
t yet
> established.
>=20
> Layers, all pinned:
>=20
>   openembedded-core  wrynose  f7397af248e1e338929d70a910b0fbc2341528ec
>   bitbake            2.18     0ad6c1c34a5e07a5f8dd66ab248c1e7b37b69fa9
>   meta-openembedded  wrynose  14282a02be9c74a1276a7cda7d6c89e054699a11
>   meta-qcom          wrynose  ef0004df267743cc89d6a09bc724bc99ff541c01
>=20
> Target is aarch64, mesa 26.0.5, LLVM 22.1.3, bindgen from bindgen-cli-nat=
ive.
>=20
> The trigger is only this:
>=20
>   DISTRO_FEATURES:append =3D " opencl"
>=20
> which selects mesa's PACKAGECONFIG[opencl], so -Dgallium-rusticl=3Dtrue, =
and the
> rusticl frontend runs bindgen over a C++ header. The failing command ends=
 with
> -x c++ -std=3Dc++17 on rusticl_llvm_bindings.hpp, and clang cannot find c=
assert
> from llvm/ADT/DenseMapInfo.h.
>=20
> What I cannot give you is a runnable command line: our DISTRO and MACHINE=
 are
> in a layer I cannot share, and I have not yet reduced this to stock poky.=
 I
> tried to on the shared builder this morning and it refused before parsing=
 with
>=20
>   ERROR: User namespaces are not usable by BitBake, possibly due to AppAr=
mor.
>=20
> so that attempt proved nothing. Our own builds go through a wrapper that
> handles it.
>=20
> My reading is that nothing platform-specific is involved: bindgen_args() =
in
> meson.bbclass passes HOST_CC_ARCH, TOOLCHAIN_OPTIONS and --target, and no=
ne of
> those carry the libstdc++ include directories that clang needs when it
> cross-compiles against a GCC sysroot. Any meson recipe running bindgen ov=
er a
> C++ header should hit it. If that reasoning is wrong I would rather know =
than
> have you chase our stack.
>=20
> Happy to build a stock qemuarm64 case with opencl in DISTRO_FEATURES on a
> machine without the namespace restriction and report back, or to test a p=
atch
> on aarch64, whichever is more useful.

Yes, I'd like you to confirm that the error happens on stock
poky/qemuarm64 with just the DISTRO_FEATURES change to enable opencl.

Also, please quote the email you're replying to so it's easier to follow
the conversation.

Best regards,

--=20
Paul Barker


