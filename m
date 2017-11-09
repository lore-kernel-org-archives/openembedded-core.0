Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEA4784EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:07 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171400957"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:02 +1300
Message-Id: <722beec231d14cd9906554ae64eb96cbf83db79c.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/24] recipetool: pass absolute source tree path to plugins
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:07 -0000

We shouldn't be passing a relative path to the plugins if that's what's
been specified on the recipetool command line.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ca474fc..1532735 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -613,9 +613,9 @@ def create_recipe(args):
 
     if args.src_subdir:
         srcsubdir = os.path.join(srcsubdir, args.src_subdir)
-        srctree_use = os.path.join(srctree, args.src_subdir)
+        srctree_use = os.path.abspath(os.path.join(srctree, args.src_subdir))
     else:
-        srctree_use = srctree
+        srctree_use = os.path.abspath(srctree)
 
     if args.outfile and os.path.isdir(args.outfile):
         outfile = None
-- 
2.9.5


