Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNVto-0002T1-VN
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 21:34:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Nov 2011 12:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="34179994"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Nov 2011 12:28:17 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 14:28:52 -0600
Message-Id: <cover.1320697346.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/6][v2] Add some intel-specific tune files, and related fixes
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
X-List-Received-Date: Mon, 07 Nov 2011 20:34:33 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset adds some new tune files for corei7, ivb, and atom.

The corei7 and atom were build- and boot-tested on sugarbay (with
corei7-avx), jasperforest (corei7), crownbay, fri2, fishriver (atom).
The ivb is one I'll be using for new Ivy Bridge development and
hasn't been tested yet, but will be needed for that.

This patchset also contains a few patches for packages that had build
problems with the corei7-avx tuning.  The python and gmp packages had
problems because they tried to execute target code on the host and caused
illegal instruction errors.  The libzypp failed compilation because of
the hyphens in the tune name (corei7-avx).

v2: do it using create-pull-request, fix subject on python patch

The following changes since commit 28940eb97d835b45ecbf832f25e94fc1574f25a1:
  Koen Kooi (1):
        lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/newtune-v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/newtune-v0

Tom Zanussi (6):
  tune-corei7: Add tune file for Intel Core i7 machines
  tune-ivb: Add tune file for Intel Ivy Bridge machines
  machine/include/tune-atom.inc: add atom-specific settings
  gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
  libzypp: fix mishandling of hyphenated arches
  python: skip setup.py 'import check' when cross-compiling

 meta/conf/machine/include/tune-atom.inc            |   26 +++++++++++++++++-
 meta/conf/machine/include/tune-corei7.inc          |   17 ++++++++++++
 meta/conf/machine/include/tune-ivb.inc             |   11 ++++++++
 .../python/setup_py_skip_cross_import_check.patch  |   27 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    5 +++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 +++---
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    3 +-
 7 files changed, 90 insertions(+), 7 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-corei7.inc
 create mode 100644 meta/conf/machine/include/tune-ivb.inc
 create mode 100644 meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch



