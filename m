Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF43C7EE23
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 20:34:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.24966.1685910893457258024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 13:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YPvDPwbc;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30ae141785bso4123310f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685910892; x=1688502892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/734+NQm7aOYiIxcYeQOMZv+nq9RtkC56BsmFrVGzzM=;
        b=YPvDPwbcDtVWEcrfNhCpUMkQi/1BKgpq86E9IZe34UDGuKdtGK1InddFO66IQ5exZz
         FbJtXzNwu9HzpzFvDhG2c+pUIhopW50cCAQyR5fRBQ9NxsFL8/5CQyyjt/cYNsSa3sbK
         1T7ugngJ3OlsBZUURURxc1Ll+k+2uU/EcwABFg7WXJwhN7EpJzBL5g/FJF6neraycvBb
         KFaXM7Hff5jYGW4FkgevmX2ep8Vsc0U5YdvgVdHZbq5Pf1p79zo4rNlfTcnCDTcgK5DM
         kLP/HLOj5AJqZ2G7imVVr17TTUNKd8HvRXht3dDDtR3Tmj3LslZXSIGEO7EMQaXpwCcT
         jOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910892; x=1688502892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/734+NQm7aOYiIxcYeQOMZv+nq9RtkC56BsmFrVGzzM=;
        b=jxu+HQqeOiLrBV01IySLgGN3rDCTCYPXtRpZqo0OBNsLyHessRjgqVcD3lxiMO+56z
         ikAHaARhgHvz5eN+s8x7qRLK0s2KYyp0oNZ+QqqMbwkdRB1BFNpr6MGkGsF+Y0pURGpO
         A3RS1RATVW+HP7ZbIwpcYDyvZuahNVNuF67ZDgQm2ZsDWaDuYq2QTReBVGuftqIUzN+E
         hXWBY/tTPy3O7FYrNERq6ENtyQOGroHHTpF3WiIKTOrvIJKY61aQ1aibQryIq3BS7v26
         4z4uGgKe4Jp0SMJXrEcXiD3g/0cAxZ3z8bewnsVtMFKaEIcTiCgc5gCHbUUXmLnP2eZY
         lhjQ==
X-Gm-Message-State: AC+VfDyZmlAYw/kZj+5dylvcyJcYYGLq6WJxqEEXT6WXc0vEZQhqWC95
	24/kOl6P6baN23/V39OCzyA1pIn1IsX5stSSc0XJWNpN
X-Google-Smtp-Source: ACHHUZ7UzEb0x97cBj+1yx26exX0Ewv4SnYtNOOncoyzcwgXj4MUvN6pza6B5l/++B94yjV9x2SV+jsk7w8kDjCAXXM=
X-Received: by 2002:adf:dc01:0:b0:2f6:ca0d:ec1c with SMTP id
 t1-20020adfdc01000000b002f6ca0dec1cmr4355338wri.10.1685910891479; Sun, 04 Jun
 2023 13:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685672395.git.steve@sakoman.com> <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
 <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com> <CAOSpxdabCO0O+Ct_wMeYxCiZ60=33tC3a0jAqw=yL12KSfNpCA@mail.gmail.com>
In-Reply-To: <CAOSpxdabCO0O+Ct_wMeYxCiZ60=33tC3a0jAqw=yL12KSfNpCA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Jun 2023 22:34:39 +0200
Message-ID: <CA+chaQf2FWd9rhOU07s0ra8S5tkEKNDZsjiXFY+GDynssuBd9A@mail.gmail.com>
Subject: Re: [OE-core][mickledore 13/13] uninative: Upgrade to 4.0 to include
 latest gcc 13.1.1
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cf460705fd53b781"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 20:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182369

--000000000000cf460705fd53b781
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> It might be useful to delay backporting this for a bit longer (and I'll
soon confirm if 3.10 was already affected or not).

I can confirm that 3.10 is also affected.

I did build with
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D75e3870ea124321b81f856c4e5170c891f0bd050
and mkfs.ext4 didn't segfault. With uninative 3.10 from
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D680eecc3ae09ea5585e46ff0e67f7c6704221806
it segfaults again.

I haven't reproduced the gdk-pixbuf-native issue with buildtools-extended
4.0.6 with kirkstone yet, so that one might be only with nanbield, but
mkfs.ext4 segfaults seem related to uninative for sure. Will debug more
when I get access.

