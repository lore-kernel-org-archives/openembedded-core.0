Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O0-0008Qm-BP
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103309"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:40:01 -0700
Message-Id: <9608b31b9c7d909f86c6fe62172a61ba502c61c6.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 17/23] cleanup-workdir: update the way to check obsolete dirs
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:57 -0000

From: Kang Kai <kai.kang@windriver.com>

Update the way to check obsolete directories.

According to package and its version construct a list of all packages'
current build directory. If any directory under $WORKDIR/*/ is not in
the list will be removed.

At same time, all the files(vs. directory) under $WORKDIR and
$WORKDIR/*/ will be removed because they are not created by poky.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/cleanup-workdir |   59 ++++++++++++++++++----------------------------
 1 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index b77e8c6..3739a00 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -22,7 +22,7 @@ import re
 import commands
 import shutil
 
-versions = {}
+pkg_cur_dirs = []
 obsolete_dirs = []
 parser = None
 
@@ -39,15 +39,6 @@ def parse_version(verstr):
     else:
         return epoch + '_' + elems[1]
 
-def parse_dir(match, pkgabsdir):
-    pkg_name = match.group(1)
-    pkg_version = match.group(2)
-    if pkg_name in versions:
-        if pkg_version != versions[pkg_name]:
-            obsolete_dirs.append(pkgabsdir)
-        return True
-    return False
-
 def main():
     global parser
     parser = optparse.OptionParser(
@@ -89,7 +80,7 @@ This script must be ran under BUILDDIR after source file \"oe-init-build-env\"."
             version = parse_version(elems[1])
         else:
             version = parse_version(elems[2])
-        versions[elems[0]] = version
+        pkg_cur_dirs.append(elems[0] + '-' + version)
 
     cmd = "bitbake -e | grep ^TMPDIR"
     (ret, output) = commands.getstatusoutput(cmd)
@@ -103,31 +94,27 @@ This script must be ran under BUILDDIR after source file \"oe-init-build-env\"."
         print "WORKDIR %s does NOT exist. Quit." % workdir
         return 1
 
-    for archdir in os.listdir(workdir):
-        archdir = os.path.join(workdir, archdir)
-        if not os.path.isdir(archdir):
-            pass
-
-        for pkgdir in sorted(os.listdir(archdir)):
-            pkgabsdir = os.path.join(archdir, pkgdir)
-            if not os.path.isdir(pkgabsdir):
-                pass
-
-            # parse the package directory names
-            # parse native/nativesdk packages first
-            match = re.match('(.*?-native.*?)-(.*)', pkgdir)
-            if match and parse_dir(match, pkgabsdir):
-                continue
-
-            # parse package names which ends with numbers such as 'glib-2.0'
-            match = re.match('(.*?-[\.\d]+)-(\d.*)', pkgdir)
-            if match and parse_dir(match, pkgabsdir):
-                continue
-
-            # other packages
-            match = re.match('(.*?)-(\d.*)', pkgdir)
-            if match and parse_dir(match, pkgabsdir):
-                continue
+    for workroot, dirs, files in os.walk(workdir):
+        # For the files, they should NOT exist in WORKDIR. Romve them.
+        for f in files:
+            obsolete_dirs.append(os.path.join(workroot, f))
+
+        for d in dirs:
+            for pkgroot, pkgdirs, filenames in os.walk(os.path.join(workroot, d)):
+                for f in filenames:
+                    obsolete_dirs.append(os.path.join(pkgroot, f))
+
+                for pkgdir in sorted(pkgdirs):
+                    if pkgdir not in pkg_cur_dirs:
+                        obsolete_dirs.append(os.path.join(pkgroot, pkgdir))
+
+                # just process the top dir of every package under tmp/work/*/,
+                # then jump out of the above os.walk()
+                break
+
+        # it is convenient to use os.walk() to get dirs and files at same time
+        # both of them have been dealed in the loop, so jump out
+        break
 
     for d in obsolete_dirs:
         print "Deleleting %s" % d
-- 
1.7.7.6



