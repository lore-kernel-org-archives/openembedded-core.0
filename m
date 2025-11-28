Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E535FCFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 09:33:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12425.1764322389620788447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 01:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=WSIwgn3U;
 spf=pass (domain: snapchat.com, ip: 209.85.218.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b76b5afdf04so294727166b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764322388; x=1764927188; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M6MvQeqPG2GBTFsudAVfus05uMDDWKWGMFO3SEY0AiI=;
        b=WSIwgn3UTkkobHkIcNhYdwpAYT5wXxCwTl2T9DsmUu9LYInbiOXEzsjZoDqpLUat2b
         vdY2Avfo+31cNwlQ9S9YGXh/BACM3Q+Y3GktOiIEygcQGk1qYNDDll8S5fMOP2Tjimlm
         5L1X1/oWvwAQESCFu2F3lJSw61gXlCEXU5tXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322388; x=1764927188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6MvQeqPG2GBTFsudAVfus05uMDDWKWGMFO3SEY0AiI=;
        b=iEETgeMCzmHrHel74h1xqCVbKarTWB8PL1xVtT1Sqa0UDsGjH96sWdOxieIuF94HCG
         iOKvLC8qJv7QVCGRnvdQFO30XXhCM5d/XQXyMxpnxnlUaDUMhP2VDN1XUW1qPV5JmWw3
         9w99WhEIpr/bX8vMsGm2jg0/B6wGlA7skFt53I272i1WzIwVmpB/y0H55Hx7ZtDxgMji
         g/CWVhs/RVG1/GkekBHNfVVoTHjYHt5ejpdAaDZRhUqGY5exrekIPYfFBYJ4R7yRKset
         8i0OifNGLIlU6oZymn3i5GWMBmmNj47jglm3S8kP844AznZsB2ebsXW0EFFzdVCvBi9C
         AgQA==
X-Forwarded-Encrypted: i=1; AJvYcCXfVae62F0d++K+XYwrz5ivcYSZnC0neZzGUXzRKy5xGHoVNQLHWKmb0LxlXDB8ecAMp0lf4G528MBQ6UdfO2u4sQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3HeKebMdbzF2eUpVcnwaRFkCNtsh17VMMpZa8n4RlBG5GR3jc
	p6lWkqHWFoK8qGWT3gTzUB/PGWGldq8Q8HNrPynFEAn0pUNOAKudCdTdSxA6DufkSrcF0SZoRke
	UhMdOJiURF8ePDYFAumnXkfzk50mpjOBdwXIw+Ml3Qg==
X-Gm-Gg: ASbGnctfcqD7RENz2LpAxir1c2JzIHoeC3snEQ4If23GB2h772ULvosXbw7mDAZFep3
	snaBdYDnODL+hvI92pCX8Ais8fNXJ9K7dyMiNxN5HKdgN8xlR6O2BkzM6uUptz/dFo9J/M0pONJ
	q+4V+VqptKBovaT15Lq62pcOjZieaST+4NXuGQVkAdFNEWOWnG1+BUdSexAH+NOghKsCK761w4I
	DiKpAQEGyfrmrVOsgIrVUjD3ccaCP9+c1lRBwwgH66L7CGzbbBKqgRL12XF00wWOwyMbugWcyHa
	qW3N4sjAvxqfHwu9hOgCZ7ebqR0=
X-Google-Smtp-Source: AGHT+IF5zdgvB1apHW/xp8MWKJ8VyMyRFCnBYtMO/eCPW0anSItwp5JJ4sCOaRr5ufykobMfP2D3onD6/GqWECXcLe4=
X-Received: by 2002:a17:906:fe48:b0:b76:5b73:75fb with SMTP id
 a640c23a62f3a-b7671549d71mr2958266566b.9.1764322387884; Fri, 28 Nov 2025
 01:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20251127174140.906490-1-skandigraun@gmail.com>
 <CAHUKmYaChMBkis0gG8voSntJeC+xPM0+5D2Bk=de2_QdwOXmDw@mail.gmail.com>
 <51e4d1b7-018e-4549-9be3-e66b6b1b0385@gmail.com> <CANNYZj8k_Lnj5GxchW+b9ZXeWB3DpneQ-vVGueeOu9jpcw4Ezg@mail.gmail.com>
In-Reply-To: <CANNYZj8k_Lnj5GxchW+b9ZXeWB3DpneQ-vVGueeOu9jpcw4Ezg@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 28 Nov 2025 10:32:56 +0100
X-Gm-Features: AWmQ_bnC90kCC2XX_PaEfjh6SaHf5oLW1Q1AMViTwd7jy7Vom7DDZmjAc0CpGks
Message-ID: <CAHUKmYYTxCzVtqV43erGac7nJfaf0bVO5uzQaD-_XKBQxfecmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: enable ACL only when present in DISTRO_FEATURES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003323760644a451ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 09:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226901

--0000000000003323760644a451ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Option three: both patches are correct :)"

