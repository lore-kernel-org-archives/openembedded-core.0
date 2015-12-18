Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 069ED73198
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:17:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2015 04:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="843983637"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 04:17:58 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id AC6816A4007;
	Fri, 18 Dec 2015 05:05:59 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 13:46:31 +0200
Message-Id: <1450439191-13123-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] devtool: use cp instead of shutil.copytree
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
X-List-Received-Date: Fri, 18 Dec 2015 12:18:01 -0000

Copied layers with 'cp -a' instead of calling shutil.copytree as
copytree fails to copy broken symlinks.

More pythonic fix would be to use copytree with 'ignore' parameter,
but this could slow down copying complex directory structures.

[YOCTO #8825]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 85c0fb1..906038e 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -132,7 +132,10 @@ def sdk_update(args, config, basepath, workspace):
         new_layers_dir = os.path.join(args.updateserver, 'layers')
         old_layers_dir = os.path.join(basepath, 'layers')
         shutil.rmtree(old_layers_dir)
-        shutil.copytree(new_layers_dir, old_layers_dir)
+        ret = subprocess.call("cp -a %s %s" % (new_layers_dir, old_layers_dir), shell=True)
+        if ret != 0:
+            logger.error("Copying %s to %s failed" % (new_layers_dir, old_layers_dir))
+            return ret
     else:
         # devtool sdk-update http://myhost/sdk
         tmpsdk_dir = '/tmp/sdk-ext'
-- 
2.1.4


