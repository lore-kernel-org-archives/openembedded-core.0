Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB93C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 21:39:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.25115.1708637950865788563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 13:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSJDMJF9;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e4cf3c5658so103342b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 13:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708637950; x=1709242750; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIz0iCWbdOwqWwQi7Vibz0LsxeCKP5DYQmIhjehTyG8=;
        b=LSJDMJF9R73dL0wfOUvtxCSzTKy+ymZkf4uRVMxaQVU3hNRxdxOXK92/oRkBZl4J/2
         vgHGGTeczRAoRFS/k+hPy/sMeCoD27xs2DAm9FY0EFuE1bSrnowgvPM9dgR2Z9/XUqF4
         m0pqImgRbqI2S3LMSzfK0LlgAxiyQ1F2SliSOV7yuzc3kKxeBEw7si9msPBkPv/Rs5pp
         BfJ+b1R3gs+7J96/39mIgWRzFxL4Lk+Vj5Decn0hsw638Xlhzyb861mD7LZlFZ2+FMg2
         2Q+RMGUetvNbrZQbBDmxWhrG78r8SN7LoCgbLnBdPmtWBhbKza7X4iCan8JcCNW0Wwbl
         Ev+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708637950; x=1709242750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIz0iCWbdOwqWwQi7Vibz0LsxeCKP5DYQmIhjehTyG8=;
        b=JWkrg+abM4SejBiDDgmZZO+TWmNBGfyXC1AGJdSTqjbJd+bZmTMbMLz4WktCLP5BRc
         Wcnr9Hha/VPclSLY1Jc1+awA2UplSgTCfhcEh8RCoN/EXPWP3d5sFFhYul/b0TDzX40u
         UC83lxKP/0XeWBtor6FzwpXb9AjA7RIlNUGhNcOQa6sZDRh+RwV3ZhhRk5f16Y6eqrpL
         aGxyWnWE5/ouBLyYZ7cIwgDFrFOqWc1yhQKO/KpfjHaaNSBCy28HoV9sIoHT9SaHUO0c
         KL98fF8VoC2PlxDXowBSDqFJgZs0LLbTcV51gyDZnG+ym3u401MRraxEBFGOdOzFZdIE
         pI4A==
X-Gm-Message-State: AOJu0YzfDeUBxjY5nTZo8wK+wwUrjST7YfSbwlmc+zZ0VBKFg+WkXw6D
	820aXlo/rDB3Z4WYGToBRKmBEzkMsH7pJO5gxPMq7Y8E9Tdza3I66gsbt4HZE1NMge0aDSV9BtI
	sTNNhVMMqmZ29EQuGLT0X2UeLaVE=
X-Google-Smtp-Source: AGHT+IHoGq0vsL9EaKVnM63bvFG59QXEzA7udEBqk6aqfR5z3Yl4TEjVo7AV6qj4UG9kuG1iVHa/qF4g/pY5QhP291g=
X-Received: by 2002:a05:6a21:6802:b0:1a0:d262:115c with SMTP id
 wr2-20020a056a21680200b001a0d262115cmr88299pzb.42.1708637950174; Thu, 22 Feb
 2024 13:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20240222202827.3675576-1-kamatam@amazon.com>
In-Reply-To: <20240222202827.3675576-1-kamatam@amazon.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 16:38:59 -0500
Message-ID: <CADkTA4M7qHmuZAst9jHQS52k7SKEjsBhcdeB+HM2TWAEeVdMRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Set pkg-config variables for
 building modules
To: kamatam@amazon.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 21:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196042

On Thu, Feb 22, 2024 at 3:28=E2=80=AFPM Munehisa Kamata via
lists.openembedded.org <kamatam=3Damazon.com@lists.openembedded.org>
wrote:
>
> The pkg-config workaround has been applied for kernel image building, but
> not for module building. On x86, this can trigger rebuilding of objtool
> unnecessary at do_compile_kernelmodules task. If the kernel is built with
> CONFIG_DEBUG_INFO_BTF=3Dy, the task even rebuilds vmlinux and leads to
> inconsistent build-id between bzImage and vmlinux, and also BTF mismatche=
s
> between the bzImage and modules.

I don't question the change, as it is what I had to do for the mail
kernel build.

What I would like to see logged is a set of steps that managed to trigger t=
he
issue.

Since the module builds are dependent on the main kernel, everything that t=
hey
need should be available and already timestamped to not be required, so the
missing pkconfig shouldn't trigger much.

That way we'll know if there's a gap somewhere in the dependencies, or anot=
her
race condition and we can test for it.

Bruce

>
> To avoid the inconsistency, apply the same workaround when building
> modules. For kernels 5.19+, simply set HOSTPKG_CONFIG in the make command
> line.
>
> Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index a76aaee5ba..db4461e551 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -239,6 +239,8 @@ KERNEL_EXTRA_ARGS ?=3D ""
>  EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}"'
> +# Only for newer kernels (5.19+), native pkg-config variables are set fo=
r older kernels when building kernel and modules
> +EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
>
>  KERNEL_ALT_IMAGETYPE ??=3D ""
>
> @@ -356,9 +358,6 @@ kernel_do_compile() {
>         export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
>         export PKG_CONFIG_SYSROOT_DIR=3D""
>
> -       # for newer kernels (5.19+) there's a dedicated variable
> -       export HOSTPKG_CONFIG=3D"pkg-config-native"
> -
>         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
>                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPO=
CH may not
>                 # be set....
> @@ -408,6 +407,13 @@ addtask transform_kernel after do_compile before do_=
install
>
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +
> +       # setup native pkg-config variables (kconfig scripts call pkg-con=
fig directly, cannot generically be overriden to pkg-config-native)
> +       export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pk=
gconfig"
> +       export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIV=
E}/pkgconfig"
> +       export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
> +       export PKG_CONFIG_SYSROOT_DIR=3D""
> +
>         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
>                 # kernel sources do not use do_unpack, so SOURCE_DATE_EPO=
CH may not
>                 # be set....
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196041): https://lists.openembedded.org/g/openembedde=
d-core/message/196041
> Mute This Topic: https://lists.openembedded.org/mt/104516377/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

