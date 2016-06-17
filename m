Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 46989731D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B9FAA2E1FE;
	Fri, 17 Jun 2016 15:41:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iwmuZgNTPTOb; Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id D91282E2CA;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C16B41BA8;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id B6AC91B88;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B4E68772;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HDfIeY001948;
	Fri, 17 Jun 2016 15:41:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HDfIRT001947;
	Fri, 17 Jun 2016 15:41:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:41:04 +0200
Message-Id: <0c0de36e5185adaa4100bc47d4e8d2e476a9fb3d.1466170741.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
In-Reply-To: <cover.1466170741.git.pkj@axis.com>
References: <cover.1466170741.git.pkj@axis.com>
Subject: [PATCH 2/4] useradd-staticids.bbclass: Restore failure on missing UIDs/GIDs
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
X-List-Received-Date: Fri, 17 Jun 2016 13:41:21 -0000

A regression was introduced with commit 3149319a whereby setting
USERADD_ERROR_DYNAMIC no longer resulted in an error for users and
groups that were missing numeric UIDs and GIDs but were not mentioned
at all in any passwd or groups file.

[YOCTO #9777]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index d963f28..90835cf 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -50,6 +50,11 @@ def update_useradd_static_config(d):
 
         return id_table
 
+    def handle_missing_id(id, type, pkg):
+        if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1':
+            #bb.error("Skipping recipe %s, package %s which adds %sname %s does not have a static ID defined." % (d.getVar('PN', True),  pkg, type, id))
+            raise bb.build.FuncFailed("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN', True), pkg, type, id))
+
     # We parse and rewrite the useradd components
     def rewrite_useradd(params):
         # The following comes from --help on useradd from shadow
@@ -116,6 +121,8 @@ def update_useradd_static_config(d):
                 users = merge_files(get_passwd_list(d), 7)
 
             if uaargs.LOGIN not in users:
+                if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
+                    handle_missing_id(uaargs.LOGIN, 'user', pkg)
                 continue
 
             field = users[uaargs.LOGIN]
@@ -165,9 +172,8 @@ def update_useradd_static_config(d):
             uaargs.shell = field[6] or uaargs.shell
 
             # Should be an error if a specific option is set...
-            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not ((uaargs.uid and uaargs.uid.isdigit()) and uaargs.gid):
-                #bb.error("Skipping recipe %s, package %s which adds username %s does not have a static uid defined." % (d.getVar('PN', True),  pkg, uaargs.LOGIN))
-                raise bb.build.FuncFailed("%s - %s: Username %s does not have a static uid defined." % (d.getVar('PN', True), pkg, uaargs.LOGIN))
+            if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
+                 handle_missing_id(uaargs.LOGIN, 'user', pkg)
 
             # Reconstruct the args...
             newparam  = ['', ' --defaults'][uaargs.defaults]
@@ -248,6 +254,8 @@ def update_useradd_static_config(d):
                 groups = merge_files(get_group_list(d), 4)
 
             if gaargs.GROUP not in groups:
+                if not gaargs.gid or not gaargs.gid.isdigit():
+                    handle_missing_id(gaargs.GROUP, 'group', pkg)
                 continue
 
             field = groups[gaargs.GROUP]
@@ -257,9 +265,8 @@ def update_useradd_static_config(d):
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
2.9.0


