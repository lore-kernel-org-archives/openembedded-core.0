Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 27F51731D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537896"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:54 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:33 +0100
Message-Id: <8b36659a613c980781797166daadf4d961cdc152.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
Subject: [PATCH 6/6] runqemu: work even if a *.qemuboot.conf isn't found
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:54 -0000

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
2.7.4


