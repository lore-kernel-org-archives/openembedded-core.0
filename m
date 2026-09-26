Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC65C98338
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 13:53:39 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19785.1790430816534278139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 06:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=tPyffnJt;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=onGCBNL6;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B97C67A0019;
	Sat, 26 Sep 2026 09:53:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 26 Sep 2026 09:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790430815;
	 x=1790517215; bh=IWTZDJp+hRY4jx/kGi9zeiTn1tbtok6lwiDQYsEhGnw=; b=
	tPyffnJtecnHWoutzFtGTDHtU0fkgiD4G32n6PbFfcohnCNqDsJSBEjzfyPXQxxm
	NP9VrqMp3aCaLILwEJLvoSDcI5qmOkGlZV0SQN7ijreEvmdSWW1zUUrw+8ljHSQ/
	IF3DoXKSELVcky2vv7feHazXX3ASpO2S4785t7Sa7Iod5n2DxsNFjcPHFHRoih27
	KuWBJdyzCrRCOpOwFC9sXgNG0HOmZeFFahJRSbrB97SrTQNN0QJqbqfExVJwaFbR
	sk6RkqtmAT5oarmhKlqVLYoMNlurDnMeCSOMhNER9L9/RVJSZhbFWu6RuMuzJG0Z
	r6z9lhRWIJPPxcjO3bf/+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790430815; x=1790517215; bh=I
	WTZDJp+hRY4jx/kGi9zeiTn1tbtok6lwiDQYsEhGnw=; b=onGCBNL6gRNT3urL+
	Xz24cdzhXR+MN0FPxg7HcsJqJpxN88r758v2rGKKFxjOvv/SXttP4ln41keBBbwM
	V4fwLYzDXXP/U/SRpuLuOXNm1jZYxDfyvM6ay533SkWVKs/19jeiscMGI8cdop9W
	Vmiusopva4C4XMm7+p7pNEI6CR7O/GX+ur5GQIjV3TLW9zj5aap02kUHsMNChlWC
	UWSACQeQsr7kBuYFHajvj4MyioxhNc+00hJ+G1jrjZau3qLNytGa8WTGA/SBmDl7
	mnH1H56QIF0XhYCmpaB9AEeCjT9wa2JDhMR0Vw+fb+bUpri9DvkP0i03oK1/T5ms
	jCcNQ==
X-ME-Sender: <xms:X863av1VUMbPc4dijkcpNYw4_Tq5E308pfyYzwRKi74fSvzRl2Bt1Q>
    <xme:X863akGKRSHh4ClGaYjDkJxnx-De6_EKx1sscly9vZc2kvhBdn3pBz1FNhJb9UkQ8
    HV7SZcDxVKXav7g3EyKYExkm6YNzPWhS-mcio_2U23CcwgfGbTuLkPG>
X-ME-Received: <xmr:X863atg5B6vvwNNbaqjZpgxxQkKLXXQ4gRx-XtI3q3eAZesAIRhOAKMv-SfFuEC9BF93Rxh7-CmGFPOEoNuVja_CW-B8qc1cbvxz9NA>
X-ME-Proxy-Cause: dmFkZTE1z8+hGlW3QXMfhHw2dNCWFlIIh62jdX9MgJqxMQYGcHT0/YJfbPvwYmWBy98d5m
    SDJC3oNDrI2aiLVQf+7RCVrwHsnVxA8f1g86GjafxxMLx5YsQn4pZfS5/lE1XN+el9c6De
    AdFINgYx/AH2JskfNR1F48SnSjOSIgnV76h5DIK5gnvXy8yvowpio96eBViKa1wRpvsJAZ
    x2geBlgTMhg719xKpLPLgqGb+0AnFqf9U78/gWFSPP1Gz9MYkC+mTQUz7xxMDpIOzuaEe7
    9UfXkdcnUpPS8dBDDMezLitKrEdtcU21oayfX115Zwkv+z8+fzSrHGsnwoGkS4JLuLTlEy
    C5u6TpjjEmK4nI2fZy8vJCJ++uIa47mT060dETsqthqACsZleGLjd0km5JPPQS1t+eqBKS
    qqWLfxSqQk1hu6RQRI3kdXsPpb5d0obElNYyJmABZ5LV+QIwLvqgLgJBNMyG7yzBfMpW8U
    i4Jy/3NTUfylczTNKsRg6byejbU03ZxnXEzGOCPteg3iP1KBAVs1aEFOfLTFzN7+/BFVFW
    YoQU9QDsjZ+uH7bpSOjv7Ft6QEgdK8SLBL9SGEH6xnXSs8pz5IFM/I+6bqk/9VEIiOfaig
    wXsGZQG83gO9OizGy4rijtRUKk8JictojM8a77RfKvYcOCK5S86n+OL0riiQ
X-ME-Proxy: <xmx:X863av_5BRtwngKsv8-d5xSfsxDuWWxj0-4oLcEvdNMGDsMoBX0EEg>
    <xmx:X863akoJAWMefKR42atRizl6LtfLMko0QqF4Yx0dUNS747lAihRioQ>
    <xmx:X863au9bmW8vFroKLEGCjG1UpXmUBKdPrpeHL-mZPyuT23pZ3YWWTw>
    <xmx:X863aoWRzSru_nCUs2Co6gB_Yj9oMz_rYwaF9tvRM5bB123f_NqQGQ>
    <xmx:X863agoRYJ70gZTIgG4gNe30H4x4p9E08OqZn6Et1VvyFsPaxnB3SSFV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 09:53:34 -0400 (EDT)
Message-ID: <2ce6fc55e1691bf8800a26bf76aab92f440fd676.camel@pbarker.dev>
Subject: Re: [oe-core][PATCH 1/5] gcr: initialize libgcrypt from the secret
 exchange
From: Paul Barker <paul@pbarker.dev>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2026 14:53:34 +0100
In-Reply-To: <20260922092411.262885-1-f_l_k@t-online.de>
References: <20260922092411.262885-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 13:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246636

On Tue, 2026-09-22 at 11:23 +0200, Markus Volk wrote:
> gnome-shell logs a libgcrypt warning on the first keyring prompt:
>=20
>     Libgcrypt warning: missing initialization - please fix the applicatio=
n
>=20
> gcr3 initialized libgcrypt from GcrSecretExchange's class_init; gcr 4
> dropped that call, and _gcr_initialize_library() is only reached from
> the certificate, parser and importer paths, never from the prompt path.
> The guard in that function is inverted on top of it, so even when it is
> called the first caller returns without initializing anything.
>=20
> The secret exchange itself works either way, but libgcrypt then runs
> without the egg secure memory allocators, which puts passwords into
> ordinary swappable heap instead of locked pages.
>=20
> AI-Generated: Uses Claude Code
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

Hi Marcus,

Has this issue been reported upstream? I see that the patch is
'Pending', which isn't ideal. Given that this affects security we really
should get input from upstream.

Best regards,

--=20
Paul Barker


