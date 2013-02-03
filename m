Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fC-0002bT-NQ
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:11:59 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401ENT020472; Mon, 4 Feb 2013 00:01:14 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 53FX2XDdl5Y8; Mon,  4 Feb 2013 00:01:14 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14018nX020444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:09 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pg-0000Wz-I9; Sun, 03 Feb 2013 23:55:56 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:31 +0000
Message-Id: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/22] package.bbclass: Multithread per file dependency generation code
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:08 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                |    2 +-
 meta/classes/package.bbclass             |   92 +++++++++++-------------------
 meta/classes/update-alternatives.bbclass |    2 +-
 meta/lib/oe/package.py                   |   51 +++++++++++++++++
 4 files changed, 85 insertions(+), 62 deletions(-)
 create mode 100644 meta/lib/oe/package.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4662d3b..5f43733 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup oe.sstatesig oe.lsb"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.package oe.packagegroup oe.sstatesig oe.lsb"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fec3db6..cafab1e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1236,83 +1236,55 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps-oecore --macros ${STAGING_LI
 #  FILERDEPENDS_filepath_pkg - per file dep
 
 python package_do_filedeps() {
-    import re
-
     if d.getVar('SKIP_FILEDEPS', True) == '1':
         return
 
     pkgdest = d.getVar('PKGDEST', True)
     packages = d.getVar('PACKAGES', True)
-
     rpmdeps = d.expand("${RPMDEPS}")
-    r = re.compile(r'[<>=]+ +[^ ]*')
-
-    def file_translate(file):
-        ft = file.replace("@", "@at@")
-        ft = ft.replace(" ", "@space@")
-        ft = ft.replace("\t", "@tab@")
-        ft = ft.replace("[", "@openbrace@")
-        ft = ft.replace("]", "@closebrace@")
-        ft = ft.replace("_", "@underscore@")
-        return ft
-
-    # Quick routine to process the results of the rpmdeps call...
-    def process_deps(pipe, pkg, provides_files, requires_files):
-        provides = {}
-        requires = {}
-
-        for line in pipe:
-            f = line.split(" ", 1)[0].strip()
-            line = line.split(" ", 1)[1].strip()
-
-            if line.startswith("Requires:"):
-                i = requires
-            elif line.startswith("Provides:"):
-                i = provides
-            else:
-                continue
-
-            file = f.replace(pkgdest + "/" + pkg, "")
-            file = file_translate(file)
-            value = line.split(":", 1)[1].strip()
-            value = r.sub(r'(\g<0>)', value)
-
-            if value.startswith("rpmlib("):
-                continue
-            if value == "python":
-                continue
-            if file not in i:
-                i[file] = []
-            i[file].append(value)
-
-        for file in provides:
-            provides_files.append(file)
-            key = "FILERPROVIDES_" + file + "_" + pkg
-            d.setVar(key, " ".join(provides[file]))
-
-        for file in requires:
-            requires_files.append(file)
-            key = "FILERDEPENDS_" + file + "_" + pkg
-            d.setVar(key, " ".join(requires[file]))
 
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
 
-    # Determine dependencies
+    pkglist = []
     for pkg in packages.split():
         if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
             continue
+        for files in chunks(pkgfiles[pkg], 100):
+            pkglist.append((pkg, files, rpmdeps, pkgdest))
 
-        provides_files = []
-        requires_files = []
+    import multiprocessing
+    nproc = multiprocessing.cpu_count()
+    pool = multiprocessing.Pool(nproc)
+    processed = pool.imap(oe.package.filedeprunner, pkglist)
+    pool.close()
+    pool.join()
 
-        for files in chunks(pkgfiles[pkg], 100):
-            dep_pipe = os.popen(rpmdeps + " " + " ".join(files))
+    provides_files = {}
+    requires_files = {}
+
+    for result in processed:
+        (pkg, provides, requires) = result
+
+        if pkg not in provides_files:
+            provides_files[pkg] = []
+        if pkg not in requires_files:
+            requires_files[pkg] = []
 
-            process_deps(dep_pipe, pkg, provides_files, requires_files)
+        for file in provides:
+            provides_files[pkg].append(file)
+            key = "FILERPROVIDES_" + file + "_" + pkg
+            d.setVar(key, " ".join(provides[file]))
+
+        for file in requires:
+            requires_files[pkg].append(file)
+            key = "FILERDEPENDS_" + file + "_" + pkg
+            d.setVar(key, " ".join(requires[file]))
 
-        d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files))
-        d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files))
+    for pkg in requires_files:
+        d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files[pkg]))
+    for pkg in provides_files:
+        d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files[pkg]))
 }
 
 def getshlibsdirs(d):
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index a75e282..90bc56b 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -353,7 +353,7 @@ python package_do_filedeps_append () {
                 continue
 
             # Add file provide
-            trans_target = file_translate(alt_target)
+            trans_target = oe.package.file_translate(alt_target)
             d.appendVar('FILERPROVIDES_%s_%s' % (trans_target, pkg), " " + alt_link)
             if not trans_target in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or ""):
                 d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + trans_target)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
new file mode 100644
index 0000000..6b1c1f4
--- /dev/null
+++ b/meta/lib/oe/package.py
@@ -0,0 +1,51 @@
+
+def file_translate(file):
+    ft = file.replace("@", "@at@")
+    ft = ft.replace(" ", "@space@")
+    ft = ft.replace("\t", "@tab@")
+    ft = ft.replace("[", "@openbrace@")
+    ft = ft.replace("]", "@closebrace@")
+    ft = ft.replace("_", "@underscore@")
+    return ft
+
+def filedeprunner(arg):
+    import re
+
+    (pkg, pkgfiles, rpmdeps, pkgdest) = arg
+    provides = {}
+    requires = {}
+
+    r = re.compile(r'[<>=]+ +[^ ]*')
+
+    def process_deps(pipe, pkg, pkgdest, provides, requires):
+        for line in pipe:
+            f = line.split(" ", 1)[0].strip()
+            line = line.split(" ", 1)[1].strip()
+
+            if line.startswith("Requires:"):
+                i = requires
+            elif line.startswith("Provides:"):
+                i = provides
+            else:
+                continue
+
+            file = f.replace(pkgdest + "/" + pkg, "")
+            file = file_translate(file)
+            value = line.split(":", 1)[1].strip()
+            value = r.sub(r'(\g<0>)', value)
+
+            if value.startswith("rpmlib("):
+                continue
+            if value == "python":
+                continue
+            if file not in i:
+                i[file] = []
+            i[file].append(value)
+
+        return provides, requires
+
+    dep_pipe = os.popen(rpmdeps + " " + " ".join(pkgfiles))
+
+    provides, requires = process_deps(dep_pipe, pkg, pkgdest, provides, requires)
+
+    return (pkg, provides, requires)
-- 
1.7.10.4



