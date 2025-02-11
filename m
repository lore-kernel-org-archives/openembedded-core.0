Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BEDC0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 18:31:57 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.653.1739298713419460011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 10:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LUQAsG6P;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso90136576d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 10:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739298712; x=1739903512; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P69zY4cz0TvRVFYJYelgCybpY4ozbNe157cCa2plIik=;
        b=LUQAsG6P1AcyyGq7TYsYDzUhpy2uSFMIcaoS4aAFAX3xHjFiQSes9hV49nXHxJuOqa
         dV67Q8BaFMxeAFRvaI8N5o8SPBkjqJUJOmxyPU9q6IahVSfxKoAtTyocJOkLnGldYpz5
         7zKS56/D6HO+EcchQjqtRUhaiiovW+pw80QbWUO6kgh6qAAdW8LCq1JZ/Wa/1adBL6lS
         xdOSH12VJ8ZKjtyHYeppm4R+94zhCv6kbIgBP+wtFlZSwdeTP9lckvgsfUVAtApWkOpZ
         dlx/AODEfjPL1EWKuQt+E9nobQfvX1YCdavJuOhYETkyN8A5QOX6ym9nvNcumQBc6HMv
         6c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739298712; x=1739903512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P69zY4cz0TvRVFYJYelgCybpY4ozbNe157cCa2plIik=;
        b=eHf/lPC4+s9JZJ1VmBl5/DtPRp3CdtkQ+ZgsG4OjyMcTzXzvV2K/2hrSF/cRbQ8/Si
         NdhZc4XL76yCIf4+nSXuX7WS5iUFUDgQdmA0GPkuECP1B1dJVfLAtsCmvF5qn34Tmap3
         AxlGFOlU4O8VJyWMecfzPvBfongv4mo9cqlNoLuGToDkXz/UfLnSQcNipQNoiTFaX/Bu
         WqjwpD0zkZYsMtpA3nZZddINDh1lw/mthH2tlzVRIgPkRfwfay/Cp+blN56Idk0kk6lC
         7Il2s56ccW4WbZ6tbMyEUZlKl6mWlqdkoofj9HtbavRVjDJM2JYInv05YZWa5BHPjD8Q
         L9yg==
X-Forwarded-Encrypted: i=1; AJvYcCVc89Q4kec8qTKf7eerDrqT8/XOcLuUqQQ1C9a5rAG2KThFBO5UJPiZjhuKENG5OSDojbFl8+z1Rl1bEIS1buIQvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrOcrhwweVkgTMEthkZAyaDRYMAIZNDdgNiRmz7OzAssRqqnBN
	pbvOxBMQGTSEqYFKl6w2K3RP0fvn0d4P2OI+iVZkSBnjOSsdoTCeclOLsvYrBKaDp20s5TixiR4
	rCkyatTJPgCgGN4+zQ+ciknDncI4=
X-Gm-Gg: ASbGncvaMZ8rUNRXfXXdIlcHyhn0PP8vEdQxj4S/0leRWekEgOa2j7rYsEDVP81GOUA
	AsHl3gIzw7WltkVGcUw/kvMOVUq7prR5ciF1ztdAFQnSMdsOn1BGDMRxthroMwbdn8Umhpaielg
	DUvvA4Sc+XQBbwnDwPGZJknAFnN2szqao=
X-Google-Smtp-Source: AGHT+IHtRlH7lVmyDSPm4W105yRWtXieqNXwMczxtST3A0XnysXgDSacdbOQZROrVHh5Wp7qmqycqfM8Z0UzDnIUAYQ=
X-Received: by 2002:a05:6214:4113:b0:6d8:8d87:e5b4 with SMTP id
 6a1803df08f44-6e46ed8861cmr6171806d6.19.1739298712416; Tue, 11 Feb 2025
 10:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20250206144907.1924993-1-oobitots@cisco.com> <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2025 19:31:40 +0100
X-Gm-Features: AWEUYZmzhjNulcZu-PSh9Z88Y8XJ-_Bhf3P04s0iOBEoP6Yn10hijLQK5Zvcz0Q
Message-ID: <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
To: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000e99cae062de2095a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 18:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211161

--000000000000e99cae062de2095a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This still doesn=E2=80=99t make sense. Any target file is contained in one =
and only
one package. Where is the duplication?

Alex

On Tue 11. Feb 2025 at 19.04, Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC
INC at Cisco) <oobitots@cisco.com> wrote:

