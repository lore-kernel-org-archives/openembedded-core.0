Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D69D6B6A7
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 16:13:50 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.19202.1730304816338495108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 09:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YeIwIknn;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ec4a40e95bso38424eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730304815; x=1730909615; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=znbnLg6cZ5/oWM7mBA4IynC1ISrhCL0UDRceNgVAYZ0=;
        b=YeIwIknnbOBxv9dqSboXP0j72roMeKcoZ/Ku0P3ONa9vpgadjx0733PFcKP6wD9Ifa
         Ak/CE7WTd0uWjhr9Pmp7QYh/3SjQMj6E1qYNZ0TfFDd2FjUj8UupZ0H4nKECoJQv8Lc8
         eTpz8ghMB1PnI2aV3PJd/De5s2BA5xFiPIlMeheajP0m8E2vIovXhpl91eioPpk3qTHe
         01gNw4BdywipFSF02DRz73DfvJne6Q+ejlba6e22nSE7hMCb6i/U4CifWjkkZsOJPuHk
         LiXFUDbLTThWzIbR/Bsv5Rrc28hU0cEpFCxQj6gNPDWgAmyjRF8MItXnQI4HbS7SJ4rw
         Fosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730304815; x=1730909615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znbnLg6cZ5/oWM7mBA4IynC1ISrhCL0UDRceNgVAYZ0=;
        b=v+EIr+aDKONcb7chS91NY71L1E1NuynzBYQOD/Jys/4S3KHOab2CMNCOlWNCnM8TlP
         6ua7s/wQ4RQPfGe8vWPn7L8/3kahMgmfxYXfMZKPxSL2RF81NACia3qafwMHgDdv9Xe6
         QOQpaDMxrwczj1Xl2n29Wyx8VRb2CfLbVxEdX/mrGM3vsGISRURIIq0kxeBDpwgTdMCh
         wwkjr9LLextIgVk3r8GS5EU/LDtlzFr0vGKc7axFqEj0QC0fN03yhm3KK8FtiAdwjC/x
         QQAT0/F/r9/Ai/wkAqBu1oozhm7L9GiOrMxIG8SQST3o6FbRInYy9V4kbAH5KxyCFcrz
         tL4w==
X-Forwarded-Encrypted: i=1; AJvYcCV5UmspfUjFTZBf0NaogrgJt0a4CPfWdFrqOYHvlj2JTwDcMnOHUZg3yxobnC0pjGNcqkfqHxBkGVWBjFkJfmUxOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywpq0aWl+iyAaxUuEIHh5eMbrca86UbhhVFEjbSx2gfF8cTojD9
	8Ef5pccF5avyNpDrtoQzGIMDcTced/+c/ProjUfJMzEVNlN+WLnR5P3fKP+OUNiwwuXs4Jn4Ard
	331gt7bJqdjQyidjLp3SJgA6p9X0=
X-Google-Smtp-Source: AGHT+IFC95SgJBiD6fddc71ttwdlfGuVYXfd3hjeLbTzQ2q8GxLbvdGX14OhYqyzDu5IYFNJEEGEd11rYYsC1ry8R/c=
X-Received: by 2002:a05:6359:4c91:b0:1c3:724e:f4dd with SMTP id
 e5c5f4694b2df-1c3f9f615f2mr860845855d.21.1730304813902; Wed, 30 Oct 2024
 09:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241027133906.367260-1-peter.marko@siemens.com>
 <20241027133906.367260-2-peter.marko@siemens.com> <CANNYZj9zcNQ+=QCDci_U=x9TopEW0YaHDJ=asJUhkRpEg8zWTQ@mail.gmail.com>
 <AS1PR10MB56970045A4008DB205B6C79FFD4A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <180346D341F84535.12341@lists.openembedded.org>
In-Reply-To: <180346D341F84535.12341@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 30 Oct 2024 16:13:23 +0000
Message-ID: <CANPvuRkG9Y1pnjhH9B-jRZCDQmm9MiC0z9eVWd8HZ7zfCkxC6w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] go: upgrade 1.22.7 -> 1.22.8
To: quaresma.jose@gmail.com
Cc: peter.marko@siemens.com, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c931cc0625b3fbbe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206553

--000000000000c931cc0625b3fbbe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 30/10/2024 =C3=A0(s) 16=
:09):

