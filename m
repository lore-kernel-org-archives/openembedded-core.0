Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BBBC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 15:40:55 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.18488.1678203654532185407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 07:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bVjqFMId;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id m6so17619471lfq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 07:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678203653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=za46o74kTzMiBtEGYOZ7W7+FXLnY8iXQz+X1m/PEjcw=;
        b=bVjqFMIdssDTymLbkvjfblIFdVKhkO9LgiCASFPtSz9AtztwD378ChPw39dkNzQpBV
         sCVSYcKcNg2TNaSUJrBOt613LULKoQaT5NcSAdk780vA5yl7T96ZyWMNl4+Ieh9qCmYn
         fypx+ZRQsNvTcZJ0SRo7mpXTGXwPkF3HUcavA9MkjRo4L2XXGAmMElIJlCNZnnmG0Lry
         EGJtwcptAXJYwi4SWSGvi39i/IJ0DTJQn/SHDseu02iKuOs4Hs8d7gLY6zx7LmoH/mE9
         XmA1l1ohIpaMhFBhGZpaizhQiXHk9Jg3eOVJ/f4LCRzDl3hdBcYeJIeneI/9zmNWdYa6
         A+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=za46o74kTzMiBtEGYOZ7W7+FXLnY8iXQz+X1m/PEjcw=;
        b=fxj5PMZClof1XtlOAooP0R2rBEuKYYs6lTCi8E/9MacVD2SzSkvlfhAuN/Gx8hhXHx
         7qTOD6i+wpTe6jJ8hrXme86gJqxUKlcyCLWAcZorX+dfbNQ/hIzrNXJK0m36Ova1YsSL
         goU//xq3LDvt8uR0sZFnJ1+L77JvW1qVA/XgM/VjNwjoVJdeyfjFAuxnIIj4dWjeSLhR
         X90mJrYzXd8plv+XMHcDvRh9DJlnlsLGxOOj/5YpdLsDQg9eoVBKNMAmxnwGyZIFIWIq
         QATwc8jHNPlM5ua2uWpE6IlZ7sVJhxbJ+Jvnle76k3syPjKcHEUHbxGRPao32B2exNV7
         o0QA==
X-Gm-Message-State: AO0yUKUOXMg9EirR9xuMVh0hI1opQPnmdm3zjIrS7/xpQBV2F6kXcoqZ
	9fYOEk6a8fxiK4JVAKeNAPP9SBVF23gISLW8RE0=
X-Google-Smtp-Source: AK7set8UuV7RlOeWieB0mD2IjrWHcLjPQmnJHa3GmkSUn3uJ9wf7AYqUY6Ism5nTt6FqQShOjCgoTBriGEaJlxFODTc=
X-Received: by 2002:ac2:53b7:0:b0:4d5:ca32:6ed6 with SMTP id
 j23-20020ac253b7000000b004d5ca326ed6mr4703220lfh.4.1678203652722; Tue, 07 Mar
 2023 07:40:52 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-2-zboszor@gmail.com>
 <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
 <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com> <6524a686-7e21-7c69-4fee-e17d4d757108@gmail.com>
In-Reply-To: <6524a686-7e21-7c69-4fee-e17d4d757108@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 16:40:41 +0100
Message-ID: <CANNYZj_B1kxRB4bPWwCyU-90fR=ez0y=WGzdTjo16W05k5=Gww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 15:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178111

On Tue, 7 Mar 2023 at 12:39, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> The reasoning for the change is that glvnd is a thing.
> Maybe the drivers you mention should just use that.
> Recent distros enable glvnd in Mesa out of the box and
> NVIDIA also supports that.

qemu unfortunately doesn't work this way. It links directly with
libgbm, and libgbm probes directly into the drivers. This are the
errors:

did not find extension DRI_Mesa version 1
failed to bind extensions
did not find extension DRI_Mesa version 1
failed to bind extensions
did not find extension DRI_Mesa version 1
failed to bind extensions
did not find extension DRI_Mesa version 1
failed to bind extensions
qemu-system-x86_64: egl: gbm_create_device failed
qemu-system-x86_64: egl: render node init failed

And this is where they happen:

Thread 1 "qemu-system-x86" hit Breakpoint 1, 0x00007ffff77e6020 in
loader_bind_extensions () from
/home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/=
1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
(gdb) bt
#0  0x00007ffff77e6020 in loader_bind_extensions () from
/home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/=
1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
#1  0x00007ffff77e4fda in dri_screen_create_for_driver () from
/home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/=
1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
#2  0x00007ffff77e53a8 in dri_device_create () from
/home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/=
1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
#3  0x00007ffff77e376c in find_backend () from
/home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/=
1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
#4  0x00007ffff77e3891 in gbm_create_device () from
/home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/=
1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
#5  0x00005555559a00f8 in egl_rendernode_init (rendernode=3D<optimized
out>, mode=3DDISPLAYGL_MODE_ON) at ../qemu-7.2.0/ui/egl-helpers.c:177
#6  0x00005555559a04b1 in egl_headless_init (ds=3D<optimized out>,
opts=3D<optimized out>) at ../qemu-7.2.0/ui/egl-headless.c:203
#7  0x00005555559545f8 in qemu_init_displays () at
../qemu-7.2.0/softmmu/vl.c:2485
#8  qemu_init (argc=3D<optimized out>, argv=3D<optimized out>) at
../qemu-7.2.0/softmmu/vl.c:3603
#9  0x00005555557ec369 in main (argc=3D<optimized out>, argv=3D<optimized
out>) at ../qemu-7.2.0/softmmu/main.c:47

Alex

