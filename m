Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0574C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 17:15:42 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2721.1787591737459287174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 10:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hfDaDQEZ;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=OlwCAarS;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 882E11D000EC;
	Mon, 24 Aug 2026 13:15:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 24 Aug 2026 13:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787591736;
	 x=1787678136; bh=hIw4J8Cfvd4BiByjLUzuRHI/z9Dz3947sYi1xHwJPYE=; b=
	hfDaDQEZLkxNutCwCjw/d64ibqV/cKzukxszVQae7EQ9hKY4CHpwL4BHigBdBUuo
	yBYs5DwowICmZzLBYB70gHTCMHtmlQXxn7FXuuJV6vy2SiNnu/j5Vkzf3MrG5K4c
	I25se5d9LpySVjkk3ruCb39RMumFoNN+ljWC7IZlHkKjdpVe2WxkvuQkk1Ztseor
	QmzGiOL+CKjS8LsD3acSRwMU78WKuyN7T3XkYmXehlrlTpbJS1spq2tZerlSWiEL
	R/DrJd70dpf7eMRFdwoxzeMSZz6M8liLk8p0ucaZLeqAXzbxxKAtUiQLWHj5zsc2
	S82Ye8dnPKawNM2Nr6wWyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787591736; x=
	1787678136; bh=hIw4J8Cfvd4BiByjLUzuRHI/z9Dz3947sYi1xHwJPYE=; b=O
	lwCAarSuYMRN6wFevaIb0JkCQUzUFn2fI2zZ0DzPNnLc3LP6uGaABbGm2oT0oyvB
	MSg+KhvJaR9RpbXVuI7jxtHY24vtygjn2yqbOcrWFSUaNABQ4ub2eLyYHE9SG8lu
	6AM/RaTc525bVXHVisww32fSIqjaHlKwZKoXRtnr5wanHwsSYg22NIvvinp5OuUv
	oM0KqLqH58vlYk6B8Z7secKX+l4B3WKuQPMkJqs5FHGMroXZv3DRe9XNp0WVjIDq
	tvd3u9TxkjUiuU0OywVEX/4W/rOcufF26Hx5etHWoz6aOpuI+KJ+Oof4a5rtha4T
	U1RwC22Aa0sf66lFzpCYg==
X-ME-Sender: <xms:OHyMaoOhT-H5q0ZxanfisWtCAhFdBjxJ3YmBlyUqw_J1htINA9qVVQ>
    <xme:OHyMamZumarCMyRkuLT7wMs2HSfqj0Xznxa7BEAx3GISo765A52SBieoidkm3wfku
    rB2qebhTknihcdMxu2bhmggQooZ8MiIXAKbX_FV0IaB2skMHaElw94>
X-ME-Received: <xmr:OHyMasqtCev4dR6pmzT46fmd-EueT0osJNkRTcoIiCtrzFp7H7j6WWnjL25TwBOwszaFkjuyF3YMLcA7VsQfFoUocueDxw2t5Z9AMhNM3OwS>
X-ME-Proxy-Cause: dmFkZTFZSr3Hcw5VBaukwuxTa8tIVA/aOFi+Towd2i/uC1/VZZmDkrMgis5LeWuxzbqsJP
    tDJActOO7opOd5AisJqsz/dv3hXc86dy0bj1QGS762KPSmj2ho7esgHP6KXj2m57hGCRmZ
    J4bKXoKGWXDwieB3SqdukaDudSGTaWphHYbtRBiAlhyNNA+KfrN/KSa3b+flBig7gxYKd6
    rwQ46VOp0v0HbxTXyjJFOijPqTXfNHNcHSu8pqTzRgomb5RNbN9e+cU+Una874ae1JLkAU
    KxNW379iYOIPEfjhX9xinDjfJ15wwqpHa4/gGj5zsTlTK3h669i0sUh7m3FrDt1AAZTYi5
    o19DODUNVRY5FxJk0+yO9FY7H/+qUSRj5hbg0+yx/7mYY1WxNo02c1FSMvuqBNByrD30x4
    xqM2z1HiBraiRyu4cZMjhgmlyQ/dUU/EpUuCKSGT+hlAJneV6mo0S7J1MCAWAUSFcP2GBD
    Y83U8D+cVsWdfIn/ievmuhPBnKF64jt1Z4+E7faQzY42cpoaZ8z64N7Yo+SB15sEG+DAq9
    kfpPzHZcft8b5guQNf9rvxKdT/LUxeKLg8p6cCR8Ef6+7dOk50QNc9spUWVFrxDkdM+ajx
    /HVfYrku5Kc10chnfvP/Vs9nEolY4J8nvRYuVxmEY7TrNbTjF3NYTrJvEg5Q
