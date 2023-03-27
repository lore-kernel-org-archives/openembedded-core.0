Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E617C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 18:08:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.43547.1679940484672474286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 11:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L+zpDp2w;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id i13so12575185lfe.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679940483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IhKPG5lfCHTKU66pI4LkUCLfclDihTEefjB5sNSOdco=;
        b=L+zpDp2wtRL66+cgqJgEpP3ltflGll+j9+ewjkNGulRGpGPegTlG0AYmBb0SxJgcvy
         nwwJyhgFt2y6rad0/j2QEZZ8x+FrCmgosg+/atxb1C0oPiuTsXyOWcr5tw3KpQDWGqUN
         9C76ZFRlQiPWWMDILi6FTZ+JeiZ6wyukI46Sm6cKue7MoKlK/XpJ253PcunD8bMi0Sbr
         0NiGEnU2SRxLn7+F88LM9Cw6EBx7YJOlqY0N75EDXpoBY63rplxGJVfJGwIIU/UuPHg/
         Ti2+JFDXy36u8llGJsphe13XLNkjald7JvGDrj2mBU5YcDPzoEPqLEOEg24/PCkx5LJV
         jmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679940483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhKPG5lfCHTKU66pI4LkUCLfclDihTEefjB5sNSOdco=;
        b=OtYtwvgb3/1aJrNHs0E/gYFDV6NzBZyMT3fh95D9G3DKowrg0tjqUl6tvy3dPmEwIM
         RxSXjUo91iuc9l+f8YLv+LDvT/5yzxxLvWLutXu0dnS6jX6wy44z3NAYtnhKaOw514pQ
         NopM0NnDdG0JbofCUb/ttdhKK2QhTbZY1YQD9G5838FIGL4OnQK55AVr9kzT9O6JIQSi
         M/qfe6Bk+EwQb9FpUdJBi6J7SEy3GephHq1w1RpBceShBTHRo7aSAWxHOFUahwLEp9D6
         nSwHDoridwvG36Q16i4D5Cci82GKGbBGgC2qOtDkPD3P9Crw56xtMepHkfpFgM0ZCjEQ
         w8+A==
X-Gm-Message-State: AAQBX9c5AtUlPP3uVoAnAYyJAuJEL+deZZg4oCMEpC9s720ybS2La/ln
	La9UD8uGWS4Bb+8zjlet40JwRamYkJ/8cBZ08sU=
X-Google-Smtp-Source: AKy350YsDAkJwk1xKjDrv5XgEhvB/erOIA2tBKhB7Wz02Pi4ylVRHxjXwzDXXQMcglbM0A4OIzzrZ0tbVq2UaxwYOP0=
X-Received: by 2002:ac2:5223:0:b0:4d5:ca43:7049 with SMTP id
 i3-20020ac25223000000b004d5ca437049mr3673249lfl.12.1679940482409; Mon, 27 Mar
 2023 11:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
 <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
 <CA+cAkeqyAKnXHSvWDStkYCf6Uj99_OFaq5wQq60iLc6kkW7sDA@mail.gmail.com> <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
In-Reply-To: <CANNYZj82788D_5t+Pt8u6NT0KX0ZzaEfdUCGAD_f92tCCmS5OQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 20:07:50 +0200
Message-ID: <CA+cAkeqJESh4oOf=C5YevFdT3vLobLCELRD-wGvbPvvpexTmyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b2a8f905f7e59fac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 18:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179169

--000000000000b2a8f905f7e59fac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll look at this but I'm not sure if I can help since I'm a beginner
(enthusiastic but still)

