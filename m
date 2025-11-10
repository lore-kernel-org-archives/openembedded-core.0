Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1D2CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 15:29:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50694.1762788571550533212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 07:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PXgNV0a8;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7af603c06easo2895102b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762788571; x=1763393371; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obziyYb7Xwe1kDlFOeFGrKWMkwgWdQzRJf/qdE0GJe0=;
        b=PXgNV0a8Sv6Uz+iSeRXiyLTfjS3coLBFPL26NjSaewp0MkzSTcJxhE3dtZM1pVrMsI
         fh3Ktvx1lW61I1K2SsE3DtTSQJPY5akOh4sEDhuPxqw4RlGDXop5tMtzTot1dMDvswVe
         9MZBd3DmN6XsPp4WCrLcAIqU4L2JAT3fWkcnUMFxEKsvDTL8m39Dx990Zynqf0XuxjqZ
         f0KlpKo2KuwaB56L19Py0xpGK+BtCjeqM3K8OrCcyXdtrYuemlMlTd0gVYNSb12r0mT8
         18Uy2xq4XyQReMtmiyBZYytONh57XGhW61QiqAM+nIoOXGW07yd+1EXuWa6q40M3+K6L
         me6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788571; x=1763393371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obziyYb7Xwe1kDlFOeFGrKWMkwgWdQzRJf/qdE0GJe0=;
        b=u65IiPdqauNnD2ljxFX8aKaqTKahT+3ycivStm7aJY1vx3Y8AtMSirmewLjZ+hh+3B
         F8iOfRFo8RHM6qSgDrD+9VUwjM46MwkMnP/ceZY4xAXN1UKNxoLQgr4lop4Li6Dxaj6s
         ajHH3bLCDU6VZpCXOYqVJZ/DcGCqov1n4iXqenAo7W6QQ6ANpxXuOKYTxn+Vvu5ObrP3
         BdB+4LL6ZJyuvfITPc50tyvh3tA9itKwjHKOm5R5uxGM6uadMloECSphhDGTHdtTF+nR
         HLpso/uNDRCo/YSEsvuiSGcfVRB5nQBNIq0tqf/rKCb0Jj3MDvSNlwHTZaYmnwx/NoOO
         z8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5P9HijEGF7BF6ldedlydE7usEk+//5tOZ0vnx+3RUiASJXv9VR/Rmpam+OLdBO/BTnA2wNX4G60/exAzdMDi7JQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzzbb+Nh/Pntr/ja2OCVZhaPM/a+TIq1/rqYmfh655FYvwSn1TB
	gz0ruvbd45oHkDbU7UQT+GmyZPWKEGMlzCMFZewC3wx3w1xjPMe93pDMQQusmTy3FDmaYcF9ir7
	Au/lcy8TqpQB8Zdelt7WnhMGAoT+NpsM=
X-Gm-Gg: ASbGnct4GE870AL5FCPfdwmRs17a7cIDKbYw06pGGqgzSfHlZQl3CV66Vl/ln4LBuWS
	soV9qZDux4H9+RAMQHzWdD/ovBZZ2pbuTvhO144h4XLA1gK+QMzAj6ets8jL7W1u6FcZFOibkaV
	WB/GvoKxsmLk9kfdzMydyeDJpWsYiCvH0UR+1zNw1N3jrVcvTatlF/yANfRWsLUMzUpVam+tU3S
	uAVetMj8OrR8IMPl37hTWxhoN/MYopYKibuFy99SZGDLx7M2BDoFKNlJVFYHi8z2yRWePFW
X-Google-Smtp-Source: AGHT+IGvkej3eHuUZy1B47THHIqggJUBFMG+pOIl3oyBaVoZ/ATakHz2/8hbJASQulACZsIUq6gAsN7K+eT2Q60xouU=
X-Received: by 2002:a17:903:1012:b0:297:cc8a:df6f with SMTP id
 d9443c01a7336-297cc8aeac7mr89357675ad.3.1762788570796; Mon, 10 Nov 2025
 07:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com> <1ccdd952a740a2d09774d825cc28bee20ff1525d.camel@linuxfoundation.org>
 <CAApg2=R=nyLt3hiqH5uEKqhp1XZ2WKkWrAH837ZqTGRTVSCWHw@mail.gmail.com> <AS1PR10MB5697F694A61CEF460D80F25EFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F694A61CEF460D80F25EFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 10 Nov 2025 16:29:17 +0100
