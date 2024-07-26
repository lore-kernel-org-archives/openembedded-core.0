Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56045C3DA70
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 13:24:29 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.61346.1722000261299406189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 06:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BHt+dDeG;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cd2f89825fso718277a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722000261; x=1722605061; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BL/Gshc2G6QGSjLFqBbe6MZaDwB0B17Ctmu9djkCAqg=;
        b=BHt+dDeG0xy/sNk+aaS5hjuWyXWkuMm9gC4QIWjzncSGI4+b+KAb/JaxcOfiznNJ2y
         /HxsvmKLhnU1+p6HGPQANJ6sU30ox7J0/VtVRBVDCBqTOSga2aWqqmp5kS50J5jy/qq2
         xhebRcGvzmne8oIMMcihe29lGCNa4tFVKPl1zcK5MZhnhvya2eub3FZ8txxjPLq2YKId
         xc50wAu3KK5lkd5x/0u/5XtWMLZ2OgD7BKkjU2dIvn6TW2N4XAR6GA2ctfThhzk01yC8
         8dCWC7xU7lUB33oe/TtAkcTDe5UNK1Ym+sKsZ4Qnhg1jz64f2VqbxMFv/+ZUWF38okZH
         BlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722000261; x=1722605061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL/Gshc2G6QGSjLFqBbe6MZaDwB0B17Ctmu9djkCAqg=;
        b=IB7tgyLAdv2zthXDxJqYmc866NwsvnNcZEB1qxZL4ANzX48caJrYOomKjcnOQ4Mjxo
         hes4X1NmGgedZTcitux93pi4y/2B1TbE9cUgpVMpCgx/wLlvjLvq7NrlULbQVTeGpzuA
         DqXbW7tSZhmrDlVREIKwPfbJhHwm86uSIAsNnqOhJFbvim0WwbHRHT5sBub5BmDwF4oH
         O7b2ptrnDXoL3Dz5yD7fqbU1PtZ+bTlJN3h0VfimnjSJkFvHaG31kEoAQpoSP6y8pDCi
         wcZlbM/VM6YmjymS5XCOMkQGIRydr/LKf+aML7IJTr0JFRND32Oxc6mxvT/hRmYJJ3Kw
         eJKA==
X-Forwarded-Encrypted: i=1; AJvYcCVwmMEV/are/moOCOtZkkU0Pyt6LpBhwTD+y4qzp7VhPvfNXd7puzePRLHrPncBKaOghjV43S0KH//oX+xC2qFTt9NU1C5hLIC7LCFVZGxdoqVURuzO2hDC
X-Gm-Message-State: AOJu0YwfNnyE0d9jTH27O5l4RrM5lbE5uoKX3M4XKTmX3jBoSmwwuoow
	EEBUi+ghbQGihhlhi8/08HycDVL8hzkHrEmntbuTyWUcTQWCzPnuXkbiofa/FB/iMYurbvYM43M
	Ns26dnI1vFtsFpzykoIZvFj5+FtA=
X-Google-Smtp-Source: AGHT+IEqZOQDWHb4atCYxAy6QGUBa6gYAbpuK9aYksJzVAwgGreMavKxGtw/+L2gRPYqlyjRDdWXpkuPSg+7pYZCqUU=
X-Received: by 2002:a17:90b:3009:b0:2c4:dcf6:2130 with SMTP id
 98e67ed59e1d1-2cf2eb21043mr5514547a91.32.1722000260601; Fri, 26 Jul 2024
 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240724044505.3345411-1-dnagodra@cisco.com> <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
 <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
 <CAApg2=Q2pLxPL0EXH1URPBACknO9Gz0R1Ux_mK8Lp3p5H5zvpA@mail.gmail.com>
 <078214f14849ba7ca8f5017ebdeed1dc66cf91c8.camel@linuxfoundation.org> <SN7PR11MB69711F1E679AA519A862338AD4AB2@SN7PR11MB6971.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB69711F1E679AA519A862338AD4AB2@SN7PR11MB6971.namprd11.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 26 Jul 2024 15:24:08 +0200
Message-ID: <CAApg2=RRt6T6JN4=eomMx4s1cvL8S6r+-asr7D5qFRPR+j4erw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
To: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)" <dnagodra@cisco.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000d6216a061e266d76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 13:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202539

--000000000000d6216a061e266d76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 7:50=E2=80=AFAM Dhairya Nagodra -X (dnagodra - E-IN=
FO CHIPS
INC at Cisco) <dnagodra@cisco.com> wrote:

