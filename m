Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7895CC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 19:43:51 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.1671.1665603822166042518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 12:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L4jppyGL;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id y17so9297818ilq.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 12:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBlrG/g/GkB3tbnDZp8M5D4IziP5NzU5ixYkAIIy2Z0=;
        b=L4jppyGL4EclSu+w83YJwUUm/WQxp/O1kmR1qinHU8FDIQH9p4xmhPtffVSQVi+xPy
         fMNAMlTvnJS7TQOxJRtHsQkMsUlTou+nS+2no12ANXlG4LC/nipA9fDLDnyVM4qGQf5r
         dDnjB/3WfzhTL+VCOaWlIcDUtkCUOIaH2z04cEsWZPezxR7jlVqvQA6tpLtObPwXycCS
         xQb/x81odEghaz6DoprYflqShaNUh9aPzFP+Gg3WErdbA98mk9O8o7c7UgOMNB6cbIUj
         AC6FVgDVJiJWCD2X8NLgeEPqlI+3gWkj60BkHT01a2BcbBuRtA+WiUr9VUodVOcJfS4R
         r3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBlrG/g/GkB3tbnDZp8M5D4IziP5NzU5ixYkAIIy2Z0=;
        b=0oVE6TmKJKhSYBtzHvL+ES3FRTSvoGiUe7VjHYudbzBsWfxaC2erDrB8UGP5MOJlSB
         Wdb8cCagFZxNeQuuXdRgY6VvSyLw6VUD56K7JOkpc/BpAP1OiY2ZJd40ftw2Qi1FmefK
         X9qZ87FeYI3Qc+5rCmCTSvJLVzk61wAhNzrtkwPm5TAbDjGYixf/PG8O9RwoXUFKJQQy
         cCevIorX9ysL85KaPPfq2zCAGyxsKYaJj0xmGthwti3iQjZbHIfZ4jiWu871irZNQTAc
         3qIBZR+n0YchvRXsbkAMbRZP7LDV4OeSLzjMxe8w7A9g7rjDBtJR13DI/D4OVuCQEdWM
         0dUQ==
X-Gm-Message-State: ACrzQf1+gMzF+rRVU7eYTnMxQUIRk2Bmj+8RVdiVbZUWyRr1p1m8gYn8
	LhLxzi8/pslD6YxHb0ZWcs1PeRmIUjaCk9BVXFddGrChgtU=
X-Google-Smtp-Source: AMsMyM7L95/NaxEzMzV4zOGHf2yX2hD68vMfa/FkjTpV0VEGewOufEfUzsYWun9/sv9SMdV8Jse4edbIGD3wxpJGZV8=
X-Received: by 2002:a05:6e02:2141:b0:2fa:c219:6158 with SMTP id
 d1-20020a056e02214100b002fac2196158mr14174302ilv.48.1665603821356; Wed, 12
 Oct 2022 12:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221012071813.778-1-alex.kiernan@gmail.com> <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
In-Reply-To: <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Oct 2022 20:43:30 +0100
Message-ID: <CAO5Uq5Tqqt=oaGQt7kyZUg4gkJ6Uo_ahNR6itZSEwYyDX8rKrQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig to
 a class
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 19:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171674

On Wed, Oct 12, 2022 at 5:36 PM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 12 Oct 2022, at 08:18, Alex Kiernan via lists.openembedded.org <alex.k=
iernan=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Move savedefconfig task to a class so we can reuse it in other recipes
> > which support it.
>
> There are three users of cml1 in oe-core: kernel, uboot, and busybox.  Do=
es busybox support savedefconfig?
>

It doesn't and fairly obviously goes boom...

ERROR: busybox-1.35.0-r0 do_savedefconfig: oe_runmake failed
ERROR: busybox-1.35.0-r0 do_savedefconfig:
ExecutionError('/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox=
/1.35.0-r0/temp/run.do_savedefconfig.12421',
1, None, None)
ERROR: Logfile of failure stored in:
/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/temp/=
log.do_savedefconfig.12421
Log data follows:
| DEBUG: Executing shell function do_savedefconfig
| Saving defconfig to:
| /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bus=
ybox-1.35.0/defconfig
| NOTE: make CC=3Dx86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2
-msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
--sysroot=3D/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.3=
5.0-r0/recipe-sysroot
LD=3Dx86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
--sysroot=3D/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.3=
5.0-r0/recipe-sysroot
V=3D1 ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-poky-linux- SKIP_STRIP=3Dy
HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E -C
/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/busyb=
ox-1.35.0
savedefconfig
| make: Entering directory
'/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/busy=
box-1.35.0'
| make -f scripts/Makefile.build obj=3Dscripts/basic
| /home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/bus=
ybox-1.35.0/scripts/gen_build_files.sh
/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/busyb=
ox-1.35.0
/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/busyb=
ox-1.35.0
| mkdir -p include
| make -f scripts/Makefile.build obj=3Dscripts/kconfig savedefconfig
| make[1]: *** No rule to make target 'savedefconfig'.  Stop.
| make: *** [Makefile:444: savedefconfig] Error 2
| make: Leaving directory
'/home/alexk/poky/build/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/busy=
box-1.35.0'
| ERROR: oe_runmake failed

> I=E2=80=99m thinking to avoid tiny classes we can just add this to cml1.b=
bclass and make it print a decent error message if it doesn=E2=80=99t work.
>

So where I started, was adding it to u-boot.inc (which isn't a class,
I guess an artefact of history), because tiny classes felt like a poor
choice. I can add it to cml1 instead, at which point I've tried all
three options, maybe that's the best option and if you have a consumer
that doesn't do it, you just get a fail as above.

Are there are other users of cml1 other than these three? My suspicion
is there isn't (though I've only looked at layers I've got checked
out).

--=20
Alex Kiernan

