Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B9ACAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:05:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.16111.1758287139939143021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dxPG74Jq;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-330b4739538so319902a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758287139; x=1758891939; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7preoY1ct7eEdVQ45VakDevYdtRvVFUNZOxhFltcPYk=;
        b=dxPG74JqcXbbRKEoQMdU4YhHldiJKyF9azNOcY30PAsN9rxaPbGyjBqnTcQntOSd8r
         LEqhi7ZM19EaAchLtGyh7of7IemowbsZ14P0VOJ5Mrg/auoKXts2y4oUYwRw59SE6NYH
         9ASBzOJDoQKUjRcC/B9lofijufTJrqiE0sQq6+dw/fVZC4xHVlhlPqhId96N309HGbxI
         Cp4BXOCFNWUoMqkEu5IlrmaTPLYa1xEl6QCZuP2WR0n2Lv6/UZE0R78unhYTz8/shvDt
         +lcyfnO8Y6FYbQf757oWI51rWISq+sMBskZBW/JgPG6Wieh4Tv6lE+mh634gmbz3Etzx
         xNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758287139; x=1758891939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7preoY1ct7eEdVQ45VakDevYdtRvVFUNZOxhFltcPYk=;
        b=EYQ+wSplnjA1TlLMOnPKktBeRnbjBEXXSfgxYXjw/Rdbda7Ph2ITEWJicl/E9rgPju
         e3CCVUZ/6q6qjGBHtQm5C00mMpdbQ0NlFh+5TzFFZKmNyypTYT5WwO67eiut4TUav+Sg
         sEvmCX6YnEZIwEkbHL7299axyaiI0fBG13xCEePZSWQFhda0QRPvZcODENDfFFKExfgs
         WPuO4NhHEEy1D2RHmcIAwLHHyeAJqrQypAJgZLqv6DTSkZNKVZoEvniDa6Nx/ygrkrr2
         y7vHqbH7xXRO/XCFgK57pRQypnwG2wC10d6YHQTxLPA3KCXiRykkl+x+sY2JjjpsSalx
         CMiQ==
X-Gm-Message-State: AOJu0YyLhgZXoaEMxI2ad7swSAGsHdFi4+ITRuOk/R/lCH8z8ko16iYu
	lsTYOH/AQlUS7dOWVrKxzvVOdCKODOf4cl0myiFPUPnYzfmbeg6T1cSXuj0iaKYaZtfePYsN1qg
	jG+JkT0Rj8wZ6bv3s3Ph6v+r/uI7Ichk=
X-Gm-Gg: ASbGncvEA6sYrJlqzLm4+srhfpfgemQjA1MZErElkGf4EQImWHkPFLoSQI0/S2eFACW
	x8uKibCJGOAeLFLwaiO4xThwrUbLSDmShArsZhaYRRXcTtoGbD5G2eZZfwutY9+td/M9H8PUwkz
	3a7wNxGMJv4WP5be6UJDynm7u4HvFekD8AylONmFRELYMIapj6zMvgZtQoK2MN+pMZkXh3esrgA
	tUEkJO/1EN8//A3OILvYLLk+RwJJaafFb8zBVUBfXZdPCHqvJk=
X-Google-Smtp-Source: AGHT+IGHmMtvU4JqrDqfTUtQPMsTEjqxofeFzRC16hVtML/n9CfUKhYEv2r52AWVnrCTmwKEdsP83gCeNusMV6hWaCg=
X-Received: by 2002:a17:90a:d60c:b0:32e:8c1e:1301 with SMTP id
 98e67ed59e1d1-3309838dec4mr4012057a91.34.1758287138979; Fri, 19 Sep 2025
 06:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1866AF8ECC88AFA1.22280@lists.openembedded.org> <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
 <AS1PR10MB5697EA7DF788318E41839751FD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697EA7DF788318E41839751FD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Sep 2025 09:05:26 -0400
X-Gm-Features: AS18NWAcD8Yt9cXfZRWfck61yZPaYJr7rS2FIQIraEx06_Qohc5sCA3xRa1duRc
Message-ID: <CADkTA4OFS8WJmggeqTRMwQbifmanQxGxtJos8FEzr_KzMev=aA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000550132063f272076"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223746

--000000000000550132063f272076
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 8:55=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> (damn outlook and html prevents me to properly quote this below, sorry)
>

No worries. It's the message not the format that matters :)



>
> The commit description is not ideal and we struggle to fully understand
> why it was not failing before.
>
>
>
> Maybe it was not being built and new config changes trigger it now?
>

