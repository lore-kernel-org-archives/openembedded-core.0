Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A04C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 02:26:34 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web12.17024.1654395986608157072
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 19:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQooYFc5;
 spf=pass (domain: gmail.com, ip: 209.85.166.50,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id i201so3606209ioa.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=se2ceo+EJfSLqyoIEa6v441iH8hDeBqLKEX6u6wHQ/4=;
        b=fQooYFc5cHpAYn4H0e+olUQtUMamFtHEa5RWUIXIPr6FqTLKB8o7PSRVhPOPKt2vvp
         u9yR/vvx8fxnhOvh3YbLRD/LhLhBwi4Z2JK0qabecEZltqi5+EXPRK4B4rl2/aRtrOb+
         axzaSHYRoBz9KdrcKEW2+JSA6+JJTKT44NTcBozKdn0ZpkWL04yYsf3HM1AOD1yiBzd/
         14O4h2EPJO0Kg60PyYtDvVnQYEtaAin+c6o8x4aLswTf+qled0bHSnBaeDeZKDN/5N6J
         yzjwtT6vLL8hhGqVkOyEIMCknhhOZCSPsZx2/iepgTNcmQQHvlQeJXBy4Uq8xiLcClHG
         aBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=se2ceo+EJfSLqyoIEa6v441iH8hDeBqLKEX6u6wHQ/4=;
        b=AZNSxH5ytp1kvcfvQAKuV3V3rWMHzHR+qK36Pi1fMP0xAID4m8B/dCS1vtj7tvtwR8
         wvirTbBEqpMMxUpRWozfF6M/6yfaETCrmnAKl+vZjwbBnGU5h9V6Q+fEGONfRw1nMPlR
         QQdQ/Zt5BBlFSCZ49oBvJ7PeKAih7L/+EdzvC+pGbifJqLlZQ4ToJvuK1reJtdAzjv4m
         Hqb6UgMPv57aoAQIybZlMBz5ODddnhRBpnZ+N0FKEd4CJZ+WgB0Jx1Mdf5dsLWGeHl+V
         OZwVwRNCEq7UeaqUBMwLtxgyxPjkDZCQ4V22lXYTUw9J8wOp8FoMDSXn34wZt5nbli+W
         5eOg==
X-Gm-Message-State: AOAM532+iKe0bA0XfqpKwlMTQ8krC2eLx3jZAUuVX/RW+fqcrfhiFGV8
	7UdQeWa4U6kbhoi2W9tLiRM5uvUUjXOMb/SIwfg=
X-Google-Smtp-Source: 
 ABdhPJzpEamVz1f+A43lCeelgOYO7txhZOuuxb7nea9JDtjb1laE1RHQ3KnaMkA0xguzThq4TQ5Z/1OLIJb7xx8SXBA=
X-Received: by 2002:a05:6638:4105:b0:32e:9ec6:8864 with SMTP id
 ay5-20020a056638410500b0032e9ec68864mr9024799jab.189.1654395985977; Sat, 04
 Jun 2022 19:26:25 -0700 (PDT)
MIME-Version: 1.0
References: 
 <8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
 <16F56B1475C84995.11448@lists.yoctoproject.org>
 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
 <CAMKF1sr+1oX4KbvHEUMnifKOEdjzbWiJPOThOwnLoeYrK9QS0g@mail.gmail.com>
 <45cc4ad9-f7bc-e0ff-9252-512bb2d3d55e@gmail.com>
 <2b098a7b1940704e69d5dca8e5df3db1fa185819.camel@linuxfoundation.org>
In-Reply-To: 
 <2b098a7b1940704e69d5dca8e5df3db1fa185819.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Sun, 5 Jun 2022 04:26:15 +0200
Message-ID: 
 <CAPbeDCnsxHsV=CKv7AVhNuvDn9QcORBQhx-DoQ4B9D-Qm+g3Kg@mail.gmail.com>
Subject: Re: [swat] [OE-core] perl makefile race - any make experts who can
 help?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
 swat@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000fe5de05e0aa15a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 02:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166573

--0000000000000fe5de05e0aa15a1
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Jun 2022, 19:40 Richard Purdie, <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2022-06-04 at 17:12 +0200, Jacob Kroon wrote:
> > On 6/4/22 16:55, Khem Raj wrote:
> > >
> > >
> > > On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org
> > > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> > >
> > >     On Sat, 2022-06-04 at 13:36 +0100, Richard Purdie via
> > >     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
> > >      > On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:
> > >      > > Here's something I didn't think of before. Has this occurred
> > >     anywhere
> > >      > > else except Ubuntu 18.04?
> > >      >
> > >      > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14096
> > >     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14096>
> > >      >
> > >      > I'm struggling to get the data out from the old builds, one
> mentions
> > >      > ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.
> > >      >
> > >      > It is possible this is an ubuntu specific make issue or a make
> bug.
> > >
> > >     Ubuntu 18.04 uses make 4.1 which is old (Oct 2014).
> > >
> > >     I noticed these patches from 2016:
> > >
> > >
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=9bb994e8319c2b153cd3d6d61e2c2882895e7c3a
> > >     <
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=9bb994e8319c2b153cd3d6d61e2c2882895e7c3a
> >
> > >
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=4762480ae9cb8df4878286411f178d32db14eff0
> > >     <
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=4762480ae9cb8df4878286411f178d32db14eff0
> >
> > >
> > >     I think we may want to mandate a modern make for both this class of
> > >     issues and also perhaps for better loadavg support to keep load
> under
> > >     control on the autobuilders.
> > >
> > >     I'm torn, on the one hand we need to test the distros people use,
> on
> > >     the other we do need to remove sources of intermittent issues. I
> think
> > >     this bug must be some issue with make itself.
> > >
> > >     Adding a make-native dependency to perl would "hurt" people on
> modern
> > >     distros...
> > >
> > >
> > > Make perhaps does not have many complex dependency needs so it might
> not
> > > be as bad
> > >
> >
> > My master build is already building make-native due to a dependency from
> > glibc, since 2018:
> >
> >
> https://git.openembedded.org/openembedded-core/commit/?id=0cd89e4af625941f8ab8c033f72f900a2979b304
> >
> > Don't know if that dependency is still valid though.
>
> It is a fair point. We may as well add it to perl/perl-native. Centos7
> still has make 3.82 but I think we now already require buildtools
> tarball there so we could probably drop the glibc dependency on make-
> native now.
>

Would it be a bad idea to add make-native to DEPENDS depending on whether
the host version of make is new enough or not ? Would it break sstate cache
reuse in some way ?

>

--0000000000000fe5de05e0aa15a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, 4 Jun 2022, 19:40 Richard Purdie, &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, 2022-06-04 at =
17:12 +0200, Jacob Kroon wrote:<br>
&gt; On 6/4/22 16:55, Khem Raj wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie <br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a> <br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>=
&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On Sat, 2022-06-04 at 13:36 +0100, Richard Pur=
die via<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.yoctoproject.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">lists.yoctoproject.org</a> &lt=
;<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Sat, 2022-06-04 at 13:51 +0200, Alexa=
nder Kanavin wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Here&#39;s something I didn&#39;t t=
hink of before. Has this occurred<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0anywhere<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; else except Ubuntu 18.04?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D14096" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D14096" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14096</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m struggling to get the data out f=
rom the old builds, one mentions<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ubuntu1604, there is an ubuntu1804 on bo=
th x86 and arm hosts.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; It is possible this is an ubuntu specifi=
c make issue or a make bug.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Ubuntu 18.04 uses make 4.1 which is old (Oct 2=
014).<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I noticed these patches from 2016:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.savannah.gnu.org/cgit/m=
ake.git/commit/?id=3D9bb994e8319c2b153cd3d6d61e2c2882895e7c3a" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/make.=
git/commit/?id=3D9bb994e8319c2b153cd3d6d61e2c2882895e7c3a</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.savannah.gnu.org/cg=
it/make.git/commit/?id=3D9bb994e8319c2b153cd3d6d61e2c2882895e7c3a" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/m=
ake.git/commit/?id=3D9bb994e8319c2b153cd3d6d61e2c2882895e7c3a</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.savannah.gnu.org/cgit/m=
ake.git/commit/?id=3D4762480ae9cb8df4878286411f178d32db14eff0" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/make.=
git/commit/?id=3D4762480ae9cb8df4878286411f178d32db14eff0</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.savannah.gnu.org/cg=
it/make.git/commit/?id=3D4762480ae9cb8df4878286411f178d32db14eff0" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/m=
ake.git/commit/?id=3D4762480ae9cb8df4878286411f178d32db14eff0</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I think we may want to mandate a modern make f=
or both this class of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0issues and also perhaps for better loadavg sup=
port to keep load under<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0control on the autobuilders.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I&#39;m torn, on the one hand we need to test =
the distros people use, on<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the other we do need to remove sources of inte=
rmittent issues. I think<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0this bug must be some issue with make itself.<=
br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Adding a make-native dependency to perl would =
&quot;hurt&quot; people on modern<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0distros...<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Make perhaps does not have many complex dependency needs so it mi=
ght not <br>
&gt; &gt; be as bad<br>
&gt; &gt; <br>
&gt; <br>
&gt; My master build is already building make-native due to a dependency fr=
om <br>
&gt; glibc, since 2018:<br>
&gt; <br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D0cd89e4af625941f8ab8c033f72f900a2979b304" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=
=3D0cd89e4af625941f8ab8c033f72f900a2979b304</a><br>
&gt; <br>
&gt; Don&#39;t know if that dependency is still valid though.<br>
<br>
It is a fair point. We may as well add it to perl/perl-native. Centos7<br>
still has make 3.82 but I think we now already require buildtools<br>
tarball there so we could probably drop the glibc dependency on make-<br>
native now.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></bloc=
kquote></div></div><div dir=3D"auto">Would it be a bad idea to add make-nat=
ive to DEPENDS depending on whether the host version of make is new enough =
or not ? Would it break sstate cache reuse in some way ?=C2=A0</div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000000fe5de05e0aa15a1--

