Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59AEC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:58:16 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.938.1706291893090363820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnxreDan;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bddf109e9aso623969b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 09:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706291892; x=1706896692; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwIXI0elPGh6KhuYBqcF+BbJ2ogZ/oJUeoffv8DI18o=;
        b=OnxreDanEt5OxjXPaQLSOhkie+KDnZTcC2ZQmGpRjvOnesIwmMxc2VP4N3nKJ2FDhi
         8+VEJAn0+LzrPL7q1Hl972w5c2bn9JRTK+T2cQhaPmL1oWDxPFVEMnOYIfPLei4mqEf2
         9D6INHYemvZVIl25nPhuGExqMTsqyyhzq3efMlSgEqQ+Ge7078sFcjB7Qd3H860LL6+/
         AlNBdNHv4qeOZmsHQo9PIV3rpli4anglh1ZfRLC1HQleqbs8tp+FCMPmwxf0Izx+CPs5
         M7kgGolpu/k/NAS5P8OXuM7aYEQE1QHaH1k+v969No8P/D+45itronb0BfMNGBlCCq3x
         qu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706291892; x=1706896692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwIXI0elPGh6KhuYBqcF+BbJ2ogZ/oJUeoffv8DI18o=;
        b=B4bMYT9X7S3DmSDXGPLL5kxSVqV4zJhuNR6webgPK5dDkxfX13238fBZT/zTC4VbIC
         5tsTKCxYGxMBD13qbvuWECw4lORtSBpHLufcq4KtrypD5p1pagSixfLV1xmgzsY4QwIJ
         Ha+3Urujn5N4+3BtFme3ul7gV19/qC9dQGQFoaVeg8dFEThx468lVtrHtlMUk7JHsFC0
         zO69BNHFWHT6CwhUltfWqaVushToE8nsAGYGjLY5gHpEg4TNPmfkonRGt39yRlQhjJof
         G7rEN0ov54yJOxvCPObCCEIyahYiaKFkm8aIs9bhC7WpDHcYrRtwIPO7NuVQNEyJVM1w
         PIPQ==
X-Gm-Message-State: AOJu0YzhPJXtGmy/pxPdWpil0k4SpO0NNdVFBn3PZ4LEbi9/fXT8KF60
	3QVR4Ulphyj+6r5Uz2CmJV6KwuIFSTeO5ONEcpxhObzUyujf2w/RXDRdNM7kdyrRkEq7Pn1C2aG
	/2OaeaZ2DbBOWpCxVQsmvDQ0RcG4=
X-Google-Smtp-Source: AGHT+IEOZtX05w2CU7vKicxOrDdCCEtX+M+NoE2XpnmdMSeoKrY2W1dTu39Lm0bCQ98VvMLDFlead0mKDr4ZtbyBrk0=
X-Received: by 2002:a05:6871:5c46:b0:1fa:26b7:af18 with SMTP id
 os6-20020a0568715c4600b001fa26b7af18mr23097oac.17.1706291892282; Fri, 26 Jan
 2024 09:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20240126160555.66586-1-jose.quaresma@foundries.io>
 <CANNYZj-geP-RWJqkdo=_gaO-44SJ0YHnyVoyNN2n3jybohQYWg@mail.gmail.com> <CANPvuR=YerzxFTmF4Ei7pwpL2jGY0xc_Gewy=Nc_-FX+7J6xDA@mail.gmail.com>
In-Reply-To: <CANPvuR=YerzxFTmF4Ei7pwpL2jGY0xc_Gewy=Nc_-FX+7J6xDA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jan 2024 09:57:46 -0800
Message-ID: <CAMKF1soAYU5Qnwfu7x_FTWmqLMU+jrqteknVyjMJNzHZKeJTjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: update 1.20.12 -> 1.20.13
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 17:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194400

