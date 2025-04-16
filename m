Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79515C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 22:17:57 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.web10.32675.1744841875581607670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 15:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZdFlP5pHWzsd0;
	Thu, 17 Apr 2025 00:17:53 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZdFlN6hjRzxNM;
	Thu, 17 Apr 2025 00:17:52 +0200 (CEST)
Date: Thu, 17 Apr 2025 00:17:53 +0200
From: Quentin Schulz <foss+yocto@0leil.net>
To: Khem Raj <raj.khem@gmail.com>
CC: openembedded-core@lists.openembedded.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v2] mesa: enable PanVK
In-Reply-To: <CAMKF1sopdTzeH0Hchq0kL4xbqc1dhwQVKoZTgeE0BAoHDxOcaQ@mail.gmail.com>
References: <20250415-mesa-panvk-v2-1-9cb969d64cd8@cherry.de> <CAMKF1sopdTzeH0Hchq0kL4xbqc1dhwQVKoZTgeE0BAoHDxOcaQ@mail.gmail.com>
Message-ID: <031DC160-E18E-4F9B-865B-09E0B48521B3@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 22:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215020

Hi Khem,

On April 16, 2025 10:17:10 PM GMT+02:00, Khem Raj <raj=2Ekhem@gmail=2Ecom>=
 wrote:
