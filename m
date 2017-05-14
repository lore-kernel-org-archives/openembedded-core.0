Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A9B2671DAD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 May 2017 22:00:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 14 May 2017 15:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,341,1491289200"; d="scan'208";a="261524633"
Received: from cdhirema-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.50])
	by fmsmga004.fm.intel.com with ESMTP; 14 May 2017 15:00:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 09:59:53 +1200
Message-Id: <7347a6b8ad71cf93639126b5e99986ccaf17e4cc.1494799168.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1494799168.git.paul.eggleton@linux.intel.com>
References: <cover.1494799168.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: create: extract name of package from a repository
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
X-List-Received-Date: Sun, 14 May 2017 22:00:22 -0000

For git repositories in the absence of any other indicator, it's not an
unreasonable assumption that the name of the repository is the name of
the software package it contains, so use that as PN if we don't have
anything else.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5af58a1..2a5a84c 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -339,9 +339,14 @@ def determine_from_url(srcuri):
                 pn = res.group(1).strip().replace('_', '-')
                 pv = res.group(2).strip().replace('_', '.')
 
-        if not pn and not pv and parseres.scheme not in ['git', 'gitsm', 'svn', 'hg']:
-            srcfile = os.path.basename(parseres.path.rstrip('/'))
-            pn, pv = determine_from_filename(srcfile)
+        if not pn and not pv:
+            if parseres.scheme not in ['git', 'gitsm', 'svn', 'hg']:
+                srcfile = os.path.basename(parseres.path.rstrip('/'))
+                pn, pv = determine_from_filename(srcfile)
+            elif parseres.scheme in ['git', 'gitsm']:
+                pn = os.path.basename(parseres.path.rstrip('/')).lower().replace('_', '-')
+                if pn.endswith('.git'):
+                    pn = pn[:-4]
 
     logger.debug('Determined from source URL: name = "%s", version = "%s"' % (pn, pv))
     return (pn, pv)
-- 
2.9.3