>
>
> >-----Original Message-----
> >From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >Sent: Thursday, July 25, 2024 3:44 AM
> >To: Marta Rybczynska <rybczynska@gmail.com>
> >Cc: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> ><dnagodra@cisco.com>; Marko, Peter <Peter.Marko@siemens.com>;
> >openembedded-core@lists.openembedded.org; xe-linux-external(mailer list)
> ><xe-linux-external@cisco.com>
> >Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
> >"Unpatched" status
> >
> >On Wed, 2024-07-24 at 18:10 +0200, Marta Rybczynska wrote:
> >> On Wed, Jul 24, 2024 at 10:46=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> ><richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >> >
> >> > This is far from straightforward unfortunately.
> >> >
> >>
> >>
> >> I agree and also agree with Dhairya. We are facing the same issue
> within the
> >VEX work.
> >> And this is going to come back in the context of the CRA.
> >>
> >> >
> >> > Some people are using these lists as "are there any issues we need
> >> > to worry about?".
> >> >
> >> > In that context, if an upstream has assessed a CVE and decided
> >> > nothing need be done about it, our decision to "ignore" it is
> >> > correct as there is nothing to be done.
> >> >
> >>
> >>
> >> The project might have decided not to fix for multiple reasons. Some
> >> of them may be good, some not.
> >>
> >> I do not completely agree that there is nothing to be done. We might
> >> decide to use a configuration option that disables the vulnerable
> >> feature. In this case there is an appropriate status to put. We can do
> >> an in-depth analysis and figure out if the vulnerable code can be
> >> reached in our configuration. If not, there is an appropriate status t=
o
> put.
> >
> >I'm working on the assumption that if either of those two things were th=
e
> case,
> >we'd have done them in preference to the wontfix status. The wontfix
> status is
> >the last resort where upstream disagrees there is an issue or that the
> issue is
> >an actual problem.
>
> As per my understanding, we have 'disputed' status for the above mentione=
d
> scenarios.
> (Where upstream disagrees, or they don't consider issue a problem)
>
> Below is the snippet from the current cve-check-map.conf
> # use when upstream does not accept the report as a vulnerability (e.g.
> works as designed)
> CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
> # use when upstream *acknowledged* the vulnerability but does not plan to
> fix it
> CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"
>

upstream-wontfix and disputed is far from the same thing at the CVE
Programme level.
"disputed" is a flag of the CVE entry (at least for the most recent ones)
and it will be
possible to attach it automatically. However, it still means a vendor
analysis is needed
to decide which side of the dispute you agree with...

Kind regards,
Marta

--000000000000d6216a061e266d76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2024 at 7:50=E2=80=AF=
AM Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco) &lt;<a href=3D=
"mailto:dnagodra@cisco.com">dnagodra@cisco.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt;-----Original Message-----<br>
&gt;From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;Sent: Thursday, July 25, 2024 3:44 AM<br>
&gt;To: Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" target=
=3D"_blank">rybczynska@gmail.com</a>&gt;<br>
&gt;Cc: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)<br>
&gt;&lt;<a href=3D"mailto:dnagodra@cisco.com" target=3D"_blank">dnagodra@ci=
sco.com</a>&gt;; Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com=
" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;;<br>
&gt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a>; xe-linux-external(mail=
er list)<br>
&gt;&lt;<a href=3D"mailto:xe-linux-external@cisco.com" target=3D"_blank">xe=
-linux-external@cisco.com</a>&gt;<br>
&gt;Subject: Re: [OE-core] [PATCH] cve-check-map: Move &#39;upstream-wontfi=
x&#39; to<br>
&gt;&quot;Unpatched&quot; status<br>
&gt;<br>
&gt;On Wed, 2024-07-24 at 18:10 +0200, Marta Rybczynska wrote:<br>
&gt;&gt; On Wed, Jul 24, 2024 at 10:46=E2=80=AFAM Richard Purdie via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a><br>
&gt;&lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openem=
bedded.org" target=3D"_blank">linuxfoundation.org@lists.openembedded.org</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is far from straightforward unfortunately.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I agree and also agree with Dhairya. We are facing the same issue =
within the<br>
&gt;VEX work.<br>
&gt;&gt; And this is going to come back in the context of the CRA.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Some people are using these lists as &quot;are there any issu=
es we need<br>
&gt;&gt; &gt; to worry about?&quot;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In that context, if an upstream has assessed a CVE and decide=
d<br>
&gt;&gt; &gt; nothing need be done about it, our decision to &quot;ignore&q=
uot; it is<br>
&gt;&gt; &gt; correct as there is nothing to be done.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The project might have decided not to fix for multiple reasons. So=
me<br>
&gt;&gt; of them may be good, some not.<br>
&gt;&gt;<br>
&gt;&gt; I do not completely agree that there is nothing to be done. We mig=
ht<br>
&gt;&gt; decide to use a configuration option that disables the vulnerable<=
br>
&gt;&gt; feature. In this case there is an appropriate status to put. We ca=
n do<br>
&gt;&gt; an in-depth analysis and figure out if the vulnerable code can be<=
br>
&gt;&gt; reached in our configuration. If not, there is an appropriate stat=
us to put.<br>
&gt;<br>
&gt;I&#39;m working on the assumption that if either of those two things we=
re the case,<br>
&gt;we&#39;d have done them in preference to the wontfix status. The wontfi=
x status is<br>
&gt;the last resort where upstream disagrees there is an issue or that the =
issue is<br>
&gt;an actual problem.<br>
<br>
As per my understanding, we have &#39;disputed&#39; status for the above me=
ntioned scenarios.<br>
(Where upstream disagrees, or they don&#39;t consider issue a problem)<br>
<br>
Below is the snippet from the current cve-check-map.conf<br>
# use when upstream does not accept the report as a vulnerability (e.g. wor=
ks as designed)<br>
CVE_CHECK_STATUSMAP[disputed] =3D &quot;Ignored&quot;<br>
# use when upstream *acknowledged* the vulnerability but does not plan to f=
ix it<br>
CVE_CHECK_STATUSMAP[upstream-wontfix] =3D &quot;Ignored&quot;<br></blockquo=
te><div><br></div><div>upstream-wontfix and disputed is far from the same t=
hing at the CVE Programme level.</div><div>&quot;disputed&quot; is a flag o=
f the CVE entry (at least for the most recent ones) and it will be</div><di=
v>possible to attach it automatically. However, it still means a vendor ana=
lysis is needed</div><div>to decide which side of the dispute you agree wit=
h...</div><div><br></div><div>Kind regards,</div><div>Marta <br></div></div=
></div>

--000000000000d6216a061e266d76--

