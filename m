Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5396FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:21 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 04:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498234"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:32 +0300
Message-Id: <9840db16b5f41754def7d85cbc0794d58d397601.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 43/45] python3: add = to -L linking option only when the path is absolute
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
X-List-Received-Date: Tue, 24 May 2016 11:54:21 -0000

Previously it was added also when the path was relative and not
prefixed with ./, which was causing issues with building numpy.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3/unixccompiler.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/unixccompiler.patch b/meta/recipes-devtools/python/python3/unixccompiler.patch
index 7b90f13..3e2b1d1 100644
--- a/meta/recipes-devtools/python/python3/unixccompiler.patch
+++ b/meta/recipes-devtools/python/python3/unixccompiler.patch
@@ -18,9 +18,9 @@ Index: Python-3.3.2/Lib/distutils/unixccompiler.py
  
      def library_dir_option(self, dir):
 -        return "-L" + dir
-+        if dir.startswith("."):
-+            return "-L" + dir
-+        return "-L=" + dir
++        if dir.startswith("/"):
++            return "-L=" + dir
++        return "-L" + dir
  
      def _is_gcc(self, compiler_name):
          return "gcc" in compiler_name or "g++" in compiler_name
-- 
2.8.1


