Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kLb-0001cS-3H
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 10:34:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 01:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="288228715"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2013 01:18:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:18:20 +0000
Message-Id: <3c0d68fb96ceeb4c898624700cfbcb7266895340.1360315075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360315075.git.paul.eggleton@linux.intel.com>
References: <cover.1360315075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360315075.git.paul.eggleton@linux.intel.com>
References: <cover.1360315075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] buildhistory: record more R* variables
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
X-List-Received-Date: Fri, 08 Feb 2013 09:34:19 -0000

Add RPROVIDES, RREPLACES, RCONFLICTS and RSUGGESTS to the list of
tracked variables. Of these, RPROVIDES is always output, whereas the
others are only output if they have a value (since it is more common
that they don't).

Implements [YOCTO #3391].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a6fbd68..a20d03d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -58,8 +58,12 @@ python buildhistory_emit_pkghistory() {
             self.pkgr = ""
             self.size = 0
             self.depends = ""
+            self.rprovides = ""
             self.rdepends = ""
             self.rrecommends = ""
+            self.rsuggests = ""
+            self.rreplaces = ""
+            self.rconflicts = ""
             self.files = ""
             self.filelist = ""
             # Variables that need to be written to their own separate file
@@ -96,10 +100,18 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.pkgv = value
                 elif name == "PKGR":
                     pkginfo.pkgr = value
+                elif name == "RPROVIDES":
+                    pkginfo.rprovides = value
                 elif name == "RDEPENDS":
                     pkginfo.rdepends = value
                 elif name == "RRECOMMENDS":
                     pkginfo.rrecommends = value
+                elif name == "RSUGGESTS":
+                    pkginfo.rsuggests = value
+                elif name == "RREPLACES":
+                    pkginfo.rreplaces = value
+                elif name == "RCONFLICTS":
+                    pkginfo.rconflicts = value
                 elif name == "PKGSIZE":
                     pkginfo.size = long(value)
                 elif name == "FILES":
@@ -189,8 +201,12 @@ python buildhistory_emit_pkghistory() {
         pkginfo.pkge = pkge
         pkginfo.pkgv = pkgv
         pkginfo.pkgr = pkgr
+        pkginfo.rprovides = sortpkglist(squashspaces(getpkgvar(pkg, 'RPROVIDES') or ""))
         pkginfo.rdepends = sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
         pkginfo.rrecommends = sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
+        pkginfo.rsuggests = sortpkglist(squashspaces(getpkgvar(pkg, 'RSUGGESTS') or ""))
+        pkginfo.rreplaces = sortpkglist(squashspaces(getpkgvar(pkg, 'RREPLACES') or ""))
+        pkginfo.rconflicts = sortpkglist(squashspaces(getpkgvar(pkg, 'RCONFLICTS') or ""))
         pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
         for filevar in pkginfo.filevars:
             pkginfo.filevars[filevar] = getpkgvar(pkg, filevar)
@@ -252,8 +268,15 @@ def write_pkghistory(pkginfo, d):
             if val:
                 f.write("%s = %s\n" % (pkgvar, val))
 
+        f.write("RPROVIDES = %s\n" %  pkginfo.rprovides)
         f.write("RDEPENDS = %s\n" %  pkginfo.rdepends)
         f.write("RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
+        if pkginfo.rsuggests:
+            f.write("RSUGGESTS = %s\n" %  pkginfo.rsuggests)
+        if pkginfo.rreplaces:
+            f.write("RREPLACES = %s\n" %  pkginfo.rreplaces)
+        if pkginfo.rconflicts:
+            f.write("RCONFLICTS = %s\n" %  pkginfo.rconflicts)
         f.write("PKGSIZE = %d\n" %  pkginfo.size)
         f.write("FILES = %s\n" %  pkginfo.files)
         f.write("FILELIST = %s\n" %  pkginfo.filelist)
-- 
1.7.10.4



