Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2b-00056a-UJ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034654"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:03 -0700
Message-Id: <cover.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Consolidated Pull 00/28] Fixes from various corners with [1.2.1] fixes
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
X-List-Received-Date: Thu, 24 May 2012 04:52:50 -0000

Richard,

I have been building and running images from the following changes
(not the mips64 or sh4 yet).

A number of the changes below (from Robert, Nitin and Xiaofeng) are candiates
for 1.2.1.

The package_deb.bbclass change needs more review, I believe that Joshua also
proposed a fix, but caused other breakage, this seems to resolve the problem, 
but I am not sure about it.

Paul's change to add checksum does add some warnings, which I assume he or
someone will fix shortly, they seem to be from older recipes.

Thanks
	Sau!

The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Andreas Oberritter (6):
  ppp: avoid host contamination
  libnss-mdns: fix postinst scripts
  wpa-supplicant: fix packaging error since last commit
  netbase: merge init script updates from upstream
  distutils.bbclass: don't delete .pyo files
  python: bump PR of packages after update of distutils.bbclass

Christopher Larson (3):
  tcmode-external-csl: preferred external-csl-toolchain's gdbserver
  Rename 'external-csl' to 'external-sourcery'
  external-sourcery-toolchain: ignore GNU_HASH issues with its packages

Enrico Scholz (1):
  libtool: fixed parallel build related race

Joshua Lock (7):
  Revert "sanity.bbclass: check user can read and write to SSTATE_DIR"
  sanity.bbclass: copy the data store and finalise before running
    checks
  sanity.bbclass: data.getVar(VAR, obj, exp) -> obj.getVar(VAR, exp)
  sanity.bbclass: add newline to check_create_long_filename failure
    message
  sanity.bbclass: add extra information when SSTATE_CACHE unusable
  sanity.bbclass: catch an extra exception in
    check_create_long_filename
  sanity.bbclass: check sanity at BuildStarted rather than ConfigParsed

Khem Raj (5):
  qemumips64.conf: Add machine configuration for mips64(eb)
  qemush4.conf: Add machine configuration for qemush4
  gcc-4.7: Add knowledge about arm hf dynamic loader
  eglibc: Add ARM hf dynamic linker support
  gcc: Grok for callconvention-hard to enable hard float

Marko Lindqvist (1):
  package_deb.bbclass: don't handle advanced dependency marker as
    version number

Nitin A Kamble (1):
  eglibc: package mtrace separately

Paul Eggleton (1):
  classes/base: add checksum file list at parse time

Robert Yang (2):
  package_rpm.bbclass: Fix incremental rpm image generation
  rpm 5.4.0: respect to the arch when choose the alternatives

Xiaofeng Yan (1):
  ncurses: Avoid occasional builling failure when having parallel
    processable task

 meta/classes/base.bbclass                          |    1 +
 meta/classes/distutils.bbclass                     |    4 -
 meta/classes/package_deb.bbclass                   |   19 +-
 meta/classes/package_rpm.bbclass                   |   20 +-
 meta/classes/sanity.bbclass                        |  157 +++++-----
 meta/conf/distro/include/tcmode-external-csl.inc   |  119 +-------
 .../distro/include/tcmode-external-sourcery.inc    |  118 +++++++
 meta/conf/machine/qemumips64.conf                  |   13 +
 meta/conf/machine/qemush4.conf                     |   13 +
 .../libnss-mdns/libnss-mdns_0.10.bb                |   15 +-
 .../makefile-remove-hard-usr-reference.patch       |   16 +
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    2 +-
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 .../eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch  |   28 ++
 .../eglibc/eglibc-2.15/ldso_arm_hf_support.patch   |  338 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |    7 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 +-
 ...toolchain.bb => external-sourcery-toolchain.bb} |    6 +
 .../SUPPORTED                                      |    0
 meta/recipes-core/ncurses/ncurses.inc              |   23 +-
 meta/recipes-core/netbase/netbase-4.47/init        |  101 ++++--
 meta/recipes-core/netbase/netbase_4.47.bb          |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |    4 +
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 +++
 meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    3 +-
 .../python/python-argparse_1.2.1.bb                |    2 +-
 .../python/python-imaging_1.1.7.bb                 |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
 meta/recipes-devtools/python/python-scons_2.1.0.bb |    2 +-
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 .../rpm/rpm/rpm-respect-arch.patch                 |   67 ++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 37 files changed, 883 insertions(+), 269 deletions(-)
 create mode 100644 meta/conf/distro/include/tcmode-external-sourcery.inc
 create mode 100644 meta/conf/machine/qemumips64.conf
 create mode 100644 meta/conf/machine/qemush4.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ldso_arm_hf_support.patch
 rename meta/recipes-core/meta/{external-csl-toolchain.bb => external-sourcery-toolchain.bb} (96%)
 rename meta/recipes-core/meta/{external-csl-toolchain => external-sourcery-toolchain}/SUPPORTED (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch

-- 
1.7.7.6



