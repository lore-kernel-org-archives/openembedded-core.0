Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A99CC52D6D
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:21:23 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.91549.1722601281918830113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=luB9LlEu;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-66a048806e6so67985477b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722601281; x=1723206081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2+HWeO1Ui5ZUvJvMCxH5aGBbLE2mbRm16UNkSvR9OY=;
        b=luB9LlEuEKBn4X0Py7EOr+sPPSZ+AK8e4yM0CWB3NoiDrIsUHNXXUrsma/IXQJh6QK
         DBR0LWcAteZgFoctKVLKo0p4ftvEtKRyshZNk26+mVYLvy6urJCnk7fUAf++5JnqO+Dr
         yfXZduPaDgyLEWZvvw0CgMFCtlUa4VHyM7Hu1JxeP77hmTnk7r41Xtn/zyIGKAqKIW/A
         c5JRWqpwAfyMkMKb+HUPzGTUf5rPAYBtqEJO3Zu5L5Kb7N+YM070jz2V+8B79Z839SFU
         Rqt87nxCSTBocDwpvlriseCJdeKjKZvjJeLb/UAIgQVuUITCk1Q3cQZ26LJRkmTOm0oo
         kyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722601281; x=1723206081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2+HWeO1Ui5ZUvJvMCxH5aGBbLE2mbRm16UNkSvR9OY=;
        b=uKCQ8bkrvapFiLLir5XuxEZl9oZMGrXvWNYpaDX17OYlcMtBmip3vAxGOLVuW6QYcK
         2lrOUWxTG74Sz18gPMX+Ip91Ce/7w600GY+MQTSgFm7G80gJb4WvG/xUvU59yKdHvuTV
         naiOwq/1kMCLewwXAD2VIUyzTQKQRBbrx4Fkbkf8XRp7oSqeYxhmuuFdk/xqoulji8OI
         Ksh4FMjtauq2TT+P4Ms0b+oMrw+3VH94EVQT5fsI8In1JwTauiaPAwqPldzdJfpvEMby
         wlIPBLJxXNfhIgEus0EzL0CRqEaptd29taYQByoAY6VCHtsJSCeSeYJoZG0rpflh9Qlo
         mHcg==
X-Gm-Message-State: AOJu0YxJ/PJk4++ySESOVQE8axg6NVqnzjLpxDy4v6ADotMJeazNwpL7
	LlfD2ipkcfyoJdr0WJlK9lahRHRe3O2FBTXS7Ae+US8K6QO67Hi9iBSz+w7Bd4Wef9rlNTn7vrT
	EGMoQDUDosEq4Y/NYw1tgEYAdeThnoFjejFhLEA==
X-Google-Smtp-Source: AGHT+IGCEzY+rS0TaYJ47Yiu1VRXbi+zmRl/NFFiBMCTw1pWMAN37oV0viTfpzFHYHFboBxEQVUjY2x8l/HL/LuLpAM=
X-Received: by 2002:a0d:fbc1:0:b0:643:9333:9836 with SMTP id
 00721157ae682-6896439182fmr37691777b3.38.1722601280956; Fri, 02 Aug 2024
 05:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240801194209.261057-1-sdoshi@mvista.com>
In-Reply-To: <20240801194209.261057-1-sdoshi@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 2 Aug 2024 05:21:10 -0700
Message-ID: <CAOSpxdbdYtEAZXuygF=jxqSMhRnkFLz6d-0a2xC6H7Qk2RMBtw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCHv2] lttng-modules: Upgrade 2.13.9 -> 2.13.14
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202902

On Thu, Aug 1, 2024 at 12:42=E2=80=AFPM Siddharth Doshi via
lists.openembedded.org <sdoshi=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> License-Update: Updated LIC_FILES_CHKSUM due to License file modification

I think the intent of this tag is to specify what was modified!
Please send a V3 outlining what changed in the license file.

Thanks!

Steve

