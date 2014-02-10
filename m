Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D0D4C6EC73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:28:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1AJST5M027916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:28:30 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 11:28:29 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2014 13:28:26 -0600
Message-ID: <d6db736c28f68632eb05d94f254bcd0ca465a977.1392060196.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392060196.git.mark.hatle@windriver.com>
References: <cover.1392060196.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] useradd-staticids: Adjust USERADD_ERROR_DYNAMIC condition and error message
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
X-List-Received-Date: Mon, 10 Feb 2014 19:28:29 -0000
Content-Type: text/plain

The USERADD_ERROR_DYNAMIC needs to check that both users and groups that are
defined need to be represented as static ids, or an error should occur.

For the user check, we want to make sure the uid is a numeric value.  (The gid
can be name, as the GROUPADD check will validate for a number there -- or
during install useradd will fail if that group is not defined.)

For the group check, we verify that the gid is specified and not left as a name.

Also two statements that can be uncommented for debugging were added so that
future development work on this code would be easier to do.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/useradd-staticids.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 5897fed..3efe2a8 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -134,8 +134,9 @@ def update_useradd_static_config(d):
                             break
 
             # Should be an error if a specific option is set...
-            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and (not uaargs.uid or not uaargs.gid):
-                raise bb.build.FuncFailed("%s - %s: Username %s does not have a static uid/gid defined." % (d.getVar('PN', True), pkg, uaargs.LOGIN))
+            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not ((uaargs.uid and uaargs.uid.isdigit()) and uaargs.gid):
+                #bb.error("Skipping recipe %s, package %s which adds username %s does not have a static uid defined." % (d.getVar('PN', True),  pkg, uaargs.LOGIN))
+                raise bb.build.FuncFailed("%s - %s: Username %s does not have a static uid defined." % (d.getVar('PN', True), pkg, uaargs.LOGIN))
 
             # Reconstruct the args...
             newparam  = ['', ' --defaults'][uaargs.defaults]
@@ -222,7 +223,8 @@ def update_useradd_static_config(d):
                             gaargs.gid = field[2]
                             break
 
-            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not gaargs.gid:
+            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not (gaargs.gid and gaargs.gid.isdigit()):
+                #bb.error("Skipping recipe %s, package %s which adds groupname %s does not have a static gid defined." % (d.getVar('PN', True),  pkg, gaargs.GROUP))
                 raise bb.build.FuncFailed("%s - %s: Groupname %s does not have a static gid defined." % (d.getVar('PN', True), pkg, gaargs.GROUP))
 
             # Reconstruct the args...
-- 
1.8.5.3


