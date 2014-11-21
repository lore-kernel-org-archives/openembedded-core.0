Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 10DF1718EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 17:20:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 21 Nov 2014 09:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="626293790"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2014 09:20:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 09:20:10 -0800
Message-Id: <cover.1416590209.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/7] A patch, cleanup and updates
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
X-List-Received-Date: Fri, 21 Nov 2014 17:20:26 -0000

Richard, Ross:

Here is a tested set of updates along with the pseudo cleanup.
I also finally tackled an ages old resolvconf bug, I guess no one
really uses it since it was so badly broken (tested with both 
busybox's udhcpc and dhcp-client).


Sau!

The following changes since commit 4a888b2ab61662c7f749b5d1e64af92ed613d8eb:

  gtk+: drop part of patch adding useless file (2014-11-20 14:08:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (7):
  curl: Ugrade to 7.38
  babeltrace: Upgrade to 1.2.3
  npth: Upgrade to 1.1
  boost: Upgrade to 1.57
  libaio: Upgrade to 3.110
  pseudo: remove older version and patches
  resolvconf: add fixes for busybox and make it work

 meta/conf/distro/include/security_flags.inc        |   1 +
 .../resolvconf/resolvconf/99_resolvconf            |   4 +
 .../resolvconf/fix-path-for-busybox.patch          |  20 +
 .../resolvconf/resolvconf_1.76.bb                  |  13 +-
 .../0001-pseudo_has_unload-add-function.patch      | 190 ----------
 .../pseudo-1.5.1-install-directory-mode.patch      |  18 -
 .../pseudo/files/pseudo-fchmodat-permissions.patch | 264 -------------
 .../pseudo/files/shutdownping.patch                |  53 ---
 meta/recipes-devtools/pseudo/files/symver.patch    |  26 --
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |  20 -
 .../recipes-extended/libaio/libaio/00_arches.patch | 208 +----------
 .../libaio/libaio/libaio-aarch64.patch             |  28 --
 .../libaio/libaio/libaio_fix_for_mips64.patch      |  68 ++--
 .../recipes-extended/libaio/libaio/toolchain.patch |  27 --
 .../{libaio_0.3.109.bb => libaio_0.3.110.bb}       |   9 +-
 ...-Support-out-of-tree-builds-in-babeltrace.patch |  17 -
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |  54 ---
 .../{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb}   |   9 +-
 ...bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} |   0
 .../boost/{boost-1.56.0.inc => boost-1.57.0.inc}   |   4 +-
 ...rt-for-extending-operations-to-GCC-atomic.patch | 412 ---------------------
 .../boost/{boost_1.56.0.bb => boost_1.57.0.bb}     |   1 -
 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 --------------
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |  69 ----
 .../curl/{curl_7.37.1.bb => curl_7.38.0.bb}        |   8 +-
 meta/recipes-support/npth/npth/pkgconfig.patch     |  48 +++
 .../npth/{npth_1.0.bb => npth_1.1.bb}              |   5 +-
 27 files changed, 156 insertions(+), 1689 deletions(-)
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/shutdownping.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/symver.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
 delete mode 100644 meta/recipes-extended/libaio/libaio/toolchain.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.109.bb => libaio_0.3.110.bb} (74%)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb} (73%)
 rename meta/recipes-support/boost/{bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.56.0.inc => boost-1.57.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
 rename meta/recipes-support/boost/{boost_1.56.0.bb => boost_1.57.0.bb} (50%)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch
 rename meta/recipes-support/curl/{curl_7.37.1.bb => curl_7.38.0.bb} (90%)
 create mode 100644 meta/recipes-support/npth/npth/pkgconfig.patch
 rename meta/recipes-support/npth/{npth_1.0.bb => npth_1.1.bb} (74%)

-- 
1.8.3.1