Cheers,

On Sun, Jun 4, 2023 at 9:14=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> On Sun, Jun 4, 2023 at 7:39=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om>
> wrote:
> >
> > Hi,
> >
> > it looks like this change is causing mkfs.ext4 to segfault on some
> builders.
> >
> > I'm seeing it on ubuntu-18.04 (I know it's unsupported now). It might b=
e
> related to older docker or libseccomp2 there, because there is similar
> issue with gdk-pixbuf-native which fails when buildtools-extended is used
> together with this and might be related to
> https://github.com/moby/moby/issues/43595 because when I try very similar
> 18.04 ubuntu image on my gentoo host I cannot reproduce neither the
> gdk-pixbuf-native failure nor the mkfs.ext4 segfaults.
> >
> > I'm trying to get access to some of the affected boxes to find out whic=
h
> version docker/libseccomp2 is used there and to double check that this is
> root cause for these failures (now I can only confirm that it started in
> Nanbield when this uninative upgrade was merged and now I've reproduced t=
he
> same with kirkstone-nut with the same uninative upgrade.
> >
> > It might be useful to delay backporting this for a bit longer (and I'll
> soon confirm if 3.10 was already affected or not).
>
> Agreed, I'm struggling with kirkstone too, so will delay taking the
> uninative update until we learn more.
>
> Thanks for the review!
>
> Steve
>
> > On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman <steve@sakoman.com=
> wrote:
> >>
> >> From: Michael Halstead <mhalstead@linuxfoundation.org>
> >>
> >> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> (cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/conf/distro/include/yocto-uninative.inc
> b/meta/conf/distro/include/yocto-uninative.inc
> >> index f3c05b7e20..ad4816a1f3 100644
> >> --- a/meta/conf/distro/include/yocto-uninative.inc
> >> +++ b/meta/conf/distro/include/yocto-uninative.inc
> >> @@ -7,9 +7,9 @@
> >>  #
> >>
> >>  UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> >> -UNINATIVE_VERSION =3D "3.10"
> >> +UNINATIVE_VERSION =3D "4.0"
> >>
> >>  UNINATIVE_URL ?=3D "
> http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}=
/
> "
> >> -UNINATIVE_CHECKSUM[aarch64] ?=3D
> "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
> >> -UNINATIVE_CHECKSUM[i686] ?=3D
> "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
> >> -UNINATIVE_CHECKSUM[x86_64] ?=3D
> "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
> >> +UNINATIVE_CHECKSUM[aarch64] ?=3D
> "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
> >> +UNINATIVE_CHECKSUM[i686] ?=3D
> "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
> >> +UNINATIVE_CHECKSUM[x86_64] ?=3D
> "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#182136):
> https://lists.openembedded.org/g/openembedded-core/message/182136
> >> Mute This Topic: https://lists.openembedded.org/mt/99279066/3617156
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> Martin.Jansa@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000cf460705fd53b781
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80)">&gt; It might be useful=
 to delay backporting this for a bit longer (and I&#39;ll soon confirm if 3=
.10 was already affected or not).</span><br><div><span style=3D"color:rgb(8=
0,0,80)"><br></span></div><div><span style=3D"color:rgb(80,0,80)">I can con=
firm that 3.10 is also affected.</span></div><div><span style=3D"color:rgb(=
80,0,80)"><br></span></div><div><span style=3D"color:rgb(80,0,80)">I did bu=
ild with=C2=A0</span><a href=3D"https://git.openembedded.org/openembedded-c=
ore-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D75e3870ea124321b81f85=
6c4e5170c891f0bd050" target=3D"_blank">https://git.openembedded.org/openemb=
edded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D75e3870ea12432=
1b81f856c4e5170c891f0bd050</a> and mkfs.ext4 didn&#39;t segfault. With unin=
ative 3.10 from=C2=A0<a href=3D"https://git.openembedded.org/openembedded-c=
ore-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D680eecc3ae09ea5585e46=
ff0e67f7c6704221806" target=3D"_blank">https://git.openembedded.org/openemb=
edded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D680eecc3ae09ea=
5585e46ff0e67f7c6704221806</a> it segfaults again.</div><div><br></div><div=
>I haven&#39;t reproduced the gdk-pixbuf-native issue with buildtools-exten=
ded 4.0.6 with kirkstone yet, so that one might be only with nanbield, but =
mkfs.ext4 segfaults seem related to uninative for sure. Will debug more whe=
n I get access.</div><div><br></div><div>Cheers,</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 4, 2023 =
at 9:14=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" t=
arget=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sun, Jun 4, 2023 at 7:39=E2=80=AFAM Ma=
rtin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">=
martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; it looks like this change is causing mkfs.ext4 to segfault on some bui=
lders.<br>
&gt;<br>
&gt; I&#39;m seeing it on ubuntu-18.04 (I know it&#39;s unsupported now). I=
t might be related to older docker or libseccomp2 there, because there is s=
imilar issue with gdk-pixbuf-native which fails when buildtools-extended is=
 used together with this and might be related to <a href=3D"https://github.=
