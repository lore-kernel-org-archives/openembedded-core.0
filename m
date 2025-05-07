Return-Path: <sathishkumar.d.cbe@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BC6C369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 06:04:21 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.1789.1746597857045351021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 23:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E6KKBLHb;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: sathishkumar.d.cbe@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7086dcab64bso60660987b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746597856; x=1747202656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3E/OrXXvC67gKSi92qjkhN4mVqSG9/lv9VR8SGeiLs=;
        b=E6KKBLHbAsXW9gP128A63aG4rfLmigoVifF6EKY5056ExNu5IL4T4b2/MLhh5ws3cw
         tcRZlggDlV2HlBjerPcjZsfahjBBOjBwrUpNyyCCtSDc21IGxGuikxR+4bq4GiZxSnVo
         Zve3yC+BJNBTHbPs/XLFDWbpiHb5aGVpmCFXzRhWzNqJfcoVrpP4EV4RYC1E/nuZkMZ5
         VZqCGyTawhQYW0mHwjM7cwWaUBlmM/Lf8Ke8gf+8X0iKx+wXUxP/wQW74v2fpxe6jo04
         3Kt19myDwcXlBcSkgejNrrVTbQD+H4JYrJqcsLGlmYvdL6Cn3gb8TmFyGArnzy6RdYNo
         5nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746597856; x=1747202656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3E/OrXXvC67gKSi92qjkhN4mVqSG9/lv9VR8SGeiLs=;
        b=SysIL7fN0YBDAZ/FuDNrk3FE81DbI2A28/a96XxB8CXh6uWFyb6meuZnNpxglBGtE7
         lAGa9eAn9WzJmG8fyieNghJiYubC9A8glkCNzdQPy6ZBG/taPdjP9cCUOl7sc7FiHi6Z
         DqJywKnwdMxOwtukjcPAJvBuM0GEuw2f1OJehocnyyKLo/KfQeIIwpw9Nz4tjJW6Wxm0
         njKf6jhQvBhdPXxv+KHaB2dh3FSGHg0/ClZCSPRYkEZDYioUyYwCqPyxym7ueoH/dsj/
         4keI0Z5HCuDuVfzGH2Vfl2b+MtgYlC25iyNqrNOe9hsJ16UamUsdn5yCCioVeRHC2DLW
         Yq7g==
X-Gm-Message-State: AOJu0YyWSGVX/Dok3K4RJTMolBJ+fP2fEpAFgivuhlQusI1l9o+8oxce
	X5doOTOIMxe/ii+3t4daUnYmZY200bGWB+lUz9ydhbsPFuFij57ilkv6bLnFgA4jTBOT+u7a+dE
	pWj7SpuMR7yWusrZyQnRqeITNaSs=
X-Gm-Gg: ASbGncuOWFByHkhWNhZZZzd1T4A1M3GZ4zZ7DJBBbBNupz0Pl3vxX3g+UBIFIrc6mOL
	nJzgAt8uUuVvEFt4ctAFAI0aa5v2kUkTg7kWejoKkruh/VFxvKOp8Lf1eg817WIZbHa5OYGArZp
	6kV9Tz9wmXjSFXK9s3dyHJsA==
X-Google-Smtp-Source: AGHT+IGjX/7J9M4A9waRHEYwRSwCX0UJVUkSeohmFl6nzWxuUPhD7BaSaS9wFOk62mMyVuBWXst8khDfVtk6ibF6tx8=
X-Received: by 2002:a05:690c:3510:b0:6fd:359a:8fd2 with SMTP id
 00721157ae682-70a1dacd7dbmr28436557b3.26.1746597856155; Tue, 06 May 2025
 23:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com> <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
In-Reply-To: <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
From: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Date: Wed, 7 May 2025 11:34:05 +0530
X-Gm-Features: ATxdqUHrw-bQnUYgRE8z1MZrI-xr3bl0y9dDMkgwyK2tkc4Z3bl4h9nB4X6FsEo
Message-ID: <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c81ccc06348580e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216090

--000000000000c81ccc06348580e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:29=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar Duraisamy
> <sathishkumar.d.cbe@gmail.com> wrote:
> >
> > Hi
> >
> > On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >>
> >> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
> >> lists.openembedded.org
> >> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
> >> >
> >> > Hi all,
> >> >
> >> > I am also facing the same build issue. I tried to understand the
> issue. From build system for both openssl and systemd,
> -mbranch-protection=3Dstandard   enabled. In fact the support this flag a=
dded
> long back,
> https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce8=
09cc5ecd9672f5e86bf8a579
> and tpm2 introduces additional dependencies for systemd as in commit
> https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/s=
ystemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f
> .
> >> >
> >>
> >> is this flag passed to linker as well ?
> >>
> > Openssl:
> > =3D=3D=3D=3D=3D=3D=3D
> >
> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> >
> > export CFLAGS=3D" -O2 -g
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3=
.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
> -pipe -Wl,-z,gcs-compliant=3Dall "
> >
> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3=
.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now"
> >
> > systemd
> > =3D=3D=3D=3D=3D=3D
> >
> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/systemd/257.5/recipe-sysroot"
> >
> > export CFLAGS=3D" -O2 -g
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
> -pipe
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/systemd/257.5/recipe-sysroot"
> >
> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now"
> >
> >
>
> Please try adding -Wl,-z,gcs-compliant=3Dall to systemd LDFLAGS not
> CFLAGS or to openssl flags.


