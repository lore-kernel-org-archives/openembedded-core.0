Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 04CB76ABF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 20:45:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2015 13:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,583,1422950400"; d="scan'208";a="680733720"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2015 13:45:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 2FBAC6A408F;
	Wed, 15 Apr 2015 13:45:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 23:45:46 +0300
Message-Id: <1429130746-14317-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: code cleanup: undefined variables
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
X-List-Received-Date: Wed, 15 Apr 2015 20:45:56 -0000

Fixed forgoten imports Wic_PartData and ImageError.
Removed unused and undefined variable syslinux_conf.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/__init__.py | 1 +
 scripts/lib/wic/plugins/source/bootimg-efi.py         | 3 +--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py      | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/__init__.py b/scripts/lib/wic/kickstart/custom_commands/__init__.py
index f84c6d9..b4e613d 100644
--- a/scripts/lib/wic/kickstart/custom_commands/__init__.py
+++ b/scripts/lib/wic/kickstart/custom_commands/__init__.py
@@ -1,6 +1,7 @@
 from micpartition import Mic_Partition
 from micpartition import Mic_PartData
 from partition import Wic_Partition
+from partition import Wic_PartData
 
 __all__ = (
     "Mic_Partition",
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index d6c11ed..883378e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -27,6 +27,7 @@
 import os
 import shutil
 
+from wic.utils.errors import ImageError
 from wic import kickstart, msger
 from wic.utils import misc, fs_related, errors, runner, cmdln
 from wic.conf import configmgr
@@ -72,8 +73,6 @@ class BootimgEFIPlugin(SourcePlugin):
         grubefi_conf += "linux %s root=%s rootwait %s\n" \
             % (kernel, rootstr, options)
         grubefi_conf += "}\n"
-        if splashline:
-            syslinux_conf += "%s\n" % splashline
 
         msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
                         % cr_workdir)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index abb32eb..2280867 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -26,6 +26,7 @@
 
 import os
 
+from wic.utils.errors import ImageError
 from wic import kickstart, msger
 from wic.utils import misc, fs_related, errors, runner, cmdln
 from wic.conf import configmgr
-- 
2.1.4


