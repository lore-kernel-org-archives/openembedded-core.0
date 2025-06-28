Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4937AC54ED1
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 22:46:16 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.7204.1751150761801315763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jun 2025 15:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zu+r+K3o;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e81f311a86fso2529561276.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 15:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751150761; x=1751755561; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dyERbf0SS+8A/XZX8f0R/ub7uuibDZ85VQNk4nBXyzI=;
        b=Zu+r+K3okNpvgDazHHTkSQYRBmYllisDy9q+41/LgFP3mMbnVlGWiFBYVha5K0b7JU
         sEY581T8wj3VmDHs5dIb2UIoBFenWOIpgtGfs0vUk8JZTnN5cTIrfZLIi5Q3CfhhdRW4
         zhtgKXk0x1qfHJCuFeTK3EHTR+VIb4zYp9ikNcZjvvD9JcFsdO74+Zb8XaRXfz5/l8+y
         dfBTSGbhCfB5IqHLnn0RHbPAn7oED0f6XTQwwEIYrklAIUd2unpQ29uRYD1dznqHrHyB
         kt33aKolQPMZM99CrDWkCdCouVLsuyWVNvalwYcql547U8Zaw/ZLsIkm4HPyQZ7K4Rxg
         vFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751150761; x=1751755561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyERbf0SS+8A/XZX8f0R/ub7uuibDZ85VQNk4nBXyzI=;
        b=pSUCPMh18unB4W7l4xweDFL0d/OqkLFO13J4DjIRwEV0GbbL3XfP6b6JyyboFAKq4l
         690Xu+sLCsjh6R8OAVLU+VftIM2zvHQUERYAe0Ppy4/TJLL5KnZRSDlo6EGdTaT45u7/
         2iS1x/wJZ1iuQDNwQIM2PJ9i2V+DO0TpEsLC38y2gooThmuU1AVUFNDJXiwWfWhb+fWW
         AZLimhGHq+dqTNfA7pzaEjsyZBUBNX0VF3tfgnBXPjzXUrW4P5CVuergpcMVhjZq7/tc
         P0h0pHT45oYB5cLwAGF8rqGiPqUoVEYxSHv/7CP9Bd35XxpYRKeIMSD4IA8dkf5fqLCH
         qaxA==
X-Gm-Message-State: AOJu0YzYMwECYaaKtnOKBGF/dccpINRD/jbHSHWIePde6cL4dPs+5q74
	V4NzNuBNwx9eXQpx8dMCIdwqRMPTAjS6J/uhW+72f1QRjn4n0CD0gVmZD64sa3XVCn3aor80ASs
	4bT5HEJhzjkAHz0qE8kS+h1LdyX/GPYU=
X-Gm-Gg: ASbGnctoPyR3PGgsb0+1EKNtmNFZmK/7LAe4t1JIvzzsRC1n9R+Iuk3WJTqL7+pB0rX
	7ibLw0keTwOYyfMyqJiPFNU+7JFIl25P+n7ioDBBlIHpYIpgZD9rAuBD0Bpxx8EZ5/avtFT4FCB
	Q3zwHp9UXAl90rvku2oXY+4HrNOYlzy45PqJbLCBU1aEZFFA8Sr58yG1CLhmfRNUV1Oj0jrQGaz
	STQ
X-Google-Smtp-Source: AGHT+IF2ZKM0g36zRb4R6OmR3/+z+NvnuSgbBGrqWYJakdbAHnrx6YyIudzp5LwtA1tERaHiP/L3rwqNH6XgPM1/9Mg=
X-Received: by 2002:a05:690c:fd3:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-715171d2bb1mr137722037b3.35.1751150760494; Sat, 28 Jun 2025
 15:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
 <CAMKF1soQgsa46zWKSPD0KyXBF3RG0AooY0TBou4hh4zODTViVw@mail.gmail.com> <b1375659-7802-5af6-709a-4b1e49f345f8@crashcourse.ca>
In-Reply-To: <b1375659-7802-5af6-709a-4b1e49f345f8@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jun 2025 15:45:49 -0700
X-Gm-Features: Ac12FXz-ZRHoHdYXuG7u5bYLTxQkjWlnK2gFNP0-R1sl0lW6OGtjdIrEOFY8q4w
Message-ID: <CAMKF1sp530pZ1mHF8XKbgr2gk8Umyn2U73k40SVmFsuTk0vx3Q@mail.gmail.com>
Subject: Re: [OE-core] should local.conf.sample include qemuriscv* machine
 conf files?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000070a900638a98fc2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 22:46:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219437

--000000000000070a900638a98fc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 12:23=E2=80=AFPM Robert P. J. Day <rpjday@crashcour=
se.ca>
wrote:

> On Sat, 28 Jun 2025, Khem Raj wrote:
>
> > On Fri, Jun 27, 2025 at 6:31=E2=80=AFAM Robert P. J. Day via
> > lists.openembedded.org <rpjday=3Dcrashcourse.ca@lists.openembedded.org>
> > wrote:
> > >
> > >
> > >   i forget if i've asked this before, but should OE's
> > > local.conf.sample be extended to include all of the machines defined
> > > by the OE-core layer? particularly the two qemuriscv*.conf entries?
> > >
> >
> > It does need to be documented and easy to get to especially for new
> > users. So adding would be good if there are no other
> > options being worked on.
>
>   here's what i submitted as a patch:
>
> https://lists.openembedded.org/g/openembedded-core/message/219430
>
> thoughts?


Just adding riscv machines would suffice

>
>
> rday

--000000000000070a900638a98fc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 28, 2025 at 12:23=E2=80=AFP=
M Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@cras=
hcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, =
28 Jun 2025, Khem Raj wrote:<br>
<br>
&gt; On Fri, Jun 27, 2025 at 6:31=E2=80=AFAM Robert P. J. Day via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;rpjday=3D<a href=3D"mailto:crashcou=
rse.ca@lists.openembedded.org" target=3D"_blank">crashcourse.ca@lists.opene=
mbedded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0i forget if i&#39;ve asked this before, but should OE=
&#39;s<br>
&gt; &gt; local.conf.sample be extended to include all of the machines defi=
ned<br>
&gt; &gt; by the OE-core layer? particularly the two qemuriscv*.conf entrie=
s?<br>
&gt; &gt;<br>
&gt;<br>
&gt; It does need to be documented and easy to get to especially for new<br=
>
&gt; users. So adding would be good if there are no other<br>
&gt; options being worked on.<br>
<br>
=C2=A0 here&#39;s what i submitted as a patch:<br>
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/21943=
0" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/219430</a><br>
<br>
thoughts?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Just ad=
ding riscv machines would suffice=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
<br>
rday</blockquote></div></div>

--000000000000070a900638a98fc2--

