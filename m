Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B9DCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 16:11:38 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1484.1760631088667903583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 09:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=khJVrgsl;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b48d8deaef9so180825466b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760631087; x=1761235887; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQizRDgFVZZdA0C0tJMWClJMoQkw8Ax9Lvtxhq1fWfw=;
        b=khJVrgslG/Bj36W9aDoGVU9upu+4FScKdFRSRm2WXGFo1+l0W9zEn8DLpu9sgpPN6S
         kjvBmb4ZFLsIv4wvwf4i/YUrLCdr+GbVlABPHSNymBqmg2miiG/Hcdia1j3TjoAUK8gn
         c2bTFU+EZ0hJZjWca+Yj10aqpd2rjtTNmN9XQm8hWEfXLNs0YuXgWUOehCL+XB0VaEDK
         vUed2LJZRaBh+zW7oLXFBkjeORftveo45g13eWWz1+GNS1ChAirsWParN03D7p19HlMd
         fu0zoCEORSm2sqFgva29n/9Du0prV5aDnw+DQQndfxaLlAXkwSjcFOP9dBeEWeIovf9+
         9TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631087; x=1761235887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQizRDgFVZZdA0C0tJMWClJMoQkw8Ax9Lvtxhq1fWfw=;
        b=vbKOM7bU55bEs9jfJF+gD+PmLrUbydNOGp1NoGyxcZSzcd0RkmMy+FStV+wCln6Iwd
         /nkk/yynULJ7WKa3k7WGAT2zWmCL65f0Z2E0wroNa9peTBbHopUuXKD8UIoV294P4YOD
         UDAqV38YYXvaZrZAID85cCUgoxyxFJcTRsxBa+yyPUdDbO+m0ZsAIwvC38IeVLelAOuN
         LGnDZcnOqE2IKmgk3GP4TZ5H88mQ7k1NUYboZABp422CpaSAiVZ3HhXTtQyZcXXRup7b
         k0bdkaZJtbnEjotWXYUAiTbuvIOxE49c+kYrd/uXUulGzWKBhCl04Ea/IEHlyEQFXBa2
         MH1w==
X-Forwarded-Encrypted: i=1; AJvYcCWIS3sQikKXR+NCIGpitwfYE/Fo4c2wfSMaFnROW5BhjJtyrsf3dyQwMSfEbgs8IjvXVjpfol+CIbUhtksowUn8Fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxE2/d2cC3k+C31jPIURIcgwOdvaMhsNy+SYIQ2tiPzp/K+WJqJ
	cQXO4DWZtPgr4i4X2DOKYdu8bJfABZCGPJQc70c+i/ZzAhXJ0d0w/lJIpF+B4ha/2GVBOx5QnH4
	9MeS/t739tT40ZmdaauBaTsfaGWm0JRifQvfl
X-Gm-Gg: ASbGnctc+ELdFKqE40Vqcng132JlNhMVe3S62MHi5yZmWEtF1I1S9KdaWPmdfPY9q8R
	gWOl9w6PVzBdQLQD/IvdT4Llbuag8Foy/3x+WefXwZIVbxPw7hOsEuwX9EbnEjyINYmJw22E1Xs
	zLb34gLRF30nrzvbDAwGRNSVP9oZFzWAJVyrF3Z3ZzWnpm0JvnQ1mt4VWoO6w6wtMLMXmR2tn+5
	AHnb3sYrC+OUrJsqGBbEXmO1RriOFOfXDxscm6sYfpNHBv1C4moOHmonD9EanM82s6hZTV3
X-Google-Smtp-Source: AGHT+IHrcQKjHBQn69VFj9uDgkF60Cjl5iebfuM4gIVUIHV2v33bTNDsL4RZyfsdRlHHKmphSZm8pT9XALSOxL8WsQ0=
X-Received: by 2002:a17:907:c05:b0:b57:78fa:db54 with SMTP id
 a640c23a62f3a-b6473e4b0f8mr54128266b.44.1760631086811; Thu, 16 Oct 2025
 09:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251010160842.28715-1-reatmon@ti.com> <20251010160842.28715-3-reatmon@ti.com>
 <DB5PR02MB10213DF753E3F85BCEA448E74EFEFA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <0b6a2828-bd9b-4225-b071-72337911715c@ti.com>
In-Reply-To: <0b6a2828-bd9b-4225-b071-72337911715c@ti.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 Oct 2025 17:11:15 +0100
X-Gm-Features: AS18NWDJiQNvwpBUKkYJCLQR3IdlKdXmwNWZKY--zoK70CWkp3BgaJEWrJG-kdU
Message-ID: <CANPvuRnnU7kVArwg_cN9A6a-Evr4LpoLN4VEiyv-ObT7Z3Ufag@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
To: reatmon@ti.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000082910f064148deb9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 16:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224976

--00000000000082910f064148deb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We have started seeing memory corruption in opkg after this change,
the libsolv.so.1 segment-fault when we are creating images in do_rootfs
tasks.

We fill a bug for that
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16010

Jose

Ryan Eatmon via lists.openembedded.org <reatmon=3D
ti.com@lists.openembedded.org> escreveu (sexta, 10/10/2025 =C3=A0(s) 19:56)=
:

