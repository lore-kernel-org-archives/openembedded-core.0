Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EA2EE14D3
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:35:37 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.8414.1694075729937859828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 01:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id B053A1A52A
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Sep 2023 10:35:21 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.172.97]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qeATv-0pBqUK0; Thu, 7 Sep 2023 10:35:19 +0200
Date: Thu, 07 Sep 2023 10:35:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] mesa: add intel raytracing support to opencl
 build
To: openembedded-core@lists.openembedded.org
Message-Id: <R6XL0S.BLRN4TKQS4AW2@t-online.de>
In-Reply-To: <178290CD276EBA9F.9600@lists.openembedded.org>
References: <178290CD276EBA9F.9600@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-seEq8/0FywAp3F8VgHcS"
X-TOI-EXPURGATEID: 150726::1694075719-73FFC980-E39044E5/0/0 CLEAN NORMAL
X-TOI-MSGID: e7ddcccd-fe9b-4424-b8dd-5b003148249f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187363

--=-seEq8/0FywAp3F8VgHcS
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 adds mesa-native to DEPENDS only when needed

On Thu, Sep 7 2023 at 10:33:20 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Recently mesa added a patch that allows to cross-compile Intel Vulkan
> ray tracing support.
> 
> - Backport this patch
> - Build and install intel_clc for mesa-native
> - Add a dependency on mesa-native to provide intel_clc for target 
> build
> - Add a dependency on python3-ply-native as needed to build intel-clc
> - Automatically build Intel Vulkan ray tracing support if the opencl
>   packageconfig was added
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...llow-using-intel_clc-from-the-system.patch | 99 
> +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           | 15 ++-
>  2 files changed, 112 insertions(+), 2 deletions(-)
>  create mode 100644 
> meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
> 
> diff --git 
> a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch 
> b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
> new file mode 100644
> index 0000000000..5eefd02068
> --- /dev/null
> +++ 
> b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
> @@ -0,0 +1,99 @@
> +From ac503f5d7bf36f021c576029a64ac1a3199f6b5a Mon Sep 17 00:00:00 
> 2001
> +From: Matt Turner <mattst88@gmail.com <mailto:mattst88@gmail.com>>
> +Date: Thu, 31 Aug 2023 13:16:29 -0400
> +Subject: [PATCH] intel: Allow using intel_clc from the system
> +
> +With -Dintel-clc=system, the build system will search for an 
> `intel_clc`
> +binary and use it instead of building `intel_clc` itself.
> +
> +This allows Intel Vulkan ray tracing support to be built when cross
> +compiling without terrible hacks (that would otherwise be necessary 
> due
> +to `intel_clc`'s dependence on SPIRV-LLVM-Translator, libclc, clang, 
> and
> +LLVM).
> +
> +Part-of: 
> <<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24983>>
> +
> +Upstream-Status: Backport 
> [<https://gitlab.freedesktop.org/mesa/mesa/-/commit/28c1053c07c177854520f6283fa665f17618adb5>]
> +
> +---
> + meson.build                      | 6 +++---
> + meson_options.txt                | 5 ++++-
> + src/intel/compiler/meson.build   | 6 +++++-
> + src/intel/vulkan/grl/meson.build | 2 +-
> + 4 files changed, 13 insertions(+), 6 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 16e86ec..00a6953 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -259,12 +259,12 @@ endif
> +
> + with_microsoft_clc = get_option('microsoft-clc').enabled()
> + if ['x86_64'].contains(host_machine.cpu_family())
> +-  with_intel_clc = get_option('intel-clc').enabled()
> +-  with_intel_vk_rt = with_intel_vk and with_intel_clc
> ++  with_intel_clc = get_option('intel-clc') == 'enabled'
> + else
> +   with_intel_clc = false
> +-  with_intel_vk_rt = false
> + endif
> ++with_intel_vk_rt = with_intel_vk and get_option('intel-clc') != 
> 'disabled'
> ++
> + with_clc = with_microsoft_clc or with_intel_clc
> + with_libclc = with_clc
> + with_spirv_to_dxil = get_option('spirv-to-dxil')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 379aea3..9800531 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -607,9 +607,12 @@ option(
> +
> + option(
> +   'intel-clc',
> +-  type : 'feature',
> ++  type : 'combo',
> +   deprecated: {'true': 'enabled', 'false': 'disabled'},
> +   value : 'disabled',
> ++  choices : [
> ++    'enabled', 'disabled', 'system',
> ++  ],
> +   description : 'Build the intel-clc compiler (enables Vulkan Intel 
> ' +
> +                 'Ray Tracing on supported hardware).'
> + )
> +diff --git a/src/intel/compiler/meson.build 
> b/src/intel/compiler/meson.build
> +index 9a03d37..774e955 100644
> +--- a/src/intel/compiler/meson.build
> ++++ b/src/intel/compiler/meson.build
> +@@ -168,7 +168,10 @@ libintel_compiler = static_library(
> + )
> +
> + # For now this tool is only going to be used by Anv
> +-if with_intel_clc
> ++if get_option('intel-clc') == 'system'
> ++  prog_intel_clc = find_program('intel_clc', native : true)
> ++  dep_prog_intel_clc = []
> ++elif with_intel_clc
> +   prog_intel_clc = executable(
> +     'intel_clc',
> +     ['intel_clc.c'],
> +@@ -181,6 +184,7 @@ if with_intel_clc
> +     dependencies : [idep_nir, idep_clc, idep_mesautil, 
> idep_intel_dev],
> +     native : true,
> +   )
> ++  dep_prog_intel_clc = [prog_intel_clc]
> + endif
> +
> + if with_tests
> +diff --git a/src/intel/vulkan/grl/meson.build 
> b/src/intel/vulkan/grl/meson.build
> +index c0056b3..02a72f5 100644
> +--- a/src/intel/vulkan/grl/meson.build
> ++++ b/src/intel/vulkan/grl/meson.build
> +@@ -143,7 +143,7 @@ foreach t : [['125', 'gfx125', 'dg2']]
> +                                    # if fixed there
> +       ],
> +       env: ['MESA_SHADER_CACHE_DISABLE=true'],
> +-      depends : [prog_intel_clc]
> ++      depends : dep_prog_intel_clc
> +     )
> +   endforeach
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc 
> b/meta/recipes-graphics/mesa/mesa.inc
> index 79a1d975bf..83535eb472 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -18,6 +18,7 @@ SRC_URI = 
> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             
> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch 
> <file://0001-meson.build-check-for-all-linux-host_os-combinations.patch/> 
> \
>             
> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch 
> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>             file://0001-gallium-Fix-build-with-llvm-17.patch 
> <file://0001-gallium-fix-build-with-llvm-17.patch/> \
> +           
> file://0001-intel-Allow-using-intel_clc-from-the-system.patch 
> <file://0001-intel-allow-using-intel_clc-from-the-system.patch/> \
>             "
> 
>  SRC_URI[sha256sum] = 
> "2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162f8f7da18eea8aed9"
> @@ -35,6 +36,7 @@ do_install:append() {
>  }
> 
>  DEPENDS = "expat makedepend-native flex-native bison-native 
> libxml2-native zlib chrpath-replacement-native python3-mako-native 
> gettext-native"
> +DEPENDS:append:class-target = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', 
> 'mesa-native', '', d)}"
>  EXTRANATIVEPATH += "chrpath-native"
>  PROVIDES = " \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opengl', 
> 'virtual/libgl', '', d)} \
> @@ -72,6 +74,9 @@ EXTRA_OEMESON = " \
>      -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
>  "
> 
> +EXTRA_OEMESON:append:class-target = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', 
> '-Dintel-clc=system', '', d)}"
> +EXTRA_OEMESON:append:class-native = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', 
> '-Dintel-clc=enabled', '', d)}"
> +
>  def strip_comma(s):
>      return s.strip(',')
> 
> @@ -137,7 +142,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, 
> -Degl=disabled"
> 
>  # "opencl" requires libclc from meta-clang and spirv-tools from 
> OE-Core
>  OPENCL_NATIVE = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'freedreno', 
> '-Dopencl-native=true', '', d)}"
> -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true 
> ${OPENCL_NATIVE},-Dgallium-opencl=disabled 
> -Dopencl-spirv=false,libclc spirv-tools"
> +PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true 
> ${OPENCL_NATIVE},-Dgallium-opencl=disabled 
> -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
> 
>  PACKAGECONFIG[broadcom] = ""
>  PACKAGECONFIG[etnaviv] = ""
> @@ -181,7 +186,6 @@ PACKAGECONFIG[gallium] = 
> "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}
>  PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, 
> -Dllvm=disabled, llvm llvm-native elfutils"
>  PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
>  PACKAGECONFIG[va] = 
> "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
> -
>  PACKAGECONFIG[vdpau] = 
> "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
> 
>  PACKAGECONFIG[lima] = ""
> @@ -248,6 +252,13 @@ do_install:append () {
>      rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>  }
> 
> +do_install:append:class-native () {
> +    if ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'opencl', 'true', 
> 'false', d)}; then
> +        install -d ${D}${bindir}
> +        install -m0755 ${B}/src/intel/compiler/intel_clc 
> ${D}${bindir}
> +    fi
> +}
> +
>  # For the packages that make up the OpenGL interfaces, inject 
> variables so that
>  # they don't get Debian-renamed (which would remove the -mesa 
> suffix), and
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187362): 
> <https://lists.openembedded.org/g/openembedded-core/message/187362>
> Mute This Topic: <https://lists.openembedded.org/mt/101210696/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-seEq8/0FywAp3F8VgHcS
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 adds mesa-native to DEPENDS only when needed</div></div><div id="geary-quote" dir="auto"><br>On Thu, Sep 7 2023 at 10:33:20 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Recently mesa added a patch that allows to cross-compile Intel Vulkan
ray tracing support.