com/moby/moby/issues/43595" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/moby/moby/issues/43595</a> because when I try very similar 18.04 u=
buntu image on my gentoo host I cannot reproduce neither the gdk-pixbuf-nat=
ive failure nor the mkfs.ext4 segfaults.<br>
&gt;<br>
&gt; I&#39;m trying to get access to some of the affected boxes to find out=
 which version docker/libseccomp2 is used there and to double check that th=
is is root cause for these failures (now I can only confirm that it started=
 in Nanbield when this uninative upgrade was merged and now I&#39;ve reprod=
uced the same with kirkstone-nut with the same uninative upgrade.<br>
&gt;<br>
&gt; It might be useful to delay backporting this for a bit longer (and I&#=
39;ll soon confirm if 3.10 was already affected or not).<br>
<br>
Agreed, I&#39;m struggling with kirkstone too, so will delay taking the<br>
uninative update until we learn more.<br>
<br>
Thanks for the review!<br>
<br>
Steve<br>
<br>
&gt; On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman &lt;<a href=3D"ma=
ilto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; From: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxfounda=
tion.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@li=
nuxfoundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<=
br>
&gt;&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org<=
/a>&gt;<br>
&gt;&gt; (cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a=
7)<br>
&gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----<br=
>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/c=
onf/distro/include/yocto-uninative.inc<br>
&gt;&gt; index f3c05b7e20..ad4816a1f3 100644<br>
&gt;&gt; --- a/meta/conf/distro/include/yocto-uninative.inc<br>
&gt;&gt; +++ b/meta/conf/distro/include/yocto-uninative.inc<br>
&gt;&gt; @@ -7,9 +7,9 @@<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 UNINATIVE_MAXGLIBCVERSION =3D &quot;2.37&quot;<br>
&gt;&gt; -UNINATIVE_VERSION =3D &quot;3.10&quot;<br>
&gt;&gt; +UNINATIVE_VERSION =3D &quot;4.0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 UNINATIVE_URL ?=3D &quot;<a href=3D"http://downloads.yoctopr=
oject.org/releases/uninative/$%7BUNINATIVE_VERSION%7D/" rel=3D"noreferrer" =
target=3D"_blank">http://downloads.yoctoproject.org/releases/uninative/${UN=
INATIVE_VERSION}/</a>&quot;<br>
&gt;&gt; -UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;b11f7dff0ff5e3c971f22e89a1=
05efb0f8d2006fd71d1ea3e5da771e416b0e01&quot;<br>
&gt;&gt; -UNINATIVE_CHECKSUM[i686] ?=3D &quot;ad7daa7fca7693ca07eea5279f830=
333530171d357759b380954a25254edd8dd&quot;<br>
&gt;&gt; -UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;ce8ff7e3247da312fbf84008f41=
5bc1b4d113ac9fe4ec91581e4a20cd8b475d3&quot;<br>
&gt;&gt; +UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;7baa8418a302df52e00916193b=
0a04f318356d9d2670c9a2bce3e966efefd738&quot;<br>
&gt;&gt; +UNINATIVE_CHECKSUM[i686] ?=3D &quot;83114d36883d43a521e280742b984=
9bf85d039b2f83d8e21d480659babe75ee8&quot;<br>
&gt;&gt; +UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;fd75b2a1a67a10f6b7d65afb7d0=
f3e71a63b0038e428f34dfe420bb37716558a&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#182136): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/182136" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/182136</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9927=
9066/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/99279066/3617156</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmai=
l.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000cf460705fd53b781--