> I'm sorry, I confused you mentioned term sysroot. It's not about yocto -
> we just use the same term because it's very similar
> to how it works into yocto.
> We got packages as a result of  yocto build and use these artefacts
> (packages) on next stage to populate
> software components content. For some reason we can't use the same
> approach with hardlink to deduplicate
> components content.
>
> Regards,
> Oleksiy
>
> ------------------------------
> *From:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Sent:* Monday, February 10, 2025 22:05
> *To:* alex.kanavin@gmail.com <alex.kanavin@gmail.com>; Oleksiy Obitotskyy
> -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>
> *Cc:* Ross Burton <Ross.Burton@arm.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Ruslan Bilovol (rbilovol) <
> rbilovol@cisco.com>
> *Subject:* RE: [OE-core] [PATCH] systemd: move systemctl utility to
> separate subpackage
>
> Additionally, changing the packaging does not affect what is added to
> the sysroot.
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> > lists.openembedded.org
> > Sent: den 10 februari 2025 18:20
> > To: oobitots@cisco.com
> > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> > core@lists.openembedded.org; Ruslan Bilovol (rbilovol)
> > <rbilovol@cisco.com>
> > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to
> separate
> > subpackage
> >
> > They're not actually copied. They're hard-linked from
> > sysroots-components/. This is a cheap operation and it doesn't waste
> > disk space.
> >
> > Alex
> >
> > On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via
> > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > wrote:
> > >
> > > Hi Alexander,
> > >
> > > By 'deploying whole systemd' I mean next:
> > >
> > > Every component copy and installs packages with libraries, utilities
> and
> > config files in component local sysroot, i.e. directory used to create
> > final component image:
> > >
> > > libsystemd0_255.4
> > > libsystemd-shared_255.4
> > > systemd_255.4
> > >
> > > So, on disk we have duplication of files for every component that
> depend
> > on the systemctl.
> > > In case of separate subpackage we have one root component depend on t=
he
> > systemd and all other components will contain only systemd-systemctl
> > package content.
> > >
> > > Of course, I understand it's quite a specific scenario.
> > >
> > > Regards,
> > > Oleksiy
> > >
> > > ________________________________
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Sent: Monday, February 10, 2025 13:03
> > > To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)
> > <oobitots@cisco.com>
> > > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> > core@lists.openembedded.org <openembedded-core@lists.openembedded.org>;
> > Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> > > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to
> > separate subpackage
> > >
> > > On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
> > > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > > wrote:
> > > > We have next situation:
> > > > - a lot of software components that depend on packages and deploy a=
ll
> > packages they depend on locally inside component.
> > > > - some components directly depend on systemctl only (e.g. this bina=
ry
> > used in scripts), so for every component we have to deploy whole system=
d
> > locally.
> > > > - finally, all/some of those components will be merged in some way
> and
> > will use systemd/libsystemd, but until then it will be nice to get rid =
of
> > such duplication.
> > >
> > > I'm sorry, but this does not quite make sense. You need to more
> > > specifically describe what 'deploying whole systemd' means, and why i=
s
> > > that problematic.
> > >
> > > Alex
> > >
> > >
> > >
>

--000000000000e99cae062de2095a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This still doesn=E2=80=99t make sense. Any target file is=
 contained in one and only one package. Where is the duplication?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue 11. Feb 2025 at 19.04, Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC I=
NC at Cisco) &lt;<a href=3D"mailto:oobitots@cisco.com">oobitots@cisco.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:=
1ex;border-left-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I&#39;m sorry, I confused you mentioned term sysroot. It&#39;s not about yo=
cto - we just use the same term because it&#39;s very similar</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
to how it works into yocto.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
We got packages as a result of=C2=A0 yocto build and use these artefacts (p=
ackages) on next stage to populate</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
software components content. For some reason we can&#39;t use the same appr=
oach with hardlink to deduplicate</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
components content.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Oleksiy</div>
<div id=3D"m_4630877715923648911appendonsend" style=3D"color:inherit"></div=
>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div dir=3D"ltr" id=3D"m_4630877715923648911divRplyFwdMsg" style=3D"color:i=
nherit"><span style=3D"font-family:Calibri,sans-serif;font-size:11pt;color:=
rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b>=C2=A0Pete=
r Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D=
"_blank" style=3D"font-family:Calibri,sans-serif">peter.kjellerstedt@axis.c=
om</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b>=C2=A0Monday, February=
 10, 2025 22:05<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b>=C2=A0<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank" style=3D"font-family:Calibri,sans=
-serif">alex.kanavin@gmail.com</a> &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank" style=3D"font-family:Calibri,sans-serif">alex.kanav=
in@gmail.com</a>&gt;; Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at =
Cisco) &lt;<a href=3D"mailto:oobitots@cisco.com" target=3D"_blank" style=3D=
"font-family:Calibri,sans-serif">oobitots@cisco.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b>=C2=A0Ross Burton &lt;<a=
 href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">Ross.Burton@arm.com</a>&gt;; <a href=3D"mailto:openemb=