- Backport this patch
- Build and install intel_clc for mesa-native
- Add a dependency on mesa-native to provide intel_clc for target build
- Add a dependency on python3-ply-native as needed to build intel-clc
- Automatically build Intel Vulkan ray tracing support if the opencl
  packageconfig was added

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...llow-using-intel_clc-from-the-system.patch | 99 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 15 ++-
 2 files changed, 112 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
new file mode 100644
index 0000000000..5eefd02068
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
@@ -0,0 +1,99 @@
+From ac503f5d7bf36f021c576029a64ac1a3199f6b5a Mon Sep 17 00:00:00 2001
+From: Matt Turner &lt;<a href="mailto:mattst88@gmail.com">mattst88@gmail.com</a>&gt;
+Date: Thu, 31 Aug 2023 13:16:29 -0400
+Subject: [PATCH] intel: Allow using intel_clc from the system
+
+With -Dintel-clc=system, the build system will search for an `intel_clc`
+binary and use it instead of building `intel_clc` itself.
+
+This allows Intel Vulkan ray tracing support to be built when cross
+compiling without terrible hacks (that would otherwise be necessary due
+to `intel_clc`'s dependence on SPIRV-LLVM-Translator, libclc, clang, and
+LLVM).
+
+Part-of: &lt;<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24983">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24983</a>&gt;
+
+Upstream-Status: Backport [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/commit/28c1053c07c177854520f6283fa665f17618adb5">https://gitlab.freedesktop.org/mesa/mesa/-/commit/28c1053c07c177854520f6283fa665f17618adb5</a>]
+
+---
+ meson.build                      | 6 +++---
+ meson_options.txt                | 5 ++++-
+ src/intel/compiler/meson.build   | 6 +++++-
+ src/intel/vulkan/grl/meson.build | 2 +-
+ 4 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 16e86ec..00a6953 100644
+--- a/meson.build
++++ b/meson.build
+@@ -259,12 +259,12 @@ endif
+ 
+ with_microsoft_clc = get_option('microsoft-clc').enabled()
+ if ['x86_64'].contains(host_machine.cpu_family())
+-  with_intel_clc = get_option('intel-clc').enabled()
+-  with_intel_vk_rt = with_intel_vk and with_intel_clc
++  with_intel_clc = get_option('intel-clc') == 'enabled'
+ else
+   with_intel_clc = false
+-  with_intel_vk_rt = false
+ endif
++with_intel_vk_rt = with_intel_vk and get_option('intel-clc') != 'disabled'
++
+ with_clc = with_microsoft_clc or with_intel_clc
+ with_libclc = with_clc
+ with_spirv_to_dxil = get_option('spirv-to-dxil')
+diff --git a/meson_options.txt b/meson_options.txt
+index 379aea3..9800531 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -607,9 +607,12 @@ option(
+ 
+ option(
+   'intel-clc',
+-  type : 'feature',
++  type : 'combo',
+   deprecated: {'true': 'enabled', 'false': 'disabled'},
+   value : 'disabled',
++  choices : [
++    'enabled', 'disabled', 'system',
++  ],
+   description : 'Build the intel-clc compiler (enables Vulkan Intel ' +
+                 'Ray Tracing on supported hardware).'
+ )
+diff --git a/src/intel/compiler/meson.build b/src/intel/compiler/meson.build
+index 9a03d37..774e955 100644
+--- a/src/intel/compiler/meson.build
++++ b/src/intel/compiler/meson.build
+@@ -168,7 +168,10 @@ libintel_compiler = static_library(
+ )
+ 
+ # For now this tool is only going to be used by Anv
+-if with_intel_clc
++if get_option('intel-clc') == 'system'
++  prog_intel_clc = find_program('intel_clc', native : true)
++  dep_prog_intel_clc = []
++elif with_intel_clc
+   prog_intel_clc = executable(
+     'intel_clc',
+     ['intel_clc.c'],
+@@ -181,6 +184,7 @@ if with_intel_clc
+     dependencies : [idep_nir, idep_clc, idep_mesautil, idep_intel_dev],
+     native : true,
+   )
++  dep_prog_intel_clc = [prog_intel_clc]
+ endif
+ 
+ if with_tests
+diff --git a/src/intel/vulkan/grl/meson.build b/src/intel/vulkan/grl/meson.build
+index c0056b3..02a72f5 100644
+--- a/src/intel/vulkan/grl/meson.build
++++ b/src/intel/vulkan/grl/meson.build
+@@ -143,7 +143,7 @@ foreach t : [['125', 'gfx125', 'dg2']]
+                                    # if fixed there
+       ],
+       env: ['MESA_SHADER_CACHE_DISABLE=true'],
+-      depends : [prog_intel_clc]
++      depends : dep_prog_intel_clc
+     )
+   endforeach
+ 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 79a1d975bf..83535eb472 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            <a href="file://0001-meson.build-check-for-all-linux-host_os-combinations.patch">file://0001-meson.build-check-for-all-linux-host_os-combinations.patch</a> \
            <a href="file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch</a> \
            <a href="file://0001-gallium-Fix-build-with-llvm-17.patch">file://0001-gallium-Fix-build-with-llvm-17.patch</a> \
