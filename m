Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 870687714F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 2A388609014
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:30 +0100
Message-Id: <a46fb1a06be2df00a0bceb4e60ebdecb55b5974c.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 09/52] devtool: extract: fix error handling
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:21 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

If recipe parsing fails we need to exit out instead of attempting to use
the data object that's set to None, which resulted in a traceback.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/devtool/standard.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6ce3144..5d7e903 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -225,6 +225,9 @@ def extract(args, config, basepath, workspace):
     import bb
 
     tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    if not tinfoil:
+        # Error already shown
+        return 1
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
@@ -271,6 +274,8 @@ def _prep_extract_operation(config, basepath, recipename):
        trying to extract a package. Returns the tinfoil instance to be used."""
     tinfoil = setup_tinfoil(basepath=basepath)
     rd = parse_recipe(config, tinfoil, recipename, True)
+    if not rd:
+        return None
 
     if bb.data.inherits_class('kernel-yocto', rd):
         tinfoil.shutdown()
@@ -500,6 +505,9 @@ def modify(args, config, basepath, workspace):
                            args.srctree)
     if args.extract:
         tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+        if not tinfoil:
+            # Error already shown
+            return 1
     else:
         tinfoil = setup_tinfoil(basepath=basepath)
 
-- 
2.1.4


