Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1190C78209
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 16:41:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 09:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,281,1496127600"; d="scan'208";a="873115060"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2017 09:41:09 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 09:40:51 -0700
Message-Id: <a5059c803f4b7ea4bd1aeed9315615b598e0a74c.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v4 3/4] standard: append md5 tag only if not already present
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
X-List-Received-Date: Thu, 29 Jun 2017 16:41:11 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

In case the proposed md5 tag to be appended is already present,
do not append it.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7e342e7687..8b6ab9ff16 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -700,8 +700,11 @@ def _add_md5(config, recipename, filename):
 
     def addfile(fn):
         md5 = bb.utils.md5_file(fn)
-        with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
-            f.write('%s|%s|%s\n' % (recipename, os.path.relpath(fn, config.workspace_path), md5))
+        with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a+') as f:
+            md5_str = '%s|%s|%s\n' % (recipename, os.path.relpath(fn, config.workspace_path), md5)
+            f.seek(0, os.SEEK_SET)
+            if not md5_str in f.read():
+                f.write(md5_str)
 
     if os.path.isdir(filename):
         for root, _, files in os.walk(filename):
-- 
2.12.0


