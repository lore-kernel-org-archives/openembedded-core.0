Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZh7-0002KG-Ja
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2011 12:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="82330244"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2011 12:20:09 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:19:57 -0800
Message-Id: <cover.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 00/11] recipe fixes for x32 toolchain
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These commits fixes building of various recipes with x32 toolchain
for x32 target/machines. And these do not affect these recipes for
other non-x32 targets.

X32 is new ABI for x86-64 architecture.
For more information refer: https://sites.google.com/site/x32abi/

Thanks,
Nitin

The following changes since commit 9be6d59b78510443d0944513503d515df13caa45:

  dpkg-native: Fix perl path (2011-12-02 15:31:08 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin.x32

Nitin A Kamble (11):
  gst-fluendo-mpegdemux: rework the CC hack
  mdadm: fix CC definition in the Makefile
  openssl-1.0.0e: fix to wotk with x32 toolchain
  gmp: fix the recipe for x32 target
  mesa-dri, mesa-xlib: fix compilation with x32 toolchain
  glib-2.0: fix compilatoin with x32 toolchain
  libxt: fix compilatoin with x32 toolchain
  liboil: patch source code for x32
  xproto: fix compilation with x32 toolchain
  libaio: patch source code for x32
  libatomics-ops: patch source code for x32

 .../openssl-1.0.0e/openssl_fix_for_x32.patch       |   90 ++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |   15 +-
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |    3 +-
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |   76 +++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb      |    3 +-
 .../libaio/libaio/libaio_fix_for_x32.patch         |   61 ++++++
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |    5 +-
 .../mdadm/files/mdadm_fix_for_x32.patch            |   24 ++
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    3 +-
 meta/recipes-graphics/mesa/mesa-7.11.inc           |   11 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 -
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    2 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |    6 +-
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    2 +-
 .../mesa/mesa/mesa_fix_for_x32.patch               |   24 ++
 .../xorg-lib/libxt/libxt_fix_for_x32.patch         |   19 ++
 meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb      |    4 +-
 .../xorg-proto/xproto/xproto_fix_for_x32.patch     |   22 ++
 meta/recipes-graphics/xorg-proto/xproto_7.0.22.bb  |    4 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    2 +-
 .../libatomics-ops_fix_for_x32.patch               |   41 ++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    5 +-
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |   94 ++++++++
 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch |   45 ++++
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    6 +-
 .../liboil/liboil-0.3.17/liboil_fix_for_x32.patch  |  222 ++++++++++++++++++++
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
 27 files changed, 762 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm_fix_for_x32.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_bugfix.patch
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_x32.patch
 create mode 100644 meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch

-- 
1.7.6.4



