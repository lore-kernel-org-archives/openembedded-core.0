Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41736C87FD3
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 18:45:07 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.28622.1724957100609106247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 11:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jp0ScAE9;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a866d3ae692so61597066b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724957099; x=1725561899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T/YZ3CugTQ48MkQtUyhD6diGRFdKbOARz+jebp2TXsk=;
        b=Jp0ScAE9868BcCeDQ6tD5SjHUitLTPIUYDceuOFv9ceqbf8MFmzkpWUm3AJ3XgKmJi
         AtbjJRR1tD0PSZe66T+CBvNQLFy/TxNCDZCWZ712mlfDU1BSfso1vIKBSq7inzQBkHIF
         VeoHenzJ4cmmJ8CAV14gHrQNAUJwvr2+3fWSD/c/7/XG4YP6SSOgtBh0MgHqiACSy/B1
         +yyLx3s2ExVmwA6IfYTkr1Hk+EOpKmRU11ve6Fkn8Dk564OZxcbLo+MIuXYrbJTxlq5g
         3l8nXKqQDh1vMaau9niOPxa4KcvzkpIjrHXjagp8pypI5+ek5FWQ0bd8HJf57x/dsxFE
         di5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724957099; x=1725561899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/YZ3CugTQ48MkQtUyhD6diGRFdKbOARz+jebp2TXsk=;
        b=pszDGf/FU2VurytOC1udWB0oPJHUSg8lfgB+tuNBbRdbHW0ENlk0z8rrOz55KVERrZ
         i369NS90EXi4yx9eoBttboTizLmrEhIEHp424n1H+rYtqvClaiR6eKfo6vLvlPMXfBeH
         tPTKN510zd6VUVJccgHuS81xQJ+0uTDSXeH0WIasryac99LH6IqJ8rTe7xUL1JIgLxaM
         dOUJa3MLj7sGUabw5Kf+Lv07JIUOP4njDN0O7UAFKBWfxEFoo0gSL1vfjENg9ItgQWv4
         ULaRkQDmFAfmf124iKnxfCEIgX9Lh1V3z6pHgWPL1btWADr1ei8FLOdTGs6bWerXB1Cs
         QdHQ==
X-Gm-Message-State: AOJu0YyBWiwhpIvkvH7VcXrSA/kQt5jnC6p7Fl0zCwz9ZZoiKj2xiAvM
	/VAE4+CU24DtpuIwHnwgyu3nBsU9pkcIu2ZO6piiDkfWQZ2+SFn5Kkl9Pef0Gdm13ACIxFeLvsU
	oE3Ya0EGkw10KqWXDN5e7Mba02II=
X-Google-Smtp-Source: AGHT+IGX9bD7Su31a/rYGhWnGArr7isSn6wQBaquatZIAM1mMnBEM+C3xYlkf6rs9h4gwROREFU3RpFZSWzCJNv+xBQ=
X-Received: by 2002:a05:6402:2690:b0:5a0:e303:8f0f with SMTP id
 4fb4d7f45d1cf-5c21ed3e297mr4444165a12.10.1724957097766; Thu, 29 Aug 2024
 11:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <17EF8C4828BB74CA.5775@lists.openembedded.org>
In-Reply-To: <17EF8C4828BB74CA.5775@lists.openembedded.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 29 Aug 2024 21:44:46 +0300
Message-ID: <CALT56yPm6t4vkBfqjdY1WB5x=Z29vc1FXaUkNXM_j_hx_CU1aA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] piglit: add missing dependency on wayland
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 18:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203943

On Tue, 27 Aug 2024 at 12:37, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> After the recent piglit update it fails X11 builds reporting that it can
> not find wayland-client package. Add missing dependency.
>
> Fixes: 9662bdabf3f6 ("piglit: upgrade 22eaf6a91c -> c11c9374c1")
> Cc: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Gracious ping. See the build.log at
https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/dmitry.baryshkov/oebuilds/2lKYJUouynr7OoOtfUeOLDTDZYY

Relevant part of the failure log:

| -- Found OpenGL:
/oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot/usr/lib/libGL.so
| -- Checking for module 'waffle-1'
| --   Found waffle-1, version 1.8.1
| -- Checking for module 'gbm>=17.1'
| --   Found gbm, version 24.0.7
| -- Looking for gbm_bo_map
| -- Looking for gbm_bo_map - found
| -- Looking for gbm_bo_get_fd_for_plane
| -- Looking for gbm_bo_get_fd_for_plane - found
| -- Checking for module 'wayland-client'
| --   No package 'wayland-client' found
| -- Configuring incomplete, errors occurred!
| WARNING: exit code 1 from a shell command.
| CMake Error at
/oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:645
(message):
|   The following required packages were not found:
|
|    - wayland-client
|
| Call Stack (most recent call first):
|   /oe/build/tmp-rpb-glibc/work/armv8a-linaro-linux/piglit/1.0+gitr/recipe-sysroot-native/usr/share/cmake-3.30/Modules/FindPkgConfig.cmake:873
(_pkg_check_modules_internal)
|   CMakeLists.txt:196 (pkg_check_modules)
|
|
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Failed


> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index 3a2dec34d7e0..7cdd38d823cc 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
>  X11_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxrender libglu', '', d)}"
>  X11_RDEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos', '', d)}"
>
> -DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland-protocols"
> +DEPENDS = "libpng waffle libxkbcommon python3-mako-native python3-numpy-native python3-six-native virtual/egl wayland-native wayland wayland-protocols"
>
>  inherit cmake pkgconfig python3native features_check bash-completion



-- 
With best wishes
Dmitry

