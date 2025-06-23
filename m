Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21207C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 21:03:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6105.1750712627802457228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 14:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RrfbtfYv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a582e09144so2805512f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750712626; x=1751317426; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJCBY4Vc4TT+394M6p19Re+AHlwtgXZE1UKyeQN6giI=;
        b=RrfbtfYvXrbEf3DMTc7dxg2sna2hOlP55JD6dcu8Q6vXaScWyRNrZ1gLhp8rzHXCVO
         W/ow5FFGfTUDYTOnWxYxdh927eboghVYWgB+UeXcst+WYSfEkY627qVlz3H2aAPU+WNp
         g5TXh2eDteZraq7mJYequVJ7Za/RFEAvN8a2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750712626; x=1751317426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJCBY4Vc4TT+394M6p19Re+AHlwtgXZE1UKyeQN6giI=;
        b=BaR3Xzsx6OI6aXWXKXTC10DPkBrLLOkfVY7lXH3+om02gemn3u9PxqJg4RvVivkSvr
         g/oTX4ZZtbX6/uAOgAoB+gG97s1paH449b/XoiQ8DY3NxtMvMuU6QORoJw9lmWBeBvyi
         E5b8i7Fj1a2CYAkHd/UD00I6w04Fgl3m489MM/UWpHVDt7VrY3hZOVzLrDqp/xplFNYm
         5TXo5EdOuQxetxITDXiZAboR7iGnw4MPUoVEKIl7Em8vOeqPa+wTLdBsIMSSbAYUrFng
         J2v/0eVqdk4xGTuiCSyoOxlAu8cVomrTB95g2NAXI4gDqyGeJ9WNohNwdfeqJ1SdHTYu
         IXaQ==
X-Gm-Message-State: AOJu0Yzmq7iK6km3w+orInF5ZSVIjcNyiwx9wYEULzhT5MqKJEGxmuqf
	iEJOl4i6aKH7dj7eqXCIhsYnqJF6rs4tMJyEGlsgD1moUEaq20Mr7T0WId2mSsi1Njw=
X-Gm-Gg: ASbGncuvtifMSQmZqziOZM7xGcsjlS7VN/JHMIWfrQ3r17icrFtTFMAw0fvvhQfLhBX
	ujpPcVmIo1UAfXeu+ByyTPNBgND3VKSrUJxeQL55aSK26ONxbzJeMHptiF6K0Sv87CGlv8eSKxs
	DsqCX/2Z4xz2b9a+6DEniiHzJhZMdKsvWefcGlZAb4EVY4oZc4KCJ8+3LHff70nDzX75Nf7yJQF
	DF0hCdG+4RwgPPMv4NMyMUWXFtUbD9nTXaK4Vw9GqRHKiqbs3hXDv+8whcwOWZjusVfDr8LSMGX
	zaJcxZsMvll5lzBxFMjuXi+LbsqbZgORMyNYeLMMFdMAic9xTD1e4sU4BGY5xdSzF3PxNIR04eh
	QEFr+cJkukMfk0T0h07wEcc6twoBwvDxM9ztv3FAFJPhmV0u8Mcs=
X-Google-Smtp-Source: AGHT+IHkzO7ELhKcOyGKWpHYXnMUCZri28PkEKMHjB5OlkH8fBk16iHQfCxU4GnHG+LI44pdtfpBkg==
X-Received: by 2002:a5d:5f4d:0:b0:3a5:1c70:5677 with SMTP id ffacd0b85a97d-3a6d12c2a99mr13047335f8f.7.1750712626118;
        Mon, 23 Jun 2025 14:03:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a? ([2001:8b0:aba:5f3c:8bf4:3d1b:6949:400a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2b8fsm110281f8f.59.2025.06.23.14.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:03:45 -0700 (PDT)
Message-ID: <4e7cb5788380fda8d01c8c159fc424174a7ee7c8.camel@linuxfoundation.org>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A?= [OE-core] [PATCH] clang:
 multilib-header fix for llvm/Config/llvm-config.h and clang/Config/config.h
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: maxj.fnst@fujitsu.com, "randy.macleod@windriver.com"	
 <randy.macleod@windriver.com>, "Yiding Liu (Fujitsu)"
 <liuyd.fnst@fujitsu.com>,  Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Kokkonda, Sundeep"
	 <Sundeep.Kokkonda@windriver.com>, "Dora, Sunil Kumar"
	 <SunilKumar.Dora@windriver.com>
Date: Mon, 23 Jun 2025 22:03:43 +0100
In-Reply-To: <TY3PR01MB120716B2F88E4BEC62380F198E879A@TY3PR01MB12071.jpnprd01.prod.outlook.com>
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
	 <488c0487-f767-4c4e-b74e-cdd1ba93ffe7@windriver.com>
	 <TY3PR01MB120716B2F88E4BEC62380F198E879A@TY3PR01MB12071.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 21:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219220

On Mon, 2025-06-23 at 03:03 +0000, Xinjian Ma (Fujitsu) via lists.openembed=
ded.org wrote:
> =C2=A0*=20
> =C2=A0=C2=A0=C2=A0if I install both clang and lib32-clang=C2=A0 what opti=
ons to select to
> get the desired multilib.
> =C2=A0* =E2=80=8B=E2=80=8BRuntime=E2=80=8B=E2=80=8B: Users must explicitl=
y specify architecture.=20
> For example, $clang -m32 hello.c=C2=A0# Should find 32-bit headers
> automatically
> $clang -m64 hello.c=C2=A0# Should find 64-bit headers automatically

Did you test this works correctly on target?

The commit message only mentions build time testing and doesn't mention
any runtime testing.

I appreciate the patch fixes build issues but there isn't much point in
doing that if things are still broken at runtime.

Cheers,

Richard

