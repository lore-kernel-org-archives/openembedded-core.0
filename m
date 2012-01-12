Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RlTHU-0005hi-S0
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:38:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2012 14:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97808819"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 14:30:25 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 14:30:17 -0800
Message-Id: <8ae900cc1448817ae8941d44dc6d484214dec1ac.1326406744.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <e7790b276b6dfce808bb6b70fe2847af657cd7b5.1326406744.git.nitin.a.kamble@intel.com>
References: <e7790b276b6dfce808bb6b70fe2847af657cd7b5.1326406744.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326406744.git.nitin.a.kamble@intel.com>
References: <cover.1326406744.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/7] insane.bbclass: fix elf.arch not matching error for x32 kernel
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
X-List-Received-Date: Thu, 12 Jan 2012 22:38:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

For x32 the user space is 32bit and the kernel is 64bit.
So the elf.arch for vmlinuz is x86_64 and not x86. This commit
fixes this QA error thrown for x32 kernel.

| ERROR: QA Issue: Architecture did not match (62 to 3) on
/work/qemux86_64-poky-linux-gnux32/linux-korg-3.1+git1+e2bf8464ddbf5da24d3d320cded5691828a91a0b-r1/packages-split/kernel-vmlinux/boot/vmlinux-3.1.0-yocto-standard-01628-ge2bf846
Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/insane.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8d6b11c..ce21496 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -331,7 +331,8 @@ def package_qa_check_arch(path,name,d, elf, messages):
         = package_qa_get_machine_dict()[target_os][target_arch]
 
     # Check the architecture and endiannes of the binary
-    if not machine == elf.machine():
+    if not ((machine == elf.machine()) or \
+	("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
         messages.append("Architecture did not match (%d to %d) on %s" % \
                  (machine, elf.machine(), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or  \
-- 
1.7.6.4



