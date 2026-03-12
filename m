Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EA5105A589
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:30:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19351.1773315047714370951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=NQZdyvAw;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6610d11710aso55955a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315046; cv=none;
        d=google.com; s=arc-20240605;
        b=LtKt3V1FhjOlMy4cFX1JPjyfzalBagakF6fxzZkMJ3rPp7b0fIwl+Jfr5g3buoGaL4
         TWzSccu7CdeidOEM3rxr8SBePFneuQQ/FsmDBPuGPiRh9XyEFBornlwlyvuPAiC7BXKj
         SJUpJoz4x55gDPLBGirDM/lZp5nOA8scfGs1ZuNHVLXR5OnK3/n2uD2fSW8n14PXOKWZ
         tIzf7rhA4kVC6pGh5c5XF7wmxkGA3kgqHfs4Gif2XSKdPNGGN/4C1GpHgZdKMZ55ynCH
         D98//AxtbZ/6Kb3WYDwnIQLPLm0WMUODzEZn0e1Q6SF0ohwjH8+rvwUtpWZ/JDB2cR7A
         wuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mp7UfRCmVdStpAlRJr+o1umgItnsViEELKw2pS3CBsE=;
        fh=1puSXUioaU+HD3ZXNvyXn59zLYzZgJNvxLuLWtOVW4o=;
        b=a/tIZGdSII+ECQgfQpoC7QwbDOfL6wFVj7xccIooXQhFJm07TAVX44G1AXygwTwRSb
         SOfj8463SyZY42NlJYRQNuLLZQ2bp+hIOLj0tZJ0/6v+46IW4kb2vlaCk6QqQpldFfEP
         aAY1Af5woWoLMSjfBf1DfrmeEIuAF58uz/n5lpvKD4rqEZdwgEXRAxbhE8Zvw8ummFox
         We1A0slSmwuwJvxcHC99qya6QFToWMJY1KVrw9vKybQOTIJOKZTUB/+o9Wc/r71sHcOa
         kCudwKPnEEykUpFDiXA/e+vm2IRTN3lDWqXS4l+i31kZB5G3ICB9vZDMedVb59HQeRyS
         wBYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1773315046; x=1773919846; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mp7UfRCmVdStpAlRJr+o1umgItnsViEELKw2pS3CBsE=;
        b=NQZdyvAwxZY46q+/Pn4SmXRVd/rPKH/STnBBffpY0hgyX5fD6ntNq29bWMhGlOYOC/
         ywp/Cv9LQQnYEEFLxhvy/9klLREIJe2/Z3NILhznUD3XP+2sN7cr5PtdGN7UJFjQ7OQR
         qY7zw6DfnPlyYqJtROb+Tjtctbpu6lDws+6ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315046; x=1773919846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mp7UfRCmVdStpAlRJr+o1umgItnsViEELKw2pS3CBsE=;
        b=N0wz+XKDMFWO8+lt3YHeDFrOddSFWwc2Sp5BFRYyrVQejxxqxkVyIGX4q2qHFVJUKE
         BeACyHa9E08VThhSyBFTQ1Cbe/MyDM5Koy2qw6UwAAKRyC6L9c6+KJ7Fx6hbGuEoHXYF
         3p+uw4BR+0ftbbFhzHkrTuA3CnyCw+7vweS6BDuAIw9vU+pXXXzgAIdZEGfoBWZFrlkM
         mtWMwX18CaqQy7pBK60jQ5R16lnK0uxFzZJa/9D+JD4qO0OjJ52kpW/Ay3x9RJMXdAUl
         /mxGbGyc1AZ9WZTf720UTbcQt0KzLyWslp/8ZjfLXMsyqPnC9H4MjPGudFkESybTtnDc
         8Xdg==
X-Forwarded-Encrypted: i=1; AJvYcCXLiKSobPEKOxXGW/1/8nIyvkXkWYCsBwZUqtOE48ZjiCofTjvRlfBNUrK+9a6+NP6fxO8T8kSey2ZjxEl6gL8oog==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwvjibDCbvzOAOUUQ/B7st9HtEjuzhJYXy/vS3tzyjLck4hGqL6
	fa4aYkWfFbXvYwMuV+I1riPvxmyCNnnX6ooFSo8XM+3aeevvHIRZAvTzwmiU4b6K/NoJDSy10PQ
	IhimUsfNZU1YB4SwlCl6toIO1O1u76AqCFgTaJk14Nw==
X-Gm-Gg: ATEYQzxkiPaEAoLX2Yth5XVCI4895r8aoc23eWq4AYz/SxsapO7OgxFSuU4D/RdPRcJ
	R8BMQC6gB1+jrIo0/YSE6WGEy2Fa9nmMCP+28QHVUzRxv5fEfsDBqwZupG/ewlXrqLoV+kSReEz
	AxzOKub3IetUN/4KFi4yvzPKgiJ0K4vp8Fva7kK65bOiLO/UDdgJDvwxFtzrBi+Cwir3kA8vlNz
	RnT+fKXYh0JcUp787KkaNFN8STUij7qJO5h4+we26YyrYxiz42Pxe52KmupSasCLh2llKej7c2R
	Pkz8kbR3U20sSLRZWbFuNoSgrI16iYyuqPd1/C2q
