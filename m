Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F83077087
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 19:36:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2016 11:36:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,530,1449561600"; d="scan'208";a="899663918"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2016 11:36:32 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 11:23:24 -0800
Message-Id: <1456946605-29739-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH 1/2] sdk.py: Fix undefined variable
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
X-List-Received-Date: Wed, 02 Mar 2016 19:36:33 -0000

"sdk_update" uses a variable newsdk_path, which was never declared.
This would cause the command:

    devtool sdk-update <poky-sdk-latest>

to fail with an error:
NameError: global name 'newsdk_path' is not defined

The remedy is to declare newsdk_path as it was no doubt intended,
corresponding to the argument specifying <poky-sdk-latest>.

[YOCTO#9042]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/lib/devtool/sdk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index fbf2e79..22c5279 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -133,6 +133,7 @@ def sdk_update(args, config, basepath, workspace):
             logger.debug("Found conf/locked-sigs.inc in %s" % updateserver)
         update_dict = generate_update_dict(new_locked_sig_file_path, old_locked_sig_file_path)
         logger.debug("update_dict = %s" % update_dict)
+        newsdk_path = updateserver
         sstate_dir = os.path.join(newsdk_path, 'sstate-cache')
         if not os.path.exists(sstate_dir):
             logger.error("sstate-cache directory not found under %s" % newsdk_path)
-- 
1.9.1


