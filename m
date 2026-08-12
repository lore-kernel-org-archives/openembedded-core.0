Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38996C5CFEE
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 15:47:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11404.1786549613989925232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 08:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GtpN6n5m;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso90842866b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786549612; cv=none;
        d=google.com; s=arc-20260327;
        b=lVVlkEQ75JhoGiVjNYBg+7/wZ4zMRCtiQMVSW/KoeCJ/mruyWNb1WKyrL8P6eEbLMY
         NbKQMYdowxAdJnHaEygtTus2p43W/xr54yQKYrjlsd30Z9xQvVikfiRyg+AnVw1dKtIh
         5v/RYb+7GjEXbUCFBEr9oZXnikDTOKTOq42P1iw0osCRQ0ufoQ97vlLWrpRy2bPphrQK
         20ol/p0SWNHTaL/e+X4y5BicSmr9ZlWgMAI9XZ+kfwsTSTA0Ib7PvEb8UERydn5wVXiS
         2U7w7pi7huy7FPZyxSn/Nae9AhCRwIQCl12YmR07MRiB/sbVS+nLH6JbBLrxkc1ffSHQ
         R/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EjfJBFQqQ1J4p88ZbB3RtclBm/Xswh7gvhBjh5YE34g=;
        fh=b8Q6D2u0R52NvAWtL4oRn71L01roapeaFlhGdA0Gb08=;
        b=BJCOlsIVo0f1lMZZj4SQaF58vzqUtqZ8kyMLWyVpjkisiRnCt/LmsFBbgZXD8JHW5G
         yG+l901XhhRXdgTsyjKKAFxL7By9lKIZJs6As9fR9pJmq9a6mbQT90KO1+RpZlKpc+0z
         NAnyQO+wIoN9RcUxz77x+INGluNzbJI8soOwaMnqndROCC5RBbrYzyRDn8kio9ngEIl+
         GNm/dF7xfhCE6TgLsVFqRuiQnog7SFYMLAGacwPDzIarGD2Hd/ePGhQTnD4vmWD12B8w
         Xc1JHn7WW1iQVuyDe0dji+ch1DjiceOcIEhwm1ricxIpRsgYUwTQEcpb8Sy6TXCqoafu
         pXBg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786549612; x=1787154412; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjfJBFQqQ1J4p88ZbB3RtclBm/Xswh7gvhBjh5YE34g=;
        b=GtpN6n5mL/A7IzoM9VuTvHdjv1jf9HeM8h6BZpG50PpDEGppkjdpSdMQBQKuMI3GBm
         UPNtSphI3K7IOexqbm3N0cAjP+gyo1I7tMPiK9/MYawnkdslMVpoKjLaIP8OSjPMqxvJ
         DRzoqnG5Hef8IKizO+31sTxPSvHs1Bgup0o4B7dGg1MInWoMHKHgDH+tF6OgGXvGPvLC
         aPftu8YJrd2zoyVU5KcFbh5o/GEWPoYFKmrHiHG6caudN7JsmlhtX4tv6/OkYazZZlmb
         2tnn+VrwoZQctJtgcnAKr7GTyXAq2LBoaegYn7iJgmQl9cAG4xvxB5aJaU1j+KTi6Jzj
         SUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549612; x=1787154412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EjfJBFQqQ1J4p88ZbB3RtclBm/Xswh7gvhBjh5YE34g=;
        b=KPcMsRZBvIFbMzrvPcu+K9hvZHOPLbwFaS8EUXmPbXwiiMR7akEaMyxEwjzCWyjIib
         fzNFFn4fjKjVzjZVwnOitlrKyA3jq/ytAyLHDT3gRLfjFCplu/NyqtrPzaLUa0s9df2n
         x6jAaCSNd7z6f/qXAkP3r8OA+jnn0uQ0Io+8IevdAbPoOpBuAVXX/7XmlZdlwUQ7jFM/
         tsf1mkgqb7L1V1vyx1s65xjSr+W6HsAlS82F4ijNI+sAGZgaYRHKaJGRnEdB0G209rJz
         ced+OvlemkvhwStG1j0haur1rAN7NaWiUsglG0SYu/9+GPb90BIZEu75ctWt7xK3zNci
         o6Zg==
X-Gm-Message-State: AOJu0YzDk0PBy4W2GCDtMQcW1EHp6hvciAfUj71AINXcXKD1zY+xDrnx
	10OLnoI81F8zQqiqB0UjX1aQDwIhZedSNsFrulx0B7lwcWw+ofoTUv5MVBhzzizTGD91IjiJw0j
	exCPc5qnqC2HkWXYuDOm2VeLzm1/3KXc=
