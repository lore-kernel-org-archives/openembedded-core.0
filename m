Return-Path: <michael.blaettler@siemens.com>
X-Greylist: delayed 1383 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Oct 2016 08:47:10 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 889D1719DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 08:47:10 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u9O8O5QV020179
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 10:24:06 +0200
Received: from dev.sbt.siemens.com (MD1F3VPC.ww002.siemens.net [139.16.77.53])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id u9O8O5NW000869;
	Mon, 24 Oct 2016 10:24:05 +0200
Received: by dev.sbt.siemens.com (Postfix, from userid 1000)
	id 99F42844D00; Mon, 24 Oct 2016 10:24:05 +0200 (CEST)
From: =?UTF-8?q?Michael=20Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Oct 2016 10:23:34 +0200
Message-Id: <1477297414-14338-1-git-send-email-michael.blaettler@siemens.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] package.py: New EXTRA_STRIPFLAGS variable
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
X-List-Received-Date: Mon, 24 Oct 2016 08:47:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EXTRA_STRIPFLAGS variable can be used to pass additional parameters to the strip command.
This can be used to remove additional sections or to keep symbols.
The removal of additional sections can be useful to enable reproducible builds.
Sections which contain paths or md5sums of the debug binaries (like gnu_debuglink)
can be eliminated with this flag.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Michael Blättler <michael.blaettler@siemens.com>
---
 meta/classes/package.bbclass |  5 +++--
 meta/lib/oe/package.py       | 13 ++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..cd93643 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1055,14 +1055,15 @@ python split_and_strip_files () {
     # Now lets go back over things and strip them
     #
     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
+        extraflags = d.getVar('EXTRA_STRIP', False)
         strip = d.getVar("STRIP", True)
         sfiles = []
         for file in elffiles:
             elf_file = int(elffiles[file])
             #bb.note("Strip %s" % file)
-            sfiles.append((file, elf_file, strip))
+            sfiles.append((file, elf_file, strip, extraflags))
         for f in kernmods:
-            sfiles.append((f, 16, strip))
+            sfiles.append((f, 16, strip, extraflags))
 
         oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 02642f2..757044a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -10,7 +10,7 @@ def runstrip(arg):
 
     import stat, subprocess
 
-    (file, elftype, strip) = arg
+    (file, elftype, strip, extraflags) = arg
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -18,17 +18,16 @@ def runstrip(arg):
         newmode = origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
 
-    extraflags = ""
-
-    # kernel module    
+    extraflags += ' '
+    # kernel module
     if elftype & 16:
-        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
+        extraflags += "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
     # .so and shared library
     elif ".so" in file and elftype & 8:
-        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
+        extraflags += "--remove-section=.comment --remove-section=.note --strip-unneeded"
     # shared or executable:
     elif elftype & 8 or elftype & 4:
-        extraflags = "--remove-section=.comment --remove-section=.note"
+        extraflags += "--remove-section=.comment --remove-section=.note"
 
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
-- 
2.1.4


