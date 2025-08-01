Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34C8C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 11:04:17 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.85031.1754046244965782376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 04:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4btjkW17YyzgQ1;
	Fri,  1 Aug 2025 13:04:03 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4btjkT5h9dzZfk;
	Fri,  1 Aug 2025 13:04:01 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC v4 0/9] mesa: lighten up target's libclc dependencies
 and fix panfrost support
Date: Fri, 01 Aug 2025 13:03:08 +0200
Message-Id: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyejGgC/33NTQqDMBAF4KtI1k1Jxr9MV4VCD9Bt6UKTsQasS
 iJSEe/e4KZSsMs3j/nezDw5S56dopk5Gq23XRtCcoiYrov2SdyakBkISEUGCX+RL3hjS91o3hd
 t5To/cCmUyYCkQixZeO0dVfa9snd2u17YIxxr64fOTevUKNfqvzpKLjiSUbpAJQjkWdfk3HQ0t
 IIjfJEc5A4CAalyGRuhUoUJ/iLxFsEdJA5IAmmKxmiMqdoiy7J8APAbySdHAQAA
X-Change-ID: 20250624-mesa-libclc-panfrost-108d62e1899b
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Otavio Salvador <otavio.salvador@ossystems.com.br>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 11:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221230

@Otavio, can I add the new mesa-tools-native recipe under your
maintainership in meta/conf/distro/include/maintainers.inc, it is after
all still mesa?

Panfrost support has been broken for a while already because it now
requires libclc which isn't enforced by default. This fixes this
oversight.

While re-adding support for panfrost, the build time for libclc were a
bit too much to my taste and I tried to figure out if we could lighten
up the dependencies for the target recipe and it seems to be the case.

libclc brings very expensive dependencies such as llvm and clang.
Building clang and llvm for each target architecture is very expensive,
but mesa allows to depend on prebuilt host binaries (mesa-clc and
precomp-compiler). Those are built by mesa as well, but can be compiled
in mesa-native instead of mesa, making the dependency expensive but only
once regardless of the number of target architectures to build for.
Ideally the mesa-clc and precomp-compiler would only be compiled in
mesa-native if target mesa requires libclc support, however this is not
possible as a target recipe cannot impact or depend on a native recipe's
configuration. We thus have two choices, always build libclc in
mesa-native with its heavy dependencies and impact every build or force
the user to modify the mesa-native recipe in a custom layer (as a native
recipe cannot use target's OVERRIDES). The latter is unacceptable so the
former seems to be the only option. Another big downside is that
mesa-native currently builds drivers (amd, nouveau, svga) which we may
have absolutely no interest in building, increasing the build time and
possibly dependencies list).

A third choice is to spin-off the native mesa recipe with libclc support
into a new recipe without drivers and only what's necessary to build
mesa-clc and precomp-compiler binaries.
This allows to keep a "clean" mesa-native recipe for whoever needs those
drivers built-in (e.g. for testing, for qemu-native, or whatever else)
and only bring the libclc dependency when required by the target recipe.

Because libclc is now only built for the host, opencl support now needs
to explicitly bring libclc and others to build as libclc won't bring it
in the build environment anymore.

Note that this was essentially only build tested (run tested on RK3588
with panfrost though).

I tried to enable OpenCL support but it triggers a buildpaths QA error,
which can be worked around with the following patch:

  commit f5508086477eb900bb0bcfa1a65f46c8d853595a
  Author: Quentin Schulz <quentin.schulz@cherry.de>
  Date:   Mon Jul 21 11:15:54 2025 +0200
  
      clc: avoid host path poisoning
      
      LLVM_LIB_DIR is derived from llvm_libdir meson variable. The latter is
      required to figure out where the clang/llvm libraries are for the
      cross-compiler but the former is only useful for debugging purposes
      while running on the target. When in a cross-compiling environment,
      LLVM_LIB_DIR would actually point at a non-existing path (the sysroot
      path on the build host) instead of the target path.
      
      I don't know how to fix this properly so I just hardcode it for now to
      silence build warnings.
      
      Upstream-Status: Inappropriate [proper fix sent to mesa stripping the sysroot would be much better]
      Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  
  diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
  index 3c0c9db653f..fbc3b2b3d21 100644
  --- a/src/compiler/clc/clc_helpers.cpp
  +++ b/src/compiler/clc/clc_helpers.cpp
  @@ -936,7 +936,7 @@ clc_compile_to_llvm_module(LLVMContext &llvm_ctx,
                                       false, false);
   
      auto clang_install_res_path =
  -      fs::path(LLVM_LIB_DIR) / "clang" / std::to_string(LLVM_VERSION_MAJOR) / "include";
  +      fs::path("/usr/lib/clang") / std::to_string(LLVM_VERSION_MAJOR) / "include";
      c->getHeaderSearchOpts().AddPath(clang_install_res_path.string(),
                                       clang::frontend::Angled,
                                       false, false);

However, building OpenCL support with Asahi enabled triggers a bunch of
other buildpaths QA errors and I believe those are triggered by:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/compiler/libcl/assert.h#L33
with __FILE__ pointing at the path on the build host. This should have
been mitigated by DEBUG_PREFIX_MAP (-ffile-prefix-map=) but it probably
isn't propagated by mesa's build system to the LLVM-only parts of the
build?

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v4:
- revamped patch removing egl/gles from mesa-gl by making the native and
  nativesdk PACKAGECONFIG use = instead of ??= (see patch 1),
- added "No intended change in behavior" wherever it is expected,
- Link to v3: https://lore.kernel.org/r/20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de

Changes in v3:
- added patch to move S into mesa.inc,
- added patch to remove egl/gles from mesa-gl,
- added patch to make mesa-gl a target-only recipe,
- updated comment for PACKAGECONFIG[opencl] dependency on other
  PACKAGECONFIG,
- added clarification in commit log of commit adding asahi to TOOLS,
- Link to v2: https://lore.kernel.org/r/20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de

Changes in v2:
- spin-off mesa-clc/precomp-compiler host binary building into a
  mesa-tools-native recipe to lighten the dependency even more (no
  native mesa drivers to build),
- make libclc's target mesa depend on mesa-tools-native instead of
  mesa-native,
- Link to v1: https://lore.kernel.org/r/20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de

---
Quentin Schulz (8):
      mesa-gl: make mesa-gl really openGL-only
      mesa: move PACKAGECONFIG defaults to recipes
      mesa: move PROVIDES out of include file
      mesa: move BBCLASSEXTEND out of the include file
      mesa-gl: make recipe target only
      mesa: add asahi to TOOLS when selected in PACKAGECONFIG
      mesa: use simpler mesa-tools-native recipe as dependency for libclc
      mesa: fix panfrost driver build

Ross Burton (1):
      mesa: assign S in include file

 meta/recipes-graphics/mesa/mesa-gl.bb           |  8 ++---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 19 ++++++++++
 meta/recipes-graphics/mesa/mesa.bb              | 25 +++++++++++++
 meta/recipes-graphics/mesa/mesa.inc             | 47 +++++--------------------
 4 files changed, 57 insertions(+), 42 deletions(-)
---
base-commit: d1afce3aa07898c30aad314e17405994053df3d6
change-id: 20250624-mesa-libclc-panfrost-108d62e1899b

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


