Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1U1FXq-00066B-3W
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 13:16:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r118q9iY014998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 00:52:09 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 1 Feb 2013 00:52:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 16:55:30 +0800
Message-ID: <f7f964b36f80b326e61ed2194400f63f3a60de1d.1359687579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1359687579.git.liezhi.yang@windriver.com>
References: <cover.1359687579.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] bitbake-whatchanged: print what is about to happen
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 12:16:55 -0000
Content-Type: text/plain

* Contents:
  - Summary
  - Usage
  - Implementation summary
  - Output
  - TODO

* Summary:
  This is used for printing what is about to happen between the current and last
  builds, for example:

  $ bitbake core-image-sato
  # Edit some recipes
  $ bitbake-whatchanged core-image-sato

  The changes will be printed.

* Usage:
  bitbake-whatchanged [[opts] recipe]

* Implementation summary:
  - Use the "STAMPS_DIR=<path> bitbake -S recipe" to generate the new
    stamps, compare these stamps to the one in the old stamps dir (tmp/stamps),
    so we will get what are changed.

  - When the "-v" (verbose) is not specified:
    > Figure out the newly added tasks
    > Figure out the PV (including PE) and PR changed tasks
    > The left tasks are the ones that the "Dependencies" changed tasks

  - When "-v" is specified:
    > Figure out the newly added tasks
    > Use bb.siggen.compare_sigfiles to figure out the details

* Output, for example (core-image-sato with different git tags)
  and with recipes upgraded):
  - without "-v":
    Figuring out the STAMPS_DIR ...
    Generating the new stamps ... (need several minutes)
    === Newly added tasks: (5 tasks)
      core-image-sato: do_configure do_populate_lic do_install do_rootfs do_compile
      # Note: This is because the "bitbake -S" always generate the sigdata for
      # do_compile, do_rootfs and other task, we may need fix this from "bitbake -S"

    === PV changed: (130 tasks)
      alsa-utils: 1.0.25 -> 1.0.26
      cross-localedef-native: 2.16 -> 2.17
      eglibc-initial: 2.16 -> 2.17
      [snip]

    === Dependencies changed: (3593 tasks)
      busybox: do_package do_package_write do_build do_packagedata do_populate_sysroot do_install do_compile do_package_write_rpm do_configure do_populate_lic
      atk-native: do_compile do_package_write_rpm do_package do_configure do_populate_sysroot do_install do_populate_lic do_patch do_packagedata do_build do_package_write do_unpack
      [snip]

    === Summary: (3728 changed, 1134 unchanged)
    Newly added: 5
    PV changed: 130
    PR changed: 0
    Dependencies changed: 3593

    Removing the newly generated stamps dir ...

  - with "-v":
    === Newly added tasks: (5 tasks)
      core-image-sato: do_configure do_populate_lic do_install do_rootfs do_compile

    === The verbose changes of glib-2.0-native.do_do_install:
    Hash for dependent task virtual:native:glib-2.0_2.34.3.bb.do_compile changed from bab8b8dd95be1b83dcec93f755b1812b to 70f746df7809acaa52de204b0685abb4

    [snip]

    === Summary: (3728 changed, 1134 unchanged)
    Newly added: 5
    Dependencies changed: 3723

    Removing the newly generated stamps dir ...

* TODO
  - It seems that the "bitbake -S core-image-sato" has bugs, it would always
    report errors, but doesn't fatal errors

  - The gcc-cross' stamps are in tmp/stamps/work-shared, but the
    "bitbake -S" doesn't put the stamps in work-shared.

  - The "bitbake -S" always generates the sigdata for image recipe's do_compile,
    do_install and other tasks, we may need fix this from "bitbake -S".

  - Print the ones which can be installed from the sstate.

