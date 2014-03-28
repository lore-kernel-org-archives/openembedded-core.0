Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 03FE46B255
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 21:49:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 14:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,753,1389772800"; d="scan'208";a="482386175"
Received: from unknown (HELO localhost) ([10.255.12.30])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2014 14:49:02 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 16:49:02 -0500
Message-Id: <222d52976466464a3ff184e07c0c884c8f821dbc.1396043171.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1396043171.git.tom.zanussi@linux.intel.com>
References: <cover.1396043171.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] wic: Fix bitbake_env_command for 'None' case
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
X-List-Received-Date: Fri, 28 Mar 2014 21:49:03 -0000

bitbake_env_command will choke if it isn't given an image, make sure
it does the right thing in that case.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 6cf6169..0643780 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -65,7 +65,10 @@ def find_bitbake_env_lines(image_name):
     If image_name is empty, plugins might still be able to use the
     environment, so set it regardless.
     """
-    bitbake_env_cmd = "bitbake -e %s" % image_name
+    if image_name:
+        bitbake_env_cmd = "bitbake -e %s" % image_name
+    else:
+        bitbake_env_cmd = "bitbake -e"
     rc, bitbake_env_lines = exec_cmd(bitbake_env_cmd)
     if rc != 0:
         print "Couldn't get '%s' output." % bitbake_env_cmd
-- 
1.8.3.1


