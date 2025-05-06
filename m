Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DDBC3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:32:15 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.75863.1746538334025364533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 06:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUut732Y;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6064d4c14ebso1320863eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538333; x=1747143133; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qKcOVwU9FQIGwrKpDGkNwdQZ3vMZsrxby/cI2rl9MeU=;
        b=lUut732Yj41qjpMC4prFCm27k8avjx7pxZKc9R3SPXcL3eC0kYY/9MCRgosDxju61Q
         rH3Uifv6cwtpTV7oTjJqQKRGX3TdeOeB2jFNQmatxHwdnPmVlfyK7oaaZA9WX9S5nXe5
         rxuizG+8PUXc/FwuamolTdxp+YWgPdvkqFr/3YNdjMLDRXqmO1lIlLAFTwD8T27/4sc1
         erPFPW46W4Kk9Sz7SeqI66p5l6UqjsWUEWYIHpYh1uLy4I+5AqjzqEhxZKBgx0f5qv6O
         5RxQET6iDPUr60TvUKxu8voF/+g8Bi6czTIRN9oU2yEqpTQGzXzX6ZyXyP3V9HAa2yX0
         VxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538333; x=1747143133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKcOVwU9FQIGwrKpDGkNwdQZ3vMZsrxby/cI2rl9MeU=;
        b=Q/4NUp8uWQkeQ2UzAmM7AdWuh5u9IEkbNFV0lYWr6gxtxFyAoIqKQVDGjYzwowrrRt
         N2Q3TXtTbVhay26Eg0esNPlumdqptD4WX4P8CHk/lavj6udpeOjw5XdZo9Pw2sHVYDoA
         yZjeYOZdi9aroraApd4ijorwAStpcbTnSI/b0GU1NQDmL1hU/TRuJZhzBqxmxqSHMPlg
         4Ulo+JRhlzTsXvU466sNmiZmgxa38CyzgYKDBiQxqDMUnioQSIVFN0IfS8wnnlQZGNG4
         3NEnivkRrVMdchlt8wQrttB8djXym31FlzjTOmiCcKr9lW9trRRYCmrzcYnBKFYOVBK6
         nzrQ==
X-Gm-Message-State: AOJu0Yya9fFXuOQ/yfdXuRxTKSZwOAhQAvXdgAdQUbmIrq1LYEvzDjCA
	OSh1w/I/v4nZMGm63aK0oqCCybd0465YO1ZsClyeOxBKsxGROpLukM8POiQzbwdY0bPbRVWrspR
	qrp3keDO51BS4dzf6vnPAlZUxGxU=
X-Gm-Gg: ASbGncsR7soJw7t3bBJ7hUJWFt/2+3WB7grEtYFRwHfDiJjUEOmi33D7K4h06uhJlCC
	W/GlAuwEwfcgEEOXL0Vvk2F4Wb56pqltMoF5Lv89G3submVyR15IYKfKOJOsqQcBGXwfWbAMDud
	VPN5E2rDOSJXX9AFtgnYqYoMReImBKP/YBx2/G20xGmMUNlsUdgEl7vZZFSQEK8DzR
X-Google-Smtp-Source: AGHT+IHGof0NuIweirEHlPVU6X+X6wO6sxk0F2rlqx1QjGVKHpM4buGrOP6fdL5wyAavdX4Xs7fA2lwLDZ7u7uYkP3g=
X-Received: by 2002:a05:6820:1890:b0:606:44f0:a963 with SMTP id
 006d021491bc7-6080022c208mr6728674eaf.1.1746538333226; Tue, 06 May 2025
 06:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
In-Reply-To: <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 06:32:02 -0700
X-Gm-Features: ATxdqUFOCOap39wAt3dbo00jkhOJRhEwgCJ388NXknkGuIe3PPNJepP1YUUtReU
Message-ID: <CAMKF1spwEwgVaa5AM05drEsv3JGNVS4=g30JkHZpYFHBmdzhNQ@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f05074063477a44b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216048

--000000000000f05074063477a44b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar Duraisamy <
sathishkumar.d.cbe@gmail.com> wrote:

> Hi
>
> On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
>> lists.openembedded.org
>> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > Hi all,
>> >
>> > I am also facing the same build issue. I tried to understand the issue=
.
>> From build system for both openssl and systemd,
>> -mbranch-protection=3Dstandard   enabled. In fact the support this flag =
added
>> long back,
>> https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce=
809cc5ecd9672f5e86bf8a579
>> and tpm2 introduces additional dependencies for systemd as in commit
>> https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/=
systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f
>> .
>> >
>>
>> is this flag passed to linker as well ?
>>
>> Openssl:
> =3D=3D=3D=3D=3D=3D=3D
>
> export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
>
> export CFLAGS=3D" -O2 -g
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/=
3.5.0
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
>  -pipe -Wl,-z,gcs-compliant=3Dall "
>
> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/=
3.5.0
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
>  -Wl,-z,relro,-z,now"
>
> systemd
> =3D=3D=3D=3D=3D=3D
>
> export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/systemd/257.5/recipe-sysroot"
>
> export CFLAGS=3D" -O2 -g
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
>  -pipe
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/systemd/257.5/recipe-sysroot"
>
> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
>  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/=
work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
>  -Wl,-z,relro,-z,now"
>

Please post exact linker command line to build libcrypto.so as well


>
>
>
>> > So something issue with gcc-15? or what makes openssl to loose gcs?
>> >
>> > Regards,
>> > Sathishkumar D
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#216040):
>> https://lists.openembedded.org/g/openembedded-core/message/216040
>> > Mute This Topic: https://lists.openembedded.org/mt/112627480/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>> raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--000000000000f05074063477a44b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, May 6, 2025 at 6:28=E2=80=AFAM =
Sathishkumar Duraisamy &lt;<a href=3D"mailto:sathishkumar.d.cbe@gmail.com">=
sathishkumar.d.cbe@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via<br>
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
-z,relro,-z,now&quot;</div></div></div><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div></div></div></div></blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Please post exact linker command line to build libcrypto.so =
as well=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div><br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--000000000000f05074063477a44b--

