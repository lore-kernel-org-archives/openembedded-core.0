Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B426C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 13:21:59 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.61297.1722000115474228385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 06:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mrqtJw1u;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc49c0aaffso5646595ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722000115; x=1722604915; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X2FZQj5lqtRUKDgYTnUPXwNsPWJmfQvYx5Em58/jg/I=;
        b=mrqtJw1ufkq3OyvZBPsZkidh4pPhICWi/FubtsqpOmfhoPrqTRZAY1WpYo8xzAQZJq
         gDNGMRniXeW1VK/ZgQdHJ3nLSYWGIwYk0PP29de/OTInmNO8nUt/02zjL4FuWJl8ju4x
         AL5JhdF+fUY9Ga4gDPICLDuMwKsaUF+Mb32cKGTP4TWL8FwgX7qhfud1gEJkQr8kcutr
         ZdNIPngmbJ9Fj7O5ogvgPIlktYSAHUIrlLZMreBnvjbyLFolCezB0QqcuJYA+RacZvNx
         0kqJG7Ngqyy0VQdg6x/IT/QCioqkSQg7hCyfgl1BrjvoKyofYDdtWaaGn0R2+3TjgWR+
         Z7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722000115; x=1722604915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2FZQj5lqtRUKDgYTnUPXwNsPWJmfQvYx5Em58/jg/I=;
        b=W9z1MYYkkPL52ArNHVks/wsBDuSDB9nIEPp+Ko3pZxcC7RpvSmy2C7FNRDibt2sNyc
         fobx+k/j2kVPuLuvmfoFnSXy6Y5G+4FRF/GTP+WDzS+vut8Rjn8HP25n+zhWr2Y/OCkQ
         4YpnP0NnMvzBeYKqUUZXm0vDW6KJx4NpbquXKRIwOoTONgB8uEza2810rPlOnaDBAB/F
         C68kDkf1SkYlYga1ceIp6etMbnNnNxg7P4Ql6m/XfFZj/Tl7e+afMt9c1SGluSkWPk51
         +w44HmwHyW8oNWTtrwb4qQF2wZiRx3/DdueeeqH1HobQ6WdqkXgcMYzM1XPJl6Ylo2ca
         ORMw==
X-Forwarded-Encrypted: i=1; AJvYcCVt3uBR/q7gW4f8ziH31AHwJuy7mvyqQo5qsrvfEVepuYtqmslWFtmpB3o8X3oepTzxjT7y/vdxMDyMQCCiXVMbXkwzg7x8MnHgL1OQIEnPnmNZdpOioWXc
X-Gm-Message-State: AOJu0YzbvrnMcqMAFw/psmnR/eClwuKH42PZpgpk2azOoTB//EKFT0IT
	b/Z1s8jwm9Hy60f3PMnq4JzPCz6ZO3sXwZBvmVDav2udpWjj1z35aiQoqFoUvanmmIUXHaGcWzy
	PeZpBIDne16tqEPDhE0Ih07SKV+E=
X-Google-Smtp-Source: AGHT+IGr4oKGnQDiBzRpc/njnuwPcnguxXVOKrvwZ4sMKJI1xF0natsBQpugYNnAJG0unr9AXudINT6uA/6rXyEQd/U=
X-Received: by 2002:a17:903:947:b0:1fd:d6d8:133e with SMTP id
 d9443c01a7336-1fed923dadfmr50328205ad.14.1722000114608; Fri, 26 Jul 2024
 06:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240724044505.3345411-1-dnagodra@cisco.com> <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
 <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
 <CAApg2=Q2pLxPL0EXH1URPBACknO9Gz0R1Ux_mK8Lp3p5H5zvpA@mail.gmail.com> <078214f14849ba7ca8f5017ebdeed1dc66cf91c8.camel@linuxfoundation.org>
In-Reply-To: <078214f14849ba7ca8f5017ebdeed1dc66cf91c8.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 26 Jul 2024 15:21:41 +0200
Message-ID: <CAApg2=QNzzkmywDVqRnPaRCSYoUZr5Tp83X4xqKRxKQ2b+LzTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: dnagodra@cisco.com, "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000227b54061e26652c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 13:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202538

