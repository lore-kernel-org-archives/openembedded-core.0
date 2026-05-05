Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E57FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:22:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34240.1777968928700733929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=T8LBqz9k;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.214.182, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba4efedbeaso4319655ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 01:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777968928; cv=none;
        d=google.com; s=arc-20240605;
        b=EYIllvXM0pk6ejPXgqEhq4xIp6IN9nYklHo/qrNSRF7dPhq6xB4SE81omC6wfD3TEC
         jleQ1GY0NuOjFsHq/OLiU9Y8s/Cbs4yEqhnP68L1Uu4bHsfVOwvlauOCZs8a1BXDDd57
         3rGD7RQaeFqIfxjy1q0rhbWC58sbB68YR4LZEB+G7z+WJoBoVJNkJz5ebLhy/9shffXp
         AXBI+uFWYgivXid5B7DaRuzPL0KTgAS9hB3y+/XsaThjRvE9x+tdVOTVoAlpr7SE/d7O
         MB/lO65QdlvGqeQT/J+OstKUY+g8GHIJXW4graH7YjFo9BX/ZcAXZfe77oIYIgpnZDqv
         fEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6/fRfTBiRxnNlO148ADktZBQ4IKV2KCLuw1sIt6uEK0=;
        fh=BaatVCw1GBbPkBltJ8woK5kz6hmyDOw5YFvBD6e0bFE=;
        b=RiKODG+Aze20B3oXZoc4UdeQJTf15QuSnO+th/IYSOn2XY+Y9moap/UAVj7e9s4b0k
         eDNYNjw9xDHAVh+u4U9BhgMvVIKreY7GuTogVeyp3Bq8tIY7XF+liCD9KDY+LlVjkJP7
         Efq2ioYVFp6Cj20LmgouzW/hgbr1PCUcFqGQU/kEZziEnmCHfDXN0NjoONcGwXPC1deE
         hA2GcpoN9jRCNniwYTZcmN82UhWeCQt++LiENDSoSOEncUPhIL5EqtdLFImIiJjkWr2D
         vmgFfvneqnGrNa/nvsfkNkxUCoWf9e2fyLweiTKF9lXXn5YChjI5Kgaw36TUQecdLzWd
         i5zQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1777968928; x=1778573728; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6/fRfTBiRxnNlO148ADktZBQ4IKV2KCLuw1sIt6uEK0=;
        b=T8LBqz9k7XRoTQoGe7QjiF3OSu7rpJLQdBKfLhXOOXR43/aJEzwUXdjJYHi2BqBY++
         Qfu4jrq56HESaYWFYiYN+ycs5kbWVl8p7Oj0z1DZQyibwOj1Go8xRAvX/PduloQ14+39
         LwlIz/LWgsDgTeTn+FMHmuYGLPJk+h30JQajA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777968928; x=1778573728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/fRfTBiRxnNlO148ADktZBQ4IKV2KCLuw1sIt6uEK0=;
        b=ao9KIy2dsaoFE5Szm3Y9NuILZXmdIFFulHEHbWDmWlADoAuRo6rO/e0smIr+4Vs85S
         rqzOEfKCEeH0SLtlxp1rs6r9qqUUmBzueLGBxCxeB656xvnEPGjP4TNg/W2gB1yD/SML
         fiNUl2w2/rpBJZ9Fx6KG04rQrK4D4hof+O6Grv9UD9l4X6An9XDyyHFD2pljzeUaI5Jd
         iN0lMF9KdAZSiUHDmIN5r7aMqMNwS+0ljgXrGwVfkwpkFqIg5Hui5vDnOB8Zu0oH+LtT
         gYeYtmTTpJzqV1A91qLZPh/u1oQ19++rKN5PRheyzfMJIg/Gc/I1Y1bAP5tEDv7EWFMM
         nnEw==
X-Gm-Message-State: AOJu0YxoA/OvyYwLZstqmGOFvXaO2FA/tWvSg9Fau3tdk8L+yJSvZiwv
	t1xz7uka9yCRcuUW0SRFfHbxmIB2B2fXZPoxt9CtzERHhODdn4XJHAk4eGk6je0rOduYne4kdWs
	n3VAJL+Sl3V3H0++46i1xIXldNBGeBsUj1pqbHMTCV6CTZhr6jbaWK/I=
X-Gm-Gg: AeBDies/uxvKLmheabzTWx0sKlwLjjtaqt0fhVcvvn7Azn49/9A0YB8Q4k7eQdUpcKy
	PiYeo+I5TyAlOVTUtxv9re2/Y9TWIMDNrHTppjY5G0pNO2/76/91DvXWTgNyguQOhsxiSZCr9mK
	wPceoC/a+5ubINkHaJ8Kp6/aoGSn7xPHxFCCQ+Gvr4UdtS62G15alGexeG0v5/Wp254WIniytmv
	h6AM4Hs1HUyX2kDMm6x6FnDl3Le9LojoK7F5qMI7cSvDQvLP86tL/JC6yO8LM/anoUCxjNo06z0
	+yVifHdxF+mOJq9urVXe02brpi61+8sdML6U4gIzKmNfj0/sAZb2lCDl6Xb/xKQpH63Xas1gG7g
	leqwKGw==
