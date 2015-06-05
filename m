Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 37A767586D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:06:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 02:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="737584536"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2015 02:06:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id D40D46A4083;
	Fri,  5 Jun 2015 02:05:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:12:24 +0300
Message-Id: <1433488349-4178-11-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 6/9] wic: set type GUID and UUID for partition
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
X-List-Received-Date: Fri, 05 Jun 2015 09:06:53 -0000

Set type GUID and UUID for partition using sgdisk utility.

Type GUID can be specified for partition in .wks with
--part-type option.

UUID is generated when --use-uuid option is specified for
partition.

[YOCTO #7716]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index a6e2e4f..1eb1f01 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -294,6 +294,21 @@ class Image(object):
             self.__create_partition(d['disk'].device, p['type'],
                                     parted_fs_type, p['start'], p['size'])
 
+            if p['part_type']:
+                msger.debug("partition %d: set type UID to %s" % \
+                            (p['num'], p['part_type']))
+                exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
+                                         (p['num'], p['part_type'],
+                                          d['disk'].device), self.native_sysroot)
+
+            if p['uuid']:
+                msger.debug("partition %d: set UUID to %s" % \
+                            (p['num'], p['uuid']))
+                exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
+                                         (p['num'], p['uuid'],
+                                          d['disk'].device),
+                                        self.native_sysroot)
+
             if p['boot']:
                 flag_name = "legacy_boot" if d['ptable_format'] == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
-- 
2.1.4


