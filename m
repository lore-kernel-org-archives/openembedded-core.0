Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.11971.1601556638257937974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 05:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=moTE0B7q;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id f15so5965511ilj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kL/HDzSJoKvGfJ8TNj2bFzyP64ErsDCFLe/H22yUsdY=;
        b=moTE0B7qgHaBcwM8vg7t+gnocavvFxgtoT4bzQduG2CsqX7FB3izV5PBLkkx8+7hI0
         vxxnNxNR2cuebc8+EAVGiYyptm8V+6bFE1vQW1yATWyn7DOuz+/YklLPg4dwcrB4ihp+
         dnLCrAO/uWJlaBwpdPi4PEijvNmmGdBAQLcvWflYzHd3vO4O/PWXy4VaPCBVHAWJjeL6
         ylKtr6EPaHcwRCGb3a81X0xHbEhS4IbCJWN453TJC04ATMZb/V/u6Afe/RFqs3D5+4OH
         kxOtM8hzQ9G0OkU+G3TE2ounpQhaojWHoNBeDsbobJXu16MDcl4bYWv0Am6qlZODc7XY
         SSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kL/HDzSJoKvGfJ8TNj2bFzyP64ErsDCFLe/H22yUsdY=;
        b=RVeSdukzGI1wlbN6wS14FKL9eULUXwFflfkQEQpGQZ6fZ5u8O3q1sBeAO4j5yaHzsI
         UKwHM7PzW3VEnCTN6Dws2RdAzl6JU703CbSSuzQ2u+M//uHLUmxdUZbh3sgsJj3vbYnS
         Q01HEDvRAzOghmhj6OqPku5Y2EEk0uTxh08ajCDCtcFuGIPI8bJoV4UAG85gdEt+CAAL
         Qvn2Ny0jgioX2OkuTqNy4/YkH9VUnKGPZSSQrssvTxYcaE0BP0rClekpe1rMdc87TQcl
         w1kFUO32qXUW9DprtKj8qiAIsm+pe3xt7tdbRfd8JMJ8n7IutQuaLgPTgJGBEQtbTp/3
         DMPA==
X-Gm-Message-State: AOAM5318cm71JUG+h1QdxcP2CmQRRT8s/NcHJh3jCztKMNursUJ0EbU4
	WZ6Ygse5Onr4zRRJ5dxCBkEMnd2J65IAD5VqNyFp2EG9
X-Google-Smtp-Source: ABdhPJzQKuR5O+Z7373W7NS+5jZuufKcOrXY4fkPbiKJGMQL1S4Iy+6Ruxf4EtAtocA4fIsdUCaohQCh48tofsfM+ps=
X-Received: by 2002:a05:6e02:d06:: with SMTP id g6mr2200220ilj.151.1601556637340;
 Thu, 01 Oct 2020 05:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <Po14.1601556389979380134.H3Ii@lists.openembedded.org>
In-Reply-To: <Po14.1601556389979380134.H3Ii@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 1 Oct 2020 14:50:25 +0200
Message-ID: <CANNYZj9BAUa_JHrUMci_kMOje1_7hsH7pBENW+9TG8u_xVRWtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuboot: move QB_MEM to default in qemuboot
To: brett.warren@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000074da8b05b09b7654"

--00000000000074da8b05b09b7654
Content-Type: text/plain; charset="UTF-8"

I believe something similar was previously rejected on the grounds that the
need for 512M of RAM is not about opengl in general, it's about Xorg
failing to start when using glamor unless there's at least 512M. Otherwise,
we should continue to verify images with just 256M.

Therefore it is image specific.

Alex

On Thu, 1 Oct 2020 at 14:46, <brett.warren@arm.com> wrote:

> Previously, to satisfy opengl's requirement for at least 512MB
> of memory, QB_MEM was overriden by core-image-sato. This made it
> impossible for machine configurations to specify their own values,
> so this clause was moved to qemuboot instead and rewritten as a
> default to allow other recipes to state their own values if
> needed.
>
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
> meta/classes/qemuboot.bbclass               | 2 +-
> meta/recipes-sato/images/core-image-sato.bb | 1 -
> 2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index d8f62ef6ea..3a51fc5b5e 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -73,7 +73,7 @@
> # IMAGE_CLASSES += "qemuboot"
> # See "runqemu help" for more info
>
> -QB_MEM ?= "-m 256"
> +QB_MEM ?= '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512",
> "-m 256", d)}'
> QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
> QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
> QB_DEFAULT_FSTYPE ?= "ext4"
> diff --git a/meta/recipes-sato/images/core-image-sato.bb
> b/meta/recipes-sato/images/core-image-sato.bb
> index 673106eb6d..640313d6f7 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -11,5 +11,4 @@ inherit core-image
> TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
> TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool
> nativesdk-glib-2.0"
>
> -QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m
> 256", d)}'
> QB_MEM_qemumips = "-m 256"
> --
> 2.17.1
>
>
>
> 
>
>