X-Gm-Gg: AR+sD10oIA5vfG4rATbM5x1BQyxR9AQfpdMRym3w/oDZv9McOtRdk9bvqDpdQ4/cZkI
	R3jOA2IL8/Q/FfW+BplpOOfPKxTDQ4Y67iU2tsEIzSzD6UVWF4KYLDNJuiJ3cC3PhihPzvYPnQY
	yCVFIHv9xNBpIy+LPk5/F+H9yHkPucaNOyCKjcNhFOw54gOxduCUEjF8gLJsaxKPgivvfptcyf/
	FD95tgNya/97SC5JFfVKGfUU/GuQNJAnIpFimXPFinpVttYow7BJb8O8HsXEYFZQkuFTwci0msI
	Qlmw01mpJc/+kYUuH+bEBe0Og4EMdHwJXVlGkp6OiEtTyp5DHGRuQZXlUVaRRZN+Tbfx2Gy/gEB
	u8JyIWoHfl3BtITXNlJqhBFqQnXpkVJyljU0taNqDCL7499w5UcJ5dCdT793M44Q=
X-Received: by 2002:a17:907:8dcd:b0:c1f:b883:ed3b with SMTP id
 a640c23a62f3a-c20f2e3d704mr266866066b.4.1786549611967; Wed, 12 Aug 2026
 08:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260812130655.15109-1-anis.bougrine10@gmail.com> <DKN0I9BUB6PD.3V0CQ1YVMPXDN@bootlin.com>
In-Reply-To: <DKN0I9BUB6PD.3V0CQ1YVMPXDN@bootlin.com>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Wed, 12 Aug 2026 17:46:40 +0200
X-Gm-Features: AUfX_mwg8Sv5irFHTu_1VGFBhBWDFs9nQ1wguiEr5JgsmCFqyhJJeaQc2RC9hWA
Message-ID: <CAGgtUzaO1g+CXpoOi-aUgYNYF-8SGOVvWNWnJvOXFsLjCjVYmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add strip process for signed
 kernel modules
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Content-Type: multipart/alternative; boundary="000000000000feb9900658db7e94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 15:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243295

--000000000000feb9900658db7e94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

I took your suggestion into account. A v2 patch may look like this:

    if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
        # If the module will be auto-signed, perform stripping before
signing.
        if [ "$(./source/scripts/config --file ./.config --state
MODULE_SIG)" =3D y ] &&
           [ "$(./source/scripts/config --file ./.config --state
MODULE_SIG_ALL)" =3D y ]; then
            export INSTALL_MOD_STRIP=3D"--strip-debug
--remove-section=3D.comment --remove-section=3D.note --preserve-dates"
        fi
        oe_runmake DEPMOD=3Decho
MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install
    fi

However, I think grepping the .config file is more reliable, since its
location inside ${WORKDIR} is more stable than the location of the config
script.


I stay open to any further suggestions.


BR,

Anis

