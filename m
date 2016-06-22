Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB586FF25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:35:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 22 Jun 2016 12:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="833370432"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2016 12:35:16 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 12:35:52 -0700
Message-Id: <20160622193552.14761-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160622193552.14761-1-stephano.cetola@linux.intel.com>
References: <20160622193552.14761-1-stephano.cetola@linux.intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] useradd-staticids.bbclass: Restore failure on missing UIDs/GIDs
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
X-List-Received-Date: Wed, 22 Jun 2016 19:35:15 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

A regression was introduced with commit 3149319a whereby setting
USERADD_ERROR_DYNAMIC no longer resulted in an error for users and
groups that were missing numeric UIDs and GIDs but were not mentioned
at all in any passwd or groups file.

[YOCTO #9777]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit adc0f830a695c417b4d282fa580c5231e1f0afbe)
---
 meta/classes/useradd-staticids.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index a9b506d..50a7481 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -46,6 +46,11 @@ def update_useradd_static_config(d):
 
         return id_table
 
+    def handle_missing_id(id, type, pkg):
+        if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
+            #bb.error("Skipping recipe %s, package %s which adds %sname %s does not have a static ID defined." % (d.getVar('PN', True),  pkg, type, id))
+            raise bb.build.FuncFailed("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
+
     # We parse and rewrite the useradd components
     def rewrite_useradd(params):
         # The following comes from --help on useradd from shadow
@@ -112,6 +117,8 @@ def update_useradd_static_config(d):
                 users = merge_files(get_passwd_list(d), 7)
 
             if uaargs.LOGIN not in users:
+                if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
+                    handle_missing_id(uaargs.LOGIN, 'user', pkg)
                 continue
 
             field = users[uaargs.LOGIN]
@@ -161,9 +168,8 @@ def update_useradd_static_config(d):
             uaargs.shell = field[6] or uaargs.shell
 
             # Should be an error if a specific option is set...
-            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not ((uaargs.uid and uaargs.uid.isdigit()) and uaargs.gid):
-                #bb.error("Skipping recipe %s, package %s which adds username %s does not have a static uid defined." % (d.getVar('PN', True),  pkg, uaargs.LOGIN))
-                raise bb.build.FuncFailed("%s - %s: Username %s does not have a static uid defined." % (d.getVar('PN', True), pkg, uaargs.LOGIN))
+            if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
+                 handle_missing_id(uaargs.LOGIN, 'user', pkg)
 
             # Reconstruct the args...
             newparam  = ['', ' --defaults'][uaargs.defaults]
@@ -244,6 +250,8 @@ def update_useradd_static_config(d):
                 groups = merge_files(get_group_list(d), 4)
 
             if gaargs.GROUP not in groups:
+                if not gaargs.gid or not gaargs.gid.isdigit():
+                    handle_missing_id(gaargs.GROUP, 'group', pkg)
                 continue
 
             field = groups[gaargs.GROUP]
@@ -253,9 +261,8 @@ def update_useradd_static_config(d):
                     bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP, gaargs.gid, field[2]))
                 gaargs.gid = field[2]
 
-            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not (gaargs.gid and gaargs.gid.isdigit()):
-                #bb.error("Skipping recipe %s, package %s which adds groupname %s does not have a static gid defined." % (d.getVar('PN', True),  pkg, gaargs.GROUP))
-                raise bb.build.FuncFailed("%s - %s: Groupname %s does not have a static gid defined." % (d.getVar('PN', True), pkg, gaargs.GROUP))
+            if not gaargs.gid or not gaargs.gid.isdigit():
+                handle_missing_id(gaargs.GROUP, 'group', pkg)
 
             # Reconstruct the args...
             newparam  = ['', ' --force'][gaargs.force]
-- 
2.8.3


