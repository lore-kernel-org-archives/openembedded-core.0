Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B62006E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 18:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,365,1464678000"; d="scan'208";a="995612651"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 18:49:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:49:31 -0700
Message-Id: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH 0/8] Fixes for gcc-6 (Fedora-24)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 01:49:01 -0000

[YOCTO #9897]

Fedora-24 only has gcc-6.1.1.

This has caused a number of failures in -native recipes and gcc-cross.

This series either cherry-picks commits from master or applies known good patches from upstream.

Fixes broken build for:
 - pkgconfig-native
 - elfutils-native
 - rpm-native
 - binutils-native
 - glib-2.0-native
 - docbook-utils-native (actually openjade-native was the culprit)
 - gcc-cross (gcc-cross-arm build tested for beaglebone)

Other problems may be lurking and only a world build on Fedora-24 AB will tell for sure.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>


The following changes since commit 98c57bb512ea6790db8604fcf0b88c81651d2ab4:

  build-appliance-image: Update to krogoth head revision (2016-07-06 17:28:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib timo/krogoth-9897
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/krogoth-9897

Dan McGregor (1):
  binutils: disable werror on native build

Daniel McGregor (1):
  openjade-native: work around bug exposed by GCC 6

Khem Raj (3):
  elfutils-0.148: Fix build with gcc6
  rpm: Fix build with gcc6
  glib-2.0: Ignore useless warning found with gcc-6

Tim Orling (3):
  pkgconfig: Fix build with gcc-6
  elfutils: Fix build for gcc-6
  gcc-5.3: fix build for gcc-6

 .../0001-Do-not-ignore-return-value-of-write.patch |  42 +++
 .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  |  42 +++
 .../ignore-format-nonliteral-warning.patch         |  39 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |   7 +-
 meta/recipes-devtools/binutils/binutils_2.26.bb    |   3 +-
 .../elfutils/elfutils-0.148/gcc6.patch             |  23 ++
 ...missing-brackets-around-if-statement-body.patch | 419 +++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   1 +
 meta/recipes-devtools/elfutils/elfutils_0.164.bb   |   1 +
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 .../gcc-5.3/0060-fix-build-when-using-gcc6.patch   | 157 ++++++++
 .../openjade/openjade-native_1.3.2.bb              |   1 +
 ...te-suppress-string-format-literal-warning.patch |  34 ++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   1 +
 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch    |  54 +++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |   3 +-
 16 files changed, 824 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/gcc6.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/libebl-Fix-missing-brackets-around-if-statement-body.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0060-fix-build-when-using-gcc6.patch
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch

-- 
2.7.4


