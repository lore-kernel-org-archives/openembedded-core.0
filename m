Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TjepO-0003Nu-LM
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:38:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Dec 2012 15:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,285,1355126400"; d="scan'208";a="234328783"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com) ([10.255.14.3])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2012 15:23:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 15:23:23 -0800
Message-Id: <cover.1355527172.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.1
Subject: [CONSOLIDATED PULL 00/32] SMART, CVEs and fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 23:38:03 -0000

Richard,

Finally got a clean set of changes with the SMART set, this also
includes Martin's gettext-minimal change which may requires some
to need to do a cleansstate on gettext-native and gettext-minimal-native

If you get strange failures with the remove_potcdate.sin patch then
you need to do the cleansstate per Martin's email.

Sau!

The following changes since commit ad79360c1d992830d4f0e06a3bbf0622658c0540:

  populate_sdk_base: Add perl modules as needing to be relocated (2012-12-14 17:30:41 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Darander (1):
  linux-firmware: split out ralink drivers

Fahad Usman (3):
  perf: kill -Werror
  perf: pass CFLAGS and LDFLAGS
  iperf: pass in target path vars

Hongxu Jia (3):
  mkelfimage-native:make failed if libz not in host
  native tools set packagegroup
  ghostscript-native:fix host underlinking issues

Kang Kai (1):
  newt: enable python support

Li Wang (5):
  cups: CVE-2012-5519
  libxml2 CVE-2012-2871
  librsvg: CVE-2011-3146
  cups - CVE-2011-2896
  cups CVE-2011-3170

Lukas Bulwahn (1):
  distutils: Replacing path to native python by path to python in the
    image to support python packages with console-script setup

Mark Hatle (8):
  package_rpm: Update the way the multilib package names are translated
  package_rpm.bbclass: Fix the way the RPM platform file is generated
  package_rpm.bbclass: Add additional logging
  package_rpm.bbclass: Add support for incremental installs
  package_rpm.bbclass: Add additional install error detection
  rpm/smart: Fix runtime-relocation issues w/ RPM and Smart
  package_rpm.bbclass: Add a simply way to enable RPM debugging
  package_rpm: Workaround for 'all' arch multilib package naming

Marko Lindqvist (1):
  xserver-xorg: add libgcrypt dependency

Martin Jansa (2):
  gettext: move remove-potcdate.sin from gettext-native to
    gettext-minimal-native
  autotools: copy also remove-potcdate.sin from
    ${STAGING_DATADIR_NATIVE}/gettext/po

Paul Eggleton (3):
  classes/*_rpm: integrate Smart into RPM filesystem construction
  classes/rootfs_rpm: install smart instead of zypper in rpm-based
    images
  Update sanity tests to use smart instead of zypper

Richard Purdie (1):
  lib/oe/patch: Use force option when creating symlinks to patches

Ross Burton (1):
  mesa: remove dependency on mesa-dri in mesa-dri-dev

Trevor Woerner (1):
  runqemu: add support for FSTYPE=vmdk

yanjun.zhu (1):
  squashfs: fix CVE-2012-4025

 meta/classes/autotools.bbclass                     |    3 +
 meta/classes/distutils.bbclass                     |    2 +
 meta/classes/imagetest-qemu.bbclass                |    6 +-
 meta/classes/package_rpm.bbclass                   |  739 +++--
 meta/classes/populate_sdk_rpm.bbclass              |   79 +-
 meta/classes/rootfs_rpm.bbclass                    |   87 +-
 meta/lib/oe/patch.py                               |    2 +-
 .../gettext-minimal-0.18.1.1/remove-potcdate.sin   |   19 +
 .../gettext/gettext-minimal-native_0.18.1.1.bb     |    4 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 .../libxml/libxml2/libxml2-CVE-2012-2871.patch     |   34 +
 meta/recipes-core/libxml/libxml2_2.9.0.bb          |    5 +-
 .../mkelfimage/fix-makefile-to-find-libz.patch     |   30 +
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |    3 +-
 .../python/python-smartpm_1.4.1.bb                 |   17 +-
 .../rpm/rpm/rpm-debug-platform.patch               |   65 +
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |   87 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   41 +-
 .../patches/squashfs-4.2-fix-CVE-2012-4025.patch   |  190 ++
 ...dd-a-commment-and-fix-some-other-comments.patch |   38 +
 .../patches/squashfs-fix-open-file-limit.patch     |  215 ++
 .../squashfs-tools/squashfs-tools_4.2.bb           |    5 +-
 .../cups/cups-1.4.6/cups-CVE-2011-2896.patch       |  140 +
 .../cups/cups-1.4.6/cups-CVE-2011-3170.patch       |   54 +
 .../cups/cups-1.4.6/cups-CVE-2012-5519.patch       | 2965 ++++++++++++++++++++
 meta/recipes-extended/cups/cups_1.4.6.bb           |    5 +-
 ...tscript-native-fix-disable-system-libtiff.patch |   51 +
 .../ghostscript/ghostscript_9.05.bb                |   15 +-
 .../newt/files/fix_python_fpic.patch               |   24 +
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |   24 +-
 .../librsvg-2.32.1/librsvg-CVE-2011-3146.patch     | 1088 +++++++
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    6 +-
 .../packagegroups/packagegroup-toolset-native.bb   |  236 ++
 meta/recipes-graphics/mesa/mesa-common.inc         |    8 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |   10 +-
 meta/recipes-kernel/perf/perf_3.4.bb               |   25 +-
 .../sanity/{zypper_help => smart_help}             |   24 +-
 .../sanity/{zypper_search => smart_query}          |   24 +-
 .../scenario/qemuarm/core-image-lsb                |    4 +-
 .../scenario/qemuarm/core-image-sato               |    4 +-
 .../scenario/qemuarm/core-image-sato-sdk           |    4 +-
 .../scenario/qemumips/core-image-lsb               |    4 +-
 .../scenario/qemumips/core-image-sato              |    4 +-
 .../scenario/qemumips/core-image-sato-sdk          |    4 +-
 .../scenario/qemuppc/core-image-lsb                |    4 +-
 .../scenario/qemuppc/core-image-sato               |    4 +-
 .../scenario/qemuppc/core-image-sato-sdk           |    4 +-
 .../scenario/qemux86-64/core-image-lsb             |    4 +-
 .../scenario/qemux86-64/core-image-sato            |    4 +-
 .../scenario/qemux86-64/core-image-sato-sdk        |    4 +-
 .../scenario/qemux86/core-image-lsb                |    4 +-
 .../scenario/qemux86/core-image-sato               |    4 +-
 .../scenario/qemux86/core-image-sato-sdk           |    4 +-
 .../tools/{zypper_test.sh => smart_test.sh}        |   22 +-
 scripts/runqemu                                    |   39 +-
 scripts/runqemu-internal                           |   20 +-
 58 files changed, 5856 insertions(+), 662 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/remove-potcdate.sin
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/fix-makefile-to-find-libz.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4025.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-add-a-commment-and-fix-some-other-comments.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-fix-open-file-limit.patch
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-2896.patch
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2012-5519.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-native-fix-disable-system-libtiff.patch
 create mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
 rename scripts/qemuimage-tests/sanity/{zypper_help => smart_help} (52%)
 rename scripts/qemuimage-tests/sanity/{zypper_search => smart_query} (50%)
 rename scripts/qemuimage-tests/tools/{zypper_test.sh => smart_test.sh} (46%)

-- 
1.8.0.1



