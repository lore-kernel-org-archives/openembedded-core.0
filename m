Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sw8KW-0003Iw-OD
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 11:01:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2012 01:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190969717"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2012 01:49:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:49:37 +0300
Message-Id: <28a648a31776365c29615f4eae0308b01838ba39.1343723990.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 5/6] relocatable.bbclass: split it up, to reuse code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 09:01:29 -0000

Most of the code in relocatable.bbclass will be used for relocating the
SDK binaries. So, create another class chrpath.bbclass that will contain
the core of the relocatable.bbclass, so we can reuse it.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/chrpath.bbclass     |   89 +++++++++++++++++++++++++++++++++++++
 meta/classes/relocatable.bbclass |   91 +-------------------------------------
 2 files changed, 91 insertions(+), 89 deletions(-)
 create mode 100644 meta/classes/chrpath.bbclass

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
new file mode 100644
index 0000000..10b5ca0
--- /dev/null
+++ b/meta/classes/chrpath.bbclass
@@ -0,0 +1,89 @@
+CHRPATH_BIN ?= "chrpath"
+PREPROCESS_RELOCATE_DIRS ?= ""
+
+def process_dir (directory, d):
+    import subprocess as sub
+    import stat
+
+    cmd = d.expand('${CHRPATH_BIN}')
+    tmpdir = d.getVar('TMPDIR')
+    basedir = d.expand('${base_prefix}')
+
+    #bb.debug("Checking %s for binaries to process" % directory)
+    if not os.path.exists(directory):
+        return
+
+    dirs = os.listdir(directory)
+    for file in dirs:
+        fpath = directory + "/" + file
+        fpath = os.path.normpath(fpath)
+        if os.path.islink(fpath):
+            # Skip symlinks
+            continue
+
+        if os.path.isdir(fpath):
+            process_dir(fpath, d)
+        else:
+            #bb.note("Testing %s for relocatability" % fpath)
+
+            # We need read and write permissions for chrpath, if we don't have
+            # them then set them temporarily. Take a copy of the files
+            # permissions so that we can restore them afterwards.
+            perms = os.stat(fpath)[stat.ST_MODE]
+            if os.access(fpath, os.W_OK|os.R_OK):
+                perms = None
+            else:
+                # Temporarily make the file writeable so we can chrpath it
+                os.chmod(fpath, perms|stat.S_IRWXU)
+
+            p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+            err, out = p.communicate()
+            # If returned succesfully, process stderr for results
+            if p.returncode != 0:
+                continue
+
+            # Throw away everything other than the rpath list
+            curr_rpath = err.partition("RPATH=")[2]
+            #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
+            rpaths = curr_rpath.split(":")
+            new_rpaths = []
+            for rpath in rpaths:
+                # If rpath is already dynamic continue
+                if rpath.find("$ORIGIN") != -1:
+                    continue
+                # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
+                # base_prefix shared root
+                if rpath.find(basedir) != -1:
+                    depth = fpath.partition(basedir)[2].count('/')
+                    libpath = rpath.partition(basedir)[2].strip()
+                # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
+                # NOTE: This will not work reliably for cross packages, particularly in the case
+                # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
+                # rpath longer than that which is already set.
+                else:
+                    depth = fpath.rpartition(tmpdir)[2].count('/')
+                    libpath = rpath.partition(tmpdir)[2].strip()
+
+                base = "$ORIGIN"
+                while depth > 1:
+                    base += "/.."
+                    depth-=1
+                new_rpaths.append("%s%s" % (base, libpath))
+
+            # if we have modified some rpaths call chrpath to update the binary
+            if len(new_rpaths):
+                args = ":".join(new_rpaths)
+                #bb.note("Setting rpath for %s to %s" %(fpath, args))
+                sub.call([cmd, '-r', args, fpath])
+
+            if perms:
+                os.chmod(fpath, perms)
+
+def rpath_replace (path, d):
+    bindirs = d.expand("${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${libexecdir} ${PREPROCESS_RELOCATE_DIRS}").split()
+
+    for bindir in bindirs:
+        #bb.note ("Processing directory " + bindir)
+        directory = path + "/" + bindir
+        process_dir (directory, d)
+
diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.bbclass
index 072f533..4ca9981 100644
--- a/meta/classes/relocatable.bbclass
+++ b/meta/classes/relocatable.bbclass
@@ -1,93 +1,6 @@
-SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess"
-
-CHRPATH_BIN ?= "chrpath"
-PREPROCESS_RELOCATE_DIRS ?= ""
-
-def process_dir (directory, d):
-    import subprocess as sub
-    import stat
-
-    cmd = d.expand('${CHRPATH_BIN}')
-    tmpdir = d.getVar('TMPDIR')
-    basedir = d.expand('${base_prefix}')
-
-    #bb.debug("Checking %s for binaries to process" % directory)
-    if not os.path.exists(directory):
-        return
-
-    dirs = os.listdir(directory)
-    for file in dirs:
-        fpath = directory + "/" + file
-        fpath = os.path.normpath(fpath)
-        if os.path.islink(fpath):
-            # Skip symlinks
-            continue
-
-        if os.path.isdir(fpath):
-            process_dir(fpath, d)
-        else:
-            #bb.note("Testing %s for relocatability" % fpath)
-
-            # We need read and write permissions for chrpath, if we don't have
-            # them then set them temporarily. Take a copy of the files
-            # permissions so that we can restore them afterwards.
-            perms = os.stat(fpath)[stat.ST_MODE]
-            if os.access(fpath, os.W_OK|os.R_OK):
-                perms = None
-            else:
-                # Temporarily make the file writeable so we can chrpath it
-                os.chmod(fpath, perms|stat.S_IRWXU)
+inherit chrpath
 
