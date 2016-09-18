Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51F6C73189
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:39:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8I7da8t006831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:39:36 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:39:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 00:39:28 -0700
Message-ID: <fab9cc422365c6be13f5b6003515aa807b3f4f73.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474183984.git.liezhi.yang@windriver.com>
References: <cover.1474183984.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/8] runqemu: work even if a *.qemuboot.conf isn't found
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
X-List-Received-Date: Sun, 18 Sep 2016 07:39:35 -0000
Content-Type: text/plain

From: Joshua Lock <joshua.g.lock@intel.com>

A qemuboot conf file is a convenience but it should still be
possible to invoke runqemu without them, especially for examples
such as using the SDK with an extracted rootfs via NFS.

As read_qemuboot() is always called we need to be sure that function
can return cleanly, without throwing Exceptions, even if a qemuboot
conf file isn't found.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 38f9b30..10122af 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -557,7 +557,8 @@ class BaseConfig(object):
             elif os.getenv('DEPLOY_DIR_IMAGE'):
                 deploy_dir_image = os.getenv('DEPLOY_DIR_IMAGE')
             else:
-                raise OEPathError("DEPLOY_DIR_IMAGE is NULL!")
+                logger.info("Can't find qemuboot conf file, DEPLOY_DIR_IMAGE is NULL!")
+                return
 
             if self.rootfs and not os.path.exists(self.rootfs):
                 # Lazy rootfs
@@ -574,6 +575,11 @@ class BaseConfig(object):
                     self.qemuboot = qbs.split()[0]
                     self.qbconfload = True
 
+        if not self.qemuboot:
+            # If we haven't found a .qemuboot.conf at this point it probably
+            # doesn't exist, continue without
+            return
+
         if not os.path.exists(self.qemuboot):
             raise Exception("Failed to find <image>.qemuboot.conf!")
 
-- 
2.9.0