When I was tracking it down many years ago (it could almost be 10 years
now),
there were some situations where the .o was built before it was needed or
another
dependency triggered it to be built (a non-race way to get it in place), so
the linking
worked. We may have just been hitting good timing up until now.


>
> This also seems to be a missed line in
> 214c0eea43b2ea66bcd6467ea57e47ce8874191b from last year.
>
> As it says "This commit prepares for supporting the building of external
> modules..." maybe some new commits built on this feature and this broke a=
t
> that time because not all places were properly prepared.
>
>
>
> I=E2=80=99ll probably wait until it gets merged to kernel master before s=
ubmitting
> to linux-yocto.
>

That's up to you, or I can always go track it down on the upstream mailing
list.
Whatever is easiest on your end.

I don't mind taking in-progress patches, as my workflow can handle it
without
much fuss.

Bruce


>
>
> Peter
>
>
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Friday, September 19, 2025 14:49
> *To:* bruce.ashfield@gmail.com
> *Cc:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> openembedded-core@lists.openembedded.org; Sverdlin, Alexander (SI B PRO
> TI EAC CCP) <alexander.sverdlin@siemens.com>; Freihofer, Adrian (SI B PRO
> TI EAC CCP) <adrian.freihofer@siemens.com>;
> richard.purdie@linuxfoundation.org
> *Subject:* Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference
> to 6.16
>
>
>
>
>
>
>
> On Fri, Sep 19, 2025 at 8:42=E2=80=AFAM Bruce Ashfield via lists.openembe=
dded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>
>
>
>
> On Fri, Sep 19, 2025 at 8:35=E2=80=AFAM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
> Hello Bruce,
>
> This upgrade broke build of external kernel modules for powerpc.
> Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.
>
> We have prepared a patch for upstream kernel.
>
> https://lore.kernel.org/all/20250919121417.1601020-1-alexander.sverdlin@s=
iemens.com/
> But I guess it will take lot of time to get picked there, then backported
> to 6.16, tagged and finally this tag picked by yocto.
> Is there a process to pick this patch already now to keep the pipeline
> green?
>
>
>
> Yes, if you submit it to the linux-yocto mailing list (you need to
> subscribe), I can
>
> merge it directly to linux-yocto and send a SRCREV bump to the list.
>
>
>
> I'll carry the patch to any newer kernel that I do, until it merges
> upstream and
>
> I'll automatically drop it at that point.
>
>
>
> What is interesting is that we had a crtres patch for powerpc for many
> years,
>
> but "recently" (2024) dropped it:
>
>
>
>
> https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-6.12&id=
=3D3cf758061025b9284ddfb1259f79860666737302
>
>
>
> And that dropped patch should have been part of several reference kernels
> since
>
> that commit. Just so I know, this is something that has been passing on a=
ll
>
> reference kernels and just broke on 6.16 ?
>
>
>
> Something must have changed upstream to bring the breakage back! Your
>
> fix is simpler than the old one we had, so that's progress :)
>
>
>
> Bruce
>
>
>
>
>
>
>
> Bruce
>
>
>
>
>
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield via
> > lists.openembedded.org
> > Sent: Friday, September 5, 2025 18:09
> > To: richard.purdie@linuxfoundation.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to
> 6.16
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Bumping the reference kernel to 6.16. We keep the alt distro
> > on 6.12 for better coverage.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta-poky/conf/distro/poky-tiny.conf | 2 +-
> >  meta-poky/conf/distro/poky.conf      | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-poky/conf/distro/poky-tiny.conf
> b/meta-poky/conf/distro/poky-
> > tiny.conf
> > index 81153b3b36..84baef347c 100644
> > --- a/meta-poky/conf/distro/poky-tiny.conf
> > +++ b/meta-poky/conf/distro/poky-tiny.conf
> > @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D "-Os"
> >  # Distro config is evaluated after the machine config, so we have to
> explicitly
> >  # set the kernel provider to override a machine config.
> >  PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-tiny"
> > -PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.12%"
> > +PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.16%"
> >
> >  # We can use packagegroup-core-boot, but in the future we may need a n=
ew
> > packagegroup-core-tiny
> >  #POKY_DEFAULT_EXTRA_RDEPENDS +=3D "packagegroup-core-boot"
> > diff --git a/meta-poky/conf/distro/poky.conf
> b/meta-poky/conf/distro/poky.conf
> > index b12df2be70..d86630b153 100644
> > --- a/meta-poky/conf/distro/poky.conf
> > +++ b/meta-poky/conf/distro/poky.conf
> > @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-
> > module-af-packet"
> >
> >  DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}
> > ${POKY_DEFAULT_DISTRO_FEATURES}"
> >
> > -PREFERRED_VERSION_linux-yocto ?=3D "6.12%"
> > -PREFERRED_VERSION_linux-yocto-rt ?=3D "6.12%"
> > +PREFERRED_VERSION_linux-yocto ?=3D "6.16%"
> > +PREFERRED_VERSION_linux-yocto-rt ?=3D "6.16%"
> >
> >  SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-
> > ${TUNE_PKGARCH}-${MACHINE}"
> >  SDKPATHINSTALL =3D "/opt/${DISTRO}/${SDK_VERSION}"
> > --
> > 2.39.2
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223742):
> https://lists.openembedded.org/g/openembedded-core/message/223742
> Mute This Topic: https://lists.openembedded.org/mt/115084892/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000550132063f272076
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 19, 2025 at 8:55=
=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Pet=
er.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div class=3D"msg7513490027274286378">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_7513490027274286378WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">(damn outlook and html prevents me to properly quote this below, so=
rry)<br></span></p></div></div></div></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">No worries. It&#39;s the =
message not the format that matters :)</div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg751349002727=
4286378"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div clas=
s=3D"m_7513490027274286378WordSection1"><p class=3D"MsoNormal"><span style=
=3D"font-size:10pt;font-family:Arial,sans-serif">
<br>
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">The commit description is not ideal and we struggle to fully unders=
tand why it was not failing before.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Maybe it was not being built and new config changes trigger it now?=
</span></p></div></div></div></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">When I was tracking it down many =
years ago (it could almost be 10 years now),</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">there were some situations where the .o was b=
uilt before it was needed or another</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">dependency triggered it to be built (a non-race way t=
o get it in place), so the linking</div><div class=3D"gmail_default" style=
=3D"font-size:small">worked. We may have just been hitting good timing up u=
ntil now.</div></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div class=3D"msg7513490027274286378"><div lang=3D"EN-US" style=
=3D"overflow-wrap: break-word;"><div class=3D"m_7513490027274286378WordSect=
ion1"><p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Aria=
l,sans-serif"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"m_7513490027274286378MsoPlainText">This also seems to be a miss=
ed line in 214c0eea43b2ea66bcd6467ea57e47ce8874191b from last year.<u></u><=
u></u></p>
<p class=3D"m_7513490027274286378MsoPlainText">As it says &quot;This commit=
 prepares for supporting the building of external modules...&quot; maybe so=
