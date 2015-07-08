Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 2E48373BB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:07:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0E1595188047
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 11:06:59 +0100
Message-Id: <cover.1436349671.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/18] Proposed changes for fido
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
X-List-Received-Date: Wed, 08 Jul 2015 10:07:22 -0000

Please merge the changes on my joshuagl/fido-next branch into fido.

Most of the patches are for CVE fixes or fixes for gcc 5 related issues.

Cheers,

Joshua

The following changes since commit 7d445547df528aa9e5bfb85568a7270e27f633ef:

  subversion: Fix subversion-native on Fedora22 (2015-06-28 09:45:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Andre McCurdy (1):
  gnutls: use pkg-config to locate zlib

Andreas Oberritter (1):
  gdb: Add missing runtime dependency for python option

Kang Kai (1):
  gst-plugins-bad: fix CVE-2015-0797

Khem Raj (2):
  u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
  mtd-utils: update to latest and fix static inlining

Leonardo Sandoval (1):
  terminal.py: Allow devshell/menuconfig on recent gnome-terminal

Mariano Lopez (1):
  report-error.bbclass: Added file syncronization.

Paul Eggleton (1):
  oe-selftest: devtool: fix test_devtool_update_recipe_git

Richard Purdie (6):
  oeqa/parselogs: Whitelist qemuarm64 runtime errors
  testimage: Don't test xorg/vnc on qemuarm64
  oeqa/parselogs: Whitelist qemumips64 runtime error
  lib/oe/patch: Fix git patch application for source in subdirectory
  lib/devtool/standard: Fix patch cleanup
  oeqa/bbtests: Fix race over DL_DIR and SSTATE_DIR

Roy Li (1):
  unzip: fix four CVE defects

Saul Wold (2):
  binutils: Add -momit-lock-prefix support
  rootfs.py: Add check for kernel modules before running depmod

fan.xin (1):
  wpa-supplicant: Fix CVE-2015-4142

 meta/classes/report-error.bbclass                  |  11 +-
 meta/classes/testimage.bbclass                     |   4 +
 meta/lib/oe/patch.py                               |   6 +-
 meta/lib/oe/rootfs.py                              |  18 +-
 meta/lib/oe/terminal.py                            |   6 +
 meta/lib/oeqa/runtime/parselogs.py                 |   7 +
 meta/lib/oeqa/selftest/bbtests.py                  |   6 +
 meta/lib/oeqa/selftest/devtool.py                  |  26 ++-
 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch  |  91 ++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb  |   4 +-
 ...integer-underflow-in-WMM-Action-frame-par.patch |  45 ++++
 meta/recipes-devtools/binutils/binutils-2.24.inc   |   1 +
 .../0001-Add-momit_lock_prefix-no-yes-option.patch | 236 +++++++++++++++++++++
 meta/recipes-devtools/gdb/gdb_7.8.1.bb             |   2 +-
 ...emove-duplicate-hashtable_iterator_value-.patch |  64 ++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   1 +
 .../unzip/09-cve-2014-8139-crc-overflow.patch      |  52 +++++
 .../unzip/10-cve-2014-8140-test-compr-eb.patch     |  33 +++
 .../unzip/11-cve-2014-8141-getzip64data.patch      | 144 +++++++++++++
 .../unzip/12-cve-2014-9636-test-compr-eb.patch     |  45 ++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   4 +
 .../gst-plugins-bad/buffer-overflow-mp4.patch      |  36 ++++
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   2 +
 .../gnutls/use-pkg-config-to-locate-zlib.patch     |  67 ++++++
 meta/recipes-support/gnutls/gnutls_3.3.12.bb       |   1 +
 scripts/lib/devtool/standard.py                    |   3 +-
 26 files changed, 897 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Add-momit_lock_prefix-no-yes-option.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-bad/buffer-overflow-mp4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch

-- 
2.1.4


