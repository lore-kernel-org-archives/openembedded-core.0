Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5E370034
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 13:54:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Dec 2015 05:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="853118361"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2015 05:54:29 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 15:54:25 +0200
Message-Id: <1449150865-7496-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449150865-7496-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1449150865-7496-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] devtool: extract: update SRCTREECOVEREDTASKS for kernel
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
X-List-Received-Date: Thu, 03 Dec 2015 13:54:43 -0000

Add 'do_kernel_configme' and 'do_kernel_configcheck' to
SRCTREECOVEREDTASKS of kernel packages. These tasks should not be run
because kernel meta in the srctree is not necessarily up-to-date or
even present which causes build failures and/or invalid kernel config.
Especially so because 'do_patch' which is a dependency of
'do_kernel_configme' is not being run.

We now store .config in the srctree and 'do_configure' task is able to
run successfully.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a4f3da4..a5e81f3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -650,7 +650,8 @@ def modify(args, config, basepath, workspace):
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
 
         if bb.data.inherits_class('kernel', rd):
-            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_fetch do_unpack do_patch"\n')
+            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
+                    'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
-- 
2.1.4


