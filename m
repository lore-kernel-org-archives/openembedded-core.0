Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A88C6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 00:47:22 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id b20so2479405yha.27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 17:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BWU+BcXmPj66oHaK2vaB4xhF/2sAEDYzS0eHhwc9pEg=;
	b=S4I75QYMxRu6S5X/MNymchOBREcjm76J3yksEQYI0BKl2Ni36XVGe0ESfHkjlqy2gi
	ARHR+xuOLPhA6giMKdZ4e6jWr5wHiG/sKDSmmfUzQzXkwZiyHXTuFakSpdP9Iqt6xwSP
	rmB7xlDsPl+gmWfXQNRN0NVsHBLOQK6IgAImRLTyhdRBPS6jWJ9zPOWiZ6hSX3Fy7Zoz
	Fk6Ihc+rz12D8xcoRgRr2b9gDUMG6hrsEcryDg/fQm4lgNDMepVU3VMuuKJz81bRzNvM
	y0w3ic7FRDFWNrl+ddUUAkSuPJKOE16zsDWSCWiI9EAUu1WMMRAU2pckvXUYk0qgqfWS
	kGeA==
X-Received: by 10.236.141.144 with SMTP id g16mr12242yhj.84.1382921243817;
	Sun, 27 Oct 2013 17:47:23 -0700 (PDT)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id q9sm29156971yhk.16.2013.10.27.17.47.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Oct 2013 17:47:23 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2013 22:47:05 -0200
Message-Id: <1382921225-7045-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] add utilities dirsize, ksize
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
X-List-Received-Date: Mon, 28 Oct 2013 00:47:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch was imported from Yocto git server
(git://git.yoctoproject.org/user-contrib/dvhart/meta-tiny)
as of commit id 4dbeb28dbafeac55d271484ead13914152db826c.

Only dirsize and ksize was picked up.

[YOCTO #5388]

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/dirsize.py |  69 ++++++++++++++++++++++
 scripts/ksize.py   | 165 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 scripts/dirsize.py
 create mode 100644 scripts/ksize.py

diff --git a/scripts/dirsize.py b/scripts/dirsize.py
new file mode 100644
index 0000000..df0120c
--- /dev/null
+++ b/scripts/dirsize.py
@@ -0,0 +1,69 @@
+#!/usr/bin/env python
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
diff --git a/scripts/ksize.py b/scripts/ksize.py
new file mode 100644
index 0000000..1ea8c8c
--- /dev/null
+++ b/scripts/ksize.py
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
1.8.3.2


