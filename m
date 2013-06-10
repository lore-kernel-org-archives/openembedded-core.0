Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4582060811
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:07:20 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2013 15:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,841,1363158000"; d="scan'208";a="253173516"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jun 2013 15:07:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 15:07:19 -0700
Message-Id: <cover.1370901550.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/35] Qt and postinsts patches
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
X-List-Received-Date: Mon, 10 Jun 2013 22:07:20 -0000

Richard,

Here is some updates and patches, the bulk of which are 
QT and Postinstall related.

I also include the Updated GStreamer 1.0, to be kept in
parallel with the older one for now, when the time is right
we will depericate the 0.10 version.

I tested your change set with MUT over the weekend, but
did include them here since they contain both bitbake and
OE-Core changes and figured you would merge them.

I will test MUT again with the updated build tarball later
today.

Sau!


The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (2):
  openssh : upgrade to 6.2p2
  sudo : upgrade to 1.8.6p8

Carlos Rafael Giani (1):
  gstreamer: added GStreamer 1.0 recipes

Felipe F. Tonello (1):
  libxml2: added python dependency to nativesdk

Hongxu Jia (2):
  init-live.sh: fix media automount failed after booting from usb-drive
  ddimage: fix incompatibility with dash

Jonathan Liu (10):
  nativesdk-qt4-tools.inc: update HOMEPAGE
  qt-mobility: update HOMEPAGE
  qt4-embedded: update HOMEPAGE
  qt4-native: update HOMEPAGE
  qt4-x11-free: update HOMEPAGE
  qt4-native: build lconvert and xmlpatterns
  classes/qmake2: export OE_QMAKE_LCONVERT and OE_QMAKE_XMLPATTERNS
  classes/qmake_base: update .pro hack
  qt4-native: update configure paths to match target
  qt4: fix QMAKE_QT_CONFIG being overwritten with empty value

Laurentiu Palcu (7):
  rootfs_*.bbclass: add some helper functions
  image.bbclass: remove unneeded files from the image
  core-image-minimal: do not remove packaging files in the rootfs
    postprocess
  run-postinsts: make it generic
  rootfs_rpm.bbclass: switch to using run-postinsts
  package_rpm.bbclass: handle pre/post remove scriptlets
  rpm: replace rpm-postinsts dependency with run-postinsts

Marko Lindqvist (2):
  gnomebase.bbclass: implement gnome_verdir() using trim_version()
  gnomebase.bbclass: add support for archive name different from BPN

Paul Eggleton (1):
  classes/buildhistory: split SDK data by IMAGE_NAME

Roy.Li (3):
  socat: enable termios
  PPP: add default configuration file and fix hard-coded CFLAGS
  trace-cmd: backport three patches

Saul Wold (4):
  createrepo: Fix usage of create_wrapper
  dpkg: Fix usage of create_wrapper
  gnome-doc-utils: Fix usage of create_wrapper
  librsvg: configure needs a native gdk-pixbuf binary