+           <a href="file://0001-intel-Allow-using-intel_clc-from-the-system.patch">file://0001-intel-Allow-using-intel_clc-from-the-system.patch</a> \
            "
 
 SRC_URI[sha256sum] = "2f6d7381bc10fbd2d6263ad1022785b8b511046c1a904162f8f7da18eea8aed9"
@@ -35,6 +36,7 @@ do_install:append() {
 }
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+DEPENDS:append:class-target = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}"
 EXTRANATIVEPATH += "chrpath-native"
 PROVIDES = " \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
@@ -72,6 +74,9 @@ EXTRA_OEMESON = " \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
 
+EXTRA_OEMESON:append:class-target = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', '-Dintel-clc=system', '', d)}"
+EXTRA_OEMESON:append:class-native = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', '-Dintel-clc=enabled', '', d)}"
+
 def strip_comma(s):
     return s.strip(',')
 
@@ -137,7 +142,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
 OPENCL_NATIVE = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
@@ -181,7 +186,6 @@ PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[lima] = ""
@@ -248,6 +252,13 @@ do_install:append () {
     rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
 }
 
+do_install:append:class-native () {
+    if <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'opencl', 'true', 'false', d)}; then
+        install -d ${D}${bindir}
+        install -m0755 ${B}/src/intel/compiler/intel_clc ${D}${bindir}
+    fi
+}
+
 # For the packages that make up the OpenGL interfaces, inject variables so that
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#187362): <a href="https://lists.openembedded.org/g/openembedded-core/message/187362">https://lists.openembedded.org/g/openembedded-core/message/187362</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/101210696/3618223">https://lists.openembedded.org/mt/101210696/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-seEq8/0FywAp3F8VgHcS--


