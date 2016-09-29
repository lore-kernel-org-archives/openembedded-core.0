Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8A68665D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 22:51:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 29 Sep 2016 15:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,417,1473145200"; d="scan'208";a="14796094"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 29 Sep 2016 15:51:25 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 15:50:24 -0700
Message-Id: <20160929225024.27698-3-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160929225024.27698-1-stephano.cetola@linux.intel.com>
References: <20160929225024.27698-1-stephano.cetola@linux.intel.com>
Subject: [PATCH v2 2/2] subprocess: remove Popen in favor of check_output
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
X-List-Received-Date: Thu, 29 Sep 2016 22:51:25 -0000

This begins moving away from the deprecated subprocess calls in an
effort to eventually move to some more global abstraction using the run
convenience method provided in python 3.5.

[ YOCTO #9342 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/buildstats.bbclass |  6 +++++-
 meta/classes/spdx.bbclass       | 11 +++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 34ecb03..8c2b7b3 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -163,7 +163,11 @@ python run_buildstats () {
             bs = os.path.join(bsdir, "build_stats")
             with open(bs, "a") as f:
                 rootfs = d.getVar('IMAGE_ROOTFS', True)
-                rootfs_size = subprocess.Popen(["du", "-sh", rootfs], stdout=subprocess.PIPE).stdout.read()
+                try:
+                    rootfs_size = subprocess.check_output(["du", "-sh", rootfs],
+                            stderr=subprocess.STDOUT).decode('utf-8')
+                except subprocess.CalledProcessError as e:
+                    bb.error("Failed to get rootfs size: %s" % e.output)
                 f.write("Uncompressed Rootfs size: %s" % rootfs_size)
 
     elif isinstance(e, bb.build.TaskFailed):
diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index 0c92765..89394d3 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -219,14 +219,13 @@ def hash_string(data):
 def run_fossology(foss_command, full_spdx):
     import string, re
     import subprocess
-    
-    p = subprocess.Popen(foss_command.split(),
-        stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-    foss_output, foss_error = p.communicate()
-    if p.returncode != 0:
+
+    try:
+        foss_output = subprocess.check_output(foss_command.split(),
+                stderr=subprocess.STDOUT).decode('utf-8')
+    except subprocess.CalledProcessError as e:
         return None
 
-    foss_output = unicode(foss_output, "utf-8")
     foss_output = string.replace(foss_output, '\r', '')
 
     # Package info
-- 
2.10.0


