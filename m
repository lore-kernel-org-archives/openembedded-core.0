Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480F4C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:02:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2714.1686250930493173727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 12:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AO3uteLK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30d181952a2so971729f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686250929; x=1688842929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ0k3AbWDHh2PYslhAeG8+3cGHORNaN9zYW2L83cVx0=;
        b=AO3uteLKisAk3exC17i+1wCafVsWhJfrNRiYOuatdbVcQ7q+AYfSnOiDcLisDmFMS/
         qMxiTkYLkWJNGsAjd8A9+jXTpGMzDRT4GxiTw1EQRpCS3qtjhYIM2pBgxkE36iRtSPpj
         39SEGJM9AGB9kZ1Q7zhr6m6ofYkpzyWlVi40VwW6NXw4laWseEPeP0xxg1fOYmb4a6w+
         BlKexSFhufPtcZ+HITACTsmoursvoY1gl62NEx+uc7/LDcY4eWYdICLgXwYB3j1y7FfV
         HR+IvNdcOX5kbcY1jJunit8U9ofhn0EhubkgS75Xb0U20YuQ/zOKklwEYLkzRUnMbuMR
         Ol5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686250929; x=1688842929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQ0k3AbWDHh2PYslhAeG8+3cGHORNaN9zYW2L83cVx0=;
        b=AbYVm42n/QYO24geKtD3VUPbJhlkpGpDQTWjGBZKTjNnnJ7L+H718MZurp2NZzFg9X
         gvP4DsyHOaqrAYUVxI9j1LbyAX+CAt70iMHHP4dgMHs2x9dkWy/N6bdnCCh9CRIefVsP
         qEMNI5qpwU32Ke5EkSd41IRE6QlnPDM0d38gRd0CpLVKmbmESKZQmQeT2HEKQijQuqr5
         U188anO76dJQ5hOTOzqsa2VemDZp4cNgZDpgXlo3k94Vgugwa8wOChFfq9XFsmJrMAZR
         ThRC+Q1qS923ywaXayp6BYOtgma1vvTixR1N/0/OSAjnjSmyZFTRix4mfDF3YBcf2A+i
         HWuQ==
X-Gm-Message-State: AC+VfDwj4J6Xp2WC7QfUxflMZIkT7oN5291j9Y3d5TmkCm17+dQQvKsA
	8xE9cf6p4FH3CUtGSXVr7fHkrla3abFh2U6qUQ0=
X-Google-Smtp-Source: ACHHUZ6E7D5ClKP16jWDmtNAXW/dgyQu7adKX6dnxqovFU6S1f8i17CBfDUkf7oOwZXAA3mF+Z+Avnm4eEozePryf20=
X-Received: by 2002:adf:fc48:0:b0:309:ccad:b2fb with SMTP id
 e8-20020adffc48000000b00309ccadb2fbmr7617699wrs.5.1686250928448; Thu, 08 Jun
 2023 12:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685672395.git.steve@sakoman.com> <0470293e16f424ba4ee6505f3ef68e5ee13df483.1685672395.git.steve@sakoman.com>
 <CA+chaQdwObovTdLKQDoK5iKs4JDZXMNbmKc8X-EJFLaNJdX+Ww@mail.gmail.com>
 <CAOSpxdabCO0O+Ct_wMeYxCiZ60=33tC3a0jAqw=yL12KSfNpCA@mail.gmail.com>
 <CA+chaQf2FWd9rhOU07s0ra8S5tkEKNDZsjiXFY+GDynssuBd9A@mail.gmail.com> <CAOSpxdZh5U4YfR8soPdSc-_RD=312WjevEoo5P184FGtg7EhMQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZh5U4YfR8soPdSc-_RD=312WjevEoo5P184FGtg7EhMQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 8 Jun 2023 21:01:56 +0200
Message-ID: <CA+chaQenYHecc0dtmxcmaAT_m0Hvs1D3Vhv9PNpZTeD9ismmOw@mail.gmail.com>
Subject: Re: [OE-core][mickledore 13/13] uninative: Upgrade to 4.0 to include
 latest gcc 13.1.1
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097abbf05fda2e36d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 19:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182519

