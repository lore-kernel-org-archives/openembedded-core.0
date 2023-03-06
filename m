Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9036DC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 03:54:11 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.25958.1678074849591927921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 19:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DvNn9Wnh;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id y140so3537138iof.6
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 19:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRwcN4xPkmGmaIZEQ4CwuPN6h6nq5AcgEha8ClXU5ns=;
        b=DvNn9Wnhe/U598TsfnoFS2saL5a/cTiHCxAQ0GrqeYWfenh2PnKgKRaBjjNbssBwnA
         Wu899d00xyhsw0owrST6RfRsC2gjRpU6aFJuTSTjhfv2eGK/R4VAKfIzwyvW+E9DJsCv
         qm0DUgMZy0eJEAEG+zP7BxWOEkCmbLOwIMUrlgPB3d1G06i+Bw7m5Nb9X5HdgyHiTweR
         hqVeqAGxxUYZhCpU6NN5ld2nYYBHkqjzF43SxP7gGhqcYtlp5j3Q2WOcDl8GYrMmUUzf
         XiQXYpfQQUCTiVMpuAh2Ve4fqrsX7ggbYU5UZNtcHNMd22O56paJXkzuP9l6qIiEFLSj
         lD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRwcN4xPkmGmaIZEQ4CwuPN6h6nq5AcgEha8ClXU5ns=;
        b=HyoZKqFeJc5RjNn1gDE11E+AlDa/8SeNBpwV/IBC7lYxKFdg9opPl9hpD9YLfM/PD4
         /PagjSzvZy0pryp7bb254RDadnNgi6Y+N8XdjV4hYYTBNtWFAv8dtzos8nKg/4w3xUTQ
         AaU1UoTm1oIF7/UJbVCfbNxO4tGhzmmh5mIUnbw8kdJ6LTMoEinN8KJefDVciwUwQNEI
         1p8hBMEndKenQwFWSkbHrxML70oQQaSiYIsNYwlvUCYEzGo4hvWnXuSm8hsK3VMFMDFe
         H2onNkvkfihTA6tCezT0FlcqLH+n6drrYYkTQ0p7QhTb6ZJTYSJGnWMkgh5J1uv5aSk9
         WDeg==
X-Gm-Message-State: AO0yUKXRy6tjH6WwM6Q93T5hzpKBmkc2Um70O/XAIRGByM8uH2LorYHl
	20SClTZ5wUC3WKX2PjprQr3r78eaquVf74/jIik=
X-Google-Smtp-Source: AK7set8vXzeMB1jzfY6vzk2Zc3tWXcrL/nld+gNalOIiandHo3GfZDWecU4RRQTGCYBjSdVSBdElc9RgdsdzQaKlpik=
X-Received: by 2002:a02:944a:0:b0:3b0:94d5:ec19 with SMTP id
 a68-20020a02944a000000b003b094d5ec19mr4767742jai.0.1678074848721; Sun, 05 Mar
 2023 19:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20230304163029.31124-1-liu.ming50@gmail.com>
In-Reply-To: <20230304163029.31124-1-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 5 Mar 2023 22:53:57 -0500
Message-ID: <CADkTA4MLmL2gJV=SSXZdsSDaC_3xqxAUgHnX9yAgibiU9fK2dQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux: inherit pkgconfig in kernel.bbclass
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 03:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178055

On Sat, Mar 4, 2023 at 11:30=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> pkgconfig is being required to find dependencies for building kernel
> native tools, move "inherit pkgconfig" to kernel.bbclass so BSP kernel
> recipes can also benefit from it.

Reminder: copy me on linux-yocto changes!

This is fine with me. When I first introduced this, it wasn't
universally needed for all kernel versions, so it landed in
linux-yocto, where we knew the versions.

I'm betting that there are a lot of other kernel recipes with this
same inherit, and as long as they are all good with double inherits ..
nothing should break.

Bruce

>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass           | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 --
>  meta/recipes-kernel/linux/linux-yocto.inc    | 1 -
>  3 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 3f9c6c00e6..92090ac14e 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -660,7 +660,7 @@ do_savedefconfig() {
>  do_savedefconfig[nostamp] =3D "1"
>  addtask savedefconfig after do_configure
>
> -inherit cml1
> +inherit cml1 pkgconfig
>
>  # Need LD, HOSTLDFLAGS and more for config operations
>  KCONFIG_CONFIG_COMMAND:append =3D " ${EXTRA_OEMAKE}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-=
kernel/linux/linux-yocto-dev.bb
> index 9ef5b80a37..8039a52324 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -10,8 +10,6 @@
>
>  inherit kernel
>  require recipes-kernel/linux/linux-yocto.inc
> -# for ncurses tests
> -inherit pkgconfig
>
>  # provide this .inc to set specific revisions
>  include recipes-kernel/linux/linux-yocto-dev-revisions.inc
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 93eef9e946..934591ff1c 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -47,7 +47,6 @@ LINUX_VERSION_EXTENSION ??=3D "-yocto-${LINUX_KERNEL_TY=
PE}"
>  # Pick up shared functions
>  inherit kernel
>  inherit kernel-yocto
> -inherit pkgconfig
>
>  B =3D "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178027): https://lists.openembedded.org/g/openembedde=
d-core/message/178027
> Mute This Topic: https://lists.openembedded.org/mt/97386391/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

