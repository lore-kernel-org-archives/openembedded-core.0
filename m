Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCD1C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 19:45:27 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15074.1788119122827130445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 12:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FQb2VnJZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8588583a7c3so34344157b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788119122; cv=none;
        d=google.com; s=arc-20260327;
        b=MJlffGMVGO5Kxp/WUNTieSU7wdiouiyVkbf78FZ5Ee43az2TAhbuTbRHM/fARNv+Sj
         tLiO2i1R31HmZSgmpqGRbXSP8UkvdcglBPdXDLAfhipDh+YBYFR0Lyp+UU/DQ5u/mZ4k
         c3vZ9ciKnNWdLdB2ZnD8uiY1RRzFIO37OHl560T9I7n0TvAWWMOMrw98Z7xVlzOLOlO2
         v7J7n+rEnDrZm01d3+9C74jvlw6GWOlEPHGJASxtLTrUAd0NfP1XaQvqB4H8J0hjJbX7
         R74oUYu71Wy0PA5kEt+3X44ShlkfHhDQmfrs1dpVWfzpXYP9Sy+QpthYfBk405TxnWdY
         ETGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S25h/sIUxU+L30wwOWmzTsKHdKEUA12UFuhWy/BVkf8=;
        fh=XdtWSdxUWXiIQqTL/jS3pXJKAtdooZTh4SlEz3R75PA=;
        b=hLfKRVJZxmV8lyIOmSifdh5BYVXD4b2BQ6rBXgPPLLggTG769brg6ytHsLCUp1uENs
         HE0sZPoMc2D2sYiw3vo8eVxKARYFcbLCkZuW5mShCQajSZsRyWtph3WRa04YXaAYgrFm
         AvinLJvNeOVClPB3Cmx3uNG1FbvplEd9bQLcpQzl+1gzovi62hXFN+7+DKFMs5cAfedl
         RYblVZOZGuSnN3W95a1AWAF0iYDcY9m9ZcNSVusGTA5ygY6ncWJvX3qz4iQirQ45JqRU
         pAkoTcTJdeq4YIJZ0kezh79pOMgBuijRHDFQSHjuaIpOTqLuBlcQImeHnN+1y9FbOhWR
         vmQg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788119122; x=1788723922; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S25h/sIUxU+L30wwOWmzTsKHdKEUA12UFuhWy/BVkf8=;
        b=FQb2VnJZVQBqbhzj0Uz81Gv25tjDWa7kqWdijzen93ilVMrL45PZkLmhsVXePoDEaf
         aNzWtiM54ZKnKosD6/uLg5VeOJD9gqgjIKnUVMCRuCzONCbcEbv0d9yTqE2eX68AKs2m
         tgUKjyKS0V95errMOqULsQIqCRvTinJiv7muaaBs/sNzarK/AlnINJf5UUti4iPbb21x
         AZNX1EaB4AgipaWxv8KxUdhzFAZs6V9iRT9oB8az7sfPuWBw3fqqtIfRjZfnIYZuS38V
         e4xq6kMa8ZStY3FnDcC1aLywJLhDn3dmuqqnr682SM/ydjd4JZ1pX46erbr5kJPuYuqD
         IaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788119122; x=1788723922;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S25h/sIUxU+L30wwOWmzTsKHdKEUA12UFuhWy/BVkf8=;
        b=VPIbpuWjcWTLBTxyGKq8FGMlmo11KMqmesxbTAYR9i7JoEJvcDe2+gChtF/BkM0eml
         i/+57/hdoyuGsl0MpKGFlkst/BTNFWPEh3bD2Uc6/T0Kxb8TzQ1Ew0CU5iO7dGNovWis
         +cN8WksDTuLxm+/qIU6BO8fFQOv6SeqowbjcDzyD4p7KhG5kGXbmk6Z/pIVLu0sNWxpU
         9tPX3FoH+Q/fPcZ2+WpfuO2o0Rk4zMws2p/K6e3GK/ohyaU4YcZ9R5OU6lxogzdqvYS+
         dYYQM3dYSEbv6AykElzmBDWunfMVmV+8XAeMi15EPeo966aEuUFEbUGDEErZ+v+JJo8i
         eNZw==
