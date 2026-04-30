Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC86FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:54:13 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16772.1777543431841410621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=V+a8zxMS;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.178, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79885f4a8ffso7449247b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 03:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777543431; cv=none;
        d=google.com; s=arc-20240605;
        b=K3033Y5YEemC9ZebkmPHn+sNW4mGpDMdm77GWY04c0gGvbrABfi+eP1X0jeWGnu9IW
         Hoc5IrVs2D6ZmBcgwxTJ7mvyT9y54xqFS3g9Wb4peeU0LEUItbGXLtZjuosqtcIxw4zw
         asjAUa+b/SVptqJQXswNEt2potSc9lbBn9FoMCsjCZM28EbaXEO34/uNruwLn0rY5uv1
         hI911l2yncOHJquI7+Bw4EjwWr+OJmheIXDwN+Cs6/NewxY1wQ1usU0NzK7EMUVRvpjQ
         CwN1oco6Ke4OwMJjdJN//QCuiZSxbeRqXPCAG4wabrgYh8tRsRNvKc9SwLx+ra9ZfG3e
         QjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BHO+XJNQ2kaaeXC7rpFwchsOstUo+F7AUqjyPSqqXP4=;
        fh=NJGkk3nwIyxj9vqYo3vGPKlcGdvWele04a2wvsPG48M=;
        b=AtSf7eMYgNQInA4Viziy8tooHhxUTS/sTAGZs/Ct/sIjE57m92jXRV3YvkKgOj+YOu
         o9OfHmEYD3HDWBvfBdBpViGG7OAHDZZXyXLooGxkFalsQmqzdezYTPDEouAWIMltqIDn
         J3v4+8vtlkbRWHBmYkkrdTKX36qWCGhb/ZQwkZN+NTWyR9pSWd1LcONjLj+99QaWcB6Z
         39w2zETjff6aVOUxOY0SL85LlQtrSyJ92GMPSKjwM8Lso1Sf9+wlg7ZyXYIRmTHLpm7X
         jjhHjwxv4XbOOnqfvpnWNtZFar2DM/3DwEWgp/SjXXlhA6gnhouqRxQIA/T7qnTmknru
         xmeA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777543431; x=1778148231; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHO+XJNQ2kaaeXC7rpFwchsOstUo+F7AUqjyPSqqXP4=;
        b=V+a8zxMS+UYLkm3PftyTqBNEpZIqPhcRbUZQmtQhlOmluJKoqb1ojRnF7lXmMTkM43
         yYeqdGUebzN5wm+cjPTH0Rbtcq8bk6xIUu9OlnZnRtOAXkqr52AVsbT2ohX844S/O7M1
         2gTUJnJPTEgjKtAjezYi1exBuyLNdcM0xbI1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543431; x=1778148231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHO+XJNQ2kaaeXC7rpFwchsOstUo+F7AUqjyPSqqXP4=;
        b=YX3/Ymk5YrQpSKK6AG1l0v+R+aQlqDP3HpEZR8vDBON2/8WhKnPtrolOn5lpSfQfWH
         Sud7rKbmdYDTBiJjYeRD++doI0BDmz2Z1YHhgZDlreiom0x+0vbhs2osyAcJvgNUVORi
         xGtF4N9jrWxsXO924Tny6ZGIQ1efFrM78d+1IZ9wElni4MOcF9TgbvIHEomGQPcmbN36
         1+YQhOB+sUvg0gjLmg88/Ir1Y6N5jYV4BNf3kZn8LOibVZCaYYC9jyK7kFwzB5Qvkas2
         ZfnMt7C0bCEOSSDN+Jtwm8SKzL2tV1FwFUwUBNgE90Bu4+mI9F5xQFszWe0EhDbpsnVZ
         C1Xw==
X-Gm-Message-State: AOJu0YzFLUl5nKhywGqwQIKw+Cyviykh+yQDxvRAPKR6ya2/vZjJkzpw
	ZqufnVcAv1iXZjYsgPaYlEieVYwbctpV/qC0Rs8mMdwAzVGXuBN3M0pZLgwATmfHcRvqOzGX9Zv
	6mIvXsElMwfzm1gWnHzz93vFs5PnRbImZ7/xtJQ+46HAyC6F8LoKB
X-Gm-Gg: AeBDiesGi/FNt8//GRv3d4r2pcRQqHH93lCOu68H7zuNchlVKa1IGD7aWHq1c3IiK9p
	gbL3QHN7Ac9tNvN7O/Dze9AOnoyomZnQIdpbIz0nYSzGCwUSA9qazsBHayT3fhBcryM2Fuve8mm
	2Izc67u/QDDmSY/Qxqyg3c2Q98uujFVSM1jpUOO7tWcSLhlXqRckT+hyOXqDHFfvfoodtUY8yOw
	fn5Aar90mhSvkm1vgeh6Iz1d4S/Ey2gzqtkwiO1Kr/gywrWWs5URU4SvHDNdjxaDzBChPfhQDOn
	Nc10eUvmuoHlVJAPlja5iH+1ItiJxWH4W/6ClMuU1Du51uCT
