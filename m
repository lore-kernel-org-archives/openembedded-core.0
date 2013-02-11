Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U4w6B-0004fI-Gg
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:19:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2013 08:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="261103228"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 11 Feb 2013 08:03:18 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 18:04:10 +0200
Message-Id: <1360598651-13765-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 1/2] multilib.bbclass: save multilib variables before executing the gcc-cross-canadian statements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 16:19:19 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/multilib.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f1696b6..a999b69 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -15,6 +15,12 @@ python multilib_virtclass_handler () {
     if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data):
         raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
 
+    save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
+    for name in save_var_name.split():
+        val=e.data.getVar(name, True)
+        if val:
+            e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
+
     if bb.data.inherits_class('image', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
@@ -36,11 +42,6 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
         raise bb.parse.SkipPackage("Don't extend allarch recipes which are not packagegroups")
 
-    save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
-    for name in save_var_name.split():
-        val=e.data.getVar(name, True)
-        if val:
-            e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
 
     # Expand this since this won't work correctly once we set a multilib into place
     e.data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", e.data.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True))
-- 
1.7.11.7



