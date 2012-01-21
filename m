Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTT4-0001l8-Ow
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117496"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:18 -0800
Message-Id: <cover.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 00/20] Refactor -dev packages to move *.a to -staticdev packages
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:23 -0000


This patchset, move the remaining static *.a archives from their -dev
packages to the appropriate -staticdev, I have reviewed these and also
looked at the buildhistory output (very useful tool, thanks Paul E.)

The following are the remaining libraries that need to remain in their 
-dev packages:

libc6-dev                 /usr/lib/libc_nonshared.a
libc6-dev                 /usr/lib/libpthread_nonshared.a
libgcc-s-dev              /usr/lib/i586-poky-linux/4.6.3/libgcc.a
libgcc-s-dev              /usr/lib/i586-poky-linux/4.6.3/libgcc_eh.a
libgcov-dev               /usr/lib/i586-poky-linux/4.6.3/libgcov.a
libssp-dev                /usr/lib/libssp_nonshared.a

I think that now that we are completed, we might be able to write a QA 
check of some form that can verify against the above as a whitelist as
each package is created.

Sau!


The following changes since commit ac162df288f6d8f68c1764fad0ab2d33b9cee281:

  distro_tracking: update libpng, libgdbus, opensp, nfs-utils manual check dates (2012-01-20 16:35:08 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (20):
  Fix Upstream-Status entries
  apmd: refactor packages for staticdev
  avahi-ui: refactor packages for staticdev
  augeas: refactor packages for staticdev
  libsoup: refactor packages for staticdev
  sysfsutils: refactor packages for staticdev
  libxft: refactor packages for staticdev
  sqlite3: refactor packages for staticdev
  apr-util: refactor packages for staticdev
  mpeg2dec: refactor packages for staticdev
  tiff: refactor packages for staticdev
  gstreamer: refactor packages for staticdev
  libtool: refactor packages for staticdev
  syslinux: refactor packages for staticdev
  tcp-wrappers: refactor packages for staticdev
  opkg: move common code & metadata into opkg.inc to reduce code
    duplication
  opkg: refactor packages for staticdev
  eglibc: refactor packages for staticdev
  binutils: refactor packages for staticdev
  gcc: refactor packages for staticdev

 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    9 ++--
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |    7 ++-
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    9 +++-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |    9 ++--
 meta/recipes-devtools/binutils/binutils.inc        |    1 -
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |    9 +++-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    4 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    9 ++--
 .../libtool/libtool/fix-rpath.patch                |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |   44 +++++++++++++++++++-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |   44 +-------------------
 meta/recipes-devtools/opkg/opkg_svn.bb             |   42 +------------------
 .../qemu/qemu-0.14.0/arm-bgr.patch                 |    2 +-
 .../qemu/qemu-0.15.1/arm-bgr.patch                 |    2 +-
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    5 +-
 meta/recipes-extended/augeas/augeas.inc            |    7 ++-
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    2 +-
 .../libzypp/libzypp/libzypp-compatargs.patch       |    2 +-
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +---
 .../error-address-work-around.patch                |    2 +
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |    2 +-
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    5 +-
 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    2 +-
 .../gstreamer/gst-plugins-package.inc              |    9 ++--
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    7 ++-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |   10 +++--
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    4 +-
 .../dprintf_conflict_with_eglibc.patch             |    2 +
 meta/recipes-support/libsoup/libsoup_2.2.105.bb    |    8 ++--
 .../shared-mime-info/parallelmake.patch            |    2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |    6 ++-
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb       |    2 +-
 36 files changed, 137 insertions(+), 155 deletions(-)

-- 
1.7.6.5



