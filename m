Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B11C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 11:46:29 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17084.1786621585377121929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 04:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=WaOmFkUj;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Wl6CK8zu;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 63E027A00CC;
	Thu, 13 Aug 2026 07:46:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 07:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786621584;
	 x=1786707984; bh=keVv90ptRmtwIngdZjpBw/NIzMxcmcTP9msDfVoB0UE=; b=
	WaOmFkUjF3WPEmi9VDxoTLvqrW9om8oi3ERDYfF3IDIFsnebzarMDDefCyAZb1Z4
	Anpl0oIGKU2GLwtUxhBjtTbC2178ktIy9/bduBwmqur4KhjNWSVRS0L3yfXLNhHR
	JhTA5oSb4Al46Ty1hm24G6Cs9mUQnc7Gs3OSXSjZ1YUUYHJxVevsyN9rgZ6BQ+2E
	CJ5k2lTq/bMvjIxlcNEUPS0uYuLQYQ+96QvtrUkFjCJbwpU2EEv7BcfVMvZOcyoC
	hsCmKbjuEmBkVw+Uo3zeaxLuRixSvfeH2egC0siJr2uZpc6gqm2+cdQpnpb6u3ag
	k2doHRAu8Z+MFApsJHO3GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786621584; x=
	1786707984; bh=keVv90ptRmtwIngdZjpBw/NIzMxcmcTP9msDfVoB0UE=; b=W
	l6CK8zumd3FJjf0a/fo+Wb2FLqPNmROZWk+rqfgFpCWR4k15BqxHr45BOat9hACT
	5X8u2JxJCj/ZhDd+GNz87V26s5KzyKdE/rW/gyxuGSGq+1sOnaA+47xCamAKpaY/
	EwtnJBiAFOqa+jN68hmdil9PYzw2RudcfeVo+ibSF3Oo3tjzDWjCQuRXcpjmhQoz
	634KcSkuoQsu46vGPVHEiS6hVT8nMcLwBfJo3yAM/hMwXpJRVj5mjPZy5KC2mMFZ
	1goyPBNNCE/dZIj0fpxeAwvD9hEMAsXvf6DFHDgvkiLi6z87AuE+qpgGxAjgdteK
	VKZYogXOmHqe+1urm9AzA==
X-ME-Sender: <xms:j659arLPcyyK2BDdSHIaqe4G1mqoYiZ2Mtp1HLm96alqIHxjvps3XA>
    <xme:j659ai2ccsWhts5gGwzocPNdjT7Y8qz62vUXR5piXWJnABTsK889upv2r1EZdM_VZ
    qxEgsvyxn3uxtHTycpsu8i_60XRqme7Ss9cP_2O7LG5fwWVV9YdeL3F>
X-ME-Received: <xmr:j659athHXFLAiyN5O9Egk7LXHNHc8c_Qm7XDgnCsdqgYrozo-EAzWcuBEMQhwGi4ShX6DJM7Pz4za2MEkGZVO73EE2EPfrtrUttvMd4>
X-ME-Proxy-Cause: dmFkZTEYSKvJcSLxgoAYxE7I/eo7m2fZDVGCHeDnsBIUHOAorbcL7j+07XNJqaQgkvDeu+
    iaY8FeSb+3vg0Uvys4bajC7P8cRocoH8yIWvgZW+wlk9Xe+FRZgsqtjyOF8kV9h0nLIQyy
    kfnLF8OybeltSYnDuBGNcZInQjmNPIx3rgbxBOAYvtq+3ZIjwhBrz2kZ5WI1kMM4b6gAUD
    nkiiUHjaDxf/wWqUYhZaBDB6+B4S5ydunDK3t6avLBdBiG4UvUWo8R8ueYhhwN66f2B5Qz
    xwbq1hWcGBqBekAEOI/WKHZTP+cYtIBGz9mmXX8IlvuLMCWpjwJBQfyyCVGIYiyemJD4bQ
    Z9vl3BQDa/KjXvQW58JJ7TvbkHahril7Xw6jeYMYTGgIvSgYsesML+sF6ObaCAu2Wlw+SM
    +hGlwfPeoZ4JhUawK1w4VNMgG8tsf7Edk1oMyhserRamp7GMp3C6jt5qLYb8arXpuY0Kse
    PWF01MW2cqLySTi9QZGBpzWLoQBeR1yILO2Np90RqbSkT0TDBFKOGUvZo/l3eikcYDFQnm
    5eMYJS5iYWXnjDG95k7Jxg9qWGiwTljPb6epYNXa8F3/krRgsEMoEqtIRwZ8gA8DYfYtBj
    4IU+exNBY4DVLpYcJPg6Hz5nJaedMTxrvGl3L4CqmJ011C0WwYaKauwaxJ/Q
