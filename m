Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7A2A60746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:38:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491770"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:38:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:10 +1200
Message-Id: <dcd0cd08f0141176ec30cb2ae82ad92cd9f6b385.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/8] scripts: add oe-check-sstate script
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
X-List-Received-Date: Fri, 22 Jul 2016 12:38:52 -0000

Add a script to check which sstate artifacts would be installed by
building a given target - by default this is done with a separate
TMPDIR to ensure we get the "from scratch" result. The script produces a
list of tasks that will be restored from the sstate cache. This can also
be combined with BB_SETSCENE_ENFORCE* to check if sstate artifacts are
available.

The implementation is a little crude - we're running bitbake -n and
looking at the output. In future when we have the ability to execute
tasks from tinfoil-based scripts we can look at rewriting that part of
it to use that instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-check-sstate | 121 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 scripts/oe-check-sstate

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
new file mode 100755
index 0000000..8aab86a
--- /dev/null
+++ b/scripts/oe-check-sstate
@@ -0,0 +1,121 @@
+#!/usr/bin/env python3
+
+# Query which tasks will be restored from sstate
+#
+# Copyright 2016 Intel Corporation
+# Authored-by:  Paul Eggleton <paul.eggleton@intel.com>
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
+import sys
+import os
+import subprocess
+import tempfile
+import shutil
+import re
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptutils
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+import argparse_oe
+
+
+def translate_virtualfns(tasks):
+    import bb.tinfoil
+    tinfoil = bb.tinfoil.Tinfoil()
+    try:
+        tinfoil.prepare(False)
+
+        pkg_fn = tinfoil.cooker.recipecache.pkg_fn
+        outtasks = []
+        for task in tasks:
+            fn, taskname = task.rsplit(':', 1)
+            if taskname.endswith('_setscene'):
+                taskname = taskname[:-9]
+            outtasks.append('%s:%s' % (pkg_fn[fn], taskname))
+    finally:
+        tinfoil.shutdown()
+    return outtasks
+
+
+def check(args):
+    tmpdir = tempfile.mkdtemp(prefix='oe-check-sstate-')
+    try:
+        env = os.environ.copy()
+        if not args.same_tmpdir:
+            env['BB_ENV_EXTRAWHITE'] = env.get('BB_ENV_EXTRAWHITE', '') + ' TMPDIR_forcevariable'
+            env['TMPDIR_forcevariable'] = tmpdir
+
+        try:
+            output = subprocess.check_output(
+                    'bitbake -n %s' % ' '.join(args.target),
+                    stderr=subprocess.STDOUT,
+                    env=env,
+                    shell=True)
+
+            task_re = re.compile('NOTE: Running setscene task [0-9]+ of [0-9]+ \(([^)]+)\)')
+            tasks = []
+            for line in output.decode('utf-8').splitlines():
+                res = task_re.match(line)
+                if res:
+                    tasks.append(res.group(1))
+            outtasks = translate_virtualfns(tasks)
+        except subprocess.CalledProcessError as e:
+            print('ERROR: bitbake failed:\n%s' % e.output.decode('utf-8'))
+            return e.returncode
+    finally:
+        shutil.rmtree(tmpdir)
+
+    if args.log:
+        with open(args.log, 'wb') as f:
+            f.write(output)
+
+    if args.outfile:
+        with open(args.outfile, 'w') as f:
+            for task in outtasks:
+                f.write('%s\n' % task)
+    else:
+        for task in outtasks:
+            print(task)
+
+    return 0
+
+
+def main():
+    parser = argparse_oe.ArgumentParser(description='OpenEmbedded sstate check tool. Does a dry-run to check restoring the specified targets from shared state, and lists the tasks that would be restored. Set BB_SETSCENE_ENFORCE=1 in the environment if you wish to ensure real tasks are disallowed.')
+
+    parser.add_argument('target', nargs='+', help='Target to check')
+    parser.add_argument('-o', '--outfile', help='Write list to a file instead of stdout')
+    parser.add_argument('-l', '--log', help='Write full log to a file')
+    parser.add_argument('-s', '--same-tmpdir', action='store_true', help='Use same TMPDIR for check (list will then be dependent on what tasks have executed previously)')
+
+    parser.set_defaults(func=check)
+
+    args = parser.parse_args()
+
+    ret = args.func(args)
+    return ret
+
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
-- 
2.5.5


