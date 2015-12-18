Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0E957731CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 23:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 093722E18D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1SZ9H965YpDN
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id E34212E18A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C81531220
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id AB4491236
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A8DD03429D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tBINs3F2017935
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tBINs3Xq017934
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Dec 2015 00:54:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 00:53:49 +0100
Message-Id: <66c8467e72013f4ea3c19e6bce3f2b71e70ab055.1450482563.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
Subject: [PATCHv2 3/6] useradd-staticids.bbclass: Simplify some logic
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
X-List-Received-Date: Fri, 18 Dec 2015 23:54:06 -0000

The [<on_true>, <on_false>][not <condition>] construct may solve the
problem of implementing a conditional operator, but it is not very
readable. At least I find this:

    uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname

a lot more readable than this:

    uaargs.groupid = [uaargs.gid, uaargs.groupname][not uaargs.gid]
    uaargs.groupid = [field[3], uaargs.groupid][not field[3]]

Also, the official conditional operator since Python 2.5 (<on_true> if
<condition> else <on_false>) does not evaluate both <on_false> and
<on_true> as [<on_true>, <on_false>][not <condition>] does.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index c2e6579..0e855e9 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -97,7 +97,7 @@ def update_useradd_static_config(d):
                         if field[0] == uaargs.LOGIN:
                             if uaargs.uid and field[2] and (uaargs.uid != field[2]):
                                 bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.uid, field[2]))
-                            uaargs.uid = [field[2], uaargs.uid][not field[2]]
+                            uaargs.uid = field[2] or uaargs.uid
 
                             # Determine the possible groupname
                             # Unless the group name (or gid) is specified, we assume that the LOGIN is the groupname
@@ -107,9 +107,8 @@ def update_useradd_static_config(d):
                             # is used, and we disable the user_group option.
                             #
                             user_group = uaargs.user_group is None or uaargs.user_group is True
-                            uaargs.groupname = [uaargs.LOGIN, uaargs.gid][not user_group]
-                            uaargs.groupid = [uaargs.gid, uaargs.groupname][not uaargs.gid]
-                            uaargs.groupid = [field[3], uaargs.groupid][not field[3]]
+                            uaargs.groupname = uaargs.LOGIN if user_group else uaargs.gid
+                            uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname
 
                             if not uaargs.gid or uaargs.gid != uaargs.groupid:
                                 if (uaargs.groupid and uaargs.groupid.isdigit()) and (uaargs.groupname and uaargs.groupname.isdigit()) and (uaargs.groupid != uaargs.groupname):
@@ -123,7 +122,7 @@ def update_useradd_static_config(d):
                                     uaargs.gid = uaargs.groupid
                                     uaargs.user_group = None
                                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
-                                    newgroup = "%s %s" % (['', ' --system'][uaargs.system], uaargs.groupname)
+                                    newgroup = "%s %s" % (' --system' if uaargs.system else '', uaargs.groupname)
                                     if groupadd:
                                         d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
                                     else:
@@ -140,9 +139,9 @@ def update_useradd_static_config(d):
                                     else:
                                         d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
 
-                            uaargs.comment = ["'%s'" % field[4], uaargs.comment][not field[4]]
-                            uaargs.home_dir = [field[5], uaargs.home_dir][not field[5]]
-                            uaargs.shell = [field[6], uaargs.shell][not field[6]]
+                            uaargs.comment = "'%s'" % field[4] if field[4] else uaargs.comment
+                            uaargs.home_dir = field[5] or uaargs.home_dir
+                            uaargs.shell = field[6] or uaargs.shell
                             break
 
             # Should be an error if a specific option is set...
-- 
2.1.0


