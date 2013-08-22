Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 26F7D6B41B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg904001260; Thu, 22 Aug 2013 12:42:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P9sW_swzW1_s; Thu, 22 Aug 2013 12:42:18 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9tH001243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:10 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5c-0001jh-Nz; Thu, 22 Aug 2013 12:30:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:30:00 +0100
Message-Id: <1377171000-6469-28-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 28/28] chrpath: Add support for relocating darwin binaries
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:38 -0000

On darwin, install_name_tool can be used to relocate binaries/libraries. This
adds support for adjusting them with relative paths rather than hardcoded ones.
The Linux code is factored out into a function but is otherwise unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/chrpath.bbclass | 138 +++++++++++++++++++++++++++----------------
 1 file changed, 88 insertions(+), 50 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 0c7ab77..61a24b3 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -1,18 +1,103 @@
 CHRPATH_BIN ?= "chrpath"
 PREPROCESS_RELOCATE_DIRS ?= ""
 
-def process_dir (directory, d):
+def process_file_linux(cmd, fpath, basedir, tmpdir, d):
     import subprocess as sub
+
+    p = sub.Popen([cmd, '-l', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+    err, out = p.communicate()
+    # If returned succesfully, process stderr for results
+    if p.returncode != 0:
+        return
+
+    # Throw away everything other than the rpath list
+    curr_rpath = err.partition("RPATH=")[2]
+    #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
+    rpaths = curr_rpath.split(":")
+    new_rpaths = []
+    for rpath in rpaths:
+        # If rpath is already dynamic copy it to new_rpath and continue
+        if rpath.find("$ORIGIN") != -1:
+            new_rpaths.append(rpath.strip())
+            continue
+        rpath =  os.path.normpath(rpath)
+        # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
+        # base_prefix shared root
+        if rpath.find(basedir) != -1:
+            depth = fpath.partition(basedir)[2].count('/')
+            libpath = rpath.partition(basedir)[2].strip()
+        # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
+        # NOTE: This will not work reliably for cross packages, particularly in the case
+        # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
+        # rpath longer than that which is already set.
+        elif rpath.find(tmpdir) != -1:
+            depth = fpath.rpartition(tmpdir)[2].count('/')
+            libpath = rpath.partition(tmpdir)[2].strip()
+        else:
+            new_rpaths.append(rpath.strip())
+            return
+        base = "$ORIGIN"
+        while depth > 1:
+            base += "/.."
+            depth-=1
+        new_rpaths.append("%s%s" % (base, libpath))
+
+    # if we have modified some rpaths call chrpath to update the binary
+    if len(new_rpaths):
+        args = ":".join(new_rpaths)
+        #bb.note("Setting rpath for %s to %s" %(fpath, args))
+        p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+        out, err = p.communicate()
+        if p.returncode != 0:
+            bb.error("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
+            raise bb.build.FuncFailed
+
+def process_file_darwin(cmd, fpath, basedir, tmpdir, d):
+    import subprocess as sub
+
+    p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+    err, out = p.communicate()
+    # If returned succesfully, process stderr for results
+    if p.returncode != 0:
+        return
+    for l in err.split("\n"):
+        if "(compatibility" not in l:
+            continue
+        rpath = l.partition("(compatibility")[0].strip()
+        if rpath.find(basedir) != -1:
+            depth = fpath.partition(basedir)[2].count('/')
+            libpath = rpath.partition(basedir)[2].strip()
+        else:
+            continue
+
+        base = "@loader_path"
+        while depth > 1:
+            base += "/.."
+            depth-=1
+        base = base + libpath
+        p = sub.Popen([d.expand("${HOST_PREFIX}install_name_tool"), '-change', rpath, base, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+        err, out = p.communicate()
+
+def process_dir (directory, d):
     import stat
 
     cmd = d.expand('${CHRPATH_BIN}')
     tmpdir = os.path.normpath(d.getVar('TMPDIR'))
     basedir = os.path.normpath(d.expand('${base_prefix}'))
+    hostos = d.getVar("HOST_OS", True)
 
     #bb.debug("Checking %s for binaries to process" % directory)
     if not os.path.exists(directory):
         return
 
+    if "linux" in hostos:
+        process_file = process_file_linux
+    elif "darwin" in hostos:
+        process_file = process_file_darwin
+    else:
+        # Relocations not supported
+        return
+
     dirs = os.listdir(directory)
     for file in dirs:
         fpath = directory + "/" + file
@@ -35,55 +120,8 @@ def process_dir (directory, d):
             else:
                 # Temporarily make the file writeable so we can chrpath it
                 os.chmod(fpath, perms|stat.S_IRWXU)
-
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
-                # If rpath is already dynamic copy it to new_rpath and continue
-                if rpath.find("$ORIGIN") != -1:
-                    new_rpaths.append(rpath.strip())
-                    continue
-                rpath =  os.path.normpath(rpath)
-                # If the rpath shares a root with base_prefix determine a new dynamic rpath from the
-                # base_prefix shared root
-                if rpath.find(basedir) != -1:
-                    depth = fpath.partition(basedir)[2].count('/')
-                    libpath = rpath.partition(basedir)[2].strip()
-                # otherwise (i.e. cross packages) determine a shared root based on the TMPDIR
-                # NOTE: This will not work reliably for cross packages, particularly in the case
-                # where your TMPDIR is a short path (i.e. /usr/poky) as chrpath cannot insert an
-                # rpath longer than that which is already set.
-                elif rpath.find(tmpdir) != -1:
-                    depth = fpath.rpartition(tmpdir)[2].count('/')
-                    libpath = rpath.partition(tmpdir)[2].strip()
-                else:
-                    new_rpaths.append(rpath.strip())
-                    continue
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
-                p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
-                out, err = p.communicate()
-                if p.returncode != 0:
-                    bb.error("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
-                    raise bb.build.FuncFailed
-
+            process_file(cmd, fpath, basedir, tmpdir, d)
+                
             if perms:
                 os.chmod(fpath, perms)
 
-- 
1.8.1.2


