Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E137BC369C7
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:17:46 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.29685.1744834658292202878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kx5d+Vmb;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6044db51b5bso6547eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744834657; x=1745439457; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsiC3tfR9nt5pO80cLv2qU1XwJdPQkOW/LduG0Hz8VU=;
        b=kx5d+Vmbiu+C7Y4oqoL3qXuqYt5dsgkdB8b4pQxZJBq4cdiGf2/jUPpMMQ5h/+Dcxc
         eb5Nc0tVIIg5lRbHguqfkGehBdb/eqtUIfih9z/gXJZf61UGDkwGgpcbyzoiCO6Enfzg
         fr9GX6rkvAzshZVo9/9ESLJbKyH+kC0Zwj8X1V4MYM3WycmGnKAtM9B1Erotrv+XA+19
         Roi3SzavEJYRhJKqc3z932BMQd4Ankeckj9NPjTIjvL6hHFffGcBLcovpLnxy+CLG5aw
         t6s3SlpJvUvZ8dmP+mgGWzoHddgTdIeOUOYF1XPFlNq4lj524oIpR9Y550Ng1ssKDaR2
         5m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834657; x=1745439457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsiC3tfR9nt5pO80cLv2qU1XwJdPQkOW/LduG0Hz8VU=;
        b=WS5v+zvSIWUKm7zeqs0L2i2pB6ntZ5/KjUXwEJcp3S49IIHNiJnJrmA0G4EIegal5D
         T52sAAmB6Yg91EWLhs01jjEd/jj3nwuCzUJ2ZXFf97K0Mi0mMG6XARrpDkxTjsianxqM
         XrlYIf4B6s5QqKMjTGYerrHwt3xyulsuYjLble9dC8pIQ78y3JOgE0fzQPAT7lt6Sk+z
         Oj6uVgMvfVvzkm7p6FEWPWM/9JW37LYyNdrYn/tbXWwSwLAj2EM/JjAAcrdE3WlZdGT9
         LooW8uAnSKyIXZDJPGJ6TDtE3CWKqY8WEXzyl8AI3drlvkPrMDJfmjCBWwjQ4IvEDm1P
         uu5w==
X-Gm-Message-State: AOJu0YwAa6ksuPKyNfWrkNQ2GyxxDF0Pae5F1aFaS9Zx9SFMB8WR9ZD7
	hohVDGDQ2Wy9Wz8uM6g7q8QgbS4oSuhbc4lzbNCAKlD4Isyyug+ZuXZfkXCeYUVS1T4sHVSraBS
	s6ZZWFkrIH9fXA3dQtJR3grMHB6srhP+M
X-Gm-Gg: ASbGnctx9JOV+pc64RwJrJLjFnM53uKRe5Y87iFJFwiM7j49/TTiAFPj+J5VnsqR7IN
	bQxjC7p3CDB2sz9X96NTj6LpTmCm7USw9//lkDtLFEvfvu89y2F64HCBnVaahBaMKkm235C5Dxd
	fQKRgPfFXHGIybSp5AYCR9bVxrm5ngwf6MDfo8/kR9qIOW2j6VfYvNwl70A8G3KQ==
X-Google-Smtp-Source: AGHT+IHKcTHrenWiHl+P2q0T14DSHpDhsp7ppio4UR7C0nzKjwXl1YPtDqWRNgDvNDKP43woOA5DpJ4m0wnyHogz6w8=
X-Received: by 2002:a05:6820:174d:b0:604:2b3:2c9b with SMTP id
 006d021491bc7-604a92a7f1amr2082354eaf.4.1744834657361; Wed, 16 Apr 2025
 13:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-mesa-panvk-v2-1-9cb969d64cd8@cherry.de>
In-Reply-To: <20250415-mesa-panvk-v2-1-9cb969d64cd8@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 13:17:10 -0700
X-Gm-Features: ATxdqUFpFFJ1mPnjWXr_vDIECknWcEROhcSs9gTBFsc8nQvYMP3J3kLI7ush6L4
Message-ID: <CAMKF1sopdTzeH0Hchq0kL4xbqc1dhwQVKoZTgeE0BAoHDxOcaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: enable PanVK
To: foss@0leil.net
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215015

