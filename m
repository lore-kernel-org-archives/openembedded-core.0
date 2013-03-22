Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UIxYl-0005Jh-0q for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 09:42:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2013 01:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,891,1355126400"; d="scan'208";a="274490904"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.141])
	by azsmga001.ch.intel.com with ESMTP; 22 Mar 2013 01:25:51 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 10:30:58 +0200
Message-Id: <1363941058-24047-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] distrodata.bbclass: added some more git processing
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
X-List-Received-Date: Fri, 22 Mar 2013 08:43:02 -0000

	* Truncated all git MD5 sums to 7 digits
	* Added regex checking for git packages as well

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |   32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index bd3a6a9..cedacc2 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -246,7 +246,7 @@ python checkpkg_eventhandler() {
 
         lf = bb.utils.lockfile("%s.lock" % logfile)
         f = open(logfile, "a")
-        f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\n")
+        f.write("Package\tVersion\tUpver\tLicense\tSection\tHome\tRelease\tDepends\tBugTracker\tPE\tDescription\tStatus\tTracking\tURI\tMAINTAINER\tNoUpReason\n")
         f.close()
         bb.utils.unlockfile(lf)
     elif bb.event.getName(e) == "BuildCompleted":
@@ -670,16 +670,22 @@ python do_checkpkg() {
                 if tmp:
                         tmpline = tmp.split("\n")
                         verflag = 0
+                        phash = tmpline[0].rsplit("\t")[0]
+                        pupver = pversion
                         for line in tmpline:
                                 if len(line)==0:
                                         break;
                                 puptag = line.split("/")[-1]
-                                puptag = re.search("([0-9][\.|_]?)+", puptag)
+                                upstr_regex = d.getVar('REGEX', True)
+                                if upstr_regex:
+                                        puptag = re.search(upstr_regex, puptag)
+                                else:
+                                        puptag = re.search("([0-9][\.|_]?)+", puptag)
                                 if puptag == None:
                                         continue;
                                 puptag = puptag.group()
                                 puptag = re.sub("_",".",puptag)
-                                plocaltag = pversion.split("+")[0]
+                                plocaltag = pupver.split("+git")[0]
                                 if "git" in plocaltag:
                                         plocaltag = plocaltag.split("-")[0]
                                 result = bb.utils.vercmp(("0", puptag, ""), ("0", plocaltag, ""))
@@ -687,18 +693,33 @@ python do_checkpkg() {
                                         verflag = 1
                                         pstatus = "UPDATE"
                                         pupver = puptag
+                                        phash = line.split("\t")[0]
                                 elif verflag == 0 :
                                         pupver = plocaltag
                                         pstatus = "MATCH"
                 #This is for those no tag repo
                 elif tmp2:
                         pupver = tmp2.split("\t")[0]
+                        phash = pupver
                         if pupver in pversion:
                                 pstatus = "MATCH"
                         else:
                                 pstatus = "UPDATE"
                 else:
                         pstatus = "ErrGitAccess"
+
+                tmp3 = re.search('(?P<git_ver>(\d+[\.-]?)+)(?P<git_prefix>(\+git[r|\-|]?)AUTOINC\+)(?P<head_md5>(.+))', pversion)
+                if tmp3:
+                        pversion = tmp3.group('git_ver') + tmp3.group('git_prefix') + tmp3.group('head_md5')[:7]
+                        git_prefix = tmp3.group('git_prefix')
+                        if not (git_prefix in pupver):
+                                if len(pupver) < 40:
+                                        """This is not the HEAD of the repository"""
+                                        pupver = pupver + tmp3.group('git_prefix') + phash[:7]
+                                else:
+                                        """This is the HEAD of the repository"""
+                                        pupver = tmp3.group('git_ver') + tmp3.group('git_prefix') + phash[:7]
+
         elif type == 'svn':
                 options = []
                 if user:
@@ -755,10 +776,11 @@ python do_checkpkg() {
         psrcuri = psrcuri.split()[0]
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
+        no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON', True)
         lf = bb.utils.lockfile("%s.lock" % logfile)
         f = open(logfile, "a")
-        f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
-                  (pname,pversion,pupver,plicense,psection, phome,prelease, pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer))
+        f.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % \
+                  (pname,pversion,pupver,plicense,psection, phome,prelease, pdepends,pbugtracker,ppe,pdesc,pstatus,pmver,psrcuri,maintainer, no_upgr_reason))
         f.close()
         bb.utils.unlockfile(lf)
 }
-- 
1.7.9.5