X-Gm-Features: AWmQ_bm7ztCrb2ZmEk6nnu8sH4zvSKilPg3nCFFRPqv9x-WmCg6z6kMN0D9hmAg
Message-ID: <CAApg2=SyfWMcE2OAknOQJRx4uwysiz9bdWnNxR-pPfLb9SgR1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
 database itself
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ross.burton@arm.com" <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000009394ef06433f3233"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 15:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226126

--0000000000009394ef06433f3233
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 4:18=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

>
>
> > -----Original Message-----
> > From: Marta Rybczynska <rybczynska@gmail.com>
> > Sent: Monday, November 10, 2025 16:00
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: niko.mauno@vaisala.com; openembedded-core@lists.openembedded.org;
> > ross.burton@arm.com; Marko, Peter (FT D EU SK BFS1)
> > <Peter.Marko@siemens.com>
> > Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the
> > database itself
> >
> >
> >
> > On Mon, Nov 10, 2025 at 3:16=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org <mailto:
> richard.purdie@linuxfoundation.org>
> > > wrote:
> >
> >
> >       On Mon, 2025-11-03 at 14:31 +0000, Niko Mauno via
> > lists.openembedded.org <http://lists.openembedded.org>  wrote:
> >       > This should help to avoid problems that will occur if the
> modification
> >       > time of database file itself is altered e.g. by unassociated
> >       > process(es) on the file system which hosts the database file.
> >       >
> >       > Since this change updates the database structure by adding a ne=
w
> table,
> >       > bump the 'minor' version number in database file names to
> enforce full
> >       > database fetch. This should also iron out e.g. situation where
> the
> >       > database might have inconspicuously omitted entries due to way =
in
> > which
> >       > the mtime of database file itself was relied upon.
> >       >
> >       > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com
> > <mailto:niko.mauno@vaisala.com> >
> >       > ---
> >       >  meta/classes/cve-check.bbclass                |  2 +-
> >       >  .../recipes-core/meta/cve-update-db-native.bb <
> http://cve-update-db-
> > native.bb>  |  3 +
> >       >  meta/recipes-core/meta/cve-update-native.inc  | 59
> ++++++++++++-------
> >       >  .../meta/cve-update-nvd2-native.bb <
> http://cve-update-nvd2-native.bb>
> > |  3 +
> >       >  4 files changed, 46 insertions(+), 21 deletions(-)
> >
> >       I am a bit worried about this since it takes what is a simple mti=
me
> >       comparison and means that to check the database you now have to
> lock
> >       and open it which is comparatively expensive.
> >
> >       What kind of "unassociated processes" are updating the mtime?
> >
> >
> >
> >
> > I second Richard here. If we would really want to keep the date
> somewhere else
> > than the file
> > timestamp, we could create a simple file that stores it, what is way
> simpler and
> > doesn't require
> > to open the database just to see if you want to update it.
> >
> > I second Richard's question: in what kind of a situation have you seen
> an issue?
>
> The issue is on Yocto AB.
> It has not updated statistics for more than 5 months now.
>
> Looking at the logs, something is updating mtime very frequently...
> I don't know the AB infrastructure, but it looks like there is some
> filesystem crawler, maybe backup of sync process.
> Or the nfs mount is plain broken there?
>
> Example is here:
>
> https://valkyrie.yocto.io/pub/non-release/20251109-43/testresults/metrics=
/db-update/
> NOTE: Current time: Sun Nov  9 07:17:52 2025; DB time: Sun Nov  9 07:14:5=
1
> 2025
> NOTE: Current time: Sun Nov  9 07:19:22 2025; DB time: Sun Nov  9 07:18:1=
4
> 2025
> 2 jobs are 90 seconds from each other, but something managed to change th=
e
> timestamp in between and only 3.5 minutes after last change!
>
>
The autobuilder was expected to force the complete download every day.
Something
has changed? The code does open the database after checking the timestamp,
so
frequent jobs couldn't cause it. I think that machine requires some
monitoring to see
what is actually changing those timestamps, because we do not know what it
is also
changing.

I haven't seen such an effect on my systems.

Kind regards,
Marta

--0000000000009394ef06433f3233
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 10,=
 2025 at 4:18=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@sie=