X-Received: by 2002:a05:690c:6603:b0:7ba:f690:70be with SMTP id
 00721157ae682-7bd76f7e849mr127480217b3.7.1777968531790; Tue, 05 May 2026
 01:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260430175308.868993-1-dario.binacchi@amarulasolutions.com> <CANNYZj97SF0G6X0dBg4C7PnrW6QFCXBpq6e4XJCkWzYECK7RhA@mail.gmail.com>
In-Reply-To: <CANNYZj97SF0G6X0dBg4C7PnrW6QFCXBpq6e4XJCkWzYECK7RhA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 5 May 2026 10:08:40 +0200
X-Gm-Features: AVHnY4LgH6ZmG5c0zctkPpBukHzkyS_F1PdzJPLRh8Ofsl2pxK-PdTZkrYwLdak
Message-ID: <CABGWkvqz6E5FbweG9u=RAvMddWjc=qj-ZQa2Fn8=U=4tzdqVMw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] libfwumdata: add new recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: multipart/alternative; boundary="000000000000c26cd306510d8e4d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236473

--000000000000c26cd306510d8e4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Fri, May 1, 2026 at 3:16=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Fri, 1 May 2026 at 00:18, Dario Binacchi via lists.openembedded.org
> <dario.binacchi=3Damarulasolutions.com@lists.openembedded.org> wrote:
> > libfwumdata is a lightweight C library for parsing, validating (CRC32),
> > and manipulating Firmware Update (FWU) metadata, allowing tools such as
> > RAUC or SWUpdate, and in general any application, to modify the boot
> > bank selection.
>
> A library recipe without any consumers doesn't make sense.


I have already submitted a patch [1] to the SWUpdate mailing list that
integrates libfwumdata as a handler, which is its first primary use-case.
I am also currently using it in a custom SWUpdate implementation for a
client project.


> The patch
> should include enabling support for it in other recipes. There should
> also be an explanation of why this functionality is common and
> important enough that the recipe should be in oe-core; until now no
> one has asked for it.
>
>
The FWU (Firmware Update) metadata is not a custom vendor format, but
a standardized binary structure [2] defined by the Arm specification (part
of Arm SystemReady / PSA). It is already implemented and supported in
U-Boot.
As the adoption of this standard grows for managing A/B partition switching=
,
providing a standalone, lightweight user-space library in oe-core is the
cleanest approach.


> > Changes v1 -> v2:
> > - Drop S =3D "${WORKDIR}/git"
>
> This begs the question: how was the recipe tested before submission?
>

The development and testing of this recipe were done against the scarthgap
release. On that specific branch, the S =3D "${WORKDIR}/git" assignment did
not trigger the immediate build error that is enforced on master.

[1] https://groups.google.com/g/swupdate/c/kYr2Hy-f3us
[2] https://developer.arm.com/documentation/den0118/latest

Thanks and regards,

Dario


> The above line would result in an immediate error on master and some
> earlier releases.
>
> Alex
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

--000000000000c26cd306510d8e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alexander,</div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, May 1, 2026 at 3:16=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Fri, 1 May 2026 at 00:18, Da=
rio Binacchi via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a><br>
&lt;dario.binacchi=3D<a href=3D"mailto:amarulasolutions.com@lists.openembed=
ded.org" target=3D"_blank">amarulasolutions.com@lists.openembedded.org</a>&=
gt; wrote:<br>
&gt; libfwumdata is a lightweight C library for parsing, validating (CRC32)=
,<br>
&gt; and manipulating Firmware Update (FWU) metadata, allowing tools such a=
s<br>
&gt; RAUC or SWUpdate, and in general any application, to modify the boot<b=
r>
&gt; bank selection.<br>
<br>
A library recipe without any consumers doesn&#39;t make sense. </blockquote=
><div><br></div>I have already submitted a patch [1] to the SWUpdate mailin=
g list that<br>integrates libfwumdata as a handler, which is its first prim=
ary use-case.<br>I am also currently using it in a custom SWUpdate implemen=
tation for a<br>client project.<br><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">The patch<br>
should include enabling support for it in other recipes. There should<br>
also be an explanation of why this functionality is common and<br>
important enough that the recipe should be in oe-core; until now no<br>
one has asked for it.<br>
<br></blockquote><br>The FWU (Firmware Update) metadata is not a custom ven=
dor format, but<br>a standardized binary structure [2] defined by the Arm s=
pecification (part<br>of Arm SystemReady / PSA). It is already implemented =
and supported in U-Boot.<br>As the adoption of this standard grows for mana=
ging A/B partition switching,<br>providing a standalone, lightweight user-s=
pace library in oe-core is the<br>cleanest approach. <br><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Changes v1 -&gt; v2:<br>
&gt; - Drop S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
This begs the question: how was the recipe tested before submission?<br>
</blockquote><div><br>The development and testing of this recipe were done =
against the scarthgap<br>release. On that specific branch, the S =3D &quot;=
${WORKDIR}/git&quot; assignment did<br>not trigger the immediate build erro=
r that is enforced on master.<br><br>[1] <a href=3D"https://groups.google.c=
om/g/swupdate/c/kYr2Hy-f3us">https://groups.google.com/g/swupdate/c/kYr2Hy-=
f3us</a><br>[2] <a href=3D"https://developer.arm.com/documentation/den0118/=
latest">https://developer.arm.com/documentation/den0118/latest</a><br>=C2=
=A0</div><div>Thanks and regards,</div><div><br></div><div>Dario<br>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">The above line would=
 result in an immediate error on master and some<br>
earlier releases.<br>
<br>
Alex<br>
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

--000000000000c26cd306510d8e4d--

