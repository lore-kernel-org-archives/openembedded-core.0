Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0516B6F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:07:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2016 15:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,476,1455004800"; d="scan'208";a="931095741"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2016 15:07:52 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:08:07 -0700
Message-Id: <1460498887-18624-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] devtool: sdk-update fails on remote hosts
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
X-List-Received-Date: Tue, 12 Apr 2016 22:07:51 -0000

This fixes bug #9426:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9426

Skip .git folders when copying the build system.

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


