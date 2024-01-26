Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC65C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:58:28 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.2463.1706306298164472076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgG7oYAC;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-46b1cb24266so146505137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706306297; x=1706911097; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Z1lEPlsfjSE9sp8xbHVOQQuIXSG+FWnhwRCrBWC5Po=;
        b=AgG7oYACCXkCnE2fLZTDe3yKrDTv1M1EKxYR++d+I3nhNWVp2R6ZMnNMnY/uo/Zeug
         jl/Z9JoopDIivBU04cxk5twprfGcc67/1IFe06wMmIoySmj8ElzW5O7j2J+5vAbqVpud
         lHAfTzHvkUiX/nOQzHYj44L5K3Tb5NOkr23bZJLUXiQ8yydtiZd/pnOU8j5H9RykxNFi
         Np4qmFvvPnCoqB+X/jTf6JYAy8CIKoCW4Vc6SRm9f/vRV3kfKYFT/fzb/1cBNxWGwzKE
         mh6qwpWniheiZx016IVmO7gBYPsJG93xPy/W4wbb9Cks7hHu0oWaFPP+N031pfQmqXnL
         dw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306297; x=1706911097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Z1lEPlsfjSE9sp8xbHVOQQuIXSG+FWnhwRCrBWC5Po=;
        b=RxTKBCuvrjtiJSsllOYeax1ntKAeML3UwHgy0ZhsykteFuK4mL3mlbKGWQdRwmPnCI
         baFnrJafE2gl37yabBbCTB4dFdkyW2cFAWG5fzP8gvahLT8seHDyveEorLMcUSPY/K0N
         U3pQmdnyjlzaOzdaoEMVUwIUXOOzJbM2b9xvJcu5z0ZwUm71bz/Z1JDs4YuFDdbEZbBq
         iDFqLk4rSL6U9dhunUgLv0QJdqhktb1unplr9NdB09e/X7CgA86GOvR2WAEUuDA/qmZ3
         m1oCElSVdlpVsV1QOPEnHTmN2a5SP7xRZzHUXLlbY5C3ZdEV1Vo9luFM640NHzO3Wp5N
         HNTQ==
X-Gm-Message-State: AOJu0YyS8FFlCI0jxQSrXBnaRFC8Bu7X0kpnjfRNpKsXWMXIEDb9muum
	BCK1xrhGzUvVs8Q1uofVAWfWYRPleR69Q0GcX/Jx3R4q2kD/OWMDddqOjVv+UL5kLmfbFmIFxnf
	t+bU544c7leg19NZ0x2iO683TXA4=
X-Google-Smtp-Source: AGHT+IE+S/F8Uz0oV9ZFrO65Bz2WbWaZkYfQ55PDLxgFexEGN0uELR+QGVqQb/04xvYA6ft9TZqGb5TiMeCa3U6+DJM=
X-Received: by 2002:a05:6102:5f7:b0:46b:1d11:618c with SMTP id
 w23-20020a05610205f700b0046b1d11618cmr480451vsf.21.1706306297043; Fri, 26 Jan
 2024 13:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20240126160555.66586-1-jose.quaresma@foundries.io>
 <CANNYZj-geP-RWJqkdo=_gaO-44SJ0YHnyVoyNN2n3jybohQYWg@mail.gmail.com>
 <CANPvuR=YerzxFTmF4Ei7pwpL2jGY0xc_Gewy=Nc_-FX+7J6xDA@mail.gmail.com> <CAMKF1soAYU5Qnwfu7x_FTWmqLMU+jrqteknVyjMJNzHZKeJTjQ@mail.gmail.com>
In-Reply-To: <CAMKF1soAYU5Qnwfu7x_FTWmqLMU+jrqteknVyjMJNzHZKeJTjQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 26 Jan 2024 21:58:06 +0000
Message-ID: <CANPvuRm0owcg17b06Fz56chxHvnkQL+W0m4-AyKLu-T7Ky_LkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: update 1.20.12 -> 1.20.13
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000b6aa37060fe064c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 21:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194406

--000000000000b6aa37060fe064c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu (sexta, 26/01/2024 =C3=A0(s) 17:58):