X-Received: by 2002:a05:690c:4992:b0:7ba:eefe:9f9c with SMTP id
 00721157ae682-7bd548a78demr18199487b3.23.1777543430867; Thu, 30 Apr 2026
 03:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com> <DI6B8Z1L4R7N.FUR3IC2PYJWU@bootlin.com>
In-Reply-To: <DI6B8Z1L4R7N.FUR3IC2PYJWU@bootlin.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 30 Apr 2026 12:03:38 +0200
X-Gm-Features: AVHnY4L7Tk_MzlBCw4WuvrQPMuTEBdAWjY7_7YETVhc_0uObbNIGED-74QMK0gA
Message-ID: <CABGWkvqCTihBJf=QEqu+Ka_TuQcZkB_GpTvh+A4Gge5xHWE+1w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libfwumdata: add new recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: multipart/alternative; boundary="000000000000c51c520650aa9410"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236165

--000000000000c51c520650aa9410
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

On Thu, Apr 30, 2026 at 9:28=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Apr 29, 2026 at 4:51 PM CEST, Dario Binacchi via
> lists.openembedded.org wrote:
> > libfwumdata is a lightweight C library for parsing, validating (CRC32),
> > and manipulating Firmware Update (FWU) metadata, allowing tools such as
> > RAUC or SWUpdate, and in general any application, to modify the boot
> > bank selection.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
>
> Hi Dario,
>
> Thanks for your patch.
>
> In addition to Alex comment, I note build is failing on the autobuilder:
>
> ERROR: libfwumdata-0.1.0-r0 do_unpack: Recipes that set S =3D
> "${WORKDIR}/git" or S =3D "${UNPACKDIR}/git" should remove that assignmen=
t,
> as S set by bitbake.conf in oe-core now works.
>

I will drop.

Thanks and regards,
Dario

>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3709
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
*Dario Binacchi*
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000c51c520650aa9410
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mathieu,</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Apr 30, 2026 at 9:28=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto=
:mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
 Apr 29, 2026 at 4:51 PM CEST, Dario Binacchi via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a> wrote:<br>
&gt; libfwumdata is a lightweight C library for parsing, validating (CRC32)=
,<br>
&gt; and manipulating Firmware Update (FWU) metadata, allowing tools such a=
s<br>
&gt; RAUC or SWUpdate, and in general any application, to modify the boot<b=
r>
&gt; bank selection.<br>
&gt;<br>
&gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@ama=
rulasolutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a=
>&gt;<br>
&gt; ---<br>
<br>
Hi Dario,<br>
<br>
Thanks for your patch.<br>
<br>
In addition to Alex comment, I note build is failing on the autobuilder:<br=
>
<br>
ERROR: libfwumdata-0.1.0-r0 do_unpack: Recipes that set S =3D &quot;${WORKD=
IR}/git&quot; or S =3D &quot;${UNPACKDIR}/git&quot; should remove that assi=
gnment, as S set by bitbake.conf in oe-core now works.<br></blockquote><div=
><br>I will drop.<br><br>Thanks and regards,</div><div>Dario=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/3709" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/3709</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font color=3D"#888888"><font color=3D"#000000" =
face=3D"Times New Roman"><span style=3D"font-size:14px"><b>Dario Binacchi</=
b></span></font><br style=3D"color:rgb(0,0,0);font-family:&quot;Times New R=
oman&quot;;font-size:medium"><span style=3D"color:rgb(0,0,0);font-family:&q=
uot;Times New Roman&quot;;font-size:12px">Senior Embedded Software Engineer=
<br></span></font><span style=3D"color:rgb(0,0,0);font-family:&quot;Times N=
ew Roman&quot;;font-size:12px">M. +39 328 0625246</span><font color=3D"#888=
888"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot=
;;font-size:12px"><br><a href=3D"mailto:dario.binacchi@amarulasolutions.com=
" style=3D"color:rgb(17,85,204)" target=3D"_blank">dario.binacchi@amarulaso=
lutions.com</a></span><br style=3D"color:rgb(0,0,0);font-family:&quot;Times=
 New Roman&quot;;font-size:medium"><span style=3D"font-family:&quot;Times N=
ew Roman&quot;;font-size:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br style=3D"color:rgb(0,0,0)=
;font-family:&quot;Times New Roman&quot;;font-size:medium"><span style=3D"c=
olor:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:12px"><sp=
an style=3D"font-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Feli=
ce Cavallotti 25D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasol=
utions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">info@amarulaso=
lutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" style=3D"co=
lor:rgb(17,85,204)" target=3D"_blank">www.amarulasolutions.com</a></span></=
font></div></div></div>

--000000000000c51c520650aa9410--

