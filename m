Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q5IES-0003pt-Ea
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 15:48:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2011 06:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,275,1299484800"; d="scan'208";a="673728749"
Received: from unknown (HELO helios) ([10.255.12.217])
	by fmsmga002.fm.intel.com with SMTP; 31 Mar 2011 06:46:15 -0700
Received: by helios (sSMTP sendmail emulation); Thu, 31 Mar 2011 14:46:14 +0100
Message-Id: <41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1301578942.git.paul.eggleton@linux.intel.com>
References: <cover.1301578942.git.paul.eggleton@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 14:33:16 +0100
Date: Thu, 31 Mar 2011 14:46:14 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] README.hardware: remove u-boot flashing instructions for mpc8315e-rdb
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
X-List-Received-Date: Thu, 31 Mar 2011 13:48:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Upgrading u-boot is apparently not necessary with current board revisions,
and these instructions may not work properly anyway (our toolchain seems not
to be able to compile u-boot in the way described), and given that they are
potentially risky they should be removed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 README.hardware |   29 +++--------------------------
 1 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/README.hardware b/README.hardware
index 79607f7..025c678 100644
--- a/README.hardware
+++ b/README.hardware
@@ -234,32 +234,7 @@ You will need the following:
 * nfs root setup on your workstation
 * tftp server installed on your workstation
 
-The original U-Boot image on board can't boot kernel versions 2.6.34 or later
-successfully, so the U-Boot image should be upgraded to the latest U-Boot.
-
- 1. First build a new U-Boot image for mpc8315e-rdb, u-boot.bin.mpc8315erdb,
-    then make it available on your tftp server. To compile the new u-boot:
-
- $ git clone git://git.denx.de/u-boot.git
- $ cd u-boot
- $ git checkout -b v2010.09-mpc8315erdb v2010.09
- $ make ARCH=powerpc CROSS_COMPILE=<powerpc cross compiler path> MPC8315ERDB_config
- $ make ARCH=powerpc CROSS_COMPILE=<powerpc cross compiler path> all
- $ cp u-boot.bin u-boot.bin.mpc8315erdb
-
- 2. Set up the environment in U-Boot:
-
- =>setenv ipaddr <board ip>
- =>setenv serverip <tftp server ip>
-
- 3. Flash the new U-Boot image:
-
- =>tftp 200000 u-boot.bin.mpc8315erdb
- =>protect off all
- =>erase fe000000 +60000
- =>cp.b 200000 fe000000 60000
-
-Then the kernel can be booted successfully:
+Load the kernel and boot it as follows:
 
  1. Get the kernel (uImage.mpc8315erdb) and dtb (mpc8315erdb.dtb) files from
     the Poky build tmp/deploy directory, and make them available on your tftp
@@ -267,6 +242,8 @@ Then the kernel can be booted successfully:
 
  2. Set up the environment in U-Boot:
 
+ =>setenv ipaddr <board ip>
+ =>setenv serverip <tftp server ip>
  =>setenv bootargs root=/dev/nfs rw nfsroot=<nfsroot ip>:<rootfs path> ip=<board ip>:<server ip>:<gateway ip>:255.255.255.0:mpc8315e:eth0:off console=ttyS0,115200
 
  3. Download kernel and dtb to boot kernel.
-- 
1.7.1



