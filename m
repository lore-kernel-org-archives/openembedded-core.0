Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12A986EC4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:28:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1AJSSsW021115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:28:29 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 11:28:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2014 13:28:25 -0600
Message-ID: <a6359140427ecdc1220eca8c689fd7ea75be1518.1392060196.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392060196.git.mark.hatle@windriver.com>
References: <cover.1392060196.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] useradd-staticids: Fix groupadd when --user-group is selected
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
X-List-Received-Date: Mon, 10 Feb 2014 19:28:28 -0000
Content-Type: text/plain

When --user-group is selected (it's on by default as well) we want
to translate that to a groupname and disable the --user-group.  Before
we just disabled --user-group, but didn't always add the group to the
system.

This change ensures that we add the group (as long as we have enough
information to actually add the group), and we disable --user-group
in that case.  If a static groupid is not specified we continue to
use the groupname, but via an explicit groupadd.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/useradd-staticids.bbclass | 50 ++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 689c29c..5897fed 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -96,27 +96,37 @@ def update_useradd_static_config(d):
                             # is used, and we disable the user_group option.
                             #
                             uaargs.groupname = [uaargs.gid, uaargs.LOGIN][not uaargs.gid or uaargs.user_group]
-                            uaargs.user_group = False
+                            uaargs.groupid = [uaargs.gid, uaargs.groupname][not uaargs.gid]
+                            uaargs.groupid = [field[3], uaargs.groupid][not field[3]]
 
-                            uaargs.gid = [uaargs.gid, uaargs.groupname][not uaargs.gid]
-                            uaargs.gid = [field[3], uaargs.gid][not field[3]]
-
-                            if uaargs.groupname == uaargs.gid:
-                                # Nothing to do...
-                                pass
-                            elif (uaargs.groupname and uaargs.groupname.isdigit()) and (uaargs.gid and uaargs.gid.isdigit()) and (uaargs.groupname != uaargs.gid):
-                                # We want to add a group, but we don't know it's name... so we can't add the group...
-                                # We have to assume the group has previously been added or we'll fail on the adduser...
-                                # Note: specifying the actual gid is very rare in OE, usually the group name is specified.
-                                bb.warn("%s: Changing gid for login %s from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupname, uaargs.gid))
-                            elif uaargs.groupname and (uaargs.gid and uaargs.gid.isdigit()):
-                               bb.debug(1, "Adding group %s  gid (%s)!" % (uaargs.groupname, uaargs.gid))
-                               groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
-                               newgroup = "-g %s %s" % (uaargs.gid, uaargs.groupname)
-                               if groupadd:
-                                   d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
-                               else:
-                                   d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
+                            if not uaargs.gid or uaargs.gid != uaargs.groupid:
+                                if (uaargs.groupid and uaargs.groupid.isdigit()) and (uaargs.groupname and uaargs.groupname.isdigit()) and (uaargs.groupid != uaargs.groupname):
+                                    # We want to add a group, but we don't know it's name... so we can't add the group...
+                                    # We have to assume the group has previously been added or we'll fail on the adduser...
+                                    # Note: specifying the actual gid is very rare in OE, usually the group name is specified.
+                                    bb.warn("%s: Changing gid for login %s from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupname, uaargs.gid))
+                                elif (uaargs.groupid and not uaargs.groupid.isdigit()) and uaargs.groupid == uaargs.groupname:
+                                    # We don't have a number, so we have to add a name
+                                    bb.debug(1, "Adding group %s!" % (uaargs.groupname))
+                                    uaargs.gid = uaargs.groupid
+                                    uaargs.user_group = False
+                                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
+                                    newgroup = "%s %s" % (['', ' --system'][uaargs.system], uaargs.groupname)
+                                    if groupadd:
+                                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
+                                    else:
+                                        d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
+                                elif uaargs.groupname and (uaargs.groupid and uaargs.groupid.isdigit()):
+                                    # We have a group name and a group number to assign it to
+                                    bb.debug(1, "Adding group %s  gid (%s)!" % (uaargs.groupname, uaargs.groupid))
+                                    uaargs.gid = uaargs.groupid
+                                    uaargs.user_group = False
+                                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
+                                    newgroup = "-g %s %s" % (uaargs.gid, uaargs.groupname)
+                                    if groupadd:
+                                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
+                                    else:
+                                        d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
 
                             uaargs.comment = ["'%s'" % field[4], uaargs.comment][not field[4]]
                             uaargs.home_dir = [field[5], uaargs.home_dir][not field[5]]
-- 
1.8.5.3


