Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01258C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 08:32:23 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web10.18736.1751445139697515448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 01:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=WZas5puE;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751445139; x=1782981139;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5Hl4ThS55gTPfzACHlb/8TfRjTBLtPc34PRcW8HWyiw=;
  b=WZas5puE++RfMrmWD3ltIzdt9z7U/Cfk+byTDsaKF8fFMRd30c8KfHr8
   m4GPJ/S/rTzOT3edtiEM878t/FV7xZp5WksJvxDspfZl6aTw6/LPtlpo0
   wMbDlGmZljw+uC78EasgNsVCV4cVqnE7ObHDT0gLB68ONq8Hfa80B4sN/
   E=;
X-CSE-ConnectionGUID: 2dCO7RMQTQa9twxZOcoYQA==
X-CSE-MsgGUID: 94SHlH5STFaikMW0GlDfyQ==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Jul 2025 10:32:17 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 02 Jul 2025 10:32:17 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 02 Jul 2025 10:32:10 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 10:32:10 +0200
X-CSE-ConnectionGUID: TAyjX2gJR2GnxH9XoqWz/g==
X-CSE-MsgGUID: Ug7URwKbSg69rG8VNNfdUA==
X-CSE-ConnectionGUID: jDqV9LqTQGqdc+TLmj4MKg==
X-CSE-MsgGUID: 4SvRmvV7RMmrw+BzKjuxyw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <alex.kanavin@gmail.com>,
	<quentin.schulz@cherry.de>, <antonin.godard@bootlin.com>,
	<Peter.Marko@siemens.com>
Subject: [PATCH v3 0/7] cmake: Major version bump to 4.0.3
Date: Wed, 2 Jul 2025 10:31:41 +0200
Message-ID: <20250702083148.3035805-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18e.europe.bmw.corp (2a03:1e80:a15:58f::1:75) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219801

This patch series bumps CMake to 4.0.3, the most current of the 4.x releases.
That bump allows us to drop all of the upstreamable patches for CMake itself
that we currently carry, which was the motivation for the update as suggested by
Alex Kanavin in [0].

A number of components require (minor) patches to build with the new CMake
version. In most cases, those are backports of commits that haven't made it into
an upstream release yet.

The bump depends on this patches, but not vice-versa (since we are already on
CMake 3.31). Thus, if desired, it would be possible to pull the 'Allow builds
with CMake 4+' patches in in advance of the actual bump.

changes in v3:

- Updated patch series description.
- Added four additional commits with patches for build failures seen on
  Autobuilder. Those should be all be fixed now, apart from the one in
  meta-virt (yajl-2.1.0), which I don't have set up locally.
- Fix for test failure seen in SDK tests.

changes in v2:

- Re-ordered / squashed commits to keep bisectability (see [3], [4])
- Fixed patchtest findings

[0]: https://lists.openembedded.org/g/openembedded-core/message/219113
[1]: https://git.openembedded.org/openembedded-core/commit/?id=c3efca7495889f3682225af8c9e01ceb094b1bb7
[2]: https://git.openembedded.org/openembedded-core/commit/?id=cb5234acdab200bd43b89416d8d7e9df91af58cc
[3]: https://lists.openembedded.org/g/openembedded-core/message/219403
[4]: https://lists.openembedded.org/g/openembedded-core/message/219425

CC: alex.kanavin@gmail.com
CC: quentin.schulz@cherry.de
CC: antonin.godard@bootlin.com
CC: Peter.Marko@siemens.com

Moritz Haase (7):
  libcomps: Backport patch to support builds with CMake 4+
  createrepo-c: Backport patches to support builds with CMake 4+
  apt: Backport patch to support builds with CMake 4+
  libubootenv: Backport patch to support builds with CMake 4+
  musl-locales: Add patch to support builds with CMake 4+
  libwpe: Add patch to support builds with CMake 4+
  cmake: upgrade 3.31.6 -> 4.0.3

 .../sdkext/files/myapp_cmake/CMakeLists.txt   |   2 +-
 ...Update-cmake_minimum_required-to-3.5.patch |  50 ++++
 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb  |   4 +-
 ...red-CMake-version-to-3.5-to-allow-bu.patch |  41 ++++
 meta/recipes-core/musl/musl-locales_git.bb    |   4 +-
 ...mum_required-to-3.13-to-avoid-warnin.patch |  47 ++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |   1 +
 ...native_3.31.6.bb => cmake-native_4.0.3.bb} |   6 +-
 meta/recipes-devtools/cmake/cmake.inc         |   8 +-
 ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 -----
 ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
 ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
 ...trary-characters-in-test-names-of-CT.patch | 202 ----------------
 ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
 .../cmake/{cmake_3.31.6.bb => cmake_4.0.3.bb} |   1 -
 .../0001-Fix-libname-of-Libs.private.patch    |  22 ++
 ...ED_TARGET-for-3rd-party-dependencies.patch | 226 ++++++++++++++++++
 ...-imported-targets-of-turned-off-depe.patch |  53 ++++
 ...ds-without-Doxygen-being-present-wit.patch |  50 ++++
 .../createrepo-c/createrepo-c_1.2.1.bb        |   4 +
 ...libcomps-Support-builds-with-CMake-4.patch | 132 ++++++++++
 .../libcomps/libcomps_0.1.21.bb               |   1 +
 ...red-CMake-version-to-3.5-to-allow-bu.patch |  38 +++
 meta/recipes-sato/webkit/libwpe_1.16.2.bb     |   6 +-
 24 files changed, 687 insertions(+), 314 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
 create mode 100644 meta/recipes-core/musl/musl-locales/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb => cmake-native_4.0.3.bb} (90%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
 rename meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch => 0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch} (90%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-arbitrary-characters-in-test-names-of-CT.patch
 rename meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable-USE_NGHTTP2.patch => 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (83%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb => cmake_4.0.3.bb} (96%)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Fix-libname-of-Libs.private.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0002-Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0003-Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0004-cmake-Allow-builds-without-Doxygen-being-present-wit.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Support-builds-with-CMake-4.patch
 create mode 100644 meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch


