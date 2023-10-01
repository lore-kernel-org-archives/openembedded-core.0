Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1862E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 17:26:36 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.63864.1696181194998040690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 10:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 2C1AC49FE4
	for <openembedded-core@lists.openembedded.org>; Sun,  1 Oct 2023 19:26:33 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.227.184]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qn0D6-29nOO80; Sun, 1 Oct 2023 19:26:28 +0200
Date: Sun, 01 Oct 2023 19:26:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] mesa: Upgrade 23.1.8 -> 23.2.1
To: openembedded-core@lists.openembedded.org
Message-Id: <2S1V1S.MW4LV6CN14H61@t-online.de>
In-Reply-To: <178A0BB62928A76C.9230@lists.openembedded.org>
References: <178A0BB62928A76C.9230@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-SQagK8AIMhThClZC5L9k"
X-TOI-EXPURGATEID: 150726::1696181188-3FFFCD65-7D36BA6A/0/0 CLEAN NORMAL
X-TOI-MSGID: aee0ca9c-4d2b-4424-8689-3b54fc2a9858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 17:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188515

--=-SQagK8AIMhThClZC5L9k
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 adds some references related to the llvm-17 issue

On Sun, Oct 1 2023 at 07:24:36 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - update 0001-gallium-Fix-build-with-llvm-17.patch
> - remove as added upstream:
> 0001-intel-Allow-using-intel_clc-from-the-system.patch
> - intel clc build is currently broken with llvm 17, but that issue is 
> also
> present
>   with mesa 23.1.8
> 
> <https://gitlab.freedesktop.org/mesa/mesa/-/issues/9701>
> <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24879>
> <https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/2153>
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../0001-gallium-Fix-build-with-llvm-17.patch | 19 ++--
>  ...llow-using-intel_clc-from-the-system.patch | 99 
> -------------------
>  .../{mesa-gl_23.1.8.bb => mesa-gl_23.2.1.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  5 +-
>  .../mesa/{mesa_23.1.8.bb => mesa_23.2.1.bb}   |  0
>  5 files changed, 12 insertions(+), 111 deletions(-)
>  delete mode 100644 
> meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_23.1.8.bb => 
> mesa-gl_23.2.1.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_23.1.8.bb => mesa_23.2.1.bb} 
> (100%)
> 
> diff --git 
> a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch 
> b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
> index 165708145a..237f940f0b 100644
> --- 
> a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
> +++ 
> b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
> @@ -1,4 +1,4 @@
> -From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 
> 2001
> +From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 
> 2001
>  From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>  Date: Fri, 23 Jun 2023 01:20:38 -0700
>  Subject: [PATCH] gallium: Fix build with llvm 17
> @@ -9,16 +9,19 @@ so add conditions to exclude them for llvm >= 17
> 
>  Upstream-Status: Submitted 
> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827>]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> +
>  ---
> - src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> + src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> 
> +diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c 
> b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> +index cd2108f..b1a4d03 100644
>  --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
>  +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
> -@@ -42,8 +42,10 @@
> -
> - #include <llvm/Config/llvm-config.h>
> - #include <llvm-c/Analysis.h>
> +@@ -46,15 +46,19 @@
> + #if GALLIVM_USE_NEW_PASS == 1
> + #include <llvm-c/Transforms/PassBuilder.h>
> + #elif GALLIVM_HAVE_CORO == 1
>  +#if LLVM_VERSION_MAJOR < 17
>   #include <llvm-c/Transforms/Scalar.h>
>  -#if LLVM_VERSION_MAJOR >= 7
> @@ -26,8 +29,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +#if LLVM_VERSION_MAJOR >= 7 && LLVM_VERSION_MAJOR < 17
>   #include <llvm-c/Transforms/Utils.h>
>   #endif
> - #include <llvm-c/BitWriter.h>
> -@@ -53,8 +55,10 @@
>   #if LLVM_VERSION_MAJOR <= 8 && (DETECT_ARCH_AARCH64 || 
> DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
>   #include <llvm-c/Transforms/IPO.h>
>   #endif
> diff --git 
> a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch 
> b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
> deleted file mode 100644
> index 5eefd02068..0000000000
> --- 
> a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From ac503f5d7bf36f021c576029a64ac1a3199f6b5a Mon Sep 17 00:00:00 
> 2001
> -From: Matt Turner <mattst88@gmail.com <mailto:mattst88@gmail.com>>
> -Date: Thu, 31 Aug 2023 13:16:29 -0400
> -Subject: [PATCH] intel: Allow using intel_clc from the system
> -
> -With -Dintel-clc=system, the build system will search for an 
> `intel_clc`
> -binary and use it instead of building `intel_clc` itself.
> -
> -This allows Intel Vulkan ray tracing support to be built when cross
> -compiling without terrible hacks (that would otherwise be necessary 
> due
> -to `intel_clc`'s dependence on SPIRV-LLVM-Translator, libclc, clang, 
> and
> -LLVM).
> -
> -Part-of: 
> <<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24983>>
> -
> -Upstream-Status: Backport 
> [<https://gitlab.freedesktop.org/mesa/mesa/-/commit/28c1053c07c177854520f6283fa665f17618adb5>]
> -
> ----
> - meson.build                      | 6 +++---
> - meson_options.txt                | 5 ++++-
> - src/intel/compiler/meson.build   | 6 +++++-
> - src/intel/vulkan/grl/meson.build | 2 +-
> - 4 files changed, 13 insertions(+), 6 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 16e86ec..00a6953 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -259,12 +259,12 @@ endif
> -
> - with_microsoft_clc = get_option('microsoft-clc').enabled()
> - if ['x86_64'].contains(host_machine.cpu_family())
> --  with_intel_clc = get_option('intel-clc').enabled()
> --  with_intel_vk_rt = with_intel_vk and with_intel_clc
> -+  with_intel_clc = get_option('intel-clc') == 'enabled'
> - else
> -   with_intel_clc = false
> --  with_intel_vk_rt = false
> - endif
> -+with_intel_vk_rt = with_intel_vk and get_option('intel-clc') != 
> 'disabled'
> -+
> - with_clc = with_microsoft_clc or with_intel_clc
> - with_libclc = with_clc
> - with_spirv_to_dxil = get_option('spirv-to-dxil')
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 379aea3..9800531 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -607,9 +607,12 @@ option(
> -
> - option(
> -   'intel-clc',
> --  type : 'feature',
> -+  type : 'combo',
> -   deprecated: {'true': 'enabled', 'false': 'disabled'},
> -   value : 'disabled',
> -+  choices : [
> -+    'enabled', 'disabled', 'system',
> -+  ],
> -   description : 'Build the intel-clc compiler (enables Vulkan Intel 
> ' +
> -                 'Ray Tracing on supported hardware).'
> - )
> -diff --git a/src/intel/compiler/meson.build 
> b/src/intel/compiler/meson.build
> -index 9a03d37..774e955 100644
> ---- a/src/intel/compiler/meson.build
> -+++ b/src/intel/compiler/meson.build
> -@@ -168,7 +168,10 @@ libintel_compiler = static_library(
> - )
> -
> - # For now this tool is only going to be used by Anv
> --if with_intel_clc
> -+if get_option('intel-clc') == 'system'
> -+  prog_intel_clc = find_program('intel_clc', native : true)
> -+  dep_prog_intel_clc = []
> -+elif with_intel_clc
> -   prog_intel_clc = executable(
> -     'intel_clc',
> -     ['intel_clc.c'],
> -@@ -181,6 +184,7 @@ if with_intel_clc
> -     dependencies : [idep_nir, idep_clc, idep_mesautil, 
> idep_intel_dev],
> -     native : true,
> -   )
> -+  dep_prog_intel_clc = [prog_intel_clc]
> - endif
> -
> - if with_tests
> -diff --git a/src/intel/vulkan/grl/meson.build 
> b/src/intel/vulkan/grl/meson.build
> -index c0056b3..02a72f5 100644
> ---- a/src/intel/vulkan/grl/meson.build
> -+++ b/src/intel/vulkan/grl/meson.build
> -@@ -143,7 +143,7 @@ foreach t : [['125', 'gfx125', 'dg2']]
> -                                    # if fixed there
> -       ],
> -       env: ['MESA_SHADER_CACHE_DISABLE=true'],
> --      depends : [prog_intel_clc]
> -+      depends : dep_prog_intel_clc
> -     )
> -   endforeach
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb 
> b/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc 
> b/meta/recipes-graphics/mesa/mesa.inc
> index 4e824500dd..e5c405a972 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -18,11 +18,10 @@ SRC_URI = 
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
> -           
> file://0001-intel-Allow-using-intel_clc-from-the-system.patch 
> <file://0001-intel-allow-using-intel_clc-from-the-system.patch/> \
>             
> file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch 
> <file://0001-meson-disable-cmake-dependency-detector-for-llvm.patch/> 
> \
> -           "
> +"
> 
> -SRC_URI[sha256sum] = 
> "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad"
> +SRC_URI[sha256sum] = 
> "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc"
> 
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> 
> diff --git a/meta/recipes-graphics/mesa/mesa_23.1.8.bb 
> b/meta/recipes-graphics/mesa/mesa_23.2.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_23.1.8.bb
> rename to meta/recipes-graphics/mesa/mesa_23.2.1.bb
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188514): 
> <https://lists.openembedded.org/g/openembedded-core/message/188514>
> Mute This Topic: <https://lists.openembedded.org/mt/101696345/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-SQagK8AIMhThClZC5L9k
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 adds some references related to the llvm-17 issue</div></div><div id="geary-quote" dir="auto"><br>On Sun, Oct 1 2023 at 07:24:36 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- update 0001-gallium-Fix-build-with-llvm-17.patch
- remove as added upstream:
0001-intel-Allow-using-intel_clc-from-the-system.patch
- intel clc build is currently broken with llvm 17, but that issue is also
present
  with mesa 23.1.8

