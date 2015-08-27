Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C852973217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:49:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 04:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="549519146"
Received: from njackson-mobl1.amr.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.25.89])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2015 04:49:53 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 14:49:48 +0300
Message-Id: <1440676190-2167-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/3] devtool: make required tasks be run in kernel build
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
X-List-Received-Date: Thu, 27 Aug 2015 11:49:55 -0000

Set SRCTREECOVEREDTASKS appropriately in the workspace .bbappend file
for kernel recipes. This tries to ensure that all needed tasks (esp.
configure and patch) are run when building the kernel - tasks which
would normally be disabled by externalsrc.bbclass.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e1c5584..00d0b2c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -500,6 +500,8 @@ def modify(args, config, basepath, workspace):
         if b_is_s:
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
 
+        if bb.data.inherits_class('kernel', rd):
+            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_shared_workdir do_fetch do_unpack"\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
-- 
2.1.4


