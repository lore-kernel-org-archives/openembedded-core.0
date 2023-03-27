Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955B4C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 19:20:41 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.45594.1679944833065443753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 12:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ONRolYWV;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id o20so7256953ljp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679944831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/XZefom2V72mZQ8alTM4Nw0Y6H1HkE2uhatTkoGxj28=;
        b=ONRolYWVvK8zlDr9qOjuNJikShL0P1OzcTkmJKAxvfGfnr7LnxvvUn543dlyH/aQaw
         /cqS+Ue12FyqrJOzHoKUYyD8I2GJgaZVKA1WHemegYcT0Ym3itvkshTvjjr0560ePf44
         RvtmXT2jUWi7KVREEwUnApEiQ5Yn7lTkd4syRV82WpZGc+VEtHE+RyrIFvU1tsVAklhk
         ZA+K3z+rajfxqU/GT7vTwgj/fdNlKouiseiEteprwZmnzT97ZIm8A0E/4lJB8d1N94aN
         aWWFGw+/8+rC2OJFlEgIiGXnoDfXh5JvHHWCLQ6xEPqG7Irye001anPv4InIoxIJqDPd
         qVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679944831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XZefom2V72mZQ8alTM4Nw0Y6H1HkE2uhatTkoGxj28=;
        b=W8fL/999oPBJS0EDpa4JluNNHykH198iVuE+d+LUbyvAZmCVrvc6lK91Npp71ga0Wq
         tQW+/UBP789wWgBW6V4nSZx/ckeJkcYjQ7Ar8LIx8gHtM1TetZ1XFn6d/hlDJD+24dPv
         3sF2gnbOQDLeKu0Jl2eDfo8y7t2LrsA1OfFLpEgCWXDxVpnvTXj6xu668YBKP0AY0+7b
         2S0zu+Q1yp+t/f0XHBNa6HXH1MDSMvkyMhXIk86TPB95xnUXrwUCkNyxdXiPAEWWalYF
         t46+0mx4Cd7ZscdqkdEWe0Y9ddfKfxc+nFKOTNyvlcr2hPRaDxjrb/DqR/htz8shYhec
         3WZA==
X-Gm-Message-State: AAQBX9c+vFlhhMgvaAbxXC2T5Ku9qCc79Pv/A72Ro8JnHtGIWc8VgU9y
	sUsMyy9qiIWDp8oC5F/vXw1ZpDoi53VnEHLqVDY=
X-Google-Smtp-Source: AKy350ZXIT9tZAzDIyWovhJSCWCcrF/b1X0A2R3++VCDYGingvcTJc3VWH1RjwYnrXJTqT3WzKS9abaHemc9ETtBpNQ=
X-Received: by 2002:a05:651c:10e:b0:295:a82e:ec06 with SMTP id
 a14-20020a05651c010e00b00295a82eec06mr3899662ljb.3.1679944831037; Mon, 27 Mar
 2023 12:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
 <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
 <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
 <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com>
 <CA+cAkeoZTZCBogKpy5mrn=G+w+hedMmm4KGB3q=8Ubp_=rOoRQ@mail.gmail.com>
 <CAO5Uq5RNRnfH=_C4bDnT9u4puME_b_=G1DdmScHu7e4zanVF2A@mail.gmail.com> <CANNYZj-FzfwgzCUBnUrMzN_kigHF9ttc59svOACvFG=QjidsQQ@mail.gmail.com>
In-Reply-To: <CANNYZj-FzfwgzCUBnUrMzN_kigHF9ttc59svOACvFG=QjidsQQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 21:20:19 +0200
Message-ID: <CA+cAkeqkGmgszQbeRS4Z+8YP2uYa_OuWTpJUkmKyTnSQ8wOo1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e575f305f7e6a207"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 19:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179174

--000000000000e575f305f7e6a207
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you alex and alexender ;)

I'll take a look at this as soon as possible and and tell you in a
dedicated thread if I'm making progress. But first, I'll work for the
devtool test that has been mentioned first.

Have a good evening (or day, depending on your timezone)

