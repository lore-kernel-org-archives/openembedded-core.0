Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.20283.1625660468630174775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 05:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kXTMjJ3l;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id o12so1442017vsr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O62OTozJpdrBfiHUs0xcILha6OKszp79iSo5Lr3YOw4=;
        b=kXTMjJ3lyZcbKUfe7GXfyz4VlMC0Ye7iJq8GapQnwZZ7KZls9ikqQLnLRjf3oY8guW
         iFgXL2LOk56VfvHsIo9aAgcmDtzbBZDTSbr1H4X7Ow+djuvtdiPREDvIZbWetm7KQymF
         gfuw0/6M63FFAfOYAiz7SQPMNevrn9fHSkW43rGfS5Hog73zAIJjmQtuc8jjjfTnmZf6
         DbAhq/pYxJtotJiqJ9ZtdTWgAyeFDiJg5vSuEqy48/7IrFeJSxzW2DTtn+gGHScbTgX5
         YvRcMs1FCCXE89DhhAig1NOChN20OB0FKN7WfvSamhmWswXQD0uvRLuorr2GQA53b2sm
         sygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O62OTozJpdrBfiHUs0xcILha6OKszp79iSo5Lr3YOw4=;
        b=n7lxZ3Nt4tPsGEMsSrMIK0Jftha/eyZqHmYI3EASXO29fXJPwhc3egaNOeXGuEt9ZW
         CW85XFy7gbEKs/+ZmXqEKZpTW+6ZZzT6JIHYCbK0/j4FLnP+MHsswdX+i6pZQO9GO3n3
         s2qKnCG+zuKp8l8zSogNkjABvxhNHCnDdkclERwWYbl/950yyIf1DfLbzWfHSqkHRgV8
         cgB6aJXvc8b3EG6AzdH/UzGFgmf2B5NH7Sc+E8sJ6H+k5LZd5Ds7DPUAjyilZeR5ljpP
         oTTRCz/1V3T2R/aAh2Sv172NfGDuOTstYcPOzoQ3h0S1ad/Fy97vTuXpYoERHfuoB6QS
         Pp1w==
X-Gm-Message-State: AOAM532tuu5mnAcZ/WFrYK4nfxbMTBvFLZZrulFVJuFNk/9wV+4OJlJM
	y5phMLn4LBAdqQFtJ7EKAs5pImNZS+MFULhcNOebwpZELAY=
X-Google-Smtp-Source: ABdhPJxKqJZN9ZgWrDiN7JKAxgB2EQ4sJuzdng/VNzLgkUsiQk/vtgHaDvP6NrYvKTCQI3g6ovyRZAe6bH19y6JABnI=
X-Received: by 2002:a67:ec11:: with SMTP id d17mr20376041vso.54.1625660467706;
 Wed, 07 Jul 2021 05:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210707085419.2610-1-mingli.yu@windriver.com>
In-Reply-To: <20210707085419.2610-1-mingli.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 7 Jul 2021 14:20:56 +0200
Message-ID: <CANNYZj8QTxMG0O5mQs5kRQRedPRRNZMxiwPGZGgBiK8jL=DAOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemuarm64.conf: change the cpu model to max
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b3fcfa05c687922a"

--000000000000b3fcfa05c687922a
Content-Type: text/plain; charset="UTF-8"

'max' implies that it's not stable and will change depending on qemu
version and build settings. Can you set it to a specific model?

Alex

On Wed, 7 Jul 2021 at 10:55, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> After rng-tools upgraded to 6.13, the below logic introduced.
> 9070a04 Add support for ARM v8.5A "rndr" instruction
>
> It means there is another entropy source rndr added for arm64,
> so modify the cpu model to max [1] to make the rndr entropy source
> function available and also used to silence the below failed message
> when start rngd service on qemuarm64.
> "[rndr ]: Initialization Failed"
>
> Before the patch:
>  $ systemctl status rngd
>  [snip]
>  Jul 05 07:15:47 qemuarm64 systemd[1]: Started Hardware RNG Entropy
> Gatherer Daemon.
>  Jul 05 07:15:48 qemuarm64 rngd[152]: Initializing available sources
>  Jul 05 07:15:48 qemuarm64 rngd[152]: [hwrng ]: Initialized
>  Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: No HW SUPPORT
>  Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: Initialization Failed
>  Jul 05 07:15:48 qemuarm64 rngd[152]: [jitter]: Initializing AES buffer
>  Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Enabling JITTER rng support
>  Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Initialized
>
> After the patch:
>  $ systemctl status rngd
>  [snip]
>  Jul 07 08:48:30 qemuarm64 systemd[1]: Started Hardware RNG Entropy
> Gatherer Daemon.
>  Jul 07 08:48:34 qemuarm64 rngd[164]: Initializing available sources
>  Jul 07 08:48:34 qemuarm64 rngd[164]: [hwrng ]: Initialized
>  Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr  ]: Enabling aarch64 RNDR rng
> support
>  Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr  ]: Initialized
>  Jul 07 08:48:35 qemuarm64 rngd[164]: [jitter]: Initializing AES buffer
>
> [1] https://github.com/nhorman/rng-tools/pull/128
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/machine/qemuarm64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemuarm64.conf
> b/meta/conf/machine/qemuarm64.conf
> index 150a0744eb..a792dc32e6 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -15,7 +15,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  # For runqemu
>  QB_SYSTEM_NAME = "qemu-system-aarch64"
>  QB_MACHINE = "-machine virt"
> -QB_CPU = "-cpu cortex-a57"
> +QB_CPU = "-cpu max"
>  QB_SMP = "-smp 4"
>  QB_CPU_KVM = "-cpu host -machine gic-version=3"
>  # For graphics to work we need to define the VGA device as well as the
> necessary USB devices
> --
> 2.17.1
>
>
> 
>
>

