Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8BCC73D80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 22:10:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 11 Aug 2015 15:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,656,1432623600"; d="scan'208";a="782256448"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 15:10:14 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 14:04:14 +0000
Message-Id: <dec31dd6b2f6e2c9cfd36f3a249ef1cbead5cdf6.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/1][RFC] devtool: Upgrade feature
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
X-List-Received-Date: Tue, 11 Aug 2015 22:10:16 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This is a new devtool's feature, which upgrades a recipe to a
particular version number. Code was taken from [1] where some modifications
were done (remove all email, buildhistory and statistics features,
use devtool logger instead of AUH logger) to adapt the devtool framework.
Once the upgrade is over, the new recipe will be located under the
devtool's workspace. This is a first approach to this feature; pending
tasks include:

1. The AUH [1] is used to rename and update the recipe. AUH is not
using the lib/oe/recipeutils library to do this work. AUH ported code should use
this library which is the one being used by the rest of the devtool features.

2. Currently, when 'update-recipe' is executed, the recipe under workspace
is updated with latest commits. The only task missing is to replace the new
recipe with the old one, commonly located under the meta layer.

3. When patches fail to apply, follow the PATCHRESOLVE behavior instead of
just failing.

4. Patches most of the time do not apply correctly on the new recipe version,
so include a command line option to indicate the system not to apply these,
so it can be applied manually later on.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/

