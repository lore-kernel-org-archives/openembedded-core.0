Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0F9C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:15:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.2547.1748549712082315452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OXUHLhRN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso10156325e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748549710; x=1749154510; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyXsvRH6lwS960MSXGmp2ttS96vQ9p7LvEf/gZj8fy8=;
        b=OXUHLhRNlZs9naasP+LtguRcYNcSda9/mx06llf9i4TdLHLNp7AIcESXFk8YDxOcOL
         DLGVgwfUHMzc7ygKiDxAzdbfRQMYxdMcm1U1Hr11qwkWgH7rC47kupmaDQN8PkJ8fTVC
         hNHU+ISQuDxx9bjVrdXfy7J0yCPKDAmCqKr3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549710; x=1749154510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qyXsvRH6lwS960MSXGmp2ttS96vQ9p7LvEf/gZj8fy8=;
        b=ipTy9OxNppNiUsx1T9kmOmtgluEDnM9+ccAMhcNerbD1Xczxg2UxQes5iTFUZsfJFd
         KEMufDp7aQckyVq55y64mEwh9zzeockLU61eIQfpJN9s+ycbyTwPoMhbekDMDju/ncWk
         GxELSpNUcFKroZa6fmNTmQe6I11vUAcA/JvmPBP9dspwAegiVq5wi2eNAh6cZxIoBhYr
         N6Rq9hHJSS+Sb2BCcakXtIEUnfJdxQLh1kvMAyFsPlTOxApIpx27Vnth1T3YaI0LVoWd
         xhXdilkVJDIJKRmISdmmqpiGq3SqVTYI3t1IBHRofkDDZ7VNH1xZQwyrpMcgL5haE/cL
         uI3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7+D1oaZG6nNNADrDHA7yaxDeZJaDGp1ggPU83kcmPRX/cocAXq2yO3RB9i4TQGkNdPG1Iprn7/oXJNBb1MAk8Ww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKo5Oz1BjCFaGppcDFCHMSYEcRnL6oKEfUzlaxZTOMaHfhbwSs
	4L2ws42Jjcgu5WdLQHTaSkeNaQxVXO0GaBbssL3Yx0MlMOo5s7NpBsO6ZmzdyodfpAA=
X-Gm-Gg: ASbGncv55AgyZZDgkgCDAkr5W6jBzgLKHd8iW65yzafvLkC8+IeWskEdZgjFe2fP+m5
	Kpm5VUgioqm1rbw+DmZXUXgefflX2Yig7uJ+wMaIOJ0V7oluDe/RSlV5nbTOd6bUxa/OcXJqubJ
	dvipl0iZj4f/V4B/fp1J6/eUjZxbQVQPHZ+A2o+FTUu6pGiYIH9+uht9etVaUOYYCxV3q3JGp7Q
	tCIC8Vhifl2IWgR4o8c/kDVmYLbatBHuFcJlzSGflwilQmLSrT2+aPjFxatEgIQtZnRqRB8q+p4
	1T2KyhXiIER57Iprdo/lI1xQG/1C1WO9KJs6/7Y7wFHQG9q1z70pMsYhHODbbtarjKXA99UlRsE
	ER3UH+iwXzwfKtYgAdxq86zyZJnF5WTRb9GsQn6m4
