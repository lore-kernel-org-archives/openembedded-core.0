Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id AB34B731CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 23:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EFFDE2E18A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id KyjuVTgBSs8w
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id C14052E181
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A56DD1229
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 83F871220
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7FB3B3E3C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tBINs3Bi017927
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tBINs3Pr017926
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Dec 2015 00:54:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 00:53:47 +0100
Message-Id: <b512119968d8b67fa8859b72fd5b7ec25e213bf8.1450482563.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
Subject: [PATCHv2 1/6] useradd-staticids.bbclass: Treat mutually exclusive options as such
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
X-List-Received-Date: Fri, 18 Dec 2015 23:54:07 -0000

The useradd options --create-home/--no-create-home and
--user-group/--no-user-group are mutually exclusive and should be
treated as such.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 924d6ea..9d59aca 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -37,21 +37,21 @@ def update_useradd_static_config(d):
         parser.add_argument("-k", "--skel", metavar="SKEL_DIR", help="use this alternative skeleton directory")
         parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
         parser.add_argument("-l", "--no-log-init", help="do not add the user to the lastlog and faillog databases", action="store_true")
-        parser.add_argument("-m", "--create-home", help="create the user's home directory", action="store_true")
-        parser.add_argument("-M", "--no-create-home", help="do not create the user's home directory", action="store_true")
-        parser.add_argument("-N", "--no-user-group", help="do not create a group with the same name as the user", action="store_true")
+        parser.add_argument("-m", "--create-home", help="create the user's home directory", action="store_const", const=True)
+        parser.add_argument("-M", "--no-create-home", dest="create_home", help="do not create the user's home directory", action="store_const", const=False)
+        parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
         parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
         parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
         parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
         parser.add_argument("-r", "--system", help="create a system account", action="store_true")
         parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
         parser.add_argument("-u", "--uid", metavar="UID", help="user ID of the new account")
-        parser.add_argument("-U", "--user-group", help="create a group with the same name as the user", action="store_true")
+        parser.add_argument("-U", "--user-group", help="create a group with the same name as the user", action="store_const", const=True)
         parser.add_argument("LOGIN", help="Login name of the new user")
 
         # Return a list of configuration files based on either the default
         # files/passwd or the contents of USERADD_UID_TABLES
-        # paths are resulved via BBPATH
+        # paths are resolved via BBPATH
         def get_passwd_list(d):
             str = ""
             bbpath = d.getVar('BBPATH', True)
@@ -106,7 +106,8 @@ def update_useradd_static_config(d):
                             # So if the implicit username-group creation is on, then the implicit groupname (LOGIN)
                             # is used, and we disable the user_group option.
                             #
-                            uaargs.groupname = [uaargs.gid, uaargs.LOGIN][not uaargs.gid or uaargs.user_group]
+                            user_group = uaargs.user_group is None or uaargs.user_group is True
+                            uaargs.groupname = [uaargs.gid, uaargs.LOGIN][not uaargs.gid or user_group]
                             uaargs.groupid = [uaargs.gid, uaargs.groupname][not uaargs.gid]
                             uaargs.groupid = [field[3], uaargs.groupid][not field[3]]
 
@@ -120,7 +121,7 @@ def update_useradd_static_config(d):
                                     # We don't have a number, so we have to add a name
                                     bb.debug(1, "Adding group %s!" % (uaargs.groupname))
                                     uaargs.gid = uaargs.groupid
-                                    uaargs.user_group = False
+                                    uaargs.user_group = None
                                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
                                     newgroup = "%s %s" % (['', ' --system'][uaargs.system], uaargs.groupname)
                                     if groupadd:
@@ -131,7 +132,7 @@ def update_useradd_static_config(d):
                                     # We have a group name and a group number to assign it to
                                     bb.debug(1, "Adding group %s  gid (%s)!" % (uaargs.groupname, uaargs.groupid))
                                     uaargs.gid = uaargs.groupid
-                                    uaargs.user_group = False
+                                    uaargs.user_group = None
                                     groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
                                     newgroup = "-g %s %s" % (uaargs.gid, uaargs.groupname)
                                     if groupadd:
@@ -161,16 +162,16 @@ def update_useradd_static_config(d):
             newparam += ['', ' --skel %s' % uaargs.skel][uaargs.skel != None]
             newparam += ['', ' --key %s' % uaargs.key][uaargs.key != None]
             newparam += ['', ' --no-log-init'][uaargs.no_log_init]
-            newparam += ['', ' --create-home'][uaargs.create_home]
-            newparam += ['', ' --no-create-home'][uaargs.no_create_home]
-            newparam += ['', ' --no-user-group'][uaargs.no_user_group]
+            newparam += ['', ' --create-home'][uaargs.create_home is True]
+            newparam += ['', ' --no-create-home'][uaargs.create_home is False]
+            newparam += ['', ' --no-user-group'][uaargs.user_group is False]
             newparam += ['', ' --non-unique'][uaargs.non_unique]
             newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
             newparam += ['', ' --root %s' % uaargs.root][uaargs.root != None]
             newparam += ['', ' --system'][uaargs.system]
             newparam += ['', ' --shell %s' % uaargs.shell][uaargs.shell != None]
             newparam += ['', ' --uid %s' % uaargs.uid][uaargs.uid != None]
-            newparam += ['', ' --user-group'][uaargs.user_group]
+            newparam += ['', ' --user-group'][uaargs.user_group is True]
             newparam += ' %s' % uaargs.LOGIN
 
             newparams.append(newparam)
@@ -192,7 +193,7 @@ def update_useradd_static_config(d):
 
         # Return a list of configuration files based on either the default
         # files/group or the contents of USERADD_GID_TABLES
-        # paths are resulved via BBPATH
+        # paths are resolved via BBPATH
         def get_group_list(d):
             str = ""
             bbpath = d.getVar('BBPATH', True)
-- 
2.1.0


