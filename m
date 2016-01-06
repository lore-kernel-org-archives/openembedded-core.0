Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 15ECD731EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:15:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jan 2016 14:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,530,1444719600"; d="scan'208";a="854932597"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2016 14:15:57 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 14:15:49 -0800
Message-Id: <ba0f9159197a8f0af61c637a5f4fdf024a2dbab0.1452118391.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452118391.git.randy.e.witt@linux.intel.com>
References: <cover.1452118391.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/2] copy_buildsystem.py: Allow substring matches for excluded_targets
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
X-List-Received-Date: Wed, 06 Jan 2016 22:15:56 -0000

This is so that the excluded_targets passed to prune_lockedsigs can
take a partial form such as nativesdk to filter based on partial matches.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 15af4eb..9d8f3a6 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -83,8 +83,11 @@ def prune_lockedsigs(allowed_tasks, excluded_targets, lockedsigs, pruned_output)
             for line in infile:
                 if invalue:
                     if line.endswith('\\\n'):
-                        splitval = line.strip().split(':')
-                        if splitval[1] in allowed_tasks and not splitval[0] in excluded_targets:
+                        target, task = line.strip().split(':')[:2]
+                        badmatch = ([x for x in excluded_targets.split()
+                                     if x in target])
+
+                        if task in allowed_tasks and not badmatch:
                             f.write(line)
                     else:
                         f.write(line)
-- 
2.5.0


