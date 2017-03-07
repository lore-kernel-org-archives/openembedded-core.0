Return-Path: <d.schultz@phytec.de>
X-Greylist: delayed 351 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Mar 2017 13:47:47 UTC
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 4139277846
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 13:47:47 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 232ADA00267;
	Tue,  7 Mar 2017 14:42:23 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017030714415657-315738 ;
	Tue, 7 Mar 2017 14:41:56 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 7 Mar 2017 14:41:56 +0100
Message-Id: <1488894116-13140-2-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1488894116-13140-1-git-send-email-d.schultz@phytec.de>
References: <1488894116-13140-1-git-send-email-d.schultz@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 07.03.2017 14:41:56,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 07.03.2017 14:41:56,
	Serialize complete at 07.03.2017 14:41:56
X-TNEFEvaluated: 1
Subject: [PATCH 2/2] wic: filemap: Fixed spared_copy skip
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
X-List-Received-Date: Tue, 07 Mar 2017 13:47:48 -0000

This patches removes the empty space in front of the copied file which
was skipped. Without this reduction it's not possible to place a
partition with rawcopy and skip parameter on a desired alignment.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 scripts/lib/wic/filemap.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index f3240ba..162603e 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -543,9 +543,9 @@ def sparse_copy(src_fname, dst_fname, offset=0, skip=0):
         end = (last + 1) * fmap.block_size
 
         if start < skip < end:
-            start = skip
-
-        fmap._f_image.seek(start, os.SEEK_SET)
+            fmap._f_image.seek(skip, os.SEEK_SET)
+        else:
+            fmap._f_image.seek(start, os.SEEK_SET)
         dst_file.seek(offset + start, os.SEEK_SET)
 
         chunk_size = 1024 * 1024
-- 
1.9.1


