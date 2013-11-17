Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4596D89F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 12:28:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Nov 2013 04:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,718,1378882800"; d="scan'208";a="429102927"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.140])
	by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2013 04:28:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 12:28:19 +0000
Message-Id: <1384691299-21808-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] buildhistory_analysis: fix error when comparing image contents
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
X-List-Received-Date: Sun, 17 Nov 2013 12:28:20 -0000

OE-Core commit b7de1eaac9eed559b2d68058f5de67de74a6cb58 added an extra
argument to the compare_dict_blobs() function but missed adding the
argument to one call to compare two versions of the image-info.txt file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index dd17dd5..ed3a1ec 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -403,7 +403,7 @@ def process_changes(repopath, revision1, revision2='HEAD', report_all=False, rep
                     chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
                     changes.append(chg)
             elif filename == 'image-info.txt':
-                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
+                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all, report_ver))
             elif '/image-files/' in path:
                 chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
                 changes.append(chg)
-- 
1.8.1.2