>
>
> Peter Marko via lists.openembedded.org <peter.marko=3D
> siemens.com@lists.openembedded.org> escreveu (segunda, 28/10/2024 =C3=A0(=
s)
> 20:09):
>
>> -----Original Message-----
>> > From: Alexander Kanavin <alex.kanavin@gmail.com>
>> > Sent: Monday, October 28, 2024 20:48
>> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> > Cc: openembedded-core@lists.openembedded.org
>> > Subject: Re: [OE-core][PATCH 2/2] go: upgrade 1.22.7 -> 1.22.8
>> >
>> > Thanks, but should we rather update to actual latest, which is 1.23.2?
>> >
>> > Alex
>>
>> My intention is to fix CVEs in scarthgap and kirkstone mixin and update =
in
>> master is currently precondition for that as they share the version.
>> "major" golang version update is something I currently don't trust mysel=
f
>> to deliver in a quality to sign-off.
>>
>> Peter
>>
>
> I have a wip [1] branch with this update, it is mostly done but with
> some buildpaths issues.
> [1] https://git.yoctoproject.org/poky-contrib/log/?h=3Djquaresma/go
>
> There are still some adaptations missing from 'CGO_LDFLAGS' to the new
> '-ldflags'
> according to [2] but that can be left for later.
> [2] https://go.dev/doc/go1.23
>
> If anyone wants to continue with this feel free, I would like to finish
> this update
> but I have been very busy at the moment and I don't know when I will be
> able to get back to it.
>
> Jose
>

Would it be acceptable to send what I have containing
the buildpaths INSANE_SKIP on the recipe go-runtime?

Jose


