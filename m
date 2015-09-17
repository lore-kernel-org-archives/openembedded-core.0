Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5E776DF8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 03:55:18 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so8051707pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 20:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=heFqTMwr4LApRbCzyOyHArESdrGtBmxySGV6ODKidGo=;
	b=C2Kx/ZL66COD5fGvid5NMVZs/cWtctzUMkoNNOqJjhAasK24vqqMSGTtPDxaSTVzVE
	1JbUl4R8an1Byv3hIseI4YOgVEAJyFGEC0/MdRY+/BAtDUngNQVRp/DuxuZORihKWTp3
	w1GzElkgooFFNLDtdq9QFlmvsCWhM20lCR6L7J0E/MpEsBockE5o8X5bO+xU3KP0mPUy
	16lZocTeV3hcEU0IBEctvJBHfH4iwgdemM2j7DMD/n2al/gV0WxuPqNATj6+soHRvHsS
	wexkiOit3sDUMWFezprJeYhiogO6rVhIP4nkRperKqzVFTrcJKvnTVa3mdFnAPLLP2ij
	77sQ==
X-Received: by 10.68.65.3 with SMTP id t3mr67378036pbs.127.1442462119205;
	Wed, 16 Sep 2015 20:55:19 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id qr5sm965072pbb.26.2015.09.16.20.55.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 20:55:18 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 13:55:31 +1000
Message-Id: <1442462131-20150-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] image.py: make sure ROOTFS_SIZE is an integer
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
X-List-Received-Date: Thu, 17 Sep 2015 03:55:21 -0000

_get_rootfs_size was returning a float in some cases (e.g. 12288.0).

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/lib/oe/image.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 2361955..f8aa88b 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -1,6 +1,7 @@
 from oe.utils import execute_pre_post_process
 import os
 import subprocess
+import math
 import multiprocessing
 
 
@@ -169,10 +170,7 @@ class Image(ImageDepGraph):
         base_size = size_kb * overhead_factor
         base_size = (base_size, rootfs_req_size)[base_size < rootfs_req_size] + \
             rootfs_extra_space
-
-        if base_size != int(base_size):
-            base_size = int(base_size + 1)
-
+        base_size = int(math.ceil(base_size))
         base_size += rootfs_alignment - 1
         base_size -= base_size % rootfs_alignment
 
-- 
2.5.0


