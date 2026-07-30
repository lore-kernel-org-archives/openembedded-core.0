Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF034C55164
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 15:17:47 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14071.1785424659966947441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 08:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M9clNvOY;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e86df8987so32632137b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 08:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785424659; cv=none;
        d=google.com; s=arc-20260327;
        b=qguQScbqAAa8wGofi4czOuSIPr3LY4zTUBMCehKhric0yYB02iO96DkUYg0FWhFyzY
         qPUXCOsm0Pqh8HqUIWE1gYtHLMkREXWTZy0dL6sWRyNvQloHTenfahXoxIZCxaNptGod
         boIzKHe/LGxf56EVGKL3sx9zCGmjrE1/fCQJoIW8DNLtjQzSApjZt4IqAwvcJSR91FsF
         XBZ4XZdiRD+I2pVQZzyahWVshKVD28DhD3o3CERqM9Pd2vAi0snGGDYLUGSUDjlRFk4J
         MPY6lfB48bEJEoM49A+h2DpQ5/D850vJr0HmcKrdjRD/hDYiSyuf2ht016JUnxuoy7UM
         uM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qv/o5L8jJpEO5aynUWvxjbG1xI0ve/xw+vbyw96rz+I=;
        fh=TxMzPqAUhQDT5dbbgrBBVztQe2k6cOH78kZoBPdykqA=;
        b=DLrBFP60sVAyt/IpYj1Yb1xD3M+l8Moj+Jc34/ZD4x69N6z42oyoQFaosU005MvpNg
         ilT7t01/NS57gtYqK4pvV/2nIQXBvWxcpKd7ijEV3f1DAUzscpmk6tPgsXMU5GvES9Lt
         hxWxGlpZ9cvcPpvjl6ejKiYTaKoQxXj2s6HQyRJfmWSYtbhdT9Ou/kFb6FTATeN3/SoJ
         pRqE/haCbe/48g38MDYmwlZA24Aqmd++OhN9xGXiP+ohyrDMOGHj9xjWZMJ7l+QGLEo9
         V7CuiNT3qRsrftca9X5oj+P1J5N95phaV90X+RBWaBBOVaLUgMVlIXg54zbFt9znzo9X
         7qcw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785424659; x=1786029459; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qv/o5L8jJpEO5aynUWvxjbG1xI0ve/xw+vbyw96rz+I=;
        b=M9clNvOYqFGicQIwBepvG1dxUtou9T8eRoaO++AYA1qPHIuDWNHs3SirbIu26NKsmi
         con0kaNLDv4kf4grfVc6fyREEcOE/zQPhVe5CfTzcjIrglwjCEe+BP7NcupKFvMjPCJR
         dYBXY4Uqr3vBx7Z1HMRo89+S74blZ9Ens1q9XndlPCBvdU2wxxLSfwCLvxJJy1H+0enT
         SJC0oocrD2cO5yk8vgF9zm9GLB/QWGKkpAuFCim3DckCWizYnTH/mOGXL13DNnS7rH8v
         UWFyY66pStSPJ9wpgdJzs6/biBI9LOnJZfVJylGRsIkWbPUjtLrt+LL7sBbFxLhK43mW
         08tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424659; x=1786029459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qv/o5L8jJpEO5aynUWvxjbG1xI0ve/xw+vbyw96rz+I=;
        b=n7F6Zbrx74nQa9YN6IZyAosX9eM+gxgAF/JO/0D7rHuCZtn1rHWriStkEo2iATlbLD
         35+zbt6qwfM8Wdc1iLPcUz5QjImxRuBsoYGLt23EsnztkpyFUmLi/o1ILLoeUx4S2gEC
         g9exA5+JbLatHfN3upaByn1Lt7ibFr90OnKk6+hHXsdOXbz1qh4nPGGg+ACEO9kJCJw2
         L7QF0s3yNrSK3DNiii6Ui4r/CLnq5fOUf3Hri06IVoK/spqnzI2+uRoc2BdC6H2cjkNu
         wNxMx7vtgqN/Upl17fKnOagk5DvDXtW587poaGwJiO08BZss+YB1aIqA1imR1OykAxeM
         MkYA==
X-Forwarded-Encrypted: i=1; AHgh+RoXPepKd7DuQeEkwHL+NCXssYeVUXW/iD3CiiHZj+F8QArFSdtQxp0TiGHcWKUN+N4ONP/Ah8smXrO0omKGCJfcfQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3w3ILGEiC4FcbDZtNffzAsYdoKPl3/jGDoFuCLF7AjpaACS/2
	6Nwhit7YH5TPy6TpfkcFZTzEaId5MypCjvJrKFm2cjsWDXfyPxig/ImsrBrqYi+OkKnix9R5740
	jZ+sOhrvzcGTiYtuntZscnaImDLswcHc=
X-Gm-Gg: AR+sD12ERPdmRwtxf1TINjQWluXth8iUemYRT9wEpgfYhdUsgpIDTZOFUsFuBcYFUJU
	m+MJpq6lq43D0Oh7yXyyX3S71NkPJYz15Ld2MOnEJOt8wVWgFoCk+A7KeJXLpNascJy50PMdziX
	34Ak10kF6TLhCu2plcw6x+zCiQj2SFDZ9VYsEZ0fk6AOHO28FctDyra7k4Y2T6nGt7kFITJfjrP
	iFX936RD4iqkO7sZbXpNKkkRn2uAPenGhwV5dVruaw8j3WJYKiB3V/xlN1t+saJNp30nEVJSDhD
	UuPHh3jbnRJmgV/XPKkMSq6gE4+wUx2gzuKHgcveNoR/UbOvXtVJBKfbQ5WuTsQGXMJ+mikT1kg
	ZzWSrhbnuJRVqH3DXLVhPLG7O4msgvwu3+xi+WBgTCi5FnqkX7C7xpLw+m19Alkg=
