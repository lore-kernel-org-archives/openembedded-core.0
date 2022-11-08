Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2301BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:30:57 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web12.4062.1667878254569964628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nQ0wrBZx;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13b23e29e36so14952619fac.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKWHr73W/6hvKD+zwQpwe9e5Y4B85M/jiQmlMhSjd6w=;
        b=nQ0wrBZxk7iQK28UAMZ8x8Msx2cig+Zu621e9pfNxCpT7G8HttX/fZ6daBLXL0n5KI
         jf969x+Hte1m/uSFSdqz2eCV0lGt3Nte8kHk2QNd0lfEZoHe/YJoPHISLitiXNLlbMTg
         B+4vW27yDcW+UNPbamOOly69xZd4QNU2BkbbCTiWmlrGEdQP9RlBN+6JENDLgnPtddq2
         zFBgl4VeThz7TZpRpqPWpWnEhMEMJPmKQsjeAhyKsYHYeH6UnBZT6dyT9q9HlW7qKna/
         wmtKSc4OF0QX2ZhvJ+/yYK2x4Ef9oJsrPLt8AIGM1HY6TCoKYu/sUyaF9yFnTKozM8Qd
         Js4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKWHr73W/6hvKD+zwQpwe9e5Y4B85M/jiQmlMhSjd6w=;
        b=YiqAia/WA8GUNBi9mxJTgm2ZsEL+QFCLh5JaPnZyXUMGu0632Muv7/NbrA/m0FucUB
         QcwVTa0R3Z5Vtz+rXQcu5q1GoKUcBw4fwWmhUKzL5hkRiyw4yRKHesVutzlaG++pSk+/
         8JFPtohV+aHXnX+YFgxjJ+A8Mfy6bY8Wrp7aOIq7PGxjO38N/IvFa1kxvUc0xBlB7fJh
         ZDejHcDkD+DBRRsSeDTaz80nnlX0UfVY7HRNLuD0CC0DPE5fXRYUC90M3n0dINpyppbK
         j4EaceX7GT5i7xdbViqwDJg0DftH+0//Rayfl/1tn9j8i4r0rwtXFGAIDjeYrKKUllkm
         d1Eg==
X-Gm-Message-State: ACrzQf2v3p8x0HedNnxunZJfFMEnYaqZZDrnUdrdPMmIJIeVGTMx4BTk
	xgsQCcxJck9VKm7AWmzz1bXOPinPgsYuqKhrbiI=
X-Google-Smtp-Source: AMsMyM5GISDkZXYDVA5s4nj9NRSQPHeJaol+sqau87eoil49HHSqQjg94hAXBpschqfAmrxXX0NoyRdRhV03rGLY294=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr41001545oae.262.1667878253690; Mon, 07
 Nov 2022 19:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
In-Reply-To: <20221108000828.42824-1-niko.mauno@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 19:30:27 -0800
Message-ID: <CAMKF1spGT0-AJS+e6=ssV8xHpCPurE--NR5f=c8zRccQCmh58A@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] Try to ensure 64 bit time on 32 bit
 glibcful hosts
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172946

On Mon, Nov 7, 2022 at 4:09 PM Niko Mauno via lists.openembedded.org
<niko.mauno=vaisala.com@lists.openembedded.org> wrote:
>
> Add default C Preprocessor flags that ensure Y2038 compatible 64 bit
> time on 32 bit host applications when glibc is used. Prerequisites
> are glibc version 2.34 or newer and Linux kernel version 5.1 or newer.
>
> Example of impact on 32 bit 'qemuarm' machine running
> core-image-minimal. Before this change:
>
>   root@qemuarm:~# /bin/busybox date
>   Sun Nov  6 06:09:39 UTC 2022
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   2022-11-06 06:09:49.994249+00:00
>   root@qemuarm:~# /bin/busybox date -s 2040-01-01
>   date: invalid date '2040-01-01'
>   root@qemuarm:~# /bin/date.coreutils -s 2040-01-01
>   Sun Jan  1 00:00:00 UTC 2040
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   1931-03-04 06:26:23.000000+00:00
>   root@qemuarm:~#
>
> After this change:
>
>   root@qemuarm:~# /bin/busybox date
>   Sun Nov  6 06:02:20 UTC 2022
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   2022-11-06 06:02:27.989730+00:00
>   root@qemuarm:~# /bin/busybox date -s 2040-01-01
>   Sun Jan  1 00:00:00 UTC 2040
>   root@qemuarm:~# /sbin/hwclock.util-linux -w
>   root@qemuarm:~# /sbin/hwclock.util-linux
>   2040-01-01 00:00:20.992954+00:00
>   root@qemuarm:~#
>
> From here on, the adding of new flags can be disabled on recipe or
> global level by resetting the value of associated variable containing
> the CPPFLAGS specific for 64 bit time
>
>   GLIBC_64BIT_TIME_CPPFLAGS = ""
>
> which can be useful e.g. when working around failure to compile a
> component due to lack of 64 bit time support on 32 bit build in the
> component's source code.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/conf/distro/include/tclibc-glibc.inc        | 3 +++
>  meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb | 2 ++
>  meta/recipes-devtools/pseudo/pseudo_git.bb       | 2 ++
>  3 files changed, 7 insertions(+)
>
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> index f48d16939e..95770298e9 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
>
>  CXXFLAGS += "-fvisibility-inlines-hidden"
>
> +GLIBC_64BIT_TIME_CPPFLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> +TARGET_CPPFLAGS += "${GLIBC_64BIT_TIME_CPPFLAGS}"

We only need it for 32bit systems and not for 64bit systems. So
perhaps we need it for only 32bit systems.

> +
>  LIBC_DEPENDENCIES = "\
>                      glibc \
>                      glibc-dbg \
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> index 8bda2ccad6..b3fafa0ea4 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
> @@ -5,3 +5,5 @@ require gcc-sanitizers.inc
>  # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
>  ARM_INSTRUCTION_SET:armv4 = "arm"
>  ARM_INSTRUCTION_SET:armv5 = "arm"
> +
> +GLIBC_64BIT_TIME_CPPFLAGS = ""
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index c34580b4ff..7734d0fbb0 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -19,3 +19,5 @@ PV = "1.9.0+git${SRCPV}"
>
>  # error: use of undeclared identifier '_STAT_VER'
>  COMPATIBLE_HOST:libc-musl = 'null'
> +
> +GLIBC_64BIT_TIME_CPPFLAGS = ""
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172939): https://lists.openembedded.org/g/openembedded-core/message/172939
> Mute This Topic: https://lists.openembedded.org/mt/94880624/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

