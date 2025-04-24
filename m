Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BC9C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 17:36:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.186.1745516183523928835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 10:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2iIfoA8;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so923863f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745516182; x=1746120982; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjWIKMDz4lFZ/yPPaiVfaUSrWBrrNYBFK+nlXf8tk6w=;
        b=H2iIfoA8hX0w5Pvu89/UW+UQau1tfLvMYh1nB3X+adD/Xl2ZrVZrM26seLkfm3pbHu
         Sn05SbDYup2a6KVrD6gEsvwX0G1WYbCDQAK0cgZb4MiVNbw5/sv+XPcQRBSv6vlPNSxf
         pQ9+5lYidQ1NoLcF3aULihIFJBpdKXQhe+K4ckfC6ciUj6Lqmep5OeujZsJdaREwtjn9
         PH7e1oA+0YCzFhS7tCp0m8EeVHTxNCnVjbqWHvMTT4JuS2XSe+pAN9FfD3e/Rsd/GOUZ
         Cd4DvlYgMIQN9viimX5vXpCAxNLoYYYhy5QD55CrD/BvjDRbdUbCAS5siXAV24rHoWED
         RXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516182; x=1746120982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjWIKMDz4lFZ/yPPaiVfaUSrWBrrNYBFK+nlXf8tk6w=;
        b=LZsC7RCXLqde2nGVrB05yoGEe2m7Ll99MZi8moekoDFasfTWv1tBZJ62g/NZVRMAzA
         orIVLpKIPSPwiCj0VelTf/1wfzGYEVt5/fD/NIt+atPKQj6hxMtM5ZFuUkz2BNa0la9p
         EcS2Su31AFFXF55y6cwXEB55KqnESUaLZEIN7829Pel6JeBnHKeIBtcFTXfCPZmM6yuZ
         eh1TSxwslg/D1z1eDt6TP/7KffIZIK/SQ37nfItGITQ3TfgiVItONhPh1A1UAzcX5B0/
         Zkn3nmnchyScZWh1vSdEFZbTz2Wra5yOBky2IpMhzhw9iKt9Ox+H82wZc9CGw2EkPqHj
         TpYw==
X-Forwarded-Encrypted: i=1; AJvYcCUMG/zWm6t+TZMFMRNeHPzDGru563kqTPqle+kW11g1Eo8spJRC2X3VuEVWPb/oy7rWIt0OYzYjB7S8ZUHVkGyrmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6oqtE7qxmbo2EOdrLHNaJNaT+P4lc8XKBxrfbzTiiKr5ywHbt
	+sqCr6AgJDGdbcguPh9DNh3zcoWfK1Zid8SXc2XQxbm12wufCXhQw4W60Gv9PjLDVVq4xG1LUyX
	XfWl+Hgh3STSLT7v2utVHXMElVII=
X-Gm-Gg: ASbGnct7dPQXEyyB1ONVuzoXWj1UG8qjnuXp2HGq3N0/5S8Z+RGuTO5dLwXZ7uztQFg
	BvjNRkl3irh4SaQWjOEwjyIieBSfkRJa+clxaec4E40zlUtL65KHCrqMsxEmV+/FGV6OdKzGSkP
	3g/dn5D2M7rN5VfQ22ECg07RM=
X-Google-Smtp-Source: AGHT+IGHuMj4L6jO+I1IhtxK/cfTigJBAzwRwoEQnrTDC71yzAg3pQQBhlK8ZNd+bnGn9WNDKcuRUjWY/Mh778SJH+o=
X-Received: by 2002:a05:6000:1a8d:b0:391:2df9:772d with SMTP id
 ffacd0b85a97d-3a072a84f9amr254905f8f.13.1745516181407; Thu, 24 Apr 2025
 10:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
 <18394019E7982924.8448@lists.openembedded.org> <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com> <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
In-Reply-To: <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Thu, 24 Apr 2025 19:36:10 +0200
X-Gm-Features: ATxdqUGX-HAFVM3RXFXklg0rsfQBzwdPKXAcSWD5BHZOe7bcHtiDbzIvyKQ-aSc
Message-ID: <CAB3asfjUNTGO7+xRrNbPg=ZuDaj451OQHMUcWqUY5SdiYNFwcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000f15c8a063389a7cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 17:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215395

--000000000000f15c8a063389a7cb
Content-Type: text/plain; charset="UTF-8"

Richard Purdie via lists.openembedded.org <richard.purdie=
linuxfoundation.org@lists.openembedded.org> schrieb am Do., 24. Apr. 2025,
15:50:

