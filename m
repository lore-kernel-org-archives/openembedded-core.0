Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 379B977AA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889195"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:39:51 +0300
Message-Id: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/11] Various updates for 2.4
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:17 -0000

Here are various updates that should be go into 2.4 branch:
1) remove a few unneeded recipes
2) update dnf/libdnf to latest upstream versions, which enables
package feed signing
3) move libxml2 to Python 3
4) add an automated test for upstream version checks regressions, as I don't really
want to keep fixing them by hand for other people. If you break it, autobuilder will
complain.

The following changes since commit 7a0e795373653886452a7a2992ced10080711c26:

  build-appliance-image: Update to master head revision (2017-04-21 08:22:18 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (11):
  libiconv: remove recipe
  byacc: remove the recipe
  libxml2: move python module to Python 3
  libsolv: switch on ENABLE_COMPLEX_DEPS
  libdnf: update to 0.8.1
  dnf: update to 2.3.0
  python3-pygpgme: remove the recipe
  libunwind: update to 1.2
  acpica: fix upstream version check
  python3-iniparse: fix upstream version check
  oe-selftest: add a test for upstream version check regressions

 meta-selftest/files/distrodata/checkpkg_exceptions |   27 +
 meta/lib/oeqa/selftest/distrodata.py               |   41 +
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |    8 +-
 ...er-check-of-releasever-when-using-install.patch |  105 +
 meta/recipes-devtools/dnf/dnf_git.bb               |    9 +-
 ...ers-for-both-libsolv-and-libsolvext-libdn.patch |   13 +-
 ...-variables-with-pkg-config-cmake-s-own-mo.patch |   15 +-
 meta/recipes-devtools/libdnf/libdnf_git.bb         |    4 +-
 .../python/python3-iniparse_0.4.bb                 |    1 +
 .../recipes-devtools/python/python3-pygpgme_0.3.bb |   18 -
 meta/recipes-extended/acpica/acpica_20150515.bb    |    1 +
 meta/recipes-extended/acpica/acpitests_20140828.bb |    1 +
 meta/recipes-extended/byacc/byacc.inc              |   22 -
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  |  161 -
 meta/recipes-extended/byacc/byacc/byacc-open.patch |   25 -
 meta/recipes-extended/byacc/byacc_20161202.bb      |   12 -
 meta/recipes-extended/libsolv/libsolv_0.6.26.bb    |    2 +-
 .../packagegroup-core-full-cmdline.bb              |    1 -
 .../libiconv-1.14/add-relocatable-module.patch     | 5008 --------------------
 .../libiconv/libiconv-1.14/autoconf.patch          |   50 -
 meta/recipes-support/libiconv/libiconv_1.14.bb     |   51 -
 meta/recipes-support/libunwind/libunwind.inc       |    2 +-
 .../{libunwind_git.bb => libunwind_1.2.bb}         |    9 +-
 23 files changed, 207 insertions(+), 5379 deletions(-)
 create mode 100644 meta-selftest/files/distrodata/checkpkg_exceptions
 create mode 100644 meta/lib/oeqa/selftest/distrodata.py
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-of-releasever-when-using-install.patch
 delete mode 100644 meta/recipes-devtools/python/python3-pygpgme_0.3.bb
 delete mode 100644 meta/recipes-extended/byacc/byacc.inc
 delete mode 100644 meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
 delete mode 100644 meta/recipes-extended/byacc/byacc/byacc-open.patch
 delete mode 100644 meta/recipes-extended/byacc/byacc_20161202.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/autoconf.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.14.bb
 rename meta/recipes-support/libunwind/{libunwind_git.bb => libunwind_1.2.bb} (81%)

-- 
2.11.0


