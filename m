Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA73C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:53:00 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34280.1789631575397104532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=dQPqXoXa;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=wRL40kuP;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44F38140003C;
	Thu, 17 Sep 2026 03:52:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 17 Sep 2026 03:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789631574;
	 x=1789717974; bh=X65nna6SJtk6fiXob76U/dDokVUROLSj+AlP6d3cTPo=; b=
	dQPqXoXaz4XoWiKFpCuyzlJrw0s4JdLinabt7QKiQH2ujo8FsRMY40s2PIju0bSJ
	/6MRp9iP3qM5FG4tpJ7I3oU563xnzcHj4Vyx816OlD4h1Nm6aCkmZbXcDqGBckRG
	57KZ2rsoPuK2HK+XagCD5naw+VbDDN+l5KOi8kkoOZlrPNYE/ovPDqcWne/uGr3w
	GIfCLm5QW+i9wS0weigwbkGBB7pXegw8khjfjBwgvRf/L4+Jy+r25IcRV7PKLIRI
	fiOy3jbHOFzgi2ivMPyPeXd4+xZUX9wIIW19jKQ3AbJm4G+GPtI+IyuTl1UvWVho
	aOw1vvrl0zhyEyNZ1xwo2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789631574; x=
	1789717974; bh=X65nna6SJtk6fiXob76U/dDokVUROLSj+AlP6d3cTPo=; b=w
	RL40kuPvKWpET9ZqyZPXkMLEYZsQgFiAlRHoRWsTOxOGW5o7+0zbwEX5cRTI96rd
	q+OGSnnLq62AA3MV6VuionT1yTi7oKrH04FOe9xDBFGu1TufxyGBUnvUBxA7X+xQ
	qBOpYEKMlIf5mze4FEmdJeu1zrGwOZHwv+9d456awtnhGXg43JvwDt70egPsiFD8
	vNlfHnlwoH8UAhmABCs4RyMltzOgXdfmyrqbmxxdxRh/zM2y01xgrFWDSoDwxTpd
	jFLYBIcTqxy3EyjQdqF/pgor29GWXXfMMSmU/unNU2UE9fQfdj8TZd7+HUmvGhKi
	XIdB+ISvg0WWx6OOQjiYQ==
X-ME-Sender: <xms:Vpyrag-5Y9mXNo0Y-wbqKQEil358v7p1cxYonMNoIE15tQ5SOq6imQ>
    <xme:VpyragI9X3XBXftUEowjmhYdK8DiMOofs2UQqhLD_7yk9WN_4GnKDfDIVEQlmUrP9
    BDsubYDFq0z1VgD7d-xMf8oJr00iTWSDoFbj7dNjchDT4nT68hAgQUyCQ>
X-ME-Received: <xmr:VpyrajbOsrgXaN43xJDjJQ4mkSI1KHc_Aazt_czm1o0sSsn_KTj8jPAY4ATnLhW8b_7CgdiMFMabB-WrtRNtgpr96EJJPCdPAZhqihVV5M-Y>
X-ME-Proxy-Cause: dmFkZTE9n+Iq3hVWvd+gZLFNKb2mzOSV3Q7aM3rAjOlBY4zQx8Fvel02FG6wPBzpxjLHZ3
    3cBz2h3Kc74/shiSmj3ECATCaOGHYMg2T7VUBvAhv22fquhZd/gxQ1bne9J4xqnh3t7vSD
    G89nmYtvbnSsCTpVGA8OHoIwYyyCZvljc0BuFOWSrdOmyVDtR/Dygi5sAi1q6//12o48QS
    56FFVEcOd7e2Jj6tnuLf16Uv+vZbC6ONgYaINimngUbfVqXIHabgBckG48G8OI56DLPpC+
    IG5WXaIJrDjfIGqeHEJi8Xkj8LeuT8hAKDtDYvlKzm8GANVDjMMEIko9h4Xam4Ss6NZOSu
    Jz2AYcgvvxXuhtmpyfw34XlUuhIm3fQrsbyUONaRH6S1KgYhXDW3MU3m95f3jNIFQYIuWz
    RYxZ42KnmCvJAG8Wivx+BLe4v/AVNxlIjfhbfdIX5Qj60QkcU7Mhct0zQ1U4nPiZHsMpzI
    Y+3q91wBYmoES0H32prz9BpjRKgjCppUd5V2BuAgevyoFjZzdsd3iomUWlhVsnknVjhp+8
    TecU8J6DRYIWWnSgQpYEDNuGl+b2iY1U3srQRhm8jI2H3V6zdzsKxVzhXaWOMKuABlQB1g
    WVJ1iUSy7RbdDJl1X1CeG4Q7ns3FEj3BFJhGSwC9p8fqjb9hYFRpxfW5CHFA
X-ME-Proxy: <xmx:VpyraqLU-B98r9yV26a4480AaKofBYtIa87XXfQAYVkhfpz1wSz1fA>
    <xmx:VpyrapCQtRd3ougkdPn8t1QB1uYYlLLSFF3CWg2Z2JvMfxDLfuE9Hg>
    <xmx:VpyranpugWeGWZ5pA1-oLPpx5ZwBZydJssuBIYjeJhYy2xg5GfXMBg>
    <xmx:VpyrasivqG2aa83uyM9u3fUz4uemQiO1tJ3QMfkooQSmXQoDzhWwLg>
    <xmx:VpyrauvH2tVfn99Bq_H6x9Zj6BHEufRRCOM2cklVrYi7eqxFU7Zp47lK>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 03:52:53 -0400 (EDT)
Message-ID: <5b8a0bd86988efd3ea73b38aa3e04a66a59d185a.camel@pbarker.dev>
Subject: Re: [oe-core][master][PATCH] libgcrypt: Update license for dbg
 package
From: Paul Barker <paul@pbarker.dev>
To: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>, 
	openembedded-core@lists.openembedded.org
Cc: Sana Kazi <Kazi.S@bmwtechworks.in>
Date: Thu, 17 Sep 2026 08:52:52 +0100
In-Reply-To: <20260917063747.1037155-1-UpStream_IP-SK@bmwtechworks.in>
References: <20260917063747.1037155-1-UpStream_IP-SK@bmwtechworks.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246045

Hi,

On Thu, 2026-09-17 at 12:07 +0530, Sana Kazi wrote:
> From: Sana Kazi <Kazi.S@bmwtechworks.in>
>=20
> Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"

The commit message here says what you are changing, but not why. Please
include a brief explanation of why the -dbg package license is
different.

Best regards,

--=20
Paul Barker