>On Tue, Apr 15, 2025 at 7:15=E2=80=AFAM Quentin Schulz via
>lists=2Eopenembedded=2Eorg <foss=3D0leil=2Enet@lists=2Eopenembedded=2Eorg=
> wrote:
>>
>> From: Quentin Schulz <quentin=2Eschulz@cherry=2Ede>
>>
>> If panfrost is enabled, we currently build panfrost tools and the
>> gallium driver=2E There's also a vulkan driver available for panfrost, =
so
>> let's enable it as well whenever panfrost PACKAGECONFIG is enabled,
>> similarly to how it's done for the gallium driver=2E
>>
>> PanVK is the "commercial" name for the vulkan driver for panfrost but
>> it's enabled under the panfrost name in meson=2E
>>
>> This was "tested" with `vkgears -info` with mesa-demos from commit
>> 11939e1697b894be3c68a89e3ea86fc51a320836 on an RK3588-based system=2E
>>
>> Signed-off-by: Quentin Schulz <quentin=2Eschulz@cherry=2Ede>
>> ---
>> Just stumbled upon PanVK yesterday[1] so wondered how to make this work=
=2E
>>
>> Sadly, vkgears from mesa-demos 9=2E0=2E0 doesn't seem to work well:
>>
>> root@jaguar:~# vkgears -info
>> xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
>> Segmentation fault
>>
>> But I've bumped it to the latest commit in main branch with the
>> following:
>>
>> """
>>  diff --git a/meta/recipes-graphics/mesa/mesa-demos_9=2E0=2E0=2Ebb b/me=
ta/recipes-graphics/mesa/mesa-demos_git=2Ebb
>>  similarity index 84%
>>  rename from meta/recipes-graphics/mesa/mesa-demos_9=2E0=2E0=2Ebb
>>  rename to meta/recipes-graphics/mesa/mesa-demos_git=2Ebb
>>  index 0301b55361=2E=2E99dc298389 100644
>>  --- a/meta/recipes-graphics/mesa/mesa-demos_9=2E0=2E0=2Ebb
>>  +++ b/meta/recipes-graphics/mesa/mesa-demos_git=2Ebb
>>  @@ -6,12 +6,15 @@ BUGTRACKER =3D "https://bugs=2Efreedesktop=2Eorg"
>>   SECTION =3D "x11"
>>
>>   LICENSE =3D "MIT & PD"
>>  -LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears=2Ec;beginline=3D1;en=
dline=3D20;md5=3D914225785450eff644a86c871d3ae00e \
>>  +LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears=2Ec;beginline=3D1;en=
dline=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae \
>>                       file://src/xdemos/glxdemo=2Ec;beginline=3D1;endli=
ne=3D8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
>
>What changed here ?
>

Trailing whitespaces removed=2E

>>
>>  -SRC_URI =3D "https://archive=2Emesa3d=2Eorg/demos/${BPN}-${PV}=2Etar=
=2Exz \
>>  -           "
>>  -SRC_URI[sha256sum] =3D "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed95=
2329cdff1e9f1ed496b"
>>  +SRC_URI =3D "git://gitlab=2Efreedesktop=2Eorg/mesa/demos=2Egit;branch=
=3Dmain;protocol=3Dhttps"
>>  +SRCREV =3D "11939e1697b894be3c68a89e3ea86fc51a320836"
>>  +
>>  +PV =3D "9=2E0=2E0+"
>
>maybe +git is better instead of plain +
>

I was convinced this was now unneeded as + is all we needed to have to tri=
gger the mechanism=2E I swear I reviewed a patch like that for the docs but=
 I don't see in it in the docs =F0=9F=A4=94

In any case, unrelated to the mesa PanVK patch :)

The last release of mesa-demos was quite a while ago and there's been a fe=
w tens of patches since=2E No clue if it makes sense to bump to its latest =
commit or not (I've seen backports on the ML recently so maybe that's prefe=
rred?)=2E I just wanted something quick =C3=A0-la kmscube to test vulkan bu=
t nothing actually worked decently with my minimal image (vkgears doesn't s=
how anything and vkcube on KMS also doesn't work)=2E I could try to setup s=
ome Weston and see if I have more success but that is very low on my to-do =
and interest list=2E

Cheers,
Quentin

>>  +
>>  +S =3D "${WORKDIR}/git"
>>
>>   inherit meson pkgconfig features_check
>>   # depends on virtual/egl, virtual/libgl =2E=2E=2E
>>  @@ -28,7 +31,7 @@ PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=
=3Ddisabled,libdrm"
>>   PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
>>   PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtua=
l/libgles1"
>>   PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtua=
l/libgles2"
>>  -PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},,free=
glut"
>>  +PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR} -Dglu=
t=3Denabled,-Dglut=3Ddisabled,freeglut"
>>   PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
>>   PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vul=
kan-loader glslang-native"
>>   PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,=
virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdeco=
r"
>> """
>>
>> and while I have not managed to make vkgears show something with my
>> minimal image on an RK3588 system, `vkgears -info` shows:
>>
>> root@jaguar:~# vkgears -info
>> xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
>> WARNING: panvk is not a conformant Vulkan implementation, testing use o=
nly=2E
>> apiVersion       =3D 1=2E1=2E305
>> driverVersion    =3D 6400002
>> vendorID         =3D 13b5
>> deviceID         =3D a8670000
>> deviceType       =3D integrated GPU
>> deviceName       =3D Mali-G610
>> deviceExtensions =3D
>>         VK_KHR_8bit_storage
>>         VK_KHR_16bit_storage
>>         VK_KHR_bind_memory2
>>         VK_KHR_buffer_device_address
>>         VK_KHR_copy_commands2
>>         VK_KHR_create_renderpass2
>>         VK_KHR_dedicated_allocation
>>         VK_KHR_descriptor_update_template
>>         VK_KHR_device_group
>>         VK_KHR_driver_properties
>>         VK_KHR_dynamic_rendering
>>         VK_KHR_external_fence
>>         VK_KHR_external_fence_fd
>>         VK_KHR_external_memory
>>         VK_KHR_external_memory_fd
>>         VK_KHR_external_semaphore
>>         VK_KHR_external_semaphore_fd
>>         VK_KHR_get_memory_requirements2
>>         VK_KHR_global_priority
>>         VK_KHR_image_format_list
>>         VK_KHR_index_type_uint8
>>         VK_KHR_maintenance1
>>         VK_KHR_maintenance2
>>         VK_KHR_maintenance3
>>         VK_KHR_map_memory2
>>         VK_KHR_multiview
>>         VK_KHR_pipeline_executable_properties
>>         VK_KHR_pipeline_library
>>         VK_KHR_push_descriptor
>>         VK_KHR_relaxed_block_layout
>>         VK_KHR_sampler_mirror_clamp_to_edge
>>         VK_KHR_shader_draw_parameters
>>         VK_KHR_shader_expect_assume
>>         VK_KHR_shader_float16_int8
>>         VK_KHR_shader_non_semantic_info
>>         VK_KHR_shader_relaxed_extended_instruction
>>         VK_KHR_shader_subgroup_rotate
>>         VK_KHR_storage_buffer_storage_class
>>         VK_KHR_swapchain
>>         VK_KHR_synchronization2
>>         VK_KHR_timeline_semaphore
>>         VK_KHR_variable_pointers
>>         VK_KHR_vertex_attribute_divisor
>>         VK_KHR_zero_initialize_workgroup_memory
>>         VK_EXT_4444_formats
>>         VK_EXT_buffer_device_address
>>         VK_EXT_custom_border_color
>>         VK_EXT_depth_clip_enable
>>         VK_EXT_external_memory_dma_buf
>>         VK_EXT_global_priority
>>         VK_EXT_global_priority_query
>>         VK_EXT_graphics_pipeline_library
>>         VK_EXT_host_query_reset
>>         VK_EXT_image_drm_format_modifier
>>         VK_EXT_image_robustness
>>         VK_EXT_index_type_uint8
>>         VK_EXT_physical_device_drm
>>         VK_EXT_pipeline_creation_cache_control
>>         VK_EXT_pipeline_creation_feedback
>>         VK_EXT_pipeline_robustness
>>         VK_EXT_private_data
>>         VK_EXT_provoking_vertex
>>         VK_EXT_queue_family_foreign
>>         VK_EXT_sampler_filter_minmax
>>         VK_EXT_scalar_block_layout
>>         VK_EXT_shader_module_identifier
>>         VK_EXT_subgroup_size_control
>>         VK_EXT_tooling_info
>>         VK_GOOGLE_decorate_string
>>         VK_GOOGLE_hlsl_functionality1
>>         VK_GOOGLE_user_type
>> Vulkan not supported on given XCB surface
>> Failed to create surface!
>>
>> So I guess this is good enough for starters?
>>
>> [1] https://www=2Ecollabora=2Ecom/news-and-blog/news-and-events/panvk-i=
s-officially-vulkan-11-conformant=2Ehtml
>> ---
>> Changes in v2:
>> - removed mesa-demos patch which should have never made it in the first
>>   place,
>> - Link to v1: https://lore=2Ekernel=2Eorg/r/20250415-mesa-panvk-v1-1-39=
592671ef11@cherry=2Ede
>> ---
>>  meta/recipes-graphics/mesa/mesa=2Einc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa=2Einc b/meta/recipes-graph=
ics/mesa/mesa=2Einc
>> index aca34983e97ca684d662987d3a1d0b61ba44029a=2E=2E0163d96a36a5e8eb016=
ddbe2b645d6bcaba71179 100644
>> --- a/meta/recipes-graphics/mesa/mesa=2Einc
>> +++ b/meta/recipes-graphics/mesa/mesa=2Einc
>> @@ -119,6 +119,7 @@ VULKAN_DRIVERS:append =3D "${@bb=2Eutils=2Econtains=
('PACKAGECONFIG', 'freedreno', ',fr
>>  VULKAN_DRIVERS:append =3D "${@bb=2Eutils=2Econtains('PACKAGECONFIG', '=
broadcom', ',broadcom', '', d)}"
>>  VULKAN_DRIVERS:append =3D "${@bb=2Eutils=2Econtains('PACKAGECONFIG', '=
gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
>>  VULKAN_DRIVERS:append =3D "${@bb=2Eutils=2Econtains('PACKAGECONFIG', '=
imagination', ',imagination-experimental', '', d)}"
>> +VULKAN_DRIVERS:append =3D "${@bb=2Eutils=2Econtains('PACKAGECONFIG', '=
panfrost', ',panfrost', '', d)}"
>>  PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN=
_DRIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-hea=
ders"
>>
>>  # mesa development and testing tools support, per driver
>>
>> ---
>> base-commit: 122e9a49614b2ddedaae1d90c06004a7a4c43998
>> change-id: 20250415-mesa-panvk-7039f4060425
>>
>> Best regards,
>> --
>> Quentin Schulz <quentin=2Eschulz@cherry=2Ede>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group=2E
>> View/Reply Online (#214947): https://lists=2Eopenembedded=2Eorg/g/opene=
mbedded-core/message/214947
>> Mute This Topic: https://lists=2Eopenembedded=2Eorg/mt/112276882/199791=
4
>> Group Owner: openembedded-core+owner@lists=2Eopenembedded=2Eorg
>> Unsubscribe: https://lists=2Eopenembedded=2Eorg/g/openembedded-core/uns=
ub [raj=2Ekhem@gmail=2Ecom]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