-            p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
-            err, out = p.communicate()
-            # If returned succesfully, process stderr for results
-            if p.returncode != 0:
-                continue
-
-            # Throw away everything other than the rpath list
-            curr_rpath = err.partition("RPATH=")[2]
-            #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
-            rpaths = curr_rpath.split(":")
-            new_rpaths = []
-            for rpath in rpaths:
-                # If rpath is already dynamic continue
-                if rpath.find("$ORIGIN") != -1:
-                    continue
-                # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
-                # base_prefix shared root
-                if rpath.find(basedir) != -1:
-                    depth = fpath.partition(basedir)[2].count('/')
-                    libpath = rpath.partition(basedir)[2].strip()
-                # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
-                # NOTE: This will not work reliably for cross packages, particularly in the case
-                # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
-                # rpath longer than that which is already set.
-                else:
-                    depth = fpath.rpartition(tmpdir)[2].count('/')
-                    libpath = rpath.partition(tmpdir)[2].strip()
-
-                base = "$ORIGIN"
-                while depth > 1:
-                    base += "/.."
-                    depth-=1
-                new_rpaths.append("%s%s" % (base, libpath))
-
-            # if we have modified some rpaths call chrpath to update the binary
-            if len(new_rpaths):
-                args = ":".join(new_rpaths)
-                #bb.note("Setting rpath for %s to %s" %(fpath, args))
-                sub.call([cmd, '-r', args, fpath])
-
-            if perms:
-                os.chmod(fpath, perms)
-
-def rpath_replace (path, d):
-    bindirs = d.expand("${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdir} ${libexecdir} ${PREPROCESS_RELOCATE_DIRS}").split()
-
-    for bindir in bindirs:
-        #bb.note ("Processing directory " + bindir)
-        directory = path + "/" + bindir
-        process_dir (directory, d)
+SYSROOT_PREPROCESS_FUNCS += "relocatable_binaries_preprocess"
 
 python relocatable_binaries_preprocess() {
     rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
-- 
1.7.9.5



