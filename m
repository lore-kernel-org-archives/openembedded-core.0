Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D0E14782C1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:51:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 09 Jun 2017 06:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="1139632838"
Received: from therfet-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.41.2])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2017 06:51:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 15:50:40 +0200
Message-Id: <84c62c20eb28477836a756fbaa71fb6c2e4d7343.1497016071.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1497016071.git.paul.eggleton@linux.intel.com>
References: <cover.1497016071.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/buildhistory: use BB_CMDLINE to get bitbake command line
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
X-List-Received-Date: Fri, 09 Jun 2017 13:51:13 -0000

We put the bitbake command line in the buildhistory commit message for
informational purposes, but calling sys.argv to get that as we were
previously doesn't really work in memory resident mode - that gives you
the command used to start the bitbake server which is much less
interesting. Use the just-introduced BB_CMDLINE variable instead.

Part of the fix for [YOCTO #11634].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3e907fc..74b837e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -696,11 +696,14 @@ def buildhistory_get_sdkvars(d):
 
 
 def buildhistory_get_cmdline(d):
-    if sys.argv[0].endswith('bin/bitbake'):
-        bincmd = 'bitbake'
-    else:
-        bincmd = sys.argv[0]
-    return '%s %s' % (bincmd, ' '.join(sys.argv[1:]))
+    argv = d.getVar('BB_CMDLINE', False)
+    if argv:
+        if argv[0].endswith('bin/bitbake'):
+            bincmd = 'bitbake'
+        else:
+            bincmd = argv[0]
+        return '%s %s' % (bincmd, ' '.join(argv[1:]))
+    return ''
 
 
 buildhistory_single_commit() {
-- 
2.9.4


