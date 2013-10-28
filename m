Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00C7A6CEE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:32:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Oct 2013 07:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="425962971"
Received: from unknown (HELO localhost) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 28 Oct 2013 07:32:52 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:32:40 +0000
Message-Id: <9b93bf619e8d4f12e3b6cf20e9bb345a5fb954d6.1382970760.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: paul.eggleton@linux.intel.com, Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] scripts: Add ksize.py and dirsize.py
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
X-List-Received-Date: Mon, 28 Oct 2013 14:32:54 -0000

Fixes [YOCTO #5388]

These scripts can be useful when working to reduce the size of the Linux
kernel and the root filesystem.

ksize.py displays the kernel build size by the built-in.o files.

dirsize.py displays the various sizes of the components of the root
directory.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/tiny/dirsize.py |  93 +++++++++++++++++++++++++++
 scripts/tiny/ksize.py   | 165 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100755 scripts/tiny/dirsize.py
 create mode 100755 scripts/tiny/ksize.py

diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
new file mode 100755
index 0000000..40ff4ab
--- /dev/null
+++ b/scripts/tiny/dirsize.py
@@ -0,0 +1,93 @@
+#!/usr/bin/env python
+#
+# Copyright (c) 2011, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+#
+# Display details of the root filesystem size, broken up by directory.
+# Allows for limiting by size to focus on the larger files.
+#
+# Author: Darren Hart <dvhart@linux.intel.com>
+#
+
+import os
+import sys
+import stat
+
+class Record:
+    def create(path):
+        r = Record(path)
+
+        s = os.lstat(path)
+        if stat.S_ISDIR(s.st_mode):
+            for p in os.listdir(path):
+                pathname = path + "/" + p
+                ss = os.lstat(pathname)
+                if not stat.S_ISLNK(ss.st_mode):
+                    r.records.append(Record.create(pathname))
+                    r.size += r.records[-1].size
+            r.records.sort(reverse=True)
+        else:
+            r.size = os.lstat(path).st_size
+
+        return r
+    create = staticmethod(create)
+
+    def __init__(self, path):
+        self.path = path
+        self.size = 0
+        self.records = []
+
+    def __cmp__(this, that):
+        if that is None:
+            return 1
+        if not isinstance(that, Record):
+            raise TypeError
+        if len(this.records) > 0 and len(that.records) == 0:
+            return -1
+        if len(this.records) == 0 and len(that.records) > 0:
+            return 1
+        if this.size < that.size:
+            return -1
+        if this.size > that.size:
+            return 1
+        return 0
+
+    def show(self, minsize):
+        total = 0
+        if self.size <= minsize:
+            return 0
+        print "%10d %s" % (self.size, self.path)
+        for r in self.records:
+            total += r.show(minsize)
+        if len(self.records) == 0:
+            total = self.size
+        return total
+
+
+def main():
+    minsize = 0
+    if len(sys.argv) == 2:
+        minsize = int(sys.argv[1])
+    rootfs = Record.create(".")
+    total = rootfs.show(minsize)
+    print "Displayed %d/%d bytes (%.2f%%)" % \
+          (total, rootfs.size, 100 * float(total) / rootfs.size)
+
+
+if __name__ == "__main__":
+    main()
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
new file mode 100755
index 0000000..4006f2f
--- /dev/null
+++ b/scripts/tiny/ksize.py
@@ -0,0 +1,165 @@
+#!/usr/bin/env python
+#
+# Copyright (c) 2011, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+#
+# Display details of the kernel build size, broken up by built-in.o. Sort
+# the objects by size. Run from the top level kernel build directory.
+#
+# Author: Darren Hart <dvhart@linux.intel.com>
+#
+
+import sys
+import getopt
+import os
+from subprocess import *
+from string import join
+
+
+def usage():
+    prog = os.path.basename(sys.argv[0])
+    print 'Usage: %s [OPTION]...' % (prog)
+    print '  -d,                 display an additional level of drivers detail'
+    print '  -h, --help          display this help and exit'
+    print ''
+    print 'Run %s from the top-level Linux kernel build directory.' % (prog)
+
+
+class Sizes:
+    def __init__(self, glob):
+        self.title = glob
+        p = Popen("size -t " + glob, shell=True, stdout=PIPE, stderr=PIPE)
+        output = p.communicate()[0].splitlines()
+        if len(output) > 2:
+            sizes = output[-1].split()[0:4]
+            self.text = int(sizes[0])
+            self.data = int(sizes[1])
+            self.bss = int(sizes[2])
+            self.total = int(sizes[3])
+        else:
+            self.text = self.data = self.bss = self.total = 0
+
+    def show(self, indent=""):
+        print "%-32s %10d | %10d %10d %10d" % \
+              (indent+self.title, self.total, self.text, self.data, self.bss)
+
+
+class Report:
+    def create(filename, title, subglob=None):
+        r = Report(filename, title)
+        path = os.path.dirname(filename)
+
+        p = Popen("ls " + path + "/*.o | grep -v built-in.o",
+                  shell=True, stdout=PIPE, stderr=PIPE)
+        glob = join(p.communicate()[0].splitlines())
+        oreport = Report(glob, path + "/*.o")
+        oreport.sizes.title = path + "/*.o"
+        r.parts.append(oreport)
+
+        if subglob:
+            p = Popen("ls " + subglob, shell=True, stdout=PIPE, stderr=PIPE)
+            for f in p.communicate()[0].splitlines():
+                path = os.path.dirname(f)
+                r.parts.append(Report.create(f, path, path + "/*/built-in.o"))
+            r.parts.sort(reverse=True)
+
+        for b in r.parts:
+            r.totals["total"] += b.sizes.total
+            r.totals["text"] += b.sizes.text
+            r.totals["data"] += b.sizes.data
+            r.totals["bss"] += b.sizes.bss
+
+        r.deltas["total"] = r.sizes.total - r.totals["total"]
+        r.deltas["text"] = r.sizes.text - r.totals["text"]
+        r.deltas["data"] = r.sizes.data - r.totals["data"]
+        r.deltas["bss"] = r.sizes.bss - r.totals["bss"]
+        return r
+    create = staticmethod(create)
+
+    def __init__(self, glob, title):
+        self.glob = glob
+        self.title = title
+        self.sizes = Sizes(glob)
+        self.parts = []
+        self.totals = {"total":0, "text":0, "data":0, "bss":0}
+        self.deltas = {"total":0, "text":0, "data":0, "bss":0}
+
+    def show(self, indent=""):
+        rule = str.ljust(indent, 80, '-')
+        print "%-32s %10s | %10s %10s %10s" % \
+              (indent+self.title, "total", "text", "data", "bss")
+        print rule
+        self.sizes.show(indent)
+        print rule
+        for p in self.parts:
+            if p.sizes.total > 0:
+                p.sizes.show(indent)
+        print rule
+        print "%-32s %10d | %10d %10d %10d" % \
+              (indent+"sum", self.totals["total"], self.totals["text"],
+               self.totals["data"], self.totals["bss"])
+        print "%-32s %10d | %10d %10d %10d" % \
+              (indent+"delta", self.deltas["total"], self.deltas["text"],
+               self.deltas["data"], self.deltas["bss"])
+        print "\n"
+
+    def __cmp__(this, that):
+        if that is None:
+            return 1
+        if not isinstance(that, Report):
+            raise TypeError
+        if this.sizes.total < that.sizes.total:
+            return -1
+        if this.sizes.total > that.sizes.total:
+            return 1
+        return 0
+
+
+def main():
+    try:
+        opts, args = getopt.getopt(sys.argv[1:], "dh", ["help"])
+    except getopt.GetoptError, err:
+        print '%s' % str(err)
+        usage()
+        sys.exit(2)
+
+    driver_detail = False
+    for o, a in opts:
+        if o == '-d':
+            driver_detail = True
+        elif o in ('-h', '--help'):
+            usage()
+            sys.exit(0)
+        else:
+            assert False, "unhandled option"
+
+    glob = "arch/*/built-in.o */built-in.o"
+    vmlinux = Report.create("vmlinux",  "Linux Kernel", glob)
+
+    vmlinux.show()
+    for b in vmlinux.parts:
+        if b.totals["total"] > 0 and len(b.parts) > 1:
+            b.show()
+        if b.title == "drivers" and driver_detail:
+            for d in b.parts:
+                if d.totals["total"] > 0 and len(d.parts) > 1:
+                    d.show("    ")
+
+
+if __name__ == "__main__":
+    main()
-- 
1.8.3.1