[YOCTO #7642]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/auto-upgrade-helper/bitbake.py | 102 +++++
 scripts/lib/devtool/auto-upgrade-helper/errors.py  |  87 +++++
 scripts/lib/devtool/auto-upgrade-helper/git.py     | 101 +++++
 .../lib/devtool/auto-upgrade-helper/gitrecipe.py   |  98 +++++
 scripts/lib/devtool/auto-upgrade-helper/recipe.py  | 428 +++++++++++++++++++++
 .../lib/devtool/auto-upgrade-helper/svnrecipe.py   |  28 ++
 .../devtool/auto-upgrade-helper/upgradehelper.py   | 150 ++++++++
 scripts/lib/devtool/standard.py                    | 119 ++++++
 8 files changed, 1113 insertions(+)
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/bitbake.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/errors.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/git.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/gitrecipe.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/recipe.py
 create mode 100644 scripts/lib/devtool/auto-upgrade-helper/svnrecipe.py
 create mode 100755 scripts/lib/devtool/auto-upgrade-helper/upgradehelper.py

diff --git a/scripts/lib/devtool/auto-upgrade-helper/bitbake.py b/scripts/lib/devtool/auto-upgrade-helper/bitbake.py
new file mode 100644
index 0000000..5404807
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/bitbake.py
@@ -0,0 +1,102 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+import os
+import logging
+import sys
+from errors import *
+
+logger = logging.getLogger('devtool')
+
+for path in os.environ["PATH"].split(':'):
+    if os.path.exists(path) and "bitbake" in os.listdir(path):
+        sys.path.insert(0, os.path.join(path, "../lib"))
+        import bb
+
+class Bitbake(object):
+    def __init__(self, build_dir):
+        self.build_dir = build_dir
+        self.log_dir = None
+        super(Bitbake, self).__init__()
+
+    def _cmd(self, recipe, options=None, env_var=None):
+        cmd = ""
+        if env_var is not None:
+            cmd += env_var + " "
+        cmd += "bitbake "
+        if options is not None:
+            cmd += options + " "
+
+        cmd += recipe
+
+        os.chdir(self.build_dir)
+
+        try:
+            stdout, stderr = bb.process.run(cmd)
+        except bb.process.ExecutionError as e:
+            logger.debug("%s returned:\n%s" % (cmd, e.__str__()))
+
+            if self.log_dir is not None and os.path.exists(self.log_dir):
+                with open(os.path.join(self.log_dir, "bitbake_log.txt"), "w+") as log:
+                    log.write(e.stdout)
+
+            raise Error("\'" + cmd + "\' failed", e.stdout, e.stderr)
+
+        return stdout
+
+    def set_log_dir(self, dir):
+        self.log_dir = dir
+
+    def get_stdout_log(self):
+        return os.path.join(self.log_dir, "bitbake_log.txt")
+
+    def env(self, recipe):
+        return self._cmd(recipe, "-e")
+
+    def fetch(self, recipe):
+        return self._cmd(recipe, "-c fetch")
+
+    def patch(self, recipe):
+        return self._cmd(recipe, "-c patch")
+
+    def unpack(self, recipe):
+        return self._cmd(recipe, "-c unpack")
+
+    def checkpkg(self, recipe):
+        if recipe == "universe":
+            return self._cmd(recipe, "-c checkpkg -k")
+        else:
+            return self._cmd(recipe, "-c checkpkg")
+
+    def cleanall(self, recipe):
+        return self._cmd(recipe, "-c cleanall")
+
+    def cleansstate(self, recipe):
+        return self._cmd(recipe, "-c cleansstate")
+
+    def complete(self, recipe, machine):
+        return self._cmd(recipe, env_var="MACHINE=" + machine)
+
+    def dependency_graph(self, package_list):
+        return self._cmd(package_list, "-g")
diff --git a/scripts/lib/devtool/auto-upgrade-helper/errors.py b/scripts/lib/devtool/auto-upgrade-helper/errors.py
new file mode 100644
index 0000000..7194944
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/errors.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+class Error(Exception):
+    def __init__(self, message=None, stdout=None, stderr=None):
+        self.message = message
+        self.stdout = stdout
+        self.stderr = stderr
+
+    def __str__(self):
+        return "Failed(other errors)"
+
+class MaintainerError(Error):
+    """ Class for group error that can be sent to Maintainer's """
+    def __init__(self, message=None, stdout=None, stderr=None):
+        super(MaintainerError, self).__init__(message, stdout, stderr)
+
+class FetchError(Error):
+    def __init__(self):
+        super(FetchError, self).__init__("do_fetch failed")
+
+    def __str__(self):
+        return "Failed(do_fetch)"
+
+class PatchError(MaintainerError):
+    def __init__(self):
+        super(PatchError, self).__init__("do_patch failed")
+
+    def __str__(self):
+        return "Failed(do_patch)"
+
+class ConfigureError(MaintainerError):
+    def __init__(self):
+        super(ConfigureError, self).__init__("do_configure failed")
+
+    def __str__(self):
+        return "Failed(do_configure)"
+
+class CompilationError(MaintainerError):
+    def __init__(self):
+        super(CompilationError, self).__init__("do_compile failed")
+
+    def __str__(self):
+        return "Failed(do_compile)"
+
+class LicenseError(MaintainerError):
+    def __init__(self):
+        super(LicenseError, self).__init__("license checksum does not match")
+
+    def __str__(self):
+        return "Failed(license issue)"
+
+class UnsupportedProtocolError(Error):
+    def __init__(self):
+        super(UnsupportedProtocolError, self).__init__("SRC_URI protocol not supported")
+
+    def __str__(self):
+        return "Failed(Unsupported protocol)"
+
+class UpgradeNotNeededError(Error):
+    def __init__(self):
+        super(UpgradeNotNeededError, self).__init__("Recipe already up to date")
+
+    def __str__(self):
+        return "Failed(up to date)"
+
diff --git a/scripts/lib/devtool/auto-upgrade-helper/git.py b/scripts/lib/devtool/auto-upgrade-helper/git.py
new file mode 100644
index 0000000..3eebac3
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/git.py
@@ -0,0 +1,101 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+import os
+import logging as log
+from logging import debug as D
+from bitbake import *
+
+class Git(object):
+    def __init__(self, dir):
+        self.repo_dir = dir
+        super(Git, self).__init__()
+
+    def _cmd(self, operation):
+        os.chdir(self.repo_dir)
+
+        cmd = "git " + operation
+        try:
+            stdout, stderr = bb.process.run(cmd)
+        except bb.process.ExecutionError as e:
+            D("%s returned:\n%s" % (cmd, e.__str__()))
+            raise Error("The following git command failed: " + operation,
+                        e.stdout, e.stderr)
+
+        return stdout
+
+    def mv(self, src, dest):
+        return self._cmd("mv -f " + src + " " + dest)
+
+    def stash(self):
+        return self._cmd("stash")
+
+    def commit(self, commit_message, author=None):
+        if author is None:
+            return self._cmd("commit -a -s -m \"" + commit_message + "\"")
+        else:
+            return self._cmd("commit -a --author=\"" + author + "\" -m \"" + commit_message + "\"")
+
+    def create_patch(self, out_dir):
+        return self._cmd("format-patch -M10 -1 -o " + out_dir)
+
+    def status(self):
+        return self._cmd("status --porcelain")
+
+    def checkout_branch(self, branch_name):
+        return self._cmd("checkout " + branch_name)
+
+    def create_branch(self, branch_name):
+        return self._cmd("checkout -b " + branch_name)
+
+    def delete_branch(self, branch_name):
+        return self._cmd("branch -D " + branch_name)
+
+    def pull(self):
+        return self._cmd("pull")
+
+    def reset_hard(self, no_of_patches=0):
+        if no_of_patches == 0:
+            return self._cmd("reset --hard HEAD")
+        else:
+            return self._cmd("reset --hard HEAD~" + str(no_of_patches))
+
+    def reset_soft(self, no_of_patches):
+        return self._cmd("reset --soft HEAD~" + str(no_of_patches))
+
+    def clean_untracked(self):
+        return self._cmd("clean -fd")
+
+    def last_commit(self, branch_name):
+        return self._cmd("log --pretty=format:\"%H\" -1" + branch_name)
+
+    def ls_remote(self, repo_url=None, options=None, refs=None):
+        cmd = "ls-remote"
+        if options is not None:
+            cmd += " " + options
+        if repo_url is not None:
+            cmd += " " + repo_url
+        if refs is not None:
+            cmd += " " + refs
+        return self._cmd(cmd)
diff --git a/scripts/lib/devtool/auto-upgrade-helper/gitrecipe.py b/scripts/lib/devtool/auto-upgrade-helper/gitrecipe.py
new file mode 100644
index 0000000..2410118
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/gitrecipe.py
@@ -0,0 +1,98 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+from recipe import *
+import logging
+from git import Git
+
+logger = logging.getLogger('devtool')
+
+class GitRecipe(Recipe):
+    def _extract_tag_from_ver(self, ver):
+        m = re.match("(.*)\+.*\+.*", ver)
+        if m is not None:
+            return m.group(1)
+
+        # allow errors in the reporting system
+        return ver
+
+    def _get_tag_sha1(self, new_tag):
+        m = re.match(".*(git://[^ ;]*).*", self.env['SRC_URI'])
+        if m is None:
+            raise Error("could not extract repo url from SRC_URI")
+
+        repo_url = m.group(1)
+        self.git = Git(self.recipe_dir)
+        tags = self.git.ls_remote(repo_url, "--tags")
+
+        # Try to find tag ending with ^{}
+        for tag in tags.split('\n'):
+            if tag.endswith(new_tag + "^{}"):
+                return tag.split()[0]
+
+        # If not found, try to find simple tag
+        for tag in tags.split('\n'):
+            if tag.endswith(new_tag):
+                return tag.split()[0]
+
+        return None
+
+    def rename(self):
+        old_git_tag = self._extract_tag_from_ver(self.env['PKGV'])
+        new_git_tag = self._extract_tag_from_ver(self.new_ver)
+
+        if new_git_tag == old_git_tag:
+            raise UpgradeNotNeededError()
+
+        super(GitRecipe, self).rename()
+
+        tag_sha1 = self._get_tag_sha1(new_git_tag)
+        if tag_sha1 is None:
+            raise Error("could not extract tag sha1")
+
+        for f in os.listdir(self.workdir):
+            full_path_f = os.path.join(self.workdir, f)
+            if os.path.isfile(full_path_f) and f.find(self.env['PN']) == 0:
+                with open(full_path_f + ".tmp", "w+") as temp_recipe:
+                    with open(full_path_f) as recipe:
+                        for line in recipe:
+                            m1 = re.match("^SRCREV *= *\".*\"", line)
+                            m2 = re.match("PV *= *\"[^\+]*(.*)\"", line)
+                            if m1 is not None:
+                                temp_recipe.write("SRCREV = \"" + tag_sha1 + "\"\n")
+                            elif m2 is not None:
+                                temp_recipe.write("PV = \"" + new_git_tag + m2.group(1) + "\"\n")
+                            else:
+                                temp_recipe.write(line)
+
+                os.rename(full_path_f + ".tmp", full_path_f)
+
+        self.env['PKGV'] = old_git_tag
+        self.new_ver = new_git_tag
+
+
+
+    def fetch(self):
+        pass
+
diff --git a/scripts/lib/devtool/auto-upgrade-helper/recipe.py b/scripts/lib/devtool/auto-upgrade-helper/recipe.py
new file mode 100644
index 0000000..7cb4bdd
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/recipe.py
@@ -0,0 +1,428 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+import os
+import re
+import sys
+import logging as log
+import logging
+from errors import *
+from bitbake import *
+
+logger = logging.getLogger('devtool')
+
+class Recipe(object):
+    def __init__(self, env, new_ver, interactive, workdir, recipe_dir, bitbake):
+        self.env = env
+        self.new_ver = new_ver
+        self.interactive = interactive
+        self.workdir = workdir
+        self.recipe_dir = recipe_dir
+        self.bb = bitbake
+        self.bb.set_log_dir(workdir)
+
+        self.retried_recipes = set()
+        self.license_diff_file = None
+
+        self.recipes_renamed = False
+        self.checksums_changed = False
+
+        self.removed_patches = False
+
+        self.suffixes = [
+            "tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "tar.lz4", "bz2",
+            "lz4", "orig.tar.gz", "src.tar.gz", "src.rpm", "src.tgz",
+            "svnr\d+.tar.bz2", "stable.tar.gz", "src.rpm"]
+        self.suffix_index = 0
+        self.old_env = None
+
+        self.commit_msg = self.env['PN'] + ": upgrade to " + self.new_ver + "\n\n"
+        self.rm_patches_msg = "\n\nRemoved the following patch(es):\n"
+
+        super(Recipe, self).__init__()
+
+    def update_env(self, env):
+        self.env = env
+
+    def rename(self):
+
+        # Check if old and new versions are the same
+        if self.env['PV'] == self.new_ver:
+            raise Error("Current version is already %s" % self.new_ver)
+
+        # Copy recipe related files/folders
+        srcpaths= [self.env['FILE'],
+                   os.path.join(self.recipe_dir, self.env['PN'].replace('-native','')),
+                   os.path.join(self.recipe_dir, self.env['PN']),
+                   os.path.join(self.recipe_dir, self.env['PN'] + "-" + self.env['PV']),
+                   os.path.join(self.recipe_dir, 'files')]
+        for srcpath in srcpaths:
+            if os.path.exists(srcpath):
+                if os.path.isdir(srcpath):
+                    try:
+                        cmd = "cp -r %s %s" % (srcpath, self.workdir)
+                        bb.process.run(cmd)
+                    except bb.process.ExecutionError as e:
+                        raise Error("Command %s returned:\n%s" % (e.command, e.stdout))
+                else:
+                    try:
+                        cmd = "cp %s %s" % (srcpath, self.workdir)
+                        bb.process.run(cmd)
+                    except bb.process.ExecutionError as e:
+                        raise Error("Command %s returned:\n%s" % (e.command, e.stdout))
+
+        # Copy all inc files
+        for path in os.listdir(self.recipe_dir):
+            full_path = os.path.join(self.recipe_dir, path)
+            if os.path.isfile(full_path) and path.find('.inc') != -1:
+                try:
+                    cmd = "cp %s %s" % (full_path, self.workdir)
+                    stdout, _ = bb.process.run(cmd)
+                except bb.process.ExecutionError as e:
+                    raise Error("Command %s returned:\n%s" % (e.command, e.stdout))
+
+        # Rename recipes, this time on the workspace
+        for path in os.listdir(self.workdir):
+            full_path = os.path.join(self.workdir, path)
+            if os.path.isfile(full_path) \
+              and path.find(self.env['PN']) == 0 \
+              and path.find(self.env['PKGV']) != -1:
+                new_path = re.sub(re.escape(self.env['PKGV']), self.new_ver, path)
+                try:
+                    cmd = "mv %s %s" % (os.path.join(self.workdir, path),
+                                        os.path.join(self.workdir, new_path))
+                    bb.process.run(cmd)
+                except bb.process.ExecutionError as e:
+                    raise Error("Command %s returned:\n%s" % (e.command, e.stdout))
+
+        # Rename folders on the workspace
+        src_dir  = os.path.join(self.workdir, self.env['PN'] + "-" + self.env['PV'])
+        dest_dir = os.path.join(self.workdir, self.env['PN'] + "-" + self.new_ver)
+        if os.path.exists(src_dir) and os.path.isdir(src_dir):
+            try:
+                cmd = "mv %s %s" % (src_dir, dest_dir)
+                bb.process.run(cmd)
+            except bb.process.ExecutionError as e:
+                raise Error("Command %s returned:\n%s" % (e.command, e.stdout))
+
+        self.recipes_renamed = True
+
+        # since we did some renaming, backup the current environment
+        self.old_env = self.env
+
+    def _change_recipe_checksums(self, fetch_log):
+        sums = {}
+
+        with open(os.path.realpath(fetch_log)) as log:
+            for line in log:
+                m = None
+                key = None
+                m1 = re.match("^SRC_URI\[(.*)md5sum\].*", line)
+                m2 = re.match("^SRC_URI\[(.*)sha256sum\].*", line)
+                if m1:
+                    m = m1
+                    key = "md5sum"
+                elif m2:
+                    m = m2
+                    key = "sha256sum"
+
+                if m:
+                    name = m.group(1)
+                    sum_line = m.group(0) + '\n'
+                    if name not in sums:
+                        sums[name] = {}
+                    sums[name][key] = sum_line;
+
+        if len(sums) == 0:
+            raise FetchError()
+
+        logger.info("Update recipe checksums ...")
+        # checksums are usually in the main recipe but they can also be in inc
+        # files... Go through the recipes/inc files until we find them
+        for f in os.listdir(self.workdir):
+            full_path_f = os.path.join(self.workdir, f)
+            if os.path.isfile(full_path_f) and \
+                    ((f.find(self.env['PN']) == 0 and f.find(self.env['PKGV']) != -1 and
+                      f.find(".bb") != -1) or
+                     (f.find(self.env['PN']) == 0 and f.find(".inc") != -1)):
+                with open(full_path_f + ".tmp", "w+") as temp_recipe:
+                    with open(full_path_f) as recipe:
+                        for line in recipe:
+                            for name in sums:
+                                m1 = re.match("^SRC_URI\["+ name + "md5sum\].*", line)
+                                m2 = re.match("^SRC_URI\["+ name + "sha256sum\].*", line)
+                                if m1:
+                                    temp_recipe.write(sums[name]["md5sum"])
+                                elif m2:
+                                    temp_recipe.write(sums[name]["sha256sum"])
+                                else:
+                                    temp_recipe.write(line)
+
+                os.rename(full_path_f + ".tmp", full_path_f)
+        
+        self.checksums_changed = True
+
+    def _is_uri_failure(self, fetch_log):
+        uri_failure = None
+        checksum_failure = None
+        with open(os.path.realpath(fetch_log)) as log:
+            for line in log:
+                if not uri_failure:
+                    uri_failure = re.match(".*Fetcher failure for URL.*", line)
+                if not checksum_failure:
+                    checksum_failure = re.match(".*Checksum mismatch.*", line)
+        if uri_failure and not checksum_failure:
+            return True
+        else:
+            return False
+
+
+    def _change_source_suffix(self, new_suffix):
+        # Will change the extension of the archive from the SRC_URI
+        for f in os.listdir(self.recipe_dir):
+            full_path_f = os.path.join(self.recipe_dir, f)
+            if os.path.isfile(full_path_f) and \
+                    ((f.find(self.env['PN']) == 0 and f.find(self.env['PKGV']) != -1 and
+                      f.find(".bb") != -1) or
+                     (f.find(self.env['PN']) == 0 and f.find(".inc") != -1)):
+                with open(full_path_f + ".tmp", "w+") as temp_recipe:
+                    with open(full_path_f) as recipe:
+                        source_found = False
+                        for line in recipe:
+                            # source on first line
+                            m1 = re.match("^SRC_URI.*\${PV}\.(.*)[\" \\\\].*", line)
+                            # SRC_URI alone on the first line
+                            m2 = re.match("^SRC_URI.*", line)
+                            # source on second line
+                            m3 = re.match(".*\${PV}\.(.*)[\" \\\\].*", line)
+                            if m1:
+                                old_suffix = m1.group(1)
+                                line = line.replace(old_suffix, new_suffix+" ")
+                            if m2 and not m1:
+                                source_found = True
+                            if m3 and source_found:
+                                old_suffix = m3.group(1)
+                                line = line.replace(old_suffix, new_suffix+" ")
+                                source_found = False
+
+                            temp_recipe.write(line)
+                os.rename(full_path_f + ".tmp", full_path_f)
+
+    def _get_failed_recipes(self, output):
+        failed_tasks = dict()
+        machine = None
+
+        for line in output.split("\n"):
+            machine_match = re.match("MACHINE[\t ]+= *\"(.*)\"$", line)
+            task_log_match = re.match("ERROR: Logfile of failure stored in: (.*/([^/]*)/[^/]*/temp/log\.(.*)\.[0-9]*)", line)
+            # For some reason do_package is reported differently
+            qa_issue_match = re.match("ERROR: QA Issue: ([^ :]*): (.*) not shipped", line)
+
+            if task_log_match:
+                failed_tasks[task_log_match.group(2)] = (task_log_match.group(3), task_log_match.group(1))
+            elif qa_issue_match:
+                # Improvise path to log file
+                failed_tasks[qa_issue_match.group(1)] = ("do_package", self.bb.get_stdout_log())
+            elif machine_match:
+                machine = machine_match.group(1)
+
+        # we didn't detect any failed tasks? then something else is wrong
+        if len(failed_tasks) == 0:
+            raise Error("could not detect failed task")
+
+        return (machine, failed_tasks)
+
+    def _is_incompatible_host(self, output):
+        for line in output.split("\n"):
+            incomp_host = re.match("ERROR: " + self.env['PN'] + " was skipped: incompatible with host (.*) \(.*$", line)
+
+            if incomp_host is not None:
+                return True
+
+        return False
+
+    def _add_not_shipped(self, package_log):
+        files_not_shipped = False
+        files = []
+        occurences = []
+        prefixes = {
+          "/usr"            : "prefix",
+          "/bin"            : "base_bindir",
+          "/sbin"           : "base_sbindir",
+          "/lib"            : "base_libdir",
+          "/usr/share"      : "datadir",
+          "/etc"            : "sysconfdir",
+          "/var"            : "localstatedir",
+          "/usr/share/info" : "infodir",
+          "/usr/share/man"  : "mandir",
+          "/usr/share/doc"  : "docdir",
+          "/srv"            : "servicedir",
+          "/usr/bin"        : "bindir",
+          "/usr/sbin"       : "sbindir",
+          "/usr/libexec"    : "libexecdir",
+          "/usr/lib"        : "libdir",
+          "/usr/include"    : "includedir",
+          "/usr/lib/opie"   : "palmtopdir",
+          "/usr/lib/opie"   : "palmqtdir",
+        }
+
+        logger.info("Add new files in recipe ...")
+        with open(package_log) as log:
+            for line in log:
+                if re.match(".*Files/directories were installed but not shipped.*", line):
+                    files_not_shipped = True
+                # Extract path
+                line = line.strip()
+                if line:
+                    line = line.split()[0]
+                if files_not_shipped and os.path.isabs(line):
+                    # Count occurences for globbing
+                    path_exists = False
+                    for i in range(0, len(files)):
+                        if line.find(files[i]) == 0:
+                            path_exists = True
+                            occurences[i] += 1
+                            break
+                    if not path_exists:
+                        files.append(line)
+                        occurences.append(1)
+
+        for i in range(0, len(files)):
+            # Change paths to globbing expressions where is the case
+            if occurences[i] > 1:
+                files[i] += "/*"
+            largest_prefix = ""
+            # Substitute prefix
+            for prefix in prefixes:
+                if files[i].find(prefix) == 0 and len(prefix) > len(largest_prefix):
+                    largest_prefix = prefix
+            if largest_prefix:
+                replacement = "${" + prefixes[largest_prefix] + "}"
+                files[i] = files[i].replace(largest_prefix, replacement)
+
+        recipe_files = [
+            os.path.join(self.recipe_dir, self.env['PN'] + ".inc"),
+            self.env['FILE']]
+
+        # Append the new files
+        for recipe_filename in recipe_files:
+            if os.path.isfile(recipe_filename):
+                with open(recipe_filename + ".tmp", "w+") as temp_recipe:
+                    with open(recipe_filename) as recipe:
+                        files_clause = False
+                        for line in recipe:
+                            if re.match("^FILES_\${PN}[ +=].*", line):
+                                files_clause = True
+                                temp_recipe.write(line)
+                                continue
+                            # Get front spacing
+                            if files_clause:
+                                front_spacing = re.sub("[^ \t]", "", line)
+                            # Append once the last line has of FILES has been reached
+                            if re.match(".*\".*", line) and files_clause:
+                                files_clause = False
+                                line = line.replace("\"", "")
+                                line = line.rstrip()
+                                front_spacing = re.sub("[^ \t]", "", line)
+                                # Do not write an empty line
+                                if line.strip():
+                                    temp_recipe.write(line + " \\\n")
+                                # Add spacing in case there was none
+                                if len(front_spacing) == 0:
+                                    front_spacing = " " * 8
+                                # Write to file
+                                for i in range(len(files)-1):
+                                    line = front_spacing + files[i] + " \\\n"
+                                    temp_recipe.write(line)
+
+                                line = front_spacing + files[len(files) - 1] + "\"\n"
+                                temp_recipe.write(line)
+                                continue
+
+                            temp_recipe.write(line)
+
+                os.rename(recipe_filename + ".tmp", recipe_filename)
+
+    def unpack(self):
+        self.bb.unpack(self.env['PN'])
+
+    def fetch(self):
+        try:
+            self.bb.fetch(self.env['PN'])
+        except Error as e:
+            machine, failed_recipes = self._get_failed_recipes(e.stdout)
+            if not self.env['PN'] in failed_recipes:
+                raise Error("unknown error occured during fetch")
+
+            fetch_log = failed_recipes[self.env['PN']][1]
+            if self.suffix_index < len(self.suffixes) and self._is_uri_failure(fetch_log):
+                logger.info("Trying new SRC_URI suffix: %s ..." % self.suffixes[self.suffix_index])
+                self._change_source_suffix(self.suffixes[self.suffix_index])
+                self.suffix_index += 1
+                self.fetch()
+            if not self._is_uri_failure(fetch_log):
+                if not self.checksums_changed:
+                    self._change_recipe_checksums(fetch_log)
+                    return
+                else:
+                    raise FetchError()
+
+                if self.recipes_renamed and not self.checksums_changed:
+                    raise Error("fetch succeeded without changing checksums")
+
+            elif self.suffix_index == len(self.suffixes):
+                # Every suffix tried without success
+                raise FetchError()                
+
+    def patch(self):
+        self.bb.patch(self.env['PN'])
+
+    def cleanall(self):
+        self.bb.cleanall(self.env['PN'])
+
+    def _clean_failed_recipes(self, failed_recipes):
+        already_retried = False
+        for recipe in failed_recipes:
+            if recipe in self.retried_recipes:
+                # we already retried, we'd best leave it to a human to handle
+                # it :)
+                already_retried = True
+            # put the recipe in the retried list
+            self.retried_recipes.add(recipe)
+
+        if already_retried:
+            return False
+        else:
+            logger.info("The following recipe(s): %s, failed.  "
+              "Doing a 'cleansstate' and then retry ..." %
+              (' '.join(failed_recipes.keys())))
+
+            self.bb.cleansstate(' '.join(failed_recipes.keys()))
+            return True
+
+    def compile(self, machine):
+        self.bb.complete(self.env['PN'], machine)
+
+    def get_recipe_path(self):
+        return self.env['FILE']
diff --git a/scripts/lib/devtool/auto-upgrade-helper/svnrecipe.py b/scripts/lib/devtool/auto-upgrade-helper/svnrecipe.py
new file mode 100644
index 0000000..7d8ad16
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/svnrecipe.py
@@ -0,0 +1,28 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+from recipe import Recipe
+
+class SvnRecipe(Recipe):
+    pass
diff --git a/scripts/lib/devtool/auto-upgrade-helper/upgradehelper.py b/scripts/lib/devtool/auto-upgrade-helper/upgradehelper.py
new file mode 100755
index 0000000..067d13c
--- /dev/null
+++ b/scripts/lib/devtool/auto-upgrade-helper/upgradehelper.py
@@ -0,0 +1,150 @@
+#!/usr/bin/env python
+# vim: set ts=4 sw=4 et:
+#
+# Copyright (c) 2013 - 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License
+# as published by the Free Software Foundation; either version 2
+# of the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+#
+# DESCRIPTION
+#  This is a recipe upgrade helper script for the Yocto Project.
+#  Use 'upgrade-helper.py -h' for more help.
+#
+# AUTHORS
+# Laurentiu Palcu   <laurentiu.palcu@intel.com>
+# Marius Avram      <marius.avram@intel.com>
+#
+
+import argparse
+import os
+import logging
+import re
+import signal
+import sys
+import ConfigParser as cp
+from datetime import datetime
+from datetime import date
+import shutil
+from errors import *
+from bitbake import Bitbake
+from recipe import Recipe
+from gitrecipe import GitRecipe
+from svnrecipe import SvnRecipe
+
+
+logger = logging.getLogger('devtool')
+
+def get_build_dir():
+    return os.getenv('BUILDDIR')
+
+class Updater(object):
+    """Upgrades a recipe (file/folder/checksum update) and place it into the workspace"""
+    def __init__(self, workspace):
+
+        self.uh_dir = os.path.join(workspace)
+        if not os.path.exists(self.uh_dir):
+            os.mkdir(self.uh_dir)
+
+        self.uh_work_dir = os.path.join(self.uh_dir, "recipes")
+        if not os.path.exists(self.uh_work_dir):
+            os.mkdir(self.uh_work_dir)
+
+        self.bb = Bitbake(get_build_dir())
+        self.git = None
+
+        self.upgrade_steps = [
+            (self._create_workdir, "Cloning recipe directory into the workspace"),
+            (self._get_env, None),
+            (self._detect_recipe_type, None),
+            (self._rename, "Copying recipe directory into workspace and renaming"),
+            (self._cleanall, "Clean all"),
+            (self._fetch, None),
+        ]
+
+    def _create_workdir(self):
+        """Creates a specific folder inside the working directory"""
+        self.workdir = os.path.join(self.uh_work_dir, self.pn)
+        if not os.path.exists(self.workdir):
+            os.mkdir(self.workdir)
+        else:
+            for f in os.listdir(self.workdir):
+                os.remove(os.path.join(self.workdir, f))
+
+    def remove_workdir(self):
+        if os.path.exists(self.workdir):
+            shutil.rmtree(self.workdir)
+
+    def _get_env(self):
+        """Store the bitbake recipe environment into a dictionary"""
+        stdout = self.bb.env(self.pn)
+
+        assignment = re.compile("^([^ \t=]*)=(.*)")
+        bb_env = dict()
+        for line in stdout.split('\n'):
+            m = assignment.match(line)
+            if m:
+                if m.group(1) in bb_env:
+                    continue
+
+                bb_env[m.group(1)] = m.group(2).strip("\"")
+
+        self.env = bb_env
+        self.recipe_dir = os.path.dirname(self.env['FILE'])
+
+    def _detect_recipe_type(self):
+        """Detects the type of upstream repository"""
+        if self.env['SRC_URI'].find("ftp://") != -1 or  \
+                self.env['SRC_URI'].find("http://") != -1 or \
+                self.env['SRC_URI'].find("https://") != -1:
+            recipe = Recipe
+        elif self.env['SRC_URI'].find("git://") != -1:
+            recipe = GitRecipe
+        else:
+            raise UnsupportedProtocolError
+
+        self.recipe = recipe(self.env, self.new_ver, False, self.workdir,
+                             self.recipe_dir, self.bb)
+
+    def _rename(self):
+        """Copy the recipe directory into workspace and do proper file renaming and instrumentation"""
+        self.recipe.rename()
+
+        # Higher recipe, so fetch new environment
+        self._get_env()
+
+        self.recipe.update_env(self.env)
+
+    def _cleanall(self):
+        self.recipe.cleanall()
+
+    def _fetch(self):
+        self.recipe.fetch()
+
+    def run(self, pn, new_ver):
+        """ Runs all steps """
+        self.pn = pn
+        self.new_ver = new_ver
+        self.maintainer = None
+        self.recipe = None
+
+        try:
+            logger.info("Upgrading to %s" % self.new_ver)
+            for step, msg in self.upgrade_steps:
+                if msg is not None:
+                    logger.info("%s" % msg)
+                step()
+        except Error as e:
+            self.remove_workdir()
+            logger.error("%s" % e.message)
+            raise Error("Upgrade FAILED! Logs and/or file diffs are available in %s" % self.workdir)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ea21877..e42d5a6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -27,6 +27,9 @@ import scriptutils
 import errno
 from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
 
+sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'auto-upgrade-helper'))
+import upgradehelper as auh
+
 logger = logging.getLogger('devtool')
 
 
