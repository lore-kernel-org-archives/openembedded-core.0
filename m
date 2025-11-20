Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DB8CFA451
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 22:59:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.582.1763679558370885767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 14:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUpSvjR7;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7866375e943so12282587b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 14:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763679557; x=1764284357; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZffQdrcfekagML/7iCX3f9GuuuPYqXWcvAIFm5xDmGs=;
        b=NUpSvjR70iSVtZLnh1xL/p7r04chBiQoHej6q1jPn9xmDd7DiMnMXB4CHs/eGlTvGo
         tZGHxosPiYx/s6JS5Ao3ElUfZQooS9JMn4D0jW2fiCOII3qcngSHAr5KNFIE4PeGH7IY
         0c37hgmxs+0wFkcv0HjujhE2gP4jCAJ2hOAnIah6XRZfF5Ew0fJJSy6RxxXhniqDDmGf
         gYAzgVvaJ3fICanz6UpFUbJicyKEQQv2qOaaKNRwokH365W0XlTB0s2O+YYN79XmUGQv
         ZD3ico5TXRiCmY2YfhuMFet6xbIgOAkjOpoaq5w4Uz6z8pYjdnJWN3dE6woFXmNl2LS9
         gaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763679557; x=1764284357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZffQdrcfekagML/7iCX3f9GuuuPYqXWcvAIFm5xDmGs=;
        b=YOBCpv+ZYcV9zL1EK22s4de/TLb15D0LcYpnDArL66BPTAeXQrFxOzAt4zx+Dd5ron
         ByooX27wHsvA62Gt1HPeTFsVPdGZJIAUp0EeCJzeffF0hE8VKYRcDKNmx8YCtGdz66pp
         O3FFS4FHvntLP89lBq1s6i6z864q60YRjB2Cey1I/w8Ji9mAejm5gC8puw7N9OKfDGgM
         kkyyqcdUvqX7QwrOGcOSfNP0KZPW4kCp+6dMQE4XairfM1ywYzW/YppaZOI6Db2k97Ys
         9RmExouJKWj8qbvyJhjEDewyCOuRVEwRG1rzV4YY1An75PNo1mLY/aKaO0zL5tEJCmDy
         X80Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA74aAMFuPJxjbKiTbjwH65oJZ1uoO//230m9YnTeS1A4wcndPbBxD7o5E7zSqbwTueY9HraFJ43e3G7YInp6Tzg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTkdXcsuRW3CSI4qB8uqitoE642FUxNO6RclppYsfX5g5wXMAR
	JQQJZeNWonrTKKvPzEsHl+TV2YL1JBjaNIDIRYhaeIJF5Yd5T6n7fUmP/NQAWtfZhoPGPtOePnG
	TsJfx97zZNQkwMqvNw7PL1bER/nKSHrU=
X-Gm-Gg: ASbGnctCib5tAxgprPCpEOVU0yx1BhffqnxHd16BFhYBe5dr9oiaB5wbjjk8+2cthUE
	oT+Y3X/WWV7HP+uynUKzMkoAAUBkZmowcimn5hG9cD2V5CkSrvX9RJrQUzm8nvSYvy4kqXDyKEY
	m/XUK+znu/I9Dfml3CLad1F+wBKxmbz8IUFTkTXLBchVGdvbF6SDfYHncn3ceL/g6e+SsMC4X8R
	La3JkCwTb2NhLUcnGbK9MVbMUMJRPDFGEvb136bvE0pjYk54v+k/+p5TGPy98RXNUW0ALrjPESe
	5giCutCsFnAfs6QUc45khH1Z5/kyXeF74Ns0hH+SePH4VMmrgGO3jFFkFC5Odv3AAlRA4t//6dI
	NslMgPvMiLMemb6KLXovjxpYlKITs5Nh5okTQVTiyX7zTtpTNzyfYYCFk
X-Google-Smtp-Source: AGHT+IFfCaj4yCvWWi+wplNuGUjY9pxwBAWzhshVm7jxPjXgjGQcWxN+8qIOxkrwFQ7d6TlHXmGBxEe/0WGorm6CPyQ=
X-Received: by 2002:a05:690c:6e10:b0:786:a8bd:3511 with SMTP id
 00721157ae682-78a8b47ac2cmr1112757b3.4.1763679557414; Thu, 20 Nov 2025
 14:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20251120121947.3473848-1-skandigraun@gmail.com>
 <20251120121947.3473848-2-skandigraun@gmail.com> <62b3ba44522521b8f0f54a88e90e9805755f379b.camel@linuxfoundation.org>
