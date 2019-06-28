Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B74B77EA6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:00:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SBxaAk023772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:00:07 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 04:59:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 20:23:37 +0800
Message-ID: <1cb2990ee4728952a60c973366945103774f85ed.1561724553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561724553.git.liezhi.yang@windriver.com>
References: <cover.1561724553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] ksum.py: python -> python3
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
X-List-Received-Date: Fri, 28 Jun 2019 12:00:15 -0000
Content-Type: text/plain

* Testinfo:
  In kernel's builddir:
  $ /path/to/oe-core/scripts/tiny/ksum.py

Collecting object files [DONE]

Totals:

vmlinux:
    text        data            bss             total
    10933110    3824470         1605632         16363212

modules (2004):
    text        data            bss             total
    46144408    3047516         167580          49359504

vmlinux + modules:
    text        data            bss             total
    57077518    6871986         1773212         65722716

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/tiny/ksum.py | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
index f38ae05..8f0e4c0 100755
--- a/scripts/tiny/ksum.py
+++ b/scripts/tiny/ksum.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Copyright (c) 2016, Intel Corporation.
 #
@@ -62,7 +62,7 @@ def is_ko_file(filename):
     return False
 
 def collect_object_files():
-    print "Collecting object files recursively from %s..." % os.getcwd()
+    print("Collecting object files recursively from %s..." % os.getcwd())
     for dirpath, dirs, files in os.walk(os.getcwd()):
         for filename in files:
             if is_ko_file(filename):
@@ -70,7 +70,7 @@ def collect_object_files():
             elif is_vmlinux_file(filename):
                 global vmlinux_file
                 vmlinux_file = os.path.join(dirpath, filename)
-    print "Collecting object files [DONE]"
+    print("Collecting object files [DONE]")
 
 def add_ko_file(filename):
         p = Popen("size -t " + filename, shell=True, stdout=PIPE, stderr=PIPE)
@@ -78,9 +78,9 @@ def add_ko_file(filename):
         if len(output) > 2:
             sizes = output[-1].split()[0:4]
             if verbose:
-                print "     %10d %10d %10d %10d\t" % \
-                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])),
-                print "%s" % filename[len(os.getcwd()) + 1:]
+                print("     %10d %10d %10d %10d\t" % \
+                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])), end=' ')
+                print("%s" % filename[len(os.getcwd()) + 1:])
             global n_ko_files, ko_text, ko_data, ko_bss, ko_total
             ko_text += int(sizes[0])
             ko_data += int(sizes[1])
@@ -94,9 +94,9 @@ def get_vmlinux_totals():
         if len(output) > 2:
             sizes = output[-1].split()[0:4]
             if verbose:
-                print "     %10d %10d %10d %10d\t" % \
-                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])),
-                print "%s" % vmlinux_file[len(os.getcwd()) + 1:]
+                print("     %10d %10d %10d %10d\t" % \
+                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])), end=' ')
+                print("%s" % vmlinux_file[len(os.getcwd()) + 1:])
             global vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total
             vmlinux_text += int(sizes[0])
             vmlinux_data += int(sizes[1])
@@ -129,20 +129,20 @@ def main():
     sum_ko_files()
     get_vmlinux_totals()
 
-    print "\nTotals:"
-    print "\nvmlinux:"
-    print "    text\tdata\t\tbss\t\ttotal"
-    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
-        (vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total)
-    print "\nmodules (%d):" % n_ko_files
-    print "    text\tdata\t\tbss\t\ttotal"
-    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
-        (ko_text, ko_data, ko_bss, ko_total)
-    print "\nvmlinux + modules:"
-    print "    text\tdata\t\tbss\t\ttotal"
-    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
+    print("\nTotals:")
+    print("\nvmlinux:")
+    print("    text\tdata\t\tbss\t\ttotal")
+    print("    %-10d\t%-10d\t%-10d\t%-10d" % \
+        (vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total))
+    print("\nmodules (%d):" % n_ko_files)
+    print("    text\tdata\t\tbss\t\ttotal")
+    print("    %-10d\t%-10d\t%-10d\t%-10d" % \
+        (ko_text, ko_data, ko_bss, ko_total))
+    print("\nvmlinux + modules:")
+    print("    text\tdata\t\tbss\t\ttotal")
+    print("    %-10d\t%-10d\t%-10d\t%-10d" % \
         (vmlinux_text + ko_text, vmlinux_data + ko_data, \
-         vmlinux_bss + ko_bss, vmlinux_total + ko_total)
+         vmlinux_bss + ko_bss, vmlinux_total + ko_total))
 
 if __name__ == "__main__":
     try:
-- 
2.7.4


