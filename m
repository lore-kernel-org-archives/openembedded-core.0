Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi6j-00022j-Fw
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:50:50 +0100
Received: by ghrr17 with SMTP id r17so3551302ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=l8XIfKMiR4k3elhcyKe4QD0U8HUxHKliqIJeRHfq48w=;
	b=Q0We9NTcgMq1cnpwFrhXjVGsqplawVmo1zwn2WUk6++WvAS0EqL29DYigxPQ2RZ5R5
	eFQ3bc6noBbnpuMwLlnI7L6SBba7ZSuPtDO8jqK4gn4U4r51/eKv1kGoJEN7lNGA2SqJ
	PvjwWEZfZz7BWVD8jDMLTubQKzB1XbdPP6KoU=
Received: by 10.100.199.10 with SMTP id w10mr4624210anf.29.1324557821893;
	Thu, 22 Dec 2011 04:43:41 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.43.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:43:40 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:20 +0000
Message-Id: <cover.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2 0/9] Major refactory of udev recipes
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
X-List-Received-Date: Thu, 22 Dec 2011 12:50:50 -0000

The following changes since commit db446421933d640528328e46a29f828a36d6649b:

  multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:37 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (9):
  udev: drop 145 version
  udev-extraconf: move mount.blacklist to udev-extraconf dir
  udev: reorganize files of 164 version
  udev: use tabs for init script (no code changes)
  udev: skip mounting /dev on tmpfs if it is on devtmpfs
  udev: improve udev-cache robustness
  udev: use 'echo' instead of 'echo -n' in init script
  udev: run depmod if modules.dep doesn't exist
  udev: split utilities onto udev-utils

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
 meta/recipes-core/udev/udev.inc                    |  120 ++--
 .../udev/{files => udev}/devfs-udev.rules          |    0
 meta/recipes-core/udev/udev/init                   |   75 ++
 meta/recipes-core/udev/{files => udev}/links.conf  |    0
 .../udev/{udev-164 => udev}/local.rules            |    0
 meta/recipes-core/udev/{files => udev}/mount.sh    |    0
 meta/recipes-core/udev/{files => udev}/network.sh  |    0
 .../udev/{udev-145 => udev}/permissions.rules      |    0
 .../recipes-core/udev/{udev-145 => udev}/run.rules |    0
 .../udev/{files => udev}/udev-166-v4l1-1.patch     |    0
 meta/recipes-core/udev/udev/udev-cache             |   30 +
 meta/recipes-core/udev/udev/udev-cache.default     |    4 +
 .../udev/{udev-145 => udev}/udev.rules             |    0
 meta/recipes-core/udev/udev_145.bb                 |   55 --
 meta/recipes-core/udev/udev_164.bb                 |    4 +-
 37 files changed, 187 insertions(+), 2109 deletions(-)
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

-- 
1.7.2.5



