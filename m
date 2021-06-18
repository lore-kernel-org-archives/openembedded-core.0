Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web10.12962.1624046241121903659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 12:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I8N8YLvU;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id i17so2378826vkd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJTvv6HtwttAfMLo/QTpmFh1F7vOcgUM6WSHs5qrreE=;
        b=I8N8YLvUGnABxfflUgLNaBvqnkISfmYBDXAwsWZoQ6HMUVKUlmtEbQ8tHTl6D/aInT
         oM4N2n+EwWE7nr1VFds4k7w0FT1KB9ZxcO+tkx7nQ912IvLMdVnwVkY8SEYMimypTVbe
         +hiuKE6N6i///O/u0UMIFtXePM4wE2u723wCz5/JBynx7jX5GOagNv0iDq8mq9FV+UdV
         Uxl6Y4zsc3cDCzJeZI/e3RlSX9FqFKvk4Ata5TizP1C2nuAd8HKw+pbGAYhp90ADv4Ci
         GKz4S6JKIL5LCObAXMogUhDLgbe3CpyeFAY5FxNcqyi4cas0+yqDq2E6uz0pQn4HVKbU
         Mj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJTvv6HtwttAfMLo/QTpmFh1F7vOcgUM6WSHs5qrreE=;
        b=IPOGeWsNbvT5gt9VFYycDvq5ZGB4we7MUX/fRhbtCtZTao5yhcxQYdg/koT7rTE8TS
         1L9B65grcKfiESZV8L4c5dnNG0f6DIQP7QbEE6ty28tG4wHw0PVHd/3U3g6tOmjupXmf
         3+MMxJ2WD7dnAGAlTQfA1t/7pQTrjQwiRgEMUb+SGCUSNKCoqlKf/h/O/Oh2bLtA+vlJ
         CbRjbPjd5E91ehzhHzercbkKf11SaVuYMdR7XrQjey8YKUBLHdCWDn6lZGtO8xyGTUBU
         nQptMi2OX+bDeuLJWFeScnASHIfzIyhLf3A4RyG8ZGbl+aZGMMECkqyLbNroBFzBYUWo
         FM6Q==
X-Gm-Message-State: AOAM531IpJjO7DfnAq280joYosyKMyjeJ/rpu6n2MjoQWNZpQ0jEgbmh
	cUHtnFUXvav5+y3nvDQn7ajtvr6oyW9sjp+xQUE=
X-Google-Smtp-Source: ABdhPJygEITkLtvGrX7ItM1eubAhK5wCnsKmzfuHc6mIlUHup+Vw6NatdrQgwNACbVT08LzXeB1Zs0z/ybhrNCRRQ9g=
X-Received: by 2002:a05:6122:43:: with SMTP id q3mr8331523vkn.10.1624046240181;
 Fri, 18 Jun 2021 12:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210618144640.10281-1-simon@rogue-research.com>
In-Reply-To: <20210618144640.10281-1-simon@rogue-research.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 18 Jun 2021 21:57:09 +0200
Message-ID: <CANNYZj_55te+KxLiFk=j4xp+=cibwnv0-FMQjN8pH4YiHKkTiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Add option for gallium driver iris
To: simon <simon@rogue-research.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003eb1fd05c50fbbcd"

--0000000000003eb1fd05c50fbbcd
Content-Type: text/plain; charset="UTF-8"

I think this can be simpler and does not need a separate PACKAGECONFIG
option, just add iris directly to GALLIUMDRIVERS when building for x86:

GALLIUMDRIVERS_append_x86_class-target = ",iris"
GALLIUMDRIVERS_append_x86-64_class-target = ",iris"

Alex

On Fri, 18 Jun 2021 at 16:46, simon <simon@rogue-research.com> wrote:

> The gallium driver iris is required for intel nuc gen 8+ as it's now the
> default driver
>
> Signed-off-by: Simon Boucher <simon@rogue-research.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 5700cc9673..f2d73bb839 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -148,6 +148,7 @@ PACKAGECONFIG[virgl] = ""
>  GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>  GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> ',r600', '', d)}"
>  GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl',
> ',virgl', '', d)}"
> +GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'iris',
> ',iris', '', d)}"
>
>  PACKAGECONFIG[gallium] =
> "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')},
> -Dgallium-drivers='', libdrm"
>  PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled,
> -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
> --
> 2.17.1
>
>
> 
>
>

--0000000000003eb1fd05c50fbbcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this can be simpler and does not need a separ=
ate PACKAGECONFIG option, just add iris directly to GALLIUMDRIVERS when bui=
lding for x86:</div><div><br></div><div>GALLIUMDRIVERS_append_x86_class-tar=
get =3D &quot;,iris&quot;<br>GALLIUMDRIVERS_append_x86-64_class-target =3D =
&quot;,iris&quot;</div><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 18 Jun 202=
1 at 16:46, simon &lt;<a href=3D"mailto:simon@rogue-research.com">simon@rog=
ue-research.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">The gallium driver iris is required for intel nuc gen 8+ as =
it&#39;s now the default driver<br>
<br>
Signed-off-by: Simon Boucher &lt;<a href=3D"mailto:simon@rogue-research.co=
m" target=3D"_blank">simon@rogue-research.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc<br>
index 5700cc9673..f2d73bb839 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -148,6 +148,7 @@ PACKAGECONFIG[virgl] =3D &quot;&quot;<br>
=C2=A0GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;gallium-llvm&#39;, &#39;,${GALLIUMDRIVERS_LLVM}&#39;, &#39;&=
#39;, d)}&quot;<br>
=C2=A0GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;r600&#39;, &#39;,r600&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;virgl&#39;, &#39;,virgl&#39;, &#39;&#39;, d)}&quot;<br>
+GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#=
39;, &#39;iris&#39;, &#39;,iris&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[gallium] =3D &quot;-Dgallium-drivers=3D${@strip_comma(=
&#39;${GALLIUMDRIVERS}&#39;)}, -Dgallium-drivers=3D&#39;&#39;, libdrm&quot;=
<br>
=C2=A0PACKAGECONFIG[gallium-llvm] =3D &quot;-Dllvm=3Denabled -Dshared-llvm=
=
=3Denabled, -Dllvm=3Ddisabled, llvm${MESA_LLVM_RELEASE} llvm-native \<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003eb1fd05c50fbbcd--
