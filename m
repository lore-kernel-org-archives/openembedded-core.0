Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD44D10DDC
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 09:12:58 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.170497.1733130774056420124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 01:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGGgzvq9;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f1d2487b95so1414279eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 01:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733130773; x=1733735573; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9R7lgPLW5IyMrWTCRp+ioWy7bY3ohAAyWKl2oLyOb4M=;
        b=HGGgzvq9y/5Y9dKiYcVKhCuXs+ZNI6vfNCJLpAcuTv/Yci4z9UvxyNmZh/c2TL9fIT
         PpiOP46bV/CYVEYPRyr6CkdvlsyJFtgmkLbL8p9aYZvybksC5VznlbSClBJipzG1uFTV
         cBNWM3MZApPEFz/dIt3BeeU723vvmfT2cL2PGtXRkvEFTU+GPfZ/a2ocP2ZmJb478v1q
         26IpYs3Veto87C3diqL33AaRV1uv6SkYU2aUF1CRLOjSS9Oqt7OfEQyjEJf3FMTw4dvm
         X9imdtra/fVDcIQTpyevW7bIZ/J3Zq6g00AbZczRp3jU7jBcoxduhmrKX1nmfCSjpJlp
         IqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130773; x=1733735573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9R7lgPLW5IyMrWTCRp+ioWy7bY3ohAAyWKl2oLyOb4M=;
        b=I5+GuvVQDyd8p34xMPyVCpZ0gjiTH2tMvCkIHtvhS7DWNvb1sb+PdV5vcSQFTP74xw
         fvu12rZhONZGxSXQh7Q07c1IYDO/gmj9O9Bq/TL+zBe6o4sDIvHphw7NDaRbgBlmVx3d
         2AFNg09fNncnTTILDCnFPsuxZJy/+g5JRFMHxM6uAnJWvuKHNk9PLdPO5C0TS/Hysf1N
         JBKEKN1hjryiZoa4VUaglwFCwjRDkwFaUwieWgKN+DyGmUzbvQSlMbcPJ3E/K4q6MLsi
         xVT+ka6JLinEa+/PLyOMpI6pcSlVDgNPViAYgbLGAg7WPcb6lydVl50T5ZIcMtgNMztQ
         20Cw==
X-Gm-Message-State: AOJu0YxSN/q5QnzC9hfzAO+P21bCPmRYHlc86hESQGYyo+wQcvthUSdi
	c/qfoOH8mu/eq+UkCorR9985Huhif4IWV5zyuUV3tHQSdxBcJnNHp6MeNYLQp3hASs42nLxac2Y
	YAZL0Umjg2TuojqlNB3cbU0B6jCE=
X-Gm-Gg: ASbGncufUV7ZTKyQcA9Zt0oXrJoFrooGhKxSEAW8YKtdaYmChX3kVurO9bJlCN9ALkp
	2Tg3Njdbfc0T9FpzkESggvYjVgEjsyFvshY+x/TqtcVeNwbFRkjQ8j5sG2j2a2iX8sA==
X-Google-Smtp-Source: AGHT+IGJinlV/vS/GCNkphF5y4xRfc2J0bJzXKBIuKIr2zHdlbKP05WKByC0Emog8K/1B5d3mq4s+7v3bRW4vJ/T49k=
X-Received: by 2002:a05:6359:4c99:b0:1ca:a437:3316 with SMTP id
 e5c5f4694b2df-1cab16885d0mr705822455d.17.1733130773096; Mon, 02 Dec 2024
 01:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20241130231331.3884926-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20241130231331.3884926-1-dmitry.baryshkov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2024 10:12:42 +0100
Message-ID: <CANNYZj-aPGrDCQjzjdXssBThAtnPqdpeZbKdAWijeUDz_Wjrow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] piglit: update the patch to fix building the
 test without wayland
To: dbaryshkov@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 09:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208130

Adding to someone else's patch means the 'submitted' upstream-status
is no longer valid. Please open a new pull request upstream and adjust
the status to point to that.

Alex

On Sun, 1 Dec 2024 at 00:13, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> Fix the following error appearing if building on a pure-X11 distros:
>
> <PATH>/git/tests/egl/egl-wayland.c:29:10: fatal error: wayland-client.h: No such file or directory
>    29 | #include <wayland-client.h>
>       |          ^~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  ...ake-egl_ext_surface_compression-cond.patch | 56 +++++++++++++------
>  1 file changed, 39 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
> index 47f8b03961c6..69cc302912e7 100644
> --- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
> +++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
> @@ -11,23 +11,45 @@ Otherwise, this error occurs:
>  |       |          ^~~~~~~~~~~~
>
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/974]
> +Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>  ---
> - tests/egl/spec/CMakeLists.txt | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> + .../spec/egl_ext_surface_compression/CMakeLists.gles3.txt   | 6 ++++--
> + tests/egl/spec/egl_ext_surface_compression/create_surface.c | 1 -
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
> +index d9540bcfde27..01a70164f444 100644
> +--- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
> ++++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
> +@@ -2,10 +2,12 @@ link_libraries(
> +       piglitutil_${piglit_target_api}
> + )
> +
> +-piglit_add_executable(egl_ext_surface_compression-create ../../egl-util.c
> ++if (PIGLIT_HAS_WAYLAND)
> ++piglit_add_executable(egl_ext_surface_compression-create
> +       ../../egl-wayland.c create_surface.c)
> ++endif (PIGLIT_HAS_WAYLAND)
> +
> +-piglit_add_executable(egl_ext_surface_compression-image ../../egl-util.c
> ++piglit_add_executable(egl_ext_surface_compression-image
> +       image_storage.c)
> +
> + # vim: ft=cmake:
> +diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
> +index e3d55d4331fb..35f13fd007b4 100644
> +--- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
> ++++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
> +@@ -25,7 +25,6 @@
> + #include "piglit-util.h"
> + #include "piglit-util-egl.h"
> + #include "piglit-util-gl.h"
> +-#include "../../egl-util.h"
> + #include "../../egl-wayland.h"
> +
> + static enum piglit_result
> +--
> +2.39.5
>
> -diff --git a/tests/egl/spec/CMakeLists.txt b/tests/egl/spec/CMakeLists.txt
> -index 33c504978..1dea6d8fc 100644
> ---- a/tests/egl/spec/CMakeLists.txt
> -+++ b/tests/egl/spec/CMakeLists.txt
> -@@ -7,7 +7,9 @@ add_subdirectory (egl_ext_device_drm)
> - add_subdirectory (egl_ext_platform_device)
> - add_subdirectory (egl_ext_image_dma_buf_import_modifiers)
> - add_subdirectory (egl_ext_protected_content)
> --add_subdirectory (egl_ext_surface_compression)
> -+if (PIGLIT_HAS_X11)
> -+      add_subdirectory (egl_ext_surface_compression)
> -+endif (PIGLIT_HAS_X11)
> - add_subdirectory (egl_khr_create_context)
> - add_subdirectory (egl_khr_display_reference)
> - add_subdirectory (egl_khr_get_all_proc_addresses)
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208048): https://lists.openembedded.org/g/openembedded-core/message/208048
> Mute This Topic: https://lists.openembedded.org/mt/109854509/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

