Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29E0D735F6
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 08:10:30 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.131005.1732954229680513731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 00:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9ND0TmM;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d842280932so23226176d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 00:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732954229; x=1733559029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D+ZzBAqamF62ydho1ajMb9Vj3aRo+QGpfLNlX5Kv7HM=;
        b=I9ND0TmM1jem3xGhtEErrlVTFIwp8jMXVSnhnbg7Xq8trsTHN/a8dMCmuk6TINOkDa
         5SC1z9ZbS/IgDZQh/gKXXwDXoqvE304Dpkzn2re7WZIG075cl7iUAUTc7+vghnR550mS
         b9lZxr8x+66hO5z+mCFzM7Qxrb96aIQ9KSwEnSxCIXVUWcO0H5G+Cg+QUxaNaV9+AymS
         wDyc5LI+IxrpUmSdYcocuXCqnZ3KZqK6COjde4ETGLK/ePcNxJSxGe0ZGYFPHlINZM1Q
         w/MCfmoClQlUe6K4ALe7EHZ9bG/sQ/Sfdu7CyXJGK7Zy3104juafoseItlzXaKonwE4L
         Wa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732954229; x=1733559029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+ZzBAqamF62ydho1ajMb9Vj3aRo+QGpfLNlX5Kv7HM=;
        b=gVBEuQC4rXum0g+kmbbKdBwPjAM3TsFvO+mW9596dMzjT16wNHPa0ddNQD9dRH1BD2
         L+xk6vMVLwS1LkP+z8o9We1AghBI2RhUoVHQnwLMKQyoE3QW3ioffs6vZU9Nv6pb0Cvq
         q4tWhMHbAgMUhl/7tAdnzZ3JsOlY7MQ66ZPrrMAvUHeyx7aiOkUT/Kl+RAzMaDXry2SU
         tjCN/58AMXSyL9P8x+AL1hwZM3zPiEzgHgBYYXuEZgvfl+LxTGLvXgwA8+0+JSBTcC7R
         OcoVPBL+sBwlH1AtFLdcHaIa3ZEFT95/3Wn+eSHoK0CnHaEUIpqtLDoWuSzBs1ZdUfl1
         A2Pg==
X-Forwarded-Encrypted: i=1; AJvYcCURZ005aQwBasd3INqATbmzoqCq9rvg7Wo8/QUcBSb3/NLtmFqlId1drzYZqPS6IBL0ig/Mo/9SIgTJUq1DM0xUuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVTlrg7bhGpBLzBYNVB5ZRevZmKRlXgSrPokzCkp45Hrfj1zX3
	jrmUXkSPbA+GOHi548BeY063rV1KxeY64TAoeJcxkAtR7c78Ed3sOL1Pk2OyyPOttb/WOD7MQJv
	ZtGE8GSSu1g5r6ivmP4gNHwBokIU=
X-Gm-Gg: ASbGncsjX526uBKiDKEebRzaNXMdQGV1/u6jH/jN9HsHp/YosE+E8/lCcG/zy8a09cI
	wSpB0SH6RqS6i5PMKteEjo+Bm9/PwVQPabT7MMdfbpv6pePtQNc9FRV4ulrycUYE=
X-Google-Smtp-Source: AGHT+IEd8l4mNVd5rgbcCtXal/e7Wufa5lC5ZceuGByo+jRGDMrAyDTOn+1gNJ3NNSwhRKaM5BOYoKYLkL3BagWcwZM=
X-Received: by 2002:ad4:5d4d:0:b0:6d8:8d87:e5b4 with SMTP id
 6a1803df08f44-6d88d8807b5mr52701046d6.19.1732954228535; Sat, 30 Nov 2024
 00:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20241023184829.2216595-1-peter.marko@siemens.com>
 <180155B44E341F73.23694@lists.openembedded.org> <bc5ea6421ee3bf54f3f950f79036d3b51e60b3d4.camel@linuxfoundation.org>
 <AS1PR10MB56977189B862AC8B9F71791EFD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697F7732BD8CC377EB0286CFD2A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F7732BD8CC377EB0286CFD2A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 30 Nov 2024 09:10:17 +0100
