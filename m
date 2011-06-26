Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qah8w-0005Iq-Fh
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 06:40:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2011 21:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,427,1304319600"; d="scan'208";a="20036838"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.246])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2011 21:36:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jun 2011 21:36:40 -0700
Message-Id: <cover.1309059243.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [RFC - Staticdev 0/2] Move static libraries to -staticdev packages
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
X-List-Received-Date: Sun, 26 Jun 2011 04:40:22 -0000


This RFC is for moving the static libraries to -staticdev, 
I have already had some input to this patch set from other.

I have modified bitbake.conf to add a -staticdev package similar
to the -dev package.

I also added a new libdev.bbclass that a number of ther classes 
inherit which provides a similar set of functionality but for the 
lib${PN} packages.

Please review and comment, I will make a pull request on Tuesday if
no comments are received.

Thanks
	Sau!


The following changes since commit 3aec2fa2df9aaa883feda0d7aed85e63d01398b9:

  qemuimagetest: update cvs and iptables to newer version for toolchain test (2011-06-24 11:28:28 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/rfc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/rfc

Saul Wold (2):
  multiple recipes converted to -staticdev packages
  systemtap: add sqlite3 to DEPENDS

 meta/classes/libdev.bbclass                        |   44 ++++++++++++++++++++
 meta/conf/bitbake.conf                             |    8 +++-
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++-
 .../wireless-tools/wireless-tools_29.bb            |    9 +++-
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    9 +++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++----
 meta/recipes-core/glibc/glibc-package.inc          |    9 +++-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    2 +-
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
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |   16 +-------
 meta/recipes-support/curl/curl_7.21.6.bb           |   17 +++-----
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    5 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   10 +----
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
 42 files changed, 197 insertions(+), 146 deletions(-)
 create mode 100644 meta/classes/libdev.bbclass

-- 
1.7.3.4



