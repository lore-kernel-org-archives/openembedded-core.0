Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48498C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 18:40:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.44361.1679942430441844294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 11:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwRLPUKE;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id q16so12683450lfe.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679942429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yDlySDf1i86G8iduIo2lC7Cv70zmxY3bnhg5waI9668=;
        b=qwRLPUKE26XqkVPYIEaBG9IrB95eILO0gl7z0iWmqgRwoZFNvSq9aSepw4e3rkspNH
         hLrtJ9Cxct0nqvawLyW9tYyy/xUrOYEzsESC/hZtSeUuS1i9LjoNhTRtkM6CBIDMqtVs
         VjuUXNsQZusokDm1VwoSxGoP8QpcYc7OT/rPzR2+jEt4ZK1qibn6S7/wpeJnZxoUW52B
         CxS8tis0MRJ5pEouOTqTC55FODd8B08hZzl1IZ/OwAHJeN0LP4Owu3me9j37DKMrfIuj
         iXCVOA6hJt1+yYJTdXO+m38Yiv62zK3aIbWwDjL3CnPmHC6iEetOXtoS/VPXQNGfz2bv
         wXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679942429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDlySDf1i86G8iduIo2lC7Cv70zmxY3bnhg5waI9668=;
        b=GqRS9T8VuYRoSVtAIlbrj3Yac+uX+c5iiuL0cvgeAz/F3JCVqXpWliLjiPLWspKELq
         2eVE3M7qp5OIyaTqzgiWE+LJPoCu/bh9DlsNkvmgRNlnpEVUDANqo0E2mct6nbLJ0sWr
         J3zfIq9I0M1eWSwypPCYlXC1BQgMOxdC+BB5kIJWUWGYYXSfR1YNGxT3e8/A8ndlBKDe
         2qIU8xTJ3s2hKh5+fJw311r/Ba280Qt5BWswTQ2H6ocFmBTDLGcCacplYJnqX0/6rvWL
         KzB/r1/H1D2qoEvJ9vBK4Jjxunor16tKSnHf0n8c7HLm3APXGwNWtzMsFdnYLAdoqogL
         hO5A==
X-Gm-Message-State: AAQBX9ckVyXhQ+W7jzgxRBwQDThaKkRgxH8y2/Nu9klsjcGAA20APbEZ
	klXfjMAnA5Ibu8xC/PlskJTIdaQMBPy2DU6wCy4=
X-Google-Smtp-Source: AKy350bOjNjGN6UKDHd0SWFEWZLBDisuJOCD3McoAX8fkbDwHM75abxaBfvUkZE7gopt1dJR5HH7MRis0ekJE/PVd2w=
X-Received: by 2002:a19:7501:0:b0:4d5:ca32:6ed8 with SMTP id
 y1-20020a197501000000b004d5ca326ed8mr3885584lfe.6.1679942428612; Mon, 27 Mar
 2023 11:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com>
 <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
 <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com> <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com>
In-Reply-To: <CAO5Uq5QBNLT-BuQhpSyoEwHGd_c+JEt8q9UKEFA6ejjKab7-4w@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 20:40:17 +0200
Message-ID: <CA+cAkeoZTZCBogKpy5mrn=G+w+hedMmm4KGB3q=8Ubp_=rOoRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b35ce505f7e61338"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 18:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179171

--000000000000b35ce505f7e61338
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok great, I'm willing to know more about the bootstrap of a rust toolchain,
I think I can start by just upgrading my poky master to rust 1.68 and see
what it spills out when I compile the hello world

On the other hand, for enabling rust kernel modules in linux-yocto-dev, I
don't know where to start (full disclosure : I have no skills about kernel
and kernel module developments)

Le lun. 27 mars 2023, 20:30, Alex Kiernan <alex.kiernan@gmail.com> a =C3=A9=
crit :

