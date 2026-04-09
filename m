Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CA3F364B6
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 20:13:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.141579.1775765589734976480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 13:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rp1nBCGW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488c21c636dso7797165e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 13:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775765588; x=1776370388; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TL5utFY1kFzz2AnmIkXa4cFAw68cXfFZ5QOfqQw1p0s=;
        b=Rp1nBCGWAOBbbVKhAzrbyPuIQl8JI+eB3nq391fCtif+L2Yi2gSHSbqp8dJxk6K8qS
         RQM4SUmmcvPkSqY5KUgeeGl5dDUrz97071iPI4pJyIqhReDE1KuZNmSDimyehTIJiE2m
         L2O+MdSWQcdWBUKvZvgMmthS4M0eG42ji6y5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765588; x=1776370388;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TL5utFY1kFzz2AnmIkXa4cFAw68cXfFZ5QOfqQw1p0s=;
        b=IA3r31xuXbDIY2lKjSia2wTyGtvg7tCnsvwDhAQHTE4oMeW6ix9O5wJjv7NGfFln7x
         ZsZJH0wqY4jUX2qUPcpYcKzup/rP2EL2RvrhZQ4cjien/DrBTEHuIXWeaIghfOiV1Lmu
         GG83ZFUDy3TGrUehYsZQvGhk3xrWNxc9o+7mneIXDAQOxDcJ/hS69DX/WvsULe0bGBwJ
         QZf4/fz62tF8L2L1t1J+MkhULjqvN0QkulvDcCD3kqf7soHIQvkfutWgjvddwhIEcUyw
         azWT61nv+KOdyD4K0Qexbm9nyMHrE3j54BgkvF6DQWNTElnrKPfc+TWhdS0x2pDr8xHW
         JOgg==
X-Gm-Message-State: AOJu0Yw4hBDbpLF0rIN+MR+l7EQiiFpzq/QYfni5XsqEW5CvTr3wkh8M
	uUmu8+coKX4XMZ4kUFSOfpR7oHCMTKk+lGXgQAMpZhZKLxJM1yJnW89UOM+TxW8yp/U=
X-Gm-Gg: AeBDiesU16B6hJUJm/+NCq1Cy36hWtwtCoI8Q0cMsRmIrMOrHCgsn76JA3FI61jOtk2
	YTAtWAANt7AaT5OS4o8JEMza1AmQeJfaLUAjxQLO6mNvtZCT4xxi+P6JItSnelxx8ULaYoioVAk
	VsLtnnVa3re/Dzd5yjpsimuyjNYP1OFz3O25GG9/eNnmXdjT3YdTcwi3QyzvcIQujQlOkFyItLb
	08v0f+J0TN/QRwgwohrT3uprSOGRidukB797OeUEmTz1NAJwi/iPGuHrtapZ7YtyH45xG0TShMa
	+NF/gHgs9d0BUlLBJGTwMeRVJ/OwcH7yZKJfuvWblSui1n87ndRse/DRsqRDSgkGSceQgaY02Av
	p3IigKRRlygCKxNH7hL3YA8wfJYaYPmfzyhb1H3anauyjoUOMYqlOtLLDhRi69/IlsMotPjGhiY
	1UE7cQaR5Cz1lOfpLMPeNVI9EETXxMZutdZaEpH1rMCCiUwn+y29pN2nTR1RwscHrLMQg+9Afxt
	/drNUSjvgNEeBoCmurHT5xPKDI=
