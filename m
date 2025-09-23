Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A40BCAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:47:11 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.1103.1758642422340582591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M4acPG3w;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7960d69f14bso31377226d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758642421; x=1759247221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcTtJ/O35U9aPzH0qkwELyqodEiHmuOFi+ZDXsQP8wM=;
        b=M4acPG3wOMlu/0kbzVXkOOz6lmIXhy0Ry619nYuF3MsV9bdT9oKzfwxY000eNqoCO3
         GW2AN2eJbT8i88qud4pYiW6nusNsSX3qZACSMNzi222j9upxIS05nYT9PZBnz43mX1JJ
         BXwSCLQ6grNAQmsAqIxzS5Q9FJSYwC33XiRPMMUIhuGUIcLiLsK3qcz05Eo2NKxwrh1J
         07KFQyjTt5uzZ2jBxBu26RCT/nPpWduRNy2qlkzgYrHywUlzAXG34Y0pttE4i2Vy+6Yi
         9/dfb4AVGa3aZpcoLt7U7hbwI85i/LEPXYKvqxwjBchL68zVl/Fc5l8KyWsShiVG9EFI
         D9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758642421; x=1759247221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcTtJ/O35U9aPzH0qkwELyqodEiHmuOFi+ZDXsQP8wM=;
        b=Jnj5AuV6MmRTjteyAr7hJXYTULgHDmKrjH7qLieVTwG/ZNKdnKUNZ5ebNXXkh2Jxc7
         a6h1Pww8TagxgUHZVaFRYTeP60gtL0aJFrq0JdmCQcjPWd0Z1couoNkngVvNZVlpFwSo
         poKvJJ61W6J9d1sD8nbzhSdm5Ir+Hqiwb1fNMm0JaPsZoguGJ953JbdwNxNEQEWgLg4U
         0XcSInj8iUmMAEdMZEawfu2KAwgEUMoCUiZoltDqsYh6mbEfQwTka1WOVjcNT+uvLQQP
         S26wyNwNxEO/7sl0JRdysCwVnXd2BIhwPOXErJg1LrFKC/cPH7O9881sp8V0rPrNy364
         KEvA==
X-Gm-Message-State: AOJu0YxopX1vFMHeMYsxum+3ZLEAwLp7syJFLtSmTIVUyita9ccQPWFg
	yRSZkSZ43d05A/0yOtKuPEn+Heg+lwZvZdE55NUxQF2/qQUHojdxUIQuyzACUoells0wrV9LDKD
	8JmM1TPzxi9EoMUqyqDs9YnEtcgLO1Cw=
X-Gm-Gg: ASbGncsLILaXXO/4CHEqw/z8NTYjo+sWx+KtGMvBlK6IquLjp8BED8wjGC3aEmLymxh
	I7XpLxflROj45Y11pscwC9LkCgbLgdtsuz8Bg0qH12TOoXwB6DY1+ey+aJxCANtGIGSOWxMzo+W
	XTIutapkkxOYoKqgzbm+1xCchGO80RtrJIoeo0q6Dtx6kkx1qTYE7vto/JSL31sMJ89psH+7+zt
	2n5S85+a0twt3subEZSyyojGBIsIAGu2pDEW4y1JBzHswduia9+GPzRgVMmNXzl/Jink31Gl+vp
	5bvuquKF1LDPq9zwFgVP79oVfTgf53l5VNTVTWc7
X-Google-Smtp-Source: AGHT+IFyavWD28sxFd0Ko0m4nPcCDiJdLCpTEwRB4qx1kFteN2W2WTLJhxtGYVcpH5BMIFR+VSZWSQFTqyvRqi683JU=
X-Received: by 2002:a05:6214:29e1:b0:7b4:4dea:2a9f with SMTP id
 6a1803df08f44-7e6fe4d7097mr38466766d6.25.1758642421152; Tue, 23 Sep 2025
 08:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
 <CANNYZj_AfcRqE0sOpkfOizCVwPHq2OPbhTgVxTMomvDeHsr5ig@mail.gmail.com> <86472a10-6e12-47ed-83e5-e0842ece9849@collabora.co.uk>
In-Reply-To: <86472a10-6e12-47ed-83e5-e0842ece9849@collabora.co.uk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Sep 2025 17:46:50 +0200
X-Gm-Features: AS18NWCDc4WVnd-fAa8S1Li471VyqePQeDFBxS3XmjKhuF9fSDmxWqMmHpJG_Uo
Message-ID: <CANNYZj-9bhX_v4ts=-xDpzBaGKZXDmuosNQW8DTDL_gCaT_nNQ@mail.gmail.com>
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
To: Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223900