> On Fri, Jan 26, 2024 at 8:24=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> >
> >
> > Alexander Kanavin <alex.kanavin@gmail.com> escreveu (sexta, 26/01/2024
> =C3=A0(s) 16:10):
> >>
> >> Hello Jose,
> >>
> >> there was a 1.21 update earlier, what happened to that?
> >
> >
> > Hi Alex,
> >
> > I know and I've already done some work on this but unfortunately there
> are runtime problems.
> > https://lists.openembedded.org/g/openembedded-core/message/191943
> >
> > The patch 0005-cmd-dist-separate-host-and-target-builds.patch has some
> problems and I need to spend some more time with it.
> >
> > It would be good to also reduce the number of patches we have here,
> > some of which are quite invasive, to facilitate these updates.
> > When I have a working version using golang master I will try to submit
> some of the patches we carry.
> >
> > I would like to take this opportunity to inform than I am not an expert
> in golang
> > nor anything like that, which makes things more difficult and slower.
> >
> > As long as I can't fix what's missing for 1.21, I'll update the current
> version.
> >
>
> Few months ago, I cobbled something up here -
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dkraj/go1.21
> it was not tested much, but might be helpful while you look into it.
>

Hi Khen,

Next week I will take a look at your branch.
Thanks for your help.

Jose


