Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11ECC5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:25:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51486.1786443948503224681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Evtbc2xy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so9227955e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786443946; x=1787048746; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZMUz97VXrAkdxZibruSP/077HzVuAf0Z4dcfAEeXwBs=;
        b=Evtbc2xyzPvZ60gviSwEf64AktEiFfSB4kNJ5SLbFkGYOBrRxG1vI09rS0xY7qwLoI
         91Qf6enmzxbKbHyF8DimibfjzXRwcs9aAnK1sQdvNt+0S6Ms2KydSqcdQf6hY0qxxdgx
         sAtGLzhJhCeq5V+B/jGSauzo66Gyn6R8Zafps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443946; x=1787048746;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMUz97VXrAkdxZibruSP/077HzVuAf0Z4dcfAEeXwBs=;
        b=bKdz5GpOYOWFIe/TJY83hcxTZejiDYb8AaeeavAMzYKU7K8C0ToV3JwhQDVbxcVl1C
         37DcxpIkUFl0Ezp+4c6JLSq7UEMg7TAp56VUbZ/tTwZARHRsBtq+s9PqcoqLyOmmDwLb
         ZGrpqDZF8L3kVtBijx2TqbMyjY6JzVmze71KdWrQEpUlMu1aKiAUTd2GDQ2UwQmcCj7x
         B9ifFl84W1H82ljoXpbPV92AyN/plBGZDk2C5xinNVHdh7j3yBqQkyuiEWMWbep0ep2L
         +cOGHuKc3zVyzHq6KJoYoBG9+Wis/8a8AKzqguitVuJEqU/fS6c4ogcSU07fxAm9jiaS
         GO+w==
X-Forwarded-Encrypted: i=1; AHgh+Rpb+ap5FB8KZ50vq9jaGqrq7/w0R1lJDz8yIX6iHpdamkY1IdVkNdDJST/ew6z17Z1IwvSNpf3TqLdDjKvszlrAbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9pxYaGF52CM6iKYE3PtR4iEIhCeMKTT4NHarxb1uLzRjHA7ak
	2k83OjNF5ARhTRf/ix0jXYGYzHzDVyFhNNg52JtIlxLo8NnNKu+RoVCytaPIJORyHw0=
X-Gm-Gg: AR+sD13eIfunj8TD2cQLpeVteRWLvM1/7SsZhnT7gtIgJKO2IAqcNLmtJF15PuycCra
	UvV14IfItNMKj5kYuGyXkzPKn+cvYgPKO+QU7Ho+hA82Zv4/ZQi20O7mqcSxfSGC/y22+vVFq6S
	JOsHrOquYaTikLpTexhYSH6gDiPjGv5Jtq/dIpuYHl9TVRc8Pog92bMwL3EL4YoQNWuFv4sA7pm
	Cr0sKd8zNAu7a6+g8VjXcNpJ3q/Gx3rC2bRSto5qXxxtW7rOdVWfealSLPkeGWnNLMXr4nxd/wK
	mdvR/C+F8YXZQ6ntRH0IXflq3c8lFGvbHdL4VgaoznVs1oE6DEC/f9l8Pgj1El4iJDFRVnsD71e
	cku0jMUMPOWePOsfPnA3FuEYJcwlOTIc7q4iPyLzaFt+Ti2qFXSxlbJ6JvTi1X8dCUNtPfRhKSE
	zvpqu3gNoQxLJBuQywR3PGOfMQRyEdw/F9ll1zjh/i7KjRCCQpsp/qYSNLJcALbHGI0pWCVvZcZ
	XSK5lh9t4KoAgpxYxMBntAIwH2+wRFgHybOUZuo0ag9UVI1nWdAYg==
X-Received: by 2002:a05:600c:8010:b0:499:79ba:a754 with SMTP id 5b1f17b1804b1-49979baa767mr9599665e9.11.1786443946496;
        Tue, 11 Aug 2026 03:25:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a? ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a14ed5esm3144348f8f.0.2026.08.11.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:25:45 -0700 (PDT)
Message-ID: <61f96793beba861118dc9502be1590176dfef6af.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] swig: upgrade 4.4.1 -> 4.5.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2026 11:25:45 +0100
In-Reply-To: <20260811061251.14757-2-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
	 <20260811061251.14757-1-jaipaul.cheernam@est.tech>
	 <20260811061251.14757-2-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243183

On Tue, 2026-08-11 at 08:12 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> ChangeLog: https://www.swig.org/Release/CHANGES.current
>=20
> Release Notes: https://www.swig.org/Release/RELEASENOTES
>=20
> CompareLog: https://github.com/swig/swig/compare/v4.4.1...v4.5.0
>=20
> - Refresh determinism.patch
>=20
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> =C2=A0.../swig/swig/determinism.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +++++++++----------
> =C2=A0.../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 ++--
> =C2=A02 files changed, 12 insertions(+), 12 deletions(-)
> =C2=A0rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb=
} (92%)

I suspect this breaks u-boot-tools:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/4370
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4214

and maybe python3-dtc:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4188

Cheers,

Richard

