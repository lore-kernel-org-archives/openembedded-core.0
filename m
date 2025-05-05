Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618ACC3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:33:37 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.48912.1746448415126047700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 05:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TyP3E4lh;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: uvv.mail@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7329792c6eso3619122276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746448414; x=1747053214; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0/f1nz+BMsYS4Hvu8Xz8VudYwm+sGSj48QEb/yXqCOU=;
        b=TyP3E4lhs467MUVd08OI1iiz4dPVVaonwC8jh+m2hf236npUl4b2+0OGTvv37WUyVs
         RFRQ95tfQAVyrJfB+uFWqPMO4wO9TUoQfq5X+a+VbQKBIaaBWyKnE2CpbWEmqNLptKy0
         1dvbnw81ccomc9M3Cns3MXe4A/AgpkzsGytJFV5Mau8Qjem57fwQ/CBWrrZwCUdCSnXv
         B5HDZ1mOl9pFc2M8nG3qRDOUgqHi1j7pRRIuGgnrvzvSy0YVOsGIEMie7Xo+LUieh3b7
         DZ6Y81HO9WkekhlxhqazXgBHBYAnz7/sDLylt3cG44wlEUReuwiFES0y+8p7KxPgtmRB
         TPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448414; x=1747053214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/f1nz+BMsYS4Hvu8Xz8VudYwm+sGSj48QEb/yXqCOU=;
        b=brNWj4mw2P3au4Ajh4C5K9twFoN8lFKHQyLbwjy3WALITbZHq62nyLAQNkaj2GuFDo
         wuyShBgQZz+QOdNyEajxf3Z84tjHRyzMEnGgrLI86XEL2wTrpVOe6yWrcuertn9dVpVA
         3ztKZ1q1weKQldAYFOSoFpX/eSgC+emaNuF2Hm+3GEzoOOCYaq5N6GE7Xf/70AKrHIN9
         hSJISIzgbEYHXqFjOEgcBm3GdZ+DJVlhMyR9sV7EWl68+f3e4HUo7wRWOFDqCVQNj/Iq
         ZFXAIKUkomFvfoLiGuvW7eZVPWUY4I6acET/+KvrTQxvkhhwxXu6eGXhOYO7qJiFOh1i
         DHiQ==
X-Gm-Message-State: AOJu0YwsBL8M8LayhzzWzaVcVVUFJ2SuOoEV/3q1RsGQvrDp3VkWh9hE
	4bYt8jNFOqHFRV9OILssDJ4Pd3ecb03B+Y69ur4krg5tf2UWlHdy//nvdJn8LeJC00zB8G/OS9d
	C1o4JQK3gDNGt0BtxxfWauiAqhRM=
X-Gm-Gg: ASbGncv75UX3cZpZcE9OriWY/Z7ODFsXsXZr7Z/M3MhcVF4pebJLkE9kvAkD6LoulP6
	GAkfYDx8yXGfpgtshjIX+pJucEETYvGH8Elk4Qa1QxLLlrfDDGJn9Q9xHktAIMf8zsUS2ZhUIfD
	ee+4mJi6qq8OlUSvSCdFhqiA==
X-Google-Smtp-Source: AGHT+IGJ8wg2hrPsF3DN+/dAqtuG4EUYDyoblwtsmBhVHuJ78ZTJS8FTi6Xv52KnMr0BDpqrX8ON2PYCgRbGY2AhkDw=
X-Received: by 2002:a05:6902:18d5:b0:e6d:f4c8:7fab with SMTP id
 3f1490d57ef6-e757d34df0bmr8043673276.37.1746448414093; Mon, 05 May 2025
 05:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <aBilFkr4HF-MSBd6@toolbox>
In-Reply-To: <aBilFkr4HF-MSBd6@toolbox>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Mon, 5 May 2025 14:33:22 +0200
X-Gm-Features: ATxdqUGEnw7T3uMR6bcC2UX6-rnlvaO6YPeWCk34jL8YMNgCs6XmO-pqpX32yWQ
Message-ID: <CAKHfEahGyPFdLcB0LZqxaBpuKKWGWzhmxFHY8V+8Bv+7EdN4ng@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: max.oss.09@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000573a1d063462b546"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 12:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216009

--000000000000573a1d063462b546
Content-Type: text/plain; charset="UTF-8"

Did you ask this in the systemd issue tracker as well?

Slava