>
>>
>> >
>> > On Sun, 27 Oct 2024 at 14:40, Peter Marko via lists.openembedded.org
>> > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>> > >
>> > > From: Peter Marko <peter.marko@siemens.com>
>> > >
>> > > Upgrade to latest 1.22.x release [1]:
>> > >
>> > > $ git --no-pager log --oneline go1.22.7..go1.22.8
>> > > aeccd613c8 (tag: go1.22.8) [release-branch.go1.22] go1.22.8
>> > > b4086b7c16 [release-branch.go1.22] syscall: skip TestAmbientCapsUser=
ns
>> > when restricted, document
>> > > 6fab4b9a9e [release-branch.go1.22] runtime: size maps.Clone
>> destination
>> > bucket array safely
>> > > 71655f14ce [release-branch.go1.22] cmd/cgo: correct padding required
>> by
>> > alignment
>> > >
>> > > [1] https://github.com/golang/go/compare/go1.22.7...go1.22.8
>> > >
>> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > > ---
>> > >  meta/recipes-devtools/go/{go-1.22.7.inc =3D> go-1.22.8.inc}   | 2 +=
-
>> > >  ...o-binary-native_1.22.7.bb =3D> go-binary-native_1.22.8.bb} | 6
>> +++---
>> > >  ...cross-canadian_1.22.7.bb =3D> go-cross-canadian_1.22.8.bb} | 0
>> > >  .../go/{go-cross_1.22.7.bb =3D> go-cross_1.22.8.bb}           | 0
>> > >  .../go/{go-crosssdk_1.22.7.bb =3D> go-crosssdk_1.22.8.bb}     | 0
>> > >  .../go/{go-runtime_1.22.7.bb =3D> go-runtime_1.22.8.bb}       | 0
>> > >  meta/recipes-devtools/go/{go_1.22.7.bb =3D> go_1.22.8.bb}     | 0
>> > >  7 files changed, 4 insertions(+), 4 deletions(-)
>> > >  rename meta/recipes-devtools/go/{go-1.22.7.inc =3D> go-1.22.8.inc}
>> (89%)
>> > >  rename meta/recipes-devtools/go/{go-binary-native_1.22.7.bb =3D>
>> go-binary-
>> > native_1.22.8.bb} (78%)
>> > >  rename meta/recipes-devtools/go/{go-cross-canadian_1.22.7.bb =3D>
>> go-cross-
>> > canadian_1.22.8.bb} (100%)
>> > >  rename meta/recipes-devtools/go/{go-cross_1.22.7.bb =3D>
>> go-cross_1.22.8.bb}
>> > (100%)
>> > >  rename meta/recipes-devtools/go/{go-crosssdk_1.22.7.bb =3D> go-
>> > crosssdk_1.22.8.bb} (100%)
>> > >  rename meta/recipes-devtools/go/{go-runtime_1.22.7.bb =3D> go-
>> > runtime_1.22.8.bb} (100%)
>> > >  rename meta/recipes-devtools/go/{go_1.22.7.bb =3D> go_1.22.8.bb}
>> (100%)
>> > >
>> > > diff --git a/meta/recipes-devtools/go/go-1.22.7.inc b/meta/recipes-
>> > devtools/go/go-1.22.8.inc
>> > > similarity index 89%
>> > > rename from meta/recipes-devtools/go/go-1.22.7.inc
>> > > rename to meta/recipes-devtools/go/go-1.22.8.inc
>> > > index e54a902741..542519b930 100644
>> > > --- a/meta/recipes-devtools/go/go-1.22.7.inc
>> > > +++ b/meta/recipes-devtools/go/go-1.22.8.inc
>> > > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
>> > >
>> file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>> > >
>> file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>> > >  "
>> > > -SRC_URI[main.sha256sum] =3D
>> > "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
>> > > +SRC_URI[main.sha256sum] =3D
>> > "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
>> > > diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
>> > b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
>> > > similarity index 78%
>> > > rename from meta/recipes-devtools/go/go-binary-native_1.22.7.bb
>> > > rename to meta/recipes-devtools/go/go-binary-native_1.22.8.bb
>> > > index aba317fd38..98799eb503 100644
>> > > --- a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
>> > > +++ b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
>> > > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
>> > >
>> > >  # Checksums available at https://go.dev/dl/
>> > >  SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-
>> > ${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
>> > > -SRC_URI[go_linux_amd64.sha256sum] =3D
>> > "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
>> > > -SRC_URI[go_linux_arm64.sha256sum] =3D
>> > "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
>> > > -SRC_URI[go_linux_ppc64le.sha256sum] =3D
>> > "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
>> > > +SRC_URI[go_linux_amd64.sha256sum] =3D
>> > "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
>> > > +SRC_URI[go_linux_arm64.sha256sum] =3D
>> > "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
>> > > +SRC_URI[go_linux_ppc64le.sha256sum] =3D
>> > "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
>> > >
>> > >  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
>> > >  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
>> > > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
>> > b/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
>> > > rename to meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
>> > > diff --git a/meta/recipes-devtools/go/go-cross_1.22.7.bb
>> b/meta/recipes-
>> > devtools/go/go-cross_1.22.8.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/go/go-cross_1.22.7.bb
>> > > rename to meta/recipes-devtools/go/go-cross_1.22.8.bb
>> > > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
>> b/meta/recipes-
>> > devtools/go/go-crosssdk_1.22.8.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
>> > > rename to meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
>> > > diff --git a/meta/recipes-devtools/go/go-runtime_1.22.7.bb
>> b/meta/recipes-
>> > devtools/go/go-runtime_1.22.8.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/go/go-runtime_1.22.7.bb
>> > > rename to meta/recipes-devtools/go/go-runtime_1.22.8.bb
>> > > diff --git a/meta/recipes-devtools/go/go_1.22.7.bb b/meta/recipes-
>> > devtools/go/go_1.22.8.bb
>> > > similarity index 100%
>> > > rename from meta/recipes-devtools/go/go_1.22.7.bb
>> > > rename to meta/recipes-devtools/go/go_1.22.8.bb
>> > > --
>> > > 2.30.2
>> > >
>> > >
>> > >
>> > >
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206552):
> https://lists.openembedded.org/g/openembedded-core/message/206552
> Mute This Topic: https://lists.openembedded.org/mt/109239515/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c931cc0625b3fbbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (quarta, 30/10/2024 =C3=A0(s) 16:09):<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Peter Marko via <a href=3D"http://lists.openembedded.org" target=3D"=
_blank">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siem=
ens.com@lists.openembedded.org" target=3D"_blank">siemens.com@lists.openemb=
edded.org</a>&gt; escreveu (segunda, 28/10/2024 =C3=A0(s) 20:09):<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">-----Original Message----=
-<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Monday, October 28, 2024 20:48<br>
&gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core][PATCH 2/2] go: upgrade 1.22.7 -&gt; 1.22.8<br>
&gt; <br>
&gt; Thanks, but should we rather update to actual latest, which is 1.23.2?=
<br>
&gt; <br>
&gt; Alex<br>
<br>
My intention is to fix CVEs in scarthgap and kirkstone mixin and update in<=
br>
master is currently precondition for that as they share the version.<br>
&quot;major&quot; golang version update is something I currently don&#39;t =
trust myself<br>
to deliver in a quality to sign-off.<br>
<br>
Peter<br></blockquote><div><br>I have a wip [1] branch with this update, it=
 is mostly done but with some=C2=A0buildpaths issues.<br>[1] <a href=3D"htt=