X-ME-Proxy: <xmx:j659arUW5GjbCz2NBlAPJs5V2EbtC8W6cKaeQcvdd9rulFg9nnnoXA>
    <xmx:j659akUY1uBEd3KkqnheayfNK6CNVfiPhtn1oQFUoj8j5eioin_xEw>
    <xmx:j659ajhywtlr64s_-okRacD3ATKUX-2cq0HNWEeJLdS0J4A2o6t-yw>
    <xmx:j659anZoEVS3KBSlVke5NjSmIU6remxaiC94tGNIizUPs1H36gLOSw>
    <xmx:kK59arldEnyFzQEK_WzpUxfZX0q23C7qkmQGcJFkvIYIEoVV2u2JRbvc>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 07:46:22 -0400 (EDT)
Message-ID: <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
Subject: Re: [wrynose][RFC PATCH 00/11] sbom-cve-check update
From: Paul Barker <paul@pbarker.dev>
To: Peter Marko <peter.marko@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Benjamin Robin
 <benjamin.robin@bootlin.com>, Yoann Congal <yoann.congal@smile.fr>, Ross
 Burton <ross.burton@arm.com>
Date: Thu, 13 Aug 2026 12:46:21 +0100
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 11:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243349

On Sat, 2026-08-08 at 12:51 +0200, Peter Marko wrote:
> This series updates sbom-cve-check tooling in wrynose to current master.
> Unfortunately it shows that having cve-check tooling in upstream
> components violates LTS patch acceptance policies.
>=20
> In this case the most visible is python3-shacl2code (1.0.1 -> 1.1.0),
> but also sbom-cve-check-update-nvd-native introduces new features
> (which is actually the reason why this upgrade is wanted).
> For now this should not be a big issue as all the dependencies are very
> new and used exclusively in cve-check, however by time they may be used
> in other recipes or tooling, too.
>=20
> So I am sending this series as RFC to discuss future of CVE checking on
> LTS branches.
> * should we go with this series as is (possibly updating policy text)?
> * or are we stuck with old code for next 3.5 years?
> * or separate the tooling to meta-sbom-cve-check which would only have
>   master branch to service all currently supported releases?
> * or create mixins layer (to be also used by AB cve-metrics jobs)?
> * or are there some other suggestions how to rework this series?
>=20
> My preference would be to have cve-check aligned for all supported
> releases (even scarthgap), so I would welcome opinions and discussion
> on this topic.
>=20
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Benjamin Robin <benjamin.robin@bootlin.com>
> Cc: Yoann Congal <yoann.congal@smile.fr>
> Cc: Paul Barker <paul@pbarker.dev>
> Cc: Ross Burton <ross.burton@arm.com>

Hi Peter,

The TSC has discussed this series and is happy for sbom-cve-check to be
updated on wrynose. It's in line with the expectations we had when
wrynose was released, and the upstream maintainer is involved.

For scarthgap it's a different question. That still has the
cve-check.bbclass implementation instead of sbom-cve-check, this would
be whole new framework rather than a set of updates. I wonder if this
can be handled via an LTS mixin layer instead of a backport in OE-core?

Best regards,

--=20
Paul Barker


