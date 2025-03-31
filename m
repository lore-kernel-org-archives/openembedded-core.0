Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA1FC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 14:13:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.53045.1743430404603719629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 07:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JTWrkjZ3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso310168f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743430403; x=1744035203; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qX2ko6FBV6BYfvtCVt94m4kiPRONvxHiKVZWvs/rvQM=;
        b=JTWrkjZ3x50+4NFbzoB8Q1Z5PR2tK/mINxn7EzjPVOEZu/qNro9hQE3dx0Ks/S1/jm
         3DwnvHechiBdL3F7IA+0lu9Du+MuQ/mUBGU783qVlRk0rmJigonSSpm5SawC0nNkkgSU
         U7QSnZ3u9pm3kOZfFvWV7lLWo7XxHpeGx83h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430403; x=1744035203;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qX2ko6FBV6BYfvtCVt94m4kiPRONvxHiKVZWvs/rvQM=;
        b=m+gJfCmLYbT+PFgGLkS7bYcQRrvGhYotBUoG1JB9F9gB/PuQ1olI+PpgR+5npAu2cC
         BMG5KeJWOEuQ/PuVaj9D1oZ3HnlvXUNraZFGebLs8khmtCOKYTYPcZ963pu/crzGBcbU
         aiDpDFOzhX4nnl6cxxl0A4EzQv8PxYy8mO6puNXb8j/zsxF7TQLKvXntwTpBoW+xtfH4
         YEJI4fIjo2qUCdynpbHN3Bb39R4bZun8/nSHpnRetiiQINwQaedbhbqmECTOtT5Kb/6K
         D5jQwjAqxjmFPZ5w/BPBqYf8PvZY4qoE8eKo0GPfwCfB9KhGYgSfh5oUYrJnpnn4Du5D
         NHbA==
X-Gm-Message-State: AOJu0Yx4St7nOyOlmfeixNT5pmT5PfFMUmnUTTmaWK8VpOv1GcM4ycy2
	uoOrY0KIrn4JriNz+JUB6cjOuFpA4atkav/JM6TJawIus7lkyGXe16/Shm4axGs=
X-Gm-Gg: ASbGncsXtq4AVVeXRZbgRRKGFRkpBMKH3hNxvhs8wD6v0aZx/AfaSpdnxwQbO+8toyZ
	p4P57sHpeMS4sIdhpFoEzPCqyaD0UvFikovahAGDfJXjMWO9YUTMUt3Etwh6kBBnPyxtGSYzvRF
	UPtKEXGCmjzN9p2M6czTn/a95SIDOnP4LAJy7Tx2lg7xHcn/hMKXT7sLzFGVp3VXEOJZYgaIh0H
	MBfKr7AgG3j6HDwdbn97FZEhHsMP1pEmhB5nNKRTdtiarHRGJvHgL2oWSS4WKJZJudqm0EP/Nre
	/f8YBmO9SLChLbWCYEdUWCzKYLODBsKr3Ez+RMCJakqTDZx3QqCNR3B/L9FTMoZ9CvLRJgfSXEB
	6DGvjQxWkprTLB0HLieUNeH7YaygXnWteAA==
X-Google-Smtp-Source: AGHT+IEeTSnm6zvEfJFvgAfDx4MbovdJi5aJYq9tI5DqDiB58jMDjyEnnhSreFgF/FPPUQ7SK9bwHg==
X-Received: by 2002:a5d:6a0b:0:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39c0e0eb723mr8374221f8f.12.1743430403035;
        Mon, 31 Mar 2025 07:13:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cecd:333d:8d41:42d7? ([2001:8b0:aba:5f3c:cecd:333d:8d41:42d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314e110sm169086205e9.39.2025.03.31.07.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:13:22 -0700 (PDT)
Message-ID: <259308841ccfd6cbcdcef5de8c6157276af32386.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] create-spdx-3.0: make create_spdx depend
 on CVE_STATUS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2025 15:13:21 +0100
In-Reply-To: <CAJdd5GZQZSb3NC3DRuW8rXGN610hKmHc9sOSQigc-qkm6RXjew@mail.gmail.com>
References: <20250331111128.317469-1-peter.marko@siemens.com>
	 <CAJdd5GZQZSb3NC3DRuW8rXGN610hKmHc9sOSQigc-qkm6RXjew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 14:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213981

On Mon, 2025-03-31 at 08:11 -0600, Joshua Watt wrote:
> On Mon, Mar 31, 2025 at 5:12=E2=80=AFAM Peter Marko <peter.marko@siemens.=
com>
> wrote:
> >=20
> > From: Peter Marko <peter.marko@siemens.com>
> >=20
> > SPDX3 classes now add CVE_STATUS information to spdx.
> > So the task needs to be rebuilt when CVE_STATUS changes.
> >=20
> > This is true since commit 1ff496546279d8a97df5ec475007cfb095c2a0bc
> >=20
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > cc: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> > =C2=A0meta/classes/create-spdx-3.0.bbclass | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/classes/create-spdx-3.0.bbclass
> > b/meta/classes/create-spdx-3.0.bbclass
> > index 044517d9f7..235bd804bd 100644
> > --- a/meta/classes/create-spdx-3.0.bbclass
> > +++ b/meta/classes/create-spdx-3.0.bbclass
> > @@ -138,6 +138,7 @@ python do_create_spdx() {
> > =C2=A0=C2=A0=C2=A0=C2=A0 oe.spdx30_tasks.create_spdx(d)
> > =C2=A0}
> > =C2=A0do_create_spdx[vardeps] +=3D "\
> > +=C2=A0=C2=A0=C2=A0 CVE_STATUS \
>=20
> Seems fine to me, unless RP thinks we should add cve_check to
> BBIMPORTS instead?

That would potentially see off other problems in the future. Is there a
reason we wouldn't want to do that?

Cheers,

Richard

