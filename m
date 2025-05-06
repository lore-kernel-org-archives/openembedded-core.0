Return-Path: <sathishkumar.d.cbe@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F39FC3ABC0
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:28:35 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.76220.1746538111395836665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 06:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QbSKEiGt;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: sathishkumar.d.cbe@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7387d4a334so4597529276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538110; x=1747142910; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cikf5FoH7OI9wVVSfcP2OpbjvMal8LlYvPc1qzefrSA=;
        b=QbSKEiGtk0fu0TqbW6nA36OZBq4hvWY5/jjP04xMU/YlCA7DDDGMM+gOqMaHKENe7X
         OHxlwOpsI4W6vO160ku45BMEBrFLvXWTB915Pjxfvg+Dy88WX+d6qL+9kry6iJ74KpaE
         LJthAqPZ8v7ER4BdD+5TjmIvDK9tMJe/1BNB7Y5B5aeE+RxAigE48AQvSETisioG3EKs
         CkMxcbwvm/JlD15Xkby2wrsgwssNnyHUIQ35/jFR/vQOlckj0LD2IPsIWbQcCycRlkpH
         S3YbEeiq49EjyELSNSX7s3zs4SN/jyqR7A9+cCG4t0pVfES++J8ARqc1BNEGuoNpz/V9
         SHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538110; x=1747142910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cikf5FoH7OI9wVVSfcP2OpbjvMal8LlYvPc1qzefrSA=;
        b=CMDgc+GpguAdb4SpTA8CISddKBylxSf3KHA/CjhmWgqJMm16U96bbtjN5ixKl2aUql
         ogkzAYKxztCROITqUWIfDkAXARqzjpW33rZYwHIZq0yuMyGJM0zfihNZf8VuorNa0b3C
         zCpMDQ10Y4mK8WQyeUc6/ywunUuDFc3lANLY9rYmA8Ub8qhGBKFOfcNjrAfHfzIfVsH0
         b+/o3xzfjFxdwv/DVnFX4IctAXQRC1L72MIGOV060S7P5kac9lHwhLk5QYbJKimZz84E
         RZsvHplzOaRcqP1Vuqro1TXjnrPAH8F9z4NHm2utbpZN+K/NU8zqG8eO8xa6npCsTddN
         D4pw==
X-Gm-Message-State: AOJu0Yyqo1jfGbACTop2hBsQ1QG8jtK0VZBETVy4Q6CDvLSTC7CJaq+e
	4aXuwQzB4kQcITEkRl7pTW5NGn+cFwcmrADR4tBxJyAX6RGxwFDiCJwrmbFYjCO8QqizL2g/mMc
	y4URlSCdff+q9jrEOa+OxjyQLPeQ=
X-Gm-Gg: ASbGncsEiy1ebshTwBUSYIU69LysGdbQgpitVc2cxniq4NRQYRV53auRcahwU/yUDLA
	ncIM6/UixCT4QTKDtVW27zbpobuIn/0hi4apdxbGXHrIBcLiJpkgXEYh7rdI8CSTijeJ2UqZwRx
	UUhBdbdX9krSBqclfjdUmzpw==
X-Google-Smtp-Source: AGHT+IFqoo0BmD61Q37LwpbcqeccxscEOb9reamnOS8e4z+1zoFdfZjyYvezYbXYrH/e8HsK2gJWFjo0PCe8Ahd6QCQ=
X-Received: by 2002:a05:690c:74c8:b0:70a:1099:ca2a with SMTP id
 00721157ae682-70a1099cb99mr9333477b3.8.1746538110211; Tue, 06 May 2025
 06:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
In-Reply-To: <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
From: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Date: Tue, 6 May 2025 18:58:19 +0530
X-Gm-Features: ATxdqUFt-IqbG9_TVbdNdtFi86AvPLBrCmNtjFHCneO5IjwzD8fJ71cmuw8Ly0E
Message-ID: <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5600e0634779750"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216047

--000000000000a5600e0634779750
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
> lists.openembedded.org
> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi all,
> >
> > I am also facing the same build issue. I tried to understand the issue.
> From build system for both openssl and systemd,
> -mbranch-protection=3Dstandard   enabled. In fact the support this flag a=
dded
> long back,
> https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce8=
09cc5ecd9672f5e86bf8a579
> and tpm2 introduces additional dependencies for systemd as in commit
> https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/s=
ystemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f
> .
> >
>
> is this flag passed to linker as well ?
>
> Openssl:
=3D=3D=3D=3D=3D=3D=3D

export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
-mbranch-protection=3Dstandard -fstack-protector-strong  -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a=
-tdx-linux/openssl/3.5.0/recipe-sysroot"