--000000000000227b54061e26652c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:13=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2024-07-24 at 18:10 +0200, Marta Rybczynska wrote:
> > On Wed, Jul 24, 2024 at 10:46=E2=80=AFAM Richard Purdie via
> lists.openembedded.org <richard.purdie=3D
> linuxfoundation.org@lists.openembedded.org> wrote:
> > >
> > > This is far from straightforward unfortunately.
> > >
> >
> >
> > I agree and also agree with Dhairya. We are facing the same issue withi=
n
> the VEX work.
> > And this is going to come back in the context of the CRA.
> >
> > >
> > > Some people are using these lists as "are there any issues we need to
> > > worry about?".
> > >
> > > In that context, if an upstream has assessed a CVE and decided nothin=
g
> > > need be done about it, our decision to "ignore" it is correct as ther=
e
> > > is nothing to be done.
> > >
> >
> >
> > The project might have decided not to fix for multiple reasons. Some of
> them
> > may be good, some not.
> >
> > I do not completely agree that there is nothing to be done. We might
> decide to
> > use a configuration option that disables the vulnerable feature. In thi=
s
> case there
> > is an appropriate status to put. We can do an in-depth analysis and
> figure out
> > if the vulnerable code can be reached in our configuration. If not,
> there is an
> > appropriate status to put.
>
> I'm working on the assumption that if either of those two things were
> the case, we'd have done them in preference to the wontfix status. The
> wontfix status is the last resort where upstream disagrees there is an
> issue or that the issue is an actual problem.
>

In our case, the big part of "wontfix" is the "bdb" abandoned package.
The action here would be to finish removing this dependency. I can also
see some of the wontfix that can be re-qualified.


>
> In those situations, there isn't much we can do. The status is spelt
> out separately so anyone wanting to find this "class" of problems can.
> How they want to map and export that into lossy formats is up to the
> user and configurable.
>
> The only "decision" we're making is that we won't show that status as
> "open" on our standard lists as someone has looked at it and decided
> there isn't anything to be done (or can be done).
>

I think it is a good idea to tag them, so that people do not re-do the whol=
e
analysis.


>
> > > On the other hand, the CVE is open and unpatched, so listing it as
> > > unmitigated is also correct in some senses. The problem is that there
> > > is no planned way of moving forward with the CVE, so it will sit in a
> > > list of other "unpatched" CVEs and this dilutes the value of the list
> > > as you can't tell which ones are being rejected by upstream as wontfi=
x
> > > and which ones are real and need attention.
> > >
> > > We knew that people would have different views and needs on how to
> > > handle this, which is precisely why the mapping variables exist. You
> > > can certainly configure this according to your needs and this may be =
a
> > > case where you'd need to do that as there isn't going to be a 100%
> > > right answer we can have.
> > >
> >
> >
> > I think the problem here is that we had used the "Ignored" status for
> multiple
> > reasons in the past, also to avoid having a look multiple times at the
> same
> > issue.
> >
> > Again, the CRA is formal here, and downstreams will need to re-analyse
> all
> > those issues (or disable affected recipes). Either downstreams, or we
> will
> > do it all together.... (which is a better option IMO).
> >
> > There's the same issue with some other statuses like 'disputed'.
>
> Your argument appears to be that we aren't in a position to make any
> decision on the status of any CVE and we can't share this work, it has
> to be pushed to the end user to do on their own and the CRM mandates
> that?
>
>
Under the CRA, this is the manufacturer distributing their product that is
responsible. As they won't be able to release with unfixed CVEs, they
will need to resolve the issue in some way (a local fix, disable a
configuration
option, do an analysis showing that this code will never be executed etc).
Even if the upstream refuses their fix, they need to ship clean.

Some minor details of the CRA might change, but the above won't - this is
the main idea behind this legislation. Simply "upstream won't fix this"
won't
be a valid answer.

We can chat about the impact on Tuesday or do a separate call if it makes
sense.

Kind regards,
Marta