edded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family:C=
alibri,sans-serif">openembedded-core@lists.openembedded.org</a> &lt;<a href=
=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank" styl=
e=3D"font-family:Calibri,sans-serif">openembedded-core@lists.openembedded.o=
rg</a>&gt;; Ruslan Bilovol (rbilovol) &lt;<a href=3D"mailto:rbilovol@cisco.=
com" target=3D"_blank" style=3D"font-family:Calibri,sans-serif">rbilovol@ci=
sco.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b>=C2=A0RE: [OE-core]=
 [PATCH] systemd: move systemctl utility to separate subpackage</span>
<div>=C2=A0</div>
</div></div><div dir=3D"ltr">
<div style=3D"font-size:11pt">Additionally, changing the packaging does not=
 affect what is added to<br>
the sysroot.<br>
<br>
//Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin via<br>
&gt; <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; Sent: den 10 februari 2025 18:20<br>
&gt; To: <a href=3D"mailto:oobitots@cisco.com" target=3D"_blank">oobitots@c=
isco.com</a><br>
&gt; Cc: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_=
blank">Ross.Burton@arm.com</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>; Ruslan Bilovol (rbilovol)<br>
&gt; &lt;<a href=3D"mailto:rbilovol@cisco.com" target=3D"_blank">rbilovol@c=
isco.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to sepa=
rate<br>
&gt; subpackage<br>
&gt;<br>
&gt; They&#39;re not actually copied. They&#39;re hard-linked from<br>
&gt; sysroots-components/. This is a cheap operation and it doesn&#39;t was=
te<br>
&gt; disk space.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via<br>
&gt; <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a> &lt;oobitots=3D<a href=3D"mailto:cisco.com@lists.openembed=
ded.org" target=3D"_blank">cisco.com@lists.openembedded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Alexander,<br>
&gt; &gt;<br>
&gt; &gt; By &#39;deploying whole systemd&#39; I mean next:<br>
&gt; &gt;<br>
&gt; &gt; Every component copy and installs packages with libraries, utilit=
ies and<br>
&gt; config files in component local sysroot, i.e. directory used to create=
<br>
&gt; final component image:<br>
&gt; &gt;<br>
&gt; &gt; libsystemd0_255.4<br>
&gt; &gt; libsystemd-shared_255.4<br>
&gt; &gt; systemd_255.4<br>
&gt; &gt;<br>
&gt; &gt; So, on disk we have duplication of files for every component that=
 depend<br>
&gt; on the systemctl.<br>
&gt; &gt; In case of separate subpackage we have one root component depend =
on the<br>
&gt; systemd and all other components will contain only systemd-systemctl<b=
r>
&gt; package content.<br>
&gt; &gt;<br>
&gt; &gt; Of course, I understand it&#39;s quite a specific scenario.<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Oleksiy<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; Sent: Monday, February 10, 2025 13:03<br>
&gt; &gt; To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)<b=
r>
&gt; &lt;<a href=3D"mailto:oobitots@cisco.com" target=3D"_blank">oobitots@c=
isco.com</a>&gt;<br>
&gt; &gt; Cc: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=
=3D"_blank">Ross.Burton@arm.com</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.op=
enembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org<=
/a>&gt;;<br>
&gt; Ruslan Bilovol (rbilovol) &lt;<a href=3D"mailto:rbilovol@cisco.com" ta=
rget=3D"_blank">rbilovol@cisco.com</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to=
<br>
&gt; separate subpackage<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a> &lt;oobitots=3D<a href=3D"mailto:cisco.com@lists.open=
embedded.org" target=3D"_blank">cisco.com@lists.openembedded.org</a>&gt;<br=
>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; We have next situation:<br>
&gt; &gt; &gt; - a lot of software components that depend on packages and d=
eploy all<br>
&gt; packages they depend on locally inside component.<br>
&gt; &gt; &gt; - some components directly depend on systemctl only (e.g. th=
is binary<br>
&gt; used in scripts), so for every component we have to deploy whole syste=
md<br>
&gt; locally.<br>
&gt; &gt; &gt; - finally, all/some of those components will be merged in so=
me way and<br>
&gt; will use systemd/libsystemd, but until then it will be nice to get rid=
 of<br>
&gt; such duplication.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m sorry, but this does not quite make sense. You need to mo=
re<br>
&gt; &gt; specifically describe what &#39;deploying whole systemd&#39; mean=
s, and why is<br>
&gt; &gt; that problematic.<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;</div>
</div>

</blockquote></div></div>

--000000000000e99cae062de2095a--