X-Received: by 2002:a05:600c:c0da:b0:488:b043:5efd with SMTP id 5b1f17b1804b1-488d682628dmr2200755e9.13.1775765587941;
        Thu, 09 Apr 2026 13:13:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d? ([2001:8b0:aba:5f3c:c642:6c74:9bb7:e65d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5347ea5sm23558285e9.8.2026.04.09.13.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:13:07 -0700 (PDT)
Message-ID: <bb9f56e589af3706364e746de9ca50ac2e60d7ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Apr 2026 21:13:05 +0100
In-Reply-To: <fe2e28c3-9ee8-ef26-ce6f-04d45419d6a1@crashcourse.ca>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>
	 <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
	 <fe2e28c3-9ee8-ef26-ce6f-04d45419d6a1@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 20:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234943

On Thu, 2026-04-09 at 10:04 -0700, Robert P. J. Day via lists.openembedded.=
org wrote:
> On Wed, 8 Apr 2026, Richard Purdie wrote:
>=20
> > On Wed, 2026-04-08 at 06:33 -0700, Robert P. J. Day via lists.openembed=
ded.org wrote:
> > >=20
> > > =C2=A0 puzzled by something i just noticed ... the documentation for
> > > "ASSUME_PROVIDED":"
> > >=20
> > > https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_P=
ROVIDED
> > >=20
> > > clearly suggests that these represent recipes that would not be built
> > > as they are already on the host, the example given there is
> > > "git-native".
> > >=20
> > > =C2=A0 however, in a walnascar-based build i just built, native recip=
es
> > > that were listed in ASSUME_PROVIDED were built anyway, even though
> > > they are clearly on my Debian 13 host, "git-native" among them. in
> > > fact, a number of recipes i checked appear to all have been built fro=
m
> > > scratch, despite being listed in ASSUME_PROVIDED.
> > >=20
> > > =C2=A0 as a test, if i then tried to "cleanall" such a recipe, i got =
the
> > > perfectly reasonable:
> > >=20
> > >=20
> > > $ bitbake -c cleanall git-native
> > > ... snip ...
> > > WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring
> > >=20
> > >=20
> > > is there some reason that something listed in ASSUME_PROVIDED will be
> > > fetched and built anyway? is it a version thing?
> >=20
> > Some of the recipes have a PROVIDES for XXX-replacement-native and you
> > can build/depend on that.
>=20
> =C2=A0 if i may, let's see how badly i'm going to misunderstand this.
> currently, in my build, if i dump the value of ASSUME_PROVIDED, i see
> a pile of native recipes, including (as defined in bitbake.conf)
> bzip2-native, diffstat-native, and patch-native, suggesting that if my
> build needs any of these recipes built natively, then *by default* it
> will try to use the ones already installed on the host.
>=20
> =C2=A0 as an example, there's "quilt", which conveniently RDEPENDS on
> exactly those three native builds:
>=20
> =C2=A0 .../quilt.inc:RDEPENDS:${PN}:class-native =3D
> =C2=A0=C2=A0=C2=A0 "diffstat-native patch-native bzip2-native"
>=20
> so, simplistically, if i'm building quilt natively, none of those
> native recipes should need building -- building quilt will use the
> host versions.
>=20
> =C2=A0 however, in the case of (for example) bzip2, we have that that
> recipe defines:
>=20
>=20
> =C2=A0 .../bzip2_1.0.8.bb:PROVIDES:append:class-native =3D " bzip2-replac=
ement-native"
>=20
> which means that some *other* recipe has the right (and here's where i
> might be misunderstanding) to state that, even if bzip2 is listed in
> ASSUME_PROVIDED and is available on the host, that other recipe can
> insist that it not use the host version, but must (for whatever
> reason) build the "replacement" version:
>=20
> =C2=A0=C2=A0 .../cmake-native_4.3.1.bb:DEPENDS +=3D "bzip2-replacement-na=
tive ..."
>=20
> am i even *close* to understanding this correctly?
>=20
> rday
>=20
> p.s. so as i read it, all it takes is a single recipe being built that
> chooses to depend on a "replacement" recipe for that replacement
> recipe to be built and used.

Correct, but that replacement recipe will only be used by the recipes
which depend on the replacement, the others will still see the
HOSTTOOLS provided one. HOSTTOOLS and ASSUME_PROVIDED are generally
linked.

In the case of bzip2-replacement-native, what the recipe probably wants
is the bzip2 library, not the binary. Different replacements have
different reasons for being needed.

Cheers,

Richard

