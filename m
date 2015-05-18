Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9A574053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731190754"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:15:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:15:04 +0100
Message-Id: <b8b806a0726b2a357f2de9742ac4615ff03595d0.1431961859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] devtool / recipetool: ensure bb.note() gets printed
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
X-List-Received-Date: Mon, 18 May 2015 15:15:15 -0000

Most of the time when bb.note() gets called we want to see the output,
so ensure the level is set appropriately depending on the command line
options instead of being fixed at warning. (We don't want to see the
notes for fetch/unpack/patch though as they are too verbose).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 2 +-
 scripts/lib/devtool/standard.py | 7 +++++++
 scripts/recipetool              | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 5a06c78..9ec1ef6 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -85,6 +85,6 @@ def setup_tinfoil():
     import bb.tinfoil
     tinfoil = bb.tinfoil.Tinfoil()
     tinfoil.prepare(False)
-    tinfoil.logger.setLevel(logging.WARNING)
+    tinfoil.logger.setLevel(logger.getEffectiveLevel())
     return tinfoil
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 61c0df9..122121a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -245,6 +245,11 @@ def _extract_source(srctree, keep_temp, devbranch, d):
     bb.utils.mkdirhier(srctree)
     os.rmdir(srctree)
 
+    # We don't want notes to be printed, they are too verbose
+    origlevel = bb.logger.getEffectiveLevel()
+    if logger.getEffectiveLevel() > logging.DEBUG:
+        bb.logger.setLevel(logging.WARNING)
+
     initial_rev = None
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -349,6 +354,8 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         shutil.move(srcsubdir, srctree)
         logger.info('Source tree extracted to %s' % srctree)
     finally:
+        bb.logger.setLevel(origlevel)
+
         if keep_temp:
             logger.info('Preserving temporary directory %s' % tempdir)
         else:
diff --git a/scripts/recipetool b/scripts/recipetool
index 2cfa763..b7d3ee8 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -40,7 +40,7 @@ def tinfoil_init():
     for plugin in plugins:
         if hasattr(plugin, 'tinfoil_init'):
             plugin.tinfoil_init(tinfoil)
-    tinfoil.logger.setLevel(logging.WARNING)
+    tinfoil.logger.setLevel(logger.getEffectiveLevel())
 
 def main():
 
-- 
2.1.0


