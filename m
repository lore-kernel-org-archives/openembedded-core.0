Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1661E7016E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:33:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 03 Jan 2017 14:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,457,1477983600"; d="scan'208";a="209315235"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2017 14:33:28 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:30:40 +0000
Message-Id: <0960cf70d3357819843e693eb13c1e7c1f93da8e.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/6] scripts/tiny/ksum.py: New tool
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
X-List-Received-Date: Tue, 03 Jan 2017 22:33:29 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

'ksum.py' generates a combined summary of vmlinux and module sizes for
a built kernel, as a quick tool for comparing the overall effects of
systemic tinification changes.  Execute from the base directory of the
kernel build you want to summarize.  Setting the 'verbose' flag will
display the sizes for each file included in the summary.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/tiny/ksum.py | 168 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100755 scripts/tiny/ksum.py

diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
new file mode 100755
index 0000000..d4f3892
--- /dev/null
+++ b/scripts/tiny/ksum.py
@@ -0,0 +1,168 @@
+#!/usr/bin/env python
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2016, Intel Corporation.
+# All rights reserved.
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
+#
+# DESCRIPTION 'ksum.py' generates a combined summary of vmlinux and
+# module sizes for a built kernel, as a quick tool for comparing the
+# overall effects of systemic tinification changes.  Execute from the
+# base directory of the kernel build you want to summarize.  Setting
+# the 'verbose' flag will display the sizes for each file included in
+# the summary.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+__version__ = "0.1.0"
+
+# Python Standard Library modules
+import os
+import sys
+import getopt
+from subprocess import *
+
+def usage():
+    prog = os.path.basename(sys.argv[0])
+    print('Usage: %s [OPTION]...' % prog)
+    print('  -v,                 display sizes for each file')
+    print('  -h, --help          display this help and exit')
+    print('')
+    print('Run %s from the top-level Linux kernel build directory.' % prog)
+
+verbose = False
+
+n_ko_files = 0
+ko_file_list = []
+
+ko_text = 0
+ko_data = 0
+ko_bss = 0
+ko_total = 0
+
+vmlinux_file = ""
+vmlinux_level = 0
+
+vmlinux_text = 0
+vmlinux_data = 0
+vmlinux_bss = 0
+vmlinux_total = 0
+
+def is_vmlinux_file(filename):
+    global vmlinux_level
+    if filename == ("vmlinux") and vmlinux_level == 0:
+        vmlinux_level += 1
+        return True
+    return False
+
+def is_ko_file(filename):
+    if filename.endswith(".ko"):
+        return True
+    return False
+
+def collect_object_files():
+    print "Collecting object files recursively from %s..." % os.getcwd()
+    for dirpath, dirs, files in os.walk(os.getcwd()):
+        for filename in files:
+            if is_ko_file(filename):
+                ko_file_list.append(os.path.join(dirpath, filename))
+            elif is_vmlinux_file(filename):
+                global vmlinux_file
+                vmlinux_file = os.path.join(dirpath, filename)
+    print "Collecting object files [DONE]"
+
+def add_ko_file(filename):
+        p = Popen("size -t " + filename, shell=True, stdout=PIPE, stderr=PIPE)
+        output = p.communicate()[0].splitlines()
+        if len(output) > 2:
+            sizes = output[-1].split()[0:4]
+            if verbose:
+                print "     %10d %10d %10d %10d\t" % \
+                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])),
+                print "%s" % filename[len(os.getcwd()) + 1:]
+            global n_ko_files, ko_text, ko_data, ko_bss, ko_total
+            ko_text += int(sizes[0])
+            ko_data += int(sizes[1])
+            ko_bss += int(sizes[2])
+            ko_total += int(sizes[3])
+            n_ko_files += 1
+
+def get_vmlinux_totals():
+        p = Popen("size -t " + vmlinux_file, shell=True, stdout=PIPE, stderr=PIPE)
+        output = p.communicate()[0].splitlines()
+        if len(output) > 2:
+            sizes = output[-1].split()[0:4]
+            if verbose:
+                print "     %10d %10d %10d %10d\t" % \
+                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])),
+                print "%s" % vmlinux_file[len(os.getcwd()) + 1:]
+            global vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total
+            vmlinux_text += int(sizes[0])
+            vmlinux_data += int(sizes[1])
+            vmlinux_bss += int(sizes[2])
+            vmlinux_total += int(sizes[3])
+
+def sum_ko_files():
+    for ko_file in ko_file_list:
+        add_ko_file(ko_file)
+
+def main():
+    try:
+        opts, args = getopt.getopt(sys.argv[1:], "vh", ["help"])
+    except getopt.GetoptError as err:
+        print('%s' % str(err))
+        usage()
+        sys.exit(2)
+
+    for o, a in opts:
+        if o == '-v':
+            global verbose
+            verbose = True
+        elif o in ('-h', '--help'):
+            usage()
+            sys.exit(0)
+        else:
+            assert False, "unhandled option"
+
+    collect_object_files()
+    sum_ko_files()
+    get_vmlinux_totals()
+
+    print "\nTotals:"
+    print "\nvmlinux:"
+    print "    text\tdata\t\tbss\t\ttotal"
+    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
+        (vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total)
+    print "\nmodules (%d):" % n_ko_files
+    print "    text\tdata\t\tbss\t\ttotal"
+    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
+        (ko_text, ko_data, ko_bss, ko_total)
+    print "\nvmlinux + modules:"
+    print "    text\tdata\t\tbss\t\ttotal"
+    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
+        (vmlinux_text + ko_text, vmlinux_data + ko_data, \
+         vmlinux_bss + ko_bss, vmlinux_total + ko_total)
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
-- 
2.6.6


