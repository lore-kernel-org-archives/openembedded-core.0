Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4686C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 07:17:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.26122.1701242248582670092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 23:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxmNxgM8;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: chuckwolber@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50aab0ca90aso9278734e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701242246; x=1701847046; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=whzRt7HdT7bVeSiIBMsDZntLqyz/PGFCZfVVWPUajAI=;
        b=XxmNxgM8VBXUV2VG7h0NE5jKRbSr0p2nQNSaTxbmQbU7CJ5wsyKvywG/KbhYNIF5/T
         Re5XuanMkMOOLoEvd857KkfSjDZQFOARl+9q5nQTmO0+heoywdPPg2I/r1yVmZFxbxYE
         Cbdtb7ikfUa2Hlunkdif3W2zsgmSiR0vh73RZ0bsDdbvuo3e/UQTtgQEoGCOfgsePwL4
         1V+snP1mzz6OYkzp7vyvSZnMsto2OSMXpMCg0GXRrQC1Gby99w3XJzuqVrkjjx75FRq+
         iKa5Gw50FZeAMwtuk3LiEpMTNJql8H+6oiHLkHlfvMJ1ceIp4G9pTM0pNTusLqG0ccm9
         6P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701242246; x=1701847046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whzRt7HdT7bVeSiIBMsDZntLqyz/PGFCZfVVWPUajAI=;
        b=Kzik8wKXq6lmpvDADsmTQ4v5DuQVe7KEak858QDC/Otmjzp/OLhsF59t/ttzodVafo
         ehltQOUnzTq1tjUCx6rBGLssbM0BZ5oLaQZUjMjT8+aXK1Mqao8ZbRGa/4S5sH+h5ZVp
         H6bYSgpH5ey8GayPhOZO/mvbVvlQCRiNpQpaif6u9v2SFULbStT1H6RILTgNAeZVNb1W
         eD3wsbjCuBIjlvCvEOZniMmmVj4X+5eCsyGxRdIJ0xcXWtSv6KTJWbtcRIGWbXE7724U
         ULIhM65BRrtQhjjLrdHZVQD+swVJQkLncthULV7ExSGjWjPDk6JlpgFgeMnSeTW9GCqY
         AEMA==
X-Gm-Message-State: AOJu0Yxfo6mQ76qP18hk7LSP1wpUVnisQ45/l8X2jljJb/tbviGCY/5O
	uu3GM3XrlMtSskQSLlxECFbEXkunlkA0ryuPGMs=
X-Google-Smtp-Source: AGHT+IG1Af0bMc1nXDNPE4etWwxceTGDaDbPnxRENknPFae32391TwMsJoMGxBFDlWeIZ/dkN5lU4tm9vReTQpfddhc=
X-Received: by 2002:a05:6512:10ce:b0:50b:ab5e:35ec with SMTP id
 k14-20020a05651210ce00b0050bab5e35ecmr8453012lfg.32.1701242246247; Tue, 28
 Nov 2023 23:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20231107151243.10853-1-andrey.popov@yadro.com>
 <53356C03-3699-43FC-B8A5-70609982F612@arm.com> <CAB=6tBQqsC0XpFQ3z5EmNz2+2TqiVAeazf0dyL2tnVDgTkV=eQ@mail.gmail.com>
 <2AC2FA03-37DA-46B9-9FB9-E9562C242E31@arm.com>
In-Reply-To: <2AC2FA03-37DA-46B9-9FB9-E9562C242E31@arm.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 28 Nov 2023 23:17:14 -0800
Message-ID: <CAB=6tBQ2Yac3QfOrrsUvVV=kxv_O4XOho8zjR_PQ4R3DSuvCPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Ross Burton <Ross.Burton@arm.com>
Cc: "andrey.popov@yadro.com" <andrey.popov@yadro.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c3b884060b455371"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 07:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191431

--000000000000c3b884060b455371
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:50=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 28 Nov 2023, at 19:00, Chuck Wolber <chuckwolber@gmail.com> wrote:
> >
> > On Tue, Nov 28, 2023 at 9:55=E2=80=AFAM Ross Burton <ross.burton@arm.co=
m> wrote:
> >
> > I=E2=80=99ll reply with comments on the code shortly, but my initial th=
oughts
> are mainly does anyone actually use ISO images still, especially on non-x=
86
> systems?  I=E2=80=99m curious what problem you=E2=80=99re trying to solve=
 here.
> >
> > I can only speak for the projects I am involved in - yes, ISO usage is
> still *very much* alive and well. Mostly x86 type systems for the time
> being, but non-x86 is on the horizon.
>
> And by ISO we=E2=80=99re talking about proper burnt CD or DVDs?
>

Currently yes, but probably moving to dd'ing the ISO to a USB stick in the
next few years.

..Ch:W..


--=20
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000c3b884060b455371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 28, 2023 at 11:50=E2=80=AFAM =
Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com<=
/a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 28 Nov 2023, at 19:00, Chuck Wolber &lt;<a href=3D=
"mailto:chuckwolber@gmail.com" target=3D"_blank">chuckwolber@gmail.com</a>&=
gt; wrote:<br>
&gt; <br>
&gt; On Tue, Nov 28, 2023 at 9:55=E2=80=AFAM Ross Burton &lt;<a href=3D"mai=
lto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; I=E2=80=99ll reply with comments on the code shortly, but my initial t=
houghts are mainly does anyone actually use ISO images still, especially on=
 non-x86 systems?=C2=A0 I=E2=80=99m curious what problem you=E2=80=99re try=
ing to solve here.<br>
&gt; <br>
&gt; I can only speak for the projects I am involved in - yes, ISO usage is=
 still *very much* alive and well. Mostly x86 type systems for the time bei=
ng, but non-x86 is on the horizon.<br>
<br>
And by ISO we=E2=80=99re talking about proper burnt CD or DVDs?<br></blockq=
uote><div><br></div><div>Currently yes, but probably moving to dd&#39;ing t=
he ISO to a USB stick in the next few years.</div><div><br></div><div>..Ch:=
W..<br></div><div><br></div><div>=C2=A0</div></div><span class=3D"gmail_sig=
nature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div><b><span style=3D"font-family:monospace">&quot;Perfectio=
n must be reached by degrees; she requires the slow hand of time.&quot; - V=
oltaire</span></b></div></div></div></div>

--000000000000c3b884060b455371--

