Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U3Znu-00083f-Ut
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:18:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2013 08:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,622,1355126400"; d="scan'208";a="259153821"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2013 08:29:55 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 18:29:48 +0200
Message-Id: <be1b5095a4a00bcc903f19871419b3a91949ea21.1360254263.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360254263.git.laurentiu.palcu@intel.com>
References: <cover.1360254263.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360254263.git.laurentiu.palcu@intel.com>
References: <cover.1360254263.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] qemu.bbclass: fix segfaults when running through pseudo
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
X-List-Received-Date: Thu, 07 Feb 2013 22:18:51 -0000

qemu user binaries sometimes segfault when running them through pseudo.
So, set PSEUDO_UNLOAD to 1 before running any qemu binary.

[YOCTO #3788]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/qemu.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index cd2e323..8b03926 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -34,5 +34,5 @@ def qemu_run_binary(data, rootfs_path, binary):
     library_path = rootfs_path + data.getVar("base_libdir", True) + ":" + \
                    rootfs_path + data.getVar("libdir", True)
 
-    return qemu_binary + " " + dynamic_loader + " --library-path " + library_path \
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + dynamic_loader + " --library-path " + library_path \
            + " " + rootfs_path + binary
-- 
1.7.9.5



