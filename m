Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 194BD607AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213282"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:20 +1300
Message-Id: <b6ffb66d2a8687c2c83facb241614f31693e8ee8.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/18] devtool: upgrade: fix removing other recipes from workspace on reset
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:27 -0000

If you did a "devtool add" followed by "devtool upgrade" and then did
a "devtool reset" on the recipe you upgraded, the first recipe would
also be deleted from the workspace - this was because we were
erroneously adding the entire "recipes" subdirectory and its contents to
be tracked for removal on reset. Remove the unnecessary call to
os.path.dirname() that caused this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1285974..ace3a4b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -456,7 +456,7 @@ def _add_md5(config, recipename, filename):
             f.write('%s|%s|%s\n' % (recipename, os.path.relpath(fn, config.workspace_path), md5))
 
     if os.path.isdir(filename):
-        for root, _, files in os.walk(os.path.dirname(filename)):
+        for root, _, files in os.walk(filename):
             for f in files:
                 addfile(os.path.join(root, f))
     else:
-- 
2.1.0


