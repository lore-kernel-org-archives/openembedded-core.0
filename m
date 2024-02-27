Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308ACC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:00:50 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.9844.1709031644513315174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQEjtTuo;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-47047e7b068so302347137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709031643; x=1709636443; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yTgH9HboPevE9zToi09OJhs3xnnXmfxkgKZObwqFlzg=;
        b=EQEjtTuoMyPr6bsutPQw768oEGzD1/bb0YEFT6DxsCdZks6jYLz7xE6gZJ4kghsKRS
         aYTQzwLdJqbrRo8ICa4kvLvPe5IfCMzcehaEWnQSIzpt2chJqvL5+LYf3VHrI7QS9Pud
         pB92bJzmq68VU0A9YSsoAJ8IjM+Itk6AdJoCSkkMxkuBq6BFjU2JR3+zZvhCGmclMxVd
         vVkgSYOs9qfLiIH+pPYNBApo5gPwR+8RJRgWGgHFmH39M3Sgpr3s35ELUGTICqFUBN/k
         p/9qIvOtl79iZ4695oCXpT4oAdM2F4apvbhK4w1b9nYZwkIldoaBbGhgiSxDg7Sn143M
         wPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031643; x=1709636443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTgH9HboPevE9zToi09OJhs3xnnXmfxkgKZObwqFlzg=;
        b=bnTbSUHKOmxECZX6+FVFhW8wHwIo2kIz44o/cnr57fqPxt+mLxTEZJ/TMW+GZfHsLe
         EUPlWDaZLPf52z8SfiINDRbegLBcCzwY5WdYV5c5qTKMSdlxB9Xrofct8OvQNEk8+gaX
         399g64bIR1zReYxbxp9iZtOxsUuq2QCMNHz03W8lg1I4ppfibWXW7u3zQPDJ1ptEkeMZ
         436dos60eHR62M+cmCKh4+BI39DVhU/Kj6Ci8KSLUVLZ5LHhJE29fy505mHKji5PaA08
         Jts7aXSke0myKrSKcFvYUM2CY9PqpzkdN5cPNvJKvoNM/jwWWVPJZSYl5KhnrhFnBvgm
         3vJQ==
X-Gm-Message-State: AOJu0YzTLMV3ZRUD/ki+xmfOcaKI0DV9XFWN3caY715At15OvJgVuqiB
	6zMThA6BwW0KxlrENWPTkUrFuFpIwI5jwdDG7vNL+6xgi95CddjEoH2JAm/0/q8wjYJUubU3uYr
	5rZGnQdRU+Vjfpktu5Mdjm5LR0pU=
X-Google-Smtp-Source: AGHT+IHPkoew9x1Er5U4mgim8Ra1AYTGLcO/eIO8LKIa662XlS1f10rtf1+XEBW6IX3cGq1kVmgDY1Q3bC6bpF/xAsk=
X-Received: by 2002:a05:6102:3d14:b0:470:5792:cf86 with SMTP id
 i20-20020a0561023d1400b004705792cf86mr8052308vsv.0.1709031642344; Tue, 27 Feb
 2024 03:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <17B7B05748A57C25.14830@lists.openembedded.org> <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
 <CANNYZj99yBvrCE+4U8d6V-n6Ex5Lh=SmNDx-aDM6p-FveHvH7Q@mail.gmail.com>
In-Reply-To: <CANNYZj99yBvrCE+4U8d6V-n6Ex5Lh=SmNDx-aDM6p-FveHvH7Q@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 27 Feb 2024 11:00:31 +0000
Message-ID: <CANPvuRmt5chfYTJuWr_bySjN4+0fDXhxOyqzxg2q9g1vWLFbbQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000f3b74106125aefa7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196259

--000000000000f3b74106125aefa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu (ter=C3=A7a, 27/02/2024=
 =C3=A0(s)
10:51):

> I was going to do that, but RP beat me to it:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6613
>
>
I'm also going to do more tests today especially on more complex stacks
like Docker.
I know we are in a feature freeze but I would really like to be able to
submit the
update to the latest golang before the next LTS 5.0.

Thank you both for running this on the autobuilder.

Jose


