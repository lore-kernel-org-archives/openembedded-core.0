Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdC-0007sb-UR
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:39 +0200
Received: by rex (Postfix, from userid 1000)
	id 46F47208C7; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:09 +0100
Message-Id: <bad4a41dd4824f4a158bcfc4e453cb0600d851d4.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/8] lib/oe/util.py: Add MLPREFIX support to prune_suffix()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 21:57:39 -0000

prune_suffix() also needs be aware of MLPREFIX when changing PN for
use in BPN.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 5a63ed3..b3473d3 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -58,7 +58,12 @@ def prune_suffix(var, suffixes, d):
     # remove it if found
     for suffix in suffixes:
         if var.endswith(suffix):
-            return var.replace(suffix, "")
+            var = var.replace(suffix, "")
+
+    prefix = d.getVar("MLPREFIX", True)
+    if prefix and var.startswith(prefix):
+        var = var.replace(prefix, "")
+
     return var
 
 def str_filter(f, str, d):
-- 
1.7.4.1



