Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C012E76086
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 02:05:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 19:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,341,1526367600"; d="scan'208";a="64061317"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.148])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2018 19:05:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2018 10:05:25 +0800
Message-Id: <20180712020525.11952-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180712020525.11952-1-anuj.mittal@intel.com>
References: <20180712020525.11952-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] wic/engine: use up all free space when expanding partitions
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
X-List-Received-Date: Thu, 12 Jul 2018 02:05:29 -0000

Currently we just divide up the free space by the number of partitions
that need to be re-sized. This leads to problems when a user has
explicitly specified a subset of partitions (but not all) that need
to re-sized along with the sizes. As an example, for an image with 3
partitions, if we use:

wic write image.wic /dev/sdb --expand 1:10G

This would lead to paritions 2 and 3 each being re-sized to one thirds
of the free space instead of half.

Change the behavior to use up all the free space.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/engine.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index fe036f60e9..f0c5ff0aaf 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -416,6 +416,7 @@ class Disk:
 
             # calculate expanded partitions sizes
             sizes = {}
+            num_auto_resize = 0
             for num, part in enumerate(parts['partitiontable']['partitions'], 1):
                 if num in expand:
                     if expand[num] != 0: # don't resize partition if size is set to 0
@@ -425,10 +426,11 @@ class Disk:
                         sizes[num] = sectors
                 elif part['type'] != 'f':
                     sizes[num] = -1
+                    num_auto_resize += 1
 
             for num, part in enumerate(parts['partitiontable']['partitions'], 1):
                 if sizes.get(num) == -1:
-                    part['size'] += free // len(sizes)
+                    part['size'] += free // num_auto_resize
 
             # write resized partition table to the target
             write_ptable(parts, target)
-- 
2.17.1


