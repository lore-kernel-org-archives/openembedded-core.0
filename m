Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC9EC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:01:03 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.24520.1641999662813390641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mBdC6T1F;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id p37so5279017uae.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nc+zAeMLrDB2Lc1FXvfBniCSzpKwk2mktolLYaiPoc8=;
        b=mBdC6T1FpHsbaIzCcVRFh7giA1xcptAkVonSJilGsUu4vtxdBi7RfII54kw8IcSojJ
         vnQ8Kko1wvUCXYcm1A56E6XSLsN+9nvzQOY41yTgiKusqX3pjraZZJd57vYeIu27o7ks
         ukvBoqD9GY6WW6uAQPGEbvaLSuvaBo87rrGW5NnSe4ymj0yesgztC4XLxzhWX+XX9983
         b5us9A8jf95E8nk6MSpyfYS02TKmn0yrc9WWRjbfq0Xo6gJx2fPiSdTDp4A7G/owkEta
         ckGO37Zn2eTL+BB/zP9t8QzQBy+sSXYKVixnqY6ims9opmfR4oL8uxzkcQ4ILiQZ7DSk
         HT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nc+zAeMLrDB2Lc1FXvfBniCSzpKwk2mktolLYaiPoc8=;
        b=gX6G0k/jNMCYtFuQKW26XHMws3vgiuZuuB8JUKwaA7NfVPUv8eDuA9y6oh0FL0ln7m
         Rkak3oM7Xxc090EZouwWON4QoMFXUGp23yboYN4g2TaMuX6UGggLxUN0yl/WIK9a9WnV
         +/LlUUV3AP7Oif/X0l/N8fg/4qaJc0GjU559/pOlmxwKiDXFa/NE6I6Z+6X7BeUqQDwX
         2WVEm+uSKu0tQoimyUgyBAMLk2/uxq+v4Sr3ydlPPAwbri2ZfcoLM9k+EKPXxdFomsqg
         WdPpfYg67tvoUknY3F4BVHtmANixpacie0fkfSxHIQ82LkrFrIBaSfDGwX0VHHklgf7N
         QdGw==
X-Gm-Message-State: AOAM531KdM5QIJi/Rwt5O3RVl37ml+sHFKItb+ktFbw9GTAYWnvsR5js
	qAYh7KecDKEkNdA0etUprVw/TeCY5An6fZbqpU1LU+qV
X-Google-Smtp-Source: 
 ABdhPJx5tDhF2BCC7fZewcGMSb/3G6xv3rTJv2GQAUunAqAAtopiH2mbONiTTBgVFRkY4DhMHvYTQ8H0VBdZw3RuQj4=
X-Received: by 2002:a67:c81c:: with SMTP id u28mr32804vsk.38.1641999660439;
 Wed, 12 Jan 2022 07:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-3-alex@linutronix.de>
 <CALT56yMfCmtcbzxs+j=R0NJZZLAMtVenZgbj0rzR0+gzXnpLvw@mail.gmail.com>
 <CANNYZj9rFvsK-tBr+0_H_69=1peh4HkH9nqwj6o168x0G5u23w@mail.gmail.com>
 <CALT56yNhE3T3yqmFDiAvX2yOYX5LgdcYcuF07GX_-1-AnXPC6w@mail.gmail.com>
In-Reply-To: 
 <CALT56yNhE3T3yqmFDiAvX2yOYX5LgdcYcuF07GX_-1-AnXPC6w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Jan 2022 16:00:49 +0100
Message-ID: 
 <CANNYZj9x0C0tsdMYQSbGSptQ3fNsCuyS6bkmsB-icL-VnFh5Tg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] go: correctly set debug-prefix-map and
 build directory
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000007b5e8605d563d6a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 15:01:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160486

--0000000000007b5e8605d563d6a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not immediately sure how to solve this though. We do want to keep those
flags when they're defined.

Ideas? Perhaps they could be defined empty in some place which is present
in all distributions?

Alex

On Wed, 12 Jan 2022 at 15:56, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote=
:

> =D0=BF=D0=BD, 10 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 11:08, Alexander=
 Kanavin <alex.kanavin@gmail.com>:
