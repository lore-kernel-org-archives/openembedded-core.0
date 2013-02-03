Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fH-0002bk-Cp
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUN020480; Mon, 4 Feb 2013 00:01:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0ZFzbrCKaUM1; Mon,  4 Feb 2013 00:01:19 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401Cog020458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:13 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pk-0000Y1-Kh; Sun, 03 Feb 2013 23:56:00 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:44 +0000
Message-Id: <a34c33fa629bcc754789cc07d81bd48e53b7bf09.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/22] kernel.bbclass: Improve populate_packages_prepend
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

Small performance tweaks for populate_packages_prepend:

* Compile the regexps once at the start
* Don't keep importing a module which is already imported
* No need to check PKG is set, we'd have failed long before now if it wasn't
* Don't export PATH, bitbake takes care of this at the task level

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass |   48 +++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index cc61be6..4805944 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -302,71 +302,68 @@ fi
 }
 
 python populate_packages_prepend () {
+    import re
+
+    modinfoexp = re.compile("([^=]+)=(.*)")
+    kerverrexp = re.compile('^(.*-hh.*)[\.\+].*$')
+    depmodpat0 = re.compile("^(.*\.k?o):..*$")
+    depmodpat1 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*$")
+    depmodpat2 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*\\\$")
+    depmodpat3 = re.compile("^\t(.*\.k?o)\s*\\\$")
+    depmodpat4 = re.compile("^\t(.*\.k?o)\s*$")
+
     def extract_modinfo(file):
-        import tempfile, re, subprocess
+        import tempfile, subprocess
         tempfile.tempdir = d.getVar("WORKDIR", True)
         tf = tempfile.mkstemp()
         tmpfile = tf[1]
-        cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
+        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
         subprocess.call(cmd, shell=True)
         f = open(tmpfile)
         l = f.read().split("\000")
         f.close()
         os.close(tf[0])
         os.unlink(tmpfile)
-        exp = re.compile("([^=]+)=(.*)")
         vals = {}
         for i in l:
-            m = exp.match(i)
+            m = modinfoexp.match(i)
             if not m:
                 continue
             vals[m.group(1)] = m.group(2)
         return vals
     
     def parse_depmod():
-        import re
 
         dvar = d.getVar('PKGD', True)
-        if not dvar:
-            bb.error("PKGD not defined")
-            return
 
         kernelver = d.getVar('KERNEL_VERSION', True)
         kernelver_stripped = kernelver
-        m = re.match('^(.*-hh.*)[\.\+].*$', kernelver)
+        m = kerverrexp.match(kernelver)
         if m:
             kernelver_stripped = m.group(1)
-        path = d.getVar("PATH", True)
-
-        cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
+        cmd = "depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (dvar, dvar, kernelver, kernelver_stripped)
         f = os.popen(cmd, 'r')
 
         deps = {}
-        pattern0 = "^(.*\.k?o):..*$"
-        pattern1 = "^(.*\.k?o):\s*(.*\.k?o)\s*$"
-        pattern2 = "^(.*\.k?o):\s*(.*\.k?o)\s*\\\$"
-        pattern3 = "^\t(.*\.k?o)\s*\\\$"
-        pattern4 = "^\t(.*\.k?o)\s*$"
-
         line = f.readline()
         while line:
-            if not re.match(pattern0, line):
+            if not depmodpat0.match(line):
                 line = f.readline()
                 continue
-            m1 = re.match(pattern1, line)
+            m1 = depmodpat1.match(line)
             if m1:
                 deps[m1.group(1)] = m1.group(2).split()
             else:
-                m2 = re.match(pattern2, line)
+                m2 = depmodpat2.match(line)
                 if m2:
                     deps[m2.group(1)] = m2.group(2).split()
                     line = f.readline()
-                    m3 = re.match(pattern3, line)
+                    m3 = depmodpat3.match(line)
                     while m3:
                         deps[m2.group(1)].extend(m3.group(1).split())
                         line = f.readline()
-                        m3 = re.match(pattern3, line)
-                    m4 = re.match(pattern4, line)
+                        m3 = depmodpat3.match(line)
+                    m4 = depmodpat4.match(line)
                     deps[m2.group(1)].extend(m4.group(1).split())
             line = f.readline()
         f.close()
@@ -379,7 +376,6 @@ python populate_packages_prepend () {
         file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
 
         if module_deps.has_key(file):
-            import re
             dependencies = []
             for i in module_deps[file]:
                 m = re.match(pattern, os.path.basename(i))
@@ -392,7 +388,6 @@ python populate_packages_prepend () {
         return []
 
     def frob_metadata(file, pkg, pattern, format, basename):
-        import re
         vals = extract_modinfo(file)
 
         dvar = d.getVar('PKGD', True)
@@ -454,7 +449,6 @@ python populate_packages_prepend () {
         if len(os.listdir(dir)) == 0:
             os.rmdir(dir)
 
-    import re
     metapkg = "kernel-modules"
     blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
     for l in module_deps.values():
-- 
1.7.10.4