X-Gm-Message-State: AFuF++lV91In/aHDauIdAw1ccDHXz8tpA1Lwjt5plcvoUud+AQ18QRIc
	YATtoj/v7bA6aKFsXEzEdt3tlv3b2ivNljf73n7ftf2vZA+nbF5JRyaRnhjF6fhF5YtGHIKdUGr
	AIFz8YWCESAMwjpa0j5QINauAsziQbVZ3vX6aa5k=
X-Gm-Gg: AYBFou0t5vX9HUkzyp+LlH7tgoQ0RMY2rP1S+yW+VlTlxY0mA8GB0ySc+ztohf1ozQA
	OPy1pTsyByzgTVI9UdT7VrHm3kzBlEtO2aOnQDfkZcGgS7cjwLvE3McO/KUAF8021Q15nRiFaRG
	4GnlK8nlNWcwSM0Z4j8c8gjJClLhNNYx87Fp+lLff/9E/kvrFB/5mLIMItHPmWFv3VPbAReUL5c
	ugJ/McODrsg884f8Zpu6ZueWl6XCosRrt7RNu/d3pENmtpqeGR4j5n+181YxwP2ETX7Ug5jlFPQ
	dU3UNO1ESsAJvyswOiM9xCY2jWYTXRh7XVmrMhKGr/dY9OxMaK8W4ynXYhMz41BvMAGahqExuwn
	4WgYaRY3oXmKtGFyUcoG0h2adJzreyxLq7GeFwiMD8a+vzkSn6YiP51665pk4DH2aoLhE3I636I
	mwP0ED5rFPnwnJUO3JJvsF5zN1eYzdImBBT659hz6IPohYgXfO4dGm2PRePc0qkwstKH5/24iRF
	SO7tf1Ix7suLA==
X-Received: by 2002:a05:690c:39c:b0:862:b776:8e90 with SMTP id
 00721157ae682-862b7769114mr21102097b3.2.1788119121858; Sun, 30 Aug 2026
 12:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com> <20260830125853.1139807-4-sunilkumar.dora@windriver.com>
In-Reply-To: <20260830125853.1139807-4-sunilkumar.dora@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Aug 2026 12:45:30 -0700
X-Gm-Features: AcwNN1WcASQXhY40IrSa1Fia9mQagDiVZfbbNLlcEOOUbb8kq_R8q0bn-6rhQ4k
Message-ID: <CAMKF1srRX9QgGZQL9tTpr6HuOXTOPvM8X+CB08qC_WU0Bptp=A@mail.gmail.com>
Subject: Re: [PATCH 03/11] openmp: Build via the LLVM runtimes entry point
To: sunilkumar.dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Content-Type: multipart/alternative; boundary="000000000000131411065a48ed04"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 19:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244694

--000000000000131411065a48ed04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:59=E2=80=AFAM <sunilkumar.dora@windriver.com> wro=
te:

> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> LLVM 23 removed the standalone build mode for openmp, so do_configure
> fails with
>
>   The legacy standalone build mode has been removed
>
> Configure it through the runtimes build with LLVM_ENABLE_RUNTIMES=3Dopenm=
p,
> the same way libcxx is built.
>
> The runtimes build reads LLVM_LIBDIR_SUFFIX; nothing in LLVM 23 reads
> OPENMP_LIBDIR_SUFFIX any more, so pass the standard variable like the
> other clang-family recipes do. Without it openmp installs into lib/
> while a multilib configuration packages lib64/, and do_package fails
> with "installed but not shipped" for libomp.so, libarcher.so,
> libompd.so and the cmake files.
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> ---
>  meta/recipes-devtools/clang/openmp_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/openmp_git.bb
> b/meta/recipes-devtools/clang/openmp_git.bb
> index 2ba83d48c6..90d4911623 100644
> --- a/meta/recipes-devtools/clang/openmp_git.bb
> +++ b/meta/recipes-devtools/clang/openmp_git.bb
> @@ -18,10 +18,11 @@ inherit cmake pkgconfig python3targetconfig
>  DEPENDS +=3D "elfutils libffi clang"
>
>  EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
> -
> -DOPENMP_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
> +                  -DLLVM_ENABLE_RUNTIMES=3Dopenmp \
> +                  -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>