X-Received: by 2002:a05:690c:b02:b0:7ff:19d6:74ee with SMTP id
 00721157ae682-81fb8a5a271mr21697067b3.33.1785424658624; Thu, 30 Jul 2026
 08:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260720155842.569263-1-bruce.ashfield@gmail.com>
 <20260720155842.569263-7-bruce.ashfield@gmail.com> <DKBYL99QOTEO.3BJX0NMLPEIJ@smile.fr>
In-Reply-To: <DKBYL99QOTEO.3BJX0NMLPEIJ@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 Jul 2026 11:17:25 -0400
X-Gm-Features: AUfX_myJzqYeHDrZUO369gVZkj0cniuBk0IHm0GGNBtKunekuHpGjELVfmeTizo
Message-ID: <CADkTA4P4fqiWpf=4LY0Gz+aHDpz5RcdSRFE80STM9CC4ZgqZDA@mail.gmail.com>
Subject: Re: [OE-core] [meta-yocto-bsp][PATCH 06/06] yocto-bsps: update to v6.18.39
To: Yoann Congal <yoann.congal@smile.fr>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008cf5a70657d5929f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 15:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242367

--0000000000008cf5a70657d5929f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 10:01=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Mon Jul 20, 2026 at 5:58 PM CEST, Bruce Ashfield via
> lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/6.18 to the latest korg -stable release that
> comprises
> > the following commits:
> >
> >     f89c296854b75 Linux 6.18.39
> >     [...]
> >     501543207378f bpf, arm64: Reject out-of-range B.cond targets
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> > index d8790f3..8816184 100644
> > --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> > +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
> > @@ -8,4 +8,4 @@ KMACHINE:genericx86 ?=3D "common-pc"
> >  KMACHINE:genericx86-64 ?=3D "common-pc-64"
> >
> >  KBRANCH:genericarm64 ?=3D "v6.18/standard/genericarm64"
> > -SRCREV_machine:genericarm64 ?=3D
> "daaaf767b0cba42bcd9ba3f5b5f6b42b5e695a3f"
> > +SRCREV_machine:genericarm64 ?=3D
> "08d2d1aaeb84ad2774df573efc336bb7ca773d40"
>
> Hello Bruce,
>
> I recently noticed that I never merged a similar patch for scarthgap:
> * OE-core/linux-yocto is up to 6.6.144
> * meta-yocto-bsp/linux-yocto_6.6.bbappend stopped at 6.6.21
>
> Is that expected?
>

Sort of.

Since I don't have access to the reference BSP hardware, I can't boot test
them, so
I tend to not bump them. I can bump them on compile only, but that's
obviously not
ideal.

In the latest release, we had to give genericarm64 it's own BSP branch due
to some
patches we carry, as such, it needs a separate SRCREV bump. If I don't bump
it, we
get a QA failure with the kernel versions not matching, so I'm forced to
bump it (with
the same compile only level of testing).

Hence why the two are different policies.

I can definitely bump the old ones, if folks are ok with that level of
testing.

Bruce



> --
> Yoann Congal
> Smile ECS
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008cf5a70657d5929f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 30, 2026 at 10:01=
=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Mon Jul 20, 2026 at 5:58 PM CEST, Bruce Ashfield via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Updating linux-yocto/6.18 to the latest korg -stable release that comp=
rises<br>
&gt; the following commits:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0f89c296854b75 Linux 6.18.39<br>
&gt;=C2=A0 =C2=A0 =C2=A0[...]<br>
&gt;=C2=A0 =C2=A0 =C2=A0501543207378f bpf, arm64: Reject out-of-range B.con=
d targets<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbap=
pend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend<br>
&gt; index d8790f3..8816184 100644<br>
&gt; --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend<br=
>
&gt; +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend<br=
>
&gt; @@ -8,4 +8,4 @@ KMACHINE:genericx86 ?=3D &quot;common-pc&quot;<br>
&gt;=C2=A0 KMACHINE:genericx86-64 ?=3D &quot;common-pc-64&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 KBRANCH:genericarm64 ?=3D &quot;v6.18/standard/genericarm64&quot=
;<br>
&gt; -SRCREV_machine:genericarm64 ?=3D &quot;daaaf767b0cba42bcd9ba3f5b5f6b4=
2b5e695a3f&quot;<br>
&gt; +SRCREV_machine:genericarm64 ?=3D &quot;08d2d1aaeb84ad2774df573efc336b=
b7ca773d40&quot;<br>
<br>
Hello Bruce,<br>
<br>
I recently noticed that I never merged a similar patch for scarthgap:<br>
* OE-core/linux-yocto is up to 6.6.144<br>
* meta-yocto-bsp/linux-yocto_6.6.bbappend stopped at 6.6.21<br>
<br>
Is that expected?<br>
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Sort of.=C2=A0</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Since I don&#39;t have access to the reference BSP hardware, I can&#39;t=
 boot test them, so</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I tend to not bump them. I can bump them on compile only, but that&#39=
;s obviously not</div><div class=3D"gmail_default" style=3D"font-size:small=
">ideal.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">In the latest re=
lease, we had to give genericarm64 it&#39;s own BSP branch due to some</div=
><div class=3D"gmail_default" style=3D"font-size:small">patches we carry, a=
s such, it needs a separate SRCREV bump. If I don&#39;t bump it, we</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">get a QA failure with =
the kernel versions not matching, so I&#39;m forced to bump it (with</div><=
div class=3D"gmail_default" style=3D"font-size:small">the same compile only=
 level of testing).</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Hence=
 why the two are different policies.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">I can definitely bump the old ones, if folks are ok with that l=
evel of testing.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000008cf5a70657d5929f--