mens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" tar=
get=3D"_blank">rybczynska@gmail.com</a>&gt;<br>
&gt; Sent: Monday, November 10, 2025 16:00<br>
&gt; To: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.m=
auno@vaisala.com</a>; <a href=3D"mailto:openembedded-core@lists.openembedde=
d.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>;<br>
&gt; <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@a=
rm.com</a>; Marko, Peter (FT D EU SK BFS1)<br>
&gt; &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter=
.Marko@siemens.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH 5/5] cve-update: Keep mtime stamp in the=
<br>
&gt; database itself<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Nov 10, 2025 at 3:16=E2=80=AFPM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a> &lt;mailto:<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 2025-11-03 at 14:31 +0000, Niko Maun=
o via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;<a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</=
a>&gt;=C2=A0 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This should help to avoid problems that=
 will occur if the modification<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; time of database file itself is altered=
 e.g. by unassociated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; process(es) on the file system which ho=
sts the database file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Since this change updates the database =
structure by adding a new table,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; bump the &#39;minor&#39; version number=
 in database file names to enforce full<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; database fetch. This should also iron o=
ut e.g. situation where the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; database might have inconspicuously omi=
tted entries due to way in<br>
&gt; which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the mtime of database file itself was r=
elied upon.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Niko Mauno &lt;<a href=
=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.mauno@vaisala.com=
</a><br>
&gt; &lt;mailto:<a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank"=
>niko.mauno@vaisala.com</a>&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 meta/classes/cve-check.bbclass=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .../recipes-core/meta/<a href=3D"=
http://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-up=
date-db-native.bb</a> &lt;<a href=3D"http://cve-update-db-" rel=3D"noreferr=
er" target=3D"_blank">http://cve-update-db-</a><br>
&gt; <a href=3D"http://native.bb" rel=3D"noreferrer" target=3D"_blank">nati=
ve.bb</a>&gt;=C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 meta/recipes-core/meta/cve-update=
-native.inc=C2=A0 | 59 ++++++++++++-------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .../meta/<a href=3D"http://cve-up=
date-nvd2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-n=
ative.bb</a> &lt;<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://cve-update-nvd2-native.bb</a>&gt;<br>
&gt; |=C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 4 files changed, 46 insertions(+)=
, 21 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I am a bit worried about this since it takes=
 what is a simple mtime<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0comparison and means that to check the datab=
ase you now have to lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0and open it which is comparatively expensive=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What kind of &quot;unassociated processes&qu=
ot; are updating the mtime?<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; I second Richard here. If we would really want to keep the date somewh=
ere else<br>
&gt; than the file<br>
&gt; timestamp, we could create a simple file that stores it, what is way s=
impler and<br>
&gt; doesn&#39;t require<br>
&gt; to open the database just to see if you want to update it.<br>
&gt; <br>
&gt; I second Richard&#39;s question: in what kind of a situation have you =
seen an issue?<br>
<br>
The issue is on Yocto AB.<br>
It has not updated statistics for more than 5 months now.<br>
<br>
Looking at the logs, something is updating mtime very frequently...<br>
I don&#39;t know the AB infrastructure, but it looks like there is some fil=
esystem crawler, maybe backup of sync process.<br>
Or the nfs mount is plain broken there?<br>
<br>
Example is here:<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20251109-43/testresult=
s/metrics/db-update/" rel=3D"noreferrer" target=3D"_blank">https://valkyrie=
.yocto.io/pub/non-release/20251109-43/testresults/metrics/db-update/</a><br=
>
NOTE: Current time: Sun Nov=C2=A0 9 07:17:52 2025; DB time: Sun Nov=C2=A0 9=
 07:14:51 2025<br>
NOTE: Current time: Sun Nov=C2=A0 9 07:19:22 2025; DB time: Sun Nov=C2=A0 9=
 07:18:14 2025<br>
2 jobs are 90 seconds from each other, but something managed to change the =
timestamp in between and only 3.5 minutes after last change!<br>
<br></blockquote><div><br></div><div>The autobuilder was expected to force =
the complete download every day. Something</div><div>has changed? The code =
does open the database after checking the timestamp, so</div><div>frequent =
jobs couldn&#39;t cause it. I think that machine requires some monitoring t=
o see</div><div>what is actually changing those timestamps, because we do n=
ot know what it is also</div><div>changing.</div><div><br></div><div>I have=
n&#39;t seen such an effect on my systems.</div><div><br></div><div>Kind re=
gards,</div><div>Marta <br></div></div></div>

--0000000000009394ef06433f3233--