Le lun. 27 mars 2023, 21:00, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> For the kernel modules you could start by replicating an out-of-yocto
> kernel build as shown here:
> https://lwn.net/Articles/910762/
>
> Alex
>
> On Mon, 27 Mar 2023 at 20:52, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
> >
> > IIRC the cross upgrade just works, its the target build which explodes:
> >
> > https://github.com/akiernan/openembedded-core
> >
> > On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
> > <frederic.martinsons@gmail.com> wrote:
> > >
> > > Ok great, I'm willing to know more about the bootstrap of a rust
> toolchain, I think I can start by just upgrading my poky master to rust
> 1.68 and see what it spills out when I compile the hello world
> > >
> > > On the other hand, for enabling rust kernel modules in
> linux-yocto-dev, I don't know where to start (full disclosure : I have no
> skills about kernel and kernel module developments)
> > >
> > > Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.com> a
> =C3=A9crit :
> > >>
> > >> Updating the rust version is pretty much nothing to do with your rus=
t
> > >> knowledge and way more about digging into how the bootstrap process
> > >> hangs together... whilst I have an awesome rustacean working for me,=
 I
> > >> don't think I've ever had to drag him into helping with an upgrade.
> > >>
> > >> I wish I could say I'd spent the last few weeks figuring out why the
> > >> upgrade broke, but I've been buried down the bottom of an ESP-IDF
> > >> application...
> > >>
> > >> Alex
> > >>
> > >> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinson=
s
> > >> <frederic.martinsons@gmail.com> wrote:
> > >> >
> > >> > I'll look at this but I'm not sure if I can help since I'm a
> beginner (enthusiastic but still)
> > >> >
> > >> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <
> alex.kanavin@gmail.com> a =C3=A9crit :
> > >> >>
> > >> >> If you'd like to do more here's off the top of my head:
> > >> >>
> > >> >> - enable rust kernel modules in linux-yocto-dev
> > >> >>
> > >> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as many
> people
> > >> >> as possible capable of updating the rust toolchain. It's often no=
t
> > >> >> trivial:
> > >> >> https://lists.openembedded.org/g/openembedded-core/message/178272
> > >> >>
> > >> >> Alex
> > >> >>
> > >> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> > >> >> <frederic.martinsons@gmail.com> wrote:
> > >> >> >
> > >> >> > Ah!
> > >> >> >
> > >> >> > Alright, I'll try to setup a devtool test which demonstrate the
> usage of git subpath with the zvariant.
> > >> >> > I'll then issue a V4 series which reintroduce the zvariant
> recipe in meta-selftest and the unit test on it.
> > >> >> >
> > >> >> > I must admit I felt in love for rust since the beginning of the
> year and considering that I use yocto on a daily basis, I'll do everythin=
g
> I can to extend the support of developing rust for embedded devices.
> > >> >> >
> > >> >> > Thank you all for the advices.
> > >> >> >
> > >> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <
> alex.kanavin@gmail.com> a =C3=A9crit :
> > >> >> >>
> > >> >> >> So if devtool tests would operate on zvariant recipe, then the
> recipe
> > >> >> >> can simply go into meta-selftest after all :)
> > >> >> >>
> > >> >> >> Alex
> > >> >> >>
> > >> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> > >> >> >> <richard.purdie@linuxfoundation.org> wrote:
> > >> >> >> >
> > >> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote=
:
> > >> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > >> >> >> > >
> > >> >> >> > > This series brings the support of local git repository
> inside
> > >> >> >> > > a cargo based recipe.
> > >> >> >> > >
> > >> >> >> > > It also enable devtool capacity on it and provide a real
> crate
> > >> >> >> > > example recipe to show how things are done.
> > >> >> >> > >
> > >> >> >> > > The following changes since commit
> 4876189dd2ae5a04a296b11b537b9f613159c6bf:
> > >> >> >> > >
> > >> >> >> > >   xcb-proto: Fix install conflict when enable multilib.
> (2023-03-23 22:38:41 +0000)
> > >> >> >> > >
> > >> >> >> > > are available in the Git repository at:
> > >> >> >> > >
> > >> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core
> cargo-extend-support-git-and-devtool
> > >> >> >> > >
> > >> >> >> > > Alex Kiernan (1):
> > >> >> >> > >   cargo_common.bbclass: Support local github repos
> > >> >> >> > >
> > >> >> >> > > Frederic Martinsons (4):
> > >> >> >> > >   cargo_common.bbclass: add support of user in url for pat=
ch
> > >> >> >> > >   rust-example: provide a recipe for zvariant
> > >> >> >> > >   devtool: add support for multiple git url inside a cargo
> based recipe
> > >> >> >> > >   patch: support of git patches when the source uri
> contained subpath
> > >> >> >> > >     param
> > >> >> >> >
> > >> >> >> > The various rust/cargo/crate patches look like they're
> heading in a
> > >> >> >> > good direction, thanks!
> > >> >> >> >
> > >> >> >> > The one thing which I think is missing is more support for
> testing some
> > >> >> >> > of these changes in our automated testing.
> > >> >> >> >
> > >> >> >> > In particular, devtool does have a decent test suite so we
> should
> > >> >> >> > ensure new devtool additions have tests.
> > >> >> >> >
> > >> >> >> > You can see the devtools tests in
> > >> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a
> command
> > >> >> >> > like "oe-selftest -r devtool -j 3" for example.
> > >> >> >> >
> > >> >> >> > Cheers,
> > >> >> >> >
> > >> >> >> > Richard
> > >> >> >> >
> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> >> >> > Links: You receive all messages sent to this group.
> > >> >> >> > View/Reply Online (#179160):
> https://lists.openembedded.org/g/openembedded-core/message/179160
> > >> >> >> > Mute This Topic:
> https://lists.openembedded.org/mt/97840361/1686489
> > >> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > >> >> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > >> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> >> >> >
> > >>
> > >>
> > >>
> > >> --
> > >> Alex Kiernan
> >
> >
> >
> > --
> > Alex Kiernan
>

--000000000000e575f305f7e6a207
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you alex and alexender ;)<div dir=3D"auto"><br></di=
v><div dir=3D"auto">I&#39;ll take a look at this as soon as possible and an=
d tell you in a dedicated thread if I&#39;m making progress. But first, I&#=
39;ll work for the devtool test that has been mentioned first.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Have a good evening (or day, dependi=
ng on your timezone)=C2=A0</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Le lun. 27 mars 2023, 21:00, Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">For the =
kernel modules you could start by replicating an out-of-yocto<br>
kernel build as shown here:<br>
<a href=3D"https://lwn.net/Articles/910762/" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://lwn.net/Articles/910762/</a><br>
<br>
Alex<br>
<br>
On Mon, 27 Mar 2023 at 20:52, Alex Kiernan &lt;<a href=3D"mailto:alex.kiern=
an@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; IIRC the cross upgrade just works, its the target build which explodes=
:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/akiernan/openembedded-core" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/akiernan/openembedde=
d-core</a><br>
&gt;<br>
&gt; On Mon, Mar 27, 2023 at 7:40=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons<=
br>
&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Ok great, I&#39;m willing to know more about the bootstrap of a r=
ust toolchain, I think I can start by just upgrading my poky master to rust=
 1.68 and see what it spills out when I compile the hello world<br>
