Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3033877B14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 09:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CF8B02E552
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XT-K2UqsBhCx
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 94D112E0AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C3B41E06E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7156C1E06A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 65A373088
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v4C9t8aW015674
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 11:55:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v4C9t8oW015673
	for openembedded-core@lists.openembedded.org;
	Fri, 12 May 2017 11:55:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 11:55:07 +0200
Message-Id: <20170512095507.15633-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] useradd: Create lib/oe/useradd function library
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
X-List-Received-Date: Fri, 12 May 2017 09:55:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The code in useradd-staticids is generally useful for user addition
functionality but is not reusable in its current form. Refactor the
code into a set of library functions.
---
 meta/classes/useradd-staticids.bbclass | 71 ++++------------------------------
 meta/lib/oe/useradd.py                 | 68 ++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 64 deletions(-)
 create mode 100644 meta/lib/oe/useradd.py

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 2d282c0d71..1e75ce44e5 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -1,23 +1,10 @@
 # In order to support a deterministic set of 'dynamic' users/groups,
 # we need a function to reformat the params based on a static file
 def update_useradd_static_config(d):
-    import argparse
     import itertools
     import re
     import errno
 
-    class myArgumentParser( argparse.ArgumentParser ):
-        def _print_message(self, message, file=None):
-            bb.warn("%s - %s: %s" % (d.getVar('PN'), pkg, message))
-
-        # This should never be called...
-        def exit(self, status=0, message=None):
-            message = message or ("%s - %s: useradd.bbclass: Argument parsing exited" % (d.getVar('PN'), pkg))
-            error(message)
-
-        def error(self, message):
-            bb.fatal(message)
-
     def list_extend(iterable, length, obj = None):
         """Ensure that iterable is the specified length by extending with obj
         and return it as a list"""
@@ -59,31 +46,7 @@ def update_useradd_static_config(d):
 
     # We parse and rewrite the useradd components
     def rewrite_useradd(params, is_pkg):
-        # The following comes from --help on useradd from shadow
-        parser = myArgumentParser(prog='useradd')
-        parser.add_argument("-b", "--base-dir", metavar="BASE_DIR", help="base directory for the home directory of the new account")
-        parser.add_argument("-c", "--comment", metavar="COMMENT", help="GECOS field of the new account")
-        parser.add_argument("-d", "--home-dir", metavar="HOME_DIR", help="home directory of the new account")
-        parser.add_argument("-D", "--defaults", help="print or change default useradd configuration", action="store_true")
-        parser.add_argument("-e", "--expiredate", metavar="EXPIRE_DATE", help="expiration date of the new account")
-        parser.add_argument("-f", "--inactive", metavar="INACTIVE", help="password inactivity period of the new account")
-        parser.add_argument("-g", "--gid", metavar="GROUP", help="name or ID of the primary group of the new account")
-        parser.add_argument("-G", "--groups", metavar="GROUPS", help="list of supplementary groups of the new account")
-        parser.add_argument("-k", "--skel", metavar="SKEL_DIR", help="use this alternative skeleton directory")
-        parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
-        parser.add_argument("-l", "--no-log-init", help="do not add the user to the lastlog and faillog databases", action="store_true")
-        parser.add_argument("-m", "--create-home", help="create the user's home directory", action="store_const", const=True)
-        parser.add_argument("-M", "--no-create-home", dest="create_home", help="do not create the user's home directory", action="store_const", const=False)
-        parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
-        parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
-        parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
-        parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")
-        parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
-        parser.add_argument("-r", "--system", help="create a system account", action="store_true")
-        parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
-        parser.add_argument("-u", "--uid", metavar="UID", help="user ID of the new account")
-        parser.add_argument("-U", "--user-group", help="create a group with the same name as the user", action="store_const", const=True)
-        parser.add_argument("LOGIN", help="Login name of the new user")
+        parser = oe.useradd.build_useradd_parser()
 
         # Return a list of configuration files based on either the default
         # files/passwd or the contents of USERADD_UID_TABLES
@@ -100,12 +63,9 @@ def update_useradd_static_config(d):
 
         newparams = []
         users = None
-        for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
-            param = param.strip()
-            if not param:
-                continue
+        for param in oe.useradd.split_commands(params):
             try:
-                uaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+                uaargs = parser.parse_args(oe.useradd.split_args(param))
             except:
                 bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
 
@@ -213,17 +173,7 @@ def update_useradd_static_config(d):
 
     # We parse and rewrite the groupadd components
     def rewrite_groupadd(params, is_pkg):
-        # The following comes from --help on groupadd from shadow
-        parser = myArgumentParser(prog='groupadd')
-        parser.add_argument("-f", "--force", help="exit successfully if the group already exists, and cancel -g if the GID is already used", action="store_true")
-        parser.add_argument("-g", "--gid", metavar="GID", help="use GID for the new group")
-        parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
-        parser.add_argument("-o", "--non-unique", help="allow to create groups with duplicate (non-unique) GID", action="store_true")
-        parser.add_argument("-p", "--password", metavar="PASSWORD", help="use this encrypted password for the new group")
-        parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new group")
-        parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
-        parser.add_argument("-r", "--system", help="create a system account", action="store_true")
-        parser.add_argument("GROUP", help="Group name of the new group")
+        parser = oe.useradd.build_groupadd_parser()
 
         # Return a list of configuration files based on either the default
         # files/group or the contents of USERADD_GID_TABLES