>
> > Jose
> >
> >>
> >> Alex
> >>
> >> On Fri, 26 Jan 2024 at 17:06, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >> >
> >> > Upgrade to latest 1.20.x release [1]:
> >> >
> >> > $ git log --oneline go1.20.12..go1.20.13
> >> > a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13
> >> > 5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-only mode
> with BoringSSL policy
> >> > 9e4abed39b [release-branch.go1.20] crypto/internal/boring: upgrade
> module to fips-20220613
> >> > 95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats debug
> assertions behind a double-check mode
> >> > 8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup tests on
> darwin builders
> >> > 59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run from
> TestNohup
> >> >
> >> > [1] https://github.com/golang/go/compare/go1.20.12...go1.20.13
> >> >
> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> > ---
> >> >  meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.20.13.inc} | 2 +=
-
> >> >  ...binary-native_1.20.12.bb =3D> go-binary-native_1.20.13.bb} | 6
> +++---
> >> >  ...oss-canadian_1.20.12.bb =3D> go-cross-canadian_1.20.13.bb} | 0
> >> >  .../go/{go-cross_1.20.12.bb =3D> go-cross_1.20.13.bb}         | 0
> >> >  .../go/{go-crosssdk_1.20.12.bb =3D> go-crosssdk_1.20.13.bb}   | 0
> >> >  .../go/{go-native_1.20.12.bb =3D> go-native_1.20.13.bb}       | 0
> >> >  .../go/{go-runtime_1.20.12.bb =3D> go-runtime_1.20.13.bb}     | 0
> >> >  meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.20.13.bb}   | 0
> >> >  8 files changed, 4 insertions(+), 4 deletions(-)
> >> >  rename meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.20.13.inc=
}
> (89%)
> >> >  rename meta/recipes-devtools/go/{go-binary-native_1.20.12.bb =3D>
> go-binary-native_1.20.13.bb} (78%)
> >> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.12.bb =3D>
> go-cross-canadian_1.20.13.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-cross_1.20.12.bb =3D>
> go-cross_1.20.13.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-crosssdk_1.20.12.bb =3D>
> go-crosssdk_1.20.13.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-native_1.20.12.bb =3D>
> go-native_1.20.13.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-runtime_1.20.12.bb =3D>
> go-runtime_1.20.13.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.20.13.bb}
> (100%)
> >> >
> >> > diff --git a/meta/recipes-devtools/go/go-1.20.12.inc
> b/meta/recipes-devtools/go/go-1.20.13.inc
> >> > similarity index 89%
> >> > rename from meta/recipes-devtools/go/go-1.20.12.inc
> >> > rename to meta/recipes-devtools/go/go-1.20.13.inc
> >> > index 9be56c6707..b6eeb651c9 100644
> >> > --- a/meta/recipes-devtools/go/go-1.20.12.inc
> >> > +++ b/meta/recipes-devtools/go/go-1.20.13.inc
> >> > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
> >> >
> file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
> >> >
> file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
> >> >  "
> >> > -SRC_URI[main.sha256sum] =3D
> "c5bf934751d31c315c1d0bb5fb02296545fa6d08923566f7a5afec81f2ed27d6"
> >> > +SRC_URI[main.sha256sum] =3D
> "0fe745c530f2f1d67193af3c5ea25246be077989ec5178df266e975f3532449e"
> >> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> >> > similarity index 78%
> >> > rename from meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> >> > index 41db2ada80..d99bab71e1 100644
> >> > --- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> >> > +++ b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
> >> > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
> >> >
> >> >  # Checksums available at https://go.dev/dl/
> >> >  SRC_URI =3D "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;nam=
e=3Dgo_${BUILD_GOTUPLE}
> "
> >> > -SRC_URI[go_linux_amd64.sha256sum] =3D
> "9c5d48c54dd8b0a3b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b"
> >> > -SRC_URI[go_linux_arm64.sha256sum] =3D
> "8afe8e3fb6972eaa2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87"
> >> > -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "2ae0ec3736216dfbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328"
> >> > +SRC_URI[go_linux_amd64.sha256sum] =3D
> "9a9d3dcae2b6a638b1f2e9bd4db08ffb39c10e55d9696914002742d90f0047b5"
> >> > +SRC_URI[go_linux_arm64.sha256sum] =3D
> "a2d811cef3c4fc77c01195622e637af0c2cf8b3814a95a0920cf2f83b6061d38"
> >> > +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "5f632b83323e16f8c6ceb676cd570b3f13f1826e06a81d92985d1301b643a7d3"
> >> >
> >> >  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
> >> >  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> >> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
> >> > diff --git a/meta/recipes-devtools/go/go-cross_1.20.12.bb
> b/meta/recipes-devtools/go/go-cross_1.20.13.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-cross_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go-cross_1.20.13.bb
> >> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
> >> > diff --git a/meta/recipes-devtools/go/go-native_1.20.12.bb
> b/meta/recipes-devtools/go/go-native_1.20.13.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-native_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go-native_1.20.13.bb
> >> > diff --git a/meta/recipes-devtools/go/go-runtime_1.20.12.bb
> b/meta/recipes-devtools/go/go-runtime_1.20.13.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-runtime_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go-runtime_1.20.13.bb
> >> > diff --git a/meta/recipes-devtools/go/go_1.20.12.bb
> b/meta/recipes-devtools/go/go_1.20.13.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go_1.20.12.bb
> >> > rename to meta/recipes-devtools/go/go_1.20.13.bb
> >> > --
> >> > 2.43.0
> >> >
> >> >
> >> >
> >> >
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194395):
> https://lists.openembedded.org/g/openembedded-core/message/194395
> > Mute This Topic: https://lists.openembedded.org/mt/103978924/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b6aa37060fe064c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu (sexta, 26/01/2024 =C3=A0=
(s) 17:58):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
ri, Jan 26, 2024 at 8:24=E2=80=AFAM Jose Quaresma &lt;<a href=3D"mailto:qua=
resma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt; escreveu (sexta, 26/01/2024 =C3=
=A0(s) 16:10):<br>
&gt;&gt;<br>
&gt;&gt; Hello Jose,<br>
&gt;&gt;<br>
&gt;&gt; there was a 1.21 update earlier, what happened to that?<br>
&gt;<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; I know and I&#39;ve already done some work on this but unfortunately t=
here are runtime problems.<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
191943" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/191943</a><br>
&gt;<br>
&gt; The patch 0005-cmd-dist-separate-host-and-target-builds.patch has some=
 problems and I need to spend some more time with it.<br>
&gt;<br>
&gt; It would be good to also reduce the number of patches we have here,<br=
>
&gt; some of which are quite invasive, to facilitate these updates.<br>
&gt; When I have a working version using golang master I will try to submit=
 some of the patches we carry.<br>