I agree in general, but in this particular case both patches are logically
interfering with each other (one patch adds a PACKAGECONFIG option for
USE_ACL, and the other patch renames USE_ACL to WITH_ACL).
I will wait a couple days in the hope that my opkg patch gets
reviewed/merged upstream and then send a backport to oe-core.

=C3=89tienne




On Thu, Nov 27, 2025 at 7:37=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Thu, 27 Nov 2025 at 19:26, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On 11/27/25 19:22, Etienne Cordonnier wrote:
> > > Hi Gyorgy,
> > > I have sent a patch to opkg upstream to fix this issue
> > > (
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_opkg_message_175&d=3DDwIBaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2e=
pckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dskv6vITjRx1biFf=
-pISzu3mA39-5qXt1NoaexzWpNijLhnsMTj14xC_aJdOuQ9uD&s=3DtbZyO5O988bK4-b-uyVVv=
SeBbZ4hTvKf9TQGPps-bhQ&e=3D
> ).
> > > I think it would be better to either:
> > > - add my opkg patch to oe-core and not merge yours
> > > - or to keep your patch and not add mine, but at least add those line=
s
> > > as os-core patch:
> > Please feel free to send your patch - I just sent this as one possible
> > solution, but I am not particularly attached to it :)
>
> Option three: both patches are correct :) Regardless of upstream
> behaviour, adding missing packageconfigs to recipes is always
> desirable as it lowers the chance of build non-determinism and
> floating configurations.
>
> Alex
>

--0000000000003323760644a451ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;Option three: both patches are correct :)&quot;<br><=
br>I agree in general, but in this particular case both patches are logical=
ly interfering with each other (one patch adds a PACKAGECONFIG option for U=
SE_ACL, and the other patch renames USE_ACL to WITH_ACL).<br>I will wait a =
couple days in the hope that my opkg patch gets reviewed/merged upstream an=
d then send a backport to oe-core.<br><br>=C3=89tienne<div><br><br><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Nov 27, 2025 at 7:37=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, 27 Nov 2025 at 19:26, Gyorgy Sarvari via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.or=
g</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; On 11/27/25 19:22, Etienne Cordonnier wrote:<br>
&gt; &gt; Hi Gyorgy,<br>
&gt; &gt; I have sent a patch to opkg upstream to fix this issue<br>
&gt; &gt; ( <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.yoctoproject.org_g_opkg_message_175&amp;d=3DDwIBaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3Dskv6vITjRx1biFf-pISzu3mA39-5qXt1NoaexzWpNijLhnsMTj14x=
C_aJdOuQ9uD&amp;s=3DtbZyO5O988bK4-b-uyVVvSeBbZ4hTvKf9TQGPps-bhQ&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__lists.yoctoproject.org_g_opkg_message_175&amp;d=3DDwIBaQ&am=
p;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_=
Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dskv6vITjRx1biFf-pISzu3mA39-5qXt1NoaexzWp=
NijLhnsMTj14xC_aJdOuQ9uD&amp;s=3DtbZyO5O988bK4-b-uyVVvSeBbZ4hTvKf9TQGPps-bh=
Q&amp;e=3D</a>=C2=A0 ).<br>
&gt; &gt; I think it would be better to either:<br>
&gt; &gt; - add my opkg patch to oe-core and not merge yours<br>
&gt; &gt; - or to keep your patch and not add mine, but at least add those =
lines<br>
&gt; &gt; as os-core patch:<br>
&gt; Please feel free to send your patch - I just sent this as one possible=
<br>
&gt; solution, but I am not particularly attached to it :)<br>
<br>
Option three: both patches are correct :) Regardless of upstream<br>
behaviour, adding missing packageconfigs to recipes is always<br>
desirable as it lowers the chance of build non-determinism and<br>
floating configurations.<br>
<br>
Alex<br>
</blockquote></div>

--0000000000003323760644a451ef--

