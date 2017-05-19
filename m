Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1532970018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 23:18:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 19 May 2017 16:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,366,1491289200"; d="scan'208";a="103198057"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.118.116])
	by orsmga005.jf.intel.com with ESMTP; 19 May 2017 16:18:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 19 May 2017 16:18:46 -0700
Message-Id: <1495235926-12707-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] devtool/standard.py: Enable perf to be buildable
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
X-List-Received-Date: Fri, 19 May 2017 23:18:52 -0000

Perf is a tool build from the kernel source, which is normally available
in /work-shared/..., but when devtool is used to modify the kernel
source code, perf is not buildable since it gets an error about being unable
to add a depends to a non-exisit task do_patch.

This patch removes do_patch from the SRCTREECOVEREDTASKS and creates an empty
do_patch task to enable the VarFlags code to have someplace to attach depends
information to.

[YOCT #11120]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5ff1e23..2ecef99 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -842,7 +842,10 @@ def modify(args, config, basepath, workspace):
 
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
+                        'do_fetch do_unpack do_kernel_configme do_kernel_configcheck"\n')
+                f.write('\ndo_patch() {\n'
+                        '    :\n'
+                        '}\n')
                 f.write('\ndo_configure_append() {\n'
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
-- 
2.7.4


