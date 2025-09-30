Return-Path: <william@wkennington.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EA3CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 00:19:56 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.13545.1759191592806156273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 17:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wkennington-com.20230601.gappssmtp.com header.s=20230601 header.b=WEqSTOSa;
 spf=none, err=permanent DNS error (domain: wkennington.com, ip: 209.85.210.178, mailfrom: william@wkennington.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2220043b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 17:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1759191592; x=1759796392; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIr4Ish3+hd5ix24zmdlloTCLM3PZ+JDUV4P7rrAcaY=;
        b=WEqSTOSa7430ysgxdN9+ckTDoksCajGb8VhJf8TtrKokk68llq8P08TL3bT52DNgp9
         0kG9VI+H2G+dRB0FGa3Sko4NHqYekA61/p4bZCXU+4NY9lTYuZra1XTJSV6Jbb5rLC0t
         XhnrTIOtFKv5VaurBGKcqM1Wy38vvPd+F/TSigiSrvMGbr5LJQUFUi3GD0Lpjx3483dW
         PJAakF/00UeuJ51fSHPsfaQZtSXh1oiRJEmUtoli/ZP0HoHXFlB75LIlnkkWGWAftqEj
         QC9wPQUN7QU4HX1hSDtpm0yqsMLpbbuE4/wngLhe/OahrHHkOwacs+9RQrYPeWH0XZpP
         mw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759191592; x=1759796392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIr4Ish3+hd5ix24zmdlloTCLM3PZ+JDUV4P7rrAcaY=;
        b=Q8LkQxcb8dNJY2WJAm6M1TH2EOv0xKboxz+wnS4HiFtV4OJ9/EAufxOVTXNris6FOz
         Gh/iZ2OQQmhyBrwGR8nU/aL6XKg9yTSgAa0Cf9z+iuB5vHMP4Gpc9vJDHEPVWRNU1RwR
         rS7wVO67Vrh5aVNqqnCFvFlbBaojcB04riWU+5X9gsKRH0f18v/4kfM63a1XB6zgpW3b
         3rswR9wwaROTu1v3rYNBEQ7mIAf6ySxcCG2u/zkdj1fClzHH+R2yK3JDUBcrnJ+5moCy
         BGgjBwwpXVe7U1IL/YF2ixqqUaQmWtnGjve198yQNkPVMCifjibxDMdYGrGWTtkVZp+k
         8xAA==
X-Gm-Message-State: AOJu0YwnXkW9TRajWi+xnygMjJnlVzLoA3Ndi5TjTOGgWU++XtLzivhh
	3w3I6ejtdy5Q34pF8YHjhRiTHFkSg2MaXBdqHykcj0QZR0DPsWaOD1MXhi4UdfKyG7ZSH3bDOEF
	JnRbECzCOneijX3/sk7mygMj2q01Qg95Ek3i27XpL/w==
X-Gm-Gg: ASbGncsq/xlcZew9pn35Wi5X2Nyg0BfhEnTFtaqt0/6Z87f4jR/R7koC5gHlPLduaSS
	QftrsOdgYtKyAL3rxNJyz6vzIdGBGKo8A91nEMviyNSeiJhLU1i/8PmbEhOZg6TamSGg+ELyWTQ
	SAvrdB6165fJs6p5VeFZwNPWTxh/ro9R3t6vFU12UUi+Z2dWA4Q1mfuHjUUskKvZ5HOZhdxpJNE
	dgEoNJ7GN7EG5VsGN+JIvQp2GmUDXJqsDdhgiGaMA==
X-Google-Smtp-Source: AGHT+IH1yshacdAt1sUjJQGBAEFKXG1nSDUqC6bKh37XDoWpz1/eBsO0WIbdAEYadUyaobGz6kc2BnhXqFEv90JeFr0=
X-Received: by 2002:a17:90b:1c87:b0:335:2823:3689 with SMTP id
 98e67ed59e1d1-33528233881mr15946709a91.4.1759191591642; Mon, 29 Sep 2025
 17:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
 <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com>
In-Reply-To: <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com>
From: William Kennington <william@wkennington.com>
Date: Mon, 29 Sep 2025 17:19:40 -0700
X-Gm-Features: AS18NWCjwHJy3mgKdTUN69MJnVvfj2qGdrXDdxRq1LbDYlFY3i69VGhgj7fV1p8
Message-ID: <CAD_4BXiRTKx5HPNqmroz1fO3T8ggmQUVXa+=HJT=saLtg5PJzw@mail.gmail.com>
Subject: Re: [OE-core] Distro wide LTO broken?
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 00:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224171

On Mon, Sep 29, 2025 at 11:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kennington via
> lists.openembedded.org
> <william=3Dwkennington.com@lists.openembedded.org> wrote:
> >
> > If I add the following to my distro, the build breaks for the openssl
> > and other core packages due to having build path impurities in the
> > static libraries created.
> >
> > ```
> > require conf/distro/include/lto.inc
> > DISTRO_FEATURES +=3D "lto"
> > ```
> >
> > The errors I get are all like
> > ```
> > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > /usr/lib/libssl.a in package openssl-staticdev contains reference to
> > TMPDIR [buildpaths]
> > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > /usr/lib/libcrypto.a in package openssl-staticdev contains reference
> > to TMPDIR [buildpaths]
> > ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
> > ERROR: Logfile of failure stored in:
> > /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/=
openssl/3.5.2/temp/log.do_package_qa.118335
> > ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/openssl_=
3.5.2.bb:do_package_qa)
> > failed with exit code '1'
> > ```
> >
> > Probably there is just some kind of flag missing in the LTO build
> > options to filter out the build directory, as -ffile-prefix-map and
> > whatnot are already present in the builds. I haven't yet figured out
> > exactly what is contributing to this impurity.
> >
>
> Inspect the .a files ( maybe using strings or binary viewing tools
> like xxd ), with LTO they are flat objects with additional information
> for
> LTO to work and I think it will give more information.

Yeah, I believe it's just a single remapping we are missing somewhere
that is allowing the extra string to be added into the binary. It's
been a while since I've worked on this kind of impurity stripping, so
it will probably take a bit to get used to the tooling again.
Hopefully I find the root cause and we can strip it out

An example invocation looks like the following. All other object files
I looked at share the same impurity which ends up in the static
library later
```
aarch64-oe-linux-gcc  -mcpu=3Dcortex-a76.cortex-a55+crypto
-mbranch-protection=3Dstandard -fstack-protector-strong  -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-o=
e-linux/openssl/3.5.2/recipe-sysroot
 -I. -Iinclude -Iapps/include -I../sources/openssl-3.5.2
-I../sources/openssl-3.5.2/include
-I../sources/openssl-3.5.2/apps/include  -fPIC -pthread
-Wa,--noexecstack -O2 -g -flto -ffat-lto-objects -fuse-linker-plugin
-ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-=
crypto-oe-linux/openssl/3.5.2/s
ources/openssl-3.5.2=3D/usr/src/debug/openssl/3.5.2
-ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-
crypto-oe-linux/openssl/3.5.2/build=3D/usr/src/debug/openssl/3.5.2
-ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-=
crypto-oe-linux/openssl/3.5.2/recipe-sysroot=3D
 -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55=
-crypto-oe-linux/openssl/3.5.2/recipe-sysroot-native=3D
 -pipe -DOPENSSL_USE_NODELETE -DOPENSSL_PIC
-DOPENSSLDIR=3D"\"/usr/lib/ssl-3\""
-DENGINESDIR=3D"\"/usr/lib/engines-3\""
-DMODULESDIR=3D"\"/usr/lib/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL
-DNDEBUG  -MMD -MF apps/lib/libapps-lib-app_x509.d.tmp -c -o
apps/lib/libapps-lib-app_x509.o ../sources/openssl-3.5.2/apps/l
ib/app_x509.c
```
and the partial strings dump with the impurity looks like
```
vtmp
unsigned int
/usr/src/debug/openssl/3.5.2
../sources/openssl-3.5.2/apps/lib/app_x509.c
/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/open=
ssl/3.5.2/build
include/openssl
/usr/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/15.2.0/include
../sources/openssl-3.5.2/include/openssl
/usr/include
../sources/openssl-3.5.2/apps/lib
../sources/openssl-3.5.2/apps/include
app_x509.c
```
>
> > Prior to rebasing on the latest master, LTO was working fine globally.
>
> what is the delta we are talking about here ?

Sadly this was long ago `25d60ac6f61cc186b4c5a961554bee583736fd17`
from early 2024. Doing any kind of bisection is probably pointless so
I just need to figure out this new impurity (or maybe just the check
got added since then)

>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#224137): https://lists.openembedded.org/g/openembed=
ded-core/message/224137
> > Mute This Topic: https://lists.openembedded.org/mt/115492623/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

