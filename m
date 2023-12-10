Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F27C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 05:16:45 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.45621.1702185400579123507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 21:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id C68D64A494;
	Sun, 10 Dec 2023 06:16:38 +0100 (CET)
Received: from [192.168.178.67] ([84.154.175.102]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rCCB7-1KD4Xw0; Sun, 10 Dec 2023 06:16:34 +0100
Date: Sun, 10 Dec 2023 06:17:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: upgrade 23.2.1 -> 23.3.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <POQF5S.M9F40QH9IVRS1@t-online.de>
In-Reply-To: <202312092347140752b3d5@mail.local>
References: <20231201142309.339816-1-f_l_k@t-online.de>
	<202312092347140752b3d5@mail.local>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-rQ6fa8alspDEomnNsJP/"
X-TOI-EXPURGATEID: 150726::1702185394-2FFFC9FB-F7F94D76/0/0 CLEAN NORMAL
X-TOI-MSGID: c95bb614-6a8b-4bef-bc2b-c1a2f4f3b139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 05:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192108

--=-rQ6fa8alspDEomnNsJP/
Content-Type: text/plain; charset=us-ascii; format=flowed

And it also looks like this update breaks video acceleration with 
v4l2-request for raspberrypi4

On Sun, Dec 10 2023 at 12:47:14 AM +01:00:00, Alexandre Belloni 
<alexandre.belloni@bootlin.com> wrote:
> This causes failures on the AB:
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6146/steps/14/logs/stdio>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6155/steps/14/logs/stdio>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6141/steps/14/logs/stdio>
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6091/steps/14/logs/stdio>
> 
> On 01/12/2023 15:23:09+0100, Markus Volk wrote:
>>  - build amd vulkan driver for x86 platforms
>>  - drop included patch
>>  
>> [<https://gitlab.freedesktop.org/mesa/mesa/-/blob/1fbdd37d4c1133ced5eb9812daa1fff04cbf5daa/meson.build#L1711>]
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...e-cmake-dependency-detector-for-llvm.patch | 42 
>> -------------------
>>   .../{mesa-gl_23.2.1.bb => mesa-gl_23.3.0.bb}  |  0
>>   meta/recipes-graphics/mesa/mesa.inc           |  7 ++--
>>   .../mesa/{mesa_23.2.1.bb => mesa_23.3.0.bb}   |  0
>>   4 files changed, 3 insertions(+), 46 deletions(-)
>>   delete mode 100644 
>> meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
>>   rename meta/recipes-graphics/mesa/{mesa-gl_23.2.1.bb => 
>> mesa-gl_23.3.0.bb} (100%)
>>   rename meta/recipes-graphics/mesa/{mesa_23.2.1.bb => 
>> mesa_23.3.0.bb} (100%)
>> 
>>  diff --git 
>> a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch 
>> b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
>>  deleted file mode 100644
>>  index 4cded0546d..0000000000
>>  --- 
>> a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
>>  +++ /dev/null
>>  @@ -1,42 +0,0 @@
>>  -From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 
>> 2001
>>  -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  -Date: Thu, 28 Sep 2023 15:34:22 -0700
>>  -Subject: [PATCH] meson: use llvm-config instead of cmake to fix 
>> linking errors with meson 1.2.1
>>  -
>>  -meson dependency auto dependency detection uses cmake and then
>>  -config-tool to process dependencies, in mesa the logic to detect 
>> llvm is
>>  -using auto detection which means if it finds cmake then it will 
>> try to
>>  -use cmake method. Cmake method works ok except a case when llvm-dev
>>  -package is installed on the build host then it generates its own
>>  -native.meson file and ignores OE supplied meson.native file which 
>> has
>>  -correct llvm-config tool specified which is pointing to 
>> llvm-config from
>>  -native sysroot. The generated meson.native file points to one 
>> found in
>>  -/usr/bin and there onwards detector finds native install of llvm 
>> and
>>  -configures that into building native mesa package.
>>  -
>>  -Since cmake detector does not always work, disable it by default 
>> and use
>>  -config-tool which works in all cases. This is suggested in below 
>> issues
>>  -too
>>  -
>>  -A similar issue is open in meson upstream [1] and mesa [2]
>>  -
>>  -[1] <https://github.com/mesonbuild/meson/issues/10483>
>>  -[2] <https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738>
>>  -
>>  -Upstream-Status: Submitted 
>> [<https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438>]
>>  -
>>  -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  ----
>>  - meson.build | 1 +
>>  - 1 file changed, 1 insertion(+)
>>  -
>>  ---- a/meson.build
>>  -+++ b/meson.build
>>  -@@ -1659,6 +1659,7 @@ with_llvm = false
>>  - if _llvm.allowed()
>>  -   dep_llvm = dependency(
>>  -     'llvm',
>>  -+    method : host_machine.system() == 'windows' ? 'auto' : 
>> 'config-tool',
>>  -     version : _llvm_version,
>>  -     modules : llvm_modules,
>>  -     optional_modules : llvm_optional_modules,
>>  diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb 
>> b/meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
>>  rename to meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
>>  diff --git a/meta/recipes-graphics/mesa/mesa.inc 
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  index e5c405a972..b3df71cb60 100644
>>  --- a/meta/recipes-graphics/mesa/mesa.inc
>>  +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  @@ -18,10 +18,9 @@ SRC_URI = 
>> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>>              
>> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch 
>> <file://0001-meson.build-check-for-all-linux-host_os-combinations.patch/> 
>> \
>>              
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch 
>> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>>              file://0001-gallium-Fix-build-with-llvm-17.patch 
>> <file://0001-gallium-fix-build-with-llvm-17.patch/> \
>>  -           
>> file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch 
>> <file://0001-meson-disable-cmake-dependency-detector-for-llvm.patch/> 
>> \
>>   "
>> 
>>  -SRC_URI[sha256sum] = 
>> "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc"
>>  +SRC_URI[sha256sum] = 
>> "50f729dd60ed6335b989095baad81ef5edf7cfdd4b4b48b9b955917cb07d69c5"
>> 
>>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>> 
>>  @@ -105,8 +104,8 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, 
>> -Ddri3=disabled, xorgproto libxshmfence"
>>   # Vulkan drivers need dri3 enabled
>>   # amd could be enabled as well but requires gallium-llvm with llvm 
>> >= 3.9
>>   VULKAN_DRIVERS = ""
>>  -VULKAN_DRIVERS:append:x86 = ",intel"
>>  -VULKAN_DRIVERS:append:x86-64 = ",intel"
>>  +VULKAN_DRIVERS:append:x86 = ",intel,amd"
>>  +VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
>>   # i686 is a 32 bit override for mesa-native
>>   VULKAN_DRIVERS:append:i686 = ",intel"
>>   VULKAN_DRIVERS:append ="${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'freedreno', 
>> ',freedreno', '', d)}"
>>  diff --git a/meta/recipes-graphics/mesa/mesa_23.2.1.bb 
>> b/meta/recipes-graphics/mesa/mesa_23.3.0.bb
>>  similarity index 100%
>>  rename from meta/recipes-graphics/mesa/mesa_23.2.1.bb
>>  rename to meta/recipes-graphics/mesa/mesa_23.3.0.bb
>>  --
>>  2.42.1
>> 
> 
>> 
>>  -=-=-=-=-=-=-=-=-=-=-=-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#191670): 
>> <https://lists.openembedded.org/g/openembedded-core/message/191670>
>>  Mute This Topic: 
>> <https://lists.openembedded.org/mt/102916247/3617179>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org 
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-core/unsub> 
>> [alexandre.belloni@bootlin.com 
>> <mailto:alexandre.belloni@bootlin.com>]
>>  -=-=-=-=-=-=-=-=-=-=-=-
>> 
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>


--=-rQ6fa8alspDEomnNsJP/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">And it also looks like this update breaks video acceleration with v4l2-request for raspberrypi4&nbsp;</div><div id="geary-quote" dir="auto"><br>On Sun, Dec 10 2023 at 12:47:14 AM +01:00:00, Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This causes failures on the AB:

<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6146/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6146/steps/14/logs/stdio</a>
<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6155/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6155/steps/14/logs/stdio</a>
<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6141/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6141/steps/14/logs/stdio</a>
<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6091/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6091/steps/14/logs/stdio</a>

On 01/12/2023 15:23:09+0100, Markus Volk wrote:
<blockquote> - build amd vulkan driver for x86 platforms
 - drop included patch
 [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/blob/1fbdd37d4c1133ced5eb9812daa1fff04cbf5daa/meson.build#L1711">https://gitlab.freedesktop.org/mesa/mesa/-/blob/1fbdd37d4c1133ced5eb9812daa1fff04cbf5daa/meson.build#L1711</a>]
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  ...e-cmake-dependency-detector-for-llvm.patch | 42 -------------------
  .../{mesa-gl_23.2.1.bb =&gt; mesa-gl_23.3.0.bb}  |  0
  meta/recipes-graphics/mesa/mesa.inc           |  7 ++--
  .../mesa/{mesa_23.2.1.bb =&gt; mesa_23.3.0.bb}   |  0
  4 files changed, 3 insertions(+), 46 deletions(-)
  delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
  rename meta/recipes-graphics/mesa/{mesa-gl_23.2.1.bb =&gt; mesa-gl_23.3.0.bb} (100%)
  rename meta/recipes-graphics/mesa/{mesa_23.2.1.bb =&gt; mesa_23.3.0.bb} (100%)
 
 diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 deleted file mode 100644
 index 4cded0546d..0000000000
 --- a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 +++ /dev/null
 @@ -1,42 +0,0 @@
 -From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
 -From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 -Date: Thu, 28 Sep 2023 15:34:22 -0700
 -Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking errors with meson 1.2.1
 -
 -meson dependency auto dependency detection uses cmake and then
 -config-tool to process dependencies, in mesa the logic to detect llvm is
 -using auto detection which means if it finds cmake then it will try to
 -use cmake method. Cmake method works ok except a case when llvm-dev
 -package is installed on the build host then it generates its own
 -native.meson file and ignores OE supplied meson.native file which has
 -correct llvm-config tool specified which is pointing to llvm-config from
 -native sysroot. The generated meson.native file points to one found in
 -/usr/bin and there onwards detector finds native install of llvm and
 -configures that into building native mesa package.
 -
 -Since cmake detector does not always work, disable it by default and use
 -config-tool which works in all cases. This is suggested in below issues
 -too
 -
 -A similar issue is open in meson upstream [1] and mesa [2]
 -
 -[1] <a href="https://github.com/mesonbuild/meson/issues/10483">https://github.com/mesonbuild/meson/issues/10483</a>
 -[2] <a href="https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738">https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738</a>
 -
 -Upstream-Status: Submitted [<a href="https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438</a>]
 -
 -Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
 ----
 - meson.build | 1 +
 - 1 file changed, 1 insertion(+)
 -
 ---- a/meson.build
 -+++ b/meson.build
 -@@ -1659,6 +1659,7 @@ with_llvm = false
 - if _llvm.allowed()
 -   dep_llvm = dependency(
 -     'llvm',
 -+    method : host_machine.system() == 'windows' ? 'auto' : 'config-tool',
 -     version : _llvm_version,
 -     modules : llvm_modules,
 -     optional_modules : llvm_optional_modules,
 diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
 rename to meta/recipes-graphics/mesa/mesa-gl_23.3.0.bb
 diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
 index e5c405a972..b3df71cb60 100644
 --- a/meta/recipes-graphics/mesa/mesa.inc
 +++ b/meta/recipes-graphics/mesa/mesa.inc
 @@ -18,10 +18,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
             <a href="file://0001-meson.build-check-for-all-linux-host_os-combinations.patch">file://0001-meson.build-check-for-all-linux-host_os-combinations.patch</a> \
             <a href="file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch</a> \
             <a href="file://0001-gallium-Fix-build-with-llvm-17.patch">file://0001-gallium-Fix-build-with-llvm-17.patch</a> \
 -           <a href="file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch">file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch</a> \
  "
  
 -SRC_URI[sha256sum] = "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc"
 +SRC_URI[sha256sum] = "50f729dd60ed6335b989095baad81ef5edf7cfdd4b4b48b9b955917cb07d69c5"
  
  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"
  
 @@ -105,8 +104,8 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
  # Vulkan drivers need dri3 enabled
  # amd could be enabled as well but requires gallium-llvm with llvm &gt;= 3.9
  VULKAN_DRIVERS = ""
 -VULKAN_DRIVERS:append:x86 = ",intel"
 -VULKAN_DRIVERS:append:x86-64 = ",intel"
 +VULKAN_DRIVERS:append:x86 = ",intel,amd"
 +VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
  # i686 is a 32 bit override for mesa-native
  VULKAN_DRIVERS:append:i686 = ",intel"
  VULKAN_DRIVERS:append ="<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 diff --git a/meta/recipes-graphics/mesa/mesa_23.2.1.bb b/meta/recipes-graphics/mesa/mesa_23.3.0.bb
 similarity index 100%
 rename from meta/recipes-graphics/mesa/mesa_23.2.1.bb
 rename to meta/recipes-graphics/mesa/mesa_23.3.0.bb
 -- 
 2.42.1
 
</blockquote>
<blockquote> 
 -=-=-=-=-=-=-=-=-=-=-=-
 Links: You receive all messages sent to this group.
 View/Reply Online (#191670): <a href="https://lists.openembedded.org/g/openembedded-core/message/191670">https://lists.openembedded.org/g/openembedded-core/message/191670</a>
 Mute This Topic: <a href="https://lists.openembedded.org/mt/102916247/3617179">https://lists.openembedded.org/mt/102916247/3617179</a>
 Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>]
 -=-=-=-=-=-=-=-=-=-=-=-
 
</blockquote>

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div></blockquote></div>
--=-rQ6fa8alspDEomnNsJP/--


