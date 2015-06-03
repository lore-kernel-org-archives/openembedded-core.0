Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB72757A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:50:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2015 07:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,547,1427785200"; d="scan'208";a="704663524"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2015 07:50:47 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 17:50:32 +0300
Message-Id: <1433343032-4559-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433343032-4559-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 7/7] devtool: modify: make bitbake use local files from srctree
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
X-List-Received-Date: Wed, 03 Jun 2015 14:50:59 -0000

This change makes it possible to have local files (non-remote SRC_URI
files, i.e. files that are located in the "recipe space") under the
srctree even if S!=WORKDIR. The files must be placed under the
'local-files' subdirectory.

Complements the previous patch that imports local files into srctree.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 44948fd..5d2a264 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -501,8 +501,13 @@ def modify(args, config, basepath, workspace):
         appendname = re.sub(r'_.*', '_%', appendname)
     appendfile = os.path.join(appendpath, appendname + '.bbappend')
     with open(appendfile, 'w') as f:
-        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
-        f.write('inherit externalsrc\n')
+        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
+        # Local files can be modified/tracked in separate subdir under srctree
+        # Mostly useful for packages with S != WORKDIR
+        f.write('FILESPATH_prepend := "%s:"\n' %
+                os.path.join(srctree, 'local-files'))
+
+        f.write('\ninherit externalsrc\n')
         f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
         f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
 
-- 
2.1.4


