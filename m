Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QbiMk-0005YY-UZ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:10:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 17:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="21691013"
Received: from swold-mobl.jf.intel.com ([10.24.0.56])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 17:07:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 17:07:05 -0700
Message-Id: <cover.1309305731.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] multiple recipes converted to use -staticdev
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
X-List-Received-Date: Wed, 29 Jun 2011 00:10:51 -0000

This commit adds a new base package ${PN}-staticdev to
bitbake.conf which pulls in the static *.a libraries as
a seperate package, it filters out the nonshared.a
libraries where appropriate.

Additional this commit adds a new libdev.bbclass which provides
a set of macros and variables to convert ${PN} to lib${PN},
which a number of recipes where then converted to use.

PR bumps all around

The following changes since commit 8a5c20417d4d6bee6dd0bcdbeb8d4f9e0696a216:

  [PATCH] u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/static
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/static

Saul Wold (1):
  multiple recipes converted to -staticdev packages

 meta/classes/lib_package.bbclass                   |   10 ++++-
 meta/classes/libdev.bbclass                        |   44 ++++++++++++++++++++
 meta/conf/bitbake.conf                             |    8 +++-
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++-
 .../wireless-tools/wireless-tools_29.bb            |    9 +++-
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    9 +++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++----
 meta/recipes-core/glibc/glibc-package.inc          |    9 +++-
 .../meta/external-csl-toolchain_2008q3-72.bb       |    8 ++-
 meta/recipes-core/uclibc/uclibc.inc                |    9 +++-
 meta/recipes-core/udev/udev-new.inc                |   14 ++++--
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   11 ++++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian_2.21.bb       |    2 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
 .../binutils/binutils-crosssdk_2.21.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    9 +---
 meta/recipes-devtools/binutils/binutils_2.21.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   25 ++++++++---
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 ++-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    8 ++-
 meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 ++++----
 meta/recipes-extended/augeas/augeas.inc            |    7 +--
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |   13 +-----
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +--
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |   16 +-------
 meta/recipes-support/curl/curl_7.21.6.bb           |   17 +++-----
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    5 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   10 +----
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
 42 files changed, 204 insertions(+), 147 deletions(-)
 create mode 100644 meta/classes/libdev.bbclass

-- 
1.7.3.4



