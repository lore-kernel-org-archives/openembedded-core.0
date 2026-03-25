Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF2FEA83C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 09:31:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18652.1774431059619469064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 02:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bRw2tVHK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so46305605e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774431058; x=1775035858; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f2BtnaDBxDmV1I5U+L7IX7g6V4I7cu/jg62Nd4rTsQ=;
        b=bRw2tVHKytvANtSNGKz4rGHWWMT8Lmh78kDemoK78TQZm6LBZvZdGrYvaqD8u8FwYQ
         J5EE2NlQ1ouKRNjrlhbYKdxwuk2EfjphiIG/wfs03tJx71PYs05x/J/nTii52v//55ss
         SydONQd/FyPNvZ61PX2g2fPLteiuCgvodbV+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431058; x=1775035858;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3f2BtnaDBxDmV1I5U+L7IX7g6V4I7cu/jg62Nd4rTsQ=;
        b=EnwvFlzNT0Z57qpgeC7x7wCbIgc6r6gcpadrNqmVQxv9Hgg5i0L09Z08IWls69fVdD
         XxnMoWC1q8PEU/YG8CAMCIG/QgXUh9jCYEcIUHf+V4fNrNVZQ4y0A1AzbXi6iiYaGhfv
         aCzrq4RaqhxsGFgo2JWNfuokrtZ1E2Q2PL44lNGfX5Rv6kHPwPAChJhpJ3rzGKnz6iCk
         hvSv2rRekM+Z1rLssZwmfrchzGRzZXyCrGpJqvCVecmD5A0JgLq+FCDb5GIyJ+H/gTyf
         RiAXIwaV1+YXyHFPvOQRXAfH0umIAg5419Nzu1QTWe61QuD+MrP+0gX6Wc1HRmmN3IuI
         23gw==
X-Forwarded-Encrypted: i=1; AJvYcCX0nv9YyDKXD1x0IrGLvgoOysilFAengWmmJTwJRL3EN1dIjO9PfGFfUVaRhTIslZfm191ZLsMVGJtM3RoZYAxMbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfWUlnkBP6l2tBFd/mf2TOdIJxNhH2tSw8/rt+5y+90xUXfcYz
	Eyie/WHRQPgpxA8xi7fLelbhM54y24IQgPYDRzmiVSDh88HojRxVKws1vDsXx2DSGe8=
X-Gm-Gg: ATEYQzxEwYaPozWJvL2qkbaK/yXWWw6LwKUF1XRTqmXMW2d4Yk38GuzpoBpWs9TTbUj
	FUbAEYjPVaPMQxyc1FT88NeHeLhWWowgtzim2hsFaWYznAIRatvn++vAPyd2HKHZISKrc1Kp9iM
	fD2J8/pTAmFdUc6iE4Y3zeH+szLQcvbCM1chsV7FyDVAsUx5UFuZ2INBU9FKdyNwe6VkuWEoxeX
	zUWm7xG/rrmv9m5VC64/hZQZ7KIKc3kpSeTlQP5HBSB2u/5EhQ2+ZqORzxa23UjP2G+uLAKE58Y
	bxuKgwjzeQYKh/2mq9PK8rgowp2AEzkuxI4DS+56sgvhMxAF+Zz8GjWvLorA4xZtTiYG5s2ObDw
	ZUB7tITf1tG6L8WnVoJbRfrFykI7c1nOT26wjmKQbQ+Fexbb3q0mukpjcE1bAs6fd5HvJQZfEQN
	Q2nM/JnCi3zJJAgQsE9lQqvUCj9BwIeHKPpHqK2i823SOPYh8l4kDL02y3YpxNAJhqEV/J38FAm
	v+s4Ekgml1AawbP
X-Received: by 2002:a05:600c:1f12:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-48716050758mr37823555e9.25.1774431057933;
        Wed, 25 Mar 2026 02:30:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:74e2:2425:51dc:4aed? ([2001:8b0:aba:5f3c:74e2:2425:51dc:4aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487166064fasm18231845e9.7.2026.03.25.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:30:57 -0700 (PDT)
Message-ID: <50afa4d55645c2ea126726c30ff2272bf0a9a499.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] clang/llvm: Upgrade to 22.x major release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2026 09:30:56 +0000
In-Reply-To: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233867

On Tue, 2026-03-24 at 16:08 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> From: Khem Raj <raj.khem@gmail.com>
>=20
> Includes support for new Intel (Wildcat Lake, Nova Lake with APX and AVX1=
0.2)
> Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features performan=
ce
> optimizations for AMD Zen 4 and Zen 5 architectures.
>=20
> Integrated Distributed ThinLTO is more mature, with enhancements
> like cache support for incremental builds and robust handling of temporar=
y artifacts.
>=20
> LLDB added first-class WebAssembly debugging support, including breakpoin=
ts and variable inspection.
>=20
> Support for Google Native Client (NaCl) is dropped in this release.
>=20
> Detailed ChangeLog [1]
>=20
> [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Rust toolchain tests on qemuarm and qrmuarm64 fail:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3401
https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3402

error: data-layout for target `amdgcn-amd-amdhsa`,=C2=A0
`e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256=
:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48=
:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-=
G1-ni:7:8:9`,=C2=A0
differs from LLVM target's `amdgcn-amd-amdhsa` default layout,=C2=A0
`e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160=
:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32=
-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32=
-A5-G1-ni:7:8:9`

I think upgrading clang for this release may be a bit too ambitious
this late in the release?=20

musl builds are also failing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3508
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3475


Cheers,

Richard

