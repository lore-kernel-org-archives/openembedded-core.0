Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2DBE82CB9
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 17:25:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.23565.1695835512289555082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 10:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QovjRIYa;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso195239961fa.0;
        Wed, 27 Sep 2023 10:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695835510; x=1696440310; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O8sRSW7SEHb+cKjjzU2Tv1oKQbxlMQnYdEhppYqm6fk=;
        b=QovjRIYa0+o3ZiMSCVQsnFXJRjVR1JiV9BDlY6y3SVSENyvTNpU5VuHG0nhkzero0j
         ix7OK0yIXoD3ect/qWqfubqDLwYxQcE0dbBFpFiiGAy5s9wTvI5+T5er1CW9qzbB7nEG
         rezGojAbgwbpW32jvekoWk+z7pXOwrWavuUURxxdz8WxDy2TKiK3M3yg1A6MEaSGPT1j
         0o5lS1+dCy+VgktG1pzAdGTJPZXS9UDsgwa7c/xhNMEf7d5OxPcDvRuevfdCebXAO+QQ
         SxkilSXE0NAL4HqOLV3nz2rkM5C/BbP6aoeO2xGPuMgBuxlottpuTsU6AvRoxevSv2US
         M4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695835510; x=1696440310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8sRSW7SEHb+cKjjzU2Tv1oKQbxlMQnYdEhppYqm6fk=;
        b=R5G7F30oOS4iRmgdJVpmzmIfe5Yx8Isa90xGBgEf14n67TBUHLl3jRLVw6yj83pbMs
         23XEssFM4gylyI/9mZDSKCUfbzO1GjsWGiwK7P4Qg/2YHM3GclFVG9w+GT5Oq+5DcIUr
         NQbc12JWTXBdZoiv+aLd/OmqGpVVAZ/Dw3EEmhVkoSPSgBQziVhyilHneiKUMl6BFEEm
         jQ9EYcJyC4bW1jsWP3h32SOptEzErTDxTH5WE/kNn8UBK0St7kvVXh4q28qVUEyhAaVa
         4Kcz/EkZzzPMU8Wwa49II7sC5G0hMynw83Awa73lAHOe9O2V0bKs36yAOmABQeUAH1os
         Zj0Q==
X-Gm-Message-State: AOJu0YyMCwW4Sf26cBWzUR8fubBIY+SyySUrRZDJpxCZKuFMHZtuHh4S
	GhX6jWibzeeNADnwkyEHY+PIxEgRWkVFIrV3Hy0=
X-Google-Smtp-Source: AGHT+IHmvUXpf6Nk5auvdRdrghbshqJIsTIwxe6gx2Lxa+KBNSKinqLGXFO5CvPWvkcWm220/9nS8yLOHpSom7o1JsI=
X-Received: by 2002:a2e:a170:0:b0:2b1:ed29:7c47 with SMTP id
 u16-20020a2ea170000000b002b1ed297c47mr2538033ljl.8.1695835509924; Wed, 27 Sep
 2023 10:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
 <BY5PR11MB41673328EC01C44668ED8870EAFCA@BY5PR11MB4167.namprd11.prod.outlook.com>
 <CAApg2=QJpjSQ_z5OXgEoGxOk+Pxq2NgSnRvDY0SJN5eQ8FDtmQ@mail.gmail.com> <BY5PR11MB4167C73C84879150E4078FA9EAC2A@BY5PR11MB4167.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4167C73C84879150E4078FA9EAC2A@BY5PR11MB4167.namprd11.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 27 Sep 2023 19:24:56 +0200
Message-ID: <CAApg2=Tz5QDw7RPhh1Kux=w0REFp2R3K0b+QL6oPazrOpVdCnA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] [yocto] Security processes: YP needs
To: "Reyna, David" <david.reyna@windriver.com>
Cc: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org, 
	yocto@lists.yoctoproject.org, "MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Khem Raj <raj.khem@gmail.com>, Mark Hatle <mark.hatle@kernel.crashing.org>, 
	Ross Burton <ross.burton@arm.com>, Joshua Watt <JPEWhacker@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002aa99706065a7953"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 17:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188336

