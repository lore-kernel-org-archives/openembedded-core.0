Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7B316DDB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 18:32:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBAIWUFG023642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:32:30 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 10 Dec 2013 10:32:30 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2013 12:31:28 -0600
Message-ID: <21a7d772b9aee15d16ee8e29cb00a22e5fe21aac.1386700055.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386700055.git.mark.hatle@windriver.com>
References: <cover.1386700055.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 2/2] useradd.bbclass: Add ability to select a static uid/gid automatically
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
X-List-Received-Date: Tue, 10 Dec 2013 18:32:31 -0000
Content-Type: text/plain

[YOCTO #5436]

Automatic selection of static uid/gid is needed for a dynamically generated
passwd and group file to have a deterministic outcome.

When a package is installed and instructs the system to add a new user or
group, unless it selects a static uid/gid value, the next available uid/gid
will be used.  The order in which packages are installed is dynamically
computed, and may change from one installation to the next.  This results
in a non-deterministic set of uid/gid values.

Enabling USERADD_REWRITE_PARAMS, and providing a preconfigured passwd/group
file will allow the continued dynamic generation of the passwd/group file
on the target, but ensure a deterministic outcome.  (Dynamic generation is
desired so that user and groups that have no corresponding functionality
are not present within the final system image.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/useradd.bbclass         | 226 +++++++++++++++++++++++++++++++++++
 meta/conf/local.conf.sample.extended |  24 ++++
 2 files changed, 250 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a60ab09..7f2c6e8 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -144,9 +144,235 @@ def update_useradd_after_parse(d):
         if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg, True):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
 
+# In order to support a deterministic set of 'dynamic' users/groups,
+# we need a function to reformat the params based on a static file
+def update_useradd_static_config(d):
+    import argparse
+    import re
+
+    class myArgumentParser( argparse.ArgumentParser ):
+        def _print_message(self, message, file=None):
+            bb.warn("%s - %s: %s" % (d.getVar('PN', True), pkg, message))
+
+        # This should never be called...
+        def exit(self, status=0, message=None):
+            message = message or ("%s - %s: useradd.bbclass: Argument parsing exited" % (d.getVar('PN', True), pkg))
+            error(message)
+
+        def error(self, message):
+            raise bb.build.FuncFailed(message)
+
+    # We parse and rewrite the useradd components
+    def rewrite_useradd(params):
+        # The following comes from --help on useradd from shadow
+        parser = myArgumentParser(prog='useradd')
+        parser.add_argument("-b", "--base-dir", metavar="BASE_DIR", help="base directory for the home directory of the new account")
+        parser.add_argument("-c", "--comment", metavar="COMMENT", help="GECOS field of the new account")
+        parser.add_argument("-d", "--home-dir", metavar="HOME_DIR", help="home directory of the new account")
+        parser.add_argument("-D", "--defaults", help="print or change default useradd configuration", action="store_true")
+        parser.add_argument("-e", "--expiredate", metavar="EXPIRE_DATE", help="expiration date of the new account")
+        parser.add_argument("-f", "--inactive", metavar="INACTIVE", help="password inactivity period of the new account")
+        parser.add_argument("-g", "--gid", metavar="GROUP", help="name or ID of the primary group of the new account")
+        parser.add_argument("-G", "--groups", metavar="GROUPS", help="list of supplementary groups of the new account")
+        parser.add_argument("-k", "--skel", metavar="SKEL_DIR", help="use this alternative skeleton directory")
+        parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
+        parser.add_argument("-l", "--no-log-init", help="do not add the user to the lastlog and faillog databases", action="store_true")
+        parser.add_argument("-m", "--create-home", help="create the user's home directory", action="store_true")
+        parser.add_argument("-M", "--no-create-home", help="do not create the user's home directory", action="store_true")
+        parser.add_argument("-N", "--no-user-group", help="do not create a group with the same name as the user", action="store_true")
+        parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
+        parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
+        parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
+        parser.add_argument("-r", "--system", help="create a system account", action="store_true")
+        parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
+        parser.add_argument("-u", "--uid", metavar="UID", help="user ID of the new account")
+        parser.add_argument("-U", "--user-group", help="create a group with the same name as the user", action="store_true")
+        parser.add_argument("LOGIN", help="Login name of the new user")
+
+        # Return a list of configuration files based on either the default
+        # files/passwd or the contents of USERADD_UID_TABLES
+        # paths are resulved via BBPATH
+        def get_passwd_list(d):
+            str = ""
+            bbpath = d.getVar('BBPATH', True)
+            passwd_tables = d.getVar('USERADD_UID_TABLES', True)
+            if not passwd_tables:
+                passwd_tables = 'files/passwd'
+            for conf_file in passwd_tables.split():
+                str += " %s" % bb.utils.which(bbpath, conf_file)
+            return str
+
+        newparams = []
+        for param in re.split('''[ ]*;[ ]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
+            param=param.strip()
+            try:
+                uaargs = parser.parse_args(re.split('''[ ]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+            except:
+                raise bb.build.FuncFailed("%s: Unable to parse arguments for USERADD_PARAM_%s: %s" % (d.getVar('PN', True), pkg, param))
+
+            # files/passwd or the contents of USERADD_UID_TABLES
+            # Use the standard passwd layout:
+            #  username:password:user_id:group_id:comment:home_directory:login_shell
+            # (we want to process in reverse order, as 'last found' in the list wins)
+            for conf in get_passwd_list(d).split()[::-1]:
+                if os.path.exists(conf):
+                    f = open(conf, "r")
+                    for line in f:
+                        if line.startswith('#'):
+                            continue
+                        field = line.rstrip().split(":")
+                        if field[0] == uaargs.LOGIN:
+                            if uaargs.uid and (uaargs.uid != field[2]):
+                               bb.warn("Changing username %s's uid from (%s) to (%s), verify configuration files!" % (uaargs.LOGIN, uaargs.uid, field[2]))
+                            uaargs.uid = field[2]
+
+                            # By default the system has creation of the matching groups enabled
+                            # So if explicit user-group creation is on, an implicit group is specified
+                            # or a group -name- is specified, we need to pick the number and create 
+                            # the group using the addgroup...
+                            if uaargs.user_group or not uaargs.gid or not uaargs.gid.isdigit():
+                               # Set the implicit case
+                               if not uaargs.gid:
+                                   uaargs.gid = uaargs.LOGIN
+                               bb.debug(2, "Adding group %s  gid (%s)!" % (uaargs.gid, field[3]))
+                               uaargs.user_group = False
+                               groupadd = d.getVar("GROUPADD_PARAM_%s" % pkg, True)
+                               newgroup = "-g %s %s" % (field[3], uaargs.gid)
+                               if groupadd:
+                                   d.setVar("GROUPADD_PARAM_%s" % pkg, "%s ; %s" % (groupadd, newgroup))
+                               else:
+                                   d.setVar("GROUPADD_PARAM_%s" % pkg, newgroup)
+
+                            if uaargs.gid and uaargs.gid.isdigit() and (uaargs.gid != field[3]):
+                               bb.warn("Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (uaargs.LOGIN, uaargs.gid, field[3]))
+                            uaargs.gid = field[3]
+
+                            uaargs.comment = [uaargs.comment, "'%s'" % field[4]][field[4] != ""]
+                            uaargs.home_dir = field[5]
+                            uaargs.shell = field[6]
+                            break
+
+            # Should be an error if a specific option is set...
+            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and (not uaargs.uid or not uaargs.gid):
+                bb.error("%s - %s: Username %s does not have a static uid/gid defined." % (d.getVar('PN', True), pkg, uaargs.LOGIN))
+
+            # Reconstruct the args...
+            newparam  = ['', ' --defaults'][uaargs.defaults]
+            newparam += ['', ' --base-dir %s' % uaargs.base_dir][uaargs.base_dir != None]
+            newparam += ['', ' --comment %s' % uaargs.comment][uaargs.comment != None]
+            newparam += ['', ' --home-dir %s' % uaargs.home_dir][uaargs.home_dir != None]
+            newparam += ['', ' --expiredata %s' % uaargs.expiredate][uaargs.expiredate != None]
+            newparam += ['', ' --inactive %s' % uaargs.inactive][uaargs.inactive != None]
+            newparam += ['', ' --gid %s' % uaargs.gid][uaargs.gid != None]
+            newparam += ['', ' --groups %s' % uaargs.groups][uaargs.groups != None]
+            newparam += ['', ' --skel %s' % uaargs.skel][uaargs.skel != None]
+            newparam += ['', ' --key %s' % uaargs.key][uaargs.key != None]
+            newparam += ['', ' --no-log-init'][uaargs.no_log_init]
+            newparam += ['', ' --create-home'][uaargs.create_home]
+            newparam += ['', ' --no-create-home'][uaargs.no_create_home]
+            newparam += ['', ' --no-user-group'][uaargs.no_user_group]
+            newparam += ['', ' --non-unique'][uaargs.non_unique]
+            newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
+            newparam += ['', ' --root %s' % uaargs.root][uaargs.root != None]
+            newparam += ['', ' --system'][uaargs.system]
+            newparam += ['', ' --shell %s' % uaargs.shell][uaargs.shell != None]
+            newparam += ['', ' --uid %s' % uaargs.uid][uaargs.uid != None]
+            newparam += ['', ' --user-group'][uaargs.user_group]
+            newparam += ' %s' % uaargs.LOGIN
+
+            newparams.append(newparam)
+
+        return " ;".join(newparams).strip()
+
+    # We parse and rewrite the groupadd components
+    def rewrite_groupadd(params):
+        # The following comes from --help on groupadd from shadow
+        parser = myArgumentParser(prog='groupadd')
+        parser.add_argument("-f", "--force", help="exit successfully if the group already exists, and cancel -g if the GID is already used", action="store_true")
+        parser.add_argument("-g", "--gid", metavar="GID", help="use GID for the new group")
+        parser.add_argument("-K", "--key", metavar="KEY=VALUE", help="override /etc/login.defs defaults")
+        parser.add_argument("-o", "--non-unique", help="allow to create groups with duplicate (non-unique) GID", action="store_true")
+        parser.add_argument("-p", "--password", metavar="PASSWORD", help="use this encrypted password for the new group")
+        parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
+        parser.add_argument("-r", "--system", help="create a system account", action="store_true")
+        parser.add_argument("GROUP", help="Group name of the new group")
+
+        # Return a list of configuration files based on either the default
+        # files/group or the contents of USERADD_GID_TABLES
+        # paths are resulved via BBPATH
+        def get_group_list(d):
+            str = ""
+            bbpath = d.getVar('BBPATH', True)
+            group_tables = d.getVar('USERADD_GID_TABLES', True)
+            if not group_tables:
+                group_tables = 'files/group'
+            for conf_file in group_tables.split():
+                str += " %s" % bb.utils.which(bbpath, conf_file)
+            return str
+
+        newparams = []
+        for param in re.split('''[ ]*;[ ]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
+            param=param.strip()
+            try:
+                gaargs = parser.parse_args(re.split('''[ ]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
+            except:
+                raise bb.build.FuncFailed("%s: Unable to parse arguments for GROUPADD_PARAM_%s: %s" % (d.getVar('PN', True), pkg, param))
+
+            # Need to iterate over layers and open the right file(s)
+            # Use the standard group layout:
+            #  groupname:password:group_id:group_members
+            for conf in get_group_list(d).split()[::-1]:
+                if os.path.exists(conf):
+                    f = open(conf, "r")
+                    for line in f:
+                        if line.startswith('#'):
+                            continue
+                        field = line.rstrip().split(":")
+                        if field[0] == gaargs.GROUP:
+                            if gaargs.gid and (gaargs.gid != field[2]):
+                                bb.warn("Changing groupname %s's gid from (%s) to (%s), verify configuration files!" % (gaargs.GROUP, gaargs.gid, field[2]))
+                            gaargs.gid = field[2]
+                            break
+
+            if d.getVar('USERADD_ERROR_DYNAMIC', True) == '1' and not gaargs.gid:
+                bb.error("%s - %s: Groupname %s does not have a static gid defined." % (d.getVar('PN', True), pkg, gaargs.GROUP))
+
+            # Reconstruct the args...
+            newparam  = ['', ' --force'][gaargs.force]
+            newparam += ['', ' --gid %s' % gaargs.gid][gaargs.gid != None]
+            newparam += ['', ' --key %s' % gaargs.key][gaargs.key != None]
+            newparam += ['', ' --non-unique'][gaargs.non_unique]
+            newparam += ['', ' --password %s' % gaargs.password][gaargs.password != None]
+            newparam += ['', ' --root %s' % gaargs.root][gaargs.root != None]
+            newparam += ['', ' --system'][gaargs.system]
+            newparam += ' %s' % gaargs.GROUP
+
+            newparams.append(newparam)
+
+        return " ;".join(newparams).strip()
+
+    # Load and process the users and groups, rewriting the adduser/addgroup params
+    useradd_packages = d.getVar('USERADD_PACKAGES', True)
+
+    for pkg in useradd_packages.split():
+        # Groupmems doesn't have anything we might want to change, so simply validating
+        # is a bit of a waste -- only process useradd/groupadd
+        useradd_param = d.getVar('USERADD_PARAM_%s' % pkg, True)
+        if useradd_param:
+            d.setVar('USERADD_PARAM_%s' % pkg, rewrite_useradd(useradd_param))
+
+        groupadd_param = d.getVar('GROUPADD_PARAM_%s' % pkg, True)
+        if groupadd_param:
+            d.setVar('GROUPADD_PARAM_%s' % pkg, rewrite_groupadd(groupadd_param))
+
+
+
 python __anonymous() {
     if not bb.data.inherits_class('nativesdk', d):
         update_useradd_after_parse(d)
+
+        if d.getVar('USERADD_REWRITE_PARAMS', True) == '1':
+            update_useradd_static_config(d)
 }
 
 # Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 00716f9..ee8c78f 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -238,6 +238,30 @@
 #usermod -s /bin/sh tester; \
 #"
 
+# Various packages dynamically add users and groups to the system at package
+# install time.  For programs that do not care what the uid/gid is of the
+# resulting users/groups, the order of the install will determine the final
+# uid/gid.  This can lead to non-deterministic uid/gid values from one build
+# to another.  Use the following settings to specify that all user/group adds
+# should be created based on a static passwd/group file.
+#
+# By default the system looks in the BBPATH for files/passwd and files/group
+# the default can be overriden by spefying USERADD_UID/GID_TABLES.
+#
+# Note, if you change the value of the USERADD_REWRITE_PARAMS after starting
+# to build.  The TMPDIR may have incompatible uid/gids in it.  You must 'rm' 
+# the TMPDIR to avoid this issue.
+#
+#USERADD_REWRITE_PARAMS = "1"
+#USERADD_UID_TABLES = "files/passwd"
+#USERADD_GID_TABLES = "files/group"
+#
+# In order to prevent generating a system where a dynamicly assigned uid/gid
+# can exist, you can enable the following setting.  This will force the 
+# system to error out if the user/group name is not defined in the 
+# files/passwd or files/group (or specified replacements.)
+#USERADD_ERROR_DYNAMIC = "1"
+
 # Enabling FORTRAN
 # Note this is not officially supported and is just illustrated here to
 # show an example of how it can be done
-- 
1.8.1.2.545.g2f19ada