In-Reply-To: <62b3ba44522521b8f0f54a88e90e9805755f379b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Nov 2025 14:58:51 -0800
X-Gm-Features: AWmQ_bmrK0WUbYxylUxLSF9FDZjhw87cYe4gM8J7B157SBzmc_oLXKaik6-Ssvw
Message-ID: <CAMKF1sqkoatLyx-30gTMipqfz4jVVVf0TPbECtk5xJkU9GTV3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf, gcc toolchain: add
 -fcanon-prefix-map to map-prefixes
To: richard.purdie@linuxfoundation.org
Cc: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084727f06440ea5c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 22:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226642

--00000000000084727f06440ea5c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 2:49=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Thu, 2025-11-20 at 13:19 +0100, Gyorgy Sarvari via
> lists.openembedded.org wrote:
> > This patch adds -fcanon-prefix-map to the list of compile file-prefixes
> > list in case at least gcc 13 is used (it's a gcc-only flag).
> >
> > This flag used to be part of this list in the past, but was removed wit=
h
> [1].
> >
> > Since then the source file paths are not canonicalized, which makes
> > the system to miss some (and sometimes all) source files to include
> > in the corresponding -src packages. As an example sqlite3 and audiofile
> > (from meta-oe) produces empty src packages, mostly due to the pathes:
> > they frequently use relative paths that don't match up with the
> > absolute path specified in the file-preifx map:
> > `pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but
> > the first one won't match the prefix-map, so it is omitted.
> >
> > This patch adds this option again with gcc: for class-target it is uses
> > always, and for class-native it is used when the host gcc is at least
> > version 13.
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > ---
> >  meta/classes/toolchain/gcc-native.bbclass | 3 +++
> >  meta/classes/toolchain/gcc.bbclass        | 2 ++
> >  meta/conf/bitbake.conf                    | 2 +-
> >  3 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/toolchain/gcc-native.bbclass
> b/meta/classes/toolchain/gcc-native.bbclass
> > index a708bd0389..8708ad0211 100644
> > --- a/meta/classes/toolchain/gcc-native.bbclass
> > +++ b/meta/classes/toolchain/gcc-native.bbclass
> > @@ -13,3 +13,6 @@ BUILD_OBJDUMP =3D "${BUILD_PREFIX}objdump"
> >  BUILD_NM =3D "${BUILD_PREFIX}nm"
> >  BUILD_READELF =3D "${BUILD_PREFIX}readelf"
> >
> > +# gcc started to support -fcanon-prefix-map from version 13
> > +DEBUG_PREFIX_MAP_EXTRA:class-native =3D \
> > +    "${@'-fcanon-prefix-map' if
> bb.utils.vercmp_string_op(oe.utils.get_host_gcc_version(d), '13.0.0', '>=
=3D')
> else ''}"
> > diff --git a/meta/classes/toolchain/gcc.bbclass
> b/meta/classes/toolchain/gcc.bbclass
> > index a5adb5ca37..0ed49ba892 100644
> > --- a/meta/classes/toolchain/gcc.bbclass
> > +++ b/meta/classes/toolchain/gcc.bbclass
> > @@ -30,4 +30,6 @@
> PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian =3D
> "gcc-crosss
> >  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =
=3D
> "gcc-crosssdk-${SDK_SYS}"
> >  PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian
> =3D "nativesdk-gcc-runtime"
> >
> > +DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> > +
> >  TCOVERRIDE =3D "toolchain-gcc"
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 5406e542db..600d4baffb 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
> >  ##################################################################
> >  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> >  # Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "\
> > +DEBUG_PREFIX_MAP ?=3D "${DEBUG_PREFIX_MAP_EXTRA} \
> >   -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> >   -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> >   -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> >
>
> I think we should do something like this patch but just with only the
> target pieces, not the native ones.
>

cc-rs is perhaps the problematic bit, if thats sorted with the second patch
then I agree, we can keep it from target alone.


>
> The gcc version check is a slow function call since it execs a command
> and we really don't want a call like that dropped inside a variable.
>
> native components don't have -src packages so I'm not sure we need that
> element of this. The simplest thing would be to drop that piece.
>
> This issue was identified as a release blocker so I'll probably hack
> the patch and put something into master-next for testing overnight.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226641):
> https://lists.openembedded.org/g/openembedded-core/message/226641
> Mute This Topic: https://lists.openembedded.org/mt/116389619/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000084727f06440ea5c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 20,=
 2025 at 2:49=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailt=
o:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Thu, 2025-11-20 at 13:19 +0100, Gyorgy Sarvari via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; This patch adds -fcanon-prefix-map to the list of compile file-prefixe=
s<br>
&gt; list in case at least gcc 13 is used (it&#39;s a gcc-only flag).<br>
&gt; <br>
&gt; This flag used to be part of this list in the past, but was removed wi=
th [1].<br>
&gt; <br>
&gt; Since then the source file paths are not canonicalized, which makes<br=
>
&gt; the system to miss some (and sometimes all) source files to include<br=
>
&gt; in the corresponding -src packages. As an example sqlite3 and audiofil=
e<br>
&gt; (from meta-oe) produces empty src packages, mostly due to the pathes:<=
br>
&gt; they frequently use relative paths that don&#39;t match up with the<br=
>
&gt; absolute path specified in the file-preifx map:<br>
&gt; `pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but=
<br>
&gt; the first one won&#39;t match the prefix-map, so it is omitted.<br>
&gt; <br>
&gt; This patch adds this option again with gcc: for class-target it is use=
s<br>
&gt; always, and for class-native it is used when the host gcc is at least<=
br>
&gt; version 13.<br>
&gt; <br>
&gt; Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.=
com" target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/toolchain/gcc-native.bbclass | 3 +++<br>
&gt; =C2=A0meta/classes/toolchain/gcc.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 ++<br>
&gt; =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
2 +-<br>
&gt; =C2=A03 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/toolchain/gcc-native.bbclass b/meta/classes/=
toolchain/gcc-native.bbclass<br>
&gt; index a708bd0389..8708ad0211 100644<br>
&gt; --- a/meta/classes/toolchain/gcc-native.bbclass<br>
&gt; +++ b/meta/classes/toolchain/gcc-native.bbclass<br>
&gt; @@ -13,3 +13,6 @@ BUILD_OBJDUMP =3D &quot;${BUILD_PREFIX}objdump&quot;=
<br>
&gt; =C2=A0BUILD_NM =3D &quot;${BUILD_PREFIX}nm&quot;<br>
&gt; =C2=A0BUILD_READELF =3D &quot;${BUILD_PREFIX}readelf&quot;<br>
&gt; =C2=A0<br>
&gt; +# gcc started to support -fcanon-prefix-map from version 13<br>
&gt; +DEBUG_PREFIX_MAP_EXTRA:class-native =3D \<br>
&gt; +=C2=A0=C2=A0=C2=A0 &quot;${@&#39;-fcanon-prefix-map&#39; if bb.utils.=
vercmp_string_op(oe.utils.get_host_gcc_version(d), &#39;13.0.0&#39;, &#39;&=
gt;=3D&#39;) else &#39;&#39;}&quot;<br>
&gt; diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolcha=
in/gcc.bbclass<br>
&gt; index a5adb5ca37..0ed49ba892 100644<br>
&gt; --- a/meta/classes/toolchain/gcc.bbclass<br>
&gt; +++ b/meta/classes/toolchain/gcc.bbclass<br>
&gt; @@ -30,4 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-=
cross-canadian =3D &quot;gcc-crosss<br>
&gt; =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canad=
ian =3D &quot;gcc-crosssdk-${SDK_SYS}&quot;<br>
&gt; =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-ca=
nadian =3D &quot;nativesdk-gcc-runtime&quot;<br>
&gt; =C2=A0<br>
&gt; +DEBUG_PREFIX_MAP_EXTRA =3D &quot;-fcanon-prefix-map&quot;<br>
&gt; +<br>
&gt; =C2=A0TCOVERRIDE =3D &quot;toolchain-gcc&quot;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 5406e542db..600d4baffb 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PARA=
LLEL_MAKEINST} &quot;<br>
&gt; =C2=A0################################################################=
##<br>
&gt; =C2=A0TARGET_DBGSRC_DIR ?=3D &quot;/usr/src/debug/${PN}/${PV}&quot;<br=
>
&gt; =C2=A0# Beware: applied last to first<br>
&gt; -DEBUG_PREFIX_MAP ?=3D &quot;\<br>
&gt; +DEBUG_PREFIX_MAP ?=3D &quot;${DEBUG_PREFIX_MAP_EXTRA} \<br>
&gt; =C2=A0 -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; =C2=A0 -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
&gt; =C2=A0 -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
&gt; <br>
<br>
I think we should do something like this patch but just with only the<br>
target pieces, not the native ones.<br></blockquote><div><br></div><div>cc-=
rs is perhaps the problematic bit, if thats=C2=A0sorted with the second pat=
ch</div><div>then I agree, we can keep it from target alone.=C2=A0</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The gcc version check is a slow function call since it execs a command<br>
and we really don&#39;t want a call like that dropped inside a variable.<br=
>
<br>
native components don&#39;t have -src packages so I&#39;m not sure we need =
that<br>
element of this. The simplest thing would be to drop that piece.<br>
<br>
This issue was identified as a release blocker so I&#39;ll probably hack<br=
>
the patch and put something into master-next for testing overnight.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226641): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226641" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226641</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116389619/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116389619/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000084727f06440ea5c3--

