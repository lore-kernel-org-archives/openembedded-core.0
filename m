Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QZNCY-0008RC-UD
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 15:10:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2011 06:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,406,1304319600"; d="scan'208";a="16826574"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2011 06:07:02 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 21:08:23 +0800
Message-Id: <fa1e6143a43db7d1c355aa3ca22f16133b30c031.1308747461.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308747461.git.ke.yu@intel.com>
References: <cover.1308747461.git.ke.yu@intel.com>
Subject: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 13:10:41 -0000

This patch adds the script combo-layer.py to manipulate the combo
layer repo. A combo layer repo is a repo containing multiple component
repo, e.g. oe-core, bitbake, BSP repos. The combo layer repo need to
be updated by syncing with the component repo upstream. This script
is written to assist the combo layer handling.

Combo layer tool provides three functionalities:
- init: when the combo layer repo and component repo is not existed,
  init will "git init" the combo layer repo, and also "git clone" the
  component repo

- update: combo layer tool will pull the latest commit from component
  repo upstream, and apply the commit since last update commit to the
  combo repo. If user specify interactive mode(--interactive),
  user can edit the patch list to select which commit to apply.

- splitpatch: split the combo repo commit into separate patches per
  component repo. So that user can submit the patch to component repo
  upstream.

Combo layer tool uses config file to define the component repo info.
please check the combo-layer.conf.example for the detail explanation
of the config file field.

CC: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Paul Eggleton <paul.eggleton@intel.com>
CC: Chris Larson <clarson@kergoth.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 scripts/combo-layer                 |  360 +++++++++++++++++++++++++++++++++++
 scripts/combo-layer-hook-default.sh |   13 ++
 scripts/combo-layer.conf.example    |   37 ++++
 3 files changed, 410 insertions(+), 0 deletions(-)
 create mode 100755 scripts/combo-layer
 create mode 100755 scripts/combo-layer-hook-default.sh
 create mode 100644 scripts/combo-layer.conf.example