--000000000000b3fcfa05c687922a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&#39;max&#39; implies that it&#39;s not stable and wi=
ll change depending on qemu version and build settings. Can you set it to a=
 specific model?</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 7 Jul 2021 =
at 10:55, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli.=
yu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.c=
om" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
After rng-tools upgraded to 6.13, the below logic introduced.<br>
9070a04 Add support for ARM v8.5A &quot;rndr&quot; instruction<br>
<br>
It means there is another entropy source rndr added for arm64,<br>
so modify the cpu model to max [1] to make the rndr entropy source<br>
function available and also used to silence the below failed message<br>
when start rngd service on qemuarm64.<br>
&quot;[rndr ]: Initialization Failed&quot;<br>
<br>
Before the patch:<br>
=C2=A0$ systemctl status rngd<br>
=C2=A0[snip]<br>
=C2=A0Jul 05 07:15:47 qemuarm64 systemd[1]: Started Hardware RNG Entropy G=
atherer Daemon.<br>
=C2=A0Jul 05 07:15:48 qemuarm64 rngd[152]: Initializing available sources<=
br>
=C2=A0Jul 05 07:15:48 qemuarm64 rngd[152]: [hwrng ]: Initialized<br>
=C2=A0Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: No HW SUPPORT<br>
=C2=A0Jul 05 07:15:48 qemuarm64 rngd[152]: [rndr ]: Initialization Failed<=
br>
=C2=A0Jul 05 07:15:48 qemuarm64 rngd[152]: [jitter]: Initializing AES buff=
er<br>
=C2=A0Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Enabling JITTER rng s=
upport<br>
=C2=A0Jul 05 07:16:14 qemuarm64 rngd[152]: [jitter]: Initialized<br>
<br>
After the patch:<br>
=C2=A0$ systemctl status rngd<br>
=C2=A0[snip]<br>
=C2=A0Jul 07 08:48:30 qemuarm64 systemd[1]: Started Hardware RNG Entropy G=
atherer Daemon.<br>
=C2=A0Jul 07 08:48:34 qemuarm64 rngd[164]: Initializing available sources<=
br>
=C2=A0Jul 07 08:48:34 qemuarm64 rngd[164]: [hwrng ]: Initialized<br>
=C2=A0Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr=C2=A0 ]: Enabling aarch64=
 RNDR rng support<br>
=C2=A0Jul 07 08:48:34 qemuarm64 rngd[164]: [rndr=C2=A0 ]: Initialized<br>
=C2=A0Jul 07 08:48:35 qemuarm64 rngd[164]: [jitter]: Initializing AES buff=
er<br>
<br>
[1] <a href=3D"https://github.com/nhorman/rng-tools/pull/128" rel=3D"noref=
errer" target=3D"_blank">https://github.com/nhorman/rng-tools/pull/128</a><=
br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/qemuarm64.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm6=
4.conf<br>
index 150a0744eb..a792dc32e6 100644<br>
--- a/meta/conf/machine/qemuarm64.conf<br>
+++ b/meta/conf/machine/qemuarm64.conf<br>
@@ -15,7 +15,7 @@ SERIAL_CONSOLES_CHECK =3D &quot;${SERIAL_CONSOLES}&quot;=
<br>
=C2=A0# For runqemu<br>
=C2=A0QB_SYSTEM_NAME =3D &quot;qemu-system-aarch64&quot;<br>
=C2=A0QB_MACHINE =3D &quot;-machine virt&quot;<br>
-QB_CPU =3D &quot;-cpu cortex-a57&quot;<br>
+QB_CPU =3D &quot;-cpu max&quot;<br>
=C2=A0QB_SMP =3D &quot;-smp 4&quot;<br>
=C2=A0QB_CPU_KVM =3D &quot;-cpu host -machine gic-version=3D3&quot;<br>
=C2=A0# For graphics to work we need to define the VGA device as well as t=
he necessary USB devices<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b3fcfa05c687922a--
