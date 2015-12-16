Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 8F93C60761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 16:33:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 1E3DD261146
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 16:33:13 +0000
Message-Id: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Wed, 16 Dec 2015 16:33:21 -0000

The individual partitions created by wic are sparse but without
this change the assembled image is written as one (potentially
very) large file.

Preserve sparseness in the assembled image by passing the sparse
conversion symbol.

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
2.5.0


