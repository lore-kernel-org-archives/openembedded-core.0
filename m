Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB1F476EA4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 09:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="551378961"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Aug 2015 09:09:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 7496C6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:41 +0300
Message-Id: <209422a2650f437664a86c1c582df33f42f1975e.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/11] devtool: build-image: add extra logging
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
X-List-Received-Date: Sun, 30 Aug 2015 16:09:00 -0000

Added logger calls to show if image is modified by the
plugin or not.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index d246fad..563563b 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -64,6 +64,12 @@ def build_image(args, config, basepath, workspace):
                         "    bb.plain('NOTE: delete %%s to clear this' %% \\\n"
                         "             '%s')\n" % os.path.relpath(appendfile, basepath))
             afile.write("}\n")
+
+            logger.info('Building image %s with the following '
+                        'additional packages: %s', image, ' '.join(recipes))
+    else:
+        logger.warning('No recipes in workspace, building image %s unmodified', image)
+
     try:
         exec_build_env_command(config.init_path, basepath,
                                'bitbake %s' % image, watch=True)
-- 
2.1.4