On Mon, May 5, 2025, 13:46 Max Krummenacher via lists.openembedded.org
<max.oss.09=gmail.com@lists.openembedded.org> wrote:

> Hello
>
> I'm seeing a strange warning resulting in a failed build when building
> systemd with tpm2 in DISTRO_FEATURES.
>
> GCS seems to be a new feature supported with GCC 15 and friends
> targeting the AARCH64 architecture. Whatever it does ;-).
>
> Ways to reproduce:
>
> Add the needed layers for tpm2, add tpm2 to distro features and build
> systemd.
> E.g.
> bblayers.conf additions:
>
>   ${TOPDIR}/../meta-security/meta-tpm \
>   ${TOPDIR}/../meta-openembedded/meta-oe \
>   ${TOPDIR}/../meta-openembedded/meta-python \
>
> local.conf additions:
>
> DISTRO_FEATURES:append = " tpm2"
> INIT_MANAGER = "systemd"
>
> MACHINE=qemuarm64 bitbake systemd
>
> Results in:
>
> | FAILED: src/shared/libsystemd-shared-257.so
> | aarch64-poky-linux-gcc -mcpu=cortex-a57+crc -mbranch-protection=standard
> -fstack-protector-strong
>   -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
> -Werror=format-security --sysroot=...systemd/257.5/recipe-sysroot
>   -o src/shared/libsystemd-shared-257.so -Wl,--as-needed
> -Wl,--no-undefined -shared -fPIC
>   -Wl,-soname,libsystemd-shared-257.so -Wl,--whole-archive
> -Wl,--start-group src/shared/libsystemd-shared-257.a
>   src/basic/libbasic.a src/libsystemd/libsystemd_static.a
> -Wl,--no-whole-archive -fstack-protector
>   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -ffile-prefix-map=...systemd/257.5/git=/usr/src/debug/systemd/257.5
>   -ffile-prefix-map...systemd/257.5/build=/usr/src/debug/systemd/257.5
> -ffile-prefix-map=...systemd/257.5/recipe-sysroot=
>   -ffile-prefix-map=...systemd/257.5/recipe-sysroot-native=
> -Wl,-z,relro,-z,now -shared
>   -Wl,--version-script=...systemd/257.5/git/src/shared/libshared.sym
> -pthread ...systemd/257.5/recipe-sysroot/usr/lib/libacl.so
>   ...systemd/257.5/recipe-sysroot/usr/lib/libblkid.so
> ...systemd/257.5/recipe-sysroot/usr/lib/libcap.so
>   ...systemd/257.5/recipe-sysroot/usr/lib/libcrypt.so -ldl
> ...systemd/257.5/recipe-sysroot/usr/lib/libmount.so
>   ...systemd/257.5/recipe-sysroot/usr/lib/libssl.so
> ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so -lrt
>   ...systemd/257.5/recipe-sysroot/usr/lib/libseccomp.so
> -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
>   -Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro
> -Wl,--warn-common -Wl,--gc-sections -lm
>   -Wl,--end-group -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro
> -Wl,--warn-common -Wl,--gc-sections
>   -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
> -Wl,--gc-sections
> | ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so: warning: GCS is
> required by -z gcs,
>   but this shared library lacks the necessary property note. The dynamic
> loader might not enable GCS
>   or refuse to load the program unless all the shared library dependencies
> have the GCS marking.
> | collect2: error: ld returned 1 exit status
>
>
> I already found that adding to the systemd recipe
>
> 'CFLAGS:append = " -Wl,-z,gcs-report-dynamic=none"'
>
> prevents the build error. However I'm not sure if that would be a good
> way forward and if there are other recipes / configurations which would
> result in similar build errors.
>
> Any comments? Thanks.
>
> Regards
> Max
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216006):
> https://lists.openembedded.org/g/openembedded-core/message/216006
> Mute This Topic: https://lists.openembedded.org/mt/112627480/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000573a1d063462b546
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div>Did you ask this in the systemd issue tracker a=
s well?</div><div><br></div><div data-smartmail=3D"gmail_signature">Slava</=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, May 5, 2025, 13:46 Max Krummenacher via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;max.oss.0=
9=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello<=
br>
<br>
I&#39;m seeing a strange warning resulting in a failed build when building<=
br>
systemd with tpm2 in DISTRO_FEATURES.<br>
<br>
GCS seems to be a new feature supported with GCC 15 and friends<br>
targeting the AARCH64 architecture. Whatever it does ;-).<br>
<br>
Ways to reproduce:<br>
<br>
Add the needed layers for tpm2, add tpm2 to distro features and build<br>
systemd.<br>
E.g. <br>
bblayers.conf additions:<br>
<br>
=C2=A0 ${TOPDIR}/../meta-security/meta-tpm \<br>
=C2=A0 ${TOPDIR}/../meta-openembedded/meta-oe \<br>
=C2=A0 ${TOPDIR}/../meta-openembedded/meta-python \<br>
<br>
local.conf additions:<br>
<br>
DISTRO_FEATURES:append =3D &quot; tpm2&quot;<br>
INIT_MANAGER =3D &quot;systemd&quot;<br>
<br>
MACHINE=3Dqemuarm64 bitbake systemd<br>
<br>
Results in:<br>
<br>
| FAILED: src/shared/libsystemd-shared-257.so<br>
| aarch64-poky-linux-gcc -mcpu=3Dcortex-a57+crc -mbranch-protection=3Dstand=
ard -fstack-protector-strong<br>
=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dforma=
t-security --sysroot=3D...systemd/257.5/recipe-sysroot<br>
=C2=A0 -o src/shared/libsystemd-shared-257.so -Wl,--as-needed -Wl,--no-unde=
fined -shared -fPIC<br>
=C2=A0 -Wl,-soname,libsystemd-shared-257.so -Wl,--whole-archive -Wl,--start=
-group src/shared/libsystemd-shared-257.a<br>
=C2=A0 src/basic/libbasic.a src/libsystemd/libsystemd_static.a -Wl,--no-who=
le-archive -fstack-protector<br>
=C2=A0 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -ffile-prefix-map=3D.=
..systemd/257.5/git=3D/usr/src/debug/systemd/257.5<br>
=C2=A0 -ffile-prefix-map...systemd/257.5/build=3D/usr/src/debug/systemd/257=
.5 -ffile-prefix-map=3D...systemd/257.5/recipe-sysroot=3D<br>
=C2=A0 -ffile-prefix-map=3D...systemd/257.5/recipe-sysroot-native=3D -Wl,-z=
,relro,-z,now -shared<br>
=C2=A0 -Wl,--version-script=3D...systemd/257.5/git/src/shared/libshared.sym=
 -pthread ...systemd/257.5/recipe-sysroot/usr/lib/libacl.so<br>
