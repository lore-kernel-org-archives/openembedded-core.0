Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215C6C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:10:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14671.1721837432204950820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Clo2xyo+;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc47abc040so15452295ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721837431; x=1722442231; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nNNUWGd5GF0wX3I3fYdCH3Kqelby6DkLC84JHm5Zis=;
        b=Clo2xyo+XCUIUa7lZ/606Vy1lsRcgNsLlhWZUibuj4XDAyL0xr7JBdvIJaID2z9sw+
         h1oDpgan+JgJpXbhgpkCxmMe9u5w5a46hdmzz4W7vdCeSoxrOFqTsy6AqJ+WcsLP7dcv
         l25S+rt8cfNgJOwXa7B3DF2vstHKMJyW4du56bNAhY5iXJnl/hFtshmLY8x6fDKf1KTv
         NNk6EK0VYj8DxJNto4Qne7Jjcgp/gYv9bEWOhLxg4ydbT8ZeB+DEvWs7Z17b3Ese+LxY
         xss9luE5VGXRSK7PWCvPjzYTJYvMqprXCQLLXho+iaWHCQI4Ep6t5IOwuFckdLOznDKS
         Hfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837431; x=1722442231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nNNUWGd5GF0wX3I3fYdCH3Kqelby6DkLC84JHm5Zis=;
        b=cf8TfQ8SCAmWrQh2BMVz/6bm7vt3GmObGFHUiCv63rs55ykyDk/M0urh3SibQhlnQr
         bYt3w90du3TRDa3vUgPXzBn0GcQzh1Vu/Ug00TnSVXJjCcDnMcQHvlaP6MWUpJzeqhmd
         Ta/kl3M3rgk972a2eS2scW5KTKVKUbotlOvzKXZITGIZoijxrI4hSh/f79srOyWpVhOX
         uAJ/XXdJ5gQn/QetDLtNWDuYNDPskeHJEC50gxhMhgbSUsebnplLs9sF//wgcBbBR9TE
         lA+9W9h8/jCivkNAUXxi52Cxll7dIPhgwitxKJtJJwDFwNjhzmYZAUQw1zMpiXHvfulE
         n4MA==
X-Forwarded-Encrypted: i=1; AJvYcCUidz/H8pi0aTET1S2rQCjxKQstnYj3v3yemibEWpUMYQvwSBOVm4kaJE6Eyqx1zL8g4/NvtHgEBd/hgVuEmSQNz3BEECipaZ5INbxshIFiqBQwri8Vlo39
X-Gm-Message-State: AOJu0YyRqMuxFdbWjyVRm/L1O6By/SJLVWKYPgFzTiJs4hl6S7WsuDu+
	9SVoEsXzaCz9nl3eIvhVHE5Bpl7fKwxjjyWigg1FYOQx5hWgAwiEXy9rv+Bi5LqnVPOQPxtP2qz
	DYOV4DdWeWNQ4wB22J25L8VScbow=
X-Google-Smtp-Source: AGHT+IFmkp23wuCQHd23mf66h9TlT2I9B1gd5ZaxtfO2DxrtuWIW32O1ULzva/dlYU2b9ixe9CCQSjpkef+gH2j90OU=
X-Received: by 2002:a17:903:2283:b0:1fd:927e:7d1e with SMTP id
 d9443c01a7336-1fed389de50mr329035ad.26.1721837431299; Wed, 24 Jul 2024
 09:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240724044505.3345411-1-dnagodra@cisco.com> <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <SN7PR11MB6971246F61B1A502B2D20391D4AA2@SN7PR11MB6971.namprd11.prod.outlook.com>
 <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
In-Reply-To: <f54a3d6f471e2e612e693e79d0ef351d6274357d.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 24 Jul 2024 18:10:19 +0200
Message-ID: <CAApg2=Q2pLxPL0EXH1URPBACknO9Gz0R1Ux_mK8Lp3p5H5zvpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
To: richard.purdie@linuxfoundation.org
Cc: dnagodra@cisco.com, "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="0000000000007427f0061e008423"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202463

