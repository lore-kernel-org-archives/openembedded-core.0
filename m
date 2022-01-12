Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0949CC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:47:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.23953.1641998837970810124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gZyd5oQk;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id c71so10929356edf.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tM6ChqQqAcpsR2PY5McpBPyjFKSlIIcy7lf/fO3Eago=;
        b=gZyd5oQkkHeDCL+VJD+xXcgUVBgXqNwNCLiDDE8xrLCKGVUBcts6+t6caL7nBjODFp
         OwaK2cXDzLtYPTDp23grMj4NAuWE0Yn+ZA1K66whvjfcL3UJWxaENeDo8wqdl/Mc4a0t
         0OsDHq5jFCTB3AgDikIdE9exAcvoA+VXfojGMFthob2rT+JblThtFvQZIPos3WWcG5h2
         QInPQnJIgEeBFAMVR+3Y7a3V4xI6IZZg6DpP5xRLTq1aPf5zv4+uIPrmUOxu3jkAvc1X
         A4uumckh+nqCHukbzX0ZQely5oqfyXEygKem+5sQfqtRvoj5OGolEcpLmmHsZKkhKNVu
         blmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tM6ChqQqAcpsR2PY5McpBPyjFKSlIIcy7lf/fO3Eago=;
        b=kbPaCH8PUHJTxwYfj1yq6LS2wtY/OMeTay6WXWusIRU6rS7CJwB8AkVsMispfAmu4c
         2E2mYbYIkNdFF+EpaXRHAxHASFWTsgRHOG8IJ6Siqei0bkH5EK+CzJkKvpajWVvJMhXW
         wp1++NRaPKaGViwIAv6zwv8lJPvdlX4qglDOm7p8ZEo7eMVSnGrGfJnyWrmvi2snW3pj
         E8Jhr7QX74ctiB7T8607Gxqp9clO5UY034FK/PIw2bIQEj1X25GL7CNUYUP9HkpFHHzS
         3CrsCt72bxd+VfQGKYLYnq7f5ZgH31Rvqx8FJDLKieh3MbopgA0BQlOq2fVPxVYrwjks
         VKVQ==
X-Gm-Message-State: AOAM530odyilQcBkrg7IW+3O2h9AdQ2qj93zhhPPFR//eE0vJrzRM98x
	JPnSy2ACwFn99kPXq054FczmuCKatyQ8+SElKN0=
X-Google-Smtp-Source: 
 ABdhPJznbNbzhPabJIzHk8heps91hFriYHI40GMLgyS0RnYJMnBky1/C6Yy4TzkLDBvm1VZAolDn5UqHHvJ58CrF9Qo=
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr17849eds.214.1641998836311;
 Wed, 12 Jan 2022 06:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-3-alex@linutronix.de>
 <CALT56yMfCmtcbzxs+j=R0NJZZLAMtVenZgbj0rzR0+gzXnpLvw@mail.gmail.com>
 <CANNYZj9rFvsK-tBr+0_H_69=1peh4HkH9nqwj6o168x0G5u23w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9rFvsK-tBr+0_H_69=1peh4HkH9nqwj6o168x0G5u23w@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 12 Jan 2022 17:47:05 +0300
Message-ID: 
 <CALT56yOKzS1D=XJUEJMS_i+A1viKUJO_=v4TKW=gPJCECrbM6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] go: correctly set debug-prefix-map and
 build directory
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 14:47:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160484

=D0=BF=D0=BD, 10 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:08, Alexander K=
anavin <alex.kanavin@gmail.com>:
>
> aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or dir=
ectory
>
> You need to find out why the variable isn't expanded. 'bitbake -e go-runt=
ime' may help.

The distro I was using here (rpb if that matters) does not use
security_flags.inc, so SECURITY_LDFLAGS are not defined.
Please remove such dependency. We can not expect that every distro
would include security_flags.inc

>
> Alex
>
> On Mon, 10 Jan 2022 at 05:34, Dmitry Baryshkov <dbaryshkov@gmail.com> wro=
te:
>>
>> =D1=81=D0=B1, 1 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 14:30, Alexander=
 Kanavin <alex.kanavin@gmail.com>:
