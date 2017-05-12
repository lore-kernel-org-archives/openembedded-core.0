Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C89FE77BC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 08:16:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4C8GOBQ028687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 12 May 2017 09:16:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d95kO-0001Zo-HC; Fri, 12 May 2017 09:16:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 09:16:22 +0100
Message-Id: <1494576982-6006-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 12 May 2017 09:16:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/4] useradd: Create lib/oe/useradd function library
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
X-List-Received-Date: Fri, 12 May 2017 08:16:30 -0000

The code in useradd-staticids is generally useful for user addition
functionality but is not reusable in its current form. Refactor the
code into a set of library functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/useradd-staticids.bbclass | 47 +++--------------------
 meta/lib/oe/useradd.py                 | 70 ++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 41 deletions(-)
 create mode 100644 meta/lib/oe/useradd.py

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 2d282c0..615136c 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -1,7 +1,6 @@
 # In order to support a deterministic set of 'dynamic' users/groups,
 # we need a function to reformat the params based on a static file
 def update_useradd_static_config(d):
-    import argparse
     import itertools
     import re
     import errno
@@ -59,31 +58,7 @@ def update_useradd_static_config(d):
 
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
@@ -100,12 +75,12 @@ def update_useradd_static_config(d):
 
         newparams = []
         users = None
-        for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
+        for param in oe.useradd.useradd_splitargs2(params):
             param = param.strip()
             if not param:
                 continue
             try:
-                uaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+                uaargs = parser.parse_args(oe.useradd.useradd_splitargs(param))
             except:
                 bb.fatal("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
 
@@ -213,17 +188,7 @@ def update_useradd_static_config(d):
 
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
@@ -240,13 +205,13 @@ def update_useradd_static_config(d):
 
         newparams = []
         groups = None
-        for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
+        for param in oe.useradd.useradd_splitargs2(params):
             param = param.strip()
             if not param:
                 continue
             try:
                 # If we're processing multiple lines, we could have left over values here...
-                gaargs = parser.parse_args(re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+                gaargs = parser.parse_args(oe.useradd.useradd_splitargs(param))
             except:
                 bb.fatal("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
 
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
new file mode 100644
index 0000000..52eebf0
--- /dev/null
+++ b/meta/lib/oe/useradd.py
@@ -0,0 +1,70 @@
+import argparse
+import re
+
+class myArgumentParser( argparse.ArgumentParser ):
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
+def useradd_splitargs(params):
+    params = re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params)
+    # Remove any empty items
+    return [x for x in params if x]
+
+
+def useradd_splitargs2(params):
+    params = re.split('''[ \t]*;[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params)
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
+
-- 
2.7.4


