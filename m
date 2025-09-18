Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A035CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 15:42:24 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.web11.18086.1758210139457081360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 08:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEcjfVuw;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-632e9c6b411so646190d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758210138; x=1758814938; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JP3Ynh1GmdalIMAvrJYvZTjntZ+NnTRYX8JxohU3EnM=;
        b=CEcjfVuwcnNJJVi+QRdUpboujbkA3eZZxjdT1/BhCRitrzO5a+j4LaZi/AaEy9Aols
         0Onw06jxaea/9pUydaxo6Rjb1cgm987zfpoNYcjBA14jFCH9SU3vOjP2ypIcVPb0uCjU
         cVaU1BH/q9rsCDJ282v2ti7fBO9TSGGPHmQMo2ZIgtx5BE8yJ4ykeBbzD44MxeAO6Sl5
         mc91MsN80RR8646JRxIIyCkoDjTE4OZ20Ng1hwqVmelnl6/rahHw3gC9juI5rWFFstRU
         DnpRkgTcywCIhlpHOUIMMSWF1WodjYNoudOgMwc6jHH3+lKPf/odTafzfGksUYcWRKxr
         A+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210138; x=1758814938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JP3Ynh1GmdalIMAvrJYvZTjntZ+NnTRYX8JxohU3EnM=;
        b=vkojiW2kNreR/Hj4+R59BxtgiquA5V/3+iP/2qa+c7sirkwWrW/dTNSo/cYMGTiYVy
         VXyV41Q29qkq5kWTMYqetR/D9XyXy8WJsDq7qCbN4SCCPfjBONGTBJTxHlN9rCdCJgPH
         Ewot04XCDVshX5bVvlXPBGh59hALSnhdL2SIvSMm2FGZ/ZtB7/JuPX7FjZrEqdw+M49s
         WL2pu3S/243KUVYCjg/bOavmdOpFDBJgZ+PJL6xQNRPtlpUZSf3j3NyhksRDnpi6K3Nl
         eFPjLZHJbekc2Z5nR5bHi4nHrAvRqPt9Lrea4pvrKkT+LGuLG1HUAnE+h8QmAtbHLw9Y
         GFoA==
X-Gm-Message-State: AOJu0YzqHXx9x6B33kjFZrvD2a25LXNTi7TC3SdDT7TlzsRdYv+nskz2
	l+Z+5NVUIdjS7sGdyE3hph8WKU6607swLqOIb4knqvJIbKSRtJ6BT/tHEPhCPNWtgOAmk2EaFr1
	j5swYkMdsKqKOT0n/utNBnjDc587hTcAACKZk
X-Gm-Gg: ASbGncvClJKewbVDI55YDYzw7srtybL9bV75JqSk5e0VHghxhlSr/9doup0xIOxHdzV
	mQQ2MJuaicPf5M1CpJXohsSeAdb3Iiuulsf5JmVMiJWTJF12LYTbgq2tRb7dYZVl2QkZOT7DnPk
	SfP2fRVmEn1vBgYQxK8OZcv0Kp2nfgHrIkOpDAmNrU0xlnKhTE3GM8FFoOsUvMsHEqOs7YX2igv
	hpAvU7m9s9+zoQQ8KyXnPxjeV/6MGI2qJkDcLCSJod1hAQNYwQfDtqZ9VTwIli9oh2kjwEoNGU6
	qeDMPd/IJZYzV9FmmRn9KPu2wb6VIYXXLlNpazlIPVI=
X-Google-Smtp-Source: AGHT+IEOGixiW8L2/nJPYlxo3e9hdUqQXVWdJWUqsBp4Y1m+ayNhsDGsIveSxf4LBEtBxyD9TKuETO1GjAGZm55kq4A=
X-Received: by 2002:a05:690e:4185:b0:62c:204:5dfa with SMTP id
 956f58d0204a3-633b070cbe6mr4405663d50.29.1758210137931; Thu, 18 Sep 2025
 08:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250918030540.2172994-1-raj.khem@gmail.com> <0c19a1d8-712a-4fcd-aa8c-a994edc2d8ed@bootlin.com>
In-Reply-To: <0c19a1d8-712a-4fcd-aa8c-a994edc2d8ed@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Sep 2025 08:42:06 -0700
X-Gm-Features: AS18NWDt5PnSQwft2H2WMvnQ4sOGRVLgTSP7sE7wjCZRvoCxAbJpI7Gv-za0D0E
Message-ID: <CAMKF1srhBhGi82_O7KrP_FR92-Dq8_SxJy2g_TJcj875xexwqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Fix nativesdk build after recipe splits
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000b646ad063f15327b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 15:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223645

