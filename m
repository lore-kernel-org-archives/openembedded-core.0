Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8l-0000yV-EB
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2011 14:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="729554197"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2011 14:48:03 -0700
Message-Id: <8a1a7c5d90e26c39dc06820da8768f87de7b82f3.1302039585.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302039585.git.sgw@linux.intel.com>
References: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Fri, 25 Mar 2011 16:18:21 +0800
Date: Tue, 05 Apr 2011 14:48:03 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 6/6] distrodata.bbclass: Merge the get_pkg_info.log into checkpkg.csv
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
X-List-Received-Date: Tue, 05 Apr 2011 21:50:23 -0000

From: Mei Lei <lei.mei@intel.com>

For easy view the check package result, merge the two files into checkpkg.csv, after that, the package report system will use checkpkg.csv instead of get_pkg_info.log.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/classes/distrodata.bbclass |   29 +++++++----------------------
 1 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index e2cc8fa..905dad7 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -225,17 +225,9 @@ python checkpkg_eventhandler() {
 
 	lf = bb.utils.lockfile(logfile + ".lock")
 	f = open(logfile, "a")
-	f.write("Package\tOwner\tURI Type\tVersion\tTracking\tUpstream\tTMatch\tRMatch\n")
+	f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tPriority\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\n")
         f.close()
         bb.utils.unlockfile(lf)
-	"""initialize log files for package report system"""
-	logfile2 = os.path.join(logpath, "get_pkg_info.%s.log" % bb.data.getVar('DATETIME', e.data, 1))
-	if not os.path.exists(logfile2):
-		slogfile2 = os.path.join(logpath, "get_pkg_info.log")
-		if os.path.exists(slogfile2):
-			os.remove(slogfile2)
-		os.system("touch %s" % logfile2)
-		os.symlink(logfile2, slogfile2)
     return
 }
 
@@ -459,8 +451,6 @@ python do_checkpkg() {
 	logpath = bb.data.getVar('LOG_DIR', d, 1)
 	bb.utils.mkdirhier(logpath)
 	logfile = os.path.join(logpath, "checkpkg.csv")
-	"""initialize log files for package report system"""
-	logfile2 = os.path.join(logpath, "get_pkg_info.log")
 
 	"""generate package information from .bb file"""
 	pname = bb.data.getVar('PN', d, 1)
@@ -582,7 +572,7 @@ python do_checkpkg() {
 				result = bb.utils.vercmp(("0", puptag, ""), ("0", plocaltag, ""))
 				if result > 0:
 					verflag = 1
-					pstatus = "UPADTE"
+					pstatus = "UPDATE"
 					pupver = puptag
 				elif verflag == 0 :
 					pupver = plocaltag
@@ -646,20 +636,15 @@ python do_checkpkg() {
 			pmstatus = "UPDATE"
 	
 	maintainer = bb.data.getVar('RECIPE_MAINTAINER', d, True)
+	psrcuri = psrcuri.split()[0]
+	pdepends = "".join(pdepends.split("\t"))
+	pdesc = "".join(pdesc.split("\t"))
 	lf = bb.utils.lockfile(logfile + ".lock")
 	f = open(logfile, "a")
-	f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
-		  (pname, maintainer, pproto, pcurver, pmver, pupver, pmstatus, pstatus))
+	f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
+		  (pname,pversion,pupver,plicense,psection, phome,prelease, ppriority,pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer))
 	f.close()
 	bb.utils.unlockfile(lf)
-
-	"""write into get_pkg_info log file to supply data for package report system"""
-	lf2 = bb.utils.lockfile(logfile2 + ".lock")
-	f2 = open(logfile2, "a")
-	f2.write("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" % \
-		  (pname,pversion,pupver,plicense,psection, phome,prelease, ppriority,pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri))
-	f2.close()
-	bb.utils.unlockfile(lf2)
 }
 
 addtask checkpkgall after do_checkpkg
-- 
1.7.1