&gt;<br>
&gt; I would like to take this opportunity to inform than I am not an exper=
t in golang<br>
&gt; nor anything like that, which makes things more difficult and slower.<=
br>
&gt;<br>
&gt; As long as I can&#39;t fix what&#39;s missing for 1.21, I&#39;ll updat=
e the current version.<br>
&gt;<br>
<br>
Few months ago, I cobbled something up here -<br>
<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dkraj/go1.21" =
rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-cont=
rib/log/?h=3Dkraj/go1.21</a><br>
it was not tested much, but might be helpful while you look into it.<br></b=
lockquote><div><br></div><div>Hi Khen,<br><br>Next week I will take a look =
at your branch.<br>Thanks for your help.<br><br>Jose</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 26 Jan 2024 at 17:06, Jose Quaresma &lt;<a href=3D"mailto:=
quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Upgrade to latest 1.20.x release [1]:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; $ git log --oneline go1.20.12..go1.20.13<br>
&gt;&gt; &gt; a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13=
<br>
&gt;&gt; &gt; 5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-onl=
y mode with BoringSSL policy<br>
&gt;&gt; &gt; 9e4abed39b [release-branch.go1.20] crypto/internal/boring: up=
grade module to fips-20220613<br>
&gt;&gt; &gt; 95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats =
debug assertions behind a double-check mode<br>
&gt;&gt; &gt; 8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup test=
s on darwin builders<br>
&gt;&gt; &gt; 59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run=
 from TestNohup<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [1] <a href=3D"https://github.com/golang/go/compare/go1.20.12=
