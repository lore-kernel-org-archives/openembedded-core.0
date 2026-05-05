Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3049BFF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 11:37:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37001.1777981024194909884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 04:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/KmnWKM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso61409655e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 04:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777981022; x=1778585822; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ud2gXDtBU/ejEW/HK4Noe8QDaCuERk/m03QUmHZUbYQ=;
        b=d/KmnWKMURPHxFQchhjWRe9HY1/xY8NvHdm+RwTItvpYmGLq0fkXY4eli09wgdv+92
         ZR7JemCXREitorR5RINnXD/gQBiwQkFUsn+H7ZK9AQL/iXDG6CfLTGUOMx9RuSfEXMQ4
         gWErP+GrBbPDmxEf3T/+sOCLvO0Yr1K2Hg3DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777981022; x=1778585822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ud2gXDtBU/ejEW/HK4Noe8QDaCuERk/m03QUmHZUbYQ=;
        b=cKjcyAzZUw/dJf+V1ltB3gwwxzCwoCgl7jwKQbTHFO8Eg8brDaOmGK1DSCoLwvXnLP
         FNhr6e8LwjBiIHX+J6zI/hYFWzAAXd/J8wKuMctXpuGuvuOyAOCBopQZ81AvNK/MWn9f
         YavxsujanOwFODA8grh24exQKLGnhBMaFaUc/tEi4G0PwBQ+AiymR5gX8sS4VyLWzT2A
         4Tu0zP8Iv4OfU+cJr8+MbBJu19iTe7z0JaD69H9sI7b7G7Hr4CqvkRw+J7QYLSUpXrfE
         Qypyyh6bFdUGZjh85b7FeZaLTPuEy0w144AxFgJIvvqVMt6Eo4va/wUyuHW00oX60KUp
         mFPw==
X-Forwarded-Encrypted: i=1; AFNElJ9zW8HfbB19sm6lmIdq24wwJeWpGMm5IIfbIQ1+QecNRh83cIe1AoqKXaKgRvi3g3LQGncjv62QioJnKQkdp1zyEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4cKANVi2HhrPpPHb4ExufhF8EysIriQ8KyzoEQHcTtCZHZ5v/
	NgDzBOTCIThovsMsBpm52FC3fe0MP4nSyvrTQe393yNPUFSymjHLT9OuF6aXgwPOTHA=
X-Gm-Gg: AeBDieubFCSBq/8rsBq8mSoYYb4sjBYVoVUSHNTj3TpkC1F0VlMwkTQqmuzDu51bKX1
	2RGA4xfiAj3PG1O0tYE1DgCIUkHzv7gcLsyXSppFG8jwXNhapECg3jXOI26YNjFi5iK5P4TGGG/
	gTM93iMTlcTbLtRAT1NAyyqmfkvTxVBgcptyEgWsWlONc2qOcHl+DCf4pJmhbuOKmWZ64FRKlSF
	G1nqUMZOdVYUmPzQ6SRub0KXfgj/gH9ENvFry0J9iFzpOellTiL5WzWkdisqHt8mLriGvPC3yhN
	Ny8jHT5vbyQpIQsP/12/r3TusJgu27R4pSkardppsi/ESEM4/M0QX+kJrEcASvubKh+zoyYPLZP
	BaxyX2MJtF3AJptZC8FLfu5odGchIdkqLvuFaxuV58ynbPeLpn0/zOq/ig76TpQU6FxgFyJJsbR
	QsShrWVx658vPf8oFVw6G3KZnoyen/SZ3/6avh2mAt/BTvnNCugn7J3wUQ9axiDBSIdZ8uVgb/A
	+jOdLe+1JIHUlKyKH1X+5SR4XQ=
X-Received: by 2002:a05:600c:c058:b0:489:1e8a:90b4 with SMTP id 5b1f17b1804b1-48a9866f2e7mr153632505e9.21.1777981022539;
        Tue, 05 May 2026 04:37:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f2487dsm3887232f8f.35.2026.05.05.04.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:37:01 -0700 (PDT)
