Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D69C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 11:51:14 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.54737.1718625070613148462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 04:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I89bajfL;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so76936391fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718625069; x=1719229869; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DwbIocCLPk4ULhbT8jSNawa9ydceqYlHrZWXu6YGijQ=;
        b=I89bajfL5Vdyyxl9bmCQVhkDmAQCFkPl2CiYv9dSAT2YmTiehL6oIw9Xpa1xVLzPRJ
         R57wyFZSfXt7eDQP03uisLkic28Y662D652ogW8M4PTEs8/1Y/YMiybE8tMYtSAODt+H
         q5dJyjSuJSOZj1RJYEOsNQIJg2OCoxSlUaHSpRVKcgh+BquDpJUdAfrWw4eOS2pMAGgC
         idAOhXZzqXZJb//UoNI6YRCM+pUlrODNzINknnuL5ubJleciZhMKS+zk8lrC9HddICux
         YgPcLsfKWIq9jaDF9ofqVHbX3UjKiLg1m++2SjesNFih5KPWQKPufAanc9mH5iosumjU
         lm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625069; x=1719229869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwbIocCLPk4ULhbT8jSNawa9ydceqYlHrZWXu6YGijQ=;
        b=MrdlOMXHzzUsZUc1VAmF5P56KEJfF8NNgNYTfVXaYRUXuQXLrLai7l3BsB2PJeFEse
         rOaThekGVwasaEhkCg7lJIOfFZIQTmMrU9J471y4GtA8pirixxyVgqzDoXECGBTFchRa
         +y25GiVVSGBb1Nmh2y7YXMovafLLBE8VAerqv1P48+oV75VjdXdqGI7Qa05jrw44QazW
         1+L2iaNgSV5nE4Y2GvxaciOK1nsv/5VnpZI9R/x6jJgH1t70KM6MKGb4wpgEOtkVBo2x
         y3QSYtNSjL6SxZLZ8yxRyPN70vychuEG4d9IquI0q37OtpuxkiV3hB8D9wmp4zLJ2cAP
         U29w==
X-Gm-Message-State: AOJu0Ywowbj8C+aVR5GTDu2SbBSyCGc/WxmfPOICtGtMT/CyPH+IoMP9
	BOSCkTEIlvjAbHf70k0C8hzrF3wZY7MO4TAXoeLM3PWsnkYzO/EPYVHOY3tS+6/S+X1CXGiuGri
	70F37SDkmQTrOBDSOsKAYaG2w3Xo=
X-Google-Smtp-Source: AGHT+IGc+1D1LsfpfQ4+YaqL4PL3tjLP96wWfGG5YT6A5g52zC2pKeaJ8ESPvw6yRQ843YjXjDgsox9JZnI5Bh1f15A=
X-Received: by 2002:ac2:5105:0:b0:52c:826f:f3f1 with SMTP id
 2adb3069b0e04-52ca6e56e6amr7246485e87.2.1718625068290; Mon, 17 Jun 2024
 04:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
 <CANNYZj_okQmP9Lrruik2ekQ9k6B6_fyYmRToSuODC3BRP1apUA@mail.gmail.com> <CALT56yPY8+y39saaGXi36i5ZOQo7fkGn66WmWuDBpDZFkxw7-w@mail.gmail.com>
In-Reply-To: <CALT56yPY8+y39saaGXi36i5ZOQo7fkGn66WmWuDBpDZFkxw7-w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2024 13:50:54 +0200
Message-ID: <CANNYZj-q7hWSC9QxjOe1kbN0pF_O+WZ-KZ6VE_vqH4H0QRs8-g@mail.gmail.com>
Subject: Re: [OE-core] QemuPPC64 machine status
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b29900061b14945d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 11:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200809

--000000000000b29900061b14945d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

RESOLVED WONTFIX I=E2=80=99m afraid. The set of tested targets is defined b=
y YP
members. If other targets regress, it=E2=80=99s on those who need them to p=
rovide
fixes.

Alex

On Mon 17. Jun 2024 at 13.47, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote=
:

> On Mon, 17 Jun 2024 at 12:53, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > No. It's not tested on the autobuilder.
>
> I see. Then consider it to be a bug report :-D
>
> >
> > Alex
> >
> > On Mon, 17 Jun 2024 at 11:51, Dmitry Baryshkov via
> > lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > Hello,
> > >
> > > Is qemuppc64 considered to be supported? We have been running CI over
> > > a set of machines, it seems that PPC64 kernel build is broken for
> > > quite some time:
> > >
> > >
> https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov/oebuilds/2hzr=
cO3QvnkeNPVouoptwe4sFZf/build.log
> > >
> > > | /tmp/ccJSLBgE.s: Assembler messages:
> > > | /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a
> multiple of 4)
> > > | /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a
> multiple of 4)
> > > | make[3]: ***
> [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build=
:243:
> > > fs/readdir.o] Error 1
> > > | make[2]: ***
> [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build=
:480:
> > > fs] Error 2
> > > | make[2]: *** Waiting for unfinished jobs....
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#200800):
> https://lists.openembedded.org/g/openembedded-core/message/200800
> > > Mute This Topic: https://lists.openembedded.org/mt/106717814/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> With best wishes
> Dmitry
>

--000000000000b29900061b14945d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">RESOLVED WONTFIX I=E2=80=99m afraid. The set of tested ta=
rgets is defined by YP members. If other targets regress, it=E2=80=99s on t=
hose who need them to provide fixes.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Alex=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon 17. Jun 2024 at 13.47, Dmitry Baryshko=
v &lt;<a href=3D"mailto:dbaryshkov@gmail.com">dbaryshkov@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">On Mon, 17 Jun 2024 at 12:53, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; No. It&#39;s not tested on the autobuilder.<br>
<br>
I see. Then consider it to be a bug report :-D<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 17 Jun 2024 at 11:51, Dmitry Baryshkov via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;dbaryshkov=3D<a href=3D"mailto:gmai=
l.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedde=
d.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Is qemuppc64 considered to be supported? We have been running CI =
over<br>
&gt; &gt; a set of machines, it seems that PPC64 kernel build is broken for=
<br>
&gt; &gt; quite some time:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://storage.tuxsuite.com/public/linaro/dmitry.bary=
shkov/oebuilds/2hzrcO3QvnkeNPVouoptwe4sFZf/build.log" rel=3D"noreferrer" ta=
rget=3D"_blank">https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov=
/oebuilds/2hzrcO3QvnkeNPVouoptwe4sFZf/build.log</a><br>
&gt; &gt;<br>
&gt; &gt; | /tmp/ccJSLBgE.s: Assembler messages:<br>
&gt; &gt; | /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a =
multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a =
multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a =
multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a=
 multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a=
 multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a=
 multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a=
 multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a=
 multiple of 4)<br>
&gt; &gt; | /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a=
 multiple of 4)<br>
&gt; &gt; | make[3]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source=
/scripts/Makefile.build:243:<br>
&gt; &gt; fs/readdir.o] Error 1<br>
&gt; &gt; | make[2]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source=
/scripts/Makefile.build:480:<br>
&gt; &gt; fs] Error 2<br>
&gt; &gt; | make[2]: *** Waiting for unfinished jobs....<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; With best wishes<br>
&gt; &gt; Dmitry<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#200800): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/200800" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/200800</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106=
717814/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/106717814/1686489</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gma=
il.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div></div>

--000000000000b29900061b14945d--

