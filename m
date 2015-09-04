Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 3842777045
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:00:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id CDE8B6002A0
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:59:37 +0100
Message-Id: <cover.1441374016.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/9] Fixes for a distro with a merged /usr
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
X-List-Received-Date: Fri, 04 Sep 2015 15:00:09 -0000

I've been playing around with building a distro with a merged /usr[1] and
the following series fixes several issues I ran across in OE core metadata.

These have been build tested by building a core-image-sato image with
ipk packaging for: i) qemux86 with a default configuration, ii) qemux86-64
with a mutlilib configuration where the image includes lib32-ncurses and
iii) for my merged /usr test distro.

I used buildhistory to compare core-image-sato before and after this series
and the only change is:

Changes to images/qemux86/glibc/core-image-sato (files-in-image.txt):
  /bin/lsmod.kmod changed symlink target from ../bin/kmod to kmod

Changes since v1:
* Fix busybox typo/thinko which lead to installing busybox links into /usr/bin
* Fix systemd recipe to use nonarch_base_libdir for udev files

Regards,

Joshua

The following changes since commit aba3ef50d65e0dc8659a48bf98d0fb00dd44a6fc:

  debianutils: create package for run-parts (2015-09-02 23:51:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/merged-usr
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/merged-usr

Joshua Lock (9):
  kmod: fix link creation when base_bindir != /bin
  busybox: fixes for when base_bindir != /bin
  systemd: remove hard-coded paths in FILES entries
  alsa-utils: handle udev dir being 2 levels below /
  pulseaudio: handle udev dir being 2 levels below /
  bluez: handle udev dir being 2 levels below /
  pcmciautils: handle udev dir being 2 levels below /
  nfs-utils: don't force use of /sbin as sbindir
  procps: fix for base_sbindir == sbindir

 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |  4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../nfs-utils/nfs-utils_1.3.1.bb                   |  8 ++++
 meta/recipes-core/busybox/busybox.inc              | 49 ++++++++++++----------
 meta/recipes-core/systemd/systemd_219.bb           | 10 ++---
 meta/recipes-extended/procps/procps_3.3.10.bb      |  5 ++-
 meta/recipes-kernel/kmod/kmod_git.bb               |  4 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb  |  2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 +-
 9 files changed, 49 insertions(+), 36 deletions(-)

-- 
2.1.4