--00000000000074da8b05b09b7654
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I believe something similar was previously rejected o=
n the grounds that the need for 512M of RAM is not about opengl in general,=
 it&#39;s about Xorg failing to start when using glamor unless there&#39;s =
at least 512M. Otherwise, we should continue to verify images with just 256=
M.</div><div><br></div><div>Therefore it is image specific.<br></div><div><=
br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 1 Oct 2020 at 14:46, &lt;<a href=3D"=
mailto:brett.warren@arm.com">brett.warren@arm.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-family=
:monospace"><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0);background-color:rgb(255,255,255)">Previously, to satisfy opengl&#39=
;s requirement for at least 512MB </span><br>of memory, QB_MEM was override=
n by core-image-sato. This made it <br>impossible for machine configuration=
s to specify their own values, <br>so this clause was moved to qemuboot ins=
tead and rewritten as a <br>default to allow other recipes to state their o=
wn values if <br>needed. <br><br>Signed-off-by: Brett Warren &lt;<a href=3D=
"mailto:brett.warren@arm.com" target=3D"_blank">brett.warren@arm.com</a>&gt=
; <br>--- <br>meta/classes/qemuboot.bbclass =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 +- <br>meta/reci=
pes-sato/images/<a href=3D"http://core-image-sato.bb" target=3D"_blank">cor=
e-image-sato.bb</a> | 1 - <br>2 files changed, 1 insertion(+), 2 deletions(=
-) <br><br>diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemubo=
ot.bbclass <br>index d8f62ef6ea..3a51fc5b5e 100644 <br>--- a/meta/classes/q=
emuboot.bbclass <br>+++ b/meta/classes/qemuboot.bbclass <br>@@ -73,7 +73,7 =
@@ <br># IMAGE_CLASSES +=3D &quot;qemuboot&quot; <br># See &quot;runqemu he=
lp&quot; for more info <br>=C2=A0<br>-QB_MEM ?=3D &quot;-m 256&quot; <br>+Q=
B_MEM ?=3D &#39;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;ope=
ngl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}&#39; <br>QB_SERIAL_O=
PT ?=3D &quot;-serial mon:stdio -serial null&quot; <br>QB_DEFAULT_KERNEL ?=
=3D &quot;${KERNEL_IMAGETYPE}&quot; <br>QB_DEFAULT_FSTYPE ?=3D &quot;ext4&=
quot; <br>diff --git a/meta/recipes-sato/images/<a href=3D"http://core-imag=
e-sato.bb" target=3D"_blank">core-image-sato.bb</a> b/meta/recipes-sato/ima=
ges/<a href=3D"http://core-image-sato.bb" target=3D"_blank">core-image-sato=
.bb</a> <br>index 673106eb6d..640313d6f7 100644 <br>--- a/meta/recipes-sato=
/images/<a href=3D"http://core-image-sato.bb" target=3D"_blank">core-image-=
sato.bb</a> <br>+++ b/meta/recipes-sato/images/<a href=3D"http://core-image=
-sato.bb" target=3D"_blank">core-image-sato.bb</a> <br>@@ -11,5 +11,4 @@ in=
herit core-image <br>TOOLCHAIN_HOST_TASK_append =3D &quot; nativesdk-intlto=
ol nativesdk-glib-2.0&quot; <br>TOOLCHAIN_HOST_TASK_remove_task-populate-sd=
k-ext =3D &quot; nativesdk-intltool nativesdk-glib-2.0&quot; <br>=C2=A0<br>=
-QB_MEM =3D &#39;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;op=
engl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}&#39; <br>QB_MEM_qem=
umips =3D &quot;-m 256&quot; <br>-- =C2=A0<br>2.17.1<br></span><span style=
=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"> </span><br><br></=
span>
<br>
<br>
<br>
</blockquote></div>

--00000000000074da8b05b09b7654--