X-Received: by 2002:a17:907:1c0a:b0:b93:56a4:d6c7 with SMTP id
 a640c23a62f3a-b972de17dcdmr183093466b.0.1773315045537; Thu, 12 Mar 2026
 04:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com> <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 12 Mar 2026 12:30:32 +0100
X-Gm-Features: AaiRm53jdzkudSN70yVlgEoqMLHS8z4opENODSpJpNA0jBUz2XSFL1exPbtgE3M
Message-ID: <CAHDQB6Nc+0tCWyxVxtWfAtGqsFgVbLfwjA-aqH7E7w_p+WTK+w@mail.gmail.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
To: "Matthew Ware (mattware)" <mattware@cisco.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Elliot Sparling (esparlin)" <esparlin@cisco.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000005d4ec2064cd215af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232939

--0000000000005d4ec2064cd215af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all;

I could use some help with dnf5 actually!
The last patch series has two problems:
  - Systemd packaging errors when usrmerge isn't selected (fixed)
  - Segfaults when musl is built

I have fixed the first problem but the second one is a bit too much for me
to track down given
my current workload.

I can throw up a patch series today if anyone is willing to help with the
segfaults!

Adam


On Wed, Mar 11, 2026 at 4:42=E2=80=AFPM Matthew Ware (mattware) <mattware@c=
isco.com>
wrote:

> Thanks Robert,
>
> I'm looking internally within the team for whether we have the resources
> and expertise to be able to help at all :)
>
> If we do find the time/ability to help, we would likely need guidance on
> what's been tested already, what needs testing still, how to test, etc.
>
> Thanks,
> Matt
>
>
> ------------------------------
> *From:* Robert Yang <liezhi.yang@windriver.com>
> *Sent:* Wednesday, March 11, 2026 12:18 PM
> *To:* Matthew Ware (mattware) <mattware@cisco.com>; Alexander Kanavin <
> alex.kanavin@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Elliot Sparling (esparlin) <
> esparlin@cisco.com>; Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com>; adam.duskett@amarulasolutions.com <
> adam.duskett@amarulasolutions.com>
> *Subject:* Re: [OE-core] RPM 6 in Wrynose
>
>
>
> On 3/11/26 20:00, Matthew Ware (mattware) wrote:
> > Hi Alex,
> >
> > Fair question! My team are looking at using yocto 6.0 when it's
> released, and
> > rpm6 has some features we're interested in. If rpm 6 makes it into yoct=
o
> 6.0 we
>
> I'm still working on upgrading to 6, here is the latest tmp code:
>
> $ git fetch https://github.com/robertlinux/yocto rbt/rpm_tmp
>
> Currently, it can't provides the pkgconfig files correctly when the pc
> files are
> /usr/share/pkgconfig/, any help is appreciated, for example, help to do
> more
> testing to find the corner cases.
>
> // Robert
>
> > can start taking advantage of those features, and I want to plan for
> that :).
> > Similar with dnf 5.
> >
> > Thanks,
> > Matt
> >
> >
> >
> -------------------------------------------------------------------------=
-------
> > *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> > *Sent:* Tuesday, March 10, 2026 5:26 PM
> > *To:* Matthew Ware (mattware) <mattware@cisco.com>
> > *Cc:* openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org>; Elliot Sparling (esparlin) <
> esparlin@cisco.com>;
> > Robert Yang <liezhi.yang@windriver.com>; Mathieu Dubois-Briand
> <mathieu.dubois-
> > briand@bootlin.com>; adam.duskett@amarulasolutions.com
> > <adam.duskett@amarulasolutions.com>
> > *Subject:* Re: [OE-core] RPM 6 in Wrynose
> >
> > On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)
> > <mattware@cisco.com> wrote:
> >  > Also, since we're here: is there any plan to move to DNF 5? I see
> Wrynose is
> > staying on 4.x, but wondered if there was a plan/aim for DNF 5.
> >
> > Yes, there are WIP patches for it too. Adam is working on it.
> >
> > I have to ask: can you give us some context? What makes you interested
> > in having these versions in Yocto?
> >
> > Alex
>
>