On Fri, Jan 26, 2024 at 8:24=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
>
> Alexander Kanavin <alex.kanavin@gmail.com> escreveu (sexta, 26/01/2024 =
=C3=A0(s) 16:10):
>>
>> Hello Jose,
>>
>> there was a 1.21 update earlier, what happened to that?
>
>
> Hi Alex,
>
> I know and I've already done some work on this but unfortunately there ar=
e runtime problems.
> https://lists.openembedded.org/g/openembedded-core/message/191943
>
> The patch 0005-cmd-dist-separate-host-and-target-builds.patch has some pr=
oblems and I need to spend some more time with it.
>
> It would be good to also reduce the number of patches we have here,
> some of which are quite invasive, to facilitate these updates.
> When I have a working version using golang master I will try to submit so=
me of the patches we carry.
>
> I would like to take this opportunity to inform than I am not an expert i=
n golang
> nor anything like that, which makes things more difficult and slower.
>
> As long as I can't fix what's missing for 1.21, I'll update the current v=
ersion.
>

Few months ago, I cobbled something up here -
https://git.yoctoproject.org/poky-contrib/log/?h=3Dkraj/go1.21
it was not tested much, but might be helpful while you look into it.

> Jose
>
>>
>> Alex
>>
>> On Fri, 26 Jan 2024 at 17:06, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>> >
>> > Upgrade to latest 1.20.x release [1]:
>> >
>> > $ git log --oneline go1.20.12..go1.20.13
>> > a95136a88c (tag: go1.20.13) [release-branch.go1.20] go1.20.13
>> > 5c38c04957 [release-branch.go1.20] crypto/tls: align FIPS-only mode wi=
th BoringSSL policy
>> > 9e4abed39b [release-branch.go1.20] crypto/internal/boring: upgrade mod=
ule to fips-20220613
>> > 95afc744a7 [release-branch.go1.20] runtime: put ReadMemStats debug ass=
ertions behind a double-check mode
>> > 8cb86b5f85 [release-branch.go1.20] os/signal: skip nohup tests on darw=
in builders
>> > 59ffd3b90d [release-branch.go1.20] os/signal: remove go t.Run from Tes=
tNohup
>> >
>> > [1] https://github.com/golang/go/compare/go1.20.12...go1.20.13
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.20.13.inc} | 2 +-
>> >  ...binary-native_1.20.12.bb =3D> go-binary-native_1.20.13.bb} | 6 +++=
---
>> >  ...oss-canadian_1.20.12.bb =3D> go-cross-canadian_1.20.13.bb} | 0
>> >  .../go/{go-cross_1.20.12.bb =3D> go-cross_1.20.13.bb}         | 0
>> >  .../go/{go-crosssdk_1.20.12.bb =3D> go-crosssdk_1.20.13.bb}   | 0
>> >  .../go/{go-native_1.20.12.bb =3D> go-native_1.20.13.bb}       | 0
>> >  .../go/{go-runtime_1.20.12.bb =3D> go-runtime_1.20.13.bb}     | 0
>> >  meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.20.13.bb}   | 0
>> >  8 files changed, 4 insertions(+), 4 deletions(-)
>> >  rename meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.20.13.inc} =
(89%)
>> >  rename meta/recipes-devtools/go/{go-binary-native_1.20.12.bb =3D> go-=
binary-native_1.20.13.bb} (78%)
>> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.12.bb =3D> go=
-cross-canadian_1.20.13.bb} (100%)
>> >  rename meta/recipes-devtools/go/{go-cross_1.20.12.bb =3D> go-cross_1.=
20.13.bb} (100%)
>> >  rename meta/recipes-devtools/go/{go-crosssdk_1.20.12.bb =3D> go-cross=
sdk_1.20.13.bb} (100%)
>> >  rename meta/recipes-devtools/go/{go-native_1.20.12.bb =3D> go-native_=
1.20.13.bb} (100%)
>> >  rename meta/recipes-devtools/go/{go-runtime_1.20.12.bb =3D> go-runtim=
e_1.20.13.bb} (100%)
>> >  rename meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.20.13.bb} (1=
00%)
>> >
>> > diff --git a/meta/recipes-devtools/go/go-1.20.12.inc b/meta/recipes-de=
vtools/go/go-1.20.13.inc
>> > similarity index 89%
>> > rename from meta/recipes-devtools/go/go-1.20.12.inc
>> > rename to meta/recipes-devtools/go/go-1.20.13.inc
>> > index 9be56c6707..b6eeb651c9 100644
>> > --- a/meta/recipes-devtools/go/go-1.20.12.inc
>> > +++ b/meta/recipes-devtools/go/go-1.20.13.inc
>> > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
>> >      file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.=
patch \
>> >      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch=
 \