Message-ID: <17d5b6435efe2c6657d775b7f3154a9ff8e15bd0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/5 v5] clang: Set CLANG_ENABLE_TESTSUITE = "1"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
Date: Tue, 05 May 2026 12:37:01 +0100
In-Reply-To: <ba99f66b-3695-4c74-9f8e-df64cb944223@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
	 <20260505081625.849368-4-Deepesh.Varatharajan@windriver.com>
	 <5bb50c558f394d8e734019e00218fc45c4e1fc0e.camel@linuxfoundation.org>
	 <ba99f66b-3695-4c74-9f8e-df64cb944223@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 11:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236485

On Tue, 2026-05-05 at 15:36 +0530, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> =C2=A0On 05-05-2026 15:01, Richard Purdie wrote:
> > On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
> > =C2=A0=C2=A0
> > > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> > >=20
> > > While running testsuite set CLANG_ENABLE_TESTSUITE =3D "1"
> > >=20
> > > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
> > > ---
> > > =C2=A0meta-selftest/recipes-devtools/clang/clang_%.bbappend | 2 ++
> > > =C2=A0meta-selftest/recipes-devtools/clang/lld_%.bbappend   | 2 ++
> > > =C2=A0meta-selftest/recipes-devtools/clang/llvm_%.bbappend  | 2 ++
> > > =C2=A03 files changed, 6 insertions(+)
> > > =C2=A0create mode 100644 meta-selftest/recipes-devtools/clang/clang_%=
.bbappend
> > > =C2=A0create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.b=
bappend
> > > =C2=A0create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.=
bbappend
> > >=20
> > > diff --git a/meta-selftest/recipes-devtools/clang/clang_%.bbappend b/=
meta-selftest/recipes-devtools/clang/clang_%.bbappend
> > > new file mode 100644
> > > index 0000000000..32c236b972
> > > --- /dev/null
> > > +++ b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
> > > @@ -0,0 +1,2 @@
> > > +# Enable CLANG testsuite
> > > +CLANG_ENABLE_TESTSUITE =3D "1"
> > > diff --git a/meta-selftest/recipes-devtools/clang/lld_%.bbappend b/me=
ta-selftest/recipes-devtools/clang/lld_%.bbappend
> > > new file mode 100644
> > > index 0000000000..32c236b972
> > > --- /dev/null
> > > +++ b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
> > > @@ -0,0 +1,2 @@
> > > +# Enable CLANG testsuite
> > > +CLANG_ENABLE_TESTSUITE =3D "1"
> > > diff --git a/meta-selftest/recipes-devtools/clang/llvm_%.bbappend b/m=
eta-selftest/recipes-devtools/clang/llvm_%.bbappend
> > > new file mode 100644
> > > index 0000000000..32c236b972
> > > --- /dev/null
> > > +++ b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
> > > @@ -0,0 +1,2 @@
> > > +# Enable CLANG testsuite
> > > +CLANG_ENABLE_TESTSUITE =3D "1"

> > > =C2=A0=C2=A0
> > Having bbappends inside meta-selftest isn't something we've done before
> > and feels a bit odd. I think it will cause yocto-check=3Dlayer to fail
> > too.
> >=20
> > Why wouldn't we just set this variable inside the tests that need it?
> >=20
> =C2=A0As you mentioned, yocto-check-layer is failing due to a signature d=
ifference with this change.

That means we can't merge this change.

> The reason for placing this in meta-selftest is that we=E2=80=99ve observ=
ed
> intermittent issues when reusing sstate, where the required flags are
> not always enabled, leading to testsuite failures.

We need to work those issues out then!

> To make the behavior more consistent and avoid these sstate-related
> inconsistencies, we opted to set the variable in meta-selftest, since
> it is included by default when running the testsuite.
> That said, I understand the concern with this approach given the
> layer check failure. Is there a better way you=E2=80=99d recommend handli=
ng
> this kind of sstate-related issue?

We need to understand what this sstate issue is and fix that. There
shouldn't be "sstate issues" causing any problem like this.

Cheers,

Richard