The recipe keeps PACKAGECONFIG ?=3D "ompt-tools offloading-plugin" =E2=80=
=94 under
the runtimes entry point, does offloading-plugin still do anything, or
would it now need offload added to LLVM_ENABLE_RUNTIMES?


>                "
>
> -OECMAKE_SOURCEPATH =3D "${S}/openmp"
> +OECMAKE_SOURCEPATH =3D "${S}/runtimes"
>
>  PACKAGECONFIG ?=3D "ompt-tools offloading-plugin"
>
> --
> 2.43.0
>
>

--000000000000131411065a48ed04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 30,=
 2026 at 5:59=E2=80=AFAM &lt;<a href=3D"mailto:sunilkumar.dora@windriver.co=
m">sunilkumar.dora@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Sunil Dora &lt;<a href=3D"mailto:sun=
ilkumar.dora@windriver.com" target=3D"_blank">sunilkumar.dora@windriver.com=
</a>&gt;<br>
<br>
LLVM 23 removed the standalone build mode for openmp, so do_configure<br>
fails with<br>
<br>
=C2=A0 The legacy standalone build mode has been removed<br>
<br>
Configure it through the runtimes build with LLVM_ENABLE_RUNTIMES=3Dopenmp,=
<br>
the same way libcxx is built.<br>
<br>
The runtimes build reads LLVM_LIBDIR_SUFFIX; nothing in LLVM 23 reads<br>
OPENMP_LIBDIR_SUFFIX any more, so pass the standard variable like the<br>
other clang-family recipes do. Without it openmp installs into lib/<br>
while a multilib configuration packages lib64/, and do_package fails<br>
with &quot;installed but not shipped&quot; for libomp.so, libarcher.so,<br>
libompd.so and the cmake files.<br>
<br>
Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.c=
om" target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a> | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" r=
el=3D"noreferrer" target=3D"_blank">openmp_git.bb</a> b/meta/recipes-devtoo=
ls/clang/<a href=3D"http://openmp_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">openmp_git.bb</a><br>
index 2ba83d48c6..90d4911623 100644<br>
--- a/meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a><br>
+++ b/meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">openmp_git.bb</a><br>
@@ -18,10 +18,11 @@ inherit cmake pkgconfig python3targetconfig<br>
=C2=A0DEPENDS +=3D &quot;elfutils libffi clang&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DOPENMP_LI=
BDIR_SUFFIX=3D${@d.getVar(&#39;baselib&#39;).replace(&#39;lib&#39;, &#39;&#=
39;)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_ENAB=
LE_RUNTIMES=3Dopenmp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM_LIBD=
IR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \<br>
=C2=A0 =C2=A0</blockquote><div><br></div><div><br></div><div><span style=3D=
"background-color:transparent">The recipe keeps </span><code style=3D"backg=
round-color:transparent">PACKAGECONFIG ?=3D &quot;ompt-tools offloading-plu=
gin&quot;</code><span style=3D"background-color:transparent"> =E2=80=94 und=
er the runtimes entry point, does </span><code style=3D"background-color:tr=
ansparent">offloading-plugin</code><span style=3D"background-color:transpar=
ent"> still do anything, or would it now need </span><code style=3D"backgro=
und-color:transparent">offload</code><span style=3D"background-color:transp=
arent"> added to </span><code style=3D"background-color:transparent">LLVM_E=
NABLE_RUNTIMES</code><span style=3D"background-color:transparent">?</span><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-OECMAKE_SOURCEPATH =3D &quot;${S}/openmp&quot;<br>
+OECMAKE_SOURCEPATH =3D &quot;${S}/runtimes&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;ompt-tools offloading-plugin&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000131411065a48ed04--

