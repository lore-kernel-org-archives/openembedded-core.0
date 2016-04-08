Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E826B7327F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 09:14:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 08 Apr 2016 02:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="928169333"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.22.160])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2016 02:14:26 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Apr 2016 10:14:18 +0100
Message-Id: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Cc: Joshua Lock <joshua.lock@collabora.co.uk>
Subject: [PATCH 1/2] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Fri, 08 Apr 2016 09:14:28 -0000

From: Joshua Lock <joshua.lock@collabora.co.uk>

The individual partitions created by wic are sparse but without
this change the assembled image is written as one (potentially
very) large file.

Preserve sparseness in the assembled image by passing the sparse
conversion symbol.

[YOCTO #9099]

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 scripts/lib/wic/utils/partitionedfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 5a103bb..3e2b420 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -340,7 +340,7 @@ class Image(object):
             source = part['source_file']
             if source:
                 # install source_file contents into a partition
-                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
+                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc,sparse" % \
                       (source, image_file, self.sector_size,
                        part['start'], part['size'])
                 exec_cmd(cmd)
-- 
2.5.5