Wenzong Fan (2):
  chkconfig: fix QA warning about unsafe references in binaries
  cracklib: fix QA warning about unsafe references in binaries

 meta/classes/buildhistory.bbclass                  |   2 +-
 meta/classes/gnomebase.bbclass                     |   7 +-
 meta/classes/image.bbclass                         |  33 +++++++
 meta/classes/package_rpm.bbclass                   |  16 ++--
 meta/classes/qmake2.bbclass                        |   2 +
 meta/classes/qmake_base.bbclass                    |  15 ++-
 meta/classes/rootfs_deb.bbclass                    |  23 ++++-
 meta/classes/rootfs_ipk.bbclass                    |  39 ++++----
 meta/classes/rootfs_rpm.bbclass                    |  29 +++++-
 .../openssh/{openssh-6.2p1 => openssh-6.2p2}/init  |   0
 .../{openssh-6.2p1 => openssh-6.2p2}/nostrip.patch |   0
 .../openssh-CVE-2011-4327.patch                    |   0
 .../{openssh-6.2p1 => openssh-6.2p2}/ssh_config    |   0
 .../openssh/{openssh-6.2p1 => openssh-6.2p2}/sshd  |   0
 .../{openssh-6.2p1 => openssh-6.2p2}/sshd_config   |   0
 .../openssh/{openssh_6.2p1.bb => openssh_6.2p2.bb} |   5 +-
 .../recipes-connectivity/ppp/ppp-2.4.5/copts.patch |  21 +++++
 meta/recipes-connectivity/ppp/ppp-2.4.5/pap        |  22 +++++
 .../recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot |  21 +++++
 meta/recipes-connectivity/ppp/ppp-2.4.5/provider   |  35 +++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |  16 +++-
 .../socat/files/fix-xxx_SHIFT-autoheader.patch     |  40 ++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.1.bb   |  15 ++-
 meta/recipes-core/images/core-image-minimal.bb     |   2 -
 meta/recipes-core/initrdscripts/files/init-live.sh |   6 +-
 meta/recipes-core/libxml/libxml2.inc               |   1 +
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 .../dpkg/run-postinsts/run-postinsts               |  36 -------
 .../dpkg/run-postinsts/run-postinsts.awk           |  30 ------
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   2 +-
 .../run-postinsts/run-postinsts/run-postinsts      |  47 +++++++++
 .../{dpkg => run-postinsts}/run-postinsts_1.0.bb   |   7 +-
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |   3 +-
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |   2 +-
 meta/recipes-extended/sudo/files/crypt.patch       | 100 --------------------
 .../sudo/{sudo_1.8.6p7.bb => sudo_1.8.6p8.bb}      |   5 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   1 +
 ...dd-checks-for-invalid-pointers-to-fix-seg.patch |  61 ++++++++++++
 ...o-not-call-stop_threads-if-doing-latency-.patch |  38 ++++++++
 ...etting-plugin-to-nop-clears-data-before-i.patch |  96 +++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |   8 +-
 .../gstreamer/gstreamer1.0-libav.inc               |  34 +++++++
 ...-Disable-yasm-for-libav-when-disable-yasm.patch |  33 +++++++
 .../gstreamer1.0-libav/libav_e500mc.patch          |  21 +++++
 .../gstreamer/gstreamer1.0-libav_1.0.7.bb          |  27 ++++++
 .../gstreamer/gstreamer1.0-libav_git.bb            |  27 ++++++
 .../gstreamer/gstreamer1.0-omx.inc                 |  42 +++++++++
 .../0001-omx-fixed-type-error-in-printf-call.patch |  30 ++++++
 .../gstreamer/gstreamer1.0-omx_1.0.0.bb            |  12 +++
 .../gstreamer/gstreamer1.0-omx_git.bb              |  22 +++++
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 105 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb    |  12 +++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  26 +++++
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  42 +++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.0.7.bb   |  11 +++
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |  18 ++++
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  55 +++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.0.7.bb   |  11 +++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  17 ++++
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  33 +++++++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb   |  10 ++
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |  16 ++++
 .../gstreamer/gstreamer1.0-plugins.inc             |  57 +++++++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  23 +++++
 .../0001-Fix-crash-with-gst-inspect.patch          |  28 ++++++
 .../gstreamer/gstreamer1.0_1.0.7.bb                |  13 +++
 .../gstreamer/gstreamer1.0_git.bb                  |  17 ++++
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   2 +-
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |   1 +
 ...verwrite-QMAKE_QT_CONFIG-with-empty-value.patch |  39 ++++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |   2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |  18 +++-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   2 +-
 .../createrepo/createrepo_0.4.11.bb                |   2 +-
 scripts/contrib/ddimage                            |  16 ++--
 77 files changed, 1372 insertions(+), 244 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p1 => openssh-6.2p2}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.2p1.bb => openssh_6.2p2.bb} (96%)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/pap
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/provider
 create mode 100644 meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
 delete mode 100755 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
 delete mode 100644 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
 create mode 100755 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
 rename meta/recipes-devtools/{dpkg => run-postinsts}/run-postinsts_1.0.bb (68%)
 delete mode 100644 meta/recipes-extended/sudo/files/crypt.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.6p7.bb => sudo_1.8.6p8.bb} (81%)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch

-- 
1.8.1.4