>
>
> On 10/10/2025 1:55 PM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Ryan Eatmon via
> lists.openembedded.org
> >> Sent: den 10 oktober 2025 18:09
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
> >>
> >> Now that all of the current firmware has either been moved into
> >> sub-packages or removed due to licensing the base package is now
> >> empty. Going forward we would like to keep the base package empty
> >> and force the version updates to bin any new firmwares into
> >> sub-packages.
> >>
> >> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> ---
> >> v3: Split single patch into three patches, and add ALLOW_EMPTY.
> >>
> >>   .../linux-firmware/linux-firmware_20250917.bb             | 8
> +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux-firmware/
> linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/
> linux-firmware_20250917.bb
> >> index 4efdc73a45..9a12f45435 100644
> >> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> >> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> >> @@ -3311,8 +3311,14 @@ LICENSE:${PN} =3D "\
> >>       & WHENCE \
> >>   "
> >>
> >> +# The goal for this recipe is to creata bunch of breakout packages fo=
r
> the
> >
> > creata -> create a
>
> That's what I get for typing too fast and not spell checking.  Do I need
> to a v4?
>
>
> >> +# firmware so that you can choose which files to include and not have
> to pull
> >> +# them all in.  To that end, we do want any files to be part of the
> >
> > do want -> do not want
> >
> >> +# linux-firmware package.  So set it to "".  Do not change this.
> >> +FILES:${PN} =3D ""
> >> +ALLOW_EMPTY:${PN} =3D "1"
> >> +
> >>   FILES:${PN}-license +=3D "${nonarch_base_libdir}/firmware/LICEN*"
> >> -FILES:${PN} +=3D "${nonarch_base_libdir}/firmware/*"
> >>   RDEPENDS:${PN} +=3D "${PN}-license"
> >>   RDEPENDS:${PN} +=3D "${PN}-whence-license"
> >>
> >> --
> >> 2.17.1
> >
> > //Peter
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224705):
> https://lists.openembedded.org/g/openembedded-core/message/224705
> Mute This Topic: https://lists.openembedded.org/mt/115691617/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000082910f064148deb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>We have started seeing m=
emory corruption in opkg after this change,</div><div>the libsolv.so.1 segm=
ent-fault when we are creating images in do_rootfs tasks.</div><div><br></d=
iv><div>We fill a bug for that <a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D16010">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D16010</a></div><div><br></div>Jose<div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Ryan Eatmon via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;rea=
tmon=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.com@lists.openem=
bedded.org</a>&gt; escreveu (sexta, 10/10/2025 =C3=A0(s) 19:56):<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/10/2025 1:55 PM, Peter Kjellerstedt wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=
=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">open=
embedded-core@lists.openembedded.org</a>&gt; On Behalf Of Ryan Eatmon via <=
a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.openembedded.org</a><br>
&gt;&gt; Sent: den 10 oktober 2025 18:09<br>
&gt;&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; Subject: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to &quo=
t;&quot;<br>
&gt;&gt;<br>
&gt;&gt; Now that all of the current firmware has either been moved into<br=
>
&gt;&gt; sub-packages or removed due to licensing the base package is now<b=
r>
&gt;&gt; empty. Going forward we would like to keep the base package empty<=
br>
&gt;&gt; and force the version updates to bin any new firmwares into<br>
&gt;&gt; sub-packages.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" t=
arget=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v3: Split single patch into three patches, and add ALLOW_EMPTY.<br=
>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_20=
250917.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20250917.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 +++++++-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/linux-firmware/<a href=3D"http://=
linux-firmware_20250917.bb" rel=3D"noreferrer" target=3D"_blank">linux-firm=
ware_20250917.bb</a> b/meta/recipes-kernel/linux-firmware/<a href=3D"http:/=
/linux-firmware_20250917.bb" rel=3D"noreferrer" target=3D"_blank">linux-fir=
mware_20250917.bb</a><br>
&gt;&gt; index 4efdc73a45..9a12f45435 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-f=
irmware_20250917.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20=
250917.bb</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/linux-firmware/<a href=3D"http://linux-f=
irmware_20250917.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20=
250917.bb</a><br>
&gt;&gt; @@ -3311,8 +3311,14 @@ LICENSE:${PN} =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; WHENCE \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt; +# The goal for this recipe is to creata bunch of breakout package=
s for the<br>
&gt; <br>
&gt; creata -&gt; create a<br>
<br>
That&#39;s what I get for typing too fast and not spell checking.=C2=A0 Do =
I need <br>
to a v4?<br>
<br>
<br>
&gt;&gt; +# firmware so that you can choose which files to include and not =
have to pull<br>
&gt;&gt; +# them all in.=C2=A0 To that end, we do want any files to be part=
 of the<br>
&gt; <br>
&gt; do want -&gt; do not want<br>
&gt; <br>
&gt;&gt; +# linux-firmware package.=C2=A0 So set it to &quot;&quot;.=C2=A0 =
Do not change this.<br>
&gt;&gt; +FILES:${PN} =3D &quot;&quot;<br>
&gt;&gt; +ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0FILES:${PN}-license +=3D &quot;${nonarch_base_libdir}/=
firmware/LICEN*&quot;<br>
&gt;&gt; -FILES:${PN} +=3D &quot;${nonarch_base_libdir}/firmware/*&quot;<br=
>
&gt;&gt;=C2=A0 =C2=A0RDEPENDS:${PN} +=3D &quot;${PN}-license&quot;<br>
&gt;&gt;=C2=A0 =C2=A0RDEPENDS:${PN} +=3D &quot;${PN}-whence-license&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt; <br>
&gt; //Peter<br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224705): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224705" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224705</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115691617/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115691617/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div>

--00000000000082910f064148deb9--

