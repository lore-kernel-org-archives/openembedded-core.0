Return-Path: <jukka.laitinen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C807771A72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:43:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 26 Jan 2017 04:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="217887039"
Received: from tmsbuild019.tm.intel.com ([10.237.53.137])
	by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2017 04:43:03 -0800
From: Jukka Laitinen <jukka.laitinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 17:43:33 +0200
Message-Id: <1485445413-10553-1-git-send-email-jukka.laitinen@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: partitionedfs: set partition name for gpt partitions
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
X-List-Received-Date: Thu, 26 Jan 2017 12:43:05 -0000

Set proper gpt partition name for the partitions in case given
in the configuration

Signed-off-by: Jukka Laitinen <jukka.laitinen@intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 721d514..ed67b9a 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -316,6 +316,13 @@ class Image():
                                 (part['num'], part['uuid'], disk['disk'].device),
                                 self.native_sysroot)
 
+            if part['label'] and disk['ptable_format'] == "gpt":
+                msger.debug("partition %d: set name to %s" % \
+                            (part['num'], part['label']))
+                exec_native_cmd("parted -s %s name %d %s" % \
+                                (disk['disk'].device, part['num'], part['label']),
+                                self.native_sysroot)
+
             if part['boot']:
                 flag_name = "legacy_boot" if disk['ptable_format'] == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
-- 
2.7.4


