Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Yci-0002FG-Hc
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:26:50 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE67sb007221; Wed, 30 Jan 2013 14:06:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cNaW1KG7i-Kg; Wed, 30 Jan 2013 14:06:07 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE623m007174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:03 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDy-000839-FR; Wed, 30 Jan 2013 14:01:14 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:00:59 +0000
Message-Id: <50381a223c2368c27fb6bf0cceca1d4948a0eef9.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/17] package.bbclass: Improve kernel module handling
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
X-List-Received-Date: Wed, 30 Jan 2013 14:34:54 -0000

Currently the kernel module handling consists of several special cases
and has its own path walking. This refactors the code to handle them in
a more standardised way which is also a bit more efficient.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0be84ed..0f11ba9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -325,10 +325,6 @@ def runstrip(file, elftype, d):
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
     strip = d.getVar("STRIP", True)
 
-    # Handle kernel modules specifically - .debug directories here are pointless
-    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-        return subprocess.call("%s'%s' --strip-debug --remove-section=.comment --remove-section=.note --preserve-dates '%s'" % (pathprefix, strip, file), shell=True)
-
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
         origmode = os.stat(file)[stat.ST_MODE]
@@ -337,15 +333,14 @@ def runstrip(file, elftype, d):
 
     extraflags = ""
     
-    # split_and_strip_files is calling this with elf_type None, causing:
-    # TypeError: unsupported operand type(s) for &: 'NoneType' and 'int'
-    if elftype:
-        # .so and shared library
-        if ".so" in file and elftype & 8:
-            extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
-        # shared or executable:
-        elif elftype & 8 or elftype & 4:
-            extraflags = "--remove-section=.comment --remove-section=.note"
+    # .so and shared library
+    if elftype & 16:
+        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+    elif ".so" in file and elftype & 8:
+        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+    # shared or executable:
+    elif elftype & 8 or elftype & 4:
+        extraflags = "--remove-section=.comment --remove-section=.note"
 
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
@@ -749,6 +744,7 @@ python split_and_strip_files () {
     # 2 - stripped
     # 4 - executable
     # 8 - shared library
+    # 16 - kernel module
     def isELF(path):
         type = 0
         pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
@@ -775,11 +771,16 @@ python split_and_strip_files () {
     #
     file_list = {}
     file_links = {}
+    kernmods = []
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1') and \
             (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
         for root, dirs, files in os.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
+                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
+                    kernmods.append(file)
+                    continue
+
                 # Only process files (and symlinks)... Skip files that are obviously debug files
                 if not (debugappend != "" and file.endswith(debugappend)) and \
                    not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and \
@@ -910,14 +911,8 @@ python split_and_strip_files () {
                 elf_file = int(file_list[file][5:])
                 #bb.note("Strip %s" % file)
                 runstrip(file, elf_file, d)
-
-
-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
-        for root, dirs, files in os.walk(dvar):
-            for f in files:
-                if not f.endswith(".ko"):
-                    continue
-                runstrip(os.path.join(root, f), 0, d)
+        for f in kernmods:
+            runstrip(f, 16, d)
     #
     # End of strip
     #
-- 
1.7.10.4



