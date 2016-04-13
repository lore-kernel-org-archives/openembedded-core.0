Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C11C3605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:13:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2016 09:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,480,1455004800"; d="scan'208";a="954208736"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga002.jf.intel.com with ESMTP; 13 Apr 2016 09:13:22 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 09:13:47 -0700
Message-Id: <1460564027-24487-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] devtool: don't copy .git when building the eSDK
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
X-List-Received-Date: Wed, 13 Apr 2016 16:13:28 -0000

When creating an eSDK ensure that any .git directories are not included.

[ YOCTO #9426 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index dd0e664..7b9a0ee 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -8,7 +8,7 @@ def _smart_copy(src, dest):
     # source is a file or a directory.
     mode = os.stat(src).st_mode
     if stat.S_ISDIR(mode):
-        shutil.copytree(src, dest, symlinks=True)
+        shutil.copytree(src, dest, symlinks=True, ignore=shutil.ignore_patterns('.git'))
     else:
         shutil.copyfile(src, dest)
         shutil.copymode(src, dest)
-- 
2.8.0


