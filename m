Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E854C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 14:40:04 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.9682.1685112000899341926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 07:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=V+9qthA1;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2af2db78b38so8568041fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685111999; x=1687703999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yRzxag+CnYZ53sTHd3IV8PW1Rn3hAvnsjL+KyibK/dc=;
        b=V+9qthA13OG7OdFed9db25WSw0e803Qh1KfZ+44eAtJETGmMV7u0SrEqRlHJNxH4er
         IEAA9CiFP0LuiOGJgGZYBBLLvt10bHL2Ie28jeOZJr/h3ws52npkSzom4v9Qy5JM0J/I
         u6XX1wRHgQxKg75QkNMRqkpkoC2GAgn8mplhErKeLHOy6v3sxV2aYEhXzYTCzwg+QHlt
         7ubzd/Fivtxhyk/qrQYbe+PUI/sadu8nm+Aomhu4R/59Z3R44csgFgH5d/VGAEdG8yZQ
         BCkGGQDuwMXlJONruIOm+jN9WISOxdPkr5015o6Kmkxfqdr7WGB15O6GXvsMStmaSf1O
         kg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685111999; x=1687703999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRzxag+CnYZ53sTHd3IV8PW1Rn3hAvnsjL+KyibK/dc=;
        b=G88K1oGM6gLyhp6TgFUCYbZ5SDUYYu0nTvj68cqXBb89qCglYR9v79B9u4edHy/YIV
         kIH5LhXPF871eQAC08NgO1FPWDDukNdr5njYNplHBhuW5IFcbSeKksJSCr6YI7DhiKU9
         yUPn2tnHWjyQc5FBJaMpM7t8/fJiSo5H41PTQalShrP3hV135MaO2hNq8aUMW8moQPpw
         baXVgvsncrVvMbNsRichXL/yD0aFnmmb99CHjjE/jWw5dXCKTzcvIZ2RUxZa0qTmyJlI
         bcBOG1fRHfjuz3gyY1vhPx6BVc2eUR13bD3ZJ2gwNleh52z6Lj7l0gAnOf7W9tuMi0mW
         FkMQ==
X-Gm-Message-State: AC+VfDzTRCF4RJPTl+r9N2eXBP+yldQMddbwOLS40OaBQi0JgwgBmLKY
	D1w0lcKLrLQArDbgHtghxwo1rAMI2+26TNqynwY=
X-Google-Smtp-Source: ACHHUZ5B8VMrRMKCa5X30NPOcq2cMxV+hCXwYnoAwfJ9V7t0I6usFrEhP75/hNz5Ta+uBqk1nUY39KJYELPqOkFa9+4=
X-Received: by 2002:a2e:9b5a:0:b0:2ad:d2d1:bbae with SMTP id
 o26-20020a2e9b5a000000b002add2d1bbaemr652553ljj.45.1685111998500; Fri, 26 May
 2023 07:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230526142746.3220960-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230526142746.3220960-1-mingli.yu@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 May 2023 16:39:47 +0200
Message-ID: <CANNYZj98ng9p+RZqwSGj2rUF=FmHpNZu8HfNHJUDdPSe8EUUoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Restrict the built qemu targets
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 14:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181774

I can't agree with this. The whole point of qemu is that it can
emulate any target on any other target. If you would like to trim it
down, can this be configured via PACKAGECONFIG, and off by default?

Alex

On Fri, 26 May 2023 at 16:27, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Now the QEMU_TARGETS used to set the supported built qemu targets
> both for "bitbake qemu-native" and "bitbake qemu".
>
> After the qemu package installed on the target, it will take up
> 464M which includes not only the one matches the arch of the target
> but aslo all available built qemu targets which set by QEMU_TARGETS.
>
> Making "bitbake qemu" to only build the arch matches the target should
> satisfy our usual need and ease the concerns who cares much about the
> size in embedded device as it decreases the qemu rpm size from about 65M
> to about 17M and the size of the extracted qemu RPM decreased from
> about 464M to about 248M.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu-targets.inc | 15 +++++++++++++--
>  meta/recipes-devtools/qemu/qemu_8.0.0.bb    |  2 +-
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
> index 24f9a03948..bd0b47a4e7 100644
> --- a/meta/recipes-devtools/qemu/qemu-targets.inc
> +++ b/meta/recipes-devtools/qemu/qemu-targets.inc
> @@ -3,9 +3,20 @@
>  #    mips mipsel mips64 mips64el ppc ppc64 ppc64abi32 ppcemb
>  #    riscv32 riscv64 sparc sparc32 sparc32plus
>
> -def get_qemu_target_list(d):
> +def get_qemu_target_list(d, target=False):
>      import bb
> -    archs = d.getVar('QEMU_TARGETS').split()
> +    if target:
> +        archs = []
> +        allarchs = d.getVar('QEMU_TARGETS').split()
> +        if d.getVar("TARGET_ARCH") in ["x86", "i486", "i586", "i686"]:
> +            machine_arch = "i386"
> +        else:
> +            machine_arch = d.getVar("TARGET_ARCH")
> +        for arch in allarchs:
> +            if arch in machine_arch:
> +                archs.append(arch)
> +    else:
> +        archs = d.getVar('QEMU_TARGETS').split()
>      tos = d.getVar('HOST_OS')
>      softmmuonly = ""
>      for arch in ['ppcemb', 'lm32']:
> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> index 42e133967e..6c25d99ade 100644
> --- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
> @@ -10,7 +10,7 @@ CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1',
>
>  RDEPENDS:${PN}:class-target += "bash"
>
> -EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
> +EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d, target=True)}"
>  EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
>  EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181773): https://lists.openembedded.org/g/openembedded-core/message/181773
> Mute This Topic: https://lists.openembedded.org/mt/99150807/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