@@ -859,6 +862,108 @@ def build(args, config, basepath, workspace):
 
     return 0
 
+def upgrade(args, config, basepath, workspace):
+    """Entry point for the devtool 'upgrade' subcommand"""
+    if args.recipename in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" %  args.recipename)
+
+
+    if not args.extract and not os.path.isdir(args.srctree):
+        raise DevtoolError("directory %s does not exist or not a directory "
+                           "(specify -x to extract source from recipe)" %
+                           args.srctree)
+    updater = auh.Updater(config.workspace_path)
+
+    try:
+        updater.run(args.recipename, args.version)
+    except Exception as e:
+        raise DevtoolError(e.message)
+        
+    # Now that the upgrade recipe is on workspace, what it follows is the
+    # the same logic as the 'modify' feature
+
+    tinfoil = setup_tinfoil()
+
+    rd = _parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+    recipefile = rd.getVar('FILE', True)
+
+    _check_compatible_recipe(args.recipename, rd)
+
+    initial_rev = None
+    commits = []
+    srctree = os.path.abspath(args.srctree)
+    if args.extract:
+        initial_rev = _extract_source(args.srctree, False, args.branch, rd)
+        if not initial_rev:
+            return 1
+        # Get list of commits since this revision
+        (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
+        commits = stdout.split()
+    else:
+        if os.path.exists(os.path.join(args.srctree, '.git')):
+            # Check if it's a tree previously extracted by us
+            try:
+                (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=args.srctree)
+            except bb.process.ExecutionError:
+                stdout = ''
+            for line in stdout.splitlines():
+                if line.startswith('*'):
+                    (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=args.srctree)
+                    initial_rev = stdout.rstrip()
+            if not initial_rev:
+                # Otherwise, just grab the head revision
+                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=args.srctree)
+                initial_rev = stdout.rstrip()
+
+    # Check that recipe isn't using a shared workdir
+    s = os.path.abspath(rd.getVar('S', True))
+    workdir = os.path.abspath(rd.getVar('WORKDIR', True))
+    if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+        # Handle if S is set to a subdirectory of the source
+        srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+        srctree = os.path.join(srctree, srcsubdir)
+
+    appendpath = os.path.join(config.workspace_path, 'appends')
+    if not os.path.exists(appendpath):
+        os.makedirs(appendpath)
+
+    appendname = os.path.splitext(os.path.basename(recipefile))[0]
+    if args.wildcard:
+        appendname = re.sub(r'_.*', '_%', appendname)
+    appendfile = os.path.join(appendpath, appendname + '.bbappend')
+    with open(appendfile, 'w') as f:
+        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
+        f.write('inherit externalsrc\n')
+        f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
+        f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
+
+        b_is_s = True
+        if args.no_same_dir:
+            logger.info('using separate build directory since --no-same-dir specified')
+            b_is_s = False
+        elif args.same_dir:
+            logger.info('using source tree as build directory since --same-dir specified')
+        elif bb.data.inherits_class('autotools-brokensep', rd):
+            logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+        elif rd.getVar('B', True) == s:
+            logger.info('using source tree as build directory since that is the default for this recipe')
+        else:
+            b_is_s = False
+        if b_is_s:
+            f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
+
+        if initial_rev:
+            f.write('\n# initial_rev: %s\n' % initial_rev)
+            for commit in commits:
+                f.write('# commit: %s\n' % commit)
+
+    _add_md5(config, args.recipename, appendfile)
+
+    logger.info('Recipe %s now set up to build from %s' % (args.recipename, srctree))
+
+    return 0
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
@@ -921,3 +1026,17 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
+
+    parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade a recipe',
+                                           description='Upgrades a recipe',
+                                           formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_upgrade.add_argument("recipename", help="recipe to be upgraded")
+    parser_upgrade.add_argument('srctree', help='Path to external source tree')
+    parser_upgrade.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
+    parser_upgrade.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
+    group = parser_upgrade.add_mutually_exclusive_group()
+    group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
+    parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
+    parser_upgrade.add_argument("--version", "-V", help="version to upgrade the recipe to")
+    parser_upgrade.set_defaults(func=upgrade)
-- 
1.8.4.5


