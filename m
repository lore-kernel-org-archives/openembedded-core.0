Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 662506FFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:43:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2016 13:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,337,1455004800"; d="scan'208";a="764036176"
Received: from mtandon-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.55])
	by orsmga003.jf.intel.com with ESMTP; 14 Mar 2016 13:43:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 09:43:06 +1300
Message-Id: <430ff3ee863df8388a8d0d6eda3a1219c9a78533.1457988127.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457988127.git.paul.eggleton@linux.intel.com>
References: <cover.1457988127.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457988127.git.paul.eggleton@linux.intel.com>
References: <cover.1457988127.git.paul.eggleton@linux.intel.com>
Subject: [jethro][PATCH 2/2] devtool: extract: update SRCTREECOVEREDTASKS for kernel
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
X-List-Received-Date: Mon, 14 Mar 2016 20:43:39 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Add 'do_kernel_configme' and 'do_kernel_configcheck' to
SRCTREECOVEREDTASKS of kernel packages. These tasks should not be run
because kernel meta in the srctree is not necessarily up-to-date or
even present which causes build failures and/or invalid kernel config.
Especially so because 'do_patch' which is a dependency of
'do_kernel_configme' is not being run.

We now store .config in the srctree and 'do_configure' task is able to
run successfully.

(From OE-Core master rev: 7ce4c18a4ba1ebcb9f46e652a881ace1f21d2292)

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c1fbfe3..3c4dbb9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -594,7 +594,8 @@ def modify(args, config, basepath, workspace):
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (pn, srctree))
 
         if bb.data.inherits_class('kernel', rd):
-            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_fetch do_unpack do_patch"\n')
+            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
+                    'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
-- 
2.5.0


