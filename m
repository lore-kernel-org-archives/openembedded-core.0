Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 1005 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Feb 2019 09:11:30 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC826BCDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 09:11:29 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x158sjgv029304
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 5 Feb 2019 09:54:46 +0100
Received: from dev.vm6.ccp.siemens.com (MD1JJJ2C.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x158sj4h017701;
	Tue, 5 Feb 2019 09:54:45 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id AAF2A4FAF6D;
	Tue,  5 Feb 2019 09:54:44 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 09:54:25 +0100
Message-Id: <20190205085425.10186-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <2d7a4b6a-9286-2a3a-c51d-24df733e458b@siemens.com>
References: <2d7a4b6a-9286-2a3a-c51d-24df733e458b@siemens.com>
Subject: [PATCH] lib/oe/rootfs: prelink only when image-prelink is inherited
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
X-List-Received-Date: Tue, 05 Feb 2019 09:11:30 -0000

Use prelink only when image-prelink class is inherited. Inheriting this
class adds prelink-native as dependency to do_rootfs, which makes prelink
binary and configuration available.

|Exception: FileNotFoundError: [Errno 2] No such file or directory:
|'/home/.../1.0-r0/recipe-sysroot-native/etc/prelink.conf'
|
| if not os.path.exists(prelink_cfg):
|     shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),prelink_cfg)

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/lib/oe/rootfs.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 551dcfc75f..ffbd1438aa 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -747,15 +747,16 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if filecmp.cmp(f1, f2):
             return True
 
-        if self.image_rootfs not in f1:
-            self._prelink_file(f1.replace(key, ''), f1)
+        if bb.data.inherits_class('image-prelink', self.d):
+            if self.image_rootfs not in f1:
+                self._prelink_file(f1.replace(key, ''), f1)
 
-        if self.image_rootfs not in f2:
-            self._prelink_file(f2.replace(key, ''), f2)
+            if self.image_rootfs not in f2:
+                self._prelink_file(f2.replace(key, ''), f2)
 
-        # Both of them are prelinked
-        if filecmp.cmp(f1, f2):
-            return True
+            # Both of them are prelinked
+            if filecmp.cmp(f1, f2):
+                return True
 
         # Not equal
         return False
-- 
2.11.0


