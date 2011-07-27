Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QmDIu-0004Yv-NE
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:14:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2011 16:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="33071962"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2011 16:10:01 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 16:09:57 -0700
Message-Id: <cover.1311806842.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/4] Commits enabling x32 infrastructure in the master branch
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
X-List-Received-Date: Wed, 27 Jul 2011 23:14:16 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These commits add infrastructure to the oe-core/yocto to add the meta-x32 layer to build x32 images. core-image-minimal has been tested to work with this commits

=== How to build an image with x32 binaries

Add this layer on top of yocto/oe-core
  http://git.pokylinux.org/cgit/cgit.cgi/experimental/meta-x32/
Add these lines in your conf/local.conf
  MACHINE = "qemux86-64"
  DEFAULTTUNE = "x86-64-x32"
  TUNE_PKGARCH = "x86-64-x32"

And build the minimal image with command:
  bitbake core-image-minimal 

And then run it with qemu with this command:
  runqemu qemux86-64 core-image-minimal


=== How to know if your binaries/libraries are x32:
  Run the file command to know what type of elf binary is it. It should 
  be 32bit x86-64 elf binary as seen here:
  $ file bin/busybox 
bin/busybox: setuid ELF 32-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.35, not stripped

  $file usr/lib/libz.so.1.2.5 
usr/lib/libz.so.1.2.5: ELF 32-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, not stripped

The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:

  poky.conf: explicitly referenced preferred linux-yocto version (2011-07-27 09:56:56 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32

Nitin A Kamble (4):
  toolchain-scripts & other classes: add TARGET_LD_ARCH &
    TARGET_AS_ARCH vars
  siteinfo.bbclass: add entries for new x86_64 ABI targets
  insane.bbclass: add entries for linux-gnu<ABI>
  x86 tune inc files: add x32 abi tune parameters

 meta/classes/allarch.bbclass                 |    2 ++
 meta/classes/cross-canadian.bbclass          |    2 ++
 meta/classes/cross.bbclass                   |    2 ++
 meta/classes/crosssdk.bbclass                |    2 ++
 meta/classes/insane.bbclass                  |    9 +++++++++
 meta/classes/native.bbclass                  |   10 +++++++---
 meta/classes/nativesdk.bbclass               |    4 ++++
 meta/classes/siteinfo.bbclass                |   14 +++++++++++++-
 meta/classes/toolchain-scripts.bbclass       |    9 +++++----
 meta/conf/bitbake.conf                       |   23 +++++++++++++++++------
 meta/conf/machine/include/ia32/arch-ia32.inc |   23 ++++++++++++++++++++---
 meta/conf/machine/include/tune-core2.inc     |    4 ++++
 meta/conf/machine/include/tune-x86_64.inc    |    2 +-
 13 files changed, 88 insertions(+), 18 deletions(-)

-- 
1.7.4.4



