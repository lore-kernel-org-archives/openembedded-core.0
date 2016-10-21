Return-Path: <mikko.ylinen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BDBA671AE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 07:05:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 21 Oct 2016 00:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="22088681"
Received: from summit.tm.intel.com ([10.237.55.19])
	by orsmga005.jf.intel.com with ESMTP; 21 Oct 2016 00:05:25 -0700
From: Mikko Ylinen <mikko.ylinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 10:05:45 +0300
Message-Id: <20161021070545.19812-1-mikko.ylinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] useradd-staticids.bbclass: catch missing uid/gid exceptions
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
X-List-Received-Date: Fri, 21 Oct 2016 07:05:26 -0000

The change to get rid of FuncFailed exceptions changed the behavior
of how missing uid/gid error are be handled. Instead of catching
the exception and handling that via bb.parse.SkipPackage(), a fatal
error was called.

This won't work with recipes that are unused and therefore do not have
UID/GIDs defined. The problem triggers when parsing all recipes (e.g.,
oe-selftest runs bitbake -p).

The right way to handle this is to raise bb.parse.SkipPackage(). This
will error correctly once the recipe is needed.

Signed-off-by: Mikko Ylinen <mikko.ylinen@intel.com>
---
 meta/classes/useradd-staticids.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index afb580a..4162774 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -53,8 +53,7 @@ def update_useradd_static_config(d):
     def handle_missing_id(id, type, pkg):
         # For backwards compatibility we accept "1" in addition to "error"
         if d.getVar('USERADD_ERROR_DYNAMIC', True) == 'error' or d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
-            #bb.error("Skipping recipe %s, package %s which adds %sname %s does not have a static ID defined." % (d.getVar('PN', True),  pkg, type, id))
-            bb.fatal("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
+            raise NotImplementedError("%s - %s: %sname %s does not have a static ID defined. Skipping it." % (d.getVar('PN', True), pkg, type, id))
         elif d.getVar('USERADD_ERROR_DYNAMIC', True) == 'warn':
             bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
 
@@ -323,7 +322,7 @@ python __anonymous() {
         and not bb.data.inherits_class('native', d):
         try:
             update_useradd_static_config(d)
-        except bb.build.FuncFailed as f:
+        except NotImplementedError as f:
             bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN', True), f))
             raise bb.parse.SkipPackage(f)
 }
-- 
2.9.3

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


