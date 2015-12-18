Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD5B731C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 23:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C41B818093
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jAWzZugXk3w7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 1E60018123
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:04 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id EE25E1229
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id EA86C11FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id E578A3E3C9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id tBINs36l017943
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 00:54:03 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id tBINs3RW017942
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Dec 2015 00:54:03 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 00:53:51 +0100
Message-Id: <84abb4b295c50ee5af031d11c9360ba4d01c59b6.1450482563.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
In-Reply-To: <cover.1450482563.git.pkj@axis.com>
References: <cover.1450482563.git.pkj@axis.com>
Subject: [PATCHv2 5/6] useradd-staticids.bbclass: Read passwd/group files before parsing
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

Read and merge the passwd/group files before parsing the user and
group definitions. This means they will only be read once per
recipe. This solves a problem where if a user was definied in multiple
files, it could generate group definitions for groups that should not
be created. E.g., if the first passwd file read defines a user as:

foobar::1234::::

and the second passwd file defines it as:

foobar:::nogroup:The foobar user:/:/bin/sh

then a foobar group would be created even if the user will use the
nogroup as its primary group.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 164 ++++++++++++++++++---------------
 1 file changed, 91 insertions(+), 73 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index df4902e..4e0ab1b 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -22,6 +22,30 @@ def update_useradd_static_config(d):
         and return it as a list"""
         return list(itertools.islice(itertools.chain(iterable, itertools.repeat(obj)), length))
 
+    def merge_files(file_list, exp_fields):
+        """Read each passwd/group file in file_list, split each line and create
+        a dictionary with the user/group names as keys and the split lines as
+        values. If the user/group name already exists in the dictionary, then
+        update any fields in the list with the values from the new list (if they
+        are set)."""
+        id_table = dict()
+        for conf in file_list.split():
+            if os.path.exists(conf):
+                f = open(conf, "r")
+                for line in f:
+                    if line.startswith('#'):
+                        continue
+                    # Make sure there always are at least exp_fields elements in
+                    # the field list. This allows for leaving out trailing
+                    # colons in the files.
+                    fields = list_extend(line.rstrip().split(":"), exp_fields)
+                    if fields[0] not in id_table:
+                        id_table[fields[0]] = fields
+                    else:
+                        id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
+
+        return id_table
+
     # We parse and rewrite the useradd components
     def rewrite_useradd(params):
         # The following comes from --help on useradd from shadow
@@ -63,6 +87,7 @@ def update_useradd_static_config(d):
             return str
 
         newparams = []
+        users = None
         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
             param = param.strip()
             if not param:
@@ -72,10 +97,9 @@ def update_useradd_static_config(d):
             except:
                 raise bb.build.FuncFailed("%s: Unable to parse arguments for USERADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
 
-            # files/passwd or the contents of USERADD_UID_TABLES
+            # Read all passwd files specified in USERADD_UID_TABLES or files/passwd
             # Use the standard passwd layout:
             #  username:password:user_id:group_id:comment:home_directory:login_shell
-            # (we want to process in reverse order, as 'last found' in the list wins)
             #
             # If a field is left blank, the original value will be used.  The 'username'
             # field is required.
@@ -84,61 +108,57 @@ def update_useradd_static_config(d):
             # in the useradd command may introduce a security hole.  It's assumed that
             # all new users get the default ('*' which prevents login) until the user is
             # specifically configured by the system admin.
-            for conf in get_passwd_list(d).split()[::-1]:
-                if os.path.exists(conf):
-                    f = open(conf, "r")
-                    for line in f:
-                        if line.startswith('#'):
-                            continue
-                        # Make sure there always are at least seven elements in
-                        # the field list. This allows for leaving out trailing
-                        # colons in the passwd file.
-                        field = list_extend(line.rstrip().split(":"), 7)
-                        if field[0] == uaargs.LOGIN:
-                            if uaargs.uid and field[2] and (uaargs.uid != field[2]):
-                                bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.uid, field[2]))
-                            uaargs.uid = field[2] or uaargs.uid
-
-                            # Determine the possible groupname
-                            # Unless the group name (or gid) is specified, we assume that the LOGIN is the groupname
-                            #
-                            # By default the system has creation of the matching groups enabled
-                            # So if the implicit username-group creation is on, then the implicit groupname (LOGIN)
-                            # is used, and we disable the user_group option.
-                            #
-                            user_group = uaargs.user_group is None or uaargs.user_group is True
-                            uaargs.groupname = uaargs.LOGIN if user_group else uaargs.gid
-                            uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname
-
-                            if uaargs.groupid and uaargs.gid != uaargs.groupid:
-                                newgroup = None
-                                if not uaargs.groupid.isdigit():
-                                    # We don't have a group number, so we have to add a name
-                                    bb.debug(1, "Adding group %s!" % uaargs.groupid)
-                                    newgroup = "%s %s" % (' --system' if uaargs.system else '', uaargs.groupid)
-                                elif uaargs.groupname and not uaargs.groupname.isdigit():
-                                    # We have a group name and a group number to assign it to
-                                    bb.debug(1, "Adding group %s (gid %s)!" % (uaargs.groupname, uaargs.groupid))
-                                    newgroup = "-g %s %s" % (uaargs.groupid, uaargs.groupname)
-                                else:
-                                    # We want to add a group, but we don't know it's name... so we can't add the group...
-                                    # We have to assume the group has previously been added or we'll fail on the adduser...
-                                    # Note: specifying the actual gid is very rare in OE, usually the group name is specified.
-                                    bb.warn("%s: Changing gid for login %s to %s, verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupid))
-
-                                uaargs.gid = uaargs.groupid
-                                uaargs.user_group = None
-                                if newgroup:
-                                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
-                                    if groupadd:
-                                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
-                                    else:
-                                        d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
-
-                            uaargs.comment = "'%s'" % field[4] if field[4] else uaargs.comment
-                            uaargs.home_dir = field[5] or uaargs.home_dir
-                            uaargs.shell = field[6] or uaargs.shell
-                            break
+            if not users:
+                users = merge_files(get_passwd_list(d), 7)
+
+            if uaargs.LOGIN not in users:
+                continue
+
+            field = users[uaargs.LOGIN]
+
+            if uaargs.uid and field[2] and (uaargs.uid != field[2]):
+                bb.warn("%s: Changing username %s's uid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.uid, field[2]))
+            uaargs.uid = field[2] or uaargs.uid
+
+            # Determine the possible groupname
+            # Unless the group name (or gid) is specified, we assume that the LOGIN is the groupname
+            #
+            # By default the system has creation of the matching groups enabled
+            # So if the implicit username-group creation is on, then the implicit groupname (LOGIN)
+            # is used, and we disable the user_group option.
+            #
+            user_group = uaargs.user_group is None or uaargs.user_group is True
+            uaargs.groupname = uaargs.LOGIN if user_group else uaargs.gid
+            uaargs.groupid = field[3] or uaargs.gid or uaargs.groupname
+
+            if uaargs.groupid and uaargs.gid != uaargs.groupid:
+                newgroup = None
+                if not uaargs.groupid.isdigit():
+                    # We don't have a group number, so we have to add a name
+                    bb.debug(1, "Adding group %s!" % uaargs.groupid)
+                    newgroup = "%s %s" % (' --system' if uaargs.system else '', uaargs.groupid)
+                elif uaargs.groupname and not uaargs.groupname.isdigit():
+                    # We have a group name and a group number to assign it to
+                    bb.debug(1, "Adding group %s (gid %s)!" % (uaargs.groupname, uaargs.groupid))
+                    newgroup = "-g %s %s" % (uaargs.groupid, uaargs.groupname)
+                else:
+                    # We want to add a group, but we don't know it's name... so we can't add the group...
+                    # We have to assume the group has previously been added or we'll fail on the adduser...
+                    # Note: specifying the actual gid is very rare in OE, usually the group name is specified.
+                    bb.warn("%s: Changing gid for login %s to %s, verify configuration files!" % (d.getVar('PN', True), uaargs.LOGIN, uaargs.groupid))
+
+                uaargs.gid = uaargs.groupid
+                uaargs.user_group = None
+                if newgroup:
+                    groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
+                    if groupadd:
+                        d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
+                    else:
+                        d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
+
+            uaargs.comment = "'%s'" % field[4] if field[4] else uaargs.comment
+            uaargs.home_dir = field[5] or uaargs.home_dir
+            uaargs.shell = field[6] or uaargs.shell
 
             # Should be an error if a specific option is set...
             if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not ((uaargs.uid and uaargs.uid.isdigit()) and uaargs.gid):
@@ -200,6 +220,7 @@ def update_useradd_static_config(d):
             return str
 
         newparams = []
+        groups = None
         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
             param = param.strip()
             if not param:
@@ -210,7 +231,7 @@ def update_useradd_static_config(d):
             except:
                 raise bb.build.FuncFailed("%s: Unable to parse arguments for GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN', True), pkg, param))
 
-            # Need to iterate over layers and open the right file(s)
+            # Read all group files specified in USERADD_GID_TABLES or files/group
             # Use the standard group layout:
             #  groupname:password:group_id:group_members
             #
@@ -219,21 +240,18 @@ def update_useradd_static_config(d):
             #
             # Note: similar to the passwd file, the 'password' filed is ignored
             # Note: group_members is ignored, group members must be configured with the GROUPMEMS_PARAM
-            for conf in get_group_list(d).split()[::-1]:
-                if os.path.exists(conf):
-                    f = open(conf, "r")
-                    for line in f:
-                        if line.startswith('#'):
-                            continue
-                        # Make sure there always are at least four elements in
-                        # the field list. This allows for leaving out trailing
-                        # colons in the group file.
-                        field = list_extend(line.rstrip().split(":"), 4)
-                        if field[0] == gaargs.GROUP and field[2]:
-                            if gaargs.gid and (gaargs.gid != field[2]):
-                                bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP, gaargs.gid, field[2]))
-                            gaargs.gid = field[2]
-                            break
+            if not groups:
+                groups = merge_files(get_group_list(d), 4)
+
+            if gaargs.GROUP not in groups:
+                continue
+
+            field = groups[gaargs.GROUP]
+
+            if field[2]:
+                if gaargs.gid and (gaargs.gid != field[2]):
+                    bb.warn("%s: Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (d.getVar('PN', True), gaargs.GROUP, gaargs.gid, field[2]))
+                gaargs.gid = field[2]
 
             if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not (gaargs.gid and gaargs.gid.isdigit()):
                 #bb.error("Skipping recipe %s, package %s which adds groupname %s does not have a static gid defined." % (d.getVar('PN', True),  pkg, gaargs.GROUP))
-- 
2.1.0


