Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8C671984
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 02:43:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB82hcXA025177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Dec 2017 18:43:38 -0800 (PST)
Received: from pek-lpgbuild2.wrs.com (128.224.153.30) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 7 Dec 2017 18:43:38 -0800
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Dec 2017 10:45:45 +0800
Message-ID: <20171209024546.16918-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/2] wic: plugins: rawcopy: support to add offset when writing the raw image
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
X-List-Received-Date: Fri, 08 Dec 2017 02:43:39 -0000
Content-Type: text/plain

In some cases we need to skip some reserved sectors when writing a raw
image. So add support to set an offset for writing.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 424ed26ed6ba..baf991fe8d5d 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -53,10 +53,9 @@ class RawCopyPlugin(SourcePlugin):
         src = os.path.join(kernel_dir, source_params['file'])
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
-        if 'skip' in source_params:
-            sparse_copy(src, dst, skip=int(source_params['skip']))
-        else:
-            sparse_copy(src, dst)
+        skip = 0 if 'skip' not in source_params else int(source_params['skip'])
+        seek = 0 if 'seek' not in source_params else int(source_params['seek'])
+        sparse_copy(src, dst, skip, seek)
 
         # get the size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % dst
-- 
2.9.3


