Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21FCC282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 11:07:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.19504.1741086441770255081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 03:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NO4w++iZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3910e101d0fso1264149f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 03:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741086440; x=1741691240; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mxdR6cPMzuoJbLqc1n+p4T7KN9psbuCmVTdn0t100lo=;
        b=NO4w++iZZjzJrn5tb03Pg8YMgdcUYeLDoxtTalp7Jp+OjWxqSvX2Z6cKtMD1nc663/
         t9b5BZZVgrGGBqw9b1fVLo/29T0yOi20abgbCZ7Q5XEzC/+E/oLyk6V5B4b1uOmpySsP
         /xMRBM7UjRU7xlmKP5qslzCtoFNaR1Mf4+jXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741086440; x=1741691240;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxdR6cPMzuoJbLqc1n+p4T7KN9psbuCmVTdn0t100lo=;
        b=BCUIYcCQJ0aS7YHIpcSpdmTnixE4qx7uFaHtI1+NGsk06uRQxDt0BG5QqPyD73sc3Z
         /5kCn0KdTcYuYQhQkjzsazsln/vsULsYJmhAA5JfYoDl17glmdm91RwZiJku5gpiCMwq
         uWfilXdzdq8cI4mHL2myihyg7C2pxUGI5SQLkRblz4WaBRR+qBLxw9lswWBfNE/KXd/H
         gCnqpKHt7Kpi3Cvqbq/XDeJoybLaNtc1kqavJmq8obIyWaA63prLK8N66wpLJnsVELFZ
         aeyYTkd45ea/otWyIWgxLWNyyMCubXtGoebBaPyHMy2D7mbCUSPJtpKkOn6WhzC9kZCk
         DswA==
X-Forwarded-Encrypted: i=1; AJvYcCVmvFQ/XkPyL2TnFEpPhEoqWgBBvtrwVOttVjCtjBapo0Is75sBr3ggyNiYnqmEAX1RFg38qDA8ga9+V6VPKFUmMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfMbhcs5y8s0CwhSUIisTKaPf0D4Ppo3sRNpJg8GJXJJ2DJujl
	iFmd7zpYDAki5KjgeU4ok+Gei/hmeWo+7WMm0SEz2vbu3NOoQOUnh+wSOTAJPux0wId+MpaEvZ1
	o
X-Gm-Gg: ASbGnctWT5eFqDN/3VjAHm0e94KcokwZ3yJ73sDMxscE3w+hGuoXiyDdm6aYL4ZHAgL
	mciRqzmDqhevsHDN+4TxXW6uzrB8wlupthSWjeP+eFYhCuEFQwvBFT9bjPWhBJBngNkZyHXCrjf
	lMpeLU/oDSDTpFH+6IdeRuA/ndxbb9KDfDZYN0qS/3nmmYQPvFzkgOBq9ntxwdf2NVrABYiyg4B
	GYD6r/33r8TYsiXpEoFZ7pRVLRXpXhKCYFZU3N7YX9BNmQ4zBtp5jpcGzjNUuHgW5L9QaoVfVXs
	JiUzWlgBHP6DRRCoFuOk5WLf+qbC7C5RbZRTixLsLTjLyFzfmhSQf+onvCujEt1dzKmv2Y+LLno
	8TKNzPF+ymaUdcBXrZ1FFNaiJ7Z32hhtJyg==
X-Google-Smtp-Source: AGHT+IGxAk2Ra9C3V8eUFwJM8JxpONGdlO+puDtjJslICAeGsW/EKIDiLr5Lq2EzquaYnH3wkD96jw==
X-Received: by 2002:a5d:47a7:0:b0:391:225:9521 with SMTP id ffacd0b85a97d-391022597dcmr9132560f8f.38.1741086440023;
        Tue, 04 Mar 2025 03:07:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bea3:48e1:f1c0:6abe? ([2001:8b0:aba:5f3c:bea3:48e1:f1c0:6abe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6d31sm17105499f8f.42.2025.03.04.03.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 03:07:19 -0800 (PST)
Message-ID: <1446ceab21e01caf44a92b0e6b327a862a85d5c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 2/3] rust: Fix build break because of
 download-ci-llvm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Tue, 04 Mar 2025 11:07:18 +0000
In-Reply-To: <4ab6c642-5574-4243-89a1-a4c06997cfb3@windriver.com>
References: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
	 <20250303153458.2879205-2-Deepesh.Varatharajan@windriver.com>
	 <4ab6c642-5574-4243-89a1-a4c06997cfb3@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 11:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212261

On Tue, 2025-03-04 at 16:04 +0530, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
>=20
> On 03-03-2025 21:04, Deepesh.Varatharajan@windriver.com=C2=A0wrote:
> > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >=20
> > -----------------------------------------------------------------------
> > > thread 'main' panicked at src/core/config/config.rs:2047:13:
> > > setting build-target.llvm-config is incompatible with download-ci-llv=
m.
> > -----------------------------------------------------------------------
> >=20
> > Disable the automatic download of pre-built LLVM binaries, ensuring
> > compatibility with local LLVM builds and preventing conflicts with othe=
r
> > configuration settings.
> >=20
> > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
> > ---
> > =C2=A0 meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
> > =C2=A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-d=
evtools/rust/rust_1.83.0.bb
> > index 2bf87ba27e..ffbac267b6 100644
> > --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
> > +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
> > @@ -129,6 +129,7 @@ python do_configure() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [llvm]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config.add_section("llvm")
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config.set("llvm", "static-libstdcpp", e=
(False))
> > +=C2=A0=C2=A0=C2=A0 config.set("llvm", "download-ci-llvm", e(False))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "llvm" in (d.getVar('TC_CXX_RUNTIME')=
 or ""):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config.set("llvm=
", "use-libcxx", e(True))
> > =C2=A0=20
> Hi All,
>=20
> Previously, download-ci-llvm was set to false. However, with the=20
> following commit:
> https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f=
95b5383c=C2=A0
> , which has been present from rust_1.83,
> it was changed to true. As a result, after updating to rust_1.83, we=20
> encountered the following error during the build:
>=20
> -------------------------------------------------------------------------=
-------------------------------------------
> > thread 'main' panicked at src/core/config/config.rs:2047:13:
> > setting build-target.llvm-config is incompatible with download-ci-llvm.
> > note: run with `RUST_BACKTRACE=3D1` environment variable to display a
> backtrace
> -------------------------------------------------------------------------=
-------------------------------------------
>=20
> To resolve this issue, we are setting download-ci-llvm back to false.
>=20
> If no other issues seen in the AB , we will send a V3 with an=20
> explanatory commit message.

Nothing was seen in testing so far so the series is looking ready to
merge. How was the previous world build failure from v1 fixed out of
interest?

Thanks,

Richard