X-Google-Smtp-Source: AGHT+IFwT1epvt+7wWCiyhjq9P6+WTVaOzQKLtzP2OpmGaKCCHcDFUFFhTu9DzcPdVWM+SRQ5RRaWA==
X-Received: by 2002:a05:600c:1c8b:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-450d6536385mr11238955e9.10.1748549710401;
        Thu, 29 May 2025 13:15:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3b45:5e9b:189b:a16c? ([2001:8b0:aba:5f3c:3b45:5e9b:189b:a16c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61630sm74667815e9.0.2025.05.29.13.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:15:09 -0700 (PDT)
Message-ID: <b175dfb344278086015735e6f8a0e7a66dfd3e32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 05/13] tcf-agent: Fix ranlib call when
 using llvm-ranlib
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2025 21:15:07 +0100
In-Reply-To: <d8f36286-97a2-4189-82bd-79b66afa9c9e@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
	 <20250522-clang-toolchain-v3-5-16cfc6d9891b@gmail.com>
	 <a5225b45761850e1a99e7f3c069768f2449fa472.camel@linuxfoundation.org>
	 <d8f36286-97a2-4189-82bd-79b66afa9c9e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217436

On Thu, 2025-05-29 at 10:59 -0700, Khem Raj wrote:
>=20
>=20
> On 5/29/25 2:20 AM, Richard Purdie wrote:
> > On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org =
wrote:
> > > This ensures that binutils-ranlib or llvm-ranlib
> > > behaves same as gcc-ranlib
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > =C2=A0=C2=A0meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 ++++=
+
> > > =C2=A0=C2=A01 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/=
recipes-devtools/tcf-agent/tcf-agent_git.bb
> > > index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233ff9=
1c8f112b8122a5c6c30 100644
> > > --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > > +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > > @@ -51,6 +51,11 @@ CFLAGS:append:riscv64 =3D " ${LCL_STOP_SERVICES}"
> > > =C2=A0=C2=A0CFLAGS:append:riscv32 =3D " ${LCL_STOP_SERVICES}"
> > > =C2=A0=C2=A0CFLAGS:append:loongarch64 =3D " ${LCL_STOP_SERVICES}"
> > > =C2=A0=20
> > > +# This works with gcc-ranlib wrapper only which expands $@ shell arr=
ay,
> > > +# but it will fail if RANLIB was set to <cross>-ranlib or
> > > +# <cross>-llvm-ranlib has same behaviour
> > > +RANLIB:append:toolchain-clang =3D " $@"
> > > +
> > > =C2=A0=C2=A0do_install() {
> > > =C2=A0=C2=A0	oe_runmake install INSTALLROOT=3D${D}
> > > =C2=A0=C2=A0	install -d ${D}${sysconfdir}/init.d/
> > >=20
> >=20
> > The people on the patch review calls are struggling to understand the
> > issue here. Could you explain this a bit more in the comment so we can
> > understand it?
> >=20
> > Does this imply there is a missing piece on the commandline in the
> > makefiles (or whatever) of tcf-agent which should really be fixed
> > instead?
>=20
> I can explain it a bit more. tcf-agent calls RANLIB after calling AR to=
=20
> create the archive [1], when RANLIB is set to gcc-ranlib this goes=20
> unnoticed, since calling gcc-ranlib without any arguments it silenlty
> does nothing and exits with return code 0, however, calling ranlib or
> llvm-ranlib does demand library name as commandline option and since it=
=20
> is not there it exits with code 1
>=20
> aarch64-poky-linux-musl-llvm-ranlib
> OVERVIEW: LLVM ranlib
>=20
> Generate an index for archives
>=20
> USAGE: aarch64-poky-linux-musl-llvm-ranlib archive...
>=20
> OPTIONS:
> =C2=A0=C2=A0 -h --help=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 - Display available options
> =C2=A0=C2=A0 -V --version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - Display the version of this program
> =C2=A0=C2=A0 -D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Use zero for ti=
mestamps and uids/gids (default)
> =C2=A0=C2=A0 -U=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Use actual time=
stamps and uids/gids
> =C2=A0=C2=A0 -X{32|64|32_64|any}=C2=A0=C2=A0 - Specify which archive symb=
ol tables should be=20
> generated if they do not already exist (AIX OS only)
> aarch64-poky-linux-musl-llvm-ranlib: error: an archive name must be=20
> specified
> make: *** [Makefile:53: obj/GNU/Linux/a64/Debug/libtcf.a] Error 1
>=20
>=20
> When we add $@, to RANLIB then it becomes the make variable,
> $@ - An automatic Makefile variable that expands to the target name (the=
=20
> file being built)
>=20
>=20
> so the makefile target now rightly adds the .a filename to RANLIB call.
>=20
> tcf-agent seems to add $@ for solaris and osx, I guess someone saw the=
=20
> problem on default ranlib on these platforms but not on linux where=20
> gcc-ar is used commonly.
>=20
> [1]=20
> https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/blob/master/agent/Make=
file?ref_type=3Dheads#L53

Can we open something with tcf agent to add this on linux then? I'm
just worried this workaround is fairly fragile and likely to cause us
problems in future. In some ways I'd rather patch tcf agent for this
issue as that would at least be clearer.

If we have an open upstream ticket or patch, then we can probably just
append the variable for now.

Cheers,

Richard


