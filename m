Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD6AD758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:18:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Oct 2015 09:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,712,1437462000"; d="scan'208";a="668898382"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 21 Oct 2015 09:18:13 -0700
Received: from localhost.localdomain (lbworker-161.fi.intel.com
	[10.237.71.161])
	by linux.intel.com (Postfix) with ESMTP id CDA726A4083;
	Wed, 21 Oct 2015 09:17:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 16:18:08 +0000
Message-Id: <1445444288-8237-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] rootfs.py: add more info to the warning message
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
X-List-Received-Date: Wed, 21 Oct 2015 16:18:15 -0000

Since the log_check_regex can potentially be false positive it
makes sense to print the whole line where error is found.
This way user will be able to see the error and understand
if it's valid or not.

[YOCTO: #7789]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4e81263..f7daf32 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -66,6 +66,7 @@ class Rootfs(object):
                 m = r.search(line)
                 if m:
                     found_error = 1
+                    bb.warn('[log_check] In line: [%s]' % line)
                     bb.warn('[log_check] %s: found an error message in the logfile (keyword \'%s\'):\n[log_check] %s'
 				    % (self.d.getVar('PN', True), m.group(), line))
 
-- 
2.1.4


