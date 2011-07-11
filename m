Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjI-0005b2-Ls
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491801"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:07 -0700
Message-Id: <cover.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 00/26] Staticdev re-packaging - split version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2011 23:17:32 -0000

Richard:

Here is a split up version of the staticdev repackaging, it adds a
new shared_lib.bbclass for packaging lib${PN} that don't fall under
Debian renaming rules (about 5 recipes).

This is the first pass, and will be iterative as I believe there are
other recipes that will need modifications.

Thanks
	Sau!


The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:

  libx11: ensure nativesdk uses correct DEPENDS and XCB flags (2011-07-10 09:49:06 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/static
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/static

Saul Wold (26):
  bitbake.conf: Add *-config to default ${PN}-dev package
  lib_package.bbclass: add *_nonshared.a to -dev package
  shared_lib.bbclass: create common class
  pciutils: repackage development files in pciutils instead of libpci
  wireless-tools: Updated for staticdev packaging
  augeas: inherit shared_lib class
  gamin: inherit shared_lib class
  sqlite3: inherit shared_lib class
  curl: inherit shared_lib class
  attr: inherit shared_lib class
  rpm: Create ${PN}-staticdev package
  libxft: use default bitbake.conf FILES Packaging to handle staticdev
  js: Use bitbake default FILES for packaging
  tcp-wrappers: Use bitbake default FILES for packaging
  udev: Use bitbake default FILES for packaging
  liba52: Use bitbake default FILES for packaging
  python: Use bitbake default FILES for packaging
  external-csl-toolchain: Use bitbake default FILES for packaging
  opkg: Use bitbake default FILES for packaging
  util-linux: Use bitbake default FILES for packaging
  gettext: Use bitbake default FILES for packaging
  gcc: Use bitbake default FILES for packaging
  glibc: Use bitbake default FILES for packaging
  eglibc: Use bitbake default FILES for packaging
  uclibc: Use bitbake default FILES for packaging
  binutils: Use bitbake default FILES for packaging

 meta/classes/lib_package.bbclass                   |    7 +++--
 meta/classes/shared_lib.bbclass                    |    9 +++++++
 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |   10 +++----
 .../wireless-tools/wireless-tools_29.bb            |   12 +++++----
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++--
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    4 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   22 ++++++++--------
 meta/recipes-core/glibc/glibc-package.inc          |   12 ++++++---
 .../meta/external-csl-toolchain_2008q3-72.bb       |   20 ++++++++-------
 meta/recipes-core/uclibc/uclibc.inc                |    7 +++--
 meta/recipes-core/udev/udev-new.inc                |   26 ++++++++++++-------
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   17 +++++++++----
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
 .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    9 +-----
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   25 +++++++++++++-----
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |   10 ++++---
 meta/recipes-devtools/opkg/opkg_svn.bb             |   10 ++++---
 meta/recipes-devtools/python/python_2.6.6.bb       |    2 -
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   16 +++++++-----
 meta/recipes-extended/augeas/augeas.inc            |    7 +----
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |   13 +--------
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |   17 +++++++-----
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +----
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +--
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |   16 +-----------
 meta/recipes-support/curl/curl_7.21.7.bb           |   17 ++++--------
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    3 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   10 +------
 40 files changed, 175 insertions(+), 171 deletions(-)
 create mode 100644 meta/classes/shared_lib.bbclass

-- 
1.7.3.4



