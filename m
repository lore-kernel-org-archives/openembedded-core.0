Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd569-0005Cd-C9
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 20:11:37 +0100
Received: by yhoo47 with SMTP id o47so4599160yho.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 11:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=7USYDTD1DsM8zByXzEGhTUcAp8ysMuI6gZdMMaylQeA=;
	b=xj3XbLlsTySg6QrJvh/v9WOTzGlaSxvw7DG6S11GM0sQ45pSb1/Y6/jeYPWlPkwIvi
	0RoC3lnbXRwQ+co87WnF6hbfv8O/zI2o8Xvpg7NlxT7zO4FwS9Z/ZfmNwf7rVfuEgJd1
	3teYOBmAx93C+Wby77yMc2b64v9v/Se5a1w6M=
Received: by 10.236.182.8 with SMTP id n8mr5927080yhm.26.1324407872608;
	Tue, 20 Dec 2011 11:04:32 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm4771379yhl.9.2011.12.20.11.04.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 11:04:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2011 19:04:06 +0000
Message-Id: <cover.1324407759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/9] Major refactor udev package preparing for update to 173 later
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
X-List-Received-Date: Tue, 20 Dec 2011 19:11:37 -0000

The following changes since commit ae4118a1f78f113c3d687c3aa6a86007cf977cae:

  libsdl 1.2.14: fix packaging (2011-12-19 12:17:36 +0000)

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
 meta/recipes-core/udev/udev.inc                    |  126 ++--
 .../udev/{files => udev}/devfs-udev.rules          |    0
 meta/recipes-core/udev/udev/init                   |   75 ++
 meta/recipes-core/udev/{files => udev}/links.conf  |    0
 .../udev/{udev-164 => udev}/local.rules            |    0
 meta/recipes-core/udev/{files => udev}/mount.sh    |    0
 meta/recipes-core/udev/{files => udev}/network.sh  |    0
 .../udev/{udev-145 => udev}/permissions.rules      |    0
 .../recipes-core/udev/{udev-145 => udev}/run.rules |    0
 .../udev/{files => udev}/udev-166-v4l1-1.patch     |    0
 meta/recipes-core/udev/udev/udev-cache             |   33 +
 meta/recipes-core/udev/udev/udev-cache.default     |    4 +
 .../udev/{udev-145 => udev}/udev.rules             |    0
 meta/recipes-core/udev/udev_145.bb                 |   55 --
 meta/recipes-core/udev/udev_164.bb                 |    4 +-
 37 files changed, 193 insertions(+), 2112 deletions(-)
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



