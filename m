Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 603DD6FF6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:44:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jan 2016 01:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="866059293"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.8.7])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2016 01:44:12 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 09:43:59 +0000
Message-Id: <1453455839-11281-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] lib/oe/package_manager: prevent testing an undefined variable
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
X-List-Received-Date: Fri, 22 Jan 2016 09:44:13 -0000

This prevents an error in do_populate_sdk when building
buildtools-tarball with ipk as the package manager:

Exception: UnboundLocalError: local variable 'pkg' referenced
before assignment

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6a6e3e9..5b87f45 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -308,6 +308,7 @@ class PkgsList(object):
         output = dict()
         filename = ""
         dep = []
+        pkg = ""
         for line in cmd_output.splitlines():
             line = line.rstrip()
             if ':' in line:
-- 
2.5.0