<a href="https://gitlab.freedesktop.org/mesa/mesa/-/issues/9701">https://gitlab.freedesktop.org/mesa/mesa/-/issues/9701</a>
<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24879">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24879</a>
<a href="https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/2153">https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/2153</a>

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 19 ++--
 ...llow-using-intel_clc-from-the-system.patch | 99 -------------------
 .../{mesa-gl_23.1.8.bb =&gt; mesa-gl_23.2.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  5 +-
 .../mesa/{mesa_23.1.8.bb =&gt; mesa_23.2.1.bb}   |  0
 5 files changed, 12 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_23.1.8.bb =&gt; mesa-gl_23.2.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.1.8.bb =&gt; mesa_23.2.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
index 165708145a..237f940f0b 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -1,4 +1,4 @@
-From c8e9776abc3dfd3f2411797a90a03e7fa16263ef Mon Sep 17 00:00:00 2001
+From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 Date: Fri, 23 Jun 2023 01:20:38 -0700
 Subject: [PATCH] gallium: Fix build with llvm 17
@@ -9,16 +9,19 @@ so add conditions to exclude them for llvm &gt;= 17
 
 Upstream-Status: Submitted [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827</a>]
 Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+
 ---
- src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
+ src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
+index cd2108f..b1a4d03 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -42,8 +42,10 @@
- 
- #include &lt;llvm/Config/llvm-config.h&gt;
- #include &lt;llvm-c/Analysis.h&gt;
+@@ -46,15 +46,19 @@
+ #if GALLIVM_USE_NEW_PASS == 1
+ #include &lt;llvm-c/Transforms/PassBuilder.h&gt;
+ #elif GALLIVM_HAVE_CORO == 1
 +#if LLVM_VERSION_MAJOR &lt; 17
  #include &lt;llvm-c/Transforms/Scalar.h&gt;
 -#if LLVM_VERSION_MAJOR &gt;= 7
@@ -26,8 +29,6 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;
 +#if LLVM_VERSION_MAJOR &gt;= 7 &amp;&amp; LLVM_VERSION_MAJOR &lt; 17
  #include &lt;llvm-c/Transforms/Utils.h&gt;
  #endif
- #include &lt;llvm-c/BitWriter.h&gt;
-@@ -53,8 +55,10 @@
  #if LLVM_VERSION_MAJOR &lt;= 8 &amp;&amp; (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
  #include &lt;llvm-c/Transforms/IPO.h&gt;
  #endif
diff --git a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch b/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
deleted file mode 100644
index 5eefd02068..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-intel-Allow-using-intel_clc-from-the-system.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ac503f5d7bf36f021c576029a64ac1a3199f6b5a Mon Sep 17 00:00:00 2001
-From: Matt Turner &lt;<a href="mailto:mattst88@gmail.com">mattst88@gmail.com</a>&gt;
-Date: Thu, 31 Aug 2023 13:16:29 -0400
-Subject: [PATCH] intel: Allow using intel_clc from the system
-
-With -Dintel-clc=system, the build system will search for an `intel_clc`
-binary and use it instead of building `intel_clc` itself.
-
-This allows Intel Vulkan ray tracing support to be built when cross
-compiling without terrible hacks (that would otherwise be necessary due
-to `intel_clc`'s dependence on SPIRV-LLVM-Translator, libclc, clang, and
-LLVM).
-
-Part-of: &lt;<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24983">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24983</a>&gt;
-
-Upstream-Status: Backport [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/commit/28c1053c07c177854520f6283fa665f17618adb5">https://gitlab.freedesktop.org/mesa/mesa/-/commit/28c1053c07c177854520f6283fa665f17618adb5</a>]
-
----
- meson.build                      | 6 +++---
- meson_options.txt                | 5 ++++-
- src/intel/compiler/meson.build   | 6 +++++-
- src/intel/vulkan/grl/meson.build | 2 +-
- 4 files changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 16e86ec..00a6953 100644
---- a/meson.build
-+++ b/meson.build
-@@ -259,12 +259,12 @@ endif
- 
- with_microsoft_clc = get_option('microsoft-clc').enabled()
- if ['x86_64'].contains(host_machine.cpu_family())
--  with_intel_clc = get_option('intel-clc').enabled()
--  with_intel_vk_rt = with_intel_vk and with_intel_clc
-+  with_intel_clc = get_option('intel-clc') == 'enabled'
- else
-   with_intel_clc = false
--  with_intel_vk_rt = false
- endif
-+with_intel_vk_rt = with_intel_vk and get_option('intel-clc') != 'disabled'
-+
- with_clc = with_microsoft_clc or with_intel_clc
- with_libclc = with_clc
- with_spirv_to_dxil = get_option('spirv-to-dxil')
-diff --git a/meson_options.txt b/meson_options.txt
-index 379aea3..9800531 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -607,9 +607,12 @@ option(
- 
- option(
-   'intel-clc',
--  type : 'feature',
-+  type : 'combo',
-   deprecated: {'true': 'enabled', 'false': 'disabled'},
-   value : 'disabled',
-+  choices : [
-+    'enabled', 'disabled', 'system',
-+  ],
-   description : 'Build the intel-clc compiler (enables Vulkan Intel ' +
-                 'Ray Tracing on supported hardware).'
- )
-diff --git a/src/intel/compiler/meson.build b/src/intel/compiler/meson.build
-index 9a03d37..774e955 100644
---- a/src/intel/compiler/meson.build
-+++ b/src/intel/compiler/meson.build
-@@ -168,7 +168,10 @@ libintel_compiler = static_library(
- )
- 
- # For now this tool is only going to be used by Anv
--if with_intel_clc
-+if get_option('intel-clc') == 'system'
-+  prog_intel_clc = find_program('intel_clc', native : true)
-+  dep_prog_intel_clc = []
-+elif with_intel_clc
-   prog_intel_clc = executable(
-     'intel_clc',
-     ['intel_clc.c'],
-@@ -181,6 +184,7 @@ if with_intel_clc
-     dependencies : [idep_nir, idep_clc, idep_mesautil, idep_intel_dev],
-     native : true,
-   )
-+  dep_prog_intel_clc = [prog_intel_clc]
- endif
- 
- if with_tests
-diff --git a/src/intel/vulkan/grl/meson.build b/src/intel/vulkan/grl/meson.build
-index c0056b3..02a72f5 100644
---- a/src/intel/vulkan/grl/meson.build
-+++ b/src/intel/vulkan/grl/meson.build
-@@ -143,7 +143,7 @@ foreach t : [['125', 'gfx125', 'dg2']]
-                                    # if fixed there
-       ],
-       env: ['MESA_SHADER_CACHE_DISABLE=true'],
--      depends : [prog_intel_clc]
-+      depends : dep_prog_intel_clc
-     )
-   endforeach
- 
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb b/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.1.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4e824500dd..e5c405a972 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,11 +18,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            <a href="file://0001-meson.build-check-for-all-linux-host_os-combinations.patch">file://0001-meson.build-check-for-all-linux-host_os-combinations.patch</a> \
            <a href="file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch</a> \
            <a href="file://0001-gallium-Fix-build-with-llvm-17.patch">file://0001-gallium-Fix-build-with-llvm-17.patch</a> \
-           <a href="file://0001-intel-Allow-using-intel_clc-from-the-system.patch">file://0001-intel-Allow-using-intel_clc-from-the-system.patch</a> \
            <a href="file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch">file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch</a> \
-           "
+"
 
-SRC_URI[sha256sum] = "45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad"
+SRC_URI[sha256sum] = "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.1.8.bb b/meta/recipes-graphics/mesa/mesa_23.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.1.8.bb
rename to meta/recipes-graphics/mesa/mesa_23.2.1.bb
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188514): <a href="https://lists.openembedded.org/g/openembedded-core/message/188514">https://lists.openembedded.org/g/openembedded-core/message/188514</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/101696345/3618223">https://lists.openembedded.org/mt/101696345/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-SQagK8AIMhThClZC5L9k--


