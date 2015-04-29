Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E75972A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:42:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="721057401"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2015 06:42:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 14:41:55 +0100
Message-Id: <4d6b35a5397fc60dff4746a1e19f219caabeaf9f.1430314621.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] recipetool: avoid second-level subdir when extracting
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
X-List-Received-Date: Wed, 29 Apr 2015 13:42:37 -0000

When -x was specified, we were getting the normal unpack subdirectory
which we don't really want - if there's only one subdirectory unpacked
then we should effectively copy just it to the extraction path, not as a
subdirectory under it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1c71b24..1d5bfd9 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1,6 +1,6 @@
 # Recipe creation tool - create command plugin
 #
-# Copyright (C) 2014 Intel Corporation
+# Copyright (C) 2014-2015 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -110,11 +110,8 @@ def create_recipe(args):
     if '://' in args.source:
         # Fetch a URL
         srcuri = args.source
-        if args.extract_to:
-            srctree = args.extract_to
-        else:
-            tempsrc = tempfile.mkdtemp(prefix='recipetool-')
-            srctree = tempsrc
+        tempsrc = tempfile.mkdtemp(prefix='recipetool-')
+        srctree = tempsrc
         logger.info('Fetching %s...' % srcuri)
         checksums = fetch_source(args.source, srctree)
         dirlist = os.listdir(srctree)
@@ -240,6 +237,10 @@ def create_recipe(args):
         outlines.append('')
     outlines.extend(lines_after)
 
+    if args.extract_to:
+        shutil.move(srctree, args.extract_to)
+        logger.info('Source extracted to %s' % args.extract_to)
+
     if outfile == '-':
         sys.stdout.write('\n'.join(outlines) + '\n')
     else:
-- 
2.1.0


