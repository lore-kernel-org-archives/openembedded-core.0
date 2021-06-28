Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web12.9685.1624878001138630894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 04:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=leyrh9Ir;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id c20so6789998uar.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 04:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWm89El1reI33J9nm4m70PqTmkSuX2FP4FH+jocqvvM=;
        b=leyrh9IrqOsTvTVmNfCAY3/uloLW9WIlFKGowhLRHh1O7ovd1gO/zUPNneYaa0Ejgc
         F/sAMZ51AIWlVjKWwv0ts8jbkGm5dcKHndPuvGP0BrLWg6gcKonOm2kb9puO1CAUVFT3
         f+G5D/oplrqnaAARIIid4QSP730JJ/YPnD1pkiFJqQjFnSHew2RhbzezovRedsmbUvQy
         1R7iGi7D3N4U2YcpsKuqbAPeO6TGfUzT6SL11pd6GC/Gmln/tEgmOTxdVxSqF4olgfIq
         gZFzVFUEHwZG9XhI6d1DM2RKy5RVlvEuQK37/D8mGgf/+xLXMB0h0MRJj2JKhOsl3OSA
         kv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWm89El1reI33J9nm4m70PqTmkSuX2FP4FH+jocqvvM=;
        b=XXr2cvhW9tnQzxNEJ1Hlp9vBaLJxLKITVCqDKTSgLsOUMGOJN6qeXdSBvW4hFG4xbL
         jcZezhL6PK6soQXqxi035uh3jtbmbhGdwUdr/QcZKU+qpn/mROzpHy5EO4NPIL9BHEZK
         SD0+aI4RngXiRmaU9fvJVVKhs08c02NiikJzaAsnIHLih/wux9y2HCrNIx7EeOGE+qnD
         cmmrboG11s9VTCfjzYQYgtT2Dm/skc9Nogg0dQBwLc2DT7nUIaHDtteafzHqfcPWJIax
         o3H5Kfym8IGzRpWprOxMr/C/qp6k4OKmEEvDjqiatHJ1CGbZjtAkxn3h8dAIdwoIUzdn
         B13Q==
X-Gm-Message-State: AOAM532ygmPvhjN2ylD5eHCqLQStPo8QlIMKZoZCz/LoMWcVTr7+/S0z
	FpY39te4z0MuLOa3NZ+xZDLYQqZt9hYQFwMZyJw=
X-Google-Smtp-Source: ABdhPJzXIB8ub4m6F/xP5HfQLl35Koj2ye8931lWjDI4Ptv3pxf8sVf7V/Znu2669JBxveW2PTHBz+I8CWzYejhPhGE=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr13850243uap.22.1624878000293;
 Mon, 28 Jun 2021 04:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
In-Reply-To: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 28 Jun 2021 12:59:48 +0200
Message-ID: <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000002cbe705c5d164d9"

--00000000000002cbe705c5d164d9
Content-Type: text/plain; charset="UTF-8"

Seems like an upstream problem rather than a Yocto one?

Alex

On Mon, 28 Jun 2021 at 12:02, Andrea Adami <andrea.adami@gmail.com> wrote:

> Hello,
>
> during a core-image-sato build for armv4 I got one single build
> failure with pulseaudio.
>
> This happens after commit 80bbea0 pulseaudio: switch build system from
> Autotools to Meson. In the commit text it is evidenced:
>
> "
> With Meson there's no option for disabling Neon optimizations if the
> compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
> because the build system adds -mfpu=neon at the end of the compiler
> command line, overriding any earlier -mfpu options. This shouldn't be
> a problem, because PulseAudio detects at runtime whether the CPU
> supports Neon instructions.
> "
>
> At the moment to build pulseaudio for armv4/5 I have reverted to using
> autotools.
>
>
> There was around a patch but has not been merged.
> https://lists.openembedded.org/g/openembedded-core/message/146375
>
> Maybe a v2 will be accepted?
>
> Cheers
> A.A.
>
> 
>
>

--00000000000002cbe705c5d164d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems like an upstream problem rather than a Yocto on=
e?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Jun 2021 at 12:02, And=
rea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.com">andrea.adami@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello,<br>
<br>
during a core-image-sato build for armv4 I got one single build<br>
failure with pulseaudio.<br>
<br>
This happens after commit 80bbea0 pulseaudio: switch build system from<br>
Autotools to Meson. In the commit text it is evidenced:<br>
<br>
&quot;<br>
With Meson there&#39;s no option for disabling Neon optimizations if the<b=
r>
compiler supports Neon. If -mfpu is set in CC or CFLAGS, it&#39;s ignored,=
<br>
because the build system adds -mfpu=3Dneon at the end of the compiler<br>
command line, overriding any earlier -mfpu options. This shouldn&#39;t be<=
br>
a problem, because PulseAudio detects at runtime whether the CPU<br>
supports Neon instructions.<br>
&quot;<br>
<br>
At the moment to build pulseaudio for armv4/5 I have reverted to using<br>
autotools.<br>
<br>
<br>
There was around a patch but has not been merged.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1463=
75" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/message/146375</a><br>
<br>
Maybe a v2 will be accepted?<br>
<br>
Cheers<br>
A.A.<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000002cbe705c5d164d9--
