Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RfziJ-0007XZ-R5
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:04 +0100
Received: by yenm12 with SMTP id m12so6849833yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=F/anYBfUMtmC+8ybcOOD8uToKrDJkBHm99NuMQ1XXOo=;
	b=Kal7WvIcSagjJ1qMPC3l+VvMA094M1bfRAY0CDymXG1rS7Z9bsDthy3doZKf+9zvxL
	d61d1wNGiL6h3YcttXUjnfH/Yiq0NeZeYFBq6b7zQOio2pPlD+WyfVVwBa9Y+nicqhz9
	0z3cyEOa1AtmictcG5/5NSZ6nQv3N0kjHa+SI=
Received: by 10.236.153.42 with SMTP id e30mr45436331yhk.10.1325102149398;
	Wed, 28 Dec 2011 11:55:49 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.55.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:55:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:21 +0000
Message-Id: <cover.1325101673.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 00/16] Misc Qt4 and udev changes pending from O.S. Systems
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:04 -0000

This patchset includes our pending changes for Qt4 and udev. The udev
patchset does a great cleanup on the udev package reducing a lot the
delta between OE-Core and Meta-OE. Am working at updating the udev to
175 but those patches are the basis for this.

Those has been tested under imx53qsb and O.S. Systems' x86 based
machine definition using internal images running Qt4, Qt4-Embedded,
SysV and SystemD.

The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (16):
  qt4-graphics-system: add
  qt4e.bbclass: add QT_BASE_NAME for use in recipes
  qt4x11.bbclass: add QT_BASE_NAME for use in recipes
  qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
  qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
  udev: drop 145 version
  udev-extraconf: move mount.blacklist to udev-extraconf dir
  udev: reorganize files of 164 version
  udev: use tabs for init script (no code changes)
  udev: skip mounting /dev on tmpfs if it is on devtmpfs
  udev: ensure /dev/pts and /dev/shm does exists
  udev: improve udev-cache robustness
  udev: use 'echo' instead of 'echo -n' in init script
  udev: run depmod if modules.dep doesn't exist
  udev: split utilities onto udev-utils
  udev: remove commented code from init script (no code changes)

 meta/classes/qt4e.bbclass                          |    1 +
 meta/classes/qt4x11.bbclass                        |    1 +
 meta/recipes-core/udev/files/fix-alignment.patch   |   26 -
 meta/recipes-core/udev/files/init                  |  212 ------
 meta/recipes-core/udev/files/local.rules           |   22 -
 meta/recipes-core/udev/files/noasmlinkage.patch    |   39 -
 meta/recipes-core/udev/files/permissions.rules     |   81 --
 meta/recipes-core/udev/files/tmpfs.patch           |   17 -
 meta/recipes-core/udev/files/udev-cache            |   20 -
 meta/recipes-core/udev/files/udev.rules            |   98 ---
 meta/recipes-core/udev/files/udev_network_queue.sh |   35 -
 meta/recipes-core/udev/files/udevsynthesize.patch  |  778 --------------------
 meta/recipes-core/udev/files/udevsynthesize.sh     |   51 --
 meta/recipes-core/udev/udev-145/enable-gudev.patch |   50 --
 meta/recipes-core/udev/udev-145/init               |   59 --
 meta/recipes-core/udev/udev-145/local.rules        |   33 -
 meta/recipes-core/udev/udev-145/noasmlinkage.patch |   50 --
 meta/recipes-core/udev/udev-145/unbreak.patch      |   26 -
 meta/recipes-core/udev/udev-164/init               |   59 --
 meta/recipes-core/udev/udev-164/permissions.rules  |  131 ----
 meta/recipes-core/udev/udev-164/run.rules          |   14 -
 meta/recipes-core/udev/udev-164/udev.rules         |  116 ---
 .../udev/{files => udev-extraconf}/mount.blacklist |    0
 meta/recipes-core/udev/udev-new.inc                |   91 ---
 meta/recipes-core/udev/udev.inc                    |  108 ++--
 .../udev/{files => udev}/devfs-udev.rules          |    0
 meta/recipes-core/udev/udev/init                   |   76 ++
 meta/recipes-core/udev/{files => udev}/links.conf  |    0
 .../udev/{udev-164 => udev}/local.rules            |    0
 meta/recipes-core/udev/{files => udev}/mount.sh    |    0
 meta/recipes-core/udev/{files => udev}/network.sh  |    0
 .../udev/{udev-145 => udev}/permissions.rules      |    0
 .../recipes-core/udev/{udev-145 => udev}/run.rules |    0
 .../udev/{files => udev}/udev-166-v4l1-1.patch     |    0
 meta/recipes-core/udev/udev/udev-cache             |   34 +
 meta/recipes-core/udev/udev/udev-cache.default     |    4 +
 .../udev/{udev-145 => udev}/udev.rules             |    0
 meta/recipes-core/udev/udev_145.bb                 |   55 --
 meta/recipes-core/udev/udev_164.bb                 |    4 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   24 +
 meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    3 +-
 42 files changed, 208 insertions(+), 2113 deletions(-)
 delete mode 100644 meta/recipes-core/udev/files/fix-alignment.patch
 delete mode 100755 meta/recipes-core/udev/files/init
 delete mode 100644 meta/recipes-core/udev/files/local.rules
 delete mode 100644 meta/recipes-core/udev/files/noasmlinkage.patch
 delete mode 100644 meta/recipes-core/udev/files/permissions.rules
 delete mode 100644 meta/recipes-core/udev/files/tmpfs.patch
 delete mode 100644 meta/recipes-core/udev/files/udev-cache
 delete mode 100644 meta/recipes-core/udev/files/udev.rules
 delete mode 100644 meta/recipes-core/udev/files/udev_network_queue.sh
 delete mode 100644 meta/recipes-core/udev/files/udevsynthesize.patch
 delete mode 100644 meta/recipes-core/udev/files/udevsynthesize.sh
 delete mode 100644 meta/recipes-core/udev/udev-145/enable-gudev.patch
 delete mode 100644 meta/recipes-core/udev/udev-145/init
 delete mode 100644 meta/recipes-core/udev/udev-145/local.rules
 delete mode 100644 meta/recipes-core/udev/udev-145/noasmlinkage.patch
 delete mode 100644 meta/recipes-core/udev/udev-145/unbreak.patch
 delete mode 100644 meta/recipes-core/udev/udev-164/init
 delete mode 100644 meta/recipes-core/udev/udev-164/permissions.rules
 delete mode 100644 meta/recipes-core/udev/udev-164/run.rules
 delete mode 100644 meta/recipes-core/udev/udev-164/udev.rules
 rename meta/recipes-core/udev/{files => udev-extraconf}/mount.blacklist (100%)
 delete mode 100644 meta/recipes-core/udev/udev-new.inc
 rename meta/recipes-core/udev/{files => udev}/devfs-udev.rules (100%)
 create mode 100644 meta/recipes-core/udev/udev/init
 rename meta/recipes-core/udev/{files => udev}/links.conf (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/local.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/mount.sh (100%)
 rename meta/recipes-core/udev/{files => udev}/network.sh (100%)
 rename meta/recipes-core/udev/{udev-145 => udev}/permissions.rules (100%)
 rename meta/recipes-core/udev/{udev-145 => udev}/run.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-166-v4l1-1.patch (100%)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
 rename meta/recipes-core/udev/{udev-145 => udev}/udev.rules (100%)
 delete mode 100644 meta/recipes-core/udev/udev_145.bb
 create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb

-- 
1.7.2.5



