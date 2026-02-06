Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A5BEE20BE
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:24 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2784.1770398658112167873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D00fP8zMYD;
	Fri,  6 Feb 2026 18:24:16 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71Cz1F1lzBRQ;
	Fri,  6 Feb 2026 18:24:14 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/7] mesa: bump + lighten mesa libclc dependency
Date: Fri, 06 Feb 2026 18:23:52 +0100
Message-Id: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2IAYv0KuJiYsY6pU0kE0UQ7
 95Ul2/x/wHKSVjhWR2QeBOVGAqauoJxpvBiFF8M1tiHsabFLythjvGjGCjLxkgTudZ13njbQOm
 WxJPs17Mfbuvq3jzm/wjO8wcsDsF/dQAAAA==
X-Change-ID: 20260205-mesa-tools-native-afab5b8d0d21
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.15-dev-bab12
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230631

This bumps mesa to 25.3.4, the latest available stable release.

This removes an unnecessary native dependency (libxml2) which is only
required for unit tests, which we don't build or run yet.

This migrates mesa libclc PACKAGECONFIG to stop depending on mesa-native
recipe and instead depend on a newly introduced mesa-tools-native. The
benefits are:
- instead of building mesa-native with many drivers like we do
  currently, we only build (with mesa-tools-native) tools necessary to
  build libclc-dependent drivers in mesa,
- removing libclc, spirv-tools and spirv-llvm-translator target recipes
  from dependencies. Those target recipes would be built for every
  different CPU tune incurring a very high cost of building mesa for
  separate machines. These dependencies will now only be necessary to
  build in mesa-tools-native, in their native variant, which is shared
  for all CPU tunes as it's only dependent on the host CPU architecture.
  Unfortunately, those dependencies in their target variant are still
  required for building rusticl (opencl),

libclc PACKAGECONFIG being selected by default for x86, x86-64 and i686
CPU TUNEs as well as for all Panthor/Panfrost-supported Rockchip SoCs,
the mesa-native dependency is now removed and only mesa-tools-native
will be built for those.

For a PX30 Rockchip SoC-based machine (default mesa PACKAGECONFIG for
poky + panfrost + libclc (see meta-rockchip mesa.bbappend)), the
difference in dependencies is the following (according to pn-buildlist
(bitbake -g mesa) before last two patches/after this series):

Removed: libclc, llvm, spirv-headers, spirv-llvm-translator,
spirv-tools, zstd, mesa-native.
Added: mesa-tools-native.

On a server with AMD EPYC 7443P (24-cores, 48 threads) and 130GiB of
DRAM, running
bitbake -c cleansstate libclc llvm spirv-headers spirv-llvm-translator spirv-tools zstd mesa-native mesa-tools-native mesa
between runs.

buildstats-diff --diff-attr walltime after-libxml2-removal/ after-this-series/
Ignoring tasks less than 00:05.0 (5.0s)
Ignoring differences less than 00:02.0 (2.0s)

  PKG                      TASK          ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
- llvm                     do_compile    -450.6s  -100.0%     450.6s -> 0.0s
- libclc                   do_compile    -118.8s  -100.0%     118.8s -> 0.0s
- mesa-native              do_compile    -106.0s  -100.0%     106.0s -> 0.0s
- spirv-tools              do_compile     -94.9s  -100.0%      94.9s -> 0.0s
- zstd                     do_compile     -70.7s  -100.0%      70.7s -> 0.0s
- spirv-llvm-translator    do_compile     -45.3s  -100.0%      45.3s -> 0.0s
- mesa-native              do_configure   -35.4s  -100.0%      35.4s -> 0.0s
- llvm                     do_package     -34.6s  -100.0%      34.6s -> 0.0s
- zstd                     do_install     -31.1s  -100.0%      31.1s -> 0.0s
- llvm                     do_configure   -17.0s  -100.0%      17.0s -> 0.0s
- libclc                   do_configure   -13.2s  -100.0%      13.2s -> 0.0s
- spirv-tools              do_package     -11.8s  -100.0%      11.8s -> 0.0s
  mesa                     do_compile      -9.4s   -15.4%      61.0s -> 51.6s
- zstd                     do_package      -6.2s  -100.0%       6.2s -> 0.0s
+ mesa-tools-native        do_configure     6.3s    +inf%       0.0s -> 6.3s
+ mesa-tools-native        do_compile      30.8s    +inf%       0.0s -> 30.8s

