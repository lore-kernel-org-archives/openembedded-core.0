Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rko1h-0004H4-0q
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 03:34:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jan 2012 18:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55308852"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jan 2012 18:27:18 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 18:27:12 -0800
Message-Id: <47a4f77a6a2ecd8078b3dbcdcc47ecec73d793c7.1326248769.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0068c70293f7b94561ecc2403103f54cc36e70c8.1326248768.git.nitin.a.kamble@intel.com>
References: <0068c70293f7b94561ecc2403103f54cc36e70c8.1326248768.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326248768.git.nitin.a.kamble@intel.com>
References: <cover.1326248768.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/6] insane.bbclass: fix elf.arch not matching error for x32 kernel
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
X-List-Received-Date: Wed, 11 Jan 2012 02:34:57 -0000

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



