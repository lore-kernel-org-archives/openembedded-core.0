Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B518C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:38:54 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.141.1667925526743173093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HPIIE8bP;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id q83so4368475oib.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TR6fPVwenimRUcTNyRPoEcZ7Hv94sgQGMcikJrlG1Og=;
        b=HPIIE8bP25Je0frRg9OYNm4UfTxMlhJ4COvfhwsRiHzHDdtqSXa2FydQ3DflCQtCqX
         xJQBnYT3ddthATFVyUOVRsFGvS1v3ZGDCqdt6uSbTwVMMzLv6/W0E9wucbJTZdf+8d2k
         xPvFVd8Ioc84LVr+Tu//nB2letsNlvCpVqxY0CAfBi8kbG/71rBL2XeM9JfSgPf5dzbY
         ZxaVZkBLGDh3ZyWtPf/452+UoTQjXZEzi+YU9qbXcZWSq13aqR7KGf/uVMv306tnMFUG
         mnpcRtmqLI8dTGZyGBSLDphJuzD9dzDx4doKrbIeAojoiCenj+ecfFo9GRoy5MfYF/r9
         1lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TR6fPVwenimRUcTNyRPoEcZ7Hv94sgQGMcikJrlG1Og=;
        b=LGr/afGMZMGGuwAH1hEVfuYiFEZrcJYR9AhiuEo5YSJzmkKQR5r14fAIAed5AmLnng
         /jfrJVeHzW9xPhyE6UbSgOc+/r+hwZNvkPC5i4vaFHBKO8zg55SPBATmKUuTPbGtLud8
         2uH937f/2MKp97rcQUAksvtSoyk3FuHsiUd5eDefl+Udbxqw+/1NHRFAka52gxAbkoNE
         69p8NWQWbs8M4TRf7SY/09Ef2V8XyDL3d/j2gR0a6lBgBlmJUJrywV6tJUC9DcoPJWHG
         3W4zg6fisVHvQ3vgnE+HYzBs2vlcqymyWqFgS416My6MO9KGWoXwkoGLDBEgy7pe4Abc
         Cy5w==
X-Gm-Message-State: ACrzQf2GeP3qRZPkk3mC3yN2BinjhNGJLlLaiyFYG/ozuLe1OXXWzF5I
	0Amfq1O9kDwIIoKAAQp9DhTcWjy0x4AXjaA89SM=
X-Google-Smtp-Source: AMsMyM4ct9a29XLf9nB+/8GQud1pjRCKJzmxEtMd2PhN7E/LK7QQZ1AKQPxHKrt4YU9fU12SZiGIFCfQHYVgn3Kowy0=
X-Received: by 2002:a05:6808:20a0:b0:359:e4d6:8bd3 with SMTP id
 s32-20020a05680820a000b00359e4d68bd3mr29811589oiw.262.1667925525521; Tue, 08
 Nov 2022 08:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com> <jwqh6z9soii.fsf@axis.com>
In-Reply-To: <jwqh6z9soii.fsf@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Nov 2022 08:38:19 -0800
Message-ID: <CAMKF1so6OfEoeKSy1E=hWLG=1jRudL72SHQ2=SqY4_oKZT2QVQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] Try to ensure 64 bit time on 32 bit
 glibcful hosts
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: openembedded-core@lists.openembedded.org, 
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172978

On Tue, Nov 8, 2022 at 2:56 AM Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
>
>
> I'm working on the same thing, but I put GLIBC_64BIT_TIME_CPPFLAGS in
> TARGET_CC_ARCH instead to make sure they applied everywhere.
>
> I'd be interested to hear what others think is the best place to put
> these flags.
>
> I'm also looking at QA tests to make sure that no application or shared
> object is still using 32bit time or file functions from glibc.

Perhaps another thing is that it might be good to control it via a
distro feature.

>
> /Ola
>
> On Tue, Nov 08 2022, Niko Mauno via lists.openembedded.org wrote:
>
> > Add default C Preprocessor flags that ensure Y2038 compatible 64 bit
> > time on 32 bit host applications when glibc is used. Prerequisites
> > are glibc version 2.34 or newer and Linux kernel version 5.1 or newer.
> >
> > Example of impact on 32 bit 'qemuarm' machine running
> > core-image-minimal. Before this change:
> >
> >   root@qemuarm:~# /bin/busybox date
> >   Sun Nov  6 06:09:39 UTC 2022
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   2022-11-06 06:09:49.994249+00:00
> >   root@qemuarm:~# /bin/busybox date -s 2040-01-01
> >   date: invalid date '2040-01-01'
> >   root@qemuarm:~# /bin/date.coreutils -s 2040-01-01
> >   Sun Jan  1 00:00:00 UTC 2040
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   1931-03-04 06:26:23.000000+00:00
> >   root@qemuarm:~#
> >
> > After this change:
> >
> >   root@qemuarm:~# /bin/busybox date
> >   Sun Nov  6 06:02:20 UTC 2022
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   2022-11-06 06:02:27.989730+00:00
> >   root@qemuarm:~# /bin/busybox date -s 2040-01-01
> >   Sun Jan  1 00:00:00 UTC 2040
> >   root@qemuarm:~# /sbin/hwclock.util-linux -w
> >   root@qemuarm:~# /sbin/hwclock.util-linux
> >   2040-01-01 00:00:20.992954+00:00
> >   root@qemuarm:~#
> >
> > From here on, the adding of new flags can be disabled on recipe or
> > global level by resetting the value of associated variable containing
> > the CPPFLAGS specific for 64 bit time
> >
> >   GLIBC_64BIT_TIME_CPPFLAGS = ""
> >
> > which can be useful e.g. when working around failure to compile a
> > component due to lack of 64 bit time support on 32 bit build in the
> > component's source code.
> >
> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > ---
> >  meta/conf/distro/include/tclibc-glibc.inc        | 3 +++
> >  meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb | 2 ++
> >  meta/recipes-devtools/pseudo/pseudo_git.bb       | 2 ++
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> > index f48d16939e..95770298e9 100644
> > --- a/meta/conf/distro/include/tclibc-glibc.inc
> > +++ b/meta/conf/distro/include/tclibc-glibc.inc
> > @@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
> >
> >  CXXFLAGS += "-fvisibility-inlines-hidden"
> >
> > +GLIBC_64BIT_TIME_CPPFLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> > +TARGET_CPPFLAGS += "${GLIBC_64BIT_TIME_CPPFLAGS}"
> > +
> >  LIBC_DEPENDENCIES = "\
> >                    glibc \
> >                    glibc-dbg \
> > diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> > index 8bda2ccad6..b3fafa0ea4 100644
> > --- a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> > +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> > @@ -5,3 +5,5 @@ require gcc-sanitizers.inc
> >  # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
> >  ARM_INSTRUCTION_SET:armv4 = "arm"
> >  ARM_INSTRUCTION_SET:armv5 = "arm"
> > +
> > +GLIBC_64BIT_TIME_CPPFLAGS = ""
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > index c34580b4ff..7734d0fbb0 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> > @@ -19,3 +19,5 @@ PV = "1.9.0+git${SRCPV}"
> >
> >  # error: use of undeclared identifier '_STAT_VER'
> >  COMPATIBLE_HOST:libc-musl = 'null'
> > +
> > +GLIBC_64BIT_TIME_CPPFLAGS = ""
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172959): https://lists.openembedded.org/g/openembedded-core/message/172959
> Mute This Topic: https://lists.openembedded.org/mt/94880624/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

