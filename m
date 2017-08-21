Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DDE167823B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:41:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2017 22:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228321"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:41:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:46 +1200
Message-Id: <8aa091517b16f409d7b4366fffd0fc4cdb50541a.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/10] devtool: append md5sum only if not already present
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
X-List-Received-Date: Mon, 21 Aug 2017 05:41:11 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

In case the proposed md5sum to be appended to the .devtool_md5 file
is already present, do not append it.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ec19223..fa9d347 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -674,8 +674,11 @@ def _add_md5(config, recipename, filename):
 
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
2.9.5


