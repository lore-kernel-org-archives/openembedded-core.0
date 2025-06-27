Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35E2C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:06:56 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web10.12010.1751026014421691239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=PixOQ4NF;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=2668831fb=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751026014; x=1782562014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2Ly/2PHgCQ8QRb4BnDhdEXio2LjueMmH8JvUITpujU0=;
  b=PixOQ4NFrTmzmJzPE8MMRQHFEx3htarf1R0u4LDZjqDvdhaU7KV75CWX
   oxS1lbMXKr16AA4W6eZPejpHU1GDPGb+Hz7DFubP5RUxWKYZCDkr+8ndm
   i7Wbn/vB+tMbASyXk1LVqen9XBiLHXmsThxmWPFvywkim1KFh+nzkYjpR
   4=;
X-CSE-ConnectionGUID: 6vvCe9PySYatv0C4gmDgJQ==
X-CSE-MsgGUID: DY0YBQQvRvSWj5NyTekAPQ==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Jun 2025 14:06:52 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 27 Jun 2025 14:06:52 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 27 Jun 2025 14:06:52 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 27 Jun 2025 14:06:51 +0200
X-CSE-ConnectionGUID: 72DFsIkESLSV8ps2sRgOmg==
X-CSE-MsgGUID: KM/ohrHsTcqJ/Wp0l/YG1A==
X-CSE-ConnectionGUID: CEHQo7jQSkyEschGsnl5fQ==
X-CSE-MsgGUID: pUeljn3rT3qNkfYQ0Ty2gg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <alex.kanavin@gmail.com>
Subject: [PATCH 0/4] cmake: Major version bump to 4.0.3
Date: Fri, 27 Jun 2025 14:06:29 +0200
Message-ID: <20250627120633.4084140-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15e.europe.bmw.corp (2a03:1e80:a15:58f::1:61) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219394

This patch series bumps CMake to 4.0.3, the most current of the 4.x releases.
That bump allows us to drop all of the upstreamable patches for CMake itself
that we currently carry, which was the motivation for the update as suggested by
Alex Kanavin in [0].

Following the preparatory merge of [1] and [2], there are only two components
that require patches to build with the new CMake version. For both createrepo-c
and libcomps, those patches have already been merged upstream, but there have
been no subsequent releases yet. Thus, backports of the patches are included.

[0]: https://lists.openembedded.org/g/openembedded-core/message/219113
[1]: https://git.openembedded.org/openembedded-core/commit/?id=c3efca7495889f3682225af8c9e01ceb094b1bb7
[2]: https://git.openembedded.org/openembedded-core/commit/?id=cb5234acdab200bd43b89416d8d7e9df91af58cc

CC: alex.kanavin@gmail.com

Moritz Haase (4):
  cmake: upgrade 3.31.6 -> 4.0.3
  cmake: Update license checksums
  libcomps: Backport patch to support builds with CMake 4+
  createrepo-c: Backport patches to support builds with CMake 4+

 ...native_3.31.6.bb => cmake-native_4.0.3.bb} |   6 +-
 meta/recipes-devtools/cmake/cmake.inc         |   8 +-
 ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 -----
 ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
 ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
 ...trary-characters-in-test-names-of-CT.patch | 202 ----------------
 ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
 .../cmake/{cmake_3.31.6.bb => cmake_4.0.3.bb} |   1 -
 .../0001-Fix-libname-of-Libs.private.patch    |  21 ++
 ...ED_TARGET-for-3rd-party-dependencies.patch | 225 ++++++++++++++++++
 ...-imported-targets-of-turned-off-depe.patch |  52 ++++
 ...ds-without-Doxygen-being-present-wit.patch |  49 ++++
 .../createrepo-c/createrepo-c_1.2.1.bb        |   4 +
 ...libcomps-Support-builds-with-CMake-4.patch | 131 ++++++++++
 .../libcomps/libcomps_0.1.21.bb               |   1 +
 15 files changed, 494 insertions(+), 309 deletions(-)
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


