Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYb-0008UB-Rb
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:05:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580321"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:02 -0700
Message-Id: <cover.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [Updated CONSOLIDATED PULL 00/15] Fixes for M3 and getting master to build
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
X-List-Received-Date: Sun, 07 Aug 2011 05:05:50 -0000

Richard,

This has Bruce's updated Kernel, which has taken a spin on the fuzzy builder,
along with a fix for M3 BSP failures and a couple of other bug and build fixes.
I also remembered to include the SRC_URI checksums this time for the recipe 
updates.

Thanks
	Sau!


The following changes since commit 7a278238d9b08e0315e92d386282cb488cc0c7b4:

  bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64 (2011-08-05 17:48:23 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (4):
  linux-yocto: pass KMACHINE to updateme, not MACHINE
  linux-yocto: allow configuration of arbitrary branches
  linux-yocto: update atom-pc preempt-rt definition
  linux-yocto: merge v3.0.1

Koen Kooi (3):
  gst-plugins: partially sync packaging with OE .dev
  gtk-icon-cache bbclass: don't assing to global RDEPENDS
  gtk-icon-cache: fix RDEPENDS append bug

Kumar Gala (1):
  gcc: use ${base_lib} to match gcc default configuration

Mei Lei (2):
  python-native: Fix a compiler finding issue
  apr-util: disable pqsql support to avoid configure error

Saul Wold (5):
  gdb: Update to 7.3
  liburcu: Update to 0.6.4
  lttng-ust: Update to 0.15
  lttng-control: Update to 0.89
  kernel-yocto: add CCACHE_DIR dependency to do_kernel_configme

 meta/classes/gtk-icon-cache.bbclass                |    6 +-
 meta/classes/kernel-yocto.bbclass                  |   17 ++-----
 .../gcc/gcc-cross-intermediate.inc                 |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    8 ++-
 ...s-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} |    2 +-
 .../gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb}     |    2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    2 +-
 .../fix_for_build_error_internal_error_call.patch  |   20 --------
 .../gdb/gdb/gdbserver-cflags-last.diff             |   16 ++++---
 .../gdb/gdb/kill_arm_map_symbols.patch             |   36 +++++++-------
 .../gdb/{gdb_7.2.bb => gdb_7.3.bb}                 |    4 +-
 .../python/python-native/unixccompiler.patch       |   20 ++++++++
 .../recipes-devtools/python/python-native_2.6.6.bb |    3 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   14 +++---
 ...lttng-control_0.88.bb => lttng-control_0.89.bb} |    6 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 --------------------
 .../lttng/{lttng-ust_0.12.bb => lttng-ust_0.15.bb} |   13 +++--
 .../gstreamer/gst-plugins-bad_0.10.21.bb           |    2 +-
 .../gstreamer/gst-plugins-base_0.10.32.bb          |    2 +-
 .../gstreamer/gst-plugins-good_0.10.28.bb          |    2 +-
 .../gstreamer/gst-plugins-package.inc              |   34 +++++++++++++
 .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   18 +------
 meta/recipes-support/apr/apr-util_1.3.12.bb        |    3 +-
 .../liburcu/{liburcu_0.5.4.bb => liburcu_0.6.4.bb} |    6 +-
 26 files changed, 131 insertions(+), 161 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.2.bb => gdb-cross-canadian_7.3.bb} (87%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.2.bb => gdb-cross_7.3.bb} (83%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/fix_for_build_error_internal_error_call.patch
 rename meta/recipes-devtools/gdb/{gdb_7.2.bb => gdb_7.3.bb} (68%)
 create mode 100644 meta/recipes-devtools/python/python-native/unixccompiler.patch
 rename meta/recipes-kernel/lttng/{lttng-control_0.88.bb => lttng-control_0.89.bb} (77%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_0.12.bb => lttng-ust_0.15.bb} (74%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
 rename meta/recipes-support/liburcu/{liburcu_0.5.4.bb => liburcu_0.6.4.bb} (72%)

-- 
1.7.3.4