me new commits built on this feature and this broke at that time because no=
t all places were properly prepared.<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">I=E2=80=99ll probably wait until it gets merged to kernel master be=
fore submitting to linux-yocto.</span></p></div></div></div></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Th=
at&#39;s up to you, or I can always go track it down on the upstream mailin=
g list.</div><div class=3D"gmail_default" style=3D"font-size:small">Whateve=
r is easiest on your end.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>I don&#39;t mind taking in-progress patches, as my workflow can handle it =
without</div><div class=3D"gmail_default" style=3D"font-size:small">much fu=
ss.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg7513490027274286378"><div lang=3D"EN-US" style=3D"overflow-wrap: bre=
ak-word;"><div class=3D"m_7513490027274286378WordSection1"><p class=3D"MsoN=
ormal"><span style=3D"font-size:10pt;font-family:Arial,sans-serif"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0in 0in 0in 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;
<br>
<b>Sent:</b> Friday, September 19, 2025 14:49<br>
<b>To:</b> <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">br=
uce.ashfield@gmail.com</a><br>
<b>Cc:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;; <a href=3D=
"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openemb=
edded-core@lists.openembedded.org</a>; Sverdlin, Alexander (SI B PRO TI EAC=
 CCP) &lt;<a href=3D"mailto:alexander.sverdlin@siemens.com" target=3D"_blan=
k">alexander.sverdlin@siemens.com</a>&gt;; Freihofer, Adrian (SI B PRO TI E=
AC CCP) &lt;<a href=3D"mailto:adrian.freihofer@siemens.com" target=3D"_blan=
k">adrian.freihofer@siemens.com</a>&gt;;
 <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">ri=
