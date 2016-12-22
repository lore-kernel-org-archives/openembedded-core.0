Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1DF774FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:20:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2016 18:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="1102758817"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 18:20:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 15:19:57 +1300
Message-Id: <f146f38cc63cc6a9d8bfb642bc955797d26338eb.1482373109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482373109.git.paul.eggleton@linux.intel.com>
References: <cover.1482373109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] lib/oe/path: add warning comment about oe.path.remove() with wildcarded filenames
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
X-List-Received-Date: Thu, 22 Dec 2016 02:20:12 -0000

Add a warning in the doc comment for oe.path.remove() about using that
function on paths that may contain wildcards in the actual
file/directory names.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/path.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 804ecd5..d468540 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -92,7 +92,14 @@ def copyhardlinktree(src, dst):
         copytree(src, dst)
 
 def remove(path, recurse=True):
-    """Equivalent to rm -f or rm -rf"""
+    """
+    Equivalent to rm -f or rm -rf
+    NOTE: be careful about passing paths that may contain filenames with
+    wildcards in them (as opposed to passing an actual wildcarded path) -
+    since we use glob.glob() to expand the path. Filenames containing
+    square brackets are particularly problematic since the they may not
+    actually expand to match the original filename.
+    """
     for name in glob.glob(path):
         try:
             os.unlink(name)
-- 
2.5.5


