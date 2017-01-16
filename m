Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3838171C1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 16 Jan 2017 08:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="31209546"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2017 08:10:50 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A1CF16A4006;
	Mon, 16 Jan 2017 08:09:53 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:36 +0200
Message-Id: <c457254471c2398024d672b08305bc4be6cdafe1.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 07/14] wic: use EFI artifacts from $WORKDIR/efi
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:50 -0000

Made bootimg-efi to use EFI artifacts from $WORKDIR/efi instead
of $HDDDIR. This should eliminate its dependency on hddimg functionality
which is going to be removed soon.

[YOCTO #10835]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 305e910..1d5e73f 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -167,9 +167,7 @@ class BootimgEFIPlugin(SourcePlugin):
         In this case, prepare content for an EFI (grub) boot partition.
         """
         if not bootimg_dir:
-            bootimg_dir = get_bitbake_var("HDDDIR")
-            if not bootimg_dir:
-                msger.error("Couldn't find HDDDIR, exiting\n")
+            bootimg_dir = os.path.join(get_bitbake_var("WORKDIR"), "efi")
             # just so the result notes display it
             creator.set_bootimg_dir(bootimg_dir)
 
-- 
2.1.4


