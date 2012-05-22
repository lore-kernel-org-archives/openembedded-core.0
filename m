Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWusz-0001jE-Mf
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQdXG017883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:08 -0500
Message-ID: <cover.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/30] Refactor update-alternatives
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
X-List-Received-Date: Tue, 22 May 2012 19:36:50 -0000
Content-Type: text/plain

This set of commits refactors update-alternatives.  The primary purpose 
is to cover all of the corner cases currently in oe-core (and hopefully 
other layers) so that recipes can all use the update-alternatives class, 
instead of manual update-alternatives calls in man post install/remove 
scripts.

The refactored update-alternatives is compatible with the older methods, 
but does indicate they are deprecated via a warning message.  One of the 
key changes is that all referenced alternatives are not added to the 
per-file dependency information.  For example, gawk sets up an 
alternative for 'awk'.  The /bin/gawk binary now says it provides 
/bin/awk, so that the package management systems that use per file 
dependencies (i.e. RPM), will be able to find the minimum set of 
packages to resolve the image.

In addition, to all of that, the references have been changed from 
".${PN}" to ".${BPN}" for alternatives.  This will allow the multilib
system to work as intended by resolving multilib binaries.

All of the work has been tested using buildhistory and building various 
images.  Buildhistory indicated only expected changes were performed.

(To avoid spamming the list, I have decided to only send the first 3 
patches, lrzsz, busybox, util-linux and shadow-native as this is a 
reasonable representation of the changes.  Please see the referenced 
repository and branch below for full details on the series.)

*** BLURB HERE ***
The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/upd-alt-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/upd-alt-2

Mark Hatle (30):
  update-alternatives.bbclass: Refactor the implementation
  update-alternatives.bbclass: Change from using PN to BPN
  which: use BPN for alternatives
  wget: use BPN for alternatives
  time: use BPN for alternatives
  shadow: use BPN for alternatives
  sed: use BPN for alternatives
  mktemp: use BPN for alternatives
  less: use BPN for alternatives
  patch: use BPN for alternatives
  tinylogin: use BPN for alternatives
  sysvinit: use new update-alternatives
  lrzsz: use new update-alternatives
  openssh: use new update-alternatives
  busybox: use new update-alternatives
  coreutils: use new update-alternatives
  dropbear: use new update-alternatives
  ncurses: use new update-alternatives
  psplash: use new update-alternatives
  util-linux: use new update-alternatives
  binutils: use new update-alternatives
  tar: use new update-alternatives
  opkg: use new update-alternatives
  cpio: use new update-alternatives
  grep: use new update-alternatives
  iputils: use new update-alternatives
  psmisc: use new update-alternatives
  sysklogd: use new update-alternatives
  kmod: use new update-alternatives
  shadow-utils-native: remove unnecessary alternatives

 meta/classes/package.bbclass                       |   16 +-
 meta/classes/package_rpm.bbclass                   |    4 -
 meta/classes/update-alternatives.bbclass           |  348 ++++++++++++++++----
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   30 +-
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |   31 +--
 meta/recipes-core/busybox/busybox.inc              |   66 ++---
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   48 +--
 meta/recipes-core/coreutils/coreutils_8.14.bb      |   49 ++--
 meta/recipes-core/dropbear/dropbear.inc            |   12 +-
 meta/recipes-core/dropbear/dropbear_2012.55.bb     |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |   24 +-
 meta/recipes-core/psplash/psplash_git.bb           |   23 +-
 meta/recipes-core/sysvinit/sysvinit/postinst       |   17 -
 meta/recipes-core/sysvinit/sysvinit/prerm          |    9 -
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   65 +---
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    4 +-
 meta/recipes-core/util-linux/util-linux.inc        |  212 +++----------
 meta/recipes-core/util-linux/util-linux_2.21.1.bb  |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |   18 +-
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |   13 +-
 meta/recipes-devtools/patch/patch.inc              |    4 +-
 meta/recipes-extended/cpio/cpio_2.11.bb            |    2 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |    2 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |   29 +-
 meta/recipes-extended/grep/grep_2.5.1a.bb          |   25 +-
 meta/recipes-extended/grep/grep_2.9.bb             |   26 +-
 meta/recipes-extended/iputils/iputils_s20101006.bb |   34 +-
 meta/recipes-extended/less/less_444.bb             |    4 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    4 +-
 meta/recipes-extended/psmisc/psmisc.inc            |   26 +--
 meta/recipes-extended/psmisc/psmisc_22.16.bb       |    2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb             |    4 +-
 meta/recipes-extended/sed/sed_4.2.1.bb             |    4 +-
 .../shadow/shadow-native_4.1.4.3.bb                |   21 --
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    4 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |   29 +-
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb     |    2 +-
 meta/recipes-extended/tar/tar.inc                  |   18 +-
 meta/recipes-extended/tar/tar_1.17.bb              |    2 +-
 meta/recipes-extended/tar/tar_1.26.bb              |    2 +-
 meta/recipes-extended/time/time.inc                |    4 +-
 meta/recipes-extended/wget/wget.inc                |    4 +-
 meta/recipes-extended/which/which_2.18.bb          |    4 +-
 meta/recipes-extended/which/which_2.20.bb          |    4 +-
 meta/recipes-kernel/kmod/kmod_git.bb               |   39 +--
 47 files changed, 603 insertions(+), 693 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/postinst
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/prerm

-- 
1.7.3.4



