Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 125F36F564
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 09:44:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 03 Mar 2014 01:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,576,1389772800"; d="scan'208";a="484729179"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 01:43:35 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 11:43:31 +0200
Message-Id: <bb06f92710d0567d5019cf13d6c11caa1fc91d32.1393839480.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393839480.git.laurentiu.palcu@intel.com>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1393839480.git.laurentiu.palcu@intel.com>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] package_manager.py: RpmPM: don't add smart channel if already added
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
X-List-Received-Date: Mon, 03 Mar 2014 09:44:43 -0000

Make sure the channel was not already added, before attempting to add.

[YOCTO #5890]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6c133c3..ee42952 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -604,11 +604,11 @@ class RpmPM(PackageManager):
         # self._invoke_smart('config --set rpm-log-level=debug')
         # cmd = 'config --set rpm-log-file=/tmp/smart-debug-logfile'
         # self._invoke_smart(cmd)
-
+        ch_already_added = []
         for canonical_arch in platform_extra:
             arch = canonical_arch.split('-')[0]
             arch_channel = os.path.join(self.deploy_dir, arch)
-            if os.path.exists(arch_channel):
+            if os.path.exists(arch_channel) and not arch in ch_already_added:
                 bb.note('Note: adding Smart channel %s (%s)' %
                         (arch, channel_priority))
                 self._invoke_smart('channel --add %s type=rpm-md baseurl=%s -y'
@@ -617,6 +617,8 @@ class RpmPM(PackageManager):
                                    (arch, channel_priority))
                 channel_priority -= 5
 
+                ch_already_added.append(arch)
+
         bb.note('adding Smart RPM DB channel')
         self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
 
-- 
1.7.9.5