Cumulative walltime:
  -1052.2s    -90.0%    19:29.3 (1169.3s) -> 01:57.2 (117.2s)

With DISTRO_FEATURES:append = " opencl" (since that will re-add the
previous libclc PACKAGECONFIG dependencies and still require
mesa-tools-native for libclc PACKAGECONFING). The diff is only
mesa-tools-native added for mesa-native removed.

scripts/buildstats-diff --diff-attr walltime after-libxml2-removal/ after-this-series/
Ignoring tasks less than 00:05.0 (5.0s)
Ignoring differences less than 00:02.0 (2.0s)

  PKG                  TASK          ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
- mesa-native          do_compile     -55.2s  -100.0%      55.2s -> 0.0s
- mesa-native          do_configure    -9.5s  -100.0%       9.5s -> 0.0s
  mesa                 do_compile      -8.8s   -13.3%      66.1s -> 57.3s
+ mesa-tools-native    do_configure     6.3s    +inf%       0.0s -> 6.3s
+ mesa-tools-native    do_compile      30.5s    +inf%       0.0s -> 30.5s

Cumulative walltime:
  -37.1s    -22.8%    02:42.8 (162.8s) -> 02:05.7 (125.7s)

The DISTRO_FEATURES:append = " opencl" from above has been removed for
the rest of the explanations.

For qemux86-64, the difference in dependencies is the following
(according to pn-buildlist (bitbake -g mesa) before last two
 patches/after this series):

Removed: libclc, spirv-headers, spirv-llvm-translator, spirv-tools,
mesa-native.
Added: mesa-tools-native.

On a server with AMD EPYC 7443P (24-cores, 48 threads) and 130GiB of
DRAM, running
bitbake -c cleansstate libclc spirv-headers spirv-llvm-translator spirv-tools mesa-native mesa-tools-native mesa
between runs.

buildstats-diff --diff-attr walltime after-libxml2-removal/ after-this-series/
Ignoring tasks less than 00:05.0 (5.0s)
Ignoring differences less than 00:02.0 (2.0s)

  PKG                      TASK          ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
- libclc                   do_compile    -115.9s  -100.0%     115.9s -> 0.0s
- mesa-native              do_compile     -92.8s  -100.0%      92.8s -> 0.0s
- spirv-tools              do_compile     -81.5s  -100.0%      81.5s -> 0.0s
- spirv-llvm-translator    do_compile     -60.9s  -100.0%      60.9s -> 0.0s
- mesa-native              do_configure   -38.1s  -100.0%      38.1s -> 0.0s
- libclc                   do_configure   -14.2s  -100.0%      14.2s -> 0.0s
- spirv-tools              do_package     -13.3s  -100.0%      13.3s -> 0.0s
+ mesa-tools-native        do_configure     6.3s    +inf%       0.0s -> 6.3s
+ mesa-tools-native        do_compile      30.5s    +inf%       0.0s -> 30.5s

Cumulative walltime:
  -401.6s    -70.3%    09:31.5 (571.5s) -> 02:49.9 (169.9s)

Since mesa-native is still built for qemu machines for the
qemu-system-native recipe and it has libclc enabled for Intel machines,
here's the impact now that mesa-native with libclc support depends on
mesa-tools-native:

scripts/buildstats-diff --diff-attr walltime --min-val 0 --min-absdiff 0
after-libxml2-removal/ after-this-series/

  PKG                  TASK                         ABSDIFF    RELDIFF  WALLTIME1 -> WALLTIME2
  mesa-native          do_configure                   -0.5s      -5.0%       9.0s -> 8.5s
  mesa-native          do_populate_sysroot            -0.1s     -11.1%       0.5s -> 0.5s
  mesa-native          do_write_config                -0.0s     -33.3%       0.0s -> 0.0s
  mesa-native          do_patch                       -0.0s      -3.8%       0.3s -> 0.2s
  mesa-native          do_install                     -0.0s      -0.0%       0.4s -> 0.4s
  mesa-native          do_prepare_recipe_sysroot       0.0s      +0.0%       0.4s -> 0.4s
  mesa-native          do_rust_gen_targets             0.0s      +0.0%       0.0s -> 0.0s
  mesa-native          do_recipe_qa                    0.0s      +0.0%       0.0s -> 0.0s
  mesa-native          do_populate_lic                 0.0s      +0.0%       0.0s -> 0.0s
  mesa-native          do_create_spdx                  0.0s      +0.0%       0.1s -> 0.1s
  mesa-native          do_create_package_spdx          0.0s      +0.0%       0.0s -> 0.0s
