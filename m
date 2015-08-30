Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D096F76E8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 30 Aug 2015 09:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="634985298"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Aug 2015 09:08:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 52E426A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:40 +0300
Message-Id: <0030e9eacbc537bbe90fb6e76e25431e23e9cc4a.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/11] devtool: build-image: generate notification callback
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

Added notification callback to <image>.bbapend to notify
user that image is modified by build-image plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 341ab28..d246fad 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -55,6 +55,15 @@ def build_image(args, config, basepath, workspace):
         with open(appendfile, 'w') as afile:
             afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(recipes))
 
+            # Generate notification callback devtool_warn_image_extended
+            afile.write('do_rootfs[prefuncs] += "devtool_warn_image_extended"\n\n')
+            afile.write("python devtool_warn_image_extended() {\n")
+            afile.write("    bb.plain('NOTE: %%s: building with additional '\n"
+                        "             'packages due to \"devtool build-image\"'"
+                        "              %% d.getVar('PN', True))\n"
+                        "    bb.plain('NOTE: delete %%s to clear this' %% \\\n"
+                        "             '%s')\n" % os.path.relpath(appendfile, basepath))
+            afile.write("}\n")
     try:
         exec_build_env_command(config.init_path, basepath,
                                'bitbake %s' % image, watch=True)
-- 
2.1.4


