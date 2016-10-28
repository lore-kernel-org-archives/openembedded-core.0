Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACCA6FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:14:56 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878497"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:14:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:03 +0300
Message-Id: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCHv2 00/26] Enable manpages wherever possible; drop SGML stack
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
X-List-Received-Date: Fri, 28 Oct 2016 15:14:56 -0000

This patchset eanbles (conditional) building of manpages in various recipes;
there's plenty more recipes where manpages are supplied pre-built, for them
nothing needs to be done. These changes enable better support for API
documentation in Yocto SDKs (https://bugzilla.yoctoproject.org/show_bug.cgi?id=8584).

Bonus feature: the entire SGML stack is removed from OE-Core. It has become
basically obsolete, and not needed by anything in either OE-Core or broader
meta-oe collection of layers. If you need it in your 3rd party layer,
please create meta-sgml.

V2 of the patch adds fixes for lttng-tools dependency issue (unrelated to
manpages, but uncovered by enabling them). Also documentation packages are
now added to SDK images.

The following changes since commit e5815d0b607ff262663864d51fe51fbb37172329:

  build-appliance-image: Update to master head revision (2016-10-26 09:33:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/enable-documentation
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/enable-documentation

Alexander Kanavin (26):
  manpages.bbclass: add a class
  gummiboot: enable optional building of manpages
  pm-utils: enable optional building of manpages
  systemd-boot: add a comment about manpages being disabled
  avahi: enable manpages
  glib: enable optional building of manpages
  systemd: enable building of manpages if api-documentation feature is
    in distro features
  pixz: enable optional building of manpages
  gtk+: enable optional building of manpages
  json-glib: enable optional building of manpages
  libsecret: enable optional building of manpages
  libdrm: enable optional building of manpages
  kmod: enable optional building of manpages
  lttng: enable optional building of manpages
  alsa-utils: enable optional building of manpages
  pulseaudio: enable optional building of manpages
  btrfs-tools: enable optional building of manpages
  libuser: do not depend on SGML stack
  systemd: do not depend on SGML stack
  gtk+: remove dependency on SGML stack
  gtk+3: remove SGML stack dependency
  iputils: do not build or install manpages
  Remove the SGML stack
  lttng-tools: do not install manpages in ptest package
  lttng-tools: do not install shared libraries in ptest package
  core-image-{lsb/rt/sato}: add documentation packages to the SDK images

 meta/classes/manpages.bbclass                      |   5 +
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |   6 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   4 +-
 meta/recipes-bsp/systemd-boot/systemd-boot.bb      |   1 +
 meta/recipes-connectivity/avahi/avahi.inc          |   2 +-
 meta/recipes-core/glib-2.0/glib.inc                |   5 +-
 meta/recipes-core/systemd/systemd_230.bb           |   4 +-
 .../btrfs-tools/btrfs-tools_4.7.1.bb               |   4 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb       |  71 ------------
 .../docbook-sgml-dtd-3.1-native_3.1.bb             |  26 -----
 .../docbook-sgml-dtd-4.1-native_4.1.bb             |  26 -----
 .../docbook-sgml-dtd-4.5-native.bb                 |  18 ---
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |  70 ------------
 .../docbook-sgml-dtd/files/LICENSE-OASIS           |  16 ---
 .../docbook-utils/docbook-utils-0.6.14/re.patch    |  29 -----
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |  63 -----------
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |  26 -----
 .../linuxdoc-tools/disable_dvips_doc.patch         |  33 ------
 .../linuxdoc-tools/disable_sgml2rtf.patch          |  64 -----------
 .../linuxdoc-tools/disable_tex_doc.patch           |  29 -----
 .../linuxdoc-tools/disable_txt_doc.patch           |  36 ------
 .../openjade/openjade-1.3.2/fix-regex.patch        |  32 ------
 .../openjade/openjade-1.3.2/makefile.patch         |  39 -------
 .../openjade/openjade-1.3.2/msggen.pl.patch        |  44 --------
 .../openjade/openjade-1.3.2/no-libtool.patch       |  20 ----
 .../openjade/openjade-1.3.2/reautoconf.patch       |  83 --------------
 .../user-declared-default-constructor.patch        |  92 ----------------
 .../openjade/openjade-native_1.3.2.bb              | 121 ---------------------
 .../opensp-1.5.2/obsolete_automake_macros.patch    |  15 ---
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  59 ----------
 .../sgml-common/sgml-common-0.6.3/autohell.patch   |  61 -----------
 .../sgml-common/sgml-common-0.6.3/license.patch    |  29 -----
 .../sgml-common/sgml-common-native_0.6.3.bb        |  70 ------------
 .../sgml-common/sgml-common_0.6.3.bb               |  68 ------------
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |  21 ----
 meta/recipes-extended/images/core-image-lsb-sdk.bb |   2 +-
 meta/recipes-extended/iputils/iputils_s20151218.bb |  11 +-
 meta/recipes-extended/libuser/libuser_0.62.bb      |   2 +-
 meta/recipes-extended/pixz/pixz_1.0.6.bb           |   5 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   5 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 meta/recipes-gnome/json-glib/json-glib_1.2.2.bb    |   4 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.5.bb   |   4 +-
 meta/recipes-graphics/drm/libdrm_2.4.70.bb         |   4 +-
 meta/recipes-kernel/kmod/kmod.inc                  |   5 +-
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |  10 +-
 meta/recipes-kernel/lttng/lttng-ust_git.bb         |   4 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.1.2.bb   |   4 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   3 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb        |   2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |   2 +-
 51 files changed, 59 insertions(+), 1302 deletions(-)
 create mode 100644 meta/classes/manpages.bbclass
 delete mode 100644 meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
 delete mode 100644 meta/recipes-devtools/docbook-sgml-dtd/files/LICENSE-OASIS
 delete mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
 delete mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_dvips_doc.patch
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_sgml2rtf.patch
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_tex_doc.patch
 delete mode 100644 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools/disable_txt_doc.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/makefile.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/reautoconf.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch
 delete mode 100644 meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
 delete mode 100644 meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/opensp/opensp_1.5.2.bb
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb
 delete mode 100644 meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
 delete mode 100644 meta/recipes-devtools/sgmlspl/sgmlspl-native_git.bb

-- 
2.9.3