> Updating the rust version is pretty much nothing to do with your rust
> knowledge and way more about digging into how the bootstrap process
> hangs together... whilst I have an awesome rustacean working for me, I
> don't think I've ever had to drag him into helping with an upgrade.
>
> I wish I could say I'd spent the last few weeks figuring out why the
> upgrade broke, but I've been buried down the bottom of an ESP-IDF
> application...
>
> Alex
>
> On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > I'll look at this but I'm not sure if I can help since I'm a beginner
> (enthusiastic but still)
> >
> > Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gmail.com>
> a =C3=A9crit :
> >>
> >> If you'd like to do more here's off the top of my head:
> >>
> >> - enable rust kernel modules in linux-yocto-dev
> >>
> >> - help Alex Kiernan with update 1.67 -> 1.68; we need as many people
> >> as possible capable of updating the rust toolchain. It's often not
> >> trivial:
> >> https://lists.openembedded.org/g/openembedded-core/message/178272
> >>
> >> Alex
> >>
> >> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> >> <frederic.martinsons@gmail.com> wrote:
> >> >
> >> > Ah!
> >> >
> >> > Alright, I'll try to setup a devtool test which demonstrate the usag=
e
> of git subpath with the zvariant.
> >> > I'll then issue a V4 series which reintroduce the zvariant recipe in
> meta-selftest and the unit test on it.
> >> >
> >> > I must admit I felt in love for rust since the beginning of the year
> and considering that I use yocto on a daily basis, I'll do everything I c=
an
> to extend the support of developing rust for embedded devices.
> >> >
> >> > Thank you all for the advices.
> >> >
> >> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <
> alex.kanavin@gmail.com> a =C3=A9crit :
> >> >>
> >> >> So if devtool tests would operate on zvariant recipe, then the reci=
pe
> >> >> can simply go into meta-selftest after all :)
> >> >>
> >> >> Alex
> >> >>
> >> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> >> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >> >
> >> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
> >> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >> >> > >
> >> >> > > This series brings the support of local git repository inside
> >> >> > > a cargo based recipe.
> >> >> > >
> >> >> > > It also enable devtool capacity on it and provide a real crate
> >> >> > > example recipe to show how things are done.
> >> >> > >
> >> >> > > The following changes since commit
> 4876189dd2ae5a04a296b11b537b9f613159c6bf:
> >> >> > >
> >> >> > >   xcb-proto: Fix install conflict when enable multilib.
> (2023-03-23 22:38:41 +0000)
> >> >> > >
> >> >> > > are available in the Git repository at:
> >> >> > >
> >> >> > >   https://gitlab.com/fmartinsons/openembedded-core
> cargo-extend-support-git-and-devtool
> >> >> > >
> >> >> > > Alex Kiernan (1):
> >> >> > >   cargo_common.bbclass: Support local github repos
> >> >> > >
> >> >> > > Frederic Martinsons (4):
> >> >> > >   cargo_common.bbclass: add support of user in url for patch
> >> >> > >   rust-example: provide a recipe for zvariant
> >> >> > >   devtool: add support for multiple git url inside a cargo base=
d
> recipe
> >> >> > >   patch: support of git patches when the source uri contained
> subpath
> >> >> > >     param
> >> >> >
> >> >> > The various rust/cargo/crate patches look like they're heading in=
 a
