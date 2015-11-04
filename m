Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5D67770A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 00:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 41B16181A5;
	Wed,  4 Nov 2015 01:06:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ML8RdMrhtNn6; Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 53DEF181A7;
	Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 395E9159;
	Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 24407154;
	Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 21E7534263;
	Wed,  4 Nov 2015 01:06:18 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tA406IRB009232;
	Wed, 4 Nov 2015 01:06:18 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tA406IEY009231;
	Wed, 4 Nov 2015 01:06:18 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 01:06:08 +0100
Message-Id: <e9dcd4024c4e872a98f9aaa91689026c83ee3234.1446595453.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446595453.git.pkj@axis.com>
References: <cover.1446595453.git.pkj@axis.com>
In-Reply-To: <cover.1446595453.git.pkj@axis.com>
References: <cover.1446595453.git.pkj@axis.com>
Subject: [PATCH 4/5] useradd-staticids.bbclass: Simplify the logic for when to add groups
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
X-List-Received-Date: Wed, 04 Nov 2015 00:06:24 -0000

The original code was near impossible to follow, and missed a couple
of cases. For example, if one added the following line to the passwd
file specified in USERADD_UID_TABLES:

foobar:x:12345:nogroup::/:/bin/sh

and then specified the user as:

USERADD_PARAM_${PN} = "--system foobar"

one would then assume that the foobar user would be created with the
primary group set to nogroup. However, it was not (the primary group
would be foobar), and the only way to get it correct was to explicitly
add --gid nogroup to the USERADD_PARAM_${PN}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 36 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 0e855e9..df4902e 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -110,30 +110,26 @@ def update_useradd_static_config(d):
                             uaargs.groupname = uaargs.LOGIN if user_group else uaargs.gid
                             uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname
 
-                            if not uaargs.gid or uaargs.gid != uaargs.groupid:
-                                if (uaargs.groupid and uaargs.groupid.isdigit()) and (uaargs.groupname and uaargs.groupname.isdigit()) and (uaargs.groupid != uaargs.groupname):
+                            if uaargs.groupid and uaargs.gid != uaargs.groupid:
+                                newgroup = None
+                                if not uaargs.groupid.isdigit():
+                                    # We don't have a group number, so we have to add a name
+                                    bb.debug(1, "Adding group %s!" % uaargs.groupid)
+                                    newgroup = "%s %s" % (' --system' if uaargs.system else '', uaargs.groupid)
+                                elif uaargs.groupname and not uaargs.groupname.isdigit():
+                                    # We have a group name and a group number to assign it to
+                                    bb.debug(1, "Adding group %s (gid %s)!" % (uaargs.groupname, uaargs.groupid))
+                                    newgroup = "-g %s %s" % (uaargs.groupid, uaargs.groupname)
+                                else:
                                     # We want to add a group, but we don't know it's name... so we can't add the group...
                                     # We have to assume the group has previously been added or we'll fail on the adduser...
                                     # Note: specifying the actual gid is very rare in OE, usually the group name is specified.
-                                    bb.warn("%s: Changing gid for login %s from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupname, uaargs.gid))
-                                elif (uaargs.groupid and not uaargs.groupid.isdigit()) and uaargs.groupid == uaargs.groupname:
-                                    # We don't have a number, so we have to add a name
-                                    bb.debug(1, "Adding group %s!" % (uaargs.groupname))
-                                    uaargs.gid = uaargs.groupid
-                                    uaargs.user_group = None
-                                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
-                                    newgroup = "%s %s" % (' --system' if uaargs.system else '', uaargs.groupname)
-                                    if groupadd:
-                                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
-                                    else:
-                                        d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
-                                elif uaargs.groupname and (uaargs.groupid and uaargs.groupid.isdigit()):
-                                    # We have a group name and a group number to assign it to
-                                    bb.debug(1, "Adding group %s  gid (%s)!" % (uaargs.groupname, uaargs.groupid))
-                                    uaargs.gid = uaargs.groupid
-                                    uaargs.user_group = None
+                                    bb.warn("%s: Changing gid for login %s to %s, verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupid))
+
+                                uaargs.gid = uaargs.groupid
+                                uaargs.user_group = None
+                                if newgroup:
                                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
-                                    newgroup = "-g %s %s" % (uaargs.gid, uaargs.groupname)
                                     if groupadd:
                                         d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
                                     else:
-- 
2.1.0