>
> Note: Upgrade lttng-modules to 2.13.14 to fix fcheck error which occurs
> with commit 782202de6478f68caaed4567017095ad906c4eef in kernel "file: Ren=
ame fcheck
> lookup_fd_rcu" which does replaces fcheck with lookup_fd_rcu.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../0009-Rename-genhd-wrapper-to-blkdev.patch | 19 +++++++++++--------
>  ...les_2.13.9.bb =3D> lttng-modules_2.13.14.bb} |  4 ++--
>  2 files changed, 13 insertions(+), 10 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.13.9.bb =3D> lttng-mod=
ules_2.13.14.bb} (89%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wr=
apper-to-blkdev.patch b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename=
-genhd-wrapper-to-blkdev.patch
> index 90fec9dc58..874e076675 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-t=
o-blkdev.patch
> +++ b/meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-t=
o-blkdev.patch
> @@ -8,9 +8,12 @@ to follow upstream.
>
>  Upstream-Status: Backport
>
> +Note: Updated patch to cleanly apply to 2.13.14
> +
>  Change-Id: I4ec94fb94d11712dd20f0680aea1de77fbfa9d17
>  Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
>  Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>  ---
>   include/wrapper/{genhd.h =3D> blkdev.h} | 10 +++++-----
>   src/lttng-statedump-impl.c            |  2 +-
> @@ -21,7 +24,7 @@ diff --git a/include/wrapper/genhd.h b/include/wrapper/=
blkdev.h
>  similarity index 93%
>  rename from include/wrapper/genhd.h
>  rename to include/wrapper/blkdev.h
> -index 4a59b68e..0d5ad90f 100644
> +index e32c7b6..76397f6 100644
>  --- a/include/wrapper/genhd.h
>  +++ b/include/wrapper/blkdev.h
>  @@ -1,6 +1,6 @@
> @@ -41,9 +44,9 @@ index 4a59b68e..0d5ad90f 100644
>  +#ifndef _LTTNG_WRAPPER_BLKDEV_H
>  +#define _LTTNG_WRAPPER_BLKDEV_H
>
> - #if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(5,18,0))
> - #include <linux/blkdev.h>
> -@@ -45,7 +45,7 @@ struct class *wrapper_get_block_class(void)
> + #if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(5,18,0) \
> +       || LTTNG_RHEL_KERNEL_RANGE(5,14,0,162,0,0, 5,15,0,0,0,0))
> +@@ -47,7 +47,7 @@ struct class *wrapper_get_block_class(void)
>   /*
>    * Canary function to check for 'block_class' at compile time.
>    *
> @@ -52,17 +55,17 @@ index 4a59b68e..0d5ad90f 100644
>    *
>    *   extern struct class block_class;
>    */
> -@@ -104,4 +104,4 @@ struct device_type *wrapper_get_disk_type(void)
> +@@ -106,4 +106,4 @@ struct device_type *wrapper_get_disk_type(void)
>
>   #endif
>
>  -#endif /* _LTTNG_WRAPPER_GENHD_H */
>  +#endif /* _LTTNG_WRAPPER_BLKDEV_H */
>  diff --git a/src/lttng-statedump-impl.c b/src/lttng-statedump-impl.c
> -index 4d7b2921..0e753090 100644
> +index 9d197ce..229517e 100644
>  --- a/src/lttng-statedump-impl.c
>  +++ b/src/lttng-statedump-impl.c
> -@@ -41,7 +41,7 @@
> +@@ -42,7 +42,7 @@
>   #include <wrapper/namespace.h>
>   #include <wrapper/irq.h>
>   #include <wrapper/tracepoint.h>
> @@ -72,5 +75,5 @@ index 4d7b2921..0e753090 100644
>   #include <wrapper/fdtable.h>
>   #include <wrapper/sched.h>
>  --
> -2.19.1
> +2.35.7
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/rec=
ipes-kernel/lttng/lttng-modules_2.13.14.bb
> similarity index 89%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
> index a08386b053..a3e29ab7b7 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
> @@ -3,7 +3,7 @@ SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
>  DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel trace=
r modules"
>  HOMEPAGE =3D "https://lttng.org/"
>  LICENSE =3D "LGPL-2.1-only & GPL-2.0-only & MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0464cff101a009c403cd2ed65d01d=
4c4"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8d0d9f08888046474772a5d745d89=
d6a"
>
>  inherit module
>
> @@ -16,7 +16,7 @@ SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV=
}.tar.bz2 \
>  # Use :append here so that the patch is applied also when using devupstr=
eam
>  SRC_URI:append =3D " file://0001-src-Kbuild-change-missing-CONFIG_TRACEP=
OINTS-to-warn.patch"
>
> -SRC_URI[sha256sum] =3D "bf808b113544287cfe837a6382887fa66354ef5cc8216460=
cebbef3d27dc3581"
> +SRC_URI[sha256sum] =3D "c6449f7ff12ab644a630692a556304e51525ca37d98aebf8=
26796918be0f5da6"
>
>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202887): https://lists.openembedded.org/g/openembedde=
d-core/message/202887
> Mute This Topic: https://lists.openembedded.org/mt/107673130/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