> >
> > aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or
> directory
> >
> > You need to find out why the variable isn't expanded. 'bitbake -e
> go-runtime' may help.
>
> For the reference:
>
> # $CGO_LDFLAGS [2 operations]
> #   exported
> /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/me=
ta/recipes-devtools/go/go-runtime.inc:13
> #     [export] "1"
> #   set
> /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/me=
ta/recipes-devtools/go/go-runtime.inc:13
> #     "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}"
> # pre-expansion value:
> #   "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}"
> export CGO_LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> \${SECURITY_LDFLAGS}"
>
> Quoting bitbake manual:
>
> If the variable expansion syntax is used on a variable that does not
> exist, the string is kept as is. For example, given the following
> assignment, BAR expands to the literal string "${FOO}" as long as FOO
> does not exist.
>
>      BAR =3D "${FOO}"
>
>
>
> >
> > Alex
> >
> > On Mon, 10 Jan 2022 at 05:34, Dmitry Baryshkov <dbaryshkov@gmail.com>
> wrote:
> >>
> >> =D1=81=D0=B1, 1 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 14:30, Alexand=
er Kanavin <alex.kanavin@gmail.com>:
> >> >
> >> > Go has its own system for creating temporary build
> >> > sub-directories with randomized names, and setting
> >> > up debug-prefix-map on the fly to prevent those
> >> > directories leaking into target binaries. OE's own
> >> > settings were clashing with it, so this change
> >> > carefully avoids the two stepping on each other.
> >> >
> >> > Additionally, the top level build directory cannot
> >> > be named 'go-something'.
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >>
> >> This patch breaks the build here, with the following error messages
> >> (full log attached):
> >>
> >> | HASH[build go/importer]
> >> | HASH[build go/importer]: "go1.17.5"
> >> | HASH[build go/importer]: "compile\n"
> >> | HASH[build go/importer]: "goos linux goarch arm64\n"
> >> | HASH[build go/importer]: "import \"go/importer\"\n"
> >> | HASH[build go/importer]: "omitdebug false standard true local false
> >> prefix \"\"\n"
> >> | HASH[build go/importer]: "modinfo \"\"\n"
> >> | HASH[build go/importer]: "compile compile version go1.17.5 [] []\n"
> >> | HASH[build go/importer]: "=3D\n"
> >> | HASH
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/go/src/go/importer/importer.go:
> >> 030536f1a71bcd0c3615684f4b94373b4136a282de9e6cd9d283e454704be386
> >> | HASH[build go/importer]: "file importer.go AwU28acbzQw2FWhPS5Q3\n"
> >> | HASH[build go/importer]: "import go/build XGXQDTt1BQjYRjE7nFi7\n"
> >> | HASH[build go/importer]: "import go/internal/gccgoimporter
> >> MqGIqtLxk8pkuc9XENIo\n"
> >> | HASH[build go/importer]: "import go/internal/gcimporter
> >> U16uHUOXrDggYRgVMENf\n"
> >> | HASH[build go/importer]: "import go/internal/srcimporter
> >> vtV3UGYK55GaAj4JI8MN\n"
> >> | HASH[build go/importer]: "import go/token 36MC7EMX8CqyCcPmrSmS\n"
> >> | HASH[build go/importer]: "import go/types EyjwGzDrQ1CtOXxe_UYb\n"
> >> | HASH[build go/importer]: "import io A3HnNVYVSU1F06BuLR5o\n"
> >> | HASH[build go/importer]: "import runtime TtpuHdFJwA5GfsHmM2LT\n"
> >> | HASH[build go/importer]:
> >> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
> >> | HASH subkey
> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
> >> "srcfiles" =3D
> e6f8fcd87c2dd28b3381ad27b9938048b5b3bde6a19db4a4837e184ef9cef82a
> >> | HASH subkey
> b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d
> >> "stdout" =3D
> 3cb42089ec7038a91addcc400ee71ea90feee998a35e992b699729f04ae85c1a
> >> | go tool dist: FAILED:
> >>
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/go/pkg/tool/native_native/go_bootstrap
> >> install -gcflags=3Dall=3D -ldflags=3Dall=3D std: exit status 2
> >> | WARNING:
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/temp/run.do_compile.2219939:175
> >> exit 2 from './make.bash --target-only --no-banner std'
> >> | WARNING: Backtrace (BB generated script):
> >> | #1: do_compile,
> >>
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,
> >> line 175
> >> | #2: main,
> /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linaro-linux=
/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,
> >> line 185
> >>
> >>
> >> > ---
> >> >  meta/classes/go.bbclass                 |  2 +-
> >> >  meta/recipes-devtools/go/go-common.inc  |  2 +-
> >> >  meta/recipes-devtools/go/go-runtime.inc |  7 ++++++-
> >> >  meta/recipes-devtools/go/go-target.inc  | 10 ++++++++++
> >> >  4 files changed, 18 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> >> > index 5c1fdd7d5f..9c4c92bffd 100644
> >> > --- a/meta/classes/go.bbclass
> >> > +++ b/meta/classes/go.bbclass
> >> > @@ -67,7 +67,7 @@ GO_INSTALL_FILTEROUT ?=3D "${GO_IMPORT}/vendor/"
> >> >
> >> >  B =3D "${WORKDIR}/build"
> >> >  export GOPATH =3D "${B}"
> >> > -export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> >> > +export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
> >> >  GOTMPDIR[vardepvalue] =3D ""
> >> >
> >> >  python go_do_unpack() {
> >> > diff --git a/meta/recipes-devtools/go/go-common.inc
> b/meta/recipes-devtools/go/go-common.inc
> >> > index 5bbf35b787..83f8db7b39 100644
> >> > --- a/meta/recipes-devtools/go/go-common.inc
> >> > +++ b/meta/recipes-devtools/go/go-common.inc
> >> > @@ -23,7 +23,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> >> >  SSTATE_SCAN_CMD =3D "true"
> >> >
> >> >  export GOROOT_OVERRIDE =3D "1"
> >> > -export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> >> > +export GOTMPDIR ?=3D "${WORKDIR}/build-tmp"
> >> >  GOTMPDIR[vardepvalue] =3D ""
> >> >  export CGO_ENABLED =3D "1"
> >> >
> >> > diff --git a/meta/recipes-devtools/go/go-runtime.inc
> b/meta/recipes-devtools/go/go-runtime.inc
> >> > index 617e6b5414..a08d44dd3a 100644
> >> > --- a/meta/recipes-devtools/go/go-runtime.inc
> >> > +++ b/meta/recipes-devtools/go/go-runtime.inc
> >> > @@ -2,10 +2,15 @@ DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
> >> >  DEPENDS:class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk"
> >> >  PROVIDES =3D "virtual/${TARGET_PREFIX}go-runtime"
> >> >
> >> > +DEBUG_PREFIX_MAP =3D "\
> >> > +                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >> > +                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D =
\
> >> > +"
> >> > +
> >> >  export CGO_CFLAGS =3D "${CFLAGS}"
> >> >  export CGO_CPPFLAGS =3D "${CPPFLAGS}"
> >> >  export CGO_CXXFLAGS =3D "${CXXFLAGS}"
> >> > -export CGO_LDFLAGS =3D "${LDFLAGS}"
> >> > +export CGO_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDE=
D}
> ${SECURITY_LDFLAGS}"
> >> >  export GOCACHE =3D "${B}/.cache"
> >> >
> >> >  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> >> > diff --git a/meta/recipes-devtools/go/go-target.inc
> b/meta/recipes-devtools/go/go-target.inc
> >> > index 47b4411d54..51f1b79cc3 100644
> >> > --- a/meta/recipes-devtools/go/go-target.inc
> >> > +++ b/meta/recipes-devtools/go/go-target.inc
> >> > @@ -1,6 +1,16 @@
> >> >  DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
> >> >  DEPENDS:class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk
> go-native"
> >> >
> >> > +DEBUG_PREFIX_MAP =3D "\
> >> > +                     -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >> > +                     -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D =
\
> >> > +"
> >> > +
> >> > +export CGO_CFLAGS =3D "${CFLAGS}"
> >> > +export CGO_CPPFLAGS =3D "${CPPFLAGS}"
> >> > +export CGO_CXXFLAGS =3D "${CXXFLAGS}"
> >> > +export CGO_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDE=
D}
> ${SECURITY_LDFLAGS}"
> >> > +
> >> >  export GOCACHE =3D "${B}/.cache"
> >> >  GO_LDFLAGS =3D ""
> >> >  GO_LDFLAGS:class-nativesdk =3D "-linkmode external"
> >> > --
> >> > 2.20.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#160096):
> https://lists.openembedded.org/g/openembedded-core/message/160096
> >> > Mute This Topic: https://lists.openembedded.org/mt/88071320/3618183
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [dbaryshkov@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
>
> --
> With best wishes
> Dmitry
>

--0000000000007b5e8605d563d6a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not immediately sure how to solve this though=
. We do want to keep those flags when they&#39;re defined. <br></div><div><=
br></div><div>Ideas? Perhaps they could be defined empty in some place whic=
h is present in all distributions?<br></div><div><br></div><div>Alex<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, 12 Jan 2022 at 15:56, Dmitry Baryshkov &lt;<a href=3D"mailto:dba=
ryshkov@gmail.com">dbaryshkov@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">=D0=BF=D0=BD, 10 =D1=8F=D0=BD=D0=B2.=
 2022 =D0=B3. =D0=B2 11:08, Alexander Kanavin &lt;<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or =
directory<br>
&gt;<br>
&gt; You need to find out why the variable isn&#39;t expanded. &#39;bitbake=
 -e go-runtime&#39; may help.<br>
<br>
For the reference:<br>
<br>
# $CGO_LDFLAGS [2 operations]<br>
#=C2=A0 =C2=A0exported /home/lumag/Projects/RPB/build-rpb/conf/../../layers=
/openembedded-core/meta/recipes-devtools/go/go-runtime.inc:13<br>
#=C2=A0 =C2=A0 =C2=A0[export] &quot;1&quot;<br>
#=C2=A0 =C2=A0set /home/lumag/Projects/RPB/build-rpb/conf/../../layers/open=
embedded-core/meta/recipes-devtools/go/go-runtime.inc:13<br>
#=C2=A0 =C2=A0 =C2=A0&quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${=
SECURITY_LDFLAGS}&quot;<br>
# pre-expansion value:<br>
#=C2=A0 =C2=A0&quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURIT=
Y_LDFLAGS}&quot;<br>
export CGO_LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed<b=
r>
\${SECURITY_LDFLAGS}&quot;<br>
<br>
Quoting bitbake manual:<br>
<br>
If the variable expansion syntax is used on a variable that does not<br>
exist, the string is kept as is. For example, given the following<br>
assignment, BAR expands to the literal string &quot;${FOO}&quot; as long as=
 FOO<br>
