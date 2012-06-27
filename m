Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZS-0001h1-SX
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344497"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:05 -0700
Message-Id: <cover.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/20] Kernel Updates and other fixes
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:23 -0000

Richard,

Another set of pulls with various fixes and updates.

Of note: 
* Ross's gconf also needs to get into the denzil branch for 1.2.1
  build it and it resolved the gthumb build issue.
* Robert's change for disabling CCACHE
* Zhenhua's linux-dtb work

The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:06 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  mtd-utils: do not stage headers in sysroot

Bruce Ashfield (6):
  kern-tools: add buildall and robustness fixes
  linux-yocto/3.4: update and categorize configuration options
  linux-yocto/3.4: update to v3.4.3
  linux-yocto-rt/3.4: update qemuppc branch
  linux-yocto/3.4: -rt build fixes + configuration audit (part2)
  linux-yocto/3.0: update BSP descriptions to new kern-tools format

Lianhao Lu (3):
  classes/image: Allow openssh empty passwords login.
  image/core-image: Handle conflicting IMAGE_FEATURES.
  task-core-tools-debug: Added openssh-sftp-server.

Marcin Juszkiewicz (1):
  libxml: disable lzma

Robert Yang (1):
  bitbake.conf: disable ccache explicitly if it is not enabled

Ross Burton (1):
  gconf.bbclass: don't register schemas in the install stage

Saul Wold (3):
  mx: Upgrade to 1.4.6
  busybox: add correct ALTERNATIVE_TARGET for init.d/syslog
  native.bbclass: correct PATH to have native-intercept be prepended

Wade Farnsworth (1):
  systemtap: update to version 1.8

Xiaofeng Yan (2):
  archiver.bbclass: Add the function of filtering packages
  local.conf.sample.extended: Add filtering function to
    archiver.bbclass

Zhenhua Luo (1):
  linux-dtb: add multi-dtb build support

 meta/classes/archiver.bbclass                      |   71 +++++++++++++-
 meta/classes/ccache.bbclass                        |    1 +
 meta/classes/core-image.bbclass                    |   13 ++-
 meta/classes/gconf.bbclass                         |   12 ++-
 meta/classes/image.bbclass                         |   24 +++++
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 meta/classes/native.bbclass                        |    2 +-
 meta/conf/bitbake.conf                             |    8 ++
 meta/conf/local.conf.sample.extended               |   14 ++-
 meta/recipes-core/busybox/busybox.inc              |    3 +-
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 meta/recipes-core/libxml/libxml2.inc               |    8 +-
 meta/recipes-core/libxml/libxml2_2.8.0.bb          |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |    3 +
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    6 +-
 .../mx/files/introspection-m4.patch                |  106 --------------------
 .../mx/{mx_1.4.2.bb => mx_1.4.6.bb}                |    9 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   36 ++++++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |   10 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++--
 ...prun-configure.ac-support-without-nss-for.patch |   50 ---------
 .../systemtap_fix_for_automake_1.12.patch          |   23 ----
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    6 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    2 +
 28 files changed, 205 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-graphics/mx/files/introspection-m4.patch
 rename meta/recipes-graphics/mx/{mx_1.4.2.bb => mx_1.4.6.bb} (71%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch

-- 
1.7.7.6



