Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 60C6771AC8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 02:54:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 02 Nov 2016 19:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,436,1473145200"; d="scan'208";a="781747456"
Received: from mdonthir-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.161])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2016 19:54:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 15:53:53 +1300
Message-Id: <db66dad07cfa38a56436a7df05ce4ff0e3c91e90.1478141595.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478141595.git.paul.eggleton@linux.intel.com>
References: <cover.1478141595.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478141595.git.paul.eggleton@linux.intel.com>
References: <cover.1478141595.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: update-recipe: decode output before treating it as a string
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
X-List-Received-Date: Thu, 03 Nov 2016 02:54:19 -0000

When you receive output from subprocess, with Python 3 it's a stream of
bytes so you need to decode it before you can start treating it as a
string.

Fixes [YOCTO #10447].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4eff6f8..32eac23 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -331,6 +331,7 @@ def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
         cmd.append('-r')
     out, _ = bb.process.run(cmd, cwd=repodir)
     ret = {}
+    out = out.decode('utf-8')
     for line in out.split('\0'):
         if line:
             split = line.split(None, 4)
-- 
2.5.5


