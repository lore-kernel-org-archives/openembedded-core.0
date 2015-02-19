Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BC49B7363C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425673"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:40:03 +0000
Message-Id: <4abee3356266c8ff8a284d43997ed991322c3753.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/15] devtool: support source extraction for recipes that use a shared workdir
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:35 -0000

Enable source extraction used by devtool extract / devtool modify -x for
recipes that use a shared workdir (e.g. the kernel and gcc).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4cb03f3..bf18aae 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -137,10 +137,6 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
         return None
 
-    if 'work-shared' in d.getVar('S', True):
-        logger.error("The %s recipe uses a shared workdir which this tool does not currently support" % pn)
-        return None
-
     if bb.data.inherits_class('image', d):
         logger.error("The %s recipe is an image, and therefore is not supported by this tool" % pn)
         return None
@@ -169,6 +165,16 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         workdir = os.path.join(tempdir, 'workdir')
         crd.setVar('WORKDIR', workdir)
         crd.setVar('T', os.path.join(tempdir, 'temp'))
+        if not crd.getVar('S', True).startswith(workdir):
+            # Usually a shared workdir recipe (kernel, gcc)
+            # Try to set a reasonable default
+            if bb.data.inherits_class('kernel', d):
+                crd.setVar('S', '${WORKDIR}/source')
+            else:
+                crd.setVar('S', '${WORKDIR}/${BP}')
+        if bb.data.inherits_class('kernel', d):
+            # We don't want to move the source to STAGING_KERNEL_DIR here
+            crd.setVar('STAGING_KERNEL_DIR', '${S}')
 
         # FIXME: This is very awkward. Unfortunately it's not currently easy to properly
         # execute tasks outside of bitbake itself, until then this has to suffice if we
@@ -204,7 +210,10 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             else:
                 os.rmdir(patchdir)
 
-        if not bb.data.inherits_class('kernel-yocto', d):
+        if bb.data.inherits_class('kernel-yocto', d):
+            (stdout, _) = bb.process.run('git --git-dir="%s" rev-parse HEAD' % crd.expand('${WORKDIR}/git'), cwd=srcsubdir)
+            initial_rev = stdout.rstrip()
+        else:
             if not os.listdir(srcsubdir):
                 logger.error("no source unpacked to S, perhaps the %s recipe doesn't use any source?" % pn)
                 return None
-- 
1.9.3


