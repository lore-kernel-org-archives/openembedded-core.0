Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D085756CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:55:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2015 08:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="704019071"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2015 08:55:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E8ED16A4005;
	Tue,  2 Jun 2015 08:55:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:01:59 +0300
Message-Id: <1433253725-14089-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 1/7] wic: set legacy_boot flag for gpt partitions
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
X-List-Received-Date: Tue, 02 Jun 2015 15:55:59 -0000

This flag is used to tell special purpose software that
the GPT partition may be bootable.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 1c9e3ea..06d4eac 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -312,7 +312,7 @@ class Image:
                                     parted_fs_type, p['start'], p['size'])
 
             if p['boot']:
-                flag_name = "boot"
+                flag_name = "legacy_boot" if d['ptable_format'] == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
                             (flag_name, p['num'], d['disk'].device))
                 self.__run_parted(["-s", d['disk'].device, "set",
-- 
2.1.4