> On Thu, 2025-04-24 at 14:41 +0200, Alexander Kanavin wrote:
> > On Thu, 24 Apr 2025 at 14:14, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > > In the two examples above, what is UNPACKDIR set to?
> > >
> > > Sorry, let me be more specific. What are the actual values of S and
> > > WORKDIR for the different cases?
> >
> > Can we step back for a bit? The original error is that 'devtool
> > upgrade' breaks cryptically on recipes that set:
> >
> > S = "${UNPACKDIR}/git" (instead of the usual WORKDIR/git).
> >
> > (everything else being the defaults from oe-core).
> >
> > Devtool, in this case, calculates the 'top level source' to be the
> > same as UNPACKDIR, and breakage follows.
> >
> > An example of such recipe in core is
> > meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
>
> Stepping back further, we had this mess in devtool in the first place
> as it could never work out which files in WORKDIR were "sources" which
> it needed to handle carefully.
>
> We now define UNPACKDIR as the place we unpack files to. devtool in
> theory can therefore just redefine UNPACKDIR and WORKDIR and things
> should 'just work'. The relation of the subpaths between the two should
> remain the same.
>
> This should therefore make the code in devtool simpler, not more
> complex.
>
> Your patch isn't doing that and I'm wondering if there are code paths
> in there which are no longer needed if we handle UNPACKDIR correctly/as
> intended.
>
> So in summary, something isn't adding up here to me but I'm not yet
> sure quite what.
>

At the moment I'm not able to look into the details. But I remember the
extra
complexity in the code of devtool for handling the corner case when
S=WORKDIR
with an extra folder containing sym-links to the real source files. This is
now
removed thanks to UNPACKDIR which no longer allows this. At least for
ide_sdk
this looked like a huge cleanup to me.
Maybe now it is possible to clearly define how devtool uses or maps S,
UNPACKDIR
and WORKDIR in a generic way rather than trying to fix the code in some way
which
just works. Or is there already such a concept behind this patch?

Adrian

>
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215373):
> https://lists.openembedded.org/g/openembedded-core/message/215373
> Mute This Topic: https://lists.openembedded.org/mt/112431116/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f15c8a063389a7cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"auto"><div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.opene=
mbedded.org" target=3D"_blank">linuxfoundation.org@lists.openembedded.org</=
a>&gt; schrieb am Do., 24. Apr. 2025, 15:50:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Thu, 2025-04-24 at 14:41 +0200, Alexander K=
anavin wrote:<br>
&gt; On Thu, 24 Apr 2025 at 14:14, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" rel=3D"noref=
errer" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br>
&gt; &gt; &gt; In the two examples above, what is UNPACKDIR set to?<br>
&gt; &gt; <br>
&gt; &gt; Sorry, let me be more specific. What are the actual values of S a=
nd<br>
&gt; &gt; WORKDIR for the different cases?<br>
&gt; <br>
&gt; Can we step back for a bit? The original error is that &#39;devtool<br=
>
&gt; upgrade&#39; breaks cryptically on recipes that set:<br>
&gt; <br>
&gt; S =3D &quot;${UNPACKDIR}/git&quot; (instead of the usual WORKDIR/git).=
<br>
&gt; <br>
&gt; (everything else being the defaults from oe-core).<br>
&gt; <br>
&gt; Devtool, in this case, calculates the &#39;top level source&#39; to be=
 the<br>
&gt; same as UNPACKDIR, and breakage follows.<br>
&gt; <br>
&gt; An example of such recipe in core is<br>
&gt; meta/recipes-devtools/rpm-sequoia/<a href=3D"http://rpm-sequoia_1.7.0.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">rpm-sequoia_1.7.0.bb</a=
><br>
<br>
Stepping back further, we had this mess in devtool in the first place<br>
as it could never work out which files in WORKDIR were &quot;sources&quot; =
which<br>
it needed to handle carefully.<br>
<br>
We now define UNPACKDIR as the place we unpack files to. devtool in<br>
theory can therefore just redefine UNPACKDIR and WORKDIR and things<br>
should &#39;just work&#39;. The relation of the subpaths between the two sh=
ould<br>
remain the same.<br>
<br>
This should therefore make the code in devtool simpler, not more<br>
complex.<br>
<br>
Your patch isn&#39;t doing that and I&#39;m wondering if there are code pat=
hs<br>
in there which are no longer needed if we handle UNPACKDIR correctly/as<br>
intended.<br>
<br>
So in summary, something isn&#39;t adding up here to me but I&#39;m not yet=
<br>
sure quite what.<br></blockquote><div><br></div><div>At the moment I&#39;m =
not able to look into the details. But I remember the=20
extra</div><div>complexity in the code of devtool for handling the corner c=
ase=20
when S=3DWORKDIR</div><div>with an extra folder containing sym-links to the=
 real=20
source files. This is now</div><div>removed thanks to UNPACKDIR which no=20
longer allows this. At least for ide_sdk</div><div>this looked like a huge =
cleanup to me.</div><div>Maybe now it is possible to clearly define how dev=
tool uses or maps S, UNPACKDIR</div><div>and WORKDIR in a generic way rathe=
r than trying to fix the code in some way which</div><div>just works. Or is=
 there already such a concept behind this patch?</div><div><br></div><div>A=
drian</div><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215373): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215373" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/215373</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112431116/445=
4582" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/112431116/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofe=
r@gmail.com" rel=3D"noreferrer" target=3D"_blank">adrian.freihofer@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>
</div>
</div>

--000000000000f15c8a063389a7cb--

