Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17D8C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 09:27:28 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.30541.1679909238953166103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 02:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XQ9+Pn3S;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id h25so10468863lfv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679909237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmCSHT2c+U54laPmHkqyogXZ/afdMd1nvk5DJVLXWUc=;
        b=XQ9+Pn3SxNSTJIS6Bh8sTZUee6ZSZWGs3F2NUOX74EE3mcgia8+xL/9BTvZMRlE52a
         uZHaXfE563Y9OcU66R4GZUiBNE9BHxy8ymv3kogw38b3k5rjJXsRN4Xzxkyd6ICYBr56
         THB6aiwry+cNsGGrYACS4Oj3nZ8nmv7A13SeVOv3dctOueJhe7ncFteP/6O1O03Os9AH
         ukJiQwInOens1hpqmA0W6Vbq7xh2D4f7j2BrwWBKarP6zcObjFgpbeMikpfgoFOJjQL4
         Rb/Gjri7L2oV+V9CuZEeNSW4ujKdTLSk09qbP5Nms9VDB1zXXhvsLl3qFsZYPixzdqKC
         z3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679909237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmCSHT2c+U54laPmHkqyogXZ/afdMd1nvk5DJVLXWUc=;
        b=nw7uo4+GdVRR9Oa0/Efqy4vntSB+nkf71VCDATW79rALPHWIDA97zPljLwxvoP0n6H
         tDgtFhkB6nCNVOtm6ju84QsM2yIeAGE+zV1wNz//G9nENbyki8MicrqrPeMcscwZYQ7F
         ZGhn9LmrkshDUE8vX1a9B4HL57/a6zvDoJ5V7C8KYtpDjymcSYuKx4zgSYYGuq/vna10
         3nhC2FP775SlRmAraA7INmunv9Y2+KCNsdWROgB1L0jX7/UhtNNstvEAQLsRDSMOuxk9
         GS0EqZsxNWuFkqGFgQTrtyB8qK8LxngUvUmx6hDlHvabaIBGe4DBgysis1JS+0iXRF4+
         lIQw==
X-Gm-Message-State: AAQBX9dpkIaYr2N+NT/rAkgqWpcAweV5WfgAUxeY9fWbI8k6J5FRQOEj
	oxv0tWdD2TRiKS6zeqsSCvEuZzrW4TcZlE1s+a4=
X-Google-Smtp-Source: AK7set9SOIlzj+EDnWrFS6HE8i4j8WexqcxM+pOPC+vFAcfcYZOlBTzJe2Ljukf3sElif3PT6K69F7g53YfjnllB7vQ=
X-Received: by 2002:a05:6512:2523:b0:4e8:3ee1:db14 with SMTP id
 be35-20020a056512252300b004e83ee1db14mr9288044lfb.6.1679909236931; Mon, 27
 Mar 2023 02:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
 <2e5fd3f0a5145af70fb1caee38d5cbf0a7c42877.1679842454.git.frederic.martinsons@gmail.com>
 <89ef864d-c816-b4e1-2425-85a46d001d18@berginkonsult.se> <CANNYZj8kqi2Vgg13esDKnS9JDgDdRhU5Dew-HZQOhq1B5GshQA@mail.gmail.com>
In-Reply-To: <CANNYZj8kqi2Vgg13esDKnS9JDgDdRhU5Dew-HZQOhq1B5GshQA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 27 Mar 2023 11:27:05 +0200
Message-ID: <CA+cAkept7dS4=nWRtdd98PbFr3NLpLxqs_FSifduYk+2DEkW4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCHV2 3/5] rust-example: provide a recipe for zvariant
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Bergin <peter@berginkonsult.se>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000052816705f7de59dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179152

--00000000000052816705f7de59dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is an ongoing discussion about the place for this recipe. When it
wil' be clear, I'll issue a dedicated patch for this.

In the meantime, I removed this example in the last version of this series
(V3)

