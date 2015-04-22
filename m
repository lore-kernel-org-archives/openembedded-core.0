Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 39959605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 19:57:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2015 12:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,625,1422950400"; d="scan'208";a="717660003"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2015 12:57:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9397A6A408D;
	Wed, 22 Apr 2015 12:56:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 22:57:18 +0300
Message-Id: <1429732638-18404-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429704663-9104-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1429704663-9104-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH] split_and_strip_files: regroup hardlinks to make build deterministic
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
X-List-Received-Date: Wed, 22 Apr 2015 19:57:27 -0000

Reverted 7c0fd561bad0250a00cef63e3d787573112a59cf

Created separate group of hardlinks for the files inside
the same package. This should prevent stripped files to be
populated outside of package directories.

[YOCTO #7586]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/package.bbclass | 10 ++++++++++
 meta/lib/oe/package.py       |  3 +--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f1b966d..b9748e7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -877,6 +877,7 @@ python split_and_strip_files () {
     symlinks = {}
     hardlinks = {}
     kernmods = []
+    inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
     if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
@@ -914,6 +915,15 @@ python split_and_strip_files () {
                             #bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
                             symlinks[file] = target
                         continue
+
+                    if s.st_ino in inodes:
+                        os.unlink(file)
+                        os.link(inodes[s.st_ino], file)
+                    elif s.st_nlink > 1:
+                        inodes[s.st_ino] = file
+                        # break hardlink
+                        bb.utils.copyfile(file, file)
+
                     # It's a file (or hardlink), not a link
                     # ...but is it ELF, and is it already stripped?
                     elf_file = isELF(file)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8bc56c6..ea6feaa 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -30,8 +30,7 @@ def runstrip(arg):
     elif elftype & 8 or elftype & 4:
         extraflags = "--remove-section=.comment --remove-section=.note"
 
-    # Use mv to break hardlinks
-    stripcmd = "'%s' %s '%s' -o '%s.tmp' && chown --reference='%s' '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file, file, file)
+    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
     ret = subprocess.call(stripcmd, shell=True)
-- 
2.1.4