+ mesa-tools-native    do_rust_gen_targets             0.0s      +inf%       0.0s -> 0.0s
+ mesa-tools-native    do_fetch                        0.0s      +inf%       0.0s -> 0.0s
  mesa-native          do_rust_create_wrappers         0.0s     +33.3%       0.0s -> 0.0s
  mesa-native          do_deploy_source_date_epoch     0.0s     +20.0%       0.0s -> 0.1s
  mesa-native          do_unpack                       0.0s      +0.7%       1.4s -> 1.4s
+ mesa-tools-native    do_write_config                 0.0s      +inf%       0.0s -> 0.0s
+ mesa-tools-native    do_recipe_qa                    0.0s      +inf%       0.0s -> 0.0s
+ mesa-tools-native    do_rust_create_wrappers         0.0s      +inf%       0.0s -> 0.0s
+ mesa-tools-native    do_deploy_source_date_epoch     0.1s      +inf%       0.0s -> 0.1s
+ mesa-tools-native    do_collect_spdx_deps            0.1s      +inf%       0.0s -> 0.1s
+ mesa-tools-native    do_create_spdx                  0.1s      +inf%       0.0s -> 0.1s
  mesa-native          do_collect_spdx_deps            0.1s    +157.1%       0.1s -> 0.2s
+ mesa-tools-native    do_patch                        0.2s      +inf%       0.0s -> 0.2s
+ mesa-tools-native    do_install                      0.3s      +inf%       0.0s -> 0.3s
+ mesa-tools-native    do_populate_sysroot             0.3s      +inf%       0.0s -> 0.3s
+ mesa-tools-native    do_prepare_recipe_sysroot       0.4s      +inf%       0.0s -> 0.4s
  mesa-native          do_compile                      0.7s      +1.3%      54.0s -> 54.6s
  mesa-native          do_fetch                        1.3s  +12700.0%       0.0s -> 1.3s
+ mesa-tools-native    do_unpack                       1.4s      +inf%       0.0s -> 1.4s
+ mesa-tools-native    do_configure                    6.3s      +inf%       0.0s -> 6.3s
+ mesa-tools-native    do_compile                     30.9s      +inf%       0.0s -> 30.9s

Cumulative walltime:
  41.8s    +63.1%    01:06.3 (66.3s) -> 01:48.1 (108.1s)

I think the added 42s for qemux86-64 mesa-native recipe is worth the
tens of minutes saved for every other machine building target mesa only
which depend on libclc PACKAGECONFIG (less benefit when gallium-llvm is
selected though; and not much when building with opencl).

This was tested on PX30, RK3399 and RK3588 (panfrost/panthor drivers),
kmscube still runs. I only had devices with broken display support so I
can only say that kmscube runs with the expected renderer.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (7):
      mesa: upgrade 25.3.3 -> 25.3.4
      mesa: update patch status
      mesa: make expat dependency a PACKAGECONFIG
      mesa: make zlib dependency a PACKAGECONFIG
      mesa: remove libxml2-native dependency
      add mesa-tools native-only recipe
      mesa: depend on mesa-tools-native for less expensive libclc dependency

 meta/conf/distro/include/maintainers.inc           |  1 +
 ...on-t-dump-genvk.py-args-to-generated-file.patch | 14 ++++++------
 meta/recipes-graphics/mesa/mesa-gl.bb              |  2 +-
 meta/recipes-graphics/mesa/mesa-tools-native.bb    | 19 ++++++++++++++++
 meta/recipes-graphics/mesa/mesa.bb                 |  2 ++
 meta/recipes-graphics/mesa/mesa.inc                | 25 ++++++++++------------
 6 files changed, 42 insertions(+), 21 deletions(-)
---
base-commit: 6ce19709f7835ee5cd7915e181f89397975236c8
change-id: 20260205-mesa-tools-native-afab5b8d0d21

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