diff --git a/scripts/combo-layer b/scripts/combo-layer
new file mode 100755
index 0000000..ef798ab
--- /dev/null
+++ b/scripts/combo-layer
@@ -0,0 +1,360 @@
+#!/usr/bin/env python
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright 2011 Intel Corporation
+# Authored-by:  Richard Purdie <richard.purdie@intel.com>
+#               Paul Eggleton <paul.eggleton@intel.com>
+#               Yu Ke <ke.yu@intel.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import os, sys
+import optparse
+import logging
+import subprocess
+import ConfigParser
+
+__version__ = "0.1.0"
+
+def logger_create():
+    logger = logging.getLogger("")
+    loggerhandler = logging.StreamHandler()
+    loggerhandler.setFormatter(logging.Formatter("[%(asctime)s] %(message)s","%H:%M:%S"))
+    logger.addHandler(loggerhandler)
+    logger.setLevel(logging.INFO)
+    return logger
+
+logger = logger_create()
+
+class Configuration(object):
+    """
+    Manages the configuration
+
+    A valid conf looks like:
+
+# repo name
+[bitbake]
+
+# mandatory options
+
+# git upstream uri
+src_uri = git://git.openembedded.org/bitbake
+
+# the directory to clone the component repo
+local_repo_dir = ~/src/bitbake
+
+# the relative dir to commit the repo patch
+# use "." if it is root dir
+dest_dir = bitbake
+
+# the updated revision last time.
+# leave it empty if no commit updated yet, and then the tool
+# will start from the first commit
+last_revision =
+
+# optional options
+
+# file_filter: only include the interested file
+# file_filter = [path] [path] ...
+# example:
+#   file_filter = src/  : only include the subdir src
+#   file_filter = src/*.c : only include the src *.c file
+#   file_filter = src/main.c src/Makefile.am : only include these two files
+
+[oe-core]
+src_uri = git://git.openembedded.org/openembedded-core
+local_repo_dir = ~/src/oecore
+dest_dir = .
+last_revision =
+
+# more repos ...
+
+    """
+    def __init__(self, options):
+        for key, val in options.__dict__.items():
+            setattr(self, key, val)
+        self.parser = ConfigParser.ConfigParser()
+        self.parser.readfp(open(self.conffile))
+        self.repos = {}
+        for repo in self.parser.sections():
+            self.repos[repo] = {}
+            for (name, value) in self.parser.items(repo):
+                self.repos[repo][name] = value
+
+    def update(self, repo, option, value):
+        self.parser.set(repo, option, value)
+        self.parser.write(open(self.conffile, "w"))
+
+    def sanity_check(self):
+        required_options=["src_uri", "local_repo_dir", "dest_dir", "last_revision"]
+        msg = ""
+        for name in self.repos:
+            for option in required_options:
+                if option not in self.repos[name]:
+                    msg = "%s\nOption %s is not defined for repo %s" %(msg, option, name)
+        if msg != "":
+            logger.error("configuration file %s has the following error:%s" % (self.conffile,msg))
+            sys.exit(1)
+
+        # filterdiff is required by action_splitpatch, so check its availability
+        if subprocess.call("which filterdiff &>/dev/null", shell=True) != 0:
+            logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
+            sys.exit(1)
+
+def runcmd(cmd,destdir=None):
+    """
+        execute command, raise CalledProcessError if fail
+        return output if succeed
+    """
+    logger.debug("run cmd '%s' in %s" % (cmd, os.getcwd() if destdir is None else destdir))
+    out = os.tmpfile()
+    try:
+        subprocess.check_call(cmd, stdout=out, stderr=out, cwd=destdir, shell=True)
+    except subprocess.CalledProcessError,e:
+        out.seek(0)
+        logger.error("%s" % out.read())
+        raise e
+
+    out.seek(0)
+    output = out.read()
+    logger.debug("output: %s" % output )
+    return output
+
+def action_init(conf, args):
+    """
+        Clone component repositories
+        Check git initialised and working tree is clean
+    """
+    for name in conf.repos:
+        ldir = conf.repos[name]['local_repo_dir']
+        if not os.path.exists(ldir):
+            logger.info("cloning %s to %s" %(conf.repos[name]['src_uri'], ldir))
+            subprocess.check_call("git clone %s %s" % (conf.repos[name]['src_uri'], ldir), shell=True)
+    if not os.path.exists(".git"):
+        runcmd("git init")
+
+def check_repo_clean(repodir):
+    """
+        check if the repo is clean
+        exit if repo is dirty
+    """
+    try:
+        runcmd("git diff --quiet", repodir)
+        #TODO: also check the index using "git diff --cached"
+        #      but this will fail in just initialized git repo
+        #      so need figure out a way
+    except:
+        logger.error("git repo %s is dirty, please fix it first", repodir)
+        sys.exit(1)
+
+def action_update(conf, args):
+    """
+        update the component repo
+        generate the patch list
+        apply the generated patches
+    """
+    # make sure all repos are clean
+    for name in conf.repos:
+        check_repo_clean(conf.repos[name]['local_repo_dir'])
+    check_repo_clean(os.getcwd())
+
+    import uuid
+    patch_dir = "patch-%s" % uuid.uuid4()
+    os.mkdir(patch_dir)
+
+    for name in conf.repos:
+        repo = conf.repos[name]
+        ldir = repo['local_repo_dir']
+        dest_dir = repo['dest_dir']
+        repo_patch_dir = os.path.join(os.getcwd(), patch_dir, name)
+
+        # Step 1: update the component repo
+        logger.info("git pull for repo %s in %s ..." % (name, ldir))
+        output=runcmd("git pull", ldir)
+        logger.info(output)
+
+        # Step 2: generate the patch list and store to patch dir
+        logger.info("generating patches for %s" % name)
+        if dest_dir != ".":
+            prefix = "--src-prefix=a/%s/ --dst-prefix=b/%s/" % (dest_dir, dest_dir)
+        else:
+            prefix = ""
+        if repo['last_revision'] == "":
+            logger.info("Warning: last_revision of repo %s is not set, so start from the first commit" % name)
+            patch_cmd_range = "--root master"
+            rev_cmd_range = "master"
+        else:
+            patch_cmd_range = "%s..master" % repo['last_revision']
+            rev_cmd_range = "%s..master" % repo['last_revision']
+
+        file_filter = repo.get('file_filter',"")
+
+        patch_cmd = "git format-patch -N %s --output-directory %s %s -- %s" % \
+            (prefix,repo_patch_dir, patch_cmd_range, file_filter)
+        output = runcmd(patch_cmd, ldir)
+        logger.debug("generated patch set:\n%s" % output)
+        patchlist = output.splitlines()
+
+        rev_cmd = 'git log --pretty=format:"%H" ' + rev_cmd_range
+        revlist = runcmd(rev_cmd, ldir).splitlines()
+
+        # Setp 3: Call repo specific hook to adjust patch
+        if 'hook' in repo:
+            # hook parameter is: ./hook patchpath revision reponame
+            count=len(revlist)-1
+            for patch in patchlist:
+                runcmd("%s %s %s %s" % (repo['hook'], patch, revlist[count], name))
+                count=count-1
+
+        # Step 4: write patch list and revision list to file, for user to edit later
+        patchlist_file = os.path.join(os.getcwd(), patch_dir, "patchlist-%s" % name)
+        repo['patchlist'] = patchlist_file
+        f = open(patchlist_file, 'w')
+        count=len(revlist)-1
+        for patch in patchlist:
+            f.write("%s %s\n" % (patch, revlist[count]))
+            count=count-1
+        f.close()
+
+    # Step 5: invoke bash for user to edit patch and patch list
+    if conf.interactive:
+        print   'Edit the patch and patch list in %s\n' \
+                'For example, remove the unwanted patch entry from patchlist-*, so that it will be not applied later\n' \
+                'After finish, press following command to continue\n' \
+                '       exit 0  -- exit and continue to apply the patch\n' \
+                '       exit 1  -- abort and not apply patch\n' % patch_dir
+        ret = subprocess.call(["bash"], cwd=patch_dir)
+        if ret != 0:
+            print "Abort without applying patch"
+            sys.exit(0)
+
+    # Step 6: apply the generated and revised patch
+    action_apply_patch(conf, args)
+    runcmd("rm -rf %s" % patch_dir)
+
+def action_apply_patch(conf, args):
+    """
+        apply the generated patch list to combo repo
+    """
+    for name in conf.repos:
+        repo = conf.repos[name]
+        lastrev = repo["last_revision"]
+        for line in open(repo['patchlist']):
+            patchfile = line.split()[0]
+            lastrev = line.split()[1]
+            cmd = "git am -s -p1 %s" % patchfile
+            logger.info("Apply %s" % patchfile )
+            try:
+                runcmd(cmd)
+            except subprocess.CalledProcessError:
+                logger.info('"git am --abort" is executed to cleanup repo')
+                runcmd("git am --abort")
+                logger.error('"%s" failed' % cmd)
+                logger.info("please manually apply patch %s" % patchfile)
+                logger.info("After applying, run this tool again to apply the rest patches")
+                conf.update(name, "last_revision", lastrev)
+                sys.exit(0)
+        conf.update(name, "last_revision", lastrev)
+
+def action_splitpatch(conf, args):
+    """
+        generate the commit patch and
+        split the patch per repo
+    """
+    logger.debug("action_splitpatch")
+    if len(args) > 1:
+        commit = args[1]
+    else:
+        commit = "HEAD"
+    patchdir = "splitpatch-%s" % commit
+    if not os.path.exists(patchdir):
+        os.mkdir(patchdir)
+
+    # filerange_root is for the repo whose dest_dir is root "."
+    # and it should be specified by excluding all other repo dest dir
+    # like "-x repo1 -x repo2 -x repo3 ..."
+    filerange_root = ""
+    for name in conf.repos:
+        dest_dir = conf.repos[name]['dest_dir']
+        if dest_dir != ".":
+            filerange_root = '%s -x "%s/*"' % (filerange_root, dest_dir)
+
+    for name in conf.repos:
+        dest_dir = conf.repos[name]['dest_dir']
+        patch_filename = "%s/%s.patch" % (patchdir, name)
+        if dest_dir == ".":
+            cmd = "git format-patch -n1 --stdout %s | filterdiff -p1 %s > %s" % (commit, filerange_root, patch_filename)
+        else:
+            cmd = "git format-patch --no-prefix -n1 --stdout %s -- %s > %s" % (commit, dest_dir, patch_filename)
+        runcmd(cmd)
+        logger.info(patch_filename)
+
+def action_error(conf, args):
+    logger.info("invalide action %s" % args[0])
+
+actions = {
+    "init": action_init,
+    "update": action_update,
+    "splitpatch": action_splitpatch,
+}
+
+def main():
+    parser = optparse.OptionParser(
+        version = "Combo Layer Repo Tool version %s" % __version__,
+        usage = """%prog [options] action
+
+Create, update the combo layer according to the upstream repo.
+
+Action:
+  init              init the combo layer repo
+  update            get patches from upstream update, apply them to the combo repo
+  splitpatch [commit] generate commit patch and split per repo, default commit is HEAD""")
+
+    parser.add_option("-c", "--conf", help = "specify the config file. default is conf/combolayer.conf",
+               action = "store", dest = "conffile", default = "combo-layer.conf")
+
+    parser.add_option("-i", "--interactive", help = "interactive mode, user can edit the patch list and patch",
+               action = "store_true", dest = "interactive", default = False)
+
+    parser.add_option("-D", "--debug", help = "output debug information",
+               action = "store_true", dest = "debug", default = False)
+
+    options, args = parser.parse_args(sys.argv)
+
+    # Dispatch to action handler
+    if len(args) == 1:
+        logger.error("No action specified, exit...")
+        parser.print_help()
+    elif args[1] not in actions:
+        logger.error("Unsupported action %s, exit...\n" % (args[1]))
+        parser.print_help()
+    elif not os.path.exists(options.conffile):
+        logger.error("No valid config file, exit ...\n")
+        parser.print_help()
+    else:
+        if options.debug:
+            logger.setLevel(logging.DEBUG)
+        confdata = Configuration(options)
+        confdata.sanity_check()
+        actions.get(args[1], action_error)(confdata, args[1:])
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
new file mode 100755
index 0000000..f03c4fa
--- /dev/null
+++ b/scripts/combo-layer-hook-default.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+# Hook to add source component/revision info to commit message
+# Parameter:
+#   $1 patch-file
+#   $2 revision
+#   $3 reponame
+
+patchfile=$1
+rev=$2
+reponame=$3
+
+sed -i -e "s#Subject: \[PATCH\] \(.*\)#Subject: \[PATCH\] $reponame: \1#" $patchfile
+sed -i -e "0,/Signed-off-by:/s#\(Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
new file mode 100644
index 0000000..09b9415
--- /dev/null
+++ b/scripts/combo-layer.conf.example
@@ -0,0 +1,37 @@
+# component name
+[bitbake]
+# mandatory options
+# git upstream uri
+src_uri = git://git.openembedded.org/bitbake
+
+# the directory to clone the component repo
+local_repo_dir = /home/kyu3/src/test/bitbake
+
+# the relative dir to commit the repo patch
+# use "." if it is root dir
+dest_dir = bitbake
+
+# the updated revision last time.
+# If empty, the tool will start from the first commit
+last_revision =
+
+# optional options
+
+# file_filter: only include the interested file
+# file_filter = [path] [path] ...
+# example:
+#   file_filter = src/  : only include the subdir src
+#   file_filter = src/*.c : only include the src *.c file
+#   file_filter = src/main.c src/Makefile.am : only include these two files
+
+# hook: if provided, the tool will call the hook to process the generated patch from upstream,
+#       and then apply the modified patch to combo repo
+# the hook's parameter is: ./hook patchpath revision reponame
+# example:
+#     hook = combo-layer-hook-default.sh
+
+[oe-core]
+src_uri = git://git.openembedded.org/openembedded-core
+local_repo_dir = /home/kyu3/src/test/oecore
+dest_dir = .
+last_revision =
-- 
1.7.0.4