--000000000000b646ad063f15327b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 1:31=E2=80=AFAM Joao Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> Hello, Khem
>
> On 9/18/25 05:05, Khem Raj via lists.openembedded.org wrote:
> > Splitting llvm, tblgen into their own recipes means we
> > have to ensure nativesdk clang build can find these tools
> > in native sysroot, which is would previously build and use
> > on its own.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Ross Burton <ross.burton@arm.com>
> > ---
> >   meta/recipes-devtools/clang/clang_git.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/clang/clang_git.bb
> b/meta/recipes-devtools/clang/clang_git.bb
> > index 9e977379325..bcc799f286b 100644
> > --- a/meta/recipes-devtools/clang/clang_git.bb
> > +++ b/meta/recipes-devtools/clang/clang_git.bb
> > @@ -78,6 +78,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
> >
> >   EXTRA_OECMAKE:append:class-nativesdk =3D "\
> >
>  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/to=
olchain-native.cmake'
> \
> > +
> -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \
> > +
> -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDIR_NATIVE}/clang-tidy-c=
onfusable-chars-gen
> \
> >
>  -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib=
 \
> >
>  -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
> >
>  -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#223625):
> https://lists.openembedded.org/g/openembedded-core/message/223625
> > Mute This Topic: https://lists.openembedded.org/mt/115304299/8026893
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> joaomarcos.costa@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> I spotted this error in the autobuilder:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2266/s=
teps/12/logs/stdio
>
> Could you please take a look?
> Thanks!
>

Logs are showing clang-native failure while the change in this patch is
limited to nativesdk clang. So it is unrelated to this patch

However change seems to be related to llvm recipe separation series since
clang is building this tool during its build and trying to use it from its
build area but it=E2=80=99s perhaps not finding libllvm from native sysroot

>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>

--000000000000b646ad063f15327b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 18, 2025 at 1:31=E2=80=AFAM=
 Joao Marcos Costa &lt;<a href=3D"mailto:joaomarcos.costa@bootlin.com">joao=
marcos.costa@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hello, Kh=
em<br>
<br>
On 9/18/25 05:05, Khem Raj via <a href=3D"http://lists.openembedded.org" re=
l=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Splitting llvm, tblgen into their own recipes means we<br>
&gt; have to ensure nativesdk clang build can find these tools<br>
&gt; in native sysroot, which is would previously build and use<br>
&gt; on its own.<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_=
blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb=
" rel=3D"noreferrer" target=3D"_blank">clang_git.bb</a> | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang_git.b=
b" rel=3D"noreferrer" target=3D"_blank">clang_git.bb</a> b/meta/recipes-dev=
tools/clang/<a href=3D"http://clang_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">clang_git.bb</a><br>
&gt; index 9e977379325..bcc799f286b 100644<br>
&gt; --- a/meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=
=3D"noreferrer" target=3D"_blank">clang_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=
=3D"noreferrer" target=3D"_blank">clang_git.bb</a><br>
&gt; @@ -78,6 +78,8 @@ EXTRA_OECMAKE +=3D &quot;-DLLVM_ENABLE_ASSERTIONS=3D=
OFF \<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0EXTRA_OECMAKE:append:class-nativesdk =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D&#39;-DCMAKE_TOOLCHAIN_FILE=3D${WORK=
DIR}/toolchain-native.cmake&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DLLVM=
_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCLAN=
G_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDIR_NATIVE}/clang-tidy-confusabl=
e-chars-gen \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ran=
lib \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \<br=
>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#223625): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/223625" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/223625</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11530429=
9/8026893" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/115304299/8026893</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:joaomarcos.costa@boot=
lin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
I spotted this error in the autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/2266/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2266/steps/12/log=
s/stdio</a><br>
<br>
Could you please take a look?<br>
Thanks!<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Logs are showing=
 clang-native failure while the change in this patch is limited to nativesd=
k clang. So it is unrelated to this patch</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">However change seems to be related to llvm recipe separat=
ion series since clang is building this tool during its build and trying to=
 use it from its build area but it=E2=80=99s perhaps not finding libllvm fr=
om native sysroot=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)"><br>
-- <br>
Best regards,<br>
Jo=C3=A3o Marcos Costa<br>
</blockquote></div></div>

--000000000000b646ad063f15327b--