&gt; &gt;<br>
&gt; &gt; On the other hand, for enabling rust kernel modules in linux-yoct=
o-dev, I don&#39;t know where to start (full disclosure : I have no skills =
about kernel and kernel module developments)<br>
&gt; &gt;<br>
&gt; &gt; Le lun. 27 mars 2023, 20:30, Alex Kiernan &lt;<a href=3D"mailto:a=
lex.kiernan@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gm=
ail.com</a>&gt; a =C3=A9crit :<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Updating the rust version is pretty much nothing to do with y=
our rust<br>
&gt; &gt;&gt; knowledge and way more about digging into how the bootstrap p=
rocess<br>
&gt; &gt;&gt; hangs together... whilst I have an awesome rustacean working =
for me, I<br>
&gt; &gt;&gt; don&#39;t think I&#39;ve ever had to drag him into helping wi=
th an upgrade.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I wish I could say I&#39;d spent the last few weeks figuring =
out why the<br>
&gt; &gt;&gt; upgrade broke, but I&#39;ve been buried down the bottom of an=
 ESP-IDF<br>
&gt; &gt;&gt; application...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Alex<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Ma=
rtinsons<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:=
<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I&#39;ll look at this but I&#39;m not sure if I can help=
 since I&#39;m a beginner (enthusiastic but still)<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Le lun. 27 mars 2023, 19:19, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">a=