--0000000000005d4ec2064cd215af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all;</div><div><br></div><div>I could use some hel=
p with dnf5 actually!</div><div>The last patch series has two problems:</di=
v><div>=C2=A0 - Systemd packaging errors when usrmerge isn&#39;t selected (=
fixed)</div><div>=C2=A0 - Segfaults when musl is built</div><div><br></div>=
<div>I have fixed the first problem but the second one is a bit too much fo=
r me to track down given</div><div>my current workload.</div><div><br></div=
><div>I can throw up a patch series today if anyone is willing to help with=
 the segfaults!</div><div><br></div><div>Adam</div><div><br></div></div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Mar 11, 2026 at 4:42=E2=80=AFPM Matthew Ware (mattware=
) &lt;<a href=3D"mailto:mattware@cisco.com">mattware@cisco.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"msg1276487712218588648">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Thanks Robert,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I&#39;m looking internally within the team for whether we have the resource=
s and expertise to be able to help at all :)</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
If we do find the time/ability to help, we would likely need guidance on wh=
at&#39;s been tested already, what needs testing still, how to test, etc.</=
div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Matt</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<b>From:</b>=C2=A0Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.c=
om" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
<b>Sent:</b>=C2=A0Wednesday, March 11, 2026 12:18 PM<br>
<b>To:</b>=C2=A0Matthew Ware (mattware) &lt;<a href=3D"mailto:mattware@cisc=
o.com" target=3D"_blank">mattware@cisco.com</a>&gt;; Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gm=
ail.com</a>&gt;<br>
<b>Cc:</b>=C2=A0<a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=
=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">open=
embedded-core@lists.openembedded.org</a>&gt;; Elliot Sparling (esparlin) &l=
t;<a href=3D"mailto:esparlin@cisco.com" target=3D"_blank">esparlin@cisco.co=
m</a>&gt;; Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-brian=
d@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt;;=
 <a href=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blank">ada=
m.duskett@amarulasolutions.com</a> &lt;<a href=3D"mailto:adam.duskett@amaru=
lasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt=
;<br>
<b>Subject:</b>=C2=A0Re: [OE-core] RPM 6 in Wrynose </div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-size:11pt"><br>
<br>
On 3/11/26 20:00, Matthew Ware (mattware) wrote:<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Fair question! My team are looking at using yocto 6.0 when it&#39;s re=
leased, and<br>
&gt; rpm6 has some features we&#39;re interested in. If rpm 6 makes it into=
 yocto 6.0 we<br>
<br>
I&#39;m still working on upgrading to 6, here is the latest tmp code:<br>
<br>
$ git fetch <a id=3D"m_1276487712218588648OWAb8e1ab22-c7a9-4e70-b71c-3f96e1=
b225c6" href=3D"https://github.com/robertlinux/yocto" target=3D"_blank">
https://github.com/robertlinux/yocto</a>=C2=A0rbt/rpm_tmp<br>
<br>
Currently, it can&#39;t provides the pkgconfig files correctly when the pc =
files are<br>
/usr/share/pkgconfig/, any help is appreciated, for example, help to do mor=
e<br>
testing to find the corner cases.<br>
<br>
// Robert<br>
<br>
&gt; can start taking advantage of those features, and I want to plan for t=
hat :).<br>
&gt; Similar with dnf 5.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Matt<br>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
----------<br>
&gt; *From:*=C2=A0Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; *Sent:*=C2=A0Tuesday, March 10, 2026 5:26 PM<br>
&gt; *To:*=C2=A0Matthew Ware (mattware) &lt;<a href=3D"mailto:mattware@cisc=
o.com" target=3D"_blank">mattware@cisco.com</a>&gt;<br>
&gt; *Cc:*=C2=A0<a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openemb=
edded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt;; Elliot Sparling (esparlin) &lt;<a href=3D"m=
ailto:esparlin@cisco.com" target=3D"_blank">esparlin@cisco.com</a>&gt;;<br>
&gt; Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D=
"_blank">liezhi.yang@windriver.com</a>&gt;; Mathieu Dubois-Briand &lt;mathi=
eu.dubois-<br>
&gt; <a href=3D"mailto:briand@bootlin.com" target=3D"_blank">briand@bootlin=
.com</a>&gt;; <a href=3D"mailto:adam.duskett@amarulasolutions.com" target=
=3D"_blank">adam.duskett@amarulasolutions.com</a><br>
&gt; &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_bl=
ank">adam.duskett@amarulasolutions.com</a>&gt;<br>
&gt; *Subject:*=C2=A0Re: [OE-core] RPM 6 in Wrynose<br>
&gt;<br>
&gt; On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)<br>
&gt; &lt;<a href=3D"mailto:mattware@cisco.com" target=3D"_blank">mattware@c=
isco.com</a>&gt; wrote:<br>
&gt;=C2=A0 &gt; Also, since we&#39;re here: is there any plan to move to DN=
F 5? I see Wrynose is<br>
&gt; staying on 4.x, but wondered if there was a plan/aim for DNF 5.<br>
&gt;<br>
&gt; Yes, there are WIP patches for it too. Adam is working on it.<br>
&gt;<br>
&gt; I have to ask: can you give us some context? What makes you interested=
<br>
&gt; in having these versions in Yocto?<br>
&gt;<br>
&gt; Alex<br>
<br>
</div>
</div>

</div></blockquote></div>

--0000000000005d4ec2064cd215af--

