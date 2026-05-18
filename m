Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F3ECD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 21:35:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8271.1779140115551788596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 14:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RLi8uKPy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso13905415e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 14:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779140114; x=1779744914; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqPKDrOfZQdEvrOFgmYTBXgUGLw+uLIjGJIkkm+/tnU=;
        b=RLi8uKPyZZmbjJ35OSZHTz7PKb+7aRGo1MZ7UWrM4BlKLUfso4x+go/i/vSRRrN0Wz
         LAjHvTGyQwgjPosZnCqB9IC6/CC6WKv8kQAtuHKXMnrPizucV3vbvr+8lfECfQ2AiqhI
         pMAALIPQFOpSY1luX1AiP4mP74gfMv0z1hS8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140114; x=1779744914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqPKDrOfZQdEvrOFgmYTBXgUGLw+uLIjGJIkkm+/tnU=;
        b=nmTNLgig7CafQSsmr+ULP1l5olOYbiNN1VTlInruYxgFsnKnAjn2sqPrNWdoy20CTg
         4JFHw2BhYhO9rvN5SQRy117j0unoleA3w/3ZEkohnx2IfbhMHbhp9sexUu4/G4eTbPYy
         Nk+LW5gehiQ1pvEnfkiZ4Lrw+Zxk4lGBYdB+SPsXHvAS5FqmN4fIjDxsC3Tos3TIZkUt
         f90LqbQalvEdzH5E0LZGp2fJpqt0hQakLhmrrJGg3dGaAhh3T5F4f0NALA/TZPuNS+bm
         NEXnS8mmUFFf2P3D8qkGVPFjq1wZsGs5lv4TRG+1NDdc/apA/7aOU2Ljv35l4rJFm5Gv
         bsfw==
X-Forwarded-Encrypted: i=1; AFNElJ8vBK3fCI4cepGBD3TY/q7KygGQGuOMVquFIWFunIO/GR2oxLwwcinnhWzYN36ZBuXRp0aO5yoIQC4IePojrauWNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEzPly/rk0jZKn0fITXfsPMxdULNarbVz7OXXtJ2GrJTjqb+ME
	wjc08SU4NmcS/cFrI+4K87ktNqGNVI3niZiMewwlyLHTSyI0dW/k7m5nGy3Z0uR1XwA=
X-Gm-Gg: Acq92OEEe8cZu/BY8zEcrnVwLrpGIRcuiAQspoJBAK+grb/BnI58LsMNbeV3eoqJcKn
	0jOIyjfBFP3Mr3z7rq0F/1v8gMOL1wSvx2kFAZfzLIPNm02Y3phJmmNAzNljIJgbTUMKu/kZ0DJ
	vmVRw3W+5EjoqhnHExDQ1LqwgiUSqQV8QMubEeYfs/yGGvNh6l/Rkdsr6HmnikQWs6FIP+xSKnL
	yzSQ27UhPh+SehMhKCdfAZJ8sA3m0G8P44297JEsbJhqNGFdwS9rFFnC6X24iQ+oQOD1fYuXUzK
	GMpwo0nytQOLmSNUnHVwV//S6FcVR/+1EMTxn9q2cfYo99kvgug40+6kmciWs5SyoYnCCvkjmbM
	67ZDPAqOwyGyU+1SkSsRhbwj6yH/I1jt37NiCkG96d8UL5JZ6u3tlvTBnsfo4D7NvdbXAen+R4f
	EuVhTtEWQE6+x4ctGoT42qIqFKYVtMfzUTedrs5DtVxC/N/xhEwGjZ1Mlyx1Gh54fpIYTXLcDF5
	HkLf1Jcee7qZ2aT
X-Received: by 2002:a05:600c:608b:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48fe61ed232mr266473345e9.18.1779140113919;
        Mon, 18 May 2026 14:35:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f8a4:5aa5:6f2a:b16e? ([2001:8b0:aba:5f3c:f8a4:5aa5:6f2a:b16e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm38288903f8f.20.2026.05.18.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:35:13 -0700 (PDT)
Message-ID: <9ac6783613c77c303633416679e5cfb1d5f77808.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ninja: enable large file support for
 nativesdk builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.tatrai.ext@siemens.com, openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2026 22:35:11 +0100
In-Reply-To: <20260515090645.1053312-1-peter.tatrai.ext@siemens.com>
References: <20260515090645.1053312-1-peter.tatrai.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 21:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237261

On Fri, 2026-05-15 at 11:06 +0200, Tatrai, Peter via lists.openembedded.org=
 wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>=20
> When SDKMACHINE is set to "i686", nativesdk-ninja is compiled as a
> 32-bit binary. Without large file support (LFS), ninja's internal stat()
> call uses a 32-bit struct stat, which results in EOVERFLOW on filesystems
> that report inode numbers larger than 2^32 (e.g. container overlay
> filesystems).
>=20
> Add -D_FILE_OFFSET_BITS=3D64 to CXXFLAGS for nativesdk builds to enable
> LFS, ensuring stat() uses 64-bit types regardless of host word size.
>=20
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
> =C2=A0meta/recipes-devtools/ninja/ninja_1.13.2.bb | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/ninja/ninja_1.13.2.bb b/meta/recipes-d=
evtools/ninja/ninja_1.13.2.bb
> index e750c78c46..4fd048efa6 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.13.2.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
> @@ -30,6 +30,11 @@ do_install() {
> =C2=A0	install -D -m 0755=C2=A0 ${S}/ninja ${D}${bindir}/ninja
> =C2=A0}
> =C2=A0
> +# Enable large file support to avoid EOVERFLOW when stat() is called on =
files
> +# with large inode numbers (e.g. on overlay filesystems). This is critic=
al when
> +# building nativesdk for a 32-bit SDKMACHINE (e.g. i686).
> +CXXFLAGS:append:class-nativesdk =3D " -D_FILE_OFFSET_BITS=3D64"
> +
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
> =C2=A0
> =C2=A0CVE_STATUS[CVE-2021-4336] =3D "cpe-incorrect: This is a different N=
inja"

I think we should set both -D_TIME_BITS=3D64 and -D_FILE_OFFSET_BITS=3D64
for i686 unconditionally in a similar way that time64.inc is doing for
the target else we're just going to run into this elsewhere...

Cheers,

Richard


