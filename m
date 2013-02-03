Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fE-0002bV-E4
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401FUH020480; Mon, 4 Feb 2013 00:01:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ktMoYJiZmiNP; Mon,  4 Feb 2013 00:01:15 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14019cc020446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:10 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Ph-0000X7-6n; Sun, 03 Feb 2013 23:55:57 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:33 +0000
Message-Id: <bda5674ec4d39456cc53b1cf22f349f4880d3202.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/22] package: Process package stripping in parallel
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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   58 ++++++++++--------------------------------
 meta/lib/oe/package.py       |   45 ++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 45 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 527ef31..9c8cdbc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -309,49 +309,6 @@ def copydebugsources(debugsrcdir, d):
             if os.path.exists(p) and not os.listdir(p):
                 os.rmdir(p)
 
-def runstrip(file, elftype, d):
-    # Function to strip a single file, called from split_and_strip_files below
-    # A working 'file' (one which works on the target architecture)
-    #
-    # The elftype is a bit pattern (explained in split_and_strip_files) to tell
-    # us what type of file we're processing...
-    # 4 - executable
-    # 8 - shared library
-
-    import commands, stat, subprocess
-
-    strip = d.getVar("STRIP", True)
-
-    newmode = None
-    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
-        origmode = os.stat(file)[stat.ST_MODE]
-        newmode = origmode | stat.S_IWRITE | stat.S_IREAD
-        os.chmod(file, newmode)
-
-    extraflags = ""
-    
-    # .so and shared library
-    if elftype & 16:
-        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
-    elif ".so" in file and elftype & 8:
-        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
-    # shared or executable:
-    elif elftype & 8 or elftype & 4:
-        extraflags = "--remove-section=.comment --remove-section=.note"
-
-    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
-    bb.debug(1, "runstrip: %s" % stripcmd)
-
-    ret = subprocess.call(stripcmd, shell=True)
-
-    if newmode:
-        os.chmod(file, origmode)
-
-    if ret:
-        bb.error("runstrip: '%s' strip command failed" % stripcmd)
-
-    return 0
-
 #
 # Package data handling routines
 #
@@ -902,13 +859,24 @@ python split_and_strip_files () {
     # Now lets go back over things and strip them
     #
     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
+        strip = d.getVar("STRIP", True)
+        sfiles = []
         for file in file_list:
             if file_list[file].startswith("ELF: "):
                 elf_file = int(file_list[file][5:])
                 #bb.note("Strip %s" % file)
-                runstrip(file, elf_file, d)
+                sfiles.append((file, elf_file, strip))
         for f in kernmods:
-            runstrip(f, 16, d)
+            sfiles.append((f, 16, strip))
+
+
+        import multiprocessing
+        nproc = multiprocessing.cpu_count()
+        pool = multiprocessing.Pool(nproc)
+        processed = pool.imap(oe.package.runstrip, sfiles)
+        pool.close()
+        pool.join()
+
     #
     # End of strip
     #
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 6b1c1f4..9a0ddb8 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1,3 +1,48 @@
+def runstrip(arg):
+    # Function to strip a single file, called from split_and_strip_files below
+    # A working 'file' (one which works on the target architecture)
+    #
+    # The elftype is a bit pattern (explained in split_and_strip_files) to tell
+    # us what type of file we're processing...
+    # 4 - executable
+    # 8 - shared library
+    # 16 - kernel module
+
+    import commands, stat, subprocess
+
+    (file, elftype, strip) = arg
+
+    newmode = None
+    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
+        origmode = os.stat(file)[stat.ST_MODE]
+        newmode = origmode | stat.S_IWRITE | stat.S_IREAD
+        os.chmod(file, newmode)
+
+    extraflags = ""
+
+    # kernel module    
+    if elftype & 16:
+        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+    # .so and shared library
+    elif ".so" in file and elftype & 8:
+        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+    # shared or executable:
+    elif elftype & 8 or elftype & 4:
+        extraflags = "--remove-section=.comment --remove-section=.note"
+
+    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
+    bb.debug(1, "runstrip: %s" % stripcmd)
+
+    ret = subprocess.call(stripcmd, shell=True)
+
+    if newmode:
+        os.chmod(file, origmode)
+
+    if ret:
+        bb.error("runstrip: '%s' strip command failed" % stripcmd)
+
+    return
+
 
 def file_translate(file):
     ft = file.replace("@", "@at@")
-- 
1.7.10.4



