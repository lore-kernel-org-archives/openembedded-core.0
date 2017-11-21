Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4193178844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 21:47:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2017 13:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,432,1505804400"; 
   d="scan'208";a="4958690"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 21 Nov 2017 13:47:05 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:47:03 -0800
Message-Id: <20171121214703.11109-2-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171121214703.11109-1-california.l.sullivan@intel.com>
References: <20171121214703.11109-1-california.l.sullivan@intel.com>
Subject: [PATCH 2/2] install*.sh: add short sleep after parted commands
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Nov 2017 21:47:04 -0000

I wasn't able to install to my Optane SSD due to the following error:

Formatting /dev/nvme0n1p1 to vfat...
mkfs.fat 4.1 (2017-01-24)
mkfs.vfat: unable to open /dev/nvme0n1p1: No such file or directory
Target install-efi failed

A couple lines later I see:

[    10.265401]  nvme0n1: p1 p2 p3

Then looking at the device itself after booting from a USB stick:

root@intel-corei7-64: ~# ls /dev/nvme0n1*
/dev/nvme0n1 /dev/nvme0n1p1 /dev/nvme0n1p2 /dev/nvme0n1p3

So it looks like the parted commands return before the device node is
actually created.

Work around this issue by adding a short sleep before doing the mkfs
commands.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 ++
 meta/recipes-core/initrdscripts/files/init-install.sh     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 5ad3a60..118bf08 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -186,6 +186,8 @@ parted ${device} mkpart swap linux-swap $swap_start 100%
 
 parted ${device} print
 
+sleep 1
+
 echo "Formatting $bootfs to vfat..."
 mkfs.vfat $bootfs
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 1cac806..606317d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -211,6 +211,8 @@ parted ${device} mkpart $pname linux-swap $swap_start 100%
 
 parted ${device} print
 
+sleep 1
+
 echo "Formatting $bootfs to ext3..."
 mkfs.ext3 $bootfs
 
-- 
2.9.5