...go1.20.13" rel=3D"noreferrer" target=3D"_blank">https://github.com/golan=
g/go/compare/go1.20.12...go1.20.13</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quare=
sma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/go/{go-1.20.12.inc =3D&gt; go-1.2=
0.13.inc} | 2 +-<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://binary-native_1.20.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">binary-native_1.20.12.bb</a> =3D&gt; <a href=
=3D"http://go-binary-native_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank=
">go-binary-native_1.20.13.bb</a>} | 6 +++---<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://oss-canadian_1.20.12.bb" rel=3D"no=
referrer" target=3D"_blank">oss-canadian_1.20.12.bb</a> =3D&gt; <a href=3D"=
http://go-cross-canadian_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">g=
o-cross-canadian_1.20.13.bb</a>} | 0<br>
&gt;&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-cross_1.20.12.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-cross_1.20.12.bb</a> =3D&gt; <a href=3D"htt=
p://go-cross_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20=
.13.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-crosssdk_1.20.12.bb" rel=
=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a> =3D&gt; <a hre=
f=3D"http://go-crosssdk_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go=
-crosssdk_1.20.13.bb</a>}=C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-native_1.20.12.bb" rel=3D"=
noreferrer" target=3D"_blank">go-native_1.20.12.bb</a> =3D&gt; <a href=3D"h=
ttp://go-native_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-native_=
1.20.13.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-runtime_1.20.12.bb" rel=3D=
"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a> =3D&gt; <a href=3D=
"http://go-runtime_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-runt=
ime_1.20.13.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/go/{<a href=3D"http://go_1.20.12.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> =3D&gt; <a href=
=3D"http://go_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.13.b=
b</a>}=C2=A0 =C2=A0| 0<br>
&gt;&gt; &gt;=C2=A0 8 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.20.12.inc =3D&gt;=
 go-1.20.13.inc} (89%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-b=
inary-native_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-nat=
ive_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.20.13.bb" r=
el=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.13.bb</a>} (78%)<=
br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-c=
ross-canadian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-can=
adian_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.20.13.bb=
" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.13.bb</a>} (1=
00%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-c=
ross_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</=
a> =3D&gt; <a href=3D"http://go-cross_1.20.13.bb" rel=3D"noreferrer" target=
=3D"_blank">go-cross_1.20.13.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-c=
rosssdk_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.1=
2.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_1.20.13.bb" rel=3D"noreferre=
r" target=3D"_blank">go-crosssdk_1.20.13.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-n=
ative_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb=
</a> =3D&gt; <a href=3D"http://go-native_1.20.13.bb" rel=3D"noreferrer" tar=
get=3D"_blank">go-native_1.20.13.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-r=
untime_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.=
bb</a> =3D&gt; <a href=3D"http://go-runtime_1.20.13.bb" rel=3D"noreferrer" =
target=3D"_blank">go-runtime_1.20.13.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go_1=
.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> =3D&gt; <=
a href=3D"http://go_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go_1.2=
0.13.bb</a>} (100%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.20.12.inc b/meta/r=
ecipes-devtools/go/go-1.20.13.inc<br>
&gt;&gt; &gt; similarity index 89%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.20.12.inc<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.20.13.inc<br>
&gt;&gt; &gt; index 9be56c6707..b6eeb651c9 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.20.12.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.20.13.inc<br>
&gt;&gt; &gt; @@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0008-src-cmd-dist-buildgo.go-do-no=
t-hardcode-host-compile.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0009-go-Filter-build-paths-on-stat=
icly-linked-arches.patch \<br>
&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt; -SRC_URI[main.sha256sum] =3D &quot;c5bf934751d31c315c1d0bb5fb=
02296545fa6d08923566f7a5afec81f2ed27d6&quot;<br>
&gt;&gt; &gt; +SRC_URI[main.sha256sum] =3D &quot;0fe745c530f2f1d67193af3c5e=
a25246be077989ec5178df266e975f3532449e&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-bi=
nary-native_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-nati=
ve_1.20.12.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20=
.13.bb</a><br>
&gt;&gt; &gt; similarity index 78%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-bin=
ary-native_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-nativ=
e_1.20.12.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binar=
y-native_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_=
1.20.13.bb</a><br>
&gt;&gt; &gt; index 41db2ada80..d99bab71e1 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20=
.12.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20=
.13.bb</a><br>
&gt;&gt; &gt; @@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 # Checksums available at <a href=3D"https://go.dev/dl/"=
 rel=3D"noreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/g=
o$%7BPV%7D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD=
_GOTUPLE%7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/=
go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>=
&quot;<br>
&gt;&gt; &gt; -SRC_URI[go_linux_amd64.sha256sum] =3D &quot;9c5d48c54dd8b0a3=
b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b&quot;<br>
&gt;&gt; &gt; -SRC_URI[go_linux_arm64.sha256sum] =3D &quot;8afe8e3fb6972eaa=
2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87&quot;<br>
&gt;&gt; &gt; -SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;2ae0ec3736216d=
fbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328&quot;<br>
&gt;&gt; &gt; +SRC_URI[go_linux_amd64.sha256sum] =3D &quot;9a9d3dcae2b6a638=
b1f2e9bd4db08ffb39c10e55d9696914002742d90f0047b5&quot;<br>
&gt;&gt; &gt; +SRC_URI[go_linux_arm64.sha256sum] =3D &quot;a2d811cef3c4fc77=
c01195622e637af0c2cf8b3814a95a0920cf2f83b6061d38&quot;<br>
&gt;&gt; &gt; +SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;5f632b83323e16=
f8c6ceb676cd570b3f13f1826e06a81d92985d1301b643a7d3&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.=
org/dl/" rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&qu=
ot;<br>
&gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\=
d+)+)\.linux&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cr=
oss-canadian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-cana=
dian_1.20.12.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-c=
anadian_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_=
1.20.13.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cro=
ss-canadian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canad=
ian_1.20.12.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross=
-canadian_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadia=
n_1.20.13.bb</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cr=
oss_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a=
> b/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.13.bb" rel=3D"=
noreferrer" target=3D"_blank">go-cross_1.20.13.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cro=
ss_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a>=
<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross=
_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.13.bb</a><b=
r>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cr=
osssdk_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12=
.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.20.13.bb=
" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.13.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cro=
sssdk_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.=
bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross=
sdk_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.13.bb=
</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-na=
tive_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb<=
/a> b/meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.13.bb" rel=
=3D"noreferrer" target=3D"_blank">go-native_1.20.13.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-nat=
ive_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</=
a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-nativ=
e_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.13.bb</a>=
<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-ru=
ntime_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.b=
b</a> b/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20.13.bb" r=
el=3D"noreferrer" target=3D"_blank">go-runtime_1.20.13.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-run=
time_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb=
</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-runti=
me_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.13.bb</=
a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.=
20.12.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> b/meta/rec=
ipes-devtools/go/<a href=3D"http://go_1.20.13.bb" rel=3D"noreferrer" target=
=3D"_blank">go_1.20.13.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go_1.20.=
13.bb" rel=3D"noreferrer" target=3D"_blank">go_1.20.13.bb</a><br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.43.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#194395): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/194395" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/194395</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10397892=
4/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103978924/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000b6aa37060fe064c6--