@@ -240,13 +190,10 @@ def update_useradd_static_config(d):
 
         newparams = []
         groups = None
-        for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
-            param = param.strip()
-            if not param:
-                continue
+        for param in oe.useradd.split_commands(params):
             try:
                 # If we're processing multiple lines, we could have left over values here...
-                gaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+                gaargs = parser.parse_args(oe.useradd.split_args(param))
             except:
                 bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
 
@@ -331,11 +278,7 @@ def update_useradd_static_config(d):
 
     #bb.warn("Before:  'EXTRA_USERS_PARAMS' - '%s'" % (d.getVar('EXTRA_USERS_PARAMS')))
     new_extrausers = []
-    for cmd in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', extrausers):
-        cmd = cmd.strip()
-        if not cmd:
-            continue
-
+    for cmd in oe.useradd.split_commands(extrausers):
         if re.match('''useradd (.*)''', cmd):
             useradd_param = re.match('''useradd (.*)''', cmd).group(1)
             useradd_param = rewrite_useradd(useradd_param, False)
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
new file mode 100644
index 0000000000..179ac76b5e
--- /dev/null
+++ b/meta/lib/oe/useradd.py
@@ -0,0 +1,68 @@
+import argparse
+import re
+
+class myArgumentParser(argparse.ArgumentParser):
+    def _print_message(self, message, file=None):
+        bb.warn("%s - %s: %s" % (d.getVar('PN'), pkg, message))
+
+    # This should never be called...
+    def exit(self, status=0, message=None):
+        message = message or ("%s - %s: useradd.bbclass: Argument parsing exited" % (d.getVar('PN'), pkg))
+        error(message)
+
+    def error(self, message):
+        raise bb.build.FuncFailed(message)
+
+def split_commands(params):
+    params = re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params.strip())
+    # Remove any empty items
+    return [x for x in params if x]
+
+def split_args(params):
+    params = re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params.strip())
+    # Remove any empty items
+    return [x for x in params if x]
+
+def build_useradd_parser():
+    # The following comes from --help on useradd from shadow
+    parser = myArgumentParser(prog='useradd')
+    parser.add_argument("-b", "--base-dir", metavar="BASE_DIR", help="base directory for the home directory of the new account")
+    parser.add_argument("-c", "--comment", metavar="COMMENT", help="GECOS field of the new account")
+    parser.add_argument("-d", "--home-dir", metavar="HOME_DIR", help="home directory of the new account")
+    parser.add_argument("-D", "--defaults", help="print or change default useradd configuration", action="store_true")
+    parser.add_argument("-e", "--expiredate", metavar="EXPIRE_DATE", help="expiration date of the new account")
+    parser.add_argument("-f", "--inactive", metavar="INACTIVE", help="password inactivity period of the new account")
+    parser.add_argument("-g", "--gid", metavar="GROUP", help="name or ID of the primary group of the new account")
+    parser.add_argument("-G", "--groups", metavar="GROUPS", help="list of supplementary groups of the new account")
+    parser.add_argument("-k", "--skel", metavar="SKEL_DIR", help="use this alternative skeleton directory")
+    parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
+    parser.add_argument("-l", "--no-log-init", help="do not add the user to the lastlog and faillog databases", action="store_true")
+    parser.add_argument("-m", "--create-home", help="create the user's home directory", action="store_const", const=True)
+    parser.add_argument("-M", "--no-create-home", dest="create_home", help="do not create the user's home directory", action="store_const", const=False)
+    parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
+    parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
+    parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
+    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")
+    parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
+    parser.add_argument("-r", "--system", help="create a system account", action="store_true")
+    parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
+    parser.add_argument("-u", "--uid", metavar="UID", help="user ID of the new account")
+    parser.add_argument("-U", "--user-group", help="create a group with the same name as the user", action="store_const", const=True)
+    parser.add_argument("LOGIN", help="Login name of the new user")
+
+    return parser
+
+def build_groupadd_parser():
+    # The following comes from --help on groupadd from shadow
+    parser = myArgumentParser(prog='groupadd')
+    parser.add_argument("-f", "--force", help="exit successfully if the group already exists, and cancel -g if the GID is already used", action="store_true")
+    parser.add_argument("-g", "--gid", metavar="GID", help="use GID for the new group")
+    parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
+    parser.add_argument("-o", "--non-unique", help="allow to create groups with duplicate (non-unique) GID", action="store_true")
+    parser.add_argument("-p", "--password", metavar="PASSWORD", help="use this encrypted password for the new group")
+    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new group")
+    parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
+    parser.add_argument("-r", "--system", help="create a system account", action="store_true")
+    parser.add_argument("GROUP", help="Group name of the new group")
+
+    return parser
-- 
2.12.0