>> >
>> > Go has its own system for creating temporary build
>> > sub-directories with randomized names, and setting
>> > up debug-prefix-map on the fly to prevent those
>> > directories leaking into target binaries. OE's own
>> > settings were clashing with it, so this change
>> > carefully avoids the two stepping on each other.
>> >
>> > Additionally, the top level build directory cannot
>> > be named 'go-something'.
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>
>> This patch breaks the build here, with the following error messages
>> (full log attached):
>>
>> | HASH[build go/importer]
>> | HASH[build go/importer]: "go1.17.5"
>> | HASH[build go/importer]: "compile\n"
>> | HASH[build go/importer]: "goos linux goarch arm64\n"
>> | HASH[build go/importer]: "import \"go/importer\"\n"
>> | HASH[build go/importer]: "omitdebug false standard true local false
>> prefix \"\"\n"
>> | HASH[build go/importer]: "modinfo \"\"\n"
>> | HASH[build go/importer]: "compile compile version go1.17.5 [] []\n"
>> | HASH[build go/importer]: "=3D\n"
>> | HASH /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-lina=
ro-linux/go-runtime/1.17.5-r0/go/src/go/importer/importer.go:
>> 030536f1a71bcd0c3615684f4b94373b4136a282de9e6cd9d283e454704be386
>> | HASH[build go/importer]: "file importer.go AwU28acbzQw2FWhPS5Q3\n"
>> | HASH[build go/importer]: "import go/build XGXQDTt1BQjYRjE7nFi7\n"
>> | HASH[build go/importer]: "import go/internal/gccgoimporter
>> MqGIqtLxk8pkuc9XENIo\n"
>> | HASH[build go/importer]: "import go/internal/gcimporter
>> U16uHUOXrDggYRgVMENf\n"
>> | HASH[build go/importer]: "import go/internal/srcimporter
>> vtV3UGYK55GaAj4JI8MN\n"
>> | HASH[build go/importer]: "import go/token 36MC7EMX8CqyCcPmrSmS\n"
>> | HASH[build go/importer]: "import go/types EyjwGzDrQ1CtOXxe_UYb\n"
>> | HASH[build go/importer]: "import io A3HnNVYVSU1F06BuLR5o\n"
>> | HASH[build go/importer]: "import runtime TtpuHdFJwA5GfsHmM2LT\n"
>> | HASH[build go/importer]:
>> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
>> | HASH subkey b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35=
b86a7d
>> "srcfiles" =3D e6f8fcd87c2dd28b3381ad27b9938048b5b3bde6a19db4a4837e184ef=
9cef82a
>> | HASH subkey b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35=
b86a7d
>> "stdout" =3D 3cb42089ec7038a91addcc400ee71ea90feee998a35e992b699729f04ae=
85c1a
>> | go tool dist: FAILED:
>> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linu=
x/go-runtime/1.17.5-r0/go/pkg/tool/native_native/go_bootstrap
>> install -gcflags=3Dall=3D -ldflags=3Dall=3D std: exit status 2
>> | WARNING: /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-=
linaro-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939:175
>> exit 2 from './make.bash --target-only --no-banner std'
>> | WARNING: Backtrace (BB generated script):
>> | #1: do_compile,
>> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linu=
x/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,
>> line 175
>> | #2: main, /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a=
-linaro-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,
>> line 185
>>
>>
>> > ---
>> >  meta/classes/go.bbclass                 |  2 +-
>> >  meta/recipes-devtools/go/go-common.inc  |  2 +-
>> >  meta/recipes-devtools/go/go-runtime.inc |  7 ++++++-
>> >  meta/recipes-devtools/go/go-target.inc  | 10 ++++++++++
>> >  4 files changed, 18 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>> > index 5c1fdd7d5f..9c4c92bffd 100644
>> > --- a/meta/classes/go.bbclass
>> > +++ b/meta/classes/go.bbclass
>> > @@ -67,7 +67,7 @@ GO_INSTALL_FILTEROUT ?=3D "${GO_IMPORT}/vendor/"
>> >
>> >  B =3D "${WORKDIR}/build"
>> >  export GOPATH =3D "${B}"
>> > -export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
>> > +export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
>> >  GOTMPDIR[vardepvalue] =3D ""
>> >
>> >  python go_do_unpack() {
>> > diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-dev=
tools/go/go-common.inc
>> > index 5bbf35b787..83f8db7b39 100644
>> > --- a/meta/recipes-devtools/go/go-common.inc
>> > +++ b/meta/recipes-devtools/go/go-common.inc
>> > @@ -23,7 +23,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>> >  SSTATE_SCAN_CMD =3D "true"
>> >
>> >  export GOROOT_OVERRIDE =3D "1"
>> > -export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
>> > +export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
>> >  GOTMPDIR[vardepvalue] =3D ""
>> >  export CGO_ENABLED =3D "1"
>> >
>> > diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-de=
vtools/go/go-runtime.inc
>> > index 617e6b5414..a08d44dd3a 100644
>> > --- a/meta/recipes-devtools/go/go-runtime.inc
>> > +++ b/meta/recipes-devtools/go/go-runtime.inc
>> > @@ -2,10 +2,15 @@ DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
>> >  DEPENDS:class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk"
>> >  PROVIDES =3D "virtual/${TARGET_PREFIX}go-runtime"
>> >
>> > +DEBUG_PREFIX_MAP =3D "\
>> > +                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
>> > +                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>> > +"
>> > +
>> >  export CGO_CFLAGS =3D "${CFLAGS}"
>> >  export CGO_CPPFLAGS =3D "${CPPFLAGS}"
>> >  export CGO_CXXFLAGS =3D "${CXXFLAGS}"
>> > -export CGO_LDFLAGS =3D "${LDFLAGS}"
>> > +export CGO_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}=
 ${SECURITY_LDFLAGS}"
>> >  export GOCACHE =3D "${B}/.cache"
>> >
>> >  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
>> > diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-dev=
tools/go/go-target.inc
>> > index 47b4411d54..51f1b79cc3 100644
>> > --- a/meta/recipes-devtools/go/go-target.inc
>> > +++ b/meta/recipes-devtools/go/go-target.inc
>> > @@ -1,6 +1,16 @@
>> >  DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
>> >  DEPENDS:class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk go-n=
ative"
>> >
>> > +DEBUG_PREFIX_MAP =3D "\
>> > +                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
>> > +                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>> > +"
>> > +
>> > +export CGO_CFLAGS =3D "${CFLAGS}"
>> > +export CGO_CPPFLAGS =3D "${CPPFLAGS}"
>> > +export CGO_CXXFLAGS =3D "${CXXFLAGS}"
>> > +export CGO_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}=
 ${SECURITY_LDFLAGS}"
>> > +
>> >  export GOCACHE =3D "${B}/.cache"
>> >  GO_LDFLAGS =3D ""
>> >  GO_LDFLAGS:class-nativesdk =3D "-linkmode external"
>> > --
>> > 2.20.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#160096): https://lists.openembedded.org/g/openembe=
dded-core/message/160096
>> > Mute This Topic: https://lists.openembedded.org/mt/88071320/3618183
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[dbaryshkov@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> With best wishes
>> Dmitry



--=20
With best wishes
Dmitry

