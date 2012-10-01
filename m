Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIk0a-0008N5-3c
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 19:42:20 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TIjo4-0006vM-Lk
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 19:29:24 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 01 Oct 2012 18:29:23 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349112564.32611.71.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] insane: Rationalise phdrs-based QA checks
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
X-List-Received-Date: Mon, 01 Oct 2012 17:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Various different QA checks are based on essentially the same data from
the ELF program headers.  Calling objdump to extract it repeatedly is
inefficient, particularly if the shell is involved.  Instead, let's
cache the output from objdump inside the qa.elf object and allow it to
be reused by multiple tests.

Also, using objdump instead of scanelf to check for bad RPATHs (in the
same way that the useless-rpaths check was doing already) allows the
dependency on pax-utils-native to be dropped.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/insane.bbclass |   41 ++++++++++++++++++-----------------------
 meta/lib/oe/qa.py           |   17 +++++++++++++++++
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1fb8970..3705fe9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -17,13 +17,8 @@
 #   files under exec_prefix
 
 
-#
-# We need to have the scanelf utility as soon as
-# possible and this is contained within the pax-utils-native.
-# The package.bbclass can help us here.
-#
 inherit package
-PACKAGE_DEPENDS += "pax-utils-native ${QADEPENDS}"
+PACKAGE_DEPENDS += "${QADEPENDS}"
 PACKAGEFUNCS += " do_package_qa "
 
 # unsafe-references-in-binaries requires prelink-rtld from
@@ -147,21 +142,23 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     if not elf:
         return
 
-    scanelf = os.path.join(d.getVar('STAGING_BINDIR_NATIVE',True),'scanelf')
     bad_dirs = [d.getVar('TMPDIR', True) + "/work", d.getVar('STAGING_DIR_TARGET', True)]
     bad_dir_test = d.getVar('TMPDIR', True)
-    if not os.path.exists(scanelf):
-        bb.fatal("Can not check RPATH, scanelf (part of pax-utils-native) not found")
 
     if not bad_dirs[0] in d.getVar('WORKDIR', True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
 
-    output = os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
-    txt    = output.readline().split()
-    for line in txt:
-        for dir in bad_dirs:
-            if dir in line:
-                messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
+    phdrs = elf.run_objdump("-p", d)
+
+    import re
+    rpath_re = re.compile("\s+RPATH\s+(.*)")
+    for line in phdrs.split("\n"):
+    	m = rpath_re.match(line)
+	if m:
+	    rpath = m.group(1)
+	    for dir in bad_dirs:
+                if dir in rpath:
+                    messages.append("package %s contains bad RPATH %s in file %s" % (name, rpath, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
 def package_qa_check_useless_rpaths(file, name, d, elf, messages):
@@ -174,15 +171,14 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     if not elf:
         return
 
-    objdump = d.getVar('OBJDUMP', True)
-    env_path = d.getVar('PATH', True)
-
     libdir = d.getVar("libdir", True)
     base_libdir = d.getVar("base_libdir", True)
 
+    phdrs = elf.run_objdump("-p", d)
+
     import re
     rpath_re = re.compile("\s+RPATH\s+(.*)")
-    for line in os.popen("LC_ALL=C PATH=%s %s -p '%s' 2> /dev/null" % (env_path, objdump, file), "r"):
+    for line in phdrs.split("\n"):
     	m = rpath_re.match(line)
 	if m:
 	   rpath = m.group(1)
@@ -443,14 +439,13 @@ def package_qa_hash_style(path, name, d, elf, messages):
     if not gnu_hash:
         return
 
-    objdump = d.getVar('OBJDUMP', True)
-    env_path = d.getVar('PATH', True)
-
     sane = False
     has_syms = False
 
+    phdrs = elf.run_objdump("-p", d)
+
     # If this binary has symbols, we expect it to have GNU_HASH too.
-    for line in os.popen("LC_ALL=C PATH=%s %s -p '%s' 2> /dev/null" % (env_path, objdump, path), "r"):
+    for line in phdrs.split("\n"):
         if "SYMTAB" in line:
             has_syms = True
         if "GNU_HASH" in line:
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index d380012..9e5ab58 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -28,6 +28,7 @@ class ELFFile:
     def __init__(self, name, bits = 0):
         self.name = name
         self.bits = bits
+        self.objdump_output = {}
 
     def open(self):
         self.file = file(self.name, "r")
@@ -87,3 +88,19 @@ class ELFFile:
         import struct
         (a,) = struct.unpack(self.sex+"H", self.data[18:20])
         return a
+
+    def run_objdump(self, cmd, d):
+        import bb.process
+        import sys
+
+        if self.objdump_output.has_key(cmd):
+            return self.objdump_output[cmd]
+
+        objdump = d.getVar('OBJDUMP', True)
+        staging_dir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
+
+        env = os.environ
+        env["LC_ALL"] = "C"
+
+        self.objdump_output[cmd] = bb.process.run([ os.path.join(staging_dir, objdump), cmd, self.name ], env=env, shell=False)[0]
+        return self.objdump_output[cmd]
-- 
1.7.10.4