>> >  "
>> > -SRC_URI[main.sha256sum] =3D "c5bf934751d31c315c1d0bb5fb02296545fa6d08=
923566f7a5afec81f2ed27d6"
>> > +SRC_URI[main.sha256sum] =3D "0fe745c530f2f1d67193af3c5ea25246be077989=
ec5178df266e975f3532449e"
>> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb b/me=
ta/recipes-devtools/go/go-binary-native_1.20.13.bb
>> > similarity index 78%
>> > rename from meta/recipes-devtools/go/go-binary-native_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go-binary-native_1.20.13.bb
>> > index 41db2ada80..d99bab71e1 100644
>> > --- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
>> > +++ b/meta/recipes-devtools/go/go-binary-native_1.20.13.bb
>> > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
>> >
>> >  # Checksums available at https://go.dev/dl/
>> >  SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_G=
OARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
>> > -SRC_URI[go_linux_amd64.sha256sum] =3D "9c5d48c54dd8b0a3b2ef91b0f92a11=
90aa01f11d26e98033efa64c46a30bba7b"
>> > -SRC_URI[go_linux_arm64.sha256sum] =3D "8afe8e3fb6972eaa2179ef0a71678c=
67f26509fab4f0f67c4b00f4cdfa92dc87"
>> > -SRC_URI[go_linux_ppc64le.sha256sum] =3D "2ae0ec3736216dfbd7b01ff67984=
2dc1bed365e53a024d522645bcffd01c7328"
>> > +SRC_URI[go_linux_amd64.sha256sum] =3D "9a9d3dcae2b6a638b1f2e9bd4db08f=
fb39c10e55d9696914002742d90f0047b5"
>> > +SRC_URI[go_linux_arm64.sha256sum] =3D "a2d811cef3c4fc77c01195622e637a=
f0c2cf8b3814a95a0920cf2f83b6061d38"
>> > +SRC_URI[go_linux_ppc64le.sha256sum] =3D "5f632b83323e16f8c6ceb676cd57=
0b3f13f1826e06a81d92985d1301b643a7d3"
>> >
>> >  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
>> >  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
>> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb b/m=
eta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go-cross-canadian_1.20.13.bb
>> > diff --git a/meta/recipes-devtools/go/go-cross_1.20.12.bb b/meta/recip=
es-devtools/go/go-cross_1.20.13.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/go/go-cross_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go-cross_1.20.13.bb
>> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb b/meta/re=
cipes-devtools/go/go-crosssdk_1.20.13.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go-crosssdk_1.20.13.bb
>> > diff --git a/meta/recipes-devtools/go/go-native_1.20.12.bb b/meta/reci=
pes-devtools/go/go-native_1.20.13.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/go/go-native_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go-native_1.20.13.bb
>> > diff --git a/meta/recipes-devtools/go/go-runtime_1.20.12.bb b/meta/rec=
ipes-devtools/go/go-runtime_1.20.13.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/go/go-runtime_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go-runtime_1.20.13.bb
>> > diff --git a/meta/recipes-devtools/go/go_1.20.12.bb b/meta/recipes-dev=
tools/go/go_1.20.13.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/go/go_1.20.12.bb
>> > rename to meta/recipes-devtools/go/go_1.20.13.bb
>> > --
>> > 2.43.0
>> >
>> >
>> >
>> >
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194395): https://lists.openembedded.org/g/openembedde=
d-core/message/194395
> Mute This Topic: https://lists.openembedded.org/mt/103978924/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