[YOCTO #1659]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/bitbake-whatchanged | 339 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 339 insertions(+)
 create mode 100755 scripts/bitbake-whatchanged

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
new file mode 100755
index 0000000..2977a3b
--- /dev/null
+++ b/scripts/bitbake-whatchanged
@@ -0,0 +1,339 @@
+#!/usr/bin/env python
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+
+# Copyright (c) 2013 Wind River Systems, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+from __future__ import print_function
+import os
+import sys
+import getopt
+import shutil
+import re
+import warnings
+import subprocess
+from optparse import OptionParser
+
+# Figure out where is the bitbake/lib/bb since we need bb.siggen and bb.process
+p = subprocess.Popen("bash -c 'echo $(dirname $(which bitbake-diffsigs | grep -v \'^alias\'))/../lib'",
+        shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+
+err = p.stderr.read()
+if err:
+    print("ERROR: Failed to locate bitbake-diffsigs:", file=sys.stderr)
+    print(err, file=sys.stderr)
+    sys.exit(1)
+
+sys.path.insert(0, p.stdout.read().rstrip('\n'))
+
+import bb.siggen
+import bb.process
+
+# Match the stamp's filename
+# group(1): PE_PV (may no PE)
+# group(2): PR
+# group(3): TASK
+# group(4): HASH
+stamp_re = re.compile("(?P<pv>.*)-(?P<pr>r\d+)\.(?P<task>do_\w+)\.(?P<hash>[^\.]*)")
+sigdata_re = re.compile(".*\.sigdata\..*")
+
+def gen_dict(stamps):
+    """
+    Generate the dict from the stamps dir.
+    The output dict format is:
+    {fake_f: {pn: PN, pv: PV, pr: PR, task: TASK, path: PATH}}
+    Where:
+    fake_f: stampfile
+    path: the path to the stamp file
+    """
+    # The member of the sub dict (A "path" will be appended below)
+    sub_mem = ("pv", "pr", "task")
+    d = {}
+    for dirpath, _, files in os.walk(stamps):
+        for f in files:
+            # The "bitbake -S" would generate ".sigdata", but no "_setscene".
+            fake_f = re.sub('_setscene.', '.', f)
+            fake_f = re.sub('.sigdata', '', fake_f)
+            subdict = {}
+            tmp = stamp_re.match(fake_f)
+            if tmp:
+                for i in sub_mem:
+                    subdict[i] = tmp.group(i)
+                if len(subdict) != 0:
+                    pn = os.path.basename(dirpath)
+                    subdict['pn'] = pn
+                    # The path will be used by os.stat() and bb.siggen
+                    subdict['path'] = dirpath + "/" + f
+                    fake_f = tmp.group('pv') + tmp.group('task') + tmp.group('hash')
+                    d[fake_f] = subdict
+    return d
+
+# Re-construct the dict
+def recon_dict(dict_in):
+    """
+    The output dict format is:
+    {pn_task: {pv: PV, pr: PR, path: PATH}}
+    """
+    dict_out = {}
+    for k in dict_in.keys():
+        subdict = {}
+        # The key
+        pn_task = "%s_%s" % (dict_in.get(k).get('pn'), dict_in.get(k).get('task'))
+        # If more than one stamps are found, use the latest one.
+        if pn_task in dict_out:
+            full_path_pre = dict_out.get(pn_task).get('path')
+            full_path_cur = dict_in.get(k).get('path')
+            if os.stat(full_path_pre).st_mtime > os.stat(full_path_cur).st_mtime:
+                continue
+        subdict['pv'] = dict_in.get(k).get('pv')
+        subdict['pr'] = dict_in.get(k).get('pr')
+        subdict['path'] = dict_in.get(k).get('path')
+        dict_out[pn_task] = subdict
+
+    return dict_out
+
+def split_pntask(s):
+    """
+    Split the pn_task in to (pn, task) and return it
+    """
+    tmp = re.match("(.*)_(do_.*)", s)
+    return (tmp.group(1), tmp.group(2))
+
+
+def print_added(d_new = None, d_old = None):
+    """
+    Print the newly added tasks
+    """
+    added = {}
+    for k in d_new.keys():
+        if k not in d_old:
+            # Add the new one to added dict, and remove it from
+            # d_new, so the remaining ones are the changed ones
+            added[k] = d_new.get(k)
+            del(d_new[k])
+
+    if not added:
+        return 0
+
+    # Format the output, the dict format is:
+    # {pn: task1, task2 ...}
+    added_format = {}
+    counter = 0
+    for k in added.keys():
+        pn, task = split_pntask(k)
+        if pn in added_format:
+            # Append the value
+            added_format[pn] = "%s %s" % (added_format.get(pn), task)
+        else:
+            added_format[pn] = task
+        counter += 1
+    print("=== Newly added tasks: (%s tasks)" % counter)
+    for k in added_format.keys():
+        print("  %s: %s" % (k, added_format.get(k)))
+
+    return counter
+
+def print_vrchanged(d_new = None, d_old = None, vr = None):
+    """
+    Print the pv or pr changed tasks.
+    The arg "vr" is "pv" or "pr"
+    """
+    pvchanged = {}
+    counter = 0
+    for k in d_new.keys():
+        if d_new.get(k).get(vr) != d_old.get(k).get(vr):
+            counter += 1
+            pn, task = split_pntask(k)
+            if pn not in pvchanged:
+                # Format the output, we only print pn (no task) since
+                # all the tasks would be changed when pn or pr changed,
+                # the dict format is:
+                # {pn: pv/pr_old -> pv/pr_new}
+                pvchanged[pn] = "%s -> %s" % (d_old.get(k).get(vr), d_new.get(k).get(vr))
+            del(d_new[k])
+
+    if not pvchanged:
+        return 0
+
+    print("\n=== %s changed: (%s tasks)" % (vr.upper(), counter))
+    for k in pvchanged.keys():
+        print("  %s: %s" % (k, pvchanged.get(k)))
+
+    return counter
+
+def print_depchanged(d_new = None, d_old = None, verbose = False):
+    """
+    Print the dependency changes
+    """
+    depchanged = {}
+    counter = 0
+    for k in d_new.keys():
+        counter += 1
+        pn, task = split_pntask(k)
+        if (verbose):
+            full_path_old = d_old.get(k).get("path")
+            full_path_new = d_new.get(k).get("path")
+            # No counter since it is not ready here
+            if sigdata_re.match(full_path_old) and sigdata_re.match(full_path_new):
+                output = bb.siggen.compare_sigfiles(full_path_old, full_path_new)
+                if output:
+                    print("\n=== The verbose changes of %s.do_%s:" % (pn, task))
+                    print('\n'.join(output))
+        else:
+            # Format the output, the format is:
+            # {pn: task1, task2, ...}
+            if pn in depchanged:
+                depchanged[pn] = "%s %s" % (depchanged.get(pn), task)
+            else:
+                depchanged[pn] = task
+
+    if len(depchanged) > 0:
+        print("\n=== Dependencies changed: (%s tasks)" % counter)
+        for k in depchanged.keys():
+            print("  %s: %s" % (k, depchanged[k]))
+
+    return counter
+
+
+def main():
+    """
+    Print what will be done between the current and last builds:
+    1) Run "STAMPS_DIR=<path> bitbake -S recipe" to re-generate the stamps
+    2) Figure out what are newly added and changed, can't figure out
+       what are removed since we can't know the previous stamps
+       clearly, for example, if there are several builds, we can't know
+       which stamps the last build has used exactly.
+    3) Use bb.siggen.compare_sigfiles to diff the old and new stamps
+    """
+
+    parser = OptionParser(
+        version = "1.0",
+        usage = """%prog [options] [package ...]
+print what will be done between the current and last builds, for example:
+
+    $ bitbake core-image-sato
+    # Edit the recipes
+    $ bitbake-whatchanged core-image-sato
+
+The changes will be printed"
+
+Note:
+    The amount of tasks is not accurate when the task is "do_build" since
+    it usually depends on other tasks.
+    The "nostamp" task is not included.
+"""
+)
+    parser.add_option("-v", "--verbose", help = "print the verbose changes",
+               action = "store_true", dest = "verbose")
+
+    options, args = parser.parse_args(sys.argv)
+
+    verbose = options.verbose
+
+    if len(args) != 2:
+        parser.error("Incorrect number of arguments")
+    else:
+        recipe = args[1]
+
+    # Get the STAMPS_DIR
+    print("Figuring out the STAMPS_DIR ...")
+    cmdline = "bitbake -e | sed -ne 's/^STAMPS_DIR=\"\(.*\)\"/\\1/p'"
+    try:
+        stampsdir, err = bb.process.run(cmdline)
+    except:
+        raise
+    if not stampsdir:
+        print("ERROR: No STAMPS_DIR found for '%s'" % recipe, file=sys.stderr)
+        return 2
+    stampsdir = stampsdir.rstrip("\n")
+    if not os.path.isdir(stampsdir):
+        print("ERROR: stamps directory \"%s\" not found!" % stampsdir, file=sys.stderr)
+        return 2
+
+    # The new stamps dir
+    new_stampsdir = stampsdir + ".bbs"
+    if os.path.exists(new_stampsdir):
+        print("ERROR: %s already exists!" % new_stampsdir, file=sys.stderr)
+        return 2
+
+    try:
+        # Generate the new stamps dir
+        print("Generating the new stamps ... (need several minutes)")
+        cmdline = "STAMPS_DIR=%s bitbake -S %s" % (new_stampsdir, recipe)
+        # FIXME
+        # The "bitbake -S" may fail, not fatal error, the stamps will still
+        # be generated, this might be a bug of "bitbake -S".
+        try:
+            bb.process.run(cmdline)
+        except Exception as exc:
+            print(exc)
+
+        # The dict for the new and old stamps.
+        old_dict = gen_dict(stampsdir)
+        new_dict = gen_dict(new_stampsdir)
+
+        # Remove the same one from both stamps.
+        cnt_unchanged = 0
+        for k in new_dict.keys():
+            if k in old_dict:
+                cnt_unchanged += 1
+                del(new_dict[k])
+                del(old_dict[k])
+
+        # Re-construct the dict to easily find out what is added or changed.
+        # The dict format is:
+        # {pn_task: {pv: PV, pr: PR, path: PATH}}
+        new_recon = recon_dict(new_dict)
+        old_recon = recon_dict(old_dict)
+
+        del new_dict
+        del old_dict
+
+        # Figure out what are changed, the new_recon would be changed
+        # by the print_xxx function.
+        # Newly added
+        cnt_added = print_added(new_recon, old_recon)
+
+        # PV (including PE) and PR changed
+        # Let the bb.siggen handle them if verbose
+        cnt_rv = {}
+        if not verbose:
+            for i in ('pv', 'pr'):
+               cnt_rv[i] = print_vrchanged(new_recon, old_recon, i)
+
+        # Dependencies changed (use bitbake-diffsigs)
+        cnt_dep = print_depchanged(new_recon, old_recon, verbose)
+
+        total_changed = cnt_added + (cnt_rv.get('pv') or 0) + (cnt_rv.get('pr') or 0) + cnt_dep
+
+        print("\n=== Summary: (%s changed, %s unchanged)" % (total_changed, cnt_unchanged))
+        if verbose:
+            print("Newly added: %s\nDependencies changed: %s\n" % \
+                (cnt_added, cnt_dep))
+        else:
+            print("Newly added: %s\nPV changed: %s\nPR changed: %s\nDependencies changed: %s\n" % \
+                (cnt_added, cnt_rv.get('pv') or 0, cnt_rv.get('pr') or 0, cnt_dep))
+    except:
+        print("ERROR occurred!")
+        raise
+    finally:
+        # Remove the newly generated stamps dir
+        if os.path.exists(new_stampsdir):
+            print("Removing the newly generated stamps dir ...")
+            shutil.rmtree(new_stampsdir)
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
1.7.11.2



