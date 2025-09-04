Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01DDCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:00 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.web10.40451.1756994634780996263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6K0P93zsRZ;
	Thu,  4 Sep 2025 16:03:53 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6J21hZzf4R;
	Thu,  4 Sep 2025 16:03:52 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v7 00/13] mesa: prepare for lightenin up target's libclc
 dependencies and fix panfrost support
Date: Thu, 04 Sep 2025 16:03:29 +0200
Message-Id: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGcuWgC/4XOTWrDMBAF4KsErasijX6s6ar3KFnI0qgWpHaQg
 mkIvnuUbGJcTJdvYL73bqxSyVTZx+HGCs255mlsoXs7sDD48Zt4ji0zEGCEBc1/qHp+yn04BX7
 2YypTvXApXLRA0iH2rL2eC6X8+2S/ji0PuV6mcn22zPJx/QecJRccKbrg0QkC+RkGKuX6Hok9w
 BleSAdyB4GGpE6qKJxxqHGLqDWCO4hqiAZjMMaAitIW0S/Eib0luiFSyGBjSMbqP4hZIXJviWl
 I73qHZH1C4baIXSEAO4htiEIVku4Ikoc1sizLHWrHB5IRAgAA
X-Change-ID: 20250624-mesa-libclc-panfrost-108d62e1899b
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 14:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222934

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

This requires some additional changes that were part of this series
until v7 but I decided to spin off that mesa-tools-native patch in its
own series to not prevent recipe updates and cleanups until a proper
solution for the encountered shortcomings of the v6 are handled.

Note that this was essentially only build tested (run tested on RK3588
with panfrost though).

Note that building gallium-llvm support on big.LITTLE architecture with
TOOLCHAIN = "gcc" (the default) currently doesn't work as llvm doesn't
support big.LITTLE architecture in -mcpu/-march which is passed to the
CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
further than that but that prevents us from building opencl support for
Rockchip most popular and powerful SoCs right now. One option could be
to force this recipe to be built with clang toolchain only whenever
gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
be not straightforward seeing the comment in libclc recipe related to
forcing the toolchain to clang.
I'm also not sure mesa has a way to specify different args to LLVM-only
drivers but that could be another option.

Runtime tested on RK3588 and PX30 with kmscube.
Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
after some time but could be kernel related as it starts failing after
[  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=1, config=0x7b00, status=0x8, head=0xa68d200, tail=0xa68d200, sched_job=0000000019e6f20d

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v7:
- removed patch 12 (mesa-tools-native with libclc and precomp-compilers
  optimization) to put it into its own series once I figure out how to
  fix the build issues reported by Mathieu),
- update mesa to 25.2.2,
- Added Rb and Tb from Dmitry,
- Link to v6: https://lore.kernel.org/r/20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de

Changes in v6:
- added patches to fix OpenCL, Panfrost and Asahi host paths poisoning,
- removed intel from mesa-tools-native's PACKAGECONFIG as no intel
  driver requires a precomp-compiler anymore,
- added patch for migrating to bb.utils.filter instead of
  bb.utils.contains as recommended by Khem,
- reworded PACKAGECONFIG moving patch's commit log to be hopefully
  clearer as to why mesa-gl.bb is left untouched,
- added patch to allow disabling xmlconfig support,
- fixed mesa-native + mesa-tools-native installing same files (driconf
  files) by disabling xmlconfig in mesa-tools-native,
- rebased on top of master,
- added patch to bump mesa recipes to 25.2.1,
- Link to v5: https://lore.kernel.org/r/20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de

Changes in v5:
- removed RFC prefix as it's gone through multiple reviews already, I
  guess it should be fine by now,
- reworded patch 3 to hopefully make it clearer why mesa-gl doesn't get
  any of the changes mesa.bb gets,
- Link to v4: https://lore.kernel.org/r/20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de

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
Quentin Schulz (12):
      mesa-gl: make mesa-gl really openGL-only
      mesa-gl: use bb.utils.filter to improve readability
      mesa: move PACKAGECONFIG defaults to recipes
      mesa: move PROVIDES out of include file
      mesa: move BBCLASSEXTEND out of the include file
      mesa-gl: make recipe target only
      mesa: add asahi to TOOLS when selected in PACKAGECONFIG
      mesa: allow to disable xmlconfig support
      mesa: avoid host paths poisoning
      mesa: avoid host path poisoning when enabling OpenCL
      mesa: fix panfrost driver build
      mesa: upgrade 25.2.0 -> 25.2.2

Ross Burton (1):
      mesa: assign S in include file

 ...01-meson-fix-libcl-assert-reproducibility.patch | 43 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-gl.bb              |  8 ++--
 meta/recipes-graphics/mesa/mesa.bb                 | 26 +++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                | 40 +++++---------------
 4 files changed, 83 insertions(+), 34 deletions(-)
---
base-commit: 4ad510a63fd88b7907b2a1b8feceace9758397d0
change-id: 20250624-mesa-libclc-panfrost-108d62e1899b

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