Message-ID: <CANNYZj_S4YQDVrvs+aREBGxfNfLcwtExHQLNAFFOXr_5T7y_4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
To: peter.marko@siemens.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000343eba06281cd9dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208037

--000000000000343eba06281cd9dc
Content-Type: text/plain; charset="UTF-8"

Might be easier if you rebase and resend.

Alex

On Fri 29. Nov 2024 at 19.34, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:

> Richard,
>
> could this be queued in master-next again?
> I have submitted fixes for python3 to support openssl 3.4.x.
> https://lists.openembedded.org/g/openembedded-core/message/208030
>
> Thanks,
>   Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1)
> > Sent: Thursday, October 24, 2024 20:56
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>; openembedded-
> > core@lists.openembedded.org; Steve Sakoman <steve@sakoman.com>
> > Subject: RE: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
> >
> > > -----Original Message-----
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Sent: Thursday, October 24, 2024 12:14
> > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > > openembedded-core@lists.openembedded.org; Steve Sakoman
> > > <steve@sakoman.com>
> > > Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -> 3.4.0
> > >
> > > On Thu, 2024-10-24 at 09:19 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Wed, 2024-10-23 at 20:48 +0200, Peter Marko via
> > > > lists.openembedded.org wrote:
> > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > >
> > > > > Release information:
> > > > > https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-
> > > changes-between-openssl-33-and-openssl-340-22-oct-2024
> > > > >
> > > > > Handles CVE-2024-9143
> > > > >
> > > > > Refreshed patches.
> > > > >
> > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > ---
> > > > >  ...ke-history-reporting-when-test-fails.patch | 53 ++++++++-------
> > > > > ----
> > > > >  ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
> > > > >  ...sysroot-and-debug-prefix-map-from-co.patch |  4 +-
> > > > >  .../{openssl_3.3.1.bb => openssl_3.4.0.bb}    |  2 +-
> > > > >  4 files changed, 28 insertions(+), 35 deletions(-)
> > > > >  rename meta/recipes-connectivity/openssl/{openssl_3.3.1.bb =>
> > > > > openssl_3.4.0.bb} (99%)
> > > >
> > > > Unfortunately this causes a regression in python3's ptest:
> > > >
> > > > https://valkyrie.yoctoproject.org/#/builders/73/builds/270
> > > >
> > > > I did revert this patch and tested a build and that passes so it is
> > > > definitely from here.
> > > >
> > > > I'm trying this in conjunction with the python 3.13 upgrade which
> > > > might
> > > > let us fix this for master but if so, the problem for styhead and
> > > > earlier will probably remain.
> > > >
> > > > There was a related python bug:
> > > >
> > > > https://github.com/python/cpython/issues/87743
> > > >
> > > > Copying Steve so he knows that gremlins lurk here...
> > >
> > > The 3.13 upgrade doesn't help so we're going to need to resolve the
> > > ptest issue somehow to merge this...
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > Richard,
> >
> > I was able to bisect openssl to
> >
> https://github.com/openssl/openssl/commit/933f57dfe21657f7aba8f13e0cdb3b0
> > 2dd64fcc3
> > When I revert this commit, then the python3-ptest succeeds also with
> openssl
> > 3.4.0.
> > I have created https://github.com/python/cpython/issues/125936 to inform
> > cpython maintainers.
> > I don't have enough knowledge to fix it myself but I think that the
> openssl commit
> > breaking things should be great lead for someone else.
> >
> > During the investigation, I have also found 2 following problems with
> python:
> >
> > 1) when running ptest in core-image-minimal, there are two crashes in
> console
> > (both with openssl 3.3.1 and 3.4.0):
> > [   91.482461] python3[8605]: segfault at 10 ip 00007f5b0760f561 sp
> > 00007ffeda12c440 error 4 in
> > libpython3.12.so.1.0[1ae561,7f5b07566000+23c000] likely on CPU 0 (core 0,
> > socket 0)
> > [   91.485213] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89 fb 66
> 48 8d 3d
> > c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b 00 <48>
> 8b 68 10
> > 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d
> > [  118.871057] python3[12214]: segfault at 10 ip 00007f7ad5dd2561 sp
> > 00007f7ad50f7dd0 error 4 in
> > libpython3.12.so.1.0[1ae561,7f7ad5d29000+23c000] likely on CPU 2 (core 2,
> > socket 0)
> > [  118.873991] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89 fb 66
> 48 8d 3d
> > c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b 00 <48>
> 8b 68 10
> > 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d
> >
> > 2) python ptest parsing is wrong, it detected only one from 8 test
> failures (see my
> > cpython issue and ptest logs).
> >
> > Could someone create Bugzilla entries for these?
> >
> > Regards,
> >   Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208031):
> https://lists.openembedded.org/g/openembedded-core/message/208031
> Mute This Topic: https://lists.openembedded.org/mt/109176901/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000343eba06281cd9dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Might be easier if you rebase and resend.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 29. Nov 2024 at 19.34=
, Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembed=
ded.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)">Richard,<br>
<br>
could this be queued in master-next again?<br>
I have submitted fixes for python3 to support openssl 3.4.x.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/20803=
0" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/208030</a><br>
<br>
Thanks,<br>
=C2=A0 Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marko, Peter (FT D EU SK BFS1)<br>
&gt; Sent: Thursday, October 24, 2024 20:56<br>
&gt; To: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;; openem=
bedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>; Steve Sakoman &lt;<a href=3D"mailto:steve@sakom=
an.com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; Subject: RE: [OE-core][PATCH] openssl: upgrade 3.3.1 -&gt; 3.4.0<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
&gt; &gt; Sent: Thursday, October 24, 2024 12:14<br>
&gt; &gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Ma=
rko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;;<br>
&gt; &gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">openembedded-core@lists.openembedded.org</a>; Steve Sakoman<br=
>
&gt; &gt; &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@=
sakoman.com</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core][PATCH] openssl: upgrade 3.3.1 -&gt; 3.4.0<=
br>
&gt; &gt;<br>
&gt; &gt; On Thu, 2024-10-24 at 09:19 +0100, Richard Purdie via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; On Wed, 2024-10-23 at 20:48 +0200, Peter Marko via<br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@sie=
mens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Release information:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/openssl/openssl/blob/open=
ssl-3.4/NEWS.md#major-" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-</a><br>
&gt; &gt; changes-between-openssl-33-and-openssl-340-22-oct-2024<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Handles CVE-2024-9143<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Refreshed patches.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.=
marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; =C2=A0...ke-history-reporting-when-test-fails.patch | 5=
3 ++++++++-------<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; =C2=A0...1-Configure-do-not-tweak-mips-cflags.patch |=
=C2=A0 4 +-<br>
&gt; &gt; &gt; &gt; =C2=A0...sysroot-and-debug-prefix-map-from-co.patch |=
=C2=A0 4 +-<br>
&gt; &gt; &gt; &gt; =C2=A0.../{<a href=3D"http://openssl_3.3.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">openssl_3.3.1.bb</a> =3D&gt; <a href=3D"http:/=
/openssl_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.4.0.bb</a=
>}=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; &gt; &gt; =C2=A04 files changed, 28 insertions(+), 35 deletions(-=
)<br>
&gt; &gt; &gt; &gt; =C2=A0rename meta/recipes-connectivity/openssl/{<a href=
=3D"http://openssl_3.3.1.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3=
.3.1.bb</a> =3D&gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"http://openssl_3.4.0.bb" rel=3D"noreferrer" =
target=3D"_blank">openssl_3.4.0.bb</a>} (99%)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Unfortunately this causes a regression in python3&#39;s ptes=
t:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/73/b=
uilds/270" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproje=
ct.org/#/builders/73/builds/270</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I did revert this patch and tested a build and that passes s=
o it is<br>
&gt; &gt; &gt; definitely from here.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m trying this in conjunction with the python 3.13 upgr=
ade which<br>
&gt; &gt; &gt; might<br>
&gt; &gt; &gt; let us fix this for master but if so, the problem for styhea=
d and<br>
&gt; &gt; &gt; earlier will probably remain.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There was a related python bug:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://github.com/python/cpython/issues/87743" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/python/cpython/issue=
s/87743</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Copying Steve so he knows that gremlins lurk here...<br>
&gt; &gt;<br>
&gt; &gt; The 3.13 upgrade doesn&#39;t help so we&#39;re going to need to r=
esolve the<br>
&gt; &gt; ptest issue somehow to merge this...<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Richard<br>
&gt; <br>
&gt; Richard,<br>
&gt; <br>
&gt; I was able to bisect openssl to<br>
&gt; <a href=3D"https://github.com/openssl/openssl/commit/933f57dfe21657f7a=
ba8f13e0cdb3b0" rel=3D"noreferrer" target=3D"_blank">https://github.com/ope=
nssl/openssl/commit/933f57dfe21657f7aba8f13e0cdb3b0</a><br>
&gt; 2dd64fcc3<br>
&gt; When I revert this commit, then the python3-ptest succeeds also with o=
penssl<br>
&gt; 3.4.0.<br>
&gt; I have created <a href=3D"https://github.com/python/cpython/issues/125=
936" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/cpython=
/issues/125936</a> to inform<br>
&gt; cpython maintainers.<br>
&gt; I don&#39;t have enough knowledge to fix it myself but I think that th=
e openssl commit<br>
&gt; breaking things should be great lead for someone else.<br>
&gt; <br>
&gt; During the investigation, I have also found 2 following problems with =
python:<br>
&gt; <br>
&gt; 1) when running ptest in core-image-minimal, there are two crashes in =
console<br>
&gt; (both with openssl 3.3.1 and 3.4.0):<br>
&gt; [=C2=A0 =C2=A091.482461] python3[8605]: segfault at 10 ip 00007f5b0760=
f561 sp<br>
&gt; 00007ffeda12c440 error 4 in<br>
&gt; libpython3.12.so.1.0[1ae561,7f5b07566000+23c000] likely on CPU 0 (core=
 0,<br>
&gt; socket 0)<br>
&gt; [=C2=A0 =C2=A091.485213] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 =
48 89 fb 66 48 8d 3d<br>
&gt; c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b 00 &lt;=
48&gt; 8b 68 10<br>
&gt; 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d<br>
&gt; [=C2=A0 118.871057] python3[12214]: segfault at 10 ip 00007f7ad5dd2561=
 sp<br>
&gt; 00007f7ad50f7dd0 error 4 in<br>
&gt; libpython3.12.so.1.0[1ae561,7f7ad5d29000+23c000] likely on CPU 2 (core=
 2,<br>
&gt; socket 0)<br>
&gt; [=C2=A0 118.873991] Code: 0f 1f 84 00 00 00 00 00 90 41 54 55 53 48 89=
 fb 66 48 8d 3d<br>
&gt; c9 d9 35 00 66 66 48 e8 79 90 f5 ff 4c 8b 25 ca d7 35 00 48 8b 00 &lt;=
48&gt; 8b 68 10<br>
&gt; 49 3b 6c 24 30 74 09 f6 85 b0 06 00 00 20 75 4b 48 8d<br>
&gt; <br>
&gt; 2) python ptest parsing is wrong, it detected only one from 8 test fai=
lures (see my<br>
&gt; cpython issue and ptest logs).<br>
&gt; <br>
&gt; Could someone create Bugzilla entries for these?<br>
&gt; <br>
&gt; Regards,<br>
&gt;=C2=A0 =C2=A0Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#208031): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208031" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/208031</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109176901/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109176901/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000343eba06281cd9dc--