export CFLAGS=3D" -O2 -g
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3.=
5.0
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
 -pipe -Wl,-z,gcs-compliant=3Dall "

export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3.=
5.0
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now"

systemd
=3D=3D=3D=3D=3D=3D

export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
-mbranch-protection=3Dstandard -fstack-protector-strong  -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a=
-tdx-linux/systemd/257.5/recipe-sysroot"

export CFLAGS=3D" -O2 -g
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
 -pipe
--sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a=
-tdx-linux/systemd/257.5/recipe-sysroot"

export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wo=
rk/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now"




> > So something issue with gcc-15? or what makes openssl to loose gcs?
> >
> > Regards,
> > Sathishkumar D
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216040):
> https://lists.openembedded.org/g/openembedded-core/message/216040
> > Mute This Topic: https://lists.openembedded.org/mt/112627480/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a5600e0634779750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 6, 2025 at 6:43=
=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;sathishkumar.d.cbe=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I am also facing the same build issue. I tried to understand the issue=
. From build system for both openssl and systemd, -mbranch-protection=3Dsta=
ndard=C2=A0 =C2=A0enabled. In fact the support this flag added long back, <=
a href=3D"https://github.com/openembedded/openembedded-core/commit/8905639d=
1cdc5ce809cc5ecd9672f5e86bf8a579" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5e=
cd9672f5e86bf8a579</a> and tpm2 introduces additional dependencies for syst=
emd as in commit <a href=3D"https://git.yoctoproject.org/meta-security/comm=
it/meta-tpm/recipes-core/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895=
e62fc811f714c2aa4ecfcf8f" rel=3D"noreferrer" target=3D"_blank">https://git.=
yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd=
_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f</a>.<br>
&gt;<br>
<br>
is this flag passed to linker as well ?<br>
<br></blockquote><div>Openssl:</div><div>=3D=3D=3D=3D=3D=3D=3D</div><div><b=
r></div><div>export CC=3D&quot;aarch64-tdx-linux-gcc =C2=A0-march=3Darmv8-a=
+crypto -mbranch-protection=3Dstandard -fstack-protector-strong =C2=A0-O2 -=
D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -=
-sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-=
tdx-linux/openssl/3.5.0/recipe-sysroot&quot;</div><div><br></div><div>expor=
t CFLAGS=3D&quot; -O2 -g =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yocto=
space/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5=
.0=3D/usr/src/debug/openssl/3.5.0 =C2=A0-ffile-prefix-map=3D/home/sathishku=
mar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/bu=
ild=3D/usr/src/debug/openssl/3.5.0 =C2=A0-ffile-prefix-map=3D/home/sathishk=
umar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/r=
ecipe-sysroot=3D =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/ve=
rdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-nati=
ve=3D =C2=A0-pipe -Wl,-z,gcs-compliant=3Dall &quot;<br></div><div><br></div=
><div>export LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed=
 =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/open=
ssl/3.5.0 =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-ne=
xt/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/ope=
nssl/3.5.0 =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-n=
ext/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D =C2=A0-=
ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work=
/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D =C2=A0-Wl,-z,relro=
,-z,now&quot;<br></div><div><br></div><div>systemd</div><div>=3D=3D=3D=3D=
=3D=3D</div><div><br></div><div>export CC=3D&quot;aarch64-tdx-linux-gcc =C2=
=A0-march=3Darmv8-a+crypto -mbranch-protection=3Dstandard -fstack-protector=
-strong =C2=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/bu=
ild/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot&quot;</div><div>=
<br></div><div>export CFLAGS=3D&quot; -O2 -g =C2=A0-ffile-prefix-map=3D/hom=
e/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/syste=
md/257.5/git=3D/usr/src/debug/systemd/257.5 =C2=A0-ffile-prefix-map=3D/home=
/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/system=
d/257.5/build=3D/usr/src/debug/systemd/257.5 =C2=A0-ffile-prefix-map=3D/hom=
e/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/syste=
md/257.5/recipe-sysroot=3D =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoc=
tospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sy=
sroot-native=3D =C2=A0-pipe --sysroot=3D/home/sathishkumar/yoctospace/verdi=
n-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot&quot;</=
div><div><br></div><div>export LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/=
verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/de=
bug/systemd/257.5 =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/v=
erdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/d=
ebug/systemd/257.5 =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/=
verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D=
 =C2=A0-ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D =C2=A0-Wl,=
-z,relro,-z,now&quot;</div><div><br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; So something issue with gcc-15? or what makes openssl to loose gcs?<br=
>
&gt;<br>
&gt; Regards,<br>
&gt; Sathishkumar D<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#216040): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/216040" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/216040</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11262748=
0/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/112627480/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000a5600e0634779750--

