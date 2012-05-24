Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2f-00056a-K7
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034669"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:13 -0700
Message-Id: <2a363acb80fb77401a2adb24038d8dc765e434e6.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 10/28] package_deb.bbclass: don't handle advanced dependency marker as version number
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
X-List-Received-Date: Thu, 24 May 2012 04:52:55 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

Strip advanced dependency markers away from Provides before writing
them to control file. Left in place they would mean package version
number in control file format.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/classes/package_deb.bbclass |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4096fa2..2e0ea92 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -206,6 +206,23 @@ python do_package_deb () {
     import re, copy
     import textwrap
 
+    def deb_explode_dep_ver(varname):
+        # Remove markers from string so they won't get handled as version numbers
+        depstr = localdata.getVar(varname, True) or ""
+        start = depstr.find("(")
+        while start != -1:
+            # We are not searching ")" from full string in case it's malformed in a way
+            # that first ")" is before first "("
+            endstr = depstr[start:len(depstr)]
+            end = endstr.find(")")
+            if (end == len(endstr) - 1) or (end == -1):
+                tmpstr = depstr[0:start]
+            else:
+                tmpstr = depstr[0:start] + depstr[start+end+1:len(depstr)]
+            depstr = tmpstr
+            start = depstr.find("(")
+        return bb.utils.explode_dep_versions(depstr)
+
     workdir = d.getVar('WORKDIR', True)
     if not workdir:
         bb.error("WORKDIR not defined, unable to package")
@@ -341,7 +358,7 @@ python do_package_deb () {
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
-        rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+        rprovides = deb_explode_dep_ver("RPROVIDES")
         rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
         rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
         if rdepends:
-- 
1.7.7.6