=C2=A0 ...systemd/257.5/recipe-sysroot/usr/lib/libblkid.so ...systemd/257.5=
/recipe-sysroot/usr/lib/libcap.so<br>
=C2=A0 ...systemd/257.5/recipe-sysroot/usr/lib/libcrypt.so -ldl ...systemd/=
257.5/recipe-sysroot/usr/lib/libmount.so<br>
=C2=A0 ...systemd/257.5/recipe-sysroot/usr/lib/libssl.so ...systemd/257.5/r=
ecipe-sysroot/usr/lib/libcrypto.so -lrt<br>
=C2=A0 ...systemd/257.5/recipe-sysroot/usr/lib/libseccomp.so -Wl,--fatal-wa=
rnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common<br>
=C2=A0 -Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,-=
-warn-common -Wl,--gc-sections -lm<br>
=C2=A0 -Wl,--end-group -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--w=
arn-common -Wl,--gc-sections<br>
=C2=A0 -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,-=
-gc-sections<br>
| ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so: warning: GCS is req=
uired by -z gcs,<br>
=C2=A0 but this shared library lacks the necessary property note. The dynam=
ic loader might not enable GCS<br>
=C2=A0 or refuse to load the program unless all the shared library dependen=
cies have the GCS marking.<br>
| collect2: error: ld returned 1 exit status<br>
<br>
<br>
I already found that adding to the systemd recipe<br>
<br>
&#39;CFLAGS:append =3D &quot; -Wl,-z,gcs-report-dynamic=3Dnone&quot;&#39;<b=
r>
<br>
prevents the build error. However I&#39;m not sure if that would be a good<=
br>
way forward and if there are other recipes / configurations which would<br>
result in similar build errors.<br>
<br>
Any comments? Thanks.<br>
<br>
Regards<br>
Max<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216006): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216006" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/216006</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112627480/445=
5192" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/112627480/4455192</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:uvv.mail@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000573a1d063462b546--

