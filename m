Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVLVe-0002cq-7Z
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:42:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 05:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="292207905"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2013 05:24:10 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:23:59 +0300
Message-Id: <26aacc9f7a93b0f91f3f503e65bc79e5ba1de7c3.1366892003.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/4] Revert "qemu.bbclass: Use the correct qemu binary in multilib cases"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 12:43:16 -0000

This reverts commit 9f5a6f89d9f4a6c7bed3b163e6eaa764d762f523.

The reason for reverting this is:
 * qemuwrapper has now a fallback method;
 * when using multilib, calling qemu_target_binary from recipes would
   always point to the qemu binary corresponding to the machine
   architecture. Hence, postinstalls needing to use qemu would call the
   wrong qemu user emulation binary;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/qemu.bbclass |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 930c6b0..3d437b0 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -4,9 +4,7 @@
 #
 
 def qemu_target_binary(data):
-    target_arch = data.getVar("TARGET_ARCH_MULTILIB_ORIGINAL", True)
-    if not target_arch:
-        target_arch = data.getVar("TARGET_ARCH", True)
+    target_arch = data.getVar("TARGET_ARCH", True)
     if target_arch in ("i486", "i586", "i686"):
         target_arch = "i386"
     elif target_arch == "powerpc":
-- 
1.7.9.5



