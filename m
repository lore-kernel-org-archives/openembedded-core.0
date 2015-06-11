Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 835DF7590A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 11:34:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 04:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709156466"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 04:34:25 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:34:12 +0300
Message-Id: <1434022456-26266-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 06/10] devtool: slight simplification of path splitting logic
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
X-List-Received-Date: Thu, 11 Jun 2015 11:34:24 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4b9cebb..c92c9ae 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -464,13 +464,12 @@ def modify(args, config, basepath, workspace):
                 initial_rev = stdout.rstrip()
 
     # Check that recipe isn't using a shared workdir
-    s = rd.getVar('S', True)
-    workdir = rd.getVar('WORKDIR', True)
-    if s.startswith(workdir):
+    s = os.path.abspath(rd.getVar('S', True))
+    workdir = os.path.abspath(rd.getVar('WORKDIR', True))
+    if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
         # Handle if S is set to a subdirectory of the source
-        if s != workdir and os.path.dirname(s) != workdir:
-            srcsubdir = os.sep.join(os.path.relpath(s, workdir).split(os.sep)[1:])
-            srctree = os.path.join(srctree, srcsubdir)
+        srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+        srctree = os.path.join(srctree, srcsubdir)
 
     appendpath = os.path.join(config.workspace_path, 'appends')
     if not os.path.exists(appendpath):
-- 
2.1.4


