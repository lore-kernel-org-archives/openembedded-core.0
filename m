Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.38918.1601306111996592351
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 08:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AjIVzNBE;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p15so9045631ejm.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HP9qriv4AqMfPsEtihQ9lJEMgR6QzwrsoBRYcnUFFVE=;
        b=AjIVzNBEtv3C83EhGydXUv2ETRK+OmN/DFl9xBy3JIDxAu9KGtfL3LU+esv67OHGCC
         PyZDFiwZIEiD3T6S3pfrDV+io2suAWU9lkVsjLMlK4vkPbAkhZVtuwbIQnZJ8G16ogb2
         CayLrcfj6NXERbEHq9o9eu3MG7zkJlU44OOYHTU9yG+WmLR1Mn0RaKAYa0Fk9BWLr57V
         B4SpoK1PITZapyIiNDEYWx0HitUiHYJEACNgObQorKcqLkMBHLc3xwcTvom2zaSjIuGx
         F5qK0ti9bUgZRvCqKAS4NpmHuMr7wBJJnIYpKO2Au6GqnaqJWIPpu6TiG2vpJkyRIfDW
         zstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HP9qriv4AqMfPsEtihQ9lJEMgR6QzwrsoBRYcnUFFVE=;
        b=kbVjEcw1h5jI0IpTgrdgszpp5ANLlOOYQ1c3px9uofL0PcnwWkEfK1PnAaF0/j5pEv
         0r+458XAciClA1/xQo11n8wUATS3DhTg6PYHelbzDQ9bsLuHAKEPqdfgG073LlhU8/CG
         HereHr35QzsSkBZHnf07OhauUP4yrM4z2wu8BOPbkhzonwXLyDnr4f1Zz1sBdK3S1CDj
         sdA1mNWTBolRa6jLqtnJOcCJI/bORVlzNm8X560wmjghaRZWyuISXoM8/raAqw2PRj3T
         67AKadTtk60oyb6djDFS05W7NkUBKUPaOHnn2N6hopcfrAs2SKbjCDWcYcVPwTcta8ZU
         sUtg==
X-Gm-Message-State: AOAM531sovHjmlFA7NV7o9kz8S+wiJw5/EskN21gnP1F9PvdDxxAiRVg
	Nf3wgiG02TUpbktcnqBDCLjlr99Y/sCPqgWdSZk=
X-Google-Smtp-Source: ABdhPJwVpQR+EQQDYHLf5y6/QXPaNOf9UGdCq4pcZ45WXthD7z/l+p0/vOL+WrVte8nG2RsHRR/lTbHAxo6ipE0TKSI=
X-Received: by 2002:a17:906:370a:: with SMTP id d10mr2217838ejc.393.1601306110241;
 Mon, 28 Sep 2020 08:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Mon, 28 Sep 2020 08:15:02 -0700
Message-ID: <CABcZANnFcav_1wexy+OKccEuJ+verxw0yTdEF9YThkP6V9+M3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e0ae4c05b0612141"

--000000000000e0ae4c05b0612141
Content-Type: text/plain; charset="UTF-8"

I'd suggest using parenthesis to clarify the order here. 'a or b and c'
isn't intuitively clear unless you know the or vs and operator precedence.

On Mon, Sep 28, 2020 at 6:38 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Most recipe-sysroot dependencies are handled by these prefuncs. "configure"
> is special with a decidated task, prepare_recipe_sysroot which runs
> beforehand.
>
> do_prepare_recipe_sysroot does not have to be run before/after
> fetch/unpack/patch, they're independent tasks. If fetch/unpack/patch
> have sysroot dependencies and those tasks rerun, stale items from the
> sysroot could be uninstalled and since prepare_recipe_sysroot doesn't
> re-run, they could be missing by the time configure runs.
>
> Fix this by adding the prefunc for do_configure which would ensure
> the sysroot is in a good state.
>
> This issue can be reproduced by modifying do_unpack and watching
> binutils-native and vulkan-headers failing due to missing makeinfo
> or ninja.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/staging.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index de3a19815a3..7c9fb38607e 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -614,7 +614,7 @@ python staging_taskhandler() {
>      bbtasks = e.tasklist
>      for task in bbtasks:
>          deps = d.getVarFlag(task, "depends")
> -        if deps and "populate_sysroot" in deps:
> +        if task == "do_configure" or deps and "populate_sysroot" in deps:
>              d.appendVarFlag(task, "prefuncs", " extend_recipe_sysroot")
>  }
>  staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
> --
> 2.25.1
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000e0ae4c05b0612141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d suggest using parenthesis to clarify the order her=
e. &#39;a or b and c&#39; isn&#39;t intuitively clear unless you know the o=
r vs and operator precedence.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 2020 at 6:38 AM Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Most recipe-sysroot dependencies are handled by these p=
refuncs. &quot;configure&quot;<br>
is special with a decidated task, prepare_recipe_sysroot which runs<br>
beforehand.<br>
<br>
do_prepare_recipe_sysroot does not have to be run before/after<br>
fetch/unpack/patch, they&#39;re independent tasks. If fetch/unpack/patch<b=
r>
have sysroot dependencies and those tasks rerun, stale items from the<br>
sysroot could be uninstalled and since prepare_recipe_sysroot doesn&#39;t<=
br>
re-run, they could be missing by the time configure runs.<br>
<br>
Fix this by adding the prefunc for do_configure which would ensure<br>
the sysroot is in a good state.<br>
<br>
This issue can be reproduced by modifying do_unpack and watching<br>
binutils-native and vulkan-headers failing due to missing makeinfo<br>
or ninja.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/staging.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass<b=
r>
index de3a19815a3..7c9fb38607e 100644<br>
--- a/meta/classes/staging.bbclass<br>
+++ b/meta/classes/staging.bbclass<br>
@@ -614,7 +614,7 @@ python staging_taskhandler() {<br>
=C2=A0 =C2=A0 =C2=A0bbtasks =3D e.tasklist<br>
=C2=A0 =C2=A0 =C2=A0for task in bbtasks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D d.getVarFlag(task, &quot;depend=
s&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if deps and &quot;populate_sysroot&quot; in d=
eps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if task =3D=3D &quot;do_configure&quot; or de=
ps and &quot;populate_sysroot&quot; in deps:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(task, &quo=
t;prefuncs&quot;, &quot; extend_recipe_sysroot&quot;)<br>
=C2=A0}<br>
=C2=A0staging_taskhandler[eventmask] =3D &quot;bb.event.RecipeTaskPreProce=
ss&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000e0ae4c05b0612141--
