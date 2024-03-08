Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF54C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:09:34 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.231.1709921367967561723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 10:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5wneXz2;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512f892500cso1389081e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 10:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709921366; x=1710526166; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7KhKZHE4Oo2dp527qYhC+00mKINiB1vSZzaMXYXkRk=;
        b=C5wneXz2u8m7DXSyPcUqB3slkpZxe7LTR8h9eGMEofgRxNeTYd3wkc0Yv8YeYX5a5V
         tt2xOw3AMuaPohPLwRTo4DvQ9UbiihK1p2zpMMKg2e2Le399ogjtyru8FOCLqJCvNDkY
         V2bt85NfBeu4Vcr8uIjVenR8QJ6px/AQbJEM+aBa+Rg9vVeow2nCJ4st43fv38gcNF5k
         IPyKSwI8kWNEIYBQKfj4v1+avfpzN3ufVW9dO9CdUu8g8aKvf5A1NkLNFd2vSijzeX+e
         80U6XXkzAf4vnvNkunYLTlnwONP81MWJz+SvLKHt3Rv9sp9TdHRg2OD7Q9q16lXFXuWO
         T+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709921366; x=1710526166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7KhKZHE4Oo2dp527qYhC+00mKINiB1vSZzaMXYXkRk=;
        b=t8aeUuWE6wUAsub05vfsTk/aXgEqP8V+1Wqf5Q1Kcswdm9Ly0RgRL/oEKEdspzGOb2
         PLRXurQdzldm9BAN/q/z7LoNKfv2nYSwvzuV+IvnXfLt+Vs+myTeqPxuglOi+pt+QiTM
         YrnJz3CizjpHQitntbqHwTW7D2ZpWFm5/jgR0D8LPgsjQN4mtbzk7+uiiCJKu7qVPSen
         6bjwFEs9bvoEOdAO5seKOYzoYvXrcuO7quiayulk5+fdmoxyGr+7Io0vPuYfpUv/BQfC
         wv/b0icQuaWozVpzmRHL61V3iaTqigv89/0FHL4m/wLjLfHUoFacfQJ9T60iiLL+7HhJ
         Mheg==
X-Gm-Message-State: AOJu0Yy/AUGtCsrF/VpuegXuBO04fByd2Ek1QDeCemtzgp7UX0YuIpqE
	W9YsYVRuYWQTTI4EZr6QN04f4uzNTCgKzqmwkSSiEGIK1Jo/xj4GzKvu/3eR0VXxUbrnkQ9Y05y
	1XXQ9Hkz62pvMXb2ySOlJhmcWTQd2kLIU
X-Google-Smtp-Source: AGHT+IGCj5qR2NoYsS9kZNwS/B4TXmGDNOGN4iqKAd8uqS4/PVDBADZkJWUQYv6Iq+8wppb98ZmoqeCuVIknqCZ0CaQ=
X-Received: by 2002:a05:6512:34ce:b0:513:28c4:b91c with SMTP id
 w14-20020a05651234ce00b0051328c4b91cmr3281659lfr.64.1709921365833; Fri, 08
 Mar 2024 10:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20240308164728.1933548-1-f_l_k@t-online.de>
In-Reply-To: <20240308164728.1933548-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Mar 2024 19:09:14 +0100
Message-ID: <CANNYZj9ap2=DCmmpYRzALoiBFvcdTrffG18cr8Th+=AhR4=F-g@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: fix opencl-spirv build
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 18:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196859

Please include an explanation of when the patch can be removed from
oe-core directly into the patch; it's not enough to say it's a revert
and thus inappropriate for upstream submission.

Alex

On Fri, 8 Mar 2024 at 17:47, Markus Volk <f_l_k@t-online.de> wrote:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/815a6647eb1383e9dc704ffcc266d85f3b13338a
> adds a regression and breaks opencl-spirv build.
>
> The next step in mesa will probably be to completely remove nir in favour of rusticl.
> https://gitlab.freedesktop.org/mesa/mesa/-/issues/10674
>
> Revert this commit to avoid that the lts version cannot use spirv
> because rusticl is not yet and opencl-spirv is no longer supported.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-meson-do-not-pull-in-clc-for-clover.patch | 49 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> new file mode 100644
> index 0000000000..dffcc6feba
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> @@ -0,0 +1,49 @@
> +From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Fri, 8 Mar 2024 15:53:11 +0100
> +Subject: [PATCH] Revert "meson: do not pull in clc for clover"
> +
> +This reverts commit 815a6647eb1383e9dc704ffcc266d85f3b13338a.
> +Upstream-Status: Inappropriate
> +---
> + meson.build              | 3 ++-
> + src/compiler/meson.build | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 25e92ea5f95..3956e19c08f 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -818,6 +818,7 @@ if _opencl != 'disabled'
> +     error('The Clover OpenCL state tracker requires rtti')
> +   endif
> +
> ++  with_clc = true
> +   with_gallium_opencl = true
> +   with_opencl_icd = _opencl == 'icd'
> + else
> +@@ -842,7 +843,7 @@ if with_gallium_rusticl
> + endif
> +
> + dep_clc = null_dep
> +-if with_gallium_opencl or with_clc
> ++if with_clc
> +   dep_clc = dependency('libclc')
> + endif
> +
> +diff --git a/src/compiler/meson.build b/src/compiler/meson.build
> +index 8d73544c6d8..1dae56d1b2b 100644
> +--- a/src/compiler/meson.build
> ++++ b/src/compiler/meson.build
> +@@ -79,7 +79,7 @@ subdir('nir')
> +
> + subdir('spirv')
> +
> +-if with_clc
> ++if with_opencl_spirv
> +   subdir('clc')
> + endif
> + if with_gallium
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 12d7a18eb8..f5a6392d28 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-gallium-Fix-build-with-llvm-17.patch \
>             file://0001-drisw-fix-build-without-dri3.patch \
>             file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
> +           file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>  "
>
>  SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196857): https://lists.openembedded.org/g/openembedded-core/message/196857
> Mute This Topic: https://lists.openembedded.org/mt/104812320/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