--000000000000227b54061e26652c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2024 at 12:13=E2=80=
=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 2024-07-24 at 18:10 +0200, Ma=
rta Rybczynska wrote:<br>
&gt; On Wed, Jul 24, 2024 at 10:46=E2=80=AFAM Richard Purdie via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation=
.org@lists.openembedded.org" target=3D"_blank">linuxfoundation.org@lists.op=
enembedded.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; This is far from straightforward unfortunately.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I agree and also agree with Dhairya. We are facing the same issue with=
in the VEX work.<br>
&gt; And this is going to come back in the context of the CRA.<br>
&gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; Some people are using these lists as &quot;are there any issues w=
e need to<br>
&gt; &gt; worry about?&quot;.<br>
&gt; &gt; <br>
&gt; &gt; In that context, if an upstream has assessed a CVE and decided no=
thing<br>
&gt; &gt; need be done about it, our decision to &quot;ignore&quot; it is c=
orrect as there<br>
&gt; &gt; is nothing to be done.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The project might have decided not to fix for multiple reasons. Some o=
f them<br>
&gt; may be good, some not.<br>
&gt; <br>
&gt; I do not completely agree that there is nothing to be done. We might d=
ecide to<br>
&gt; use a configuration option that disables the vulnerable feature. In th=
is case there<br>
&gt; is an appropriate status to put. We can do an in-depth analysis and fi=
gure out<br>
&gt; if the vulnerable code can be reached in our configuration. If not, th=
ere is an<br>
&gt; appropriate status to put.<br>
<br>
I&#39;m working on the assumption that if either of those two things were<b=
r>
the case, we&#39;d have done them in preference to the wontfix status. The<=
br>
wontfix status is the last resort where upstream disagrees there is an<br>
issue or that the issue is an actual problem.<br></blockquote><div><br></di=
v><div>In our case, the big part of &quot;wontfix&quot; is the &quot;bdb&qu=
ot; abandoned package.</div><div>The action here would be to finish removin=
g this dependency. I can also</div><div>see some of the wontfix that can be=
 re-qualified.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
In those situations, there isn&#39;t much we can do. The status is spelt<br=
>
out separately so anyone wanting to find this &quot;class&quot; of problems=
 can.<br>
How they want to map and export that into lossy formats is up to the<br>
user and configurable.<br>
<br>
The only &quot;decision&quot; we&#39;re making is that we won&#39;t show th=
at status as<br>
&quot;open&quot; on our standard lists as someone has looked at it and deci=
ded<br>
there isn&#39;t anything to be done (or can be done).<br></blockquote><div>=
<br></div><div>I think it is a good idea to tag them, so that people do not=
 re-do the whole</div><div>analysis.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; On the other hand, the CVE is open and unpatched, so listing it a=
s<br>
&gt; &gt; unmitigated is also correct in some senses. The problem is that t=
here<br>
&gt; &gt; is no planned way of moving forward with the CVE, so it will sit =
in a<br>
&gt; &gt; list of other &quot;unpatched&quot; CVEs and this dilutes the val=
ue of the list<br>
&gt; &gt; as you can&#39;t tell which ones are being rejected by upstream a=
s wontfix<br>
&gt; &gt; and which ones are real and need attention.<br>
&gt; &gt; <br>
&gt; &gt; We knew that people would have different views and needs on how t=
o<br>
&gt; &gt; handle this, which is precisely why the mapping variables exist. =
You<br>
&gt; &gt; can certainly configure this according to your needs and this may=
 be a<br>
&gt; &gt; case where you&#39;d need to do that as there isn&#39;t going to =
be a 100%<br>
&gt; &gt; right answer we can have.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I think the problem here is that we had used the &quot;Ignored&quot; s=
tatus for multiple<br>
&gt; reasons in the past, also to avoid having a look multiple times at the=
 same<br>
&gt; issue.<br>
&gt; <br>
&gt; Again, the CRA is formal here, and downstreams will need to re-analyse=
 all<br>
&gt; those issues (or disable affected recipes). Either downstreams, or we =
will<br>
&gt; do it all together.... (which is a better option IMO).<br>
&gt;<br>
&gt; There&#39;s the same issue with some other statuses like &#39;disputed=
&#39;.<br>
<br>
Your argument appears to be that we aren&#39;t in a position to make any<br=
>
decision on the status of any CVE and we can&#39;t share this work, it has<=
br>
to be pushed to the end user to do on their own and the CRM mandates<br>
that?<br>
<br></blockquote><div><br></div><div>Under the CRA, this is the manufacture=
r distributing their product that is</div><div>responsible. As they won&#39=
;t be able to release with unfixed CVEs, they</div><div>will need to resolv=
e the issue in some way (a local fix, disable a configuration</div><div>opt=
ion, do an analysis showing that this code will never be executed etc).</di=
v><div>Even if the upstream refuses their fix, they need to ship clean. <br=
></div><div><br></div><div>Some minor details of the CRA might change, but =
the above won&#39;t - this is</div><div>the main idea behind this legislati=
on. Simply &quot;upstream won&#39;t fix this&quot; won&#39;t<br></div><div>=
be a valid answer.</div><div><br></div><div>We can chat about the impact on=
 Tuesday or do a separate call if it makes</div><div>sense.<br></div><div><=
br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--000000000000227b54061e26652c--

