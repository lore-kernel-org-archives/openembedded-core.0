Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 56517700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:51:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 16 Mar 2016 08:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,345,1455004800"; d="scan'208";a="765377747"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2016 08:50:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2016 17:50:57 +0200
Message-Id: <1458143457-5455-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] devtool: change config symlink name to .config.new
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
X-List-Received-Date: Wed, 16 Mar 2016 15:51:13 -0000

Otherwise (if the symlink is named .config) kernel build considers
source tree as dirty and fails.

[YOCTO #9270]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b344001..7600a8f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -783,7 +783,7 @@ def modify(args, config, basepath, workspace):
                     'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
             f.write('\ndo_configure_append() {\n'
                     '    cp ${B}/.config ${S}/.config.baseline\n'
-                    '    ln -sfT ${B}/.config ${S}/.config\n'
+                    '    ln -sfT ${B}/.config ${S}/.config.new\n'
                     '}\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
@@ -930,7 +930,7 @@ def _create_kconfig_diff(srctree, rd, outfile):
     """Create a kconfig fragment"""
     # Only update config fragment if both config files exist
     orig_config = os.path.join(srctree, '.config.baseline')
-    new_config = os.path.join(srctree, '.config')
+    new_config = os.path.join(srctree, '.config.new')
     if os.path.exists(orig_config) and os.path.exists(new_config):
         cmd = ['diff', '--new-line-format=%L', '--old-line-format=',
                '--unchanged-line-format=', orig_config, new_config]
-- 
2.6.2