On Tue, Apr 15, 2025 at 7:15=E2=80=AFAM Quentin Schulz via
lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
>
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> If panfrost is enabled, we currently build panfrost tools and the
> gallium driver. There's also a vulkan driver available for panfrost, so
> let's enable it as well whenever panfrost PACKAGECONFIG is enabled,
> similarly to how it's done for the gallium driver.
>
> PanVK is the "commercial" name for the vulkan driver for panfrost but
> it's enabled under the panfrost name in meson.
>
> This was "tested" with `vkgears -info` with mesa-demos from commit
> 11939e1697b894be3c68a89e3ea86fc51a320836 on an RK3588-based system.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Just stumbled upon PanVK yesterday[1] so wondered how to make this work.
>
> Sadly, vkgears from mesa-demos 9.0.0 doesn't seem to work well:
>
> root@jaguar:~# vkgears -info
> xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
> Segmentation fault
>
> But I've bumped it to the latest commit in main branch with the
> following:
>
> """
>  diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recip=
es-graphics/mesa/mesa-demos_git.bb
>  similarity index 84%
>  rename from meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
>  rename to meta/recipes-graphics/mesa/mesa-demos_git.bb
>  index 0301b55361..99dc298389 100644
>  --- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
>  +++ b/meta/recipes-graphics/mesa/mesa-demos_git.bb
>  @@ -6,12 +6,15 @@ BUGTRACKER =3D "https://bugs.freedesktop.org"
>   SECTION =3D "x11"
>
>   LICENSE =3D "MIT & PD"
>  -LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endlin=
e=3D20;md5=3D914225785450eff644a86c871d3ae00e \
>  +LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endlin=
e=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae \
>                       file://src/xdemos/glxdemo.c;beginline=3D1;endline=
=3D8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"

What changed here ?

>
>  -SRC_URI =3D "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
>  -           "
>  -SRC_URI[sha256sum] =3D "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed9523=
29cdff1e9f1ed496b"
>  +SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;branch=3Dmain;=
protocol=3Dhttps"
>  +SRCREV =3D "11939e1697b894be3c68a89e3ea86fc51a320836"
>  +
>  +PV =3D "9.0.0+"

maybe +git is better instead of plain +

>  +
>  +S =3D "${WORKDIR}/git"
>
>   inherit meson pkgconfig features_check
>   # depends on virtual/egl, virtual/libgl ...
>  @@ -28,7 +31,7 @@ PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3D=
disabled,libdrm"
>   PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
>   PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/=
libgles1"
>   PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/=
libgles2"
>  -PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},,freegl=
ut"
>  +PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR} -Dglut=
=3Denabled,-Dglut=3Ddisabled,freeglut"
>   PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
>   PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader glslang-native"
>   PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,vi=
rtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
> """
>
> and while I have not managed to make vkgears show something with my
> minimal image on an RK3588 system, `vkgears -info` shows:
>
> root@jaguar:~# vkgears -info
> xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
> WARNING: panvk is not a conformant Vulkan implementation, testing use onl=
y.
> apiVersion       =3D 1.1.305
> driverVersion    =3D 6400002
> vendorID         =3D 13b5
> deviceID         =3D a8670000
> deviceType       =3D integrated GPU
> deviceName       =3D Mali-G610
> deviceExtensions =3D
>         VK_KHR_8bit_storage
>         VK_KHR_16bit_storage
>         VK_KHR_bind_memory2
>         VK_KHR_buffer_device_address
>         VK_KHR_copy_commands2
>         VK_KHR_create_renderpass2
>         VK_KHR_dedicated_allocation
>         VK_KHR_descriptor_update_template
>         VK_KHR_device_group
>         VK_KHR_driver_properties
>         VK_KHR_dynamic_rendering
>         VK_KHR_external_fence
>         VK_KHR_external_fence_fd
>         VK_KHR_external_memory
>         VK_KHR_external_memory_fd
>         VK_KHR_external_semaphore
>         VK_KHR_external_semaphore_fd
>         VK_KHR_get_memory_requirements2
>         VK_KHR_global_priority
>         VK_KHR_image_format_list
>         VK_KHR_index_type_uint8
>         VK_KHR_maintenance1
>         VK_KHR_maintenance2
>         VK_KHR_maintenance3
>         VK_KHR_map_memory2
>         VK_KHR_multiview
>         VK_KHR_pipeline_executable_properties
>         VK_KHR_pipeline_library
>         VK_KHR_push_descriptor
>         VK_KHR_relaxed_block_layout
>         VK_KHR_sampler_mirror_clamp_to_edge
>         VK_KHR_shader_draw_parameters
>         VK_KHR_shader_expect_assume
>         VK_KHR_shader_float16_int8
>         VK_KHR_shader_non_semantic_info
>         VK_KHR_shader_relaxed_extended_instruction
>         VK_KHR_shader_subgroup_rotate
>         VK_KHR_storage_buffer_storage_class
>         VK_KHR_swapchain
>         VK_KHR_synchronization2
>         VK_KHR_timeline_semaphore
>         VK_KHR_variable_pointers
>         VK_KHR_vertex_attribute_divisor
>         VK_KHR_zero_initialize_workgroup_memory
>         VK_EXT_4444_formats
>         VK_EXT_buffer_device_address
>         VK_EXT_custom_border_color
>         VK_EXT_depth_clip_enable
>         VK_EXT_external_memory_dma_buf
>         VK_EXT_global_priority
>         VK_EXT_global_priority_query
>         VK_EXT_graphics_pipeline_library
>         VK_EXT_host_query_reset
>         VK_EXT_image_drm_format_modifier
>         VK_EXT_image_robustness
>         VK_EXT_index_type_uint8
>         VK_EXT_physical_device_drm
>         VK_EXT_pipeline_creation_cache_control
>         VK_EXT_pipeline_creation_feedback
>         VK_EXT_pipeline_robustness
>         VK_EXT_private_data
>         VK_EXT_provoking_vertex
>         VK_EXT_queue_family_foreign
>         VK_EXT_sampler_filter_minmax
>         VK_EXT_scalar_block_layout
>         VK_EXT_shader_module_identifier
>         VK_EXT_subgroup_size_control
>         VK_EXT_tooling_info
>         VK_GOOGLE_decorate_string
>         VK_GOOGLE_hlsl_functionality1
>         VK_GOOGLE_user_type
> Vulkan not supported on given XCB surface
> Failed to create surface!
>
> So I guess this is good enough for starters?
>
> [1] https://www.collabora.com/news-and-blog/news-and-events/panvk-is-offi=
cially-vulkan-11-conformant.html
> ---
> Changes in v2:
> - removed mesa-demos patch which should have never made it in the first
>   place,
> - Link to v1: https://lore.kernel.org/r/20250415-mesa-panvk-v1-1-39592671=
ef11@cherry.de
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index aca34983e97ca684d662987d3a1d0b61ba44029a..0163d96a36a5e8eb016ddbe2b=
645d6bcaba71179 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -119,6 +119,7 @@ VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'freedreno', ',fr
>  VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'broadc=
om', ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
>  VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagin=
ation', ',imagination-experimental', '', d)}"
> +VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st', ',panfrost', '', d)}"
>  PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-heade=
rs"
>
>  # mesa development and testing tools support, per driver
>
> ---
> base-commit: 122e9a49614b2ddedaae1d90c06004a7a4c43998
> change-id: 20250415-mesa-panvk-7039f4060425
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214947): https://lists.openembedded.org/g/openembedde=
d-core/message/214947
> Mute This Topic: https://lists.openembedded.org/mt/112276882/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