ps://git.yoctoproject.org/poky-contrib/log/?h=3Djquaresma/go" target=3D"_bl=
ank">https://git.yoctoproject.org/poky-contrib/log/?h=3Djquaresma/go</a><br=
><br>There are still some adaptations missing from &#39;CGO_LDFLAGS&#39; to=
 the new &#39;-ldflags&#39;<br>according to [2] but that can be left for la=
ter.</div><div>[2] <a href=3D"https://go.dev/doc/go1.23" target=3D"_blank">=
https://go.dev/doc/go1.23</a><br><br>If anyone wants to continue with this =
feel free, I would like to finish this update<br>but I have been very busy =
at the moment and I don&#39;t know when I will be able to get back to it.<b=
r><br>Jose<br></div></div></div></blockquote><div><br></div><div>Would it b=
e acceptable to send what I have containing <br>the=C2=A0buildpaths=C2=A0IN=
SANE_SKIP on the recipe go-runtime?</div><div><br></div><div>Jose</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; <br>
&gt; On Sun, 27 Oct 2024 at 14:40, Peter Marko via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a><br>
&gt; &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org=
" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Upgrade to latest 1.22.x release [1]:<br>
&gt; &gt;<br>
&gt; &gt; $ git --no-pager log --oneline go1.22.7..go1.22.8<br>
&gt; &gt; aeccd613c8 (tag: go1.22.8) [release-branch.go1.22] go1.22.8<br>
&gt; &gt; b4086b7c16 [release-branch.go1.22] syscall: skip TestAmbientCapsU=
serns<br>
&gt; when restricted, document<br>
&gt; &gt; 6fab4b9a9e [release-branch.go1.22] runtime: size maps.Clone desti=
nation<br>
&gt; bucket array safely<br>
&gt; &gt; 71655f14ce [release-branch.go1.22] cmd/cgo: correct padding requi=
red by<br>
&gt; alignment<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://github.com/golang/go/compare/go1.22.7...go=
1.22.8" rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/go/c=
ompare/go1.22.7...go1.22.8</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siem=
ens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/go/{go-1.22.7.inc =3D&gt; go-1.22.8.i=
nc}=C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://o-binary-native_1.22.7.bb" rel=3D"nore=
ferrer" target=3D"_blank">o-binary-native_1.22.7.bb</a> =3D&gt; <a href=3D"=
http://go-binary-native_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-=
binary-native_1.22.8.bb</a>} | 6 +++---<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://cross-canadian_1.22.7.bb" rel=3D"noref=
errer" target=3D"_blank">cross-canadian_1.22.7.bb</a> =3D&gt; <a href=3D"ht=
tp://go-cross-canadian_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-c=
ross-canadian_1.22.8.bb</a>} | 0<br>
&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-cross_1.22.7.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-cross_1.22.7.bb</a> =3D&gt; <a href=3D"http://go=
-cross_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.8.bb</=
a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-crosssdk_1.22.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">go-crosssdk_1.22.7.bb</a> =3D&gt; <a href=3D"htt=
p://go-crosssdk_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk=
_1.22.8.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go-runtime_1.22.7.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-runtime_1.22.7.bb</a> =3D&gt; <a href=3D"http:=
//go-runtime_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.2=
2.8.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/go/{<a href=3D"http://go_1.22.7.bb" r=
el=3D"noreferrer" target=3D"_blank">go_1.22.7.bb</a> =3D&gt; <a href=3D"htt=
p://go_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.8.bb</a>}=C2=
=A0 =C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 7 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.22.7.inc =3D&gt; go-1=
.22.8.inc} (89%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-binar=
y-native_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1=
.22.7.bb</a> =3D&gt; go-binary-<br>
&gt; <a href=3D"http://native_1.22.8.bb" rel=3D"noreferrer" target=3D"_blan=
k">native_1.22.8.bb</a>} (78%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross=
-canadian_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian=
_1.22.7.bb</a> =3D&gt; go-cross-<br>
&gt; <a href=3D"http://canadian_1.22.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">canadian_1.22.8.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross=
_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.7.bb</a> =3D=
&gt; <a href=3D"http://go-cross_1.22.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">go-cross_1.22.8.bb</a>}<br>
&gt; (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross=
sdk_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.7.bb</=
a> =3D&gt; go-<br>
&gt; <a href=3D"http://crosssdk_1.22.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">crosssdk_1.22.8.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-runti=
me_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.7.bb</a>=
 =3D&gt; go-<br>
&gt; <a href=3D"http://runtime_1.22.8.bb" rel=3D"noreferrer" target=3D"_bla=
nk">runtime_1.22.8.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go_1.22.=
7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.7.bb</a> =3D&gt; <a href=
=3D"http://go_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.8.bb<=
/a>} (100%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.22.7.inc b/meta/recipe=
s-<br>
&gt; devtools/go/go-1.22.8.inc<br>
&gt; &gt; similarity index 89%<br>
&gt; &gt; rename from meta/recipes-devtools/go/go-1.22.7.inc<br>
&gt; &gt; rename to meta/recipes-devtools/go/go-1.22.8.inc<br>
&gt; &gt; index e54a902741..542519b930 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/go/go-1.22.7.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.22.8.inc<br>
&gt; &gt; @@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0008-src-cmd-dist-buildgo.go-do-not-ha=
rdcode-host-compile.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0009-go-Filter-build-paths-on-staticly=
-linked-arches.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; -SRC_URI[main.sha256sum] =3D<br>
&gt; &quot;66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f=
&quot;<br>
&gt; &gt; +SRC_URI[main.sha256sum] =3D<br>
&gt; &quot;df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8=
&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary=
-native_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.=
22.7.bb</a><br>
&gt; b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.8.b=
b" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.8.bb</a><br>
&gt; &gt; similarity index 78%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-=
native_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.2=
2.7.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.=
8.bb</a><br>
&gt; &gt; index aba317fd38..98799eb503 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native=
_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.7.bb=
</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native=
_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.8.bb=
</a><br>
&gt; &gt; @@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # Checksums available at <a href=3D"https://go.dev/dl/" rel=
=3D"noreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7=
BPV%7D.$%7BBUILD_GOOS%7D-" rel=3D"noreferrer" target=3D"_blank">https://dl.=
google.com/go/go${PV}.${BUILD_GOOS}-</a><br>
&gt; ${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}&quot;<br>
&gt; &gt; -SRC_URI[go_linux_amd64.sha256sum] =3D<br>
&gt; &quot;fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb=
&quot;<br>
&gt; &gt; -SRC_URI[go_linux_arm64.sha256sum] =3D<br>
&gt; &quot;ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885=
&quot;<br>
&gt; &gt; -SRC_URI[go_linux_ppc64le.sha256sum] =3D<br>
&gt; &quot;a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a=
&quot;<br>
&gt; &gt; +SRC_URI[go_linux_amd64.sha256sum] =3D<br>
&gt; &quot;5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f=
&quot;<br>
&gt; &gt; +SRC_URI[go_linux_arm64.sha256sum] =3D<br>
&gt; &quot;5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a=
&quot;<br>
&gt; &gt; +SRC_URI[go_linux_ppc64le.sha256sum] =3D<br>
&gt; &quot;c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27=
&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/=
dl/" rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<=
br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+=
)\.linux&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-=
canadian_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_=
1.22.7.bb</a><br>
&gt; b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.22.8.=
bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.22.8.bb</a><br=
>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-c=
anadian_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1=
.22.7.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-can=
adian_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.2=
2.8.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_=
1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.7.bb</a> b/me=
ta/recipes-<br>
&gt; devtools/go/<a href=3D"http://go-cross_1.22.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">go-cross_1.22.8.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1=
.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.7.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.2=
2.8.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.8.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosss=
dk_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.7.bb</a=
> b/meta/recipes-<br>
&gt; devtools/go/<a href=3D"http://go-crosssdk_1.22.8.bb" rel=3D"noreferrer=
" target=3D"_blank">go-crosssdk_1.22.8.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssd=
k_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.7.bb</a>=
<br>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_=
1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.8.bb</a><b=
r>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtim=
e_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.7.bb</a> =
b/meta/recipes-<br>
&gt; devtools/go/<a href=3D"http://go-runtime_1.22.8.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-runtime_1.22.8.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime=
_1.22.7.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.7.bb</a><b=
r>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1=
.22.8.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.8.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.22.7=
.bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.7.bb</a> b/meta/recipes-<=
br>
&gt; devtools/go/<a href=3D"http://go_1.22.8.bb" rel=3D"noreferrer" target=
=3D"_blank">go_1.22.8.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go_1.22.7.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.7.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go_1.22.8.bb=
" rel=3D"noreferrer" target=3D"_blank">go_1.22.8.bb</a><br>
&gt; &gt; --<br>
&gt; &gt; 2.30.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206552): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206552" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206552</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109239515/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109239515/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000c931cc0625b3fbbe--

