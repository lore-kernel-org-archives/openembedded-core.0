Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9C361735C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425665"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:40:02 +0000
Message-Id: <90069409779379e885aa419b5c019b081e363fab.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/15] devtool: modify: handle recipes that use a shared workdir
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:34 -0000

If S is outside of WORKDIR then we shouldn't try to get the relative
path in order to work out where the source subdirectory is as we do by
default.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9ab3aa6..4cb03f3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -313,12 +313,14 @@ def modify(args, config, basepath, workspace):
             (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=args.srctree)
             initial_rev = stdout.rstrip()
 
-    # Handle if S is set to a subdirectory of the source
+    # Check that recipe isn't using a shared workdir
     s = rd.getVar('S', True)
     workdir = rd.getVar('WORKDIR', True)
-    if s != workdir and os.path.dirname(s) != workdir:
-        srcsubdir = os.sep.join(os.path.relpath(s, workdir).split(os.sep)[1:])
-        srctree = os.path.join(srctree, srcsubdir)
+    if s.startswith(workdir):
+        # Handle if S is set to a subdirectory of the source
+        if s != workdir and os.path.dirname(s) != workdir:
+            srcsubdir = os.sep.join(os.path.relpath(s, workdir).split(os.sep)[1:])
+            srctree = os.path.join(srctree, srcsubdir)
 
     appendpath = os.path.join(config.workspace_path, 'appends')
     if not os.path.exists(appendpath):
-- 
1.9.3


