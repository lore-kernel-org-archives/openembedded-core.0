Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44270C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 09:45:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.6165.1745660705357010038
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 02:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KLpheb4k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so2533943f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745660704; x=1746265504; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+Z7dtJ/p4ZhB/Rjf1y3EILLcwbYgz8TN/D1259mL08=;
        b=KLpheb4kmtWOoKyeKT6oFqvJjcg61WNEr1rydTrdj8+ARfvrR00+tFEFrVsCC/frZV
         GSpBRzpSxkxkdHWEhDTy8E4fVmyjrbvAEDiZKaM4ob1SIxLTCMuxDg6DnbmKEEoDoHoX
         lzYzY08VcfLHOgA422A/nrz6gwBoINkVIZkak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745660704; x=1746265504;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P+Z7dtJ/p4ZhB/Rjf1y3EILLcwbYgz8TN/D1259mL08=;
        b=CThixWqDuCkjbNn9GgoX1kR1eUELMZk/Hf/rOQmqYpqkcNluWSfF15kP3N42gFLd5r
         /ArhMlIHU/EI3bhMXGkd5T86IEs7IXHvZOciu8ol+die73/WaHha8yqsVtaKKk9tD62U
         fj/m7miczsFOY4E75FDkJZpiDo+7kIz1zXN+fpxMFe7Zo/AA/8uFsPfgkrGzvmmr8KA6
         S9eqnn61FPqtIW07L1DpBIILYcmlXltXCJLCaaHiWoRLoIF8AjeGdQN0fr7B4ZwzYpet
         zHt1GAKv4ouGgWccN/viXcYB8YOABY2HCAOhy5tJgtdboD5wJ6fsJAOlVq8IkD9VW3cx
         m3+A==
X-Forwarded-Encrypted: i=1; AJvYcCUWKM+cf7tUZk4rRMQEtGnduixQcjZzOvP+V5KKIFYwZdqBiaULcsGVTrwZFVIj6VuH6RrXz0Y/RU4nNhdwIPaiww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlJwGlQQYVh1V31nnmYkqvE4PjUmqSdbHN9DK8GPzZdZ9xWCqI
	q2u1O1NpT+LcUcCxvNy8mgPYDkJx80GzglAaP2kik/5OQXMcptFgUlKf4p458hA=
X-Gm-Gg: ASbGncsx+3fNgGWvudCwKZ/wQn/8ofgIBQbnrFdu0vl7pwCuJANf8qN6+vn9L9DNH1+
	VLkbpFUM3PIrp1OzfczH54wLtH2GVqDzULnJxCRcWAveDF8xKtchlKWxiw2Kov6cgRDx59HTfYo
	VQgRFIbuxoftjFScokvH5F5f+ZBI164W27XG7AgM3q/Pn/rvHt0TcU1kw4YjA6HtLKZlJxE+QBk
	ujGw7NX3+jGxoKwzL9utdpUGjiUiKLV5RDTBmoS0qTmClpJ3X/5OVBKxkLttm+3vq/qQfGduDyW
	iz4im0Ns+YIeTpi42WiR7/8ytyXMdb6aljHrfmy0WrGrpGP+9Qa7jR/zpC3GlYA0SAiCUnoQbVE
	r9Csw9MFA1uyiGmKJs/MGqwqzbHsvxA==
X-Google-Smtp-Source: AGHT+IGNWWxmZ8Gp7Lpm1eLocwTx7LkdVoH2Yr44hB5QZjmFGRjiGfe0HbWaeyEAQ9lRlo/ED+ePNw==
X-Received: by 2002:a05:6000:1887:b0:39e:e588:6735 with SMTP id ffacd0b85a97d-3a07ab8a967mr1402943f8f.59.1745660703651;
        Sat, 26 Apr 2025 02:45:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e99f:653c:59fa:297d? ([2001:8b0:aba:5f3c:e99f:653c:59fa:297d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc199fsm4983725f8f.55.2025.04.26.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 02:45:02 -0700 (PDT)
Message-ID: <79cfb085c443abd1a980b5abafb94b0900bcaf9b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] harfbuzz: remove meson flag work-around
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2025 10:45:02 +0100
In-Reply-To: <1839D1DE491F347B.938@lists.openembedded.org>
References: <20250425174215.19853-1-twoerner@gmail.com>
	 <1839D1DE491F347B.938@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 09:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215517

On Sat, 2025-04-26 at 09:44 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Fri, 2025-04-25 at 13:42 -0400, Trevor Woerner via lists.openembedded.=
org wrote:
> > The issue is committed and resolved upstream, therefore remove the
> > work-around of explicitly having to set the meson flag 'cpp_std=3Dc++17=
' when
> > using icu >=3D 75.
> >=20
> > https://github.com/harfbuzz/harfbuzz/issues/4671
> > https://github.com/harfbuzz/harfbuzz/pull/4734
> >=20
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > =C2=A0meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb | 3 ---
> > =C2=A01 file changed, 3 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb b/meta/r=
ecipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> > index 8945467a001d..2febcbecda31 100644
> > --- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> > +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
> > @@ -32,9 +32,6 @@ PACKAGES =3D+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
> > =C2=A0
> > =C2=A0LEAD_SONAME =3D "libharfbuzz.so"
> > =C2=A0
> > -# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671=C2=A0is=
 resolved
> > -EXTRA_OEMESON +=3D "-Dcpp_std=3Dc++17"
> > -
> > =C2=A0do_install:append() {
> > =C2=A0=C2=A0=C2=A0=C2=A0 # If no tools are installed due to PACKAGECONF=
IG then this directory might
> > =C2=A0=C2=A0=C2=A0=C2=A0 # still be installed, so remove it to stop pac=
kaging warnings.
> >=20
>=20
> Removing this caused failures on the autobuilder with gcc 15 e.g.:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1474
>=20
> but there were more in that build.

I did drop this patch and I think we still see the same failure with
gcc 15 so there may be more to this...

Cheers,

Richard