Shortly I will build with LDFLAGS and will post the update here.

Yesterday, I added ' EXTRA_OECONF:append:aarch64 =3D " no-asm" '  as
recommended by Max to the openssl bbappend file. And I see I am able to
build systemd. I will re-build with LDFLAGS.



>
>
> >>
> >> > So something issue with gcc-15? or what makes openssl to loose gcs?
> >> >
> >> > Regards,
> >> > Sathishkumar D
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#216040):
> https://lists.openembedded.org/g/openembedded-core/message/216040
> >> > Mute This Topic: https://lists.openembedded.org/mt/112627480/1997914
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
>

--000000000000c81ccc06348580e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Wed, May 7, 2025 at 4:29=E2=80=AF=
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Tue, May 6, 2025 at 6:28=E2=80=AFA=
M Sathishkumar Duraisamy<br>
&lt;<a href=3D"mailto:sathishkumar.d.cbe@gmail.com" target=3D"_blank">sathi=
shkumar.d.cbe@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a><br>
&gt;&gt; &lt;sathishkumar.d.cbe=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi all,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am also facing the same build issue. I tried to understand =
the issue. From build system for both openssl and systemd, -mbranch-protect=
ion=3Dstandard=C2=A0 =C2=A0enabled. In fact the support this flag added lon=
g back, <a href=3D"https://github.com/openembedded/openembedded-core/commit=
/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5=
ce809cc5ecd9672f5e86bf8a579</a> and tpm2 introduces additional dependencies=
 for systemd as in commit <a href=3D"https://git.yoctoproject.org/meta-secu=
rity/commit/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=3D6eb3098=
e57881895e62fc811f714c2aa4ecfcf8f" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/system=
d/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f</a>.<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; is this flag passed to linker as well ?<br>
&gt;&gt;<br>
&gt; Openssl:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; export CC=3D&quot;aarch64-tdx-linux-gcc=C2=A0 -march=3Darmv8-a+crypto =
-mbranch-protection=3Dstandard -fstack-protector-strong=C2=A0 -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=
=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linu=
x/openssl/3.5.0/recipe-sysroot&quot;<br>
&gt;<br>
&gt; export CFLAGS=3D&quot; -O2 -g=C2=A0 -ffile-prefix-map=3D/home/sathishk=
umar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/o=
penssl-3.5.0=3D/usr/src/debug/openssl/3.5.0=C2=A0 -ffile-prefix-map=3D/home=
/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openss=
l/3.5.0/build=3D/usr/src/debug/openssl/3.5.0=C2=A0 -ffile-prefix-map=3D/hom=
e/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/opens=
sl/3.5.0/recipe-sysroot=3D=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoc=
tospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sy=
sroot-native=3D=C2=A0 -pipe -Wl,-z,gcs-compliant=3Dall &quot;<br>
&gt;<br>
&gt; export LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed=
=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/open=
ssl/3.5.0=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-ne=
xt/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/ope=
nssl/3.5.0=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-n=
ext/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D=C2=A0 -=
ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work=
/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D=C2=A0 -Wl,-z,relro=
,-z,now&quot;<br>
&gt;<br>
&gt; systemd<br>
&gt; =3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; export CC=3D&quot;aarch64-tdx-linux-gcc=C2=A0 -march=3Darmv8-a+crypto =
-mbranch-protection=3Dstandard -fstack-protector-strong=C2=A0 -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=
=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linu=
x/systemd/257.5/recipe-sysroot&quot;<br>
&gt;<br>
&gt; export CFLAGS=3D&quot; -O2 -g=C2=A0 -ffile-prefix-map=3D/home/sathishk=
umar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/g=
it=3D/usr/src/debug/systemd/257.5=C2=A0 -ffile-prefix-map=3D/home/sathishku=
mar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/bu=
ild=3D/usr/src/debug/systemd/257.5=C2=A0 -ffile-prefix-map=3D/home/sathishk=
umar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/r=
ecipe-sysroot=3D=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/ve=
rdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-nati=
ve=3D=C2=A0 -pipe --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/bui=
ld/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot&quot;<br>
&gt;<br>
&gt; export LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed=
=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5=
=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.=
5=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build=
/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D=C2=A0 -ffile-pre=
fix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-t=
dx-linux/systemd/257.5/recipe-sysroot-native=3D=C2=A0 -Wl,-z,relro,-z,now&q=
uot;<br>
&gt;<br>
&gt;<br>
<br>
Please try adding -Wl,-z,gcs-compliant=3Dall to systemd LDFLAGS not<br>
CFLAGS or to openssl flags.</blockquote><div><br></div><div>Shortly I will =
build with=C2=A0LDFLAGS and will post the update here.=C2=A0</div><div><br>=
</div><div>Yesterday, I added &#39; EXTRA_OECONF:append:aarch64 =3D &quot; =
no-asm&quot; &#39;=C2=A0 as recommended by Max to the openssl bbappend file=
. And I see I am able to build systemd. I will re-build with LDFLAGS.=C2=A0=
</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; So something issue with gcc-15? or what makes openssl to loos=
e gcs?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Sathishkumar D<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#216040): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/216040" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/216040</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/112627480/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/mt/112627480/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div></div>
</div>

--000000000000c81ccc06348580e1--

