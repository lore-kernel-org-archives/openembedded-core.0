Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D83F872F91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:29:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 07:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="67311367"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 21 Feb 2017 07:29:44 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C4B9B6A4082
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:29:43 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:23:06 +0200
Message-Id: <4a43241cebc0b74f5c0187920b735b58981b64a9.1487690169.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487690169.git.ed.bartosh@linux.intel.com>
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/6] wic: use 2 sysroots to find native executable
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
X-List-Received-Date: Tue, 21 Feb 2017 15:29:44 -0000

Currently there is no way to specify a dependency on native
tools for wic without modifying wic-tools recipe. Obvious
way to make it more flexible is to use image sysroot and
wic-tools together to find an executable.

Modified run_native_cmd to use image and wic-tools sysroots
to find native executable.

[YOCTO #11017]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 4b822f0..3bab2f1 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -105,9 +105,13 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
 
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
+
+    wtools_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
     native_paths = \
-        "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
-        (native_sysroot, native_sysroot, native_sysroot)
+            "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/sbin:%s/usr/sbin:%s/usr/bin" % \
+            (wtools_sysroot, wtools_sysroot, wtools_sysroot,
+             native_sysroot, native_sysroot, native_sysroot)
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                            (native_paths, cmd_and_args)
     logger.debug("exec_native_cmd: %s", cmd_and_args)
-- 
2.1.4


