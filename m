Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACE4C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 13:03:26 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.50529.1720011798507239230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 06:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUaQHt7i;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c8c6cc53c7so3691140a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720011798; x=1720616598; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+Hc/HV/9n9ygAPOTIUr+5ONEQSNMctCKGAN9Cs9FCY=;
        b=MUaQHt7i/l+FX5wDXvdexq7Zi8gMe0EnUxNEv2lCuykgfpCsmHST/bagkta9iG0te9
         ya0K1pstTAOD7bszLvbjF0zgLEKXYbYjiy83o0lPn9W753V2YmYIKC74CKhM7GuoQOfi
         6EuLe2plsr4nh3ceXkcUAn9gCm0DPC1gsucIX4nKACqUg3QZ1PMe7GGBKQ7PoPJcuX2t
         1P+ORhQaQVsZ/s5jzewhJbKV6yx+5/1Q1oWuvcW+Amb6jTYmgbFJbpH9gcMRn1mTzxFG
         7zu66+sg59O+xDmftaNbZ3JXFi+4nb9WDRWvshYxY9uRdRbLSzybEpNNc6Mk4FL8iQ53
         JpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011798; x=1720616598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+Hc/HV/9n9ygAPOTIUr+5ONEQSNMctCKGAN9Cs9FCY=;
        b=BDIeNMrpHNezHPwbYb6fivbSSasqJkxPLrve6cDhLCGNa4jknTz06cc/m0lxSI8oRc
         KmWogh+ttxjt92sMtLoV25iviMnzkO51ywN4pwXozPmVOVsRanG+KoSR/hZz4IEpubld
         1mEIWvQ1+y8NY3YBb86Qmr8GgeUDXewIbjd9cTX9kKNiSJJa6otgPtKZNKeLMI2j3WTM
         9XnnnP1NKrKakJdElN3Ggw1+ZKrzGf/H/MM3LPCEEFsUAmyhOEpArUJARofcSKkfjG5w
         O9wg1PURe7M7P+kGNck2FCUnfyhIx3z40sYvlQ5Ai2WcqE3d3Gee1pujczAYfkZnxOdm
         lckQ==
X-Gm-Message-State: AOJu0Ywl6mvOEOqwaxZQlgyWuKPUJojUkwt+v3dAGcg3lzrbvmqOBxIO
	RlTmnYfWvOiUE47xlS1RkM2zUAX/GiVn2cdkcuOTS7kM3ONna1xRMGtgYSabKI6f5oo0kd8l+gx
	CkEFzRQAkDq3m1RwEJK01Bwuxxbs=
X-Google-Smtp-Source: AGHT+IGmbFi9gL/gvZnzCVXOxf2l5HoskteZaj89oElxgrYgOG3UOQzBQWgHwFjIU9AEAhR+MEj7nYQk9oofC+OD1Ww=
X-Received: by 2002:a17:90b:2e87:b0:2c8:d0a6:1d10 with SMTP id
 98e67ed59e1d1-2c93d77c8e5mr8450201a91.41.1720011797338; Wed, 03 Jul 2024
 06:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jul 2024 09:03:04 -0400
Message-ID: <CADkTA4Mn9e2NpQ3ZupvPUWKffYcM4h5E91cbvq=Gc3TXuV5vdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 13:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201474

On Wed, Jul 3, 2024 at 8:53=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Running /usr/share/bcc/tools/runqlat 1 5 gives following error:-
>
> libbpf: failed to find valid kernel BTF
> /virtual/main.c:92:15: error: no member named 'state' in 'struct task_str=
uct'
> if (prev->state =3D=3D TASK_RUNNING) {
> ~~~~ ^
> 1 error generated.
>
> It is due to the modification of state to __state in latest kernels.
>
> The following commit addressed the issue which checks whether the struct =
"task_struct" has __state or state
> https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e2228626a7db=
e506ad38
> The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kernel
> and requires pahole.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc     | 3 ++-
>  meta/recipes-kernel/linux/linux-yocto/cg2.cfg | 2 ++
>  meta/recipes-kernel/linux/linux-yocto/cg2.scc | 1 +
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 2 ++
>  4 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/cg2.cfg
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/cg2.scc
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 0132fcffb3..d6b4794d32 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -65,11 +65,12 @@ KERNEL_DEBUG ?=3D ""
>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerp=
c" ], "elfutils-native", "", d)}'
>  DEPENDS +=3D "openssl-native util-linux-native"
>  DEPENDS +=3D "gmp-native libmpc-native"
> +DEPENDS +=3D "pahole-native"

This has to be conditional, it is only required in certain
configurations. You may need
another image or distro configuration option to control the
conditional depends, just
like we did with KERNEL_DEBUG (and see my comment below, I think we
still should).

>
>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-n=
ative available before do_kernel_configme
>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG", "=
True", "pahole-native:do_populate_sysroot", "", d)}'
>
> -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAH=
OLE=3Dfalse", d)}'

You need to justify this change. It wasn't a mistake that we wanted to
force phole off
when debug wasn't enabled.

> +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "", =
d)}'
>
>  do_devshell:prepend() {
>      # setup native pkg-config variables (kconfig scripts call pkg-config=
 directly, cannot generically be overriden to pkg-config-native)
> diff --git a/meta/recipes-kernel/linux/linux-yocto/cg2.cfg b/meta/recipes=
-kernel/linux/linux-yocto/cg2.cfg
> new file mode 100644
> index 0000000000..7c60e87a1a
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/cg2.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_IKHEADERS=3Dy
> +CONFIG_DEBUG_INFO_BTF=3Dy
> diff --git a/meta/recipes-kernel/linux/linux-yocto/cg2.scc b/meta/recipes=
-kernel/linux/linux-yocto/cg2.scc
> new file mode 100644
> index 0000000000..7047be85f7
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/cg2.scc
> @@ -0,0 +1 @@
> +kconf non-hardware cg2.cfg
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 62c0f0ab36..cba61aa2d7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -72,3 +72,5 @@ KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/po=
werpc-debug.scc"
>
>  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
>
> +SRC_URI +=3D "file://cg2.scc"
> +KERNEL_FEATURES +=3D "cg2.scc"

Fragments don't go in the meta data layers, this needs to be submitted
to the kernel-cache and enabled with a KERNEL_FEATURE.

Cheers,

Bruce

> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201473): https://lists.openembedded.org/g/openembedde=
d-core/message/201473
> Mute This Topic: https://lists.openembedded.org/mt/107018570/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

