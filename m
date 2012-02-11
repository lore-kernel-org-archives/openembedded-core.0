Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rw0yn-00079b-7N
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 01:38:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Feb 2012 16:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105636744"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.248])
	by azsmga001.ch.intel.com with ESMTP; 10 Feb 2012 16:30:08 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 16:30:07 -0800
Message-Id: <dfc93718c100209c9897317d2399da7691a41070.1328920045.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1328920045.git.josh@linux.intel.com>
References: <cover.1328920045.git.josh@linux.intel.com>
In-Reply-To: <cover.1328920045.git.josh@linux.intel.com>
References: <cover.1328920045.git.josh@linux.intel.com>
Subject: [PATCH 1/1] base.bbclass: look in layers for SRC_URI with MACHINE overrides too
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Feb 2012 00:38:17 -0000

The logic which looks for MACHINE overrides in SRC_URI and updates PACKAGE_ARCH
accordingly doesn't account for SRC_URI overrides in layers.

This patch may not be the cleanest approach to solving the issue but it works.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/base.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a26ac94..8fd5e53 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -460,6 +460,16 @@ python () {
             path = bb.data.expand(os.path.join("${FILE_DIRNAME}", p, "${MACHINE}"), d)
             if os.path.isdir(path):
                 paths.append(path)
+
+        # FILE is relative to the original recipe, for any bbappends in
+        # layers we need to look a little further
+        expaths = d.getVar('FILESEXTRAPATHS', True) or ""
+        for path in expaths.split(":"):
+            if len(path):
+                p = bb.data.expand(os.path.join(path, "${MACHINE}"), d)
+                if os.path.isdir(p):
+	            paths.append(p)
+
         if len(paths) != 0:
             for s in srcuri.split():
                 if not s.startswith("file://"):
-- 
1.7.7.6



