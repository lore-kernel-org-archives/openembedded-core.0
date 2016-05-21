Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B14C606D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBQoKa004217 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:26:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fVQPc1ZDe7-7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:26:50 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBQj2Q004214
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:26:46 +0100
Message-ID: <1463830005.4578.170.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 12:26:45 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] meta/scripts: python3: rename file -> open
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
X-List-Received-Date: Sat, 21 May 2016 11:26:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

file() API doesn't exist in python 3, convert to open(). Also handle
some cases where files aren't closed. Compatible with python 2.7.

[Contributions from Ed and Richard]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b151c2..116abc4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -177,9 +177,8 @@ def package_qa_write_error(type, error, d):
     logfile = d.getVar('QA_LOGFILE', True)
     if logfile:
         p = d.getVar('P', True)
-        f = file( logfile, "a+")
-        print >> f, "%s: %s [%s]" % (p, error, type)
-        f.close()
+        with open(logfile, "a+") as f:
+            f.write("%s: %s [%s]" % (p, error, type))
 
 def package_qa_handle_error(error_class, error_msg, d):
     package_qa_write_error(error_class, error_msg, d)
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index cc2902f..2c30141 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -43,9 +43,9 @@ class ELFFile:
         if not os.path.isfile(self.name):
             raise NotELFFileError("%s is not a normal file" % self.name)
 
-        self.file = file(self.name, "r")
-        # Read 4k which should cover most of the headers we're after
-        self.data = self.file.read(4096)
+        with open(self.name, "rb") as f:
+            # Read 4k which should cover most of the headers we're after
+            self.data = f.read(4096)
 
         if len(self.data) < ELFFile.EI_NIDENT + 4:
             raise NotELFFileError("%s is not an ELF" % self.name)
diff --git a/meta/lib/oe/tests/test_path.py b/meta/lib/oe/tests/test_path.py
index 3d41ce1..5fa2448 100644
--- a/meta/lib/oe/tests/test_path.py
+++ b/meta/lib/oe/tests/test_path.py
@@ -55,7 +55,7 @@ class TestRealPath(unittest.TestCase):
         for d in self.DIRS:
             os.mkdir(os.path.join(self.root, d))
         for f in self.FILES:
-            file(os.path.join(self.root, f), "w")
+            open(os.path.join(self.root, f), "w")
         for l in self.LINKS:
             os.symlink(l[1], os.path.join(self.root, l[0]))
 
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 27cc9ff..59aa04e 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -18,7 +18,7 @@ python do_install () {
 
 python do_install_config () {
     indir = os.path.dirname(d.getVar('FILE',1))
-    infile = file(oe.path.join(indir, 'files', 'apt.conf'), 'r')
+    infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
     data = infile.read()
     infile.close()
 
@@ -30,7 +30,7 @@ python do_install_config () {
 
     outpath = oe.path.join(outdir, 'apt.conf.sample')
     if not os.path.exists(outpath):
-        outfile = file(outpath, 'w')
+        outfile = open(outpath, 'w')
         outfile.write(data)
         outfile.close()
 }
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index d93c943..48be3a6 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -153,7 +153,7 @@ if __name__ == "__main__":
             os.unlink(sys.argv[1])
         except Exception:
             sys.exc_clear()
-        outfile = file( sys.argv[1], "w" )
+        outfile = open( sys.argv[1], "w" )
     else:
         outfile = sys.stdout
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 367b4b8..a7b38d2 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -156,7 +156,7 @@ if __name__ == "__main__":
             os.unlink(sys.argv[1])
         except Exception:
             sys.exc_clear()
-        outfile = file( sys.argv[1], "w" )
+        outfile = open( sys.argv[1], "w" )
     else:
         outfile = sys.stdout
 
diff --git a/scripts/swabber-strace-attach b/scripts/swabber-strace-attach
index bb0391a..f258987 100755
--- a/scripts/swabber-strace-attach
+++ b/scripts/swabber-strace-attach
@@ -16,8 +16,8 @@ else:
     sys.exit()
 
 
-si = file(os.devnull, 'r')
-so = file(sys.argv[2], 'w')
+si = open(os.devnull, 'r')
+so = open(sys.argv[2], 'w')
 se = so
 
 # Replace those fds with our own



