Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 84B4F6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 08:12:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2015 01:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,536,1422950400"; d="scan'208";a="477589289"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2015 01:12:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 650126A408F;
	Tue,  7 Apr 2015 01:11:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 11:12:08 +0300
Message-Id: <1428394328-16646-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: don't use host paths when looking for native tools
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
X-List-Received-Date: Tue, 07 Apr 2015 08:12:12 -0000

exec_native_cmd should not use host paths in $PATH to
avoid finding and using host tools.

[YOCTO: #6204]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index ea9b6e8..5facbe0 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -81,7 +81,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
     Always need to execute native commands as_shell
     """
     native_paths = \
-        "export PATH=%s/sbin:%s/usr/sbin:%s/usr/bin:$PATH" % \
+        "export PATH=%s/sbin:%s/usr/sbin:%s/usr/bin" % \
         (native_sysroot, native_sysroot, native_sysroot)
     native_cmd_and_args = "%s;%s" % (native_paths, cmd_and_args)
     msger.debug("exec_native_cmd: %s" % cmd_and_args)
-- 
2.1.4


