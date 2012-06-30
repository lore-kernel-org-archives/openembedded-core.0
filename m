Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkpR8-0003fQ-Kt
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:37:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2012 21:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186844522"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2012 21:26:36 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 21:25:02 -0700
Message-Id: <cover.1341025161.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/3 V3b] Enable building modules on target
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
X-List-Received-Date: Sat, 30 Jun 2012 04:37:34 -0000

Note: As this is a major change that impacts every BSP, I suggest this
      spend some time in MUT before being included into master.

This series adds support for building modules on the target via an expanded
kernel-dev package.

Sending to both oe-core and poky as this series touches files in both
and I didn't want to confuse the intent or the dependency by splitting
them up (at least the original did, keeping it consistent).

V2:
o Add files to kernel-dev rather than create a new kernel-headers package
o Move the location to /usr/src/kernel from /usr/src/kernel-headers
o Eliminate the kernel-misc package as kernel-dev covers it now
o Fix a bug with linux-yocto-custom exposed during testing

V3b:
o Rebase on origin/master where 2 patches had already been applied
o Correct the bitbake.conf STAGING_KERNEL_DIR path which I missed in V2
o Move kernel-dev inclusion from task-core-sdk to the core-image*sdk recipes
  in order to avoid making task-core-sdk machine specific
o Kill the kernel_package_prepend() function which deleted the kernel headers
o Add a KERNEL_SRC_DIR variable to avoid missing one of the many hard-coded
  paths during an update

Testing Performed:
Built core-image-sato-sdk, core-image-lsb-sdk, and core-image-rt-sdk for
qemux86 and built the kernel scripts with:

  # make -C /usr/src/kernel scripts

For sato-sdk and lsb-sdk, copied over the hello-mod module sources and built the
hello-mod module on the target, insmod, rmmod, dmesg -n 2.  The output was
correct. rt-sdk didn't have dropbear or feasible way to quickly copy the files
across, but I'm confident knowing the scripts built.

The following changes since commit a5b2c1e4ce3ad4f2b9ea306c6d10f528c5ef8b66:

  bitbake: Hob: change 'run image' and 'deploy' Gui and work flow for building detail page (2012-06-29 14:46:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/modules-v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/modules-v3

Darren Hart (3):
  kernel: Add kernel headers to kernel-dev package
  linux-yocto-custom: Remove linux-tools
  core-image*sdk: Add kernel-dev to sdk images

 .../recipes-kernel/linux/linux-yocto-custom.bb     |    2 --
 meta/classes/kernel.bbclass                        |   27 +++++++++-----------
 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    1 +
 meta/recipes-kernel/linux/linux-yocto.inc          |    2 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    3 +++
 7 files changed, 19 insertions(+), 20 deletions(-)

-- 
1.7.10.2