On Wed, Aug 12, 2026 at 3:50=E2=80=AFPM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Hi,
>
> On Wed Aug 12, 2026 at 3:06 PM CEST, Anis Bougrine via
> lists.openembedded.org wrote:
> > Currently, signed kernel modules skip the stripping process in order
> > to preserve the file contents after signing. See commit:
> > 4c47e5f171fa2603355e2f9183065ce8137a18c7
> >
> > However, the kernel install Makefile supports stripping modules before
> > signing them. This allows signed modules to be stripped while preservin=
g
> > a valid signature.
> >
> > Make non-signed kernel modules follow the standard Yocto stripping flow=
,
> > while signed kernel modules use the kernel Makefile stripping flow.
> >
> > Fixes [YOCTO #12927]
> >
> > Reported-by: ross.burton@arm.com
> > Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> > ---
> >  meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index a82bdf7ecb..0d8d370e9d 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -453,7 +453,21 @@ kernel_do_install() {
> >       #
> >       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >       if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > -             oe_runmake DEPMOD=3Decho
> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
> > +             # If the module will be auto-signed, perform stripping
> before signing.
> > +             if grep -q '^CONFIG_MODULE_SIG=3Dy$' .config && grep -q
> '^CONFIG_MODULE_SIG_ALL=3Dy$' .config; then
>
> Suggestion: you can use the kernel's scripts/config utility to get the
> option
> values:
>
> $ ./scripts/config --file ./.config --state MODULE_SIG
> y
>
> So that you really see the option value as the kernel sees it.
>
> Antonin
>

--000000000000feb9900658db7e94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Antonin,<div><br=
></div><div>I took your suggestion into account. A v2 patch may look like t=
his:</div><div>=C2=A0<br><span>=C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG=
_MODULES=3Dy$&#39; .config); then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the m=
odule will be auto-signed, perform stripping before signing.<br></span>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$(./source/scripts/config --file ./.con=
fig --state MODULE_SIG)&quot; =3D y ] &amp;&amp;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0[ &quot;$(./source/scripts/config --file ./.config --st=
ate MODULE_SIG_ALL)&quot; =3D y ]; then<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 export INSTALL_MOD_STRIP=3D&quot;--strip-debug --remove-section=
=3D.comment --remove-section=3D.note --preserve-dates&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fi<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake DEPMOD=3Dech=
o MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_=
PATH=3D${D}${nonarch_base_libdir}/firmware modules_install<br>=C2=A0 =C2=A0=
 fi<br><br>





<p style=3D"margin:0px;font-style:normal;font-variant:normal;font-size-adju=
st:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;=
font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">H=
owever, I think grepping the .config file is more reliable, since its
location inside ${WORKDIR} is more stable than the location of the config
script.</p><p style=3D"margin:0px;font-style:normal;font-variant:normal;fon=
t-size-adjust:none;font-kerning:auto;font-feature-settings:normal;font-stre=
tch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Ne=
ue&quot;"><br></p><p style=3D"margin:0px;font-style:normal;font-variant:nor=
mal;font-size-adjust:none;font-kerning:auto;font-feature-settings:normal;fo=
nt-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helve=
tica Neue&quot;">I stay open to any further suggestions.</p><p style=3D"mar=
gin:0px;font-style:normal;font-variant:normal;font-size-adjust:none;font-ke=
rning:auto;font-feature-settings:normal;font-stretch:normal;font-size:13px;=
line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=
=3D"margin:0px;font-style:normal;font-variant:normal;font-size-adjust:none;=
font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font-siz=
e:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">BR,</p><p=
 style=3D"margin:0px;font-style:normal;font-variant:normal;font-size-adjust=
:none;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Ani=
s</p></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Aug 12, 2026 at 3:50=E2=80=AFPM Antonin Godard &lt;<a hr=
ef=3D"mailto:antonin.godard@bootlin.com" target=3D"_blank">antonin.godard@b=
ootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On Wed Aug 12, 2026 at 3:06 PM CEST, Anis Bougrine via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a> wrote:<br>
&gt; Currently, signed kernel modules skip the stripping process in order<b=
r>
&gt; to preserve the file contents after signing. See commit:<br>
&gt; 4c47e5f171fa2603355e2f9183065ce8137a18c7<br>
&gt;<br>
&gt; However, the kernel install Makefile supports stripping modules before=
<br>
&gt; signing them. This allows signed modules to be stripped while preservi=
ng<br>
&gt; a valid signature.<br>
&gt;<br>
&gt; Make non-signed kernel modules follow the standard Yocto stripping flo=
w,<br>
&gt; while signed kernel modules use the kernel Makefile stripping flow.<br=
>
&gt;<br>
&gt; Fixes [YOCTO #12927]<br>
&gt;<br>
&gt; Reported-by: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">=
ross.burton@arm.com</a><br>
&gt; Signed-off-by: Anis Bougrine &lt;<a href=3D"mailto:anis.bougrine10@gma=
il.com" target=3D"_blank">anis.bougrine10@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 15 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index a82bdf7ecb..0d8d370e9d 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -453,7 +453,21 @@ kernel_do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHI=
NE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&=
#39; .config); then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=3De=
cho MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_F=
W_PATH=3D${D}${firmwaredir} modules_install<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If the module will =
be auto-signed, perform stripping before signing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &#39;^CONF=
IG_MODULE_SIG=3Dy$&#39; .config &amp;&amp; grep -q &#39;^CONFIG_MODULE_SIG_=
ALL=3Dy$&#39; .config; then<br>
<br>
Suggestion: you can use the kernel&#39;s scripts/config utility to get the =
option<br>
values:<br>
<br>
$ ./scripts/config --file ./.config --state MODULE_SIG<br>
y<br>
<br>
So that you really see the option value as the kernel sees it.<br>
<br>
Antonin<br>
</blockquote></div></div>
</div>

--000000000000feb9900658db7e94--