--00000000000097abbf05fda2e36d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I still didn't get shell access to those builders, feel free to merge it as
is.

Hopefully other people don't have so outdated build infrastructure :).

Regards,

On Thu, Jun 8, 2023 at 8:50=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> On Sun, Jun 4, 2023 at 10:34=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > > It might be useful to delay backporting this for a bit longer (and
> I'll soon confirm if 3.10 was already affected or not).
> >
> > I can confirm that 3.10 is also affected.
> >
> > I did build with
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/kirkstone-nut&id=3D75e3870ea124321b81f856c4e5170c891f0bd050
> and mkfs.ext4 didn't segfault. With uninative 3.10 from
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/kirkstone-nut&id=3D680eecc3ae09ea5585e46ff0e67f7c6704221806
> it segfaults again.
> >
> > I haven't reproduced the gdk-pixbuf-native issue with
> buildtools-extended 4.0.6 with kirkstone yet, so that one might be only
> with nanbield, but mkfs.ext4 segfaults seem related to uninative for sure=
.
> Will debug more when I get access.
>
> Have you learned anything more on this issue?  I've continued testing
> mickledore both locally and on the autobuilder and I'm not seeing any
> failures :-(
>
> Steve
>
> > On Sun, Jun 4, 2023 at 9:14=E2=80=AFPM Steve Sakoman <steve@sakoman.com=
> wrote:
> >>
> >> On Sun, Jun 4, 2023 at 7:39=E2=80=AFAM Martin Jansa <martin.jansa@gmai=
l.com>
> wrote:
> >> >
> >> > Hi,
> >> >
> >> > it looks like this change is causing mkfs.ext4 to segfault on some
> builders.
> >> >
> >> > I'm seeing it on ubuntu-18.04 (I know it's unsupported now). It migh=
t
> be related to older docker or libseccomp2 there, because there is similar
> issue with gdk-pixbuf-native which fails when buildtools-extended is used
> together with this and might be related to
> https://github.com/moby/moby/issues/43595 because when I try very similar
> 18.04 ubuntu image on my gentoo host I cannot reproduce neither the
> gdk-pixbuf-native failure nor the mkfs.ext4 segfaults.
> >> >
> >> > I'm trying to get access to some of the affected boxes to find out
> which version docker/libseccomp2 is used there and to double check that
> this is root cause for these failures (now I can only confirm that it
> started in Nanbield when this uninative upgrade was merged and now I've
> reproduced the same with kirkstone-nut with the same uninative upgrade.
> >> >
> >> > It might be useful to delay backporting this for a bit longer (and
> I'll soon confirm if 3.10 was already affected or not).
> >>
> >> Agreed, I'm struggling with kirkstone too, so will delay taking the
> >> uninative update until we learn more.
> >>
> >> Thanks for the review!
> >>
> >> Steve
> >>
> >> > On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman <steve@sakoman.=
com>
> wrote:
> >> >>
> >> >> From: Michael Halstead <mhalstead@linuxfoundation.org>
> >> >>
> >> >> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> >> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> >> (cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7=
)
> >> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> >> ---
> >> >>  meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
> >> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >> >>
> >> >> diff --git a/meta/conf/distro/include/yocto-uninative.inc
> b/meta/conf/distro/include/yocto-uninative.inc
> >> >> index f3c05b7e20..ad4816a1f3 100644
> >> >> --- a/meta/conf/distro/include/yocto-uninative.inc
> >> >> +++ b/meta/conf/distro/include/yocto-uninative.inc
> >> >> @@ -7,9 +7,9 @@
> >> >>  #
> >> >>
> >> >>  UNINATIVE_MAXGLIBCVERSION =3D "2.37"
> >> >> -UNINATIVE_VERSION =3D "3.10"
> >> >> +UNINATIVE_VERSION =3D "4.0"
> >> >>
> >> >>  UNINATIVE_URL ?=3D "
> http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}=
/
> "
> >> >> -UNINATIVE_CHECKSUM[aarch64] ?=3D
> "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
> >> >> -UNINATIVE_CHECKSUM[i686] ?=3D
> "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
> >> >> -UNINATIVE_CHECKSUM[x86_64] ?=3D
> "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
> >> >> +UNINATIVE_CHECKSUM[aarch64] ?=3D
> "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
> >> >> +UNINATIVE_CHECKSUM[i686] ?=3D
> "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
> >> >> +UNINATIVE_CHECKSUM[x86_64] ?=3D
> "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
> >> >> --
> >> >> 2.34.1
> >> >>
> >> >>
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> Links: You receive all messages sent to this group.
> >> >> View/Reply Online (#182136):
> https://lists.openembedded.org/g/openembedded-core/message/182136
> >> >> Mute This Topic: https://lists.openembedded.org/mt/99279066/3617156
> >> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> >> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >>
>

--00000000000097abbf05fda2e36d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>I still didn&#39;t get shell =
access to those builders, feel free to merge it as is.</div><div><br></div>=
<div>Hopefully other people don&#39;t have so outdated build infrastructure=
 :).</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 8, 2023 at 8:50=E2=
=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakom=
an.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, Jun 4, 2023 at 10:34=E2=80=AFAM Martin Jansa &lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; &gt; It might be useful to delay backporting this for a bit longer (an=
d I&#39;ll soon confirm if 3.10 was already affected or not).<br>
&gt;<br>
&gt; I can confirm that 3.10 is also affected.<br>
&gt;<br>
&gt; I did build with <a href=3D"https://git.openembedded.org/openembedded-=
core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D75e3870ea124321b81f8=
56c4e5170c891f0bd050" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/openembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp=
;id=3D75e3870ea124321b81f856c4e5170c891f0bd050</a> and mkfs.ext4 didn&#39;t=
 segfault. With uninative 3.10 from <a href=3D"https://git.openembedded.org=
/openembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D680eec=
c3ae09ea5585e46ff0e67f7c6704221806" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/kir=
kstone-nut&amp;id=3D680eecc3ae09ea5585e46ff0e67f7c6704221806</a> it segfaul=
ts again.<br>
&gt;<br>
&gt; I haven&#39;t reproduced the gdk-pixbuf-native issue with buildtools-e=
xtended 4.0.6 with kirkstone yet, so that one might be only with nanbield, =
but mkfs.ext4 segfaults seem related to uninative for sure. Will debug more=
 when I get access.<br>
<br>
Have you learned anything more on this issue?=C2=A0 I&#39;ve continued test=
ing<br>
mickledore both locally and on the autobuilder and I&#39;m not seeing any<b=
r>
failures :-(<br>
<br>
Steve<br>
<br>
&gt; On Sun, Jun 4, 2023 at 9:14=E2=80=AFPM Steve Sakoman &lt;<a href=3D"ma=
ilto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On Sun, Jun 4, 2023 at 7:39=E2=80=AFAM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; it looks like this change is causing mkfs.ext4 to segfault on=
 some builders.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m seeing it on ubuntu-18.04 (I know it&#39;s unsupporte=
d now). It might be related to older docker or libseccomp2 there, because t=
here is similar issue with gdk-pixbuf-native which fails when buildtools-ex=
tended is used together with this and might be related to <a href=3D"https:=
//github.com/moby/moby/issues/43595" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/moby/moby/issues/43595</a> because when I try very simila=
r 18.04 ubuntu image on my gentoo host I cannot reproduce neither the gdk-p=
ixbuf-native failure nor the mkfs.ext4 segfaults.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m trying to get access to some of the affected boxes to=
 find out which version docker/libseccomp2 is used there and to double chec=
k that this is root cause for these failures (now I can only confirm that i=
t started in Nanbield when this uninative upgrade was merged and now I&#39;=
ve reproduced the same with kirkstone-nut with the same uninative upgrade.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It might be useful to delay backporting this for a bit longer=
 (and I&#39;ll soon confirm if 3.10 was already affected or not).<br>
&gt;&gt;<br>
&gt;&gt; Agreed, I&#39;m struggling with kirkstone too, so will delay takin=
g the<br>
&gt;&gt; uninative update until we learn more.<br>
&gt;&gt;<br>
&gt;&gt; Thanks for the review!<br>
&gt;&gt;<br>
&gt;&gt; Steve<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Fri, Jun 2, 2023 at 4:22=E2=80=AFAM Steve Sakoman &lt;<a h=
ref=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt=
; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; From: Michael Halstead &lt;<a href=3D"mailto:mhalstead@li=
nuxfoundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mha=
lstead@linuxfoundation.org" target=3D"_blank">mhalstead@linuxfoundation.org=
</a>&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfounda=
tion.org</a>&gt;<br>
&gt;&gt; &gt;&gt; (cherry picked from commit f87becb69e02bdf055dffb633ed4f6=
d36b36f7a7)<br>
&gt;&gt; &gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@=
sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/conf/distro/include/yocto-uninative.inc | 8 ++=
++----<br>
&gt;&gt; &gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/conf/distro/include/yocto-uninative.inc=
 b/meta/conf/distro/include/yocto-uninative.inc<br>
&gt;&gt; &gt;&gt; index f3c05b7e20..ad4816a1f3 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/conf/distro/include/yocto-uninative.inc<br>
&gt;&gt; &gt;&gt; +++ b/meta/conf/distro/include/yocto-uninative.inc<br>
&gt;&gt; &gt;&gt; @@ -7,9 +7,9 @@<br>
&gt;&gt; &gt;&gt;=C2=A0 #<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 UNINATIVE_MAXGLIBCVERSION =3D &quot;2.37&quot;<br>
&gt;&gt; &gt;&gt; -UNINATIVE_VERSION =3D &quot;3.10&quot;<br>
&gt;&gt; &gt;&gt; +UNINATIVE_VERSION =3D &quot;4.0&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 UNINATIVE_URL ?=3D &quot;<a href=3D"http://download=
s.yoctoproject.org/releases/uninative/$%7BUNINATIVE_VERSION%7D/" rel=3D"nor=
eferrer" target=3D"_blank">http://downloads.yoctoproject.org/releases/unina=
tive/${UNINATIVE_VERSION}/</a>&quot;<br>
&gt;&gt; &gt;&gt; -UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;b11f7dff0ff5e3c97=
1f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01&quot;<br>
&gt;&gt; &gt;&gt; -UNINATIVE_CHECKSUM[i686] ?=3D &quot;ad7daa7fca7693ca07ee=
a5279f830333530171d357759b380954a25254edd8dd&quot;<br>
&gt;&gt; &gt;&gt; -UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;ce8ff7e3247da312fb=
f84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3&quot;<br>
&gt;&gt; &gt;&gt; +UNINATIVE_CHECKSUM[aarch64] ?=3D &quot;7baa8418a302df52e=
00916193b0a04f318356d9d2670c9a2bce3e966efefd738&quot;<br>
&gt;&gt; &gt;&gt; +UNINATIVE_CHECKSUM[i686] ?=3D &quot;83114d36883d43a521e2=
80742b9849bf85d039b2f83d8e21d480659babe75ee8&quot;<br>
&gt;&gt; &gt;&gt; +UNINATIVE_CHECKSUM[x86_64] ?=3D &quot;fd75b2a1a67a10f6b7=
d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a&quot;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.34.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt;&gt; View/Reply Online (#182136): <a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/182136" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1821=
36</a><br>
&gt;&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.or=
g/mt/99279066/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/mt/99279066/3617156</a><br>
&gt;&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@=
lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.ope=
nembedded.org</a><br>
&gt;&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/=
openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists=
.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.J=
ansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div>

--00000000000097abbf05fda2e36d--