X-ME-Proxy: <xmx:OHyMaqb-RBCHF_QIP2jOY7TgilnlckI-6v7FBWiBDXEomaOSA0c7oQ>
    <xmx:OHyMakQMkwmX25Z25kT-BqUb1Be37bxNygY5MEkpqLCa0S_aEiRb8w>
    <xmx:OHyMah7S4oEqdW6n1QqKjdKlMYEp4V4JDrE2229jieOeRiikvVDX7g>
    <xmx:OHyMapx01Tvilt8BDjzdgWHRl_lfAVo4zLkxnfCO8kplejv8w8wVYQ>
    <xmx:OHyMaoYqsC44zkUytvgix7TwVNZO7IrLPhalhWoYBYp3RWNTAhchpoDy>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Aug 2026 13:15:34 -0400 (EDT)
Message-ID: <042a154cf3f65594e4d46156f4df835195b68f90.camel@pbarker.dev>
Subject: Re: [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
From: Paul Barker <paul@pbarker.dev>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "yoann.congal@smile.fr" <yoann.congal@smile.fr>
Date: Mon, 24 Aug 2026 18:15:33 +0100
In-Reply-To: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244146

On Mon, 2026-08-24 at 15:20 +0000, Jakub Szczudlo (Nokia) wrote:
> Expat does not track whether its public parser APIs are called from insid=
e
> a user handler. Re-entering the parser through XML_GetBuffer(),
> XML_Parse(), XML_ParseBuffer(), XML_ParserFree() or XML_ParserReset() can
> therefore result in use-after-free and memory corruption.
> The 32 upstream commits are divided as follows:
> * 01 introduces the handler call depth counter and the helper functions
>   used to enter, leave and detect handler execution.
> * 02-04 are preparation patches. They extract handler calls from compound
>   expressions so that depth tracking can be placed before and after each
>   invocation without changing handler return-value semantics.
> * 05-26 instrument the individual handler types. Each patch covers a
>   distinct callback path; omitting one would leave a route around the
>   API guards.
> * 27-31 add the actual policy enforcement to XML_GetBuffer(), XML_Parse()=
,
>   XML_ParseBuffer(), XML_ParserFree() and XML_ParserReset().
> * 32 adds regression coverage for all five rejected calls.
> Documentation and Changes-file commits from the upstream
> series are dropped because they do not affect the fix or its test
> coverage.
> An explicit XML_Parser cast is added to the regression-test handler
> because handlers.c is also included by handlers_cxx.cpp and compiled as
> C++ in the OE build.
> Upstream pull request:
> https://github.com/libexpat/libexpat/pull/1246
>=20
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>

Hi Jakub,

We have already rejected a previous attempt to backport this fix due to
the complexity [1].

We have updated our policy for the stable branches [2]:

    Patches submitted for a stable branch need to be isolated changes that =
are
    human readable and understandable. Fixes for CVEs or other issues which=
 have
    a high complexity, consist of a large number of commits and/or a large
    numbers of changed lines are unlikely to be accepted due to the difficu=
lty
    they cause with maintainability and scalability.

[1]: https://lore.kernel.org/openembedded-core/DJJ4C13UUF69.11ICUQHKB6WN3@s=
mile.fr/
[2]: https://lore.kernel.org/yocto-docs/20260810-stable-patch-complexity-v1=
-1-f192d51f6311@pbarker.dev/

We're open to discussions of other ways to handle this issue, but we
just don't have the bandwidth to review this patch as-is.

Best regards,

--=20
Paul Barker


