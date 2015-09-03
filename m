Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 387A777002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 14:58:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id F2ADF3C881B8
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 15:58:15 +0100
Message-Id: <cover.1441291646.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] Fixes for a distro with a merged /usr
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
X-List-Received-Date: Thu, 03 Sep 2015 14:58:50 -0000

I've been playing around with building a distro with a merged /usr[1] and
the following series fixes several issues I ran across in OE core metadata.

These have been build tested by building a core-image-sato image with
ipk packaging for qemux86 with both a standard/default configuration and
for my merged /usr test distro.

I used buildhistory to compare core-image-sato before and after this series
and the only change is:

Changes to images/qemux86/glibc/core-image-sato (files-in-image.txt):
  /bin/lsmod.kmod changed symlink target from ../bin/kmod to kmod

Regards,

Joshua

1. https://wiki.freedesktop.org/www/Software/systemd/TheCaseForTheUsrMerge/

The following changes since commit bdeb32b4cdbe316f17c2fd854d59e05e8f2e8ffc:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:43:38 +0100)

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


