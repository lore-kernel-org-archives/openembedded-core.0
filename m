Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8F-0004vG-2U
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497149"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:20 +0100
Message-Id: <cover.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/28] Package group fixes
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:51 -0000

This rather large set of changes renames "task" to "packagegroup" and
attempts to clean up a number of package group related issues [1]. It
doesn't go quite as far as I had hoped - I wanted to tidy up the base,
core-lsb and core-basic recipes even further, but unfortunately I ran
out of time for this cycle.

[1] http://www.openembedded.org/wiki/OE-Core_Task_Rework


The following changes since commit c6da6b648328377ba3590fd38cb12dad26a46a13:

  crosstap: new script (2012-09-02 05:47:43 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/task-rework
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/task-rework

Paul Eggleton (28):
  classes/core-image: remove SSHSERVER_IMAGE_FEATURES
  classes/core-image: remove *_IMAGE_FEATURES variables
  classes/core-image: remove erroneous nfs-server comment
  Rename task to packagegroup
  packagegroup-base: remove some useless items
  classes/packagegroup: Use package group nomenclature
  packagegroup-core-nfs: remove broken glibc-utils reference
  classes/packagegroup: add ability to disable complementary packages
  packagegroup-*: change to inherit from packagegroup.bbclass
  packagegroup-core-x11: move out Sato applications
  core-image-core: rename to core-image-x11
  packagegroup-core-x11*: adjust X11 package groups
  packagegroup-qt4e: tidy up and rename
  packagegroup-core-gtk-directfb: remove superfluous -base package
  packagegroup-base: remove openswan from packagegroup-base-ipsec
  packagegroup-core-gtk-directfb: remove dropbear
  classes/packagegroup: disable superfluous tasks
  packagegroup-*: drop LIC_FILES_CHKSUM
  packagegroup-core-clutter: remove empty -apps/-tests tasks
  packagegroup-core-qt: rename -demos to -demoapps
  packagegroup-core-console: remove
  connman: add runtime dependency on dbus
  ofono: add runtime dependency on dbus
  packagegroup-*: set reasonable SUMMARY/DESCRIPTION
  packagegroup-core-basic: tidy up
  packagegroup-core-lsb: rework
  core-image-basic: tidy up
  packagegroup-*: add RPROVIDES for backwards compatibility

 meta/classes/archiver.bbclass                      |    4 +-
 meta/classes/core-image.bbclass                    |   53 ++-
 meta/classes/image.bbclass                         |    4 +
 meta/classes/insane.bbclass                        |    2 +-
 meta/classes/package.bbclass                       |    2 +-
 meta/classes/packagegroup.bbclass                  |   44 +++
 meta/classes/populate_sdk_base.bbclass             |    4 +-
 meta/classes/task.bbclass                          |   32 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/recipes-bsp/qemu-config/qemu-config.bb        |    2 +-
 meta/recipes-connectivity/connman/connman.inc      |    3 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 meta/recipes-core/images/build-appliance-image.bb  |    4 +-
 meta/recipes-core/images/core-image-base.bb        |    2 +-
 meta/recipes-core/images/core-image-core.bb        |    8 -
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/meta/meta-toolchain-gmae.bb      |    2 +-
 .../nativesdk-packagegroup-sdk-host.bb}            |   10 +-
 .../packagegroups/packagegroup-base.bb             |  356 +++++++++++++++++++
 .../packagegroup-core-boot.bb}                     |   24 +-
 .../packagegroups/packagegroup-core-nfs.bb         |   20 ++
 .../packagegroup-core-sdk.bb}                      |   24 +-
 .../packagegroup-core-ssh-dropbear.bb              |   10 +
 .../packagegroups/packagegroup-core-ssh-openssh.bb |   10 +
 .../packagegroup-core-standalone-sdk-target.bb}    |   10 +-
 .../packagegroup-core-tools-debug.bb}              |   13 +-
 .../packagegroup-core-tools-profile.bb}            |   13 +-
 .../packagegroup-core-tools-testapps.bb}           |   13 +-
 .../packagegroup-cross-canadian.bb}                |   14 +-
 .../packagegroup-self-hosted.bb}                   |   43 ++-
 meta/recipes-core/tasks/task-base.bb               |  359 --------------------
 meta/recipes-core/tasks/task-core-console.bb       |   28 --
 meta/recipes-core/tasks/task-core-nfs.bb           |   28 --
 meta/recipes-core/tasks/task-core-ssh-dropbear.bb  |   17 -
 meta/recipes-core/tasks/task-core-ssh-openssh.bb   |   17 -
 meta/recipes-extended/images/core-image-basic.bb   |   12 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    6 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    6 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    6 +-
 .../libzypp/libzypp/config-release.patch           |    4 +-
 .../packagegroup-core-basic.bb}                    |   88 ++---
 .../packagegroup-core-lsb.bb}                      |  172 ++++++----
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |   22 ++
 ...packagegroup-core-standalone-gmae-sdk-target.bb |   22 ++
 .../packagegroup-sdk-gmae.inc}                     |    0
 meta/recipes-gnome/tasks/task-core-sdk-gmae.bb     |   21 --
 .../tasks/task-core-standalone-gmae-sdk-target.bb  |   21 --
 meta/recipes-graphics/images/core-image-clutter.bb |    7 +-
 .../images/core-image-gtk-directfb.bb              |   10 +-
 meta/recipes-graphics/images/core-image-x11.bb     |    7 +
 .../packagegroups/packagegroup-core-clutter.bb     |   24 ++
 .../packagegroup-core-gtk-directfb.bb}             |   15 +-
 .../packagegroups/packagegroup-core-x11-base.bb    |   20 ++
 .../packagegroups/packagegroup-core-x11.bb}        |   40 +--
 meta/recipes-graphics/tasks/task-core-clutter.bb   |   37 --
 meta/recipes-qt/images/qt4e-demo-image.bb          |   10 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    4 +-
 .../nativesdk-packagegroup-qte-toolchain-host.bb}  |    3 +-
 .../packagegroups/packagegroup-core-qt.bb          |   19 ++
 .../packagegroup-core-qt4e.bb}                     |   16 +-
 .../packagegroup-qte-toolchain-target.bb}          |    8 +-
 meta/recipes-qt/tasks/task-core-qt.bb              |   22 --
 meta/recipes-sato/images/core-image-sato-dev.bb    |    6 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |   10 +-
 meta/recipes-sato/images/core-image-sato.bb        |    4 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   66 ++++
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |   42 ---
 meta/recipes-sato/tasks/task-core-x11.bb           |   68 ----
 scripts/contrib/documentation-audit.sh             |    2 +-
 70 files changed, 943 insertions(+), 1062 deletions(-)
 create mode 100644 meta/classes/packagegroup.bbclass
 delete mode 100644 meta/recipes-core/images/core-image-core.bb
 rename meta/recipes-core/{tasks/nativesdk-task-sdk-host.bb => packagegroups/nativesdk-packagegroup-sdk-host.bb} (60%)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-base.bb
 rename meta/recipes-core/{tasks/task-core-boot.bb => packagegroups/packagegroup-core-boot.bb} (72%)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
 rename meta/recipes-core/{tasks/task-core-sdk.bb => packagegroups/packagegroup-core-sdk.bb} (78%)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
 rename meta/recipes-core/{tasks/task-core-standalone-sdk-target.bb => packagegroups/packagegroup-core-standalone-sdk-target.bb} (47%)
 rename meta/recipes-core/{tasks/task-core-tools-debug.bb => packagegroups/packagegroup-core-tools-debug.bb} (48%)
 rename meta/recipes-core/{tasks/task-core-tools-profile.bb => packagegroups/packagegroup-core-tools-profile.bb} (81%)
 rename meta/recipes-core/{tasks/task-core-tools-testapps.bb => packagegroups/packagegroup-core-tools-testapps.bb} (66%)
 rename meta/recipes-core/{tasks/task-cross-canadian.bb => packagegroups/packagegroup-cross-canadian.bb} (42%)
 rename meta/recipes-core/{tasks/task-self-hosted.bb => packagegroups/packagegroup-self-hosted.bb} (77%)
 delete mode 100644 meta/recipes-core/tasks/task-base.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-console.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-nfs.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-ssh-dropbear.bb
 delete mode 100644 meta/recipes-core/tasks/task-core-ssh-openssh.bb
 rename meta/recipes-extended/{tasks/task-core-basic.bb => packagegroups/packagegroup-core-basic.bb} (40%)
 rename meta/recipes-extended/{tasks/task-core-lsb.bb => packagegroups/packagegroup-core-lsb.bb} (42%)
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
 rename meta/recipes-gnome/{tasks/task-sdk-gmae.inc => packagegroups/packagegroup-sdk-gmae.inc} (100%)
 delete mode 100644 meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
 delete mode 100644 meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
 create mode 100644 meta/recipes-graphics/images/core-image-x11.bb
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
 rename meta/recipes-graphics/{tasks/task-core-gtk-directfb.bb => packagegroups/packagegroup-core-gtk-directfb.bb} (44%)
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
 rename meta/{recipes-sato/tasks/task-core-x11-mini.bb => recipes-graphics/packagegroups/packagegroup-core-x11.bb} (47%)
 delete mode 100644 meta/recipes-graphics/tasks/task-core-clutter.bb
 rename meta/recipes-qt/{tasks/nativesdk-task-qte-toolchain-host.bb => packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb} (60%)
 create mode 100644 meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
 rename meta/recipes-qt/{tasks/task-qt4e.bb => packagegroups/packagegroup-core-qt4e.bb} (78%)
 rename meta/recipes-qt/{tasks/task-qte-toolchain-target.bb => packagegroups/packagegroup-qte-toolchain-target.bb} (78%)
 delete mode 100644 meta/recipes-qt/tasks/task-core-qt.bb
 create mode 100644 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
 delete mode 100644 meta/recipes-sato/tasks/task-core-x11-sato.bb
 delete mode 100644 meta/recipes-sato/tasks/task-core-x11.bb

-- 
1.7.9.5



