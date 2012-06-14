Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfIAE-0001MK-Pj
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 00:05:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 14:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180212237"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 14:54:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 14:54:34 -0700
Message-Id: <1339710874-10191-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] distrodata: cleanup after moving distro_tracking_fields
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
X-List-Received-Date: Thu, 14 Jun 2012 22:05:15 -0000

Remove some of the older fields that are not in the new list as we
are able to better automagically generate this directly from the
recipe files the extra files will go away.

To use this, one will have to include the appropirate files, such
as maintainers.inc, upstream_status.inc

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/distrodata.bbclass |   56 +++++++++-----------------------------
 1 files changed, 14 insertions(+), 42 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index df6d300..90ee7ae 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -1,4 +1,3 @@
-require conf/distro/include/distro_tracking_fields.inc
 
 addhandler distro_eventhandler
 python distro_eventhandler() {
@@ -8,7 +7,7 @@ python distro_eventhandler() {
 	logfile = dc.create_log_file(e.data, "distrodata.csv")
 	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
-	f.write("Package,Description,Owner,License,ChkSum,Status,VerMatch,Version,Upsteam,Non-Update,Reason,Recipe Status,Distro 1,Distro 2,Distro 3\n")
+	f.write("Package,Description,Owner,License,VerMatch,Version,Upsteam,Reason,Recipe Status,Distro 1,Distro 2,Distro 3\n")
         f.close()
         bb.utils.unlockfile(lf)
 
@@ -68,21 +67,12 @@ python do_distrodata_np() {
 
 	pgrp = localdata.getVar('SECTION', True)
 	plicense = localdata.getVar('LICENSE', True).replace(',','_')
-	if localdata.getVar('LIC_FILES_CHKSUM', True):
-		pchksum="1"
-	else:
-		pchksum="0"
-
-	if localdata.getVar('RECIPE_STATUS', True):
-		hasrstatus="1"
-	else:
-		hasrstatus="0"
 
-	rstatus = localdata.getVar('RECIPE_STATUS', True)
+	rstatus = localdata.getVar('RECIPE_COLOR', True)
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
 		
-	pupver = localdata.getVar('RECIPE_LATEST_VERSION', True)
+	pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
 	if pcurver == pupver:
 		vermatch="1"
 	else:
@@ -94,16 +84,12 @@ python do_distrodata_np() {
 		noupdate="1"
                 noupdate_reason = noupdate_reason.replace(',','')
 
-	ris = localdata.getVar('RECIPE_INTEL_SECTION', True)
 	maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
-	rttr = localdata.getVar('RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES', True)
-	rlrd = localdata.getVar('RECIPE_LATEST_RELEASE_DATE', True)
-	dc = localdata.getVar('DEPENDENCY_CHECK', True)
-	rc = localdata.getVar('RECIPE_COMMENTS', True)
+	rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE', True)
         result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
 
-	bb.note("DISTRO: %s,%s,%s,%s,%s,%s,%s,%s,%s, %s, %s, %s\n" % \
-		  (pname, pdesc, maintainer, plicense, pchksum, hasrstatus, vermatch, pcurver, pupver, noupdate, noupdate_reason, rstatus))
+	bb.note("DISTRO: %s,%s,%s,%s,%s,%s,%s,%s,%s\n" % \
+		  (pname, pdesc, maintainer, plicense, vermatch, pcurver, pupver, noupdate_reason, rstatus))
         line = pn
         for i in result:
             line = line + "," + i
@@ -155,21 +141,12 @@ python do_distrodata() {
 
 	pgrp = localdata.getVar('SECTION', True)
 	plicense = localdata.getVar('LICENSE', True).replace(',','_')
-	if localdata.getVar('LIC_FILES_CHKSUM', True):
-		pchksum="1"
-	else:
-		pchksum="0"
-
-	if localdata.getVar('RECIPE_STATUS', True):
-		hasrstatus="1"
-	else:
-		hasrstatus="0"
 
-	rstatus = localdata.getVar('RECIPE_STATUS', True)
+	rstatus = localdata.getVar('RECIPE_COLOR', True)
         if rstatus is not None:
                 rstatus = rstatus.replace(',','')
 		
-	pupver = localdata.getVar('RECIPE_LATEST_VERSION', True)
+	pupver = localdata.getVar('RECIPE_UPSTREAM_VERSION', True)
 	if pcurver == pupver:
 		vermatch="1"
 	else:
@@ -182,19 +159,15 @@ python do_distrodata() {
 		noupdate="1"
                 noupdate_reason = noupdate_reason.replace(',','')
 
-	ris = localdata.getVar('RECIPE_INTEL_SECTION', True)
 	maintainer = localdata.getVar('RECIPE_MAINTAINER', True)
-	rttr = localdata.getVar('RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES', True)
-	rlrd = localdata.getVar('RECIPE_LATEST_RELEASE_DATE', True)
-	dc = localdata.getVar('DEPENDENCY_CHECK', True)
-	rc = localdata.getVar('RECIPE_COMMENTS', True)
+	rlrd = localdata.getVar('RECIPE_UPSTREAM_DATE', True)
         # do the comparison
         result = dist_check.compare_in_distro_packages_list(distro_check_dir, localdata)
 
 	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
-	f.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s" % \
-		  (pname, pdesc, maintainer, plicense, pchksum, hasrstatus, vermatch, pcurver, pupver, noupdate, noupdate_reason, rstatus))
+	f.write("%s,%s,%s,%s,%s,%s,%s,%s,%s" % \
+		  (pname, pdesc, maintainer, plicense, vermatch, pcurver, pupver, noupdate_reason, rstatus))
         line = ""
         for i in result:
             line = line + "," + i
@@ -218,7 +191,7 @@ python checkpkg_eventhandler() {
 
 	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
-	f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tPriority\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\n")
+	f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\n")
         f.close()
         bb.utils.unlockfile(lf)
     return
@@ -475,7 +448,6 @@ python do_checkpkg() {
 	psection = localdata.getVar('SECTION', True)
 	phome = localdata.getVar('HOMEPAGE', True)
 	prelease = localdata.getVar('PR', True)
-	ppriority = localdata.getVar('PRIORITY', True)
 	pdepends = localdata.getVar('DEPENDS', True)
 	pbugtracker = localdata.getVar('BUGTRACKER', True)
 	ppe = localdata.getVar('PE', True)
@@ -655,8 +627,8 @@ python do_checkpkg() {
 	pdesc = "".join(pdesc.split("\t"))
 	lf = bb.utils.lockfile("%s.lock" % logfile)
 	f = open(logfile, "a")
-	f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
-		  (pname,pversion,pupver,plicense,psection, phome,prelease, ppriority,pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer))
+	f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
+		  (pname,pversion,pupver,plicense,psection, phome,prelease, pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer))
 	f.close()
 	bb.utils.unlockfile(lf)
 }
-- 
1.7.7.6