> >> >> > good direction, thanks!
> >> >> >
> >> >> > The one thing which I think is missing is more support for testin=
g
> some
> >> >> > of these changes in our automated testing.
> >> >> >
> >> >> > In particular, devtool does have a decent test suite so we should
> >> >> > ensure new devtool additions have tests.
> >> >> >
> >> >> > You can see the devtools tests in
> >> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a comma=
nd
> >> >> > like "oe-selftest -r devtool -j 3" for example.
> >> >> >
> >> >> > Cheers,
> >> >> >
> >> >> > Richard
> >> >> >
> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> > Links: You receive all messages sent to this group.
> >> >> > View/Reply Online (#179160):
> https://lists.openembedded.org/g/openembedded-core/message/179160
> >> >> > Mute This Topic:
> https://lists.openembedded.org/mt/97840361/1686489
> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> >> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >> >
>
>
>
> --
> Alex Kiernan
>

--000000000000b35ce505f7e61338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Ok great, I&#39;m willing to know more about the boo=
tstrap of a rust toolchain, I think I can start by just upgrading my poky m=
aster to rust 1.68 and see what it spills out when I compile the hello worl=
d=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">On the other han=
d, for enabling rust kernel modules in linux-yocto-dev, I don&#39;t know wh=
ere to start (full disclosure : I have no skills about kernel and kernel mo=
dule developments)=C2=A0<br><br><div class=3D"gmail_quote" dir=3D"auto"><di=
v dir=3D"ltr" class=3D"gmail_attr">Le lun. 27 mars 2023, 20:30, Alex Kierna=
n &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Updating th=
e rust version is pretty much nothing to do with your rust<br>
knowledge and way more about digging into how the bootstrap process<br>
hangs together... whilst I have an awesome rustacean working for me, I<br>
don&#39;t think I&#39;ve ever had to drag him into helping with an upgrade.=
<br>
<br>
I wish I could say I&#39;d spent the last few weeks figuring out why the<br=
>
upgrade broke, but I&#39;ve been buried down the bottom of an ESP-IDF<br>
application...<br>
<br>
Alex<br>
<br>
On Mon, Mar 27, 2023 at 7:08=E2=80=AFPM Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I&#39;ll look at this but I&#39;m not sure if I can help since I&#39;m=
 a beginner (enthusiastic but still)<br>
&gt;<br>
&gt; Le lun. 27 mars 2023, 19:19, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gm=
ail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; If you&#39;d like to do more here&#39;s off the top of my head:<br=
>
&gt;&gt;<br>
&gt;&gt; - enable rust kernel modules in linux-yocto-dev<br>
&gt;&gt;<br>
&gt;&gt; - help Alex Kiernan with update 1.67 -&gt; 1.68; we need as many p=
eople<br>
&gt;&gt; as possible capable of updating the rust toolchain. It&#39;s often=
 not<br>
&gt;&gt; trivial:<br>
&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/178272" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/message/178272</a><br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons<br>
&gt;&gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ah!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alright, I&#39;ll try to setup a devtool test which demonstra=
te the usage of git subpath with the zvariant.<br>
&gt;&gt; &gt; I&#39;ll then issue a V4 series which reintroduce the zvarian=
t recipe in meta-selftest and the unit test on it.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I must admit I felt in love for rust since the beginning of t=
he year and considering that I use yocto on a daily basis, I&#39;ll do ever=
ything I can to extend the support of developing rust for embedded devices.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you all for the advices.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Le lun. 27 mars 2023, 16:25, Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.k=
anavin@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; So if devtool tests would operate on zvariant recipe, the=
n the recipe<br>
&gt;&gt; &gt;&gt; can simply go into meta-selftest after all :)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Alex<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Mon, 27 Mar 2023 at 16:20, Richard Purdie<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinso=
ns wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto=
:frederic.martinsons@gmail.com" target=3D"_blank" rel=3D"noreferrer">freder=
ic.martinsons@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; This series brings the support of local git rep=
ository inside<br>
&gt;&gt; &gt;&gt; &gt; &gt; a cargo based recipe.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; It also enable devtool capacity on it and provi=
de a real crate<br>
&gt;&gt; &gt;&gt; &gt; &gt; example recipe to show how things are done.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; The following changes since commit 4876189dd2ae=
5a04a296b11b537b9f613159c6bf:<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0xcb-proto: Fix install conflict whe=
n enable multilib. (2023-03-23 22:38:41 +0000)<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/fmart=
insons/openembedded-core" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://gitlab.com/fmartinsons/openembedded-core</a> cargo-extend-support-gi=
t-and-devtool<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Alex Kiernan (1):<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass: Support local=
 github repos<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Frederic Martinsons (4):<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass: add support o=
f user in url for patch<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0rust-example: provide a recipe for =
zvariant<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0devtool: add support for multiple g=
it url inside a cargo based recipe<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0patch: support of git patches when =
the source uri contained subpath<br>
&gt;&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0param<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; The various rust/cargo/crate patches look like they&=
#39;re heading in a<br>
&gt;&gt; &gt;&gt; &gt; good direction, thanks!<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; The one thing which I think is missing is more suppo=
rt for testing some<br>
&gt;&gt; &gt;&gt; &gt; of these changes in our automated testing.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; In particular, devtool does have a decent test suite=
 so we should<br>
&gt;&gt; &gt;&gt; &gt; ensure new devtool additions have tests.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; You can see the devtools tests in<br>
&gt;&gt; &gt;&gt; &gt; meta/lib/oeqa/selftest/cases/devtool.py and run them=
 with a command<br>
&gt;&gt; &gt;&gt; &gt; like &quot;oe-selftest -r devtool -j 3&quot; for exa=
mple.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Richard<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent to this group.<=
br>
&gt;&gt; &gt;&gt; &gt; View/Reply Online (#179160): <a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/179160" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-c=
ore/message/179160</a><br>
&gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedd=
ed.org/mt/97840361/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://lists.openembedded.org/mt/97840361/1686489</a><br>
&gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bo=
wner@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembed=
ded-core+owner@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.k=
anavin@gmail.com</a>]<br>
&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div></div></div>

--000000000000b35ce505f7e61338--