--0000000000002aa99706065a7953
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Sept 2023, 12:05 Reyna, David, <david.reyna@windriver.com> wrote=
:

> Hi Marta!
>
> > What about 11am Pacific on tomorrow (28 Sept or Oct 3)?
>
> Let us aim for October 3 so that I can prepare a full demo..
>
> > I think that you have meant 10am to 2PM, otherwise 1am Pacific would
> work very well for me too
>
> I actually did mean 2:00 am Pacific. I do work with our India team, so I
> am often up late to sync with them..
>
> > As discussed yesterday in the call, there are some other people who see=
m
> interested.
>
> What time zone are you in?
> I believe Ross is in England (UTC)
> I know that Randy is in Ottawa.
>
> If anyone else wants to join, that would be great!. They should ping us
> and I can send the Zoom link. I do not want to send that link blindly to
> the full mail list.
>

I'm in CEST (Central European zone). If we aim for the 3rd then let's stay
for late afternoon for me.

I let Ross, Randy and everyone else interested to express their preferences=
.


> > I'm going to add the missing file for the test next week, the tool need=
s
> a script to download 2023 data.
>
> That file is part of my code update, so you can get that for free.
>

Thanks!


David
>
> -----Original Message-----
> From: Marta Rybczynska <rybczynska@gmail.com>
> Sent: Wednesday, September 27, 2023 12:18 AM
> To: Reyna, David <david.reyna@windriver.com>
> Cc: yocto-security@lists.yoctoproject.org; OE-core <
> openembedded-core@lists.openembedded.org>;
> openembedded-architecture@lists.openembedded.org;
> yocto@lists.yoctoproject.org; MacLeod, Randy <Randy.MacLeod@windriver.com=
>;
> Richard Purdie <richard.purdie@linuxfoundation.org>; Steve Sakoman <
> steve@sakoman.com>; Khem Raj <raj.khem@gmail.com>;
> mark.hatle@kernel.crashing.org; Ross Burton <ross.burton@arm.com>; Joshua
> Watt <JPEWhacker@gmail.com>
> Subject: Re: [Openembedded-architecture] [yocto] Security processes: YP
> needs
>
> Hi David,
> Thank you very much for the description and the offer to get a demo.
> As discussed yesterday in the call, there are some other people who
> seem interested.
>
> > PROPOSAL 1: If the full triage is too much to bite off to start with,
> perhaps using it to track and coordinate work will bring immediate benefi=
t.
>
> This is the reason I want to test how much time it takes.
>
> > PROPOSAL 2: I am happy to give you a live demo of Wind River's fully
> operational SRTool, so you can see all of the bells and whistles in actio=
n.
> I am available pretty much anytime between 10:00 am Pacific to 2:00 am
> Pacific.
>
> That would be nice. What about 11am Pacific on tomorrow (28 Sept or
> Oct 3)? I think that you have meant 10am to 2PM, otherwise 1am Pacific
> would work very well for me too :P
>
> > PROPOSAL 3: I will start refreshing the YP SRTool repository with my
> current implementation level from Wind River (with the Wind River specifi=
c
> modules left out of course :-)
>
> That would be great. I'm going to add the missing file for the test
> next week, the tool needs a script to download 2023 data.
>
> Kind regards,
> Marta
>
> On Mon, Sep 25, 2023 at 11:02=E2=80=AFAM Reyna, David via
> lists.openembedded.org
> <david.reyna=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > Hi Marta,
> >
> > * SRTool: We might decide to use it again. It allows one to do much but
> requires constant commitment.
> >
> > There are many ways to use the SRTool.
> >   (a)  The original design was to perform 100% triage of incoming CVEs.
> This was a business requirement of Wind River, and we have used the SRToo=
l
> successfully for 4-5 year now.
> >   (b)  The main limitation with the SRTool for Yocto Project was the
> lack of integration with Bugzilla (Ross ran out of time)
> >      * This is the crucial other half of the workflow
> >      * There is the automatic creation of appropriate defect records fo=
r
> investigation
> >      * There is also the automatic tracking of the overall CVE status,
> both CVEs in progress and the CVEs completed
> >      * Wind River has an extension for full integration with Jira, and
> that saves weeks of work for the CVE management
> >   (c) The guiding rule was that CVE management was in the SRTool, but
> specific defect work was also done in Jira/Bugzilla, for a clean separate
> of domains
> >   (d)  The SRTool has a user model
> >      * Together with Bugzilla, it is easy to track single people and
> even multiple people working on CVEs
> >   (e) The SRTool also has the built-on ability to look up the CVE statu=
s
> from other distributions (Red Hat, Debian, ...) so that one can get a pee=
k
> of existing triages and resolutions
> >   (f) The SRTool is build like Toaster on top of Django, so development
> and debugging skills for Toaster immediate apply
> >   (g) Also with the Django base, it is very simple to add any number of
> modular extensions to support for example CVE Scanner integration
> >   (h) The SRTool also has report generation (in text, CSV, and Excel) i=
n
> addition to email notification support.
> >   (i) There is also a "private" model for CVEs under embargo, with
> strict access control lists.
> >
> > PROPOSAL 1: If the full triage is too much to bite off to start with,
> perhaps using it to track and coordinate work will bring immediate benefi=
t.
> >
> > PROPOSAL 2: I am happy to give you a live demo of Wind River's fully
> operational SRTool, so you can see all of the bells and whistles in actio=
n.
> I am available pretty much anytime between 10:00 am Pacific to 2:00 am
> Pacific.
> >
> > PROPOSAL 3: I will start refreshing the YP SRTool repository with my
> current implementation level from Wind River (with the Wind River specifi=
c
> modules left out of course :-)
> >
> > David
> >
> > BTW, I also support an extension to the SRTool that manages CVE scannin=
g
> of build images, with hooks to a  number existing CVE scanners (e.g. Triv=
y)
> in addition to other vulnerability metrics. This is probably out of scope
> to YP at this time, but it is perhaps something to grow in to.
> >
> > -----Original Message-----
> > From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Marta Rybczynska via lists.yoctoproject.org
> > Sent: Wednesday, September 13, 2023 4:52 AM
> > To: yocto-security@lists.yoctoproject.org; OE-core <
> openembedded-core@lists.openembedded.org>;
> openembedded-architecture@lists.openembedded.org;
> yocto@lists.yoctoproject.org
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; Steve Sakoman =
<
> steve@sakoman.com>; Khem Raj <raj.khem@gmail.com>;
> mark.hatle@kernel.crashing.org; Ross Burton <ross.burton@arm.com>; Joshua
> Watt <JPEWhacker@gmail.com>
> > Subject: [yocto] Security processes: YP needs
> >
> > Hello,
> > I've been working recently on collecting what works and what doesn't
> > in YP security processes. The goal is to go forward and define an
> > actionable strategy!
> >
> > Today, I'd like to share with you the summary of what I have heard as
> > needs from several people (those in Cc:).
> >
> > I want the community to comment and tell us what you find important
> > and what you'd like to see added or changed from this list.
> >
> > * CVEs: Visibility if YP is vulnerable or not
> >
> > People want to be able to check/look up a specific CVE; it might be a
> > CVE unrelated to YP
> > (eg. package not included, Windows issue). The cve-checker result is a
> > part of the solution, but people also want to know which CVEs do not
> > apply.
> >
> > * CVEs: synchronization of the work on fixes
> >
> > Currently, there is no synchronization; multiple parties might be
> > working on the same fix while nobody is working on another. There
> > might be duplication of work.
> > Ross has https://wiki.yoctoproject.org/wiki/CVE_Status
> >
> > * Triaging of security issues
> >
> > Related to CVE fixes and includes issues reported directly to the YP.
> > Some issues are more likely to be serious for embedded products
> > (attack by network), so not all has the same priority.
> >
> > * Private security communication
> >
> > A way to send a notification of a non-public security issue. For
> > researchers, other projects etc.
> > The security alias exists, but only some people know about its existenc=
e.
> >
> > * Visibility of the security work of the YP
> >
> > There is much work on security in the YP, but it lacks visibility.
> >
> > * Documentation
> >
> > Related to visibility. We need easy-to-find documentation of subjects
> > like submitting a CVE fix,
> > reporting a private issue, and how our processes work... This
> > documentation should address people who are not regular contributors.
> >
> > * Additional tooling
> >
> > We could add additional tooling: a template on how to add cve-check to
> > the CI (possibly
> > a different one than the autobuilder), analyze the result, and extend
> > our tooling to their layers...
> > It is also related to the "Architecture" topic below.
> >
> > * Architecture work
> >
> > Security if more than CVE fixes. We also have what is happening in
> > meta-security: hardening, compiler option,
> > secure package configuration, use of code coverage tools, and so on
> >
> > * SRTool
> >
> > We might decide to use it again. It allows one to do much but requires
> > constant commitment.
> >
> > * Presence on pre-notification lists and receiving information before
> > the vulnerability gets public
> >
> > YP currently depends on public data. Principal distributions receive
> > the information before
> > a vulnerability becomes public. It requires (in short) private
> > reporting, a security team, and a track
> > of excellent security record.
> >
> > * Becoming a CNA (be able to assign CVEs)
> >
> > Needed if we want to assign CVEs to the software of the YP, like
> > autobuilder, Toaster etc.
> >
> > Kind regards,
> > Marta
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#1775):
> https://lists.openembedded.org/g/openembedded-architecture/message/1775
> > Mute This Topic: https://lists.openembedded.org/mt/101570670/5827677
> > Group Owner: openembedded-architecture+owner@lists.openembedded.org
> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-architecture/unsub [
> rybczynska@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002aa99706065a7953
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 27 Sept 2023, 12:05 Reyna, David, &lt;<a href=
=3D"mailto:david.reyna@windriver.com">david.reyna@windriver.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Hi Marta!<br>
<br>
&gt; What about 11am Pacific on tomorrow (28 Sept or Oct 3)? <br>
<br>
Let us aim for October 3 so that I can prepare a full demo..<br>
<br>
&gt; I think that you have meant 10am to 2PM, otherwise 1am Pacific would w=
ork very well for me too <br>
<br>
I actually did mean 2:00 am Pacific. I do work with our India team, so I am=
 often up late to sync with them..<br>
<br>
&gt; As discussed yesterday in the call, there are some other people who se=
em interested.<br>
<br>
What time zone are you in? <br>
I believe Ross is in England (UTC)<br>
I know that Randy is in Ottawa.<br>
<br>
If anyone else wants to join, that would be great!. They should ping us and=
 I can send the Zoom link. I do not want to send that link blindly to the f=
ull mail list.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I&#39;m in CEST (Central European zone). If we aim for the 3r=
d then let&#39;s stay for late afternoon for me.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I let Ross, Randy and everyone else interested to =
express their preferences.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; I&#39;m going to add the missing file for the test next week, the tool=
 needs a script to download 2023 data.<br>
<br>
That file is part of my code update, so you can get that for free.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks!=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
David<br>
<br>
-----Original Message-----<br>
From: Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">rybczynska@gmail.com</a>&gt; <br>
Sent: Wednesday, September 27, 2023 12:18 AM<br>
To: Reyna, David &lt;<a href=3D"mailto:david.reyna@windriver.com" target=3D=
"_blank" rel=3D"noreferrer">david.reyna@windriver.com</a>&gt;<br>
Cc: <a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=3D"_bla=
nk" rel=3D"noreferrer">yocto-security@lists.yoctoproject.org</a>; OE-core &=
lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_b=
lank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>&gt;; =
<a href=3D"mailto:openembedded-architecture@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-architecture@lists.openembedded=
.org</a>; <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank"=
 rel=3D"noreferrer">yocto@lists.yoctoproject.org</a>; MacLeod, Randy &lt;<a=
 href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank" rel=3D"noref=
errer">Randy.MacLeod@windriver.com</a>&gt;; Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"noreferr=
er">richard.purdie@linuxfoundation.org</a>&gt;; Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"noreferrer">steve@sa=
koman.com</a>&gt;; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;; <a href=3D"mail=
to:mark.hatle@kernel.crashing.org" target=3D"_blank" rel=3D"noreferrer">mar=
k.hatle@kernel.crashing.org</a>; Ross Burton &lt;<a href=3D"mailto:ross.bur=
ton@arm.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&g=
t;; Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
Subject: Re: [Openembedded-architecture] [yocto] Security processes: YP nee=
ds<br>
<br>
Hi David,<br>
Thank you very much for the description and the offer to get a demo.<br>
As discussed yesterday in the call, there are some other people who<br>
seem interested.<br>
<br>
&gt; PROPOSAL 1: If the full triage is too much to bite off to start with, =
perhaps using it to track and coordinate work will bring immediate benefit.=
<br>
<br>
This is the reason I want to test how much time it takes.<br>
<br>
&gt; PROPOSAL 2: I am happy to give you a live demo of Wind River&#39;s ful=
ly operational SRTool, so you can see all of the bells and whistles in acti=
on. I am available pretty much anytime between 10:00 am Pacific to 2:00 am =
Pacific.<br>
<br>
That would be nice. What about 11am Pacific on tomorrow (28 Sept or<br>
Oct 3)? I think that you have meant 10am to 2PM, otherwise 1am Pacific<br>
would work very well for me too :P<br>
<br>
&gt; PROPOSAL 3: I will start refreshing the YP SRTool repository with my c=
urrent implementation level from Wind River (with the Wind River specific m=
odules left out of course :-)<br>
<br>
That would be great. I&#39;m going to add the missing file for the test<br>
next week, the tool needs a script to download 2023 data.<br>
<br>
Kind regards,<br>
Marta<br>
<br>
On Mon, Sep 25, 2023 at 11:02=E2=80=AFAM Reyna, David via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;david.reyna=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">windriver.com@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Hi Marta,<br>
&gt;<br>
&gt; * SRTool: We might decide to use it again. It allows one to do much bu=
t requires constant commitment.<br>
&gt;<br>
&gt; There are many ways to use the SRTool.<br>
&gt;=C2=A0 =C2=A0(a)=C2=A0 The original design was to perform 100% triage o=
f incoming CVEs. This was a business requirement of Wind River, and we have=
 used the SRTool successfully for 4-5 year now.<br>
&gt;=C2=A0 =C2=A0(b)=C2=A0 The main limitation with the SRTool for Yocto Pr=
oject was the lack of integration with Bugzilla (Ross ran out of time)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * This is the crucial other half of the workflow<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 * There is the automatic creation of appropriate d=
efect records for investigation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * There is also the automatic tracking of the over=
all CVE status, both CVEs in progress and the CVEs completed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Wind River has an extension for full integration=
 with Jira, and that saves weeks of work for the CVE management<br>
&gt;=C2=A0 =C2=A0(c) The guiding rule was that CVE management was in the SR=
Tool, but specific defect work was also done in Jira/Bugzilla, for a clean =
separate of domains<br>
&gt;=C2=A0 =C2=A0(d)=C2=A0 The SRTool has a user model<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Together with Bugzilla, it is easy to track sing=
le people and even multiple people working on CVEs<br>
&gt;=C2=A0 =C2=A0(e) The SRTool also has the built-on ability to look up th=
e CVE status from other distributions (Red Hat, Debian, ...) so that one ca=
n get a peek of existing triages and resolutions<br>
&gt;=C2=A0 =C2=A0(f) The SRTool is build like Toaster on top of Django, so =
development and debugging skills for Toaster immediate apply<br>
&gt;=C2=A0 =C2=A0(g) Also with the Django base, it is very simple to add an=
y number of modular extensions to support for example CVE Scanner integrati=
on<br>
&gt;=C2=A0 =C2=A0(h) The SRTool also has report generation (in text, CSV, a=
nd Excel) in addition to email notification support.<br>
&gt;=C2=A0 =C2=A0(i) There is also a &quot;private&quot; model for CVEs und=
er embargo, with strict access control lists.<br>
&gt;<br>
&gt; PROPOSAL 1: If the full triage is too much to bite off to start with, =
perhaps using it to track and coordinate work will bring immediate benefit.=
<br>
&gt;<br>
&gt; PROPOSAL 2: I am happy to give you a live demo of Wind River&#39;s ful=
ly operational SRTool, so you can see all of the bells and whistles in acti=
on. I am available pretty much anytime between 10:00 am Pacific to 2:00 am =
Pacific.<br>
&gt;<br>
&gt; PROPOSAL 3: I will start refreshing the YP SRTool repository with my c=
urrent implementation level from Wind River (with the Wind River specific m=
odules left out of course :-)<br>
&gt;<br>
&gt; David<br>
&gt;<br>
&gt; BTW, I also support an extension to the SRTool that manages CVE scanni=
ng of build images, with hooks to a=C2=A0 number existing CVE scanners (e.g=
. Trivy) in addition to other vulnerability metrics. This is probably out o=
f scope to YP at this time, but it is perhaps something to grow in to.<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_blank=
" rel=3D"noreferrer">yocto@lists.yoctoproject.org</a> &lt;<a href=3D"mailto=
:yocto@lists.yoctoproject.org" target=3D"_blank" rel=3D"noreferrer">yocto@l=
ists.yoctoproject.org</a>&gt; On Behalf Of Marta Rybczynska via <a href=3D"=
http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&gt; Sent: Wednesday, September 13, 2023 4:52 AM<br>
&gt; To: <a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=3D=
"_blank" rel=3D"noreferrer">yocto-security@lists.yoctoproject.org</a>; OE-c=
ore &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>=
&gt;; <a href=3D"mailto:openembedded-architecture@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">openembedded-architecture@lists.openemb=
edded.org</a>; <a href=3D"mailto:yocto@lists.yoctoproject.org" target=3D"_b=
lank" rel=3D"noreferrer">yocto@lists.yoctoproject.org</a><br>
&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.=
org</a>&gt;; Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=
=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt;; Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.=
khem@gmail.com</a>&gt;; <a href=3D"mailto:mark.hatle@kernel.crashing.org" t=
arget=3D"_blank" rel=3D"noreferrer">mark.hatle@kernel.crashing.org</a>; Ros=
s Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank" rel=
=3D"noreferrer">ross.burton@arm.com</a>&gt;; Joshua Watt &lt;<a href=3D"mai=
lto:JPEWhacker@gmail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@g=
mail.com</a>&gt;<br>
&gt; Subject: [yocto] Security processes: YP needs<br>
&gt;<br>
&gt; Hello,<br>
&gt; I&#39;ve been working recently on collecting what works and what doesn=
&#39;t<br>
&gt; in YP security processes. The goal is to go forward and define an<br>
&gt; actionable strategy!<br>
&gt;<br>
&gt; Today, I&#39;d like to share with you the summary of what I have heard=
 as<br>
&gt; needs from several people (those in Cc:).<br>
&gt;<br>
&gt; I want the community to comment and tell us what you find important<br=
>
&gt; and what you&#39;d like to see added or changed from this list.<br>
&gt;<br>
&gt; * CVEs: Visibility if YP is vulnerable or not<br>
&gt;<br>
&gt; People want to be able to check/look up a specific CVE; it might be a<=
br>
&gt; CVE unrelated to YP<br>
&gt; (eg. package not included, Windows issue). The cve-checker result is a=
<br>
&gt; part of the solution, but people also want to know which CVEs do not<b=
r>
&gt; apply.<br>
&gt;<br>
&gt; * CVEs: synchronization of the work on fixes<br>
&gt;<br>
&gt; Currently, there is no synchronization; multiple parties might be<br>
&gt; working on the same fix while nobody is working on another. There<br>
&gt; might be duplication of work.<br>
&gt; Ross has <a href=3D"https://wiki.yoctoproject.org/wiki/CVE_Status" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/=
wiki/CVE_Status</a><br>
&gt;<br>
&gt; * Triaging of security issues<br>
&gt;<br>
&gt; Related to CVE fixes and includes issues reported directly to the YP.<=
br>
&gt; Some issues are more likely to be serious for embedded products<br>
&gt; (attack by network), so not all has the same priority.<br>
&gt;<br>
&gt; * Private security communication<br>
&gt;<br>
&gt; A way to send a notification of a non-public security issue. For<br>
&gt; researchers, other projects etc.<br>
&gt; The security alias exists, but only some people know about its existen=
ce.<br>
&gt;<br>
&gt; * Visibility of the security work of the YP<br>
&gt;<br>
&gt; There is much work on security in the YP, but it lacks visibility.<br>
&gt;<br>
&gt; * Documentation<br>
&gt;<br>
&gt; Related to visibility. We need easy-to-find documentation of subjects<=
br>
&gt; like submitting a CVE fix,<br>
&gt; reporting a private issue, and how our processes work... This<br>
&gt; documentation should address people who are not regular contributors.<=
br>
&gt;<br>
&gt; * Additional tooling<br>
&gt;<br>
&gt; We could add additional tooling: a template on how to add cve-check to=
<br>
&gt; the CI (possibly<br>
&gt; a different one than the autobuilder), analyze the result, and extend<=
br>
&gt; our tooling to their layers...<br>
&gt; It is also related to the &quot;Architecture&quot; topic below.<br>
&gt;<br>
&gt; * Architecture work<br>
&gt;<br>
&gt; Security if more than CVE fixes. We also have what is happening in<br>
&gt; meta-security: hardening, compiler option,<br>
&gt; secure package configuration, use of code coverage tools, and so on<br=
>
&gt;<br>
&gt; * SRTool<br>
&gt;<br>
&gt; We might decide to use it again. It allows one to do much but requires=
<br>
&gt; constant commitment.<br>
&gt;<br>
&gt; * Presence on pre-notification lists and receiving information before<=
br>
&gt; the vulnerability gets public<br>
&gt;<br>
&gt; YP currently depends on public data. Principal distributions receive<b=
r>
&gt; the information before<br>
&gt; a vulnerability becomes public. It requires (in short) private<br>
&gt; reporting, a security team, and a track<br>
&gt; of excellent security record.<br>
&gt;<br>
&gt; * Becoming a CNA (be able to assign CVEs)<br>
&gt;<br>
&gt; Needed if we want to assign CVEs to the software of the YP, like<br>
&gt; autobuilder, Toaster etc.<br>
&gt;<br>
&gt; Kind regards,<br>
&gt; Marta<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#1775): <a href=3D"https://lists.openembedded.org/g=
/openembedded-architecture/message/1775" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://lists.openembedded.org/g/openembedded-architecture/me=
ssage/1775</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10157067=
0/5827677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/101570670/5827677</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-architecture%2Bowner@lists=
.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-archit=
ecture+owner@lists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
architecture/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-architecture/unsub</a> [<a href=3D"m=
ailto:rybczynska@gmail.com" target=3D"_blank" rel=3D"noreferrer">rybczynska=
@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--0000000000002aa99706065a7953--

