Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD83C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 16:35:46 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.1449.1662654942591568797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 09:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=6rpVZZAw;
 spf=pass (domain: ossystems.com.br, ip: 209.85.218.50,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-ej1-f50.google.com with SMTP id r17so11970466ejy.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date;
        bh=mqTMpZz8W8immf39E97sEhytpwGWX//oR1H2cyqlyiE=;
        b=6rpVZZAwiufjXiwtmPYPVGFvr9PdS8nSiPlui5Fg9bU3fNCFs0gJG3OC86xWuUb/Lw
         phQS5B3ZBky+/afe6GQ9m4uuAyYIvYNS8ytcXtYLZKa9Ir/67H8akD2rNeSVctItC4gC
         CEyGbK2IegYx0DrPIICbx+dG/kRn8WbgY2L5ygGZsQ6d5OuQBN4e7KnShp5ipa6WDGju
         x8O/tnjdzmwuPT0HFp9lKdDsG8GwNZ2TphP65IDn971jzFTOKveXVPQu1qfWaVWsT5/B
         DMCIrk/w+ci/z3Og/JqvEzXUiK1ZPTBIkmHFHxePLHBbq1lr5bboA2N2NKw3PRXzbmcW
         +RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=mqTMpZz8W8immf39E97sEhytpwGWX//oR1H2cyqlyiE=;
        b=xepvMw1uJ278iU4dRtET/gscPJgikKTAQRd+/zxRGMQtJSHBWGJkO+Jf+miZo7Of2M
         /nHta5AistZgzj1hWxlHHFDEMse6oDUe8FCrF2L3JQeahhyKs16kyX+bOriYmM8fNtvt
         te+3N+ZGp8sAH11wuM7LFijVH4/NOybHTbGqzWA0Uuh5lGOfaVlRRzDrKqT1kTJEoue/
         mnYJKizTUMDC9wfApUMRh2ihVLi5D82G0W37oD3+L5z9P/Jpa1vLh8GQ1SEIbd5ER0xt
         qBCJ6/v3qpf+zK3LP2MWB0RLM4OSB96S1EBk7q4fD0DexRGWhB21qJRxuQNmRRvr3z6h
         HTMA==
X-Gm-Message-State: ACgBeo3bIRTOQB+YGafbMuhM6KDXO+W7SEalJMh0hRwmc7yud6/B+/hX
	bEzkt44mF1Ca/TaaSIx786N6sFxIMzxqJNIE
X-Google-Smtp-Source: 
 AA6agR44mT7d+tCCleQBy2RUPfARS2LES4pQ/fCh2sWQ8XYqey/GFCif6l4ggJ0nt1cVBE9xUtoNiw==
X-Received: by 2002:a17:907:7205:b0:770:86f1:ae6e with SMTP id
 dr5-20020a170907720500b0077086f1ae6emr5635431ejc.396.1662654940643;
        Thu, 08 Sep 2022 09:35:40 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id
 dk7-20020a170906f0c700b0072ed9efc9dfsm1420722ejb.48.2022.09.08.09.35.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 09:35:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ej1-f51.google.com with SMTP id l14so15872041eja.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 09:35:39 -0700 (PDT)
X-Received: by 2002:a17:907:3186:b0:777:3fe7:4659 with SMTP id
 xe6-20020a170907318600b007773fe74659mr1872690ejb.336.1662654939138; Thu, 08
 Sep 2022 09:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220908151303.2592885-1-raj.khem@gmail.com>
In-Reply-To: <20220908151303.2592885-1-raj.khem@gmail.com>
Date: Thu, 8 Sep 2022 13:35:26 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqyxNtDFN6BU26Q5PD+jEd3W=bCyKGAWMPvhf212NsyKg@mail.gmail.com>
Message-ID: 
 <CAP9ODKqyxNtDFN6BU26Q5PD+jEd3W=bCyKGAWMPvhf212NsyKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Use variable to specify extra tools to
 install
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000008114d05e82d05b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 16:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170464

--00000000000008114d05e82d05b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 8 de set. de 2022 =C3=A0s 12:13, Khem Raj <raj.khem@gmail.com> esc=
reveu:

> All architectures may not support same set of tools, therefore use a
> variable to specify this. E.g. on riscv32 only cargo-clippy is buildable
> right now.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust_1.63.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb
> b/meta/recipes-devtools/rust/rust_1.63.0.bb
> index cf6468d212..2f70b33c29 100644
> --- a/meta/recipes-devtools/rust/rust_1.63.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
> @@ -62,13 +62,15 @@ rust_do_install:class-nativesdk() {
>      rm ${D}${libdir}/rustlib/manifest*
>  }
>
> +EXTRA_TOOLS ?=3D "cargo-clippy clippy-driver rustfmt"
> +EXTRA_TOOLS:remove:riscv32 =3D "cargo-driver rustfmt"
>

clippy driver is spelled wrong.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000008114d05e82d05b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 8 de set. de 2022 =C3=A0s 12=
:13, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">All architectures may not support same set of tools, therefore use a<br>
variable to specify this. E.g. on riscv32 only cargo-clippy is buildable<br=
>
right now.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rust/<a href=3D"http://rust_1.63.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.63.0.bb</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.63.0.bb" r=
el=3D"noreferrer" target=3D"_blank">rust_1.63.0.bb</a> b/meta/recipes-devto=
ols/rust/<a href=3D"http://rust_1.63.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rust_1.63.0.bb</a><br>
index cf6468d212..2f70b33c29 100644<br>
--- a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.63.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.63.0.bb</a><br>
+++ b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.63.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.63.0.bb</a><br>
@@ -62,13 +62,15 @@ rust_do_install:class-nativesdk() {<br>
=C2=A0 =C2=A0 =C2=A0rm ${D}${libdir}/rustlib/manifest*<br>
=C2=A0}<br>
<br>
+EXTRA_TOOLS ?=3D &quot;cargo-clippy clippy-driver rustfmt&quot;<br>
+EXTRA_TOOLS:remove:riscv32 =3D &quot;cargo-driver rustfmt&quot;<br></block=
quote><div><br></div><div>clippy driver is spelled wrong.</div><div><br></d=
iv></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http:/=
/code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--00000000000008114d05e82d05b1--