On Tue, 23 Sept 2025 at 15:43, Andrej Shadura
<andrew.shadura@collabora.co.uk> wrote:
> Thanks, but this doesn=E2=80=99t seem to help:
>
> > cc -fno-strict-aliasing -g -O2 -Werror=3Dimplicit-function-declaration =
-ffile-prefix-map=3D/tmp/pseudo=3D. -fstack-protector-strong -fstack-clash-=
protection -Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=
=3D2 -Wl,-z,relro -pipe -std=3Dgnu99 -Wall -W -Wextra -Wno-deprecated-decla=
rations -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE  -DPSEUDO_PREFIX=3D'"/=
usr"' -DPSEUDO_SUFFIX=3D'""' -DPSEUDO_BINDIR=3D'"bin"' -DPSEUDO_LIBDIR=3D'"=
lib/arm-linux-gnueabihf/pseudo"' -DPSEUDO_LOCALSTATEDIR=3D'"var/pseudo"' -D=
PSEUDO_VERSION=3D'"1.9.2"' -DUSE_MEMORY_DB  -DPSEUDO_PASSWD_FALLBACK=3D'""'=
   -DPSEUDO_XATTR_SUPPORT        -O2 -g  -D_GNU_SOURCE -c -o pseudo_wrapper=
s.o pseudo_wrappers.c
> > {standard input}: Assembler messages:
> > {standard input}:27890: Error: symbol `open64' is already defined
> > {standard input}:29137: Error: symbol `openat64' is already defined
> > {standard input}:40611: Error: symbol `__openat64_2' is already defined
> > {standard input}:52324: Error: symbol `creat64' is already defined
> > {standard input}:62317: Error: symbol `__fcntl_time64' is already defin=
ed
> > {standard input}:65383: Error: symbol `fopen64' is already defined
> > {standard input}:67189: Error: symbol `freopen64' is already defined
> > {standard input}:68434: Error: symbol `__fstat64_time64' is already def=
ined
> > {standard input}:69773: Error: symbol `__fstatat64_time64' is already d=
efined
> > {standard input}:72313: Error: symbol `__ftw64_time64' is already defin=
ed
> > {standard input}:80574: Error: symbol `__glob64_time64' is already defi=
ned
> > {standard input}:87427: Error: symbol `__lstat64_time64' is already def=
ined
> > {standard input}:96082: Error: symbol `mkostemp64' is already defined
> > {standard input}:97837: Error: symbol `mkstemp64' is already defined
> > {standard input}:100838: Error: symbol `__nftw64_time64' is already def=
ined
> > {standard input}:107235: Error: symbol `scandir64' is already defined
> > {standard input}:126141: Error: symbol `__stat64_time64' is already def=
ined
> > {standard input}:127725: Error: symbol `statvfs64' is already defined
> > {standard input}:134601: Error: symbol `truncate64' is already defined
> > make[1]: *** [Makefile:159: pseudo_wrappers.o] Error 1

Here's the command line I'm seeing in a successful 32 bit arm build in Yoct=
o:

arm-poky-linux-gnueabi-gcc  -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard
-mcpu=3Dcortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
-Wformat -Wformat-security -Werror=3Dformat-security
--sysroot=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cortexa15t2hf=
-neon-poky-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot
-fno-strict-aliasing  -O2 -g
-ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/corte=
xa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/sources/pseudo-1.9.2+git=
=3D/usr/src/debug/pseudo/1.9.2+git
 -ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cort=
exa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/sources/pseudo-1.9.2+git=
=3D/usr/src/debug/pseudo/1.9.2+git
 -ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cort=
exa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot=3D
 -ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cort=
exa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot-native=3D
 -pipe -pipe -std=3Dgnu99 -Wall -W -Wextra -Wno-deprecated-declarations
-fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -O2 -g
-ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/corte=
xa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/sources/pseudo-1.9.2+git=
=3D/usr/src/debug/pseudo/1.9.2+git
 -ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cort=
exa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/sources/pseudo-1.9.2+git=
=3D/usr/src/debug/pseudo/1.9.2+git
 -ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cort=
exa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot=3D
 -ffile-prefix-map=3D/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cort=
exa15t2hf-neon-poky-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot-native=3D
 -pipe -DPSEUDO_PREFIX=3D'"/usr"' -DPSEUDO_SUFFIX=3D'""'
-DPSEUDO_BINDIR=3D'"bin"' -DPSEUDO_LIBDIR=3D'"lib/pseudo/lib"'
-DPSEUDO_LOCALSTATEDIR=3D'"var/pseudo"' -DPSEUDO_VERSION=3D'"1.9.2"'
-DUSE_MEMORY_DB -DPSEUDO_FORCE_ASYNC -DPSEUDO_PASSWD_FALLBACK=3D'NULL'
-DPSEUDO_XATTR_SUPPORT       -DPSEUDO_EPOLL -O2 -g
-L/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cortexa15t2hf-neon-poky=
-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot/usr/lib
-I/srv/storage/alex/yocto/build-arm-32-alt/tmp/work/cortexa15t2hf-neon-poky=
-linux-gnueabi/pseudo/1.9.2+git/recipe-sysroot/usr/include
 -D_GNU_SOURCE -c -o pseudo_wrappers.o pseudo_wrappers.c

So I'm not sure what the difference is. Can you share the full log, or
a tarball of the source/build directory?

Alex