does not exist.<br>
<br>
=C2=A0 =C2=A0 =C2=A0BAR =3D &quot;${FOO}&quot;<br>
<br>
<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 10 Jan 2022 at 05:34, Dmitry Baryshkov &lt;<a href=3D"mailto:d=
baryshkov@gmail.com" target=3D"_blank">dbaryshkov@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; =D1=81=D0=B1, 1 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 14:30, Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt;:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Go has its own system for creating temporary build<br>
&gt;&gt; &gt; sub-directories with randomized names, and setting<br>
&gt;&gt; &gt; up debug-prefix-map on the fly to prevent those<br>
&gt;&gt; &gt; directories leaking into target binaries. OE&#39;s own<br>
&gt;&gt; &gt; settings were clashing with it, so this change<br>
&gt;&gt; &gt; carefully avoids the two stepping on each other.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Additionally, the top level build directory cannot<br>
&gt;&gt; &gt; be named &#39;go-something&#39;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@l=
inutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; This patch breaks the build here, with the following error message=
s<br>
&gt;&gt; (full log attached):<br>
&gt;&gt;<br>
&gt;&gt; | HASH[build go/importer]<br>
&gt;&gt; | HASH[build go/importer]: &quot;go1.17.5&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;compile\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;goos linux goarch arm64\n&quot;<b=
r>
&gt;&gt; | HASH[build go/importer]: &quot;import \&quot;go/importer\&quot;\=
n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;omitdebug false standard true loc=
al false<br>
&gt;&gt; prefix \&quot;\&quot;\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;modinfo \&quot;\&quot;\n&quot;<br=
>
&gt;&gt; | HASH[build go/importer]: &quot;compile compile version go1.17.5 =
[] []\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;=3D\n&quot;<br>
&gt;&gt; | HASH /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8=
a-linaro-linux/go-runtime/1.17.5-r0/go/src/go/importer/importer.go:<br>
&gt;&gt; 030536f1a71bcd0c3615684f4b94373b4136a282de9e6cd9d283e454704be386<b=
r>
&gt;&gt; | HASH[build go/importer]: &quot;file importer.go AwU28acbzQw2FWhP=
S5Q3\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import go/build XGXQDTt1BQjYRjE7n=
Fi7\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import go/internal/gccgoimporter<=
br>
&gt;&gt; MqGIqtLxk8pkuc9XENIo\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import go/internal/gcimporter<br>
&gt;&gt; U16uHUOXrDggYRgVMENf\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import go/internal/srcimporter<br=
>
&gt;&gt; vtV3UGYK55GaAj4JI8MN\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import go/token 36MC7EMX8CqyCcPmr=
SmS\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import go/types EyjwGzDrQ1CtOXxe_=
UYb\n&quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import io A3HnNVYVSU1F06BuLR5o\n&=
quot;<br>
&gt;&gt; | HASH[build go/importer]: &quot;import runtime TtpuHdFJwA5GfsHmM2=
LT\n&quot;<br>
&gt;&gt; | HASH[build go/importer]:<br>
&gt;&gt; b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51e0fa35b86a7d<b=
r>
&gt;&gt; | HASH subkey b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51=
e0fa35b86a7d<br>
&gt;&gt; &quot;srcfiles&quot; =3D e6f8fcd87c2dd28b3381ad27b9938048b5b3bde6a=
19db4a4837e184ef9cef82a<br>
&gt;&gt; | HASH subkey b98eef9d67666fef158497b06bd4a9793d63af81f5e9e5008e51=
e0fa35b86a7d<br>
&gt;&gt; &quot;stdout&quot; =3D 3cb42089ec7038a91addcc400ee71ea90feee998a35=
e992b699729f04ae85c1a<br>
&gt;&gt; | go tool dist: FAILED:<br>
&gt;&gt; /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linar=
o-linux/go-runtime/1.17.5-r0/go/pkg/tool/native_native/go_bootstrap<br>
&gt;&gt; install -gcflags=3Dall=3D -ldflags=3Dall=3D std: exit status 2<br>
&gt;&gt; | WARNING: /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/a=
rmv8a-linaro-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939:175<br>
&gt;&gt; exit 2 from &#39;./make.bash --target-only --no-banner std&#39;<br=
>
&gt;&gt; | WARNING: Backtrace (BB generated script):<br>
&gt;&gt; | #1: do_compile,<br>
&gt;&gt; /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/armv8a-linar=
o-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,<br>
&gt;&gt; line 175<br>
&gt;&gt; | #2: main, /home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/=
armv8a-linaro-linux/go-runtime/1.17.5-r0/temp/run.do_compile.2219939,<br>
&gt;&gt; line 185<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/go/go-common.inc=C2=A0 |=C2=A0 2 =
+-<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/go/go-runtime.inc |=C2=A0 7 +++++=
+-<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/go/go-target.inc=C2=A0 | 10 +++++=
+++++<br>
&gt;&gt; &gt;=C2=A0 4 files changed, 18 insertions(+), 3 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclas=
s<br>
&gt;&gt; &gt; index 5c1fdd7d5f..9c4c92bffd 100644<br>
&gt;&gt; &gt; --- a/meta/classes/go.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/go.bbclass<br>
&gt;&gt; &gt; @@ -67,7 +67,7 @@ GO_INSTALL_FILTEROUT ?=3D &quot;${GO_IMPORT=
}/vendor/&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 B =3D &quot;${WORKDIR}/build&quot;<br>
&gt;&gt; &gt;=C2=A0 export GOPATH =3D &quot;${B}&quot;<br>
&gt;&gt; &gt; -export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
&gt;&gt; &gt; +export GOTMPDIR ?=3D &quot;${WORKDIR}/build-tmp&quot;<br>
&gt;&gt; &gt;=C2=A0 GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 python go_do_unpack() {<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/re=
cipes-devtools/go/go-common.inc<br>
&gt;&gt; &gt; index 5bbf35b787..83f8db7b39 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-common.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-common.inc<br>
&gt;&gt; &gt; @@ -23,7 +23,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quo=
t;<br>
&gt;&gt; &gt;=C2=A0 SSTATE_SCAN_CMD =3D &quot;true&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 export GOROOT_OVERRIDE =3D &quot;1&quot;<br>
&gt;&gt; &gt; -export GOTMPDIR ?=3D &quot;${WORKDIR}/go-tmp&quot;<br>
&gt;&gt; &gt; +export GOTMPDIR ?=3D &quot;${WORKDIR}/build-tmp&quot;<br>
&gt;&gt; &gt;=C2=A0 GOTMPDIR[vardepvalue] =3D &quot;&quot;<br>
&gt;&gt; &gt;=C2=A0 export CGO_ENABLED =3D &quot;1&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/r=
ecipes-devtools/go/go-runtime.inc<br>
&gt;&gt; &gt; index 617e6b5414..a08d44dd3a 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-runtime.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-runtime.inc<br>
&gt;&gt; &gt; @@ -2,10 +2,15 @@ DEPENDS =3D &quot;virtual/${TUNE_PKGARCH}-g=
o go-native&quot;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS:class-nativesdk =3D &quot;virtual/${TARGET_PREF=
IX}go-crosssdk&quot;<br>
&gt;&gt; &gt;=C2=A0 PROVIDES =3D &quot;virtual/${TARGET_PREFIX}go-runtime&q=
uot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +DEBUG_PREFIX_MAP =3D &quot;\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
&gt;&gt; &gt;=C2=A0 export CGO_CPPFLAGS =3D &quot;${CPPFLAGS}&quot;<br>
&gt;&gt; &gt;=C2=A0 export CGO_CXXFLAGS =3D &quot;${CXXFLAGS}&quot;<br>
&gt;&gt; &gt; -export CGO_LDFLAGS =3D &quot;${LDFLAGS}&quot;<br>
&gt;&gt; &gt; +export CGO_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYL=
E} ${ASNEEDED} ${SECURITY_LDFLAGS}&quot;<br>
&gt;&gt; &gt;=C2=A0 export GOCACHE =3D &quot;${B}/.cache&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 GO_EXTLDFLAGS ?=3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPT=
IONS} ${LDFLAGS}&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/re=
cipes-devtools/go/go-target.inc<br>
&gt;&gt; &gt; index 47b4411d54..51f1b79cc3 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-target.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-target.inc<br>
&gt;&gt; &gt; @@ -1,6 +1,16 @@<br>
&gt;&gt; &gt;=C2=A0 DEPENDS =3D &quot;virtual/${TUNE_PKGARCH}-go go-native&=
quot;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS:class-nativesdk =3D &quot;virtual/${TARGET_PREF=
IX}go-crosssdk go-native&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +DEBUG_PREFIX_MAP =3D &quot;\<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +export CGO_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
&gt;&gt; &gt; +export CGO_CPPFLAGS =3D &quot;${CPPFLAGS}&quot;<br>
&gt;&gt; &gt; +export CGO_CXXFLAGS =3D &quot;${CXXFLAGS}&quot;<br>
&gt;&gt; &gt; +export CGO_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYL=
E} ${ASNEEDED} ${SECURITY_LDFLAGS}&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 export GOCACHE =3D &quot;${B}/.cache&quot;<br>
&gt;&gt; &gt;=C2=A0 GO_LDFLAGS =3D &quot;&quot;<br>
&gt;&gt; &gt;=C2=A0 GO_LDFLAGS:class-nativesdk =3D &quot;-linkmode external=
&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.20.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#160096): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/160096" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/160096</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/88071320/3618183" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/88071320/3618183</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:dbaryshkov@g=
mail.com" target=3D"_blank">dbaryshkov@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; With best wishes<br>
&gt;&gt; Dmitry<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--0000000000007b5e8605d563d6a7--

