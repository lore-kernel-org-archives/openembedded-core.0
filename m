Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3310B6CA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 22:15:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQMEso9002528; Tue, 26 Nov 2013 22:14:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fQz85CEEvqJM; Tue, 26 Nov 2013 22:14:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQMEo51002516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Nov 2013 22:14:51 GMT
Message-ID: <1385504087.11246.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 22:14:47 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] chrpath: Improve crazy code
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
X-List-Received-Date: Tue, 26 Nov 2013 22:15:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current code is a little bit overcomplicated, deficient and also
possibly broken.

Issues include:

a) Not maximally optisming rpaths (e.g. a lib in usr/lib might get an
   rpath of $ORIGIN/../../usr/lib)
b) The return in the middle of the for loop look suspiciously like
   it might break on some binaries
c) The depth function, loops of "../" prepending and so on can
   be replaced with a call to os.path.relpath

This patch cleans up the above issues.

Running binaries should result in less "../" resolutions which can't
hurt performance either.

[YOCTO #3989]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 61a24b3..7bdb1b9 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -1,7 +1,7 @@
 CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
-def process_file_linux(cmd, fpath, basedir, tmpdir, d):
+def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     import subprocess as sub
 
     p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
@@ -15,35 +15,21 @@ def process_file_linux(cmd, fpath, basedir, tmpdir, d):
     #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
     rpaths = curr_rpath.split(":")
     new_rpaths = []
+    modified = False
     for rpath in rpaths:
         # If rpath is already dynamic copy it to new_rpath and continue
         if rpath.find("$ORIGIN") != -1:
             new_rpaths.append(rpath.strip())
             continue
         rpath =  os.path.normpath(rpath)
-        # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
-        # base_prefix shared root
-        if rpath.find(basedir) != -1:
-            depth = fpath.partition(basedir)[2].count('/')
-            libpath = rpath.partition(basedir)[2].strip()
-        # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
-        # NOTE: This will not work reliably for cross packages, particularly in the case
-        # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
-        # rpath longer than that which is already set.
-        elif rpath.find(tmpdir) != -1:
-            depth = fpath.rpartition(tmpdir)[2].count('/')
-            libpath = rpath.partition(tmpdir)[2].strip()
-        else:
+        if baseprefix not in rpath and tmpdir not in rpath:
             new_rpaths.append(rpath.strip())
-            return
-        base = "$ORIGIN"
-        while depth > 1:
-            base += "/.."
-            depth-=1
-        new_rpaths.append("%s%s" % (base, libpath))
+            continue
+        new_rpaths.append("$ORIGIN/" + os.path.relpath(rpath.strip(), os.path.dirname(fpath.replace(rootdir, "/"))))
+        modified = True
 
     # if we have modified some rpaths call chrpath to update the binary
-    if len(new_rpaths):
+    if modified:
         args = ":".join(new_rpaths)
         #bb.note("Setting rpath for %s to %s" %(fpath, args))
         p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
@@ -52,7 +38,7 @@ def process_file_linux(cmd, fpath, basedir, tmpdir, d):
             bb.error("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
             raise bb.build.FuncFailed
 
-def process_file_darwin(cmd, fpath, basedir, tmpdir, d):
+def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     import subprocess as sub
 
     p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
@@ -64,26 +50,20 @@ def process_file_darwin(cmd, fpath, basedir, tmpdir, d):
         if "(compatibility" not in l:
             continue
         rpath = l.partition("(compatibility")[0].strip()
-        if rpath.find(basedir) != -1:
-            depth = fpath.partition(basedir)[2].count('/')
-            libpath = rpath.partition(basedir)[2].strip()
-        else:
+        if baseprefix not in rpath:
             continue
 
-        base = "@loader_path"
-        while depth > 1:
-            base += "/.."
-            depth-=1
-        base = base + libpath
-        p = sub.Popen([d.expand("${HOST_PREFIX}install_name_tool"), '-change', rpath, base, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+        newpath = "@loader_path/" + os.path.relpath(rpath, os.path.dirname(fpath.replace(rootdir, "/")))
+        bb.warn("%s %s %s %s" % (fpath, rpath, newpath, rootdir))
+        p = sub.Popen([d.expand("${HOST_PREFIX}install_name_tool"), '-change', rpath, newpath, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
         err, out = p.communicate()
 
-def process_dir (directory, d):
+def process_dir (rootdir, directory, d):
     import stat
 
     cmd = d.expand('${CHRPATH_BIN}')
     tmpdir = os.path.normpath(d.getVar('TMPDIR'))
-    basedir = os.path.normpath(d.expand('${base_prefix}'))
+    baseprefix = os.path.normpath(d.expand('${base_prefix}'))
     hostos = d.getVar("HOST_OS", True)
 
     #bb.debug("Checking %s for binaries to process" % directory)
@@ -107,7 +87,7 @@ def process_dir (directory, d):
             continue
 
         if os.path.isdir(fpath):
-            process_dir(fpath, d)
+            process_dir(rootdir, fpath, d)
         else:
             #bb.note("Testing %s for relocatability" % fpath)
 
@@ -120,7 +100,7 @@ def process_dir (directory, d):
             else:
                 # Temporarily make the file writeable so we can chrpath it
                 os.chmod(fpath, perms|stat.S_IRWXU)
-            process_file(cmd, fpath, basedir, tmpdir, d)
+            process_file(cmd, fpath, rootdir, baseprefix, tmpdir, d)
                 
             if perms:
                 os.chmod(fpath, perms)
@@ -131,5 +111,5 @@ def rpath_replace (path, d):
     for bindir in bindirs:
         #bb.note ("Processing directory " + bindir)
         directory = path + "/" + bindir
-        process_dir (directory, d)
+        process_dir (path, directory, d)
 



