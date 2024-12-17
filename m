Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA65BE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:14:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.91905.1734470053239113961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 13:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BMlvCMf9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso702555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 13:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734470051; x=1735074851; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M2MZ7UNHioD8JBmTk96iX2qso0/kzIUcJt/kg4OV2TI=;
        b=BMlvCMf9DVOI38Vj3+4Zf0UEgOMaIERZC9/b1kKOKQlTX+Wby4NB1iJdyAf5zlMHkr
         6XjJAUemjZEM7VtT1N/m7FtdqZiesHVpvdc3jA04xZqk65k3F+pRVrsIToxxUw7NA7SM
         bPXHdvrYg3rmRKFuf5H/XGQiKHQGo22B7pCeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734470051; x=1735074851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2MZ7UNHioD8JBmTk96iX2qso0/kzIUcJt/kg4OV2TI=;
        b=j7cdn+OYe0222by/1gdCcFTH/LtlFHUylwjiB9t+nLjvha3B4gl+eym2OgYlHMSLLV
         2WoQXyvm8OpwZvbHQF6S7QS7lncTGRfbzyONkYO2o0/0hdyKq2jITA+VDRqSSW7rfuu/
         dbLT9Xj4hfTBka5Xjfuwsjmfr515qE40fUqqtJcxplIDLr5DgXQrPC/03IuhvlZzE8Vx
         1vMuz879Hr1keU89jrydFR+rtq0EXh8FHS+ldOBnWJtjc28/MAkn9JmrTdeXbpPGYPlM
         w3A8FehiYA+F4Ha5QbqoEd7wh0/EqpR3tpuj52m5C4f9uBdmKYVhRf8jNFF5WpwOUKlq
         0AlQ==
X-Gm-Message-State: AOJu0Yx197ZcEDMZ16D4wBDosEAA2QNuS6h3VcA/3C+h+fQ6Vf/BN7vP
	2s6lO7FeSCAt6By9spdKa+ausJMu7rEyRoBKpFxTsIryZn9OhsiBRFQPA3/acUU=
X-Gm-Gg: ASbGnctRcvJtFIbZfUXZnSnIJJ7LkKlg8wEhNM+gU3MqM48u2A1WpDEYeljzy5uCOLQ
	MCrozsFbt7fqCezWQX/rcCTdTeEfmqSU9BBI7p7LkOc8MVtfniKYgQIurMxLpyMWY0qRlnavgOl
	90nShqmnAw00M/L1B+tknu717hy3mZdRQbwPL9EdLppdMWeceLeRwWKwRvbj9BHP5EGWYQDVYrz
	Ox//YRq7l2J4FvZOk0vTp24gY7HqEKJXRMdxO5cqWU8BjEus/9INgnVE7ouZZXuQO87hc+WnevV
	HFiS5qKfNyRiUzTQu2O6Ld1NDFosDLXZ6xxqS9gzU9v1Mg==
X-Google-Smtp-Source: AGHT+IEvNrVGqhl65LcwBo1TFNQou8NIUR96fTdplnLGDb0t/oYEVgdWTwdfSAovnNLGBmr73RlDdQ==
X-Received: by 2002:a05:6000:4a09:b0:385:df17:2148 with SMTP id ffacd0b85a97d-388db275330mr4619036f8f.20.1734470051152;
        Tue, 17 Dec 2024 13:14:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac68:38dd:218a:1df1? ([2001:8b0:aba:5f3c:ac68:38dd:218a:1df1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706588sm188030615e9.29.2024.12.17.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 13:14:09 -0800 (PST)
Message-ID: <d88044d0365ce088f4d983c83e870803b30697d7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] gcc: backport patch to fix data relocation to
 !ENDBR: stpcpy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, bin.lan.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2024 21:14:07 +0000
In-Reply-To: <CAMKF1so72XWNdOaF0MFYJrAC7SLrx7TWDHiCO2iSybj6ksc_Yw@mail.gmail.com>
References: <20241217104729.4115134-1-bin.lan.cn@windriver.com>
	 <CAMKF1so72XWNdOaF0MFYJrAC7SLrx7TWDHiCO2iSybj6ksc_Yw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208856

On Tue, 2024-12-17 at 09:20 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> On Tue, Dec 17, 2024 at 2:47=E2=80=AFAM Bin Lan via lists.openembedded.or=
g
> <bin.lan.cn=3Dwindriver.com@lists.openembedded.org> wrote:
> >=20
> > There is the following warning when building linux-yocto with
> > default configuration on x86-64 with gcc-14.2:
> > =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-in.a
> > =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.a
> > =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o
> > =C2=A0 vmlinux.o: warning: objtool: .export_symbol+0x332a0: data reloca=
tion to !ENDBR: stpcpy+0x0
> >=20
> > This change set removes the warning.
> >=20
> > PR target/116174 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116174=
]
> >=20
> > Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> > ---
> > =C2=A0meta/recipes-devtools/gcc/gcc-14.2.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 +++++++++++++=
+++++
> > =C2=A02 files changed, 448 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backpor=
t-patch-to-fix-data-relocation-to-ENDBR-s.patch
> >=20
> > diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devt=
ools/gcc/gcc-14.2.inc
> > index 4f505bef68..a25bc019e5 100644
> > --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
> > @@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://0025-gcc-testsuite-tweaks-for-mips-OE.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://002=
6-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
27-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch=C2=A0\
>=20
> tiny nit.
> is this tab vs spaces ? can you fix this.

Looks to be in the original file rather than an addition by this patch :/.

Cheers,

Richard