Le lun. 27 mars 2023, 11:12, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> rust-hello-world is actually used in test images to verify that
> toolchains produce working binaries.
>
> For zvariant I guess meta-skeleton would work best, if the recipe
> comes with a README explaining why is it there, and how to handle
> maintenance of similar recipes.
>
> Alex
>
> On Mon, 27 Mar 2023 at 10:58, Peter Bergin <peter@berginkonsult.se> wrote=
:
> >
> >
> > On 2023-03-26 16:56, Frederic Martinsons wrote:
> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > >
> > > This recipe is for showing a "real world" example of
> > > a crate that depends on some git repositories.
> > >
> > > Usually, this kind of crate is built within a global
> > > workspace (here it is the zbus project) and so
> > > doesn't need a Cargo.lock on its own.
> > >
> > > For the sake of the demonstration, I had to add
> > > a patch for providing a Cargo.lock and modifying
> > > zvariant_derive to get it from crates.io instead
> > > of pulling locally with a relative path.
> > >
> > > The use case where the crate had some git repository
> > > in dependency is very common for "private" crate that
> > > are not aimed to be published on crates.io.
> > > When the project grow bigger, it is common to have
> > > a bin and multiple lib developped in parallel, and these
> > > libs are surely on a git repostitory.
> > >
> > > Hence the need of this support in oe-core.
> > >
> > > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > ---
> > >   .../rust-example/zvariant-crates.inc          |  140 ++
> > >   .../0001-Tweak-zvariant-cargo-config.patch    | 1249
> +++++++++++++++++
> > >   .../rust-example/zvariant_3.12.0.bb           |   20 +
> > >   3 files changed, 1409 insertions(+)
> > >   create mode 100644
> meta/recipes-extended/rust-example/zvariant-crates.inc
> > >   create mode 100644
> meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-con=
fig.patch
> > >   create mode 100644 meta/recipes-extended/rust-example/
> zvariant_3.12.0.bb
> >
> > Why not use meta-skeleton for the examples? I know and have seen before
> > that for some reason the rust-example is placed in oe-core/meta, but
> > think rust-example should have its home in meta-skeleton as it is the
> > place for example recipes. Just a suggestion to move this now before
> > filling up more example recipes among the core recipes.
> >
> > /Peter
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179150):
> https://lists.openembedded.org/g/openembedded-core/message/179150
> > Mute This Topic: https://lists.openembedded.org/mt/97862976/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000052816705f7de59dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There is an ongoing discussion about the place for this r=
ecipe. When it wil&#39; be clear, I&#39;ll issue a dedicated patch for this=
.<div dir=3D"auto"><br></div><div dir=3D"auto">In the meantime, I removed t=
his example in the last version of this series (V3)=C2=A0</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le lun. 27 m=
ars 2023, 11:12, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">rust-hello-world is actually used in test images to v=
erify that<br>
toolchains produce working binaries.<br>
<br>
For zvariant I guess meta-skeleton would work best, if the recipe<br>
comes with a README explaining why is it there, and how to handle<br>
maintenance of similar recipes.<br>
<br>
Alex<br>
<br>
On Mon, 27 Mar 2023 at 10:58, Peter Bergin &lt;<a href=3D"mailto:peter@berg=
inkonsult.se" target=3D"_blank" rel=3D"noreferrer">peter@berginkonsult.se</=
a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 2023-03-26 16:56, Frederic Martinsons wrote:<br>
&gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinso=
ns@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmai=
l.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This recipe is for showing a &quot;real world&quot; example of<br=
>
&gt; &gt; a crate that depends on some git repositories.<br>
&gt; &gt;<br>
&gt; &gt; Usually, this kind of crate is built within a global<br>
&gt; &gt; workspace (here it is the zbus project) and so<br>
&gt; &gt; doesn&#39;t need a Cargo.lock on its own.<br>
&gt; &gt;<br>
&gt; &gt; For the sake of the demonstration, I had to add<br>
&gt; &gt; a patch for providing a Cargo.lock and modifying<br>
&gt; &gt; zvariant_derive to get it from <a href=3D"http://crates.io" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io</a> instead<br>
&gt; &gt; of pulling locally with a relative path.<br>
&gt; &gt;<br>
&gt; &gt; The use case where the crate had some git repository<br>
&gt; &gt; in dependency is very common for &quot;private&quot; crate that<b=
r>
&gt; &gt; are not aimed to be published on <a href=3D"http://crates.io" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io</a>.<br>
&gt; &gt; When the project grow bigger, it is common to have<br>
&gt; &gt; a bin and multiple lib developped in parallel, and these<br>
&gt; &gt; libs are surely on a git repostitory.<br>
&gt; &gt;<br>
&gt; &gt; Hence the need of this support in oe-core.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic=
.martinsons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martin=
sons@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0.../rust-example/zvariant-crates.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 140 ++<br>
&gt; &gt;=C2=A0 =C2=A0.../0001-Tweak-zvariant-cargo-config.patch=C2=A0 =C2=
=A0 | 1249 +++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0.../rust-example/<a href=3D"http://zvariant_3.12.0.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +<br>
&gt; &gt;=C2=A0 =C2=A03 files changed, 1409 insertions(+)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/rust-example=
/zvariant-crates.inc<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/rust-example=
/zvariant/0001-Tweak-zvariant-cargo-config.patch<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/rust-example=
/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">zvariant_3.12.0.bb</a><br>
&gt;<br>
&gt; Why not use meta-skeleton for the examples? I know and have seen befor=
e<br>
&gt; that for some reason the rust-example is placed in oe-core/meta, but<b=
r>
&gt; think rust-example should have its home in meta-skeleton as it is the<=
br>
&gt; place for example recipes. Just a suggestion to move this now before<b=
r>
&gt; filling up more example recipes among the core recipes.<br>
&gt;<br>
&gt; /Peter<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179150): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179150" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1791=
50</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97862976=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/97862976/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000052816705f7de59dd--