Le lun. 27 mars 2023, 19:19, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> If you'd like to do more here's off the top of my head:
>
> - enable rust kernel modules in linux-yocto-dev
>
> - help Alex Kiernan with update 1.67 -> 1.68; we need as many people
> as possible capable of updating the rust toolchain. It's often not
> trivial:
> https://lists.openembedded.org/g/openembedded-core/message/178272
>
> Alex
>
> On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Ah!
> >
> > Alright, I'll try to setup a devtool test which demonstrate the usage o=
f
> git subpath with the zvariant.
> > I'll then issue a V4 series which reintroduce the zvariant recipe in
> meta-selftest and the unit test on it.
> >
> > I must admit I felt in love for rust since the beginning of the year an=
d
> considering that I use yocto on a daily basis, I'll do everything I can t=
o
> extend the support of developing rust for embedded devices.
> >
> > Thank you all for the advices.
> >
> > Le lun. 27 mars 2023, 16:25, Alexander Kanavin <alex.kanavin@gmail.com>
> a =C3=A9crit :
> >>
> >> So if devtool tests would operate on zvariant recipe, then the recipe
> >> can simply go into meta-selftest after all :)
> >>
> >> Alex
> >>
> >> On Mon, 27 Mar 2023 at 16:20, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
> >> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >> > >
> >> > > This series brings the support of local git repository inside
> >> > > a cargo based recipe.
> >> > >
> >> > > It also enable devtool capacity on it and provide a real crate
> >> > > example recipe to show how things are done.
> >> > >
> >> > > The following changes since commit
> 4876189dd2ae5a04a296b11b537b9f613159c6bf:
> >> > >
> >> > >   xcb-proto: Fix install conflict when enable multilib. (2023-03-2=
3
> 22:38:41 +0000)
> >> > >
> >> > > are available in the Git repository at:
> >> > >
> >> > >   https://gitlab.com/fmartinsons/openembedded-core
> cargo-extend-support-git-and-devtool
> >> > >
> >> > > Alex Kiernan (1):
> >> > >   cargo_common.bbclass: Support local github repos
> >> > >
> >> > > Frederic Martinsons (4):
> >> > >   cargo_common.bbclass: add support of user in url for patch
> >> > >   rust-example: provide a recipe for zvariant
> >> > >   devtool: add support for multiple git url inside a cargo based
> recipe
> >> > >   patch: support of git patches when the source uri contained
> subpath
> >> > >     param
> >> >
> >> > The various rust/cargo/crate patches look like they're heading in a
> >> > good direction, thanks!
> >> >
> >> > The one thing which I think is missing is more support for testing
> some
> >> > of these changes in our automated testing.
> >> >
> >> > In particular, devtool does have a decent test suite so we should
> >> > ensure new devtool additions have tests.
> >> >
> >> > You can see the devtools tests in
> >> > meta/lib/oeqa/selftest/cases/devtool.py and run them with a command
> >> > like "oe-selftest -r devtool -j 3" for example.
> >> >
> >> > Cheers,
> >> >
> >> > Richard
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#179160):
> https://lists.openembedded.org/g/openembedded-core/message/179160
> >> > Mute This Topic: https://lists.openembedded.org/mt/97840361/1686489
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [alex.kanavin@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--000000000000b2a8f905f7e59fac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;ll look at this but I&#39;m not sure if I can help =
since I&#39;m a beginner (enthusiastic but still)=C2=A0</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le lun. 27 mars 2023=
, 19:19, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">al=
ex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">If you&#39;d like to do more here&#39;s off the top of my hea=
d:<br>
<br>
- enable rust kernel modules in linux-yocto-dev<br>
<br>
- help Alex Kiernan with update 1.67 -&gt; 1.68; we need as many people<br>
as possible capable of updating the rust toolchain. It&#39;s often not<br>
trivial:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/17827=
2" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/178272</a><br>
<br>
Alex<br>
<br>
On Mon, 27 Mar 2023 at 17:01, Fr=C3=A9d=C3=A9ric Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Ah!<br>
&gt;<br>
&gt; Alright, I&#39;ll try to setup a devtool test which demonstrate the us=
age of git subpath with the zvariant.<br>
&gt; I&#39;ll then issue a V4 series which reintroduce the zvariant recipe =
in meta-selftest and the unit test on it.<br>
&gt;<br>
&gt; I must admit I felt in love for rust since the beginning of the year a=
nd considering that I use yocto on a daily basis, I&#39;ll do everything I =
can to extend the support of developing rust for embedded devices.<br>
&gt;<br>
&gt; Thank you all for the advices.<br>
&gt;<br>
&gt; Le lun. 27 mars 2023, 16:25, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gm=
ail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; So if devtool tests would operate on zvariant recipe, then the rec=
ipe<br>
&gt;&gt; can simply go into meta-selftest after all :)<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 27 Mar 2023 at 16:20, Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:=
<br>
&gt;&gt; &gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic=
.martinsons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martin=
sons@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; This series brings the support of local git repository i=
nside<br>
&gt;&gt; &gt; &gt; a cargo based recipe.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; It also enable devtool capacity on it and provide a real=
 crate<br>
&gt;&gt; &gt; &gt; example recipe to show how things are done.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; The following changes since commit 4876189dd2ae5a04a296b=
11b537b9f613159c6bf:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0xcb-proto: Fix install conflict when enable =
multilib. (2023-03-23 22:38:41 +0000)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/fmartinsons/op=
enembedded-core" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
tlab.com/fmartinsons/openembedded-core</a> cargo-extend-support-git-and-dev=
tool<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Alex Kiernan (1):<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass: Support local github r=
epos<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Frederic Martinsons (4):<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0cargo_common.bbclass: add support of user in=
 url for patch<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0rust-example: provide a recipe for zvariant<=
br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0devtool: add support for multiple git url in=
side a cargo based recipe<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0patch: support of git patches when the sourc=
e uri contained subpath<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0param<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The various rust/cargo/crate patches look like they&#39;re he=
ading in a<br>
&gt;&gt; &gt; good direction, thanks!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The one thing which I think is missing is more support for te=
sting some<br>
&gt;&gt; &gt; of these changes in our automated testing.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In particular, devtool does have a decent test suite so we sh=
ould<br>
&gt;&gt; &gt; ensure new devtool additions have tests.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; You can see the devtools tests in<br>
&gt;&gt; &gt; meta/lib/oeqa/selftest/cases/devtool.py and run them with a c=
ommand<br>
&gt;&gt; &gt; like &quot;oe-selftest -r devtool -j 3&quot; for example.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Richard<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#179160): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/179160" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/messa=
ge/179160</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/97840361/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/97840361/1686489</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+=
owner@lists.openembedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gm=
ail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000b2a8f905f7e59fac--