lex.kanavin@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; If you&#39;d like to do more here&#39;s off the top =
of my head:<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; - enable rust kernel modules in linux-yocto-dev<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; - help Alex Kiernan with update 1.67 -&gt; 1.68; we =
need as many people<br>
&gt; &gt;&gt; &gt;&gt; as possible capable of updating the rust toolchain. =
It&#39;s often not<br>
&gt; &gt;&gt; &gt;&gt; trivial:<br>
&gt; &gt;&gt; &gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/message/178272" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/178272</a><br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Alex<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Mar=
tinsons<br>
&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Ah!<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Alright, I&#39;ll try to setup a devtool test w=
hich demonstrate the usage of git subpath with the zvariant.<br>
&gt; &gt;&gt; &gt;&gt; &gt; I&#39;ll then issue a V4 series which reintrodu=
ce the zvariant recipe in meta-selftest and the unit test on it.<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; I must admit I felt in love for rust since the =
beginning of the year and considering that I use yocto on a daily basis, I&=
#39;ll do everything I can to extend the support of developing rust for emb=
edded devices.<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Thank you all for the advices.<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Le lun. 27 mars 2023, 16:25, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"nore=
ferrer">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; So if devtool tests would operate on zvaria=
nt recipe, then the recipe<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; can simply go into meta-selftest after all =
:)<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; Alex<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; On Mon, 27 Mar 2023 at 16:20, Richard Purdi=
e<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfou=
ndation.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; On Sat, 2023-03-25 at 10:00 +0100, Fre=
deric Martinsons wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; From: Frederic Martinsons &lt;<a =
href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=3D"nore=
ferrer">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; This series brings the support of=
 local git repository inside<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; a cargo based recipe.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; It also enable devtool capacity o=
n it and provide a real crate<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; example recipe to show how things=
 are done.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; The following changes since commi=
t 4876189dd2ae5a04a296b11b537b9f613159c6bf:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0xcb-proto: Fix instal=
l conflict when enable multilib. (2023-03-23 22:38:41 +0000)<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; are available in the Git reposito=
ry at:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gi=
tlab.com/fmartinsons/openembedded-core" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">https://gitlab.com/fmartinsons/openembedded-core</a> cargo-ext=
end-support-git-and-devtool<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; Alex Kiernan (1):<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass:=
 Support local github repos<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt; Frederic Martinsons (4):<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass:=
 add support of user in url for patch<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0rust-example: provide=
 a recipe for zvariant<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0devtool: add support =
for multiple git url inside a cargo based recipe<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0patch: support of git=
 patches when the source uri contained subpath<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0param<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; The various rust/cargo/crate patches l=
ook like they&#39;re heading in a<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; good direction, thanks!<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; The one thing which I think is missing=
 is more support for testing some<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; of these changes in our automated test=
ing.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; In particular, devtool does have a dec=
ent test suite so we should<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; ensure new devtool additions have test=
s.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; You can see the devtools tests in<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; meta/lib/oeqa/selftest/cases/devtool.p=
y and run them with a command<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; like &quot;oe-selftest -r devtool -j 3=
&quot; for example.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Cheers,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Richard<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent t=
o this group.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; View/Reply Online (#179160): <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/179160" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/179160</a><br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://li=
sts.openembedded.org/mt/97840361/1686489" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://lists.openembedded.org/mt/97840361/1686489</a><br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openemb=
edded-core%2Bowner@lists.openembedded.org" target=3D"_blank" rel=3D"norefer=
rer">openembedded-core+owner@lists.openembedded.org</a><br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.=
openembedded.org/g/openembedded-core/unsub" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/unsub</=
a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"nore=
ferrer">alex.kanavin@gmail.com</a>]<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Alex Kiernan<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alex Kiernan<br>
</blockquote></div>

--000000000000e575f305f7e6a207--