--0000000000007427f0061e008423
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:46=E2=80=AFAM Richard Purdie via lists.openembed=
ded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Wed, 2024-07-24 at 06:51 +0000, Dhairya Nagodra via
> lists.openembedded.org wrote:
> >
> >
> > > -----Original Message-----
> > > From: Marko, Peter <Peter.Marko@siemens.com>
> > > Sent: Wednesday, July 24, 2024 12:04 PM
> > > To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)
> > > <dnagodra@cisco.com>; openembedded-core@lists.openembedded.org
> > > Cc: xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> > > Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix'
> to
> > > "Unpatched" status
> > >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> > > lists.openembedded.org
> > > Sent: Wednesday, July 24, 2024 6:45
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
> > > Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
> > > "Unpatched" status
> > >
> > > > - The 'upstream-wontfix' is to be used when the CVE is accepted by
> the
> > > >   upstream, but they are not planning to fix it.
> > > > - If the version used in Yocto is vulnerable, it should not have
> > > >   "Ignored" status. The package is still exploitable by the CVE.
> > > > - Also, when the status is exported out of the SDK, it would be
> > > >   incorrect to put it under Ignored catgory.
> > >
> > > The purpose of this entry is to remove meaningless CVEs from reports
> so that
> > > users don't spend countless hours over and over again on analyzing
> "open"
> > > CVEs if they were already closed upstream.
> >
> > I understand the need to remove the meaningless CVEs from the report an=
d
> prevention of re-analysing the CVEs.
> > And for that exact reason we have the CVE_STATUS, the CVEs would be
> reported as vulnerable or "open" yes, but the previous analysis would als=
o
> be present in CVE_STATUS.
> > This should give the context to the person and not requiring them to
> re-analyse the CVE.
> >
> > Also, I would re-iterate the point that when the status of CVEs is
> exported out of the SDK, they would be falsely reported under 'Ignored'
> category.
>
> This is far from straightforward unfortunately.
>

I agree and also agree with Dhairya. We are facing the same issue within
the VEX work.
And this is going to come back in the context of the CRA.


>
> Some people are using these lists as "are there any issues we need to
> worry about?".
>
> In that context, if an upstream has assessed a CVE and decided nothing
> need be done about it, our decision to "ignore" it is correct as there
> is nothing to be done.
>

The project might have decided not to fix for multiple reasons. Some of the=
m
may be good, some not.

I do not completely agree that there is nothing to be done. We might decide
to
use a configuration option that disables the vulnerable feature. In this
case there
is an appropriate status to put. We can do an in-depth analysis and figure
out
if the vulnerable code can be reached in our configuration. If not, there
is an
appropriate status to put.



>
> On the other hand, the CVE is open and unpatched, so listing it as
> unmitigated is also correct in some senses. The problem is that there
> is no planned way of moving forward with the CVE, so it will sit in a
> list of other "unpatched" CVEs and this dilutes the value of the list
> as you can't tell which ones are being rejected by upstream as wontfix
> and which ones are real and need attention.
>
> We knew that people would have different views and needs on how to
> handle this, which is precisely why the mapping variables exist. You
> can certainly configure this according to your needs and this may be a
> case where you'd need to do that as there isn't going to be a 100%
> right answer we can have.
>

I think the problem here is that we had used the "Ignored" status for
multiple
reasons in the past, also to avoid having a look multiple times at the same
issue.

Again, the CRA is formal here, and downstreams will need to re-analyse all
those issues (or disable affected recipes). Either downstreams, or we will
do it all together.... (which is a better option IMO).

There's the same issue with some other statuses like 'disputed'.

Kind regards,
Marta

--0000000000007427f0061e008423
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 24, 2024 at 10:46=E2=80=
=AFAM Richard Purdie via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.o=
rg@lists.openembedded.org">linuxfoundation.org@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, 2024-07-24 at 06:51 +0000, Dhairya Nagodra via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com"=
 target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; &gt; Sent: Wednesday, July 24, 2024 12:04 PM<br>
&gt; &gt; To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)<br>
&gt; &gt; &lt;<a href=3D"mailto:dnagodra@cisco.com" target=3D"_blank">dnago=
dra@cisco.com</a>&gt;; <a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Cc: xe-linux-external(mailer list) &lt;<a href=3D"mailto:xe-linux=
-external@cisco.com" target=3D"_blank">xe-linux-external@cisco.com</a>&gt;<=
br>
&gt; &gt; Subject: RE: [OE-core] [PATCH] cve-check-map: Move &#39;upstream-=
wontfix&#39; to<br>
&gt; &gt; &quot;Unpatched&quot; status<br>
&gt; &gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a>=C2=A0&lt;op=
enembedded-<br>
&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">=
core@lists.openembedded.org</a>&gt; On Behalf Of Dhairya Nagodra via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; Sent: Wednesday, July 24, 2024 6:45<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Cc: <a href=3D"mailto:xe-linux-external@cisco.com" target=3D"_bla=
nk">xe-linux-external@cisco.com</a>; Dhairya Nagodra &lt;<a href=3D"mailto:=
dnagodra@cisco.com" target=3D"_blank">dnagodra@cisco.com</a>&gt;<br>
&gt; &gt; Subject: [OE-core] [PATCH] cve-check-map: Move &#39;upstream-wont=
fix&#39; to<br>
&gt; &gt; &quot;Unpatched&quot; status<br>
&gt; &gt; <br>
&gt; &gt; &gt; - The &#39;upstream-wontfix&#39; is to be used when the CVE =
is accepted by the<br>
&gt; &gt; &gt; =C2=A0 upstream, but they are not planning to fix it.<br>
&gt; &gt; &gt; - If the version used in Yocto is vulnerable, it should not =
have<br>
&gt; &gt; &gt; =C2=A0 &quot;Ignored&quot; status. The package is still expl=
oitable by the CVE.<br>
&gt; &gt; &gt; - Also, when the status is exported out of the SDK, it would=
 be<br>
