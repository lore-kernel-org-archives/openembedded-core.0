Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B96AB73286
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 19:24:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2016 11:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,534,1444719600"; d="scan'208";a="885911541"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 11:24:42 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 11:24:26 -0800
Message-Id: <6c9f55dc886674da4cf621d292f5ff12d3100dc5.1452194521.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <4faa88e5336bdd693906b65f00df34826e73b056.1452194521.git.randy.e.witt@linux.intel.com>
References: <4faa88e5336bdd693906b65f00df34826e73b056.1452194521.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1452194521.git.randy.e.witt@linux.intel.com>
References: <cover.1452194521.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/3] copy_buildsystem.py: Allow substring matches for excluded_targets
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
X-List-Received-Date: Thu, 07 Jan 2016 19:24:43 -0000

This is so that the excluded_targets passed to prune_lockedsigs can
take a partial form such as nativesdk to filter based on partial matches.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 15af4eb..83ab8c5 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -83,8 +83,11 @@ def prune_lockedsigs(allowed_tasks, excluded_targets, lockedsigs, pruned_output)
             for line in infile:
                 if invalue:
                     if line.endswith('\\\n'):
-                        splitval = line.strip().split(':')
-                        if splitval[1] in allowed_tasks and not splitval[0] in excluded_targets:
+                        target, task = line.strip().split(':')[:2]
+                        badmatch = ([x for x in excluded_targets
+                                     if x in target])
+
+                        if task in allowed_tasks and not badmatch:
                             f.write(line)
                     else:
                         f.write(line)
-- 
2.5.0


