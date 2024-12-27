Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDD1E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 18:30:22 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.17277.1735324212489386877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 10:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lte3axe3;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a3939a758dso2681665fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 10:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735324212; x=1735929012; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bzAoS0Ge7HY2lx1FRuvVUStnj7C8tUJuNm87MvU8uzA=;
        b=Lte3axe3zlVB0XQXTkfZV3yYQG1LqXj6QdGU3ZfGZHKMTfivjuLYMTAmmLwEqF+2uW
         06LYFNbbHdNjcDBhmv59kIIREpxysjT1KXG8cGm2lk+FL7ESWLoo4yh4Bdakv2VaoFBG
         aAXYH1N202yBYZsKEbo9bXRHaXayxTuLOdF3wBtgRG+gp+HL/FXam9oZndUSjdOtP0v2
         zhllAwPjQhs7GdJhs4N5ybtahzKUT4GiK5k+z4kYF1UAvaszvLje9g5XxSHQ80fhyJGQ
         ty95QjOI4kXxwWatICO8GAFyMcr0pWxlX91UKsfWnnyUnwqFQTEpSnWD+clBWoK1R9Th
         59Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735324212; x=1735929012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzAoS0Ge7HY2lx1FRuvVUStnj7C8tUJuNm87MvU8uzA=;
        b=QV8MEAosEVsr/m+Ff8a0KEcl3vaxIW61mRiNjsR5ZX1OfRY496WAern/pExfnhVXcy
         6avNDjaMsJd29sEbUpG7AfBGetK6I9XEqlHgBGRA8h57+ZPCa/26v5qEg+l31tfIf5Db
         O7E7YcHQvphXm7XQHNNqNQw/OsaiuGefMuvMXlu8b12knOOPvxUi+9xPrmhhm8fFtCCU
         JFHoTqVoklLNGnXw6DRPBY01Y8ZsUVUsd6tZMAHS/qknU6aub4yV96o/A7W7xL594QS0
         KpGREVzMh1m8pWFir7AYXQ6poHaaPCC4CooG2dB7/SKliD+gUQAkjKCNZNtLNpKc0aS7
         kBzg==
X-Gm-Message-State: AOJu0YzCcr6g8F8+GdUnUl+ITiQosqhIsjE4Q+uEAzUm4NUlwSNwrUUl
	Zr2mGc+jX1T0Ym6fiv5cn3qmEikvQ+AztSgEQGXfCvUS8KLG5rfk/6Ki9PumdNiDbo6D/AL6F7s
	BWNpw/Q/AIrr9T2DWxHv713zyLoI=
X-Gm-Gg: ASbGncvukMpEwn1kRKXRlDNbzmXQ4aBbT2rU0YfjHwApgl0TmNqew6HL8ttXypc3mDH
	ESlBd5C85gYqnKiEUH9+C8SiX7JHUaDdADeFubfTIHduvvlQBl/cS187yVZgMdGzNzHW1izI=
X-Google-Smtp-Source: AGHT+IFvqF0xGsybr8A0RqVugtfRwrg/H3JEjecFEZh7/nMXrgnLg5DV1Mv1W/L5Uuw+PhY6yJumAF38qDUho0j26Mw=
X-Received: by 2002:a05:6871:b0a:b0:29e:7dd8:92b1 with SMTP id
 586e51a60fabf-2a7fb161aefmr15417414fac.24.1735324211483; Fri, 27 Dec 2024
 10:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Dec 2024 10:30:00 -0800
Message-ID: <CAMKF1soX6oc_RXq-M72Zc4oLxnNhZOt5G9CuQ9DY3cQeC6hibA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust-target-config: Update the data layout
 for x86 and ppc targets.
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000321f64062a44a7f2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 18:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209106

--000000000000321f64062a44a7f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 10:54=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org <deepesh.varatharajan=3D
windriver.com@lists.openembedded.org> wrote:

> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> The data layout for x86 and ppc targets were different in rust from llvm.
>
>
> -------------------------------------------------------------------------=
----------------
> error: data-layout for target `x86-linux`,
> `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
> differs from LLVM target's `i686-unknown-linux-gnu` default layout,
>
> `e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32=
-n8:16:32-S128`
>
> error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`=
,
> differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
> `E-m:e-p:32:32-Fn32-i64:64-n32`
>
> -------------------------------------------------------------------------=
----------------
>
> Rust commits for updating the data layouts:
> x86:
> https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429be=
b100c17d
> ppc:
> https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8=
c4385019
>

LGTM


> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass
> b/meta/classes-recipe/rust-target-config.bbclass
> index 399c13db26..7518e5bc01 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -167,7 +167,7 @@ TARGET_C_INT_WIDTH[x86_64-x32] =3D "32"
>  MAX_ATOMIC_WIDTH[x86_64-x32] =3D "64"
>
>  ## i686-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[i686] =3D "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
> +DATA_LAYOUT[i686] =3D
> "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32=
-n8:16:32-S128"
>  TARGET_ENDIAN[i686] =3D "little"
>  TARGET_POINTER_WIDTH[i686] =3D "32"
>  TARGET_C_INT_WIDTH[i686] =3D "32"
> @@ -216,7 +216,7 @@ TARGET_C_INT_WIDTH[mips64el] =3D "32"
>  MAX_ATOMIC_WIDTH[mips64el] =3D "64"
>
>  ## powerpc-unknown-linux-{gnu, musl}
> -DATA_LAYOUT[powerpc] =3D "E-m:e-p:32:32-i64:64-n32"
> +DATA_LAYOUT[powerpc] =3D "E-m:e-p:32:32-Fn32-i64:64-n32"
>  TARGET_ENDIAN[powerpc] =3D "big"
>  TARGET_POINTER_WIDTH[powerpc] =3D "32"
>  TARGET_C_INT_WIDTH[powerpc] =3D "32"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209094):
> https://lists.openembedded.org/g/openembedded-core/message/209094
> Mute This Topic: https://lists.openembedded.org/mt/110301946/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000321f64062a44a7f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 26, 2024 at 10:54=E2=80=AFP=
M Varatharajan, Deepesh via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;deepesh.varatharajan=3D<a href=3D"mailto:windrive=
r.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">From: Deepesh Varatharajan &=
lt;<a href=3D"mailto:Deepesh.Varatharajan@windriver.com" target=3D"_blank">=
Deepesh.Varatharajan@windriver.com</a>&gt;<br>
<br>
The data layout for x86 and ppc targets were different in rust from llvm.<b=
r>
<br>
---------------------------------------------------------------------------=
--------------<br>
error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-=
n8:16:32-S128`,<br>
differs from LLVM target&#39;s `i686-unknown-linux-gnu` default layout,<br>
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n=
8:16:32-S128`<br>
<br>
error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,<=
br>
differs from LLVM target&#39;s `powerpc-unknown-linux-gnu` default layout,<=
br>
`E-m:e-p:32:32-Fn32-i64:64-n32`<br>
---------------------------------------------------------------------------=
--------------<br>
<br>
Rust commits for updating the data layouts:<br>
x86: <a href=3D"https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d=
6843cd585429beb100c17d" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d</a><br>
ppc: <a href=3D"https://github.com/rust-lang/rust/commit/ad7ea8b7e690e60000=
06b6fde630a2c8c4385019" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">LGTM</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varathara=
jan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>=
&gt;<br>
---<br>
=C2=A0meta/classes-recipe/rust-target-config.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass<br>
index 399c13db26..7518e5bc01 100644<br>
--- a/meta/classes-recipe/rust-target-config.bbclass<br>
+++ b/meta/classes-recipe/rust-target-config.bbclass<br>
@@ -167,7 +167,7 @@ TARGET_C_INT_WIDTH[x86_64-x32] =3D &quot;32&quot;<br>
=C2=A0MAX_ATOMIC_WIDTH[x86_64-x32] =3D &quot;64&quot;<br>
<br>
=C2=A0## i686-unknown-linux-{gnu, musl}<br>
-DATA_LAYOUT[i686] =3D &quot;e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128&q=
uot;<br>
+DATA_LAYOUT[i686] =3D &quot;e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64=
-i128:128-f64:32:64-f80:32-n8:16:32-S128&quot;<br>
=C2=A0TARGET_ENDIAN[i686] =3D &quot;little&quot;<br>
=C2=A0TARGET_POINTER_WIDTH[i686] =3D &quot;32&quot;<br>
=C2=A0TARGET_C_INT_WIDTH[i686] =3D &quot;32&quot;<br>
@@ -216,7 +216,7 @@ TARGET_C_INT_WIDTH[mips64el] =3D &quot;32&quot;<br>
=C2=A0MAX_ATOMIC_WIDTH[mips64el] =3D &quot;64&quot;<br>
<br>
=C2=A0## powerpc-unknown-linux-{gnu, musl}<br>
-DATA_LAYOUT[powerpc] =3D &quot;E-m:e-p:32:32-i64:64-n32&quot;<br>
+DATA_LAYOUT[powerpc] =3D &quot;E-m:e-p:32:32-Fn32-i64:64-n32&quot;<br>
=C2=A0TARGET_ENDIAN[powerpc] =3D &quot;big&quot;<br>
=C2=A0TARGET_POINTER_WIDTH[powerpc] =3D &quot;32&quot;<br>
=C2=A0TARGET_C_INT_WIDTH[powerpc] =3D &quot;32&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#209094): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/209094" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/209094</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110301946/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110301946/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000321f64062a44a7f2--