&gt; &gt; &gt; =C2=A0 incorrect to put it under Ignored catgory.<br>
&gt; &gt; <br>
&gt; &gt; The purpose of this entry is to remove meaningless CVEs from repo=
rts so that<br>
&gt; &gt; users don&#39;t spend countless hours over and over again on anal=
yzing &quot;open&quot;<br>
&gt; &gt; CVEs if they were already closed upstream.<br>
&gt; <br>
&gt; I understand the need to remove the meaningless CVEs from the report a=
nd prevention of re-analysing the CVEs.<br>
&gt; And for that exact reason we have the CVE_STATUS, the CVEs would be re=
ported as vulnerable or &quot;open&quot; yes, but the previous analysis wou=
ld also be present in CVE_STATUS.<br>
&gt; This should give the context to the person and not requiring them to r=
e-analyse the CVE.<br>
&gt; <br>
&gt; Also, I would re-iterate the point that when the status of CVEs is exp=
orted out of the SDK, they would be falsely reported under &#39;Ignored&#39=
; category.<br>
<br>
This is far from straightforward unfortunately.<br></blockquote><div><br></=
div><div>I agree and also agree with Dhairya. We are facing the same issue =
within the VEX work.</div><div>And this is going to come back in the contex=
t of the CRA.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Some people are using these lists as &quot;are there any issues we need to<=
br>
worry about?&quot;.<br>
<br>
In that context, if an upstream has assessed a CVE and decided nothing<br>
need be done about it, our decision to &quot;ignore&quot; it is correct as =
there<br>
is nothing to be done.<br></blockquote><div><br></div><div>The project migh=
t have decided not to fix for multiple reasons. Some of them</div><div>may =
be good, some not.</div><div><br></div><div>I do not completely agree that =
there is nothing to be done. We might decide to</div><div>use a configurati=
on option that disables the vulnerable feature. In this case there</div><di=
v>is an appropriate status to put. We can do an in-depth analysis and figur=
e out</div><div>if the vulnerable code can be reached in our configuration.=
 If not, there is an</div><div>appropriate status to put.<br></div><div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On the other hand, the CVE is open and unpatched, so listing it as<br>
unmitigated is also correct in some senses. The problem is that there<br>
is no planned way of moving forward with the CVE, so it will sit in a<br>
list of other &quot;unpatched&quot; CVEs and this dilutes the value of the =
list<br>
as you can&#39;t tell which ones are being rejected by upstream as wontfix<=
br>
and which ones are real and need attention.<br>
<br>
We knew that people would have different views and needs on how to<br>
handle this, which is precisely why the mapping variables exist. You<br>
can certainly configure this according to your needs and this may be a<br>
case where you&#39;d need to do that as there isn&#39;t going to be a 100%<=
br>
right answer we can have.<br></blockquote><div><br></div><div>I think the p=
roblem here is that we had used the &quot;Ignored&quot; status for multiple=
</div><div>reasons in the past, also to avoid having a look multiple times =
at the same</div><div>issue.</div><div><br></div><div>Again, the CRA is for=
mal here, and downstreams will need to re-analyse all</div><div>those issue=
s (or disable affected recipes). Either downstreams, or we will</div><div>d=
o it all together.... (which is a better option IMO).</div><div><br></div><=
div>There&#39;s the same issue with some other statuses like &#39;disputed&=
#39;.</div><div><br></div><div>Kind regards,</div><div>Marta<br></div><div>=
<br></div><div>=C2=A0</div></div></div>

--0000000000007427f0061e008423--