> Alex
>
> On Tue, 27 Feb 2024 at 11:13, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Hi,
> >
> > I would like to ask if this patchset could be exercised in the
> autobuilder?
> > I only got it working yesterday and today I'm going to do a more
> exhaustive test.
> > This is still missing the update to 1.22, which I'll do later, but
> testing this would be a good help.
> >
> > Jose
> >
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 27/02/2024 =C3=A0=
(s) 10:07):
> >>
> >> With go-1.21 dynamic linking cause a runtime panic:
> >>
> >> | root@qemux86-64:~# go-helloworld
> >> | panic: runtime error: index out of range [0] with length 0
> >> |
> >> | goroutine 1 [running]:
> >> | flag.init()
> >> |         /usr/lib/go/src/flag/flag.go:1199 +0xf9
> >>
> >> In my opinion, this would be a good trade-off so that we can update an=
d
> >> leave the version 1.20 for the next LTS 5.0 since we are already quite
> >> behind on the version available upstream which already has the 1.22
> available.
> >>
> >> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> ---
> >>  meta/classes-recipe/goarch.bbclass | 14 +++++++-------
> >>  1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta/classes-recipe/goarch.bbclass
> b/meta/classes-recipe/goarch.bbclass
> >> index 1ebe03864f..6899ec28e4 100644
> >> --- a/meta/classes-recipe/goarch.bbclass
> >> +++ b/meta/classes-recipe/goarch.bbclass
> >> @@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D '5'
> >>  # Go supports dynamic linking on a limited set of architectures.
> >>  # See the supportsDynlink function in
> go/src/cmd/compile/internal/gc/main.go
> >>  GO_DYNLINK =3D ""
> >> -GO_DYNLINK:arm ?=3D "1"
> >> -GO_DYNLINK:aarch64 ?=3D "1"
> >> -GO_DYNLINK:x86 ?=3D "1"
> >> -GO_DYNLINK:x86-64 ?=3D "1"
> >> -GO_DYNLINK:powerpc64 ?=3D "1"
> >> -GO_DYNLINK:powerpc64le ?=3D "1"
> >> -GO_DYNLINK:class-native ?=3D ""
> >> +GO_DYNLINK:arm =3D ""
> >> +GO_DYNLINK:aarch64 =3D ""
> >> +GO_DYNLINK:x86 =3D ""
> >> +GO_DYNLINK:x86-64 =3D ""
> >> +GO_DYNLINK:powerpc64 =3D ""
> >> +GO_DYNLINK:powerpc64le =3D ""
> >> +GO_DYNLINK:class-native =3D ""
> >>  GO_DYNLINK:class-nativesdk =3D ""
> >>
> >>  # define here because everybody inherits this class
> >> --
> >> 2.44.0
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#196253):
> https://lists.openembedded.org/g/openembedded-core/message/196253
> > Mute This Topic: https://lists.openembedded.org/mt/104600118/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f3b74106125aefa7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu (ter=C3=
=A7a, 27/02/2024 =C3=A0(s) 10:51):<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">I was going to do that, but RP beat me to it:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/6613" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/6613</a><br>
<br></blockquote><div><br></div>I&#39;m also going to do more tests today e=
specially on more complex stacks like Docker.</div><div class=3D"gmail_quot=
e">I know we are in a feature freeze but I would really like to be able to =
submit the</div><div class=3D"gmail_quote">update to the latest golang befo=
re the next LTS 5.0.<br><br><div>Thank you both for running this on the aut=
obuilder.<br><br>Jose<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Alex<br>
<br>
On Tue, 27 Feb 2024 at 11:13, Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I would like to ask if this patchset could be exercised in the autobui=
lder?<br>
&gt; I only got it working yesterday and today I&#39;m going to do a more e=
xhaustive test.<br>
&gt; This is still missing the update to 1.22, which I&#39;ll do later, but=
 testing this would be a good help.<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 27/02/2024 =C3=A0(=
s) 10:07):<br>
&gt;&gt;<br>
&gt;&gt; With go-1.21 dynamic linking cause a runtime panic:<br>
&gt;&gt;<br>
&gt;&gt; | root@qemux86-64:~# go-helloworld<br>
&gt;&gt; | panic: runtime error: index out of range [0] with length 0<br>
&gt;&gt; |<br>
&gt;&gt; | goroutine 1 [running]:<br>
&gt;&gt; | flag.init()<br>
&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/go/src/flag/flag.go:11=
99 +0xf9<br>
&gt;&gt;<br>
&gt;&gt; In my opinion, this would be a good trade-off so that we can updat=
e and<br>
&gt;&gt; leave the version 1.20 for the next LTS 5.0 since we are already q=
uite<br>
&gt;&gt; behind on the version available upstream which already has the 1.2=
2 available.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@f=
oundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes-recipe/goarch.bbclass | 14 +++++++-------<br>
&gt;&gt;=C2=A0 1 file changed, 7 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-rec=
ipe/goarch.bbclass<br>
&gt;&gt; index 1ebe03864f..6899ec28e4 100644<br>
&gt;&gt; --- a/meta/classes-recipe/goarch.bbclass<br>
&gt;&gt; +++ b/meta/classes-recipe/goarch.bbclass<br>
&gt;&gt; @@ -38,13 +38,13 @@ BASE_GOARM:armv5 =3D &#39;5&#39;<br>
&gt;&gt;=C2=A0 # Go supports dynamic linking on a limited set of architectu=
res.<br>
&gt;&gt;=C2=A0 # See the supportsDynlink function in go/src/cmd/compile/int=
ernal/gc/main.go<br>
&gt;&gt;=C2=A0 GO_DYNLINK =3D &quot;&quot;<br>
&gt;&gt; -GO_DYNLINK:arm ?=3D &quot;1&quot;<br>
&gt;&gt; -GO_DYNLINK:aarch64 ?=3D &quot;1&quot;<br>
&gt;&gt; -GO_DYNLINK:x86 ?=3D &quot;1&quot;<br>
&gt;&gt; -GO_DYNLINK:x86-64 ?=3D &quot;1&quot;<br>
&gt;&gt; -GO_DYNLINK:powerpc64 ?=3D &quot;1&quot;<br>
&gt;&gt; -GO_DYNLINK:powerpc64le ?=3D &quot;1&quot;<br>
&gt;&gt; -GO_DYNLINK:class-native ?=3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:arm =3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:aarch64 =3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:x86 =3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:x86-64 =3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:powerpc64 =3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:powerpc64le =3D &quot;&quot;<br>
&gt;&gt; +GO_DYNLINK:class-native =3D &quot;&quot;<br>
&gt;&gt;=C2=A0 GO_DYNLINK:class-nativesdk =3D &quot;&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # define here because everybody inherits this class<br>
&gt;&gt; --<br>
&gt;&gt; 2.44.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#196253): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/196253" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/196253</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10460011=
8/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104600118/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000f3b74106125aefa7--

