Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781AFC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:15:17 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.87641.1705338907190829778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iwg7i3v2;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso8983462e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705338905; x=1705943705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EQZlyvs0W1rTTc/aJTjR0i0vTOZu0iRwJRL+mZXLfZ4=;
        b=Iwg7i3v24cgWK1YN3qAAyTcKZ+OKlF121iA9GhlTw00tIDXTfgt/Wj1/Xpaea3WHs8
         7GOj0NwlGr5JbasJYttzwNWUnHeoVOm/lDDjXqlaEqgEeDbapW+rAA6OHKG+WhfwMPGK
         oTIGGqy/cB3lIpvX0ZrX2H0uS4JgwdnBdXsdTudpkUHw9GxTn3Z+QYl5QFNzC8flr5xL
         O2vvfjWVq4+zva0Zf8mnMGGhEOY2sZDbH0O0zPi8/AU+DWBYOLzDw6FONlhQEJQ2Ik0V
         PfchQ7hXnIL0dQ7JBwBzeUQM2z0bpiB4dFNfZcLJcY2gp+y5ypJ3mfNaV1eiHD2GboYP
         k4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705338905; x=1705943705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQZlyvs0W1rTTc/aJTjR0i0vTOZu0iRwJRL+mZXLfZ4=;
        b=JJIsqw1KfZGhMNakoVI8avFlndaqyHRUPAYiI32RA1nfsQK0dq/dsOao/ERqrRybcB
         d0SM0H+xcEQ8KGlET9VvtTvmosxdUB8S8WUa4vsJgblPL7R7c8gJT5MzHQ5j5zT6Bn1n
         zukAQr7cv3T0Im3MRKZODCGP4yY9z5WQv8hcNftQKfqJ0PE5Atp5ADWvChJPgu7bPhK8
         YfT8PR/yvOgh40tx/N1QYNzb31BKB4Uwgf/8k8FWSkyhs408PllkcMPRFeBCGmwd7CGO
         BKOqCYh5gr6AAbYP3i0LXxKVsZDkTfx8MVx48HWtjBh82Y6Vp5ewyFxJZ5BcIX35oEFN
         JRbA==
X-Gm-Message-State: AOJu0Yxyn4iRagewRnH2yycp5Ur+ukvLzpIFxcJ7cDyqKdUYmfO54I5o
	9twh7Fp2YFRXCOygyLMYuAzV+mRffy7IT7ZECgo=
X-Google-Smtp-Source: AGHT+IFnycSjGvS8MGmt89xMKTAaslNlLrXqupPFDR0QcRfODHs/kJk1IJRoFi2Fkjdq9miA2K3f2qxI3F+V6GkfDcU=
X-Received: by 2002:a05:6512:10cb:b0:50e:bc4f:19d3 with SMTP id
 k11-20020a05651210cb00b0050ebc4f19d3mr3940419lfg.25.1705338904947; Mon, 15
 Jan 2024 09:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20240112151403.3810910-1-olani@axis.com> <20240112151403.3810910-2-olani@axis.com>
 <20240115165552bd7f2545@mail.local>
In-Reply-To: <20240115165552bd7f2545@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 18:14:53 +0100
Message-ID: <CANNYZj_w3qXZFRCpgUShCGeMqQe5daGyMkMR7Pc0va2eCrd_Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane.bbclass: Make check_32bit_symbols
 check for file functions too
To: Ola x Nilsson <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193693

I guess the patch needs to be adjusted to suppress the warnings from here?
https://git.yoctoproject.org/poky/tree/meta/conf/distro/include/time64.inc
Any suppressions should come with upstream ticket links.

Better yet, make patches to address the issues. Seems like there's not
a lot of them.

Alex

On Mon, 15 Jan 2024 at 17:55, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> This causes a bunch of warnings on the autobuilders:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8306/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5587/steps/11/logs/warnings
>
> stdio: WARNING: lib32-openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/bin/ssh-keyscan uses 32-bit api 'mkstemp'
> stdio: WARNING: lib32-python3-numpy-1.26.2-r0 do_package_qa: QA Issue: /usr/lib/python3.11/site-packages/numpy/core/_multiarray_umath.cpython-311-i386-linux-gnu.so uses 32-bit api 'fallocate'
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8499/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5675/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/8382/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8363/steps/13/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/7305/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/295/steps/12/logs/warnings
>
> stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/sbin/sshd uses 32-bit api 'mkstemp'
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7404/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/7327/steps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/5743/steps/13/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/7174/steps/13/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2749/steps/21/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/8386/steps/13/logs/warnings
>
> stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/bin/ssh-keyscan uses 32-bit api 'mkstemp'
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/8436/steps/12/logs/warnings
>
> stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/lib/openssh/ptest/regress/unittests/hostkeys/test_hostkeys uses 32-bit api 'mkstemp'
>
>
> On 12/01/2024 16:14:02+0100, Ola x Nilsson wrote:
> > Since _TIME_BITS=64 forces the use of _FILE_OFFSET_BITS=64, also check
> > for functions redirected only based on _FILE_OFFSET_BITS and
> > __USE_FILE_OFFSET64.
> >
> > Signed-off-by: Ola x Nilsson <olani@axis.com>
> > ---
> >  meta/classes-global/insane.bbclass | 31 ++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> > index 69741a6a79..1ff6a319c4 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -598,6 +598,37 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
> >          "fts_set",
> >          # /usr/include/netdb.h
> >          "gai_suspend",
> > +
> > +        # Since _TIME_BITS=64 forces the use of _FILE_OFFSET_BITS=64,
> > +        # also check for functions redirected only based on _FILE_OFFSET_BITS
> > +        # and __USE_FILE_OFFSET64
> > +        # /usr/include/bits/fcntl-linux.h
> > +        "fallocate",
> > +        # /usr/include/bits/resource.h
> > +        "prlimit",
> > +        # /usr/include/sys/statfs.h
> > +        "statfs", "fstatfs", "statvfs", "fstatvfs",
> > +        # /usr/include/sys/sendfile.h
> > +        "sendfile",
> > +        # /usr/include/sys/resource.h
> > +        "getrlimit", "setrlimit",
> > +        # /usr/include/sys/uio.h
> > +        "preadv", "pwritev", "preadv2", "pwritev2",
> > +        # /usr/include/sys/mman.h
> > +        "mmap",
> > +        # /usr/include/stdlib.h
> > +        "mkstemp", "mkstemps", "mkostemp", "mkostemps",
> > +        # /usr/include/stdio.h
> > +        "fopen", "tmpfile", "freopen", "fseeko", "ftello", "fgetpos",
> > +        "fsetpos",
> > +        # /usr/include/dirent.h
> > +        "readdir",
> > +        "readdir_r", "scandir", "scandirat", "alphasort", "getdirentries",
> > +        "versionsort",
> > +        # /usr/include/unistd.h
> > +        "lseek", "pread", "pwrite", "truncate", "ftruncate", "lockf",
> > +        # /usr/include/fcntl.h
> > +        "open", "openat", "creat", "posix_fadvise", "posix_fallocate",
> >      }
> >
> >      ptrn = re.compile(
> > --
> > 2.39.2
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193689): https://lists.openembedded.org/g/openembedded-core/message/193689
> Mute This Topic: https://lists.openembedded.org/mt/103684364/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