chard.purdie@linuxfoundation.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH 1/5] poky: bump default kernel referen=
ce to 6.16<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Sep 19, 2025 at 8:42<span style=3D"font-fami=
ly:Arial,sans-serif">=E2=80=AF</span>AM Bruce Ashfield via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Sep 19, 2025 at 8:35<span style=3D"font-fami=
ly:Arial,sans-serif">=E2=80=AF</span>AM Marko, Peter &lt;<a href=3D"mailto:=
Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt; =
wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal">Hello Bruce,<br>
<br>
This upgrade broke build of external kernel modules for powerpc.<br>
Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.<br>
<br>
We have prepared a patch for upstream kernel.<br>
<a href=3D"https://lore.kernel.org/all/20250919121417.1601020-1-alexander.s=
verdlin@siemens.com/" target=3D"_blank">https://lore.kernel.org/all/2025091=
9121417.1601020-1-alexander.sverdlin@siemens.com/</a><br>
But I guess it will take lot of time to get picked there, then backported t=
o 6.16, tagged and finally this tag picked by yocto.<br>
Is there a process to pick this patch already now to keep the pipeline gree=
n?<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Yes, if you submit=C2=A0it to the linux-yocto mailin=
g list (you need to subscribe), I can<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">merge it directly to linux-yocto and send a SRCREV b=
ump to the list.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;ll carry the patch to any newer kernel that I =
do, until it merges upstream and<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;ll automatically drop it at that point.<u></u>=
<u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">What is interesting is that we had a crtres=C2=A0pat=
ch for powerpc for many years,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">but &quot;recently&quot; (2024) dropped it:<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://git.yoctoproject.org/yocto-kernel=
-cache/commit/?h=3Dyocto-6.12&amp;id=3D3cf758061025b9284ddfb1259f7986066673=
7302" target=3D"_blank">https://git.yoctoproject.org/yocto-kernel-cache/com=
mit/?h=3Dyocto-6.12&amp;id=3D3cf758061025b9284ddfb1259f79860666737302</a><u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">And that dropped patch should have been part of seve=
ral reference kernels since=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">that commit. Just so I know, this is something that =
has been passing on all<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">reference kernels and just broke on 6.16 ?<u></u><u>=
</u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Something must have changed upstream to bring the br=
eakage back! Your<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">fix is simpler than the old one we had, so that&#39;=
s progress :)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bruce<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.openembedded.org</a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Bruce Ashfield via<br>
&gt; <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; Sent: Friday, September 5, 2025 18:09<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to =
6.16<br>
&gt; <br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Bumping the reference kernel to 6.16. We keep the alt distro<br>
&gt; on 6.12 for better coverage.<br>
&gt; <br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-poky/conf/distro/poky-tiny.conf | 2 +-<br>
&gt;=C2=A0 meta-poky/conf/distro/poky.conf=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/dis=
tro/poky-<br>
&gt; tiny.conf<br>
&gt; index 81153b3b36..84baef347c 100644<br>
&gt; --- a/meta-poky/conf/distro/poky-tiny.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky-tiny.conf<br>
&gt; @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D &quot;-Os&quot;<br>
&gt;=C2=A0 # Distro config is evaluated after the machine config, so we hav=
e to explicitly<br>
&gt;=C2=A0 # set the kernel provider to override a machine config.<br>
&gt;=C2=A0 PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-yocto-tiny&quo=
t;<br>
&gt; -PREFERRED_VERSION_linux-yocto-tiny ?=3D &quot;6.12%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-tiny ?=3D &quot;6.16%&quot;<br>
&gt; <br>
&gt;=C2=A0 # We can use packagegroup-core-boot, but in the future we may ne=
ed a new<br>
&gt; packagegroup-core-tiny<br>
&gt;=C2=A0 #POKY_DEFAULT_EXTRA_RDEPENDS +=3D &quot;packagegroup-core-boot&q=
uot;<br>
&gt; diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/p=
oky.conf<br>
&gt; index b12df2be70..d86630b153 100644<br>
&gt; --- a/meta-poky/conf/distro/poky.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky.conf<br>
&gt; @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D &quot;kernel-<br>
&gt; module-af-packet&quot;<br>
&gt; <br>
&gt;=C2=A0 DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT}<br>
&gt; ${POKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt; <br>
&gt; -PREFERRED_VERSION_linux-yocto ?=3D &quot;6.12%&quot;<br>
&gt; -PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.12%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto ?=3D &quot;6.16%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.16%&quot;<br>
&gt; <br>
&gt;=C2=A0 SDK_NAME =3D &quot;${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BAS=
ENAME}-<br>
&gt; ${TUNE_PKGARCH}-${MACHINE}&quot;<br>
&gt;=C2=A0 SDKPATHINSTALL =3D &quot;/opt/${DISTRO}/${SDK_VERSION}&quot;<br>
&gt; --<br>
&gt; 2.39.2<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_7513490027274286378gmailsignaturepr=
efix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#223742): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223742" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/223742</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115084892/105=
0810" target=3D"_blank">
https://lists.openembedded.org/mt/115084892/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_7513490027274286378gmailsignaturepr=
efix">-- </span><u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000550132063f272076--

