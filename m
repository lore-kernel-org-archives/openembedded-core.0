Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390B1C77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 19:28:07 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.54626.1682796482453711340
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 12:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hrYamS2J;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-541fb831026so420915eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682796482; x=1685388482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTIMerquhcsiX3BJhcPGrOVaLqG14EH8VsL0LrXzriE=;
        b=hrYamS2JjEqbwFFqjZLSbv+kELMfFPitEISB7RlqWgK++3QIBYKC+aGlrQU6i+5t61
         nJ1R/WvB7HPD9EBVhoXBEpZ1UOH6CAbk0bCWEF0cS5rXke3HOFLCFDYXym3TSAcLp5rS
         P3/4gjcP4V665gv1P1F0NxRCpO+bCE8MLXFeBjhBrmaHxzc777/UjUSzLRhHyw0mGKz+
         cmNcWl3yIX0l0Tk4CH6mOtsqv/1VZmo7PR6GkCzRGptHEE0RhjaQ7B8eevIJosx95kxV
         zdoNdh89Qi4p3yiyHVSjltSTIvkWCEWq+wV3i6Ymr173fLwVTd6L+lal+gx2CMx1ylg+
         1lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682796482; x=1685388482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTIMerquhcsiX3BJhcPGrOVaLqG14EH8VsL0LrXzriE=;
        b=G/wZb0USivXJqZFeC64FZGuCpDO/RiLi6/eywiF+65S5Vld4oFZ5v80Hd8/u8ks+aX
         ozXFsTTlO1/W1QUjhI8VJDAFACvbBHzh4XzeBt5xo3O434VCw5T8y4J5lCUZcMZUTZ/d
         UWWcBQWvCtBDehCG2dRqzy8A4A8rooM33AuvNOXnQljP4Ofxx/G7ddVFzVnTiUFa8Ann
         2cGckhRQ3LE18w9bKf6GGMzE9LGck97vZNmAhOgU0ZC045Oy+1GeTEjH/JUKtR7OhU0E
         nTD4z7l7R9ul8P1q6wpVrt1a0PTqgjGXknCqvXspx39d+fdTOARypXE4FC9weGCK7QLm
         bCBA==
X-Gm-Message-State: AC+VfDzE1o4Xy2b+9HlkYIIlMrVBOkj3MrmZnksfxILwcQd6ZB+XQtXU
	YAjYKBuWz4zXgA03ibLVGqbYe+UbcwDFJXx6xYY=
X-Google-Smtp-Source: ACHHUZ4sYd8argNclT7JtfQ4+ukIGIiVD82CcPbIgN0xEC8hfgILgG6zhM/H3YOOGNI7iL+FeeyifmtCjVoFADapMCE=
X-Received: by 2002:aca:3305:0:b0:392:116a:cce7 with SMTP id
 z5-20020aca3305000000b00392116acce7mr1092463oiz.33.1682796480689; Sat, 29 Apr
 2023 12:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com> <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
In-Reply-To: <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Apr 2023 12:27:34 -0700
Message-ID: <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 19:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180559

I am also seing some segfaults in qemu usermode runs

| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0=
/qemuwrapper:
line 2: 1592564 Segmentation fault      (core dumped) PSEUDO_UNLOAD=3D1
qemu-x86_64 -r 5.15 -cpu core2duo -L
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/r=
ecipe-sysroot
-E LD_LIBRARY_PATH=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-mu=
sl/libclc/16.0.1-r0/recipe-sysroot/usr/lib:/mnt/b/yoe/master/build/tmp/work=
/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib
"$@"

this happens when building libclc from meta-clang

I also saw random build failures in qtbase which is perhaps unrelated
but could be this one too

Third issue is https://errors.yoctoproject.org/Errors/Details/701889/

I wonder if uninative version of glibc should be first built with this
change if we really want to pursue it.

Also send a BIG warning to community on breaking this backward
compatibility, for some it might be helpful to get this notification
now than next year.

On Thu, Apr 27, 2023 at 12:54=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 27 Apr 2023 at 09:48, Khem Raj <raj.khem@gmail.com> wrote:
>
> > It will break compatibility with older kernels because we are telling g=
libc that
> > we have 5.15 at minimum so it will assume system calls which are availa=
ble
> > upto and including 5.15 and some of these syscalls may not be
> > available in older kernels
> > by next LTS it might be that 5.15 is commonly used but it still
> > remains a problem for
> > precompiled binaries and libraries etc. sadly
>
> Once again, this affects target kernels only. There are no new
> restrictions on the build host or sdk host kernel versions.
>
> If you are using an older target kernel, set OLDEST_KERNEL to match.
> If you are using precompiled items, I'm not sure what the problem
> would be for them?
>
> Alex

