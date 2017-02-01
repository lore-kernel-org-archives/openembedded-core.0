Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 28607771EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 01 Feb 2017 06:11:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="59638371"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 01 Feb 2017 06:11:13 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8B49D6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:13 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:08 +0200
Message-Id: <8a1b61f189e47bacef4cc303e99918302e0ba367.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/18] wic: creator: stop using config manager
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:12 -0000

This is a preparation to removing conf.py and config/wic.conf
from the codebase.

confmgr object is complicated for no reason and almost
useless as all configuration info comes from command line and
bitbake variables. It's used it creator.py to store information
about output directory, logs and some never used functionality
like tmpfs for future use, which doesn't actually happen.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/creator.py | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
index 8f7d150..74db83c 100644
--- a/scripts/lib/wic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -20,10 +20,8 @@ from optparse import OptionParser, SUPPRESS_HELP
 
 from wic import msger
 from wic.utils import errors
-from wic.conf import configmgr
 from wic.plugin import pluginmgr
 
-
 class Creator():
     """${name}: create an image
 
@@ -89,23 +87,6 @@ class Creator():
                 os.makedirs(os.path.dirname(logfile_abs_path))
             msger.set_interactive(False)
             msger.set_logfile(logfile_abs_path)
-            configmgr.create['logfile'] = options.logfile
-
-        if options.config:
-            configmgr.reset()
-            configmgr._siteconf = options.config
-
-        if options.outdir is not None:
-            configmgr.create['outdir'] = abspath(options.outdir)
-
-        cdir = 'outdir'
-        if os.path.exists(configmgr.create[cdir]) \
-           and not os.path.isdir(configmgr.create[cdir]):
-            msger.error('Invalid directory specified: %s' \
-                        % configmgr.create[cdir])
-
-        if options.enabletmpfs:
-            configmgr.create['enabletmpfs'] = options.enabletmpfs
 
     def main(self, argv=None):
         if argv is None:
-- 
2.1.4


