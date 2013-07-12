Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F0934608CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 14:36:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 12 Jul 2013 07:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="364298066"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2013 07:37:12 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 17:43:33 +0300
Message-Id: <dd934334ea56b3d625abfebe2b2d6e8aa67cc03a.1373640025.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373640025.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373640025.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 1/1] distrodata.bbaclass: change in git and svn package reporting
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
X-List-Received-Date: Fri, 12 Jul 2013 14:36:22 -0000

For git packages the Package Reporting System should always report the
latest HEAD.
For svn packages the new version reporting has the following format:
	version+svn[r|-]revision

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/classes/distrodata.bbclass |   79 +++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index be95b1c..204612c 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -663,15 +663,25 @@ python do_checkpkg() {
                         gitproto = parm['protocol']
                 else:
                         gitproto = "git"
-                gitcmd = "git ls-remote %s://%s%s%s *tag* 2>&1" % (gitproto, gituser, host, path)
+
+                # Get all tags and HEAD
+                if d.getVar('GIT_REGEX', True):
+                        gitcmd = "git ls-remote %s://%s%s%s %s 2>&1" % (gitproto, gituser, host, path, d.getVar('GIT_REGEX', True))
+                else:
+                        gitcmd = "git ls-remote %s://%s%s%s *tag* 2>&1" % (gitproto, gituser, host, path)
                 gitcmd2 = "git ls-remote %s://%s%s%s HEAD 2>&1" % (gitproto, gituser, host, path)
+
                 tmp = os.popen(gitcmd).read()
+                if 'unable to connect' in tmp:
+                        tmp = None
                 tmp2 = os.popen(gitcmd2).read()
-                #This is for those repo have tag like: refs/tags/1.2.2
+                if 'unable to connect' in tmp2:
+                        tmp2 = None
+                #This is for those repos have tag like: refs/tags/1.2.2
+                phash = pversion.rsplit("+")[-1]
                 if tmp:
                         tmpline = tmp.split("\n")
                         verflag = 0
-                        phash = tmpline[0].rsplit("\t")[0]
                         pupver = pversion
                         for line in tmpline:
                                 if len(line)==0:
@@ -681,46 +691,52 @@ python do_checkpkg() {
                                 if upstr_regex:
                                         puptag = re.search(upstr_regex, puptag)
                                 else:
-                                        puptag = re.search("([0-9][\.|_]?)+", puptag)
+                                        puptag = re.search("(?P<pver>([0-9][\.|_]?)+)", puptag)
                                 if puptag == None:
-                                        continue;
-                                puptag = puptag.group()
+                                        continue
+                                puptag = puptag.group('pver')
                                 puptag = re.sub("_",".",puptag)
                                 plocaltag = pupver.split("+git")[0]
                                 if "git" in plocaltag:
                                         plocaltag = plocaltag.split("-")[0]
                                 result = bb.utils.vercmp(("0", puptag, ""), ("0", plocaltag, ""))
+
                                 if result > 0:
-                                        verflag = 1
-                                        pstatus = "UPDATE"
-                                        pupver = puptag
-                                        phash = line.split("\t")[0]
+                                         verflag = 1
+                                         pupver = puptag
                                 elif verflag == 0 :
-                                        pupver = plocaltag
-                                        pstatus = "MATCH"
+                                         pupver = plocaltag
                 #This is for those no tag repo
                 elif tmp2:
-                        pupver = tmp2.split("\t")[0]
+                        pupver = pversion.rsplit("+")[0]
                         phash = pupver
-                        if pupver in pversion:
-                                pstatus = "MATCH"
-                        else:
-                                pstatus = "UPDATE"
                 else:
                         pstatus = "ErrGitAccess"
-
-                tmp3 = re.search('(?P<git_ver>(\d+[\.-]?)+)(?P<git_prefix>(\+git[r|\-|]?)AUTOINC\+)(?P<head_md5>(.+))', pversion)
-                if tmp3:
-                        pversion = tmp3.group('git_ver') + tmp3.group('git_prefix') + tmp3.group('head_md5')[:7]
-                        git_prefix = tmp3.group('git_prefix')
-                        if not (git_prefix in pupver):
-                                if len(pupver) < 40:
-                                        """This is not the HEAD of the repository"""
-                                        pupver = pupver + tmp3.group('git_prefix') + phash[:7]
+                if not ('ErrGitAccess' in pstatus):
+
+                        latest_head = tmp2.rsplit("\t")[0][:7]
+                        tmp3 = re.search('(?P<git_ver>(\d+[\.-]?)+)(?P<git_prefix>(\+git[r|\-|]?)AUTOINC\+)(?P<head_md5>([\w|_]+))', pversion)
+                        tmp4 = re.search('(?P<git_ver>(\d+[\.-]?)+)(?P<git_prefix>(\+git[r|\-|]?)AUTOINC\+)(?P<head_md5>([\w|_]+))', pupver)
+                        if not tmp4:
+                                tmp4 = re.search('(?P<git_ver>(\d+[\.-]?)+)', pupver)
+
+                        if tmp3:
+                                # Get status of the package - MATCH/UPDATE
+                                result = bb.utils.vercmp(("0", tmp3.group('git_ver'), ""), ("0",tmp3.group('git_ver') , ""))
+                                # Get the latest tag
+                                pstatus = 'MATCH'
+                                if result < 0:
+                                        latest_pv = tmp3.group('git_ver')
                                 else:
-                                        """This is the HEAD of the repository"""
-                                        pupver = tmp3.group('git_ver') + tmp3.group('git_prefix') + phash[:7]
+                                        latest_pv = pupver
+                                        if not(tmp3.group('head_md5')[:7] in latest_head) or not(latest_head in tmp3.group('head_md5')[:7]):
+                                                pstatus = 'UPDATE'
 
+                                git_prefix = tmp3.group('git_prefix')
+                                pupver = latest_pv + tmp3.group('git_prefix') + latest_head
+                        else:
+                                if not tmp3:
+                                        bb.plain("#DEBUG# Current version (%s) doesn't match the usual pattern" %pversion)
         elif type == 'svn':
                 options = []
                 if user:
@@ -750,6 +766,13 @@ python do_checkpkg() {
 
                 if re.match("Err", pstatus):
                         pstatus = "ErrSvnAccess"
+
+                if pstatus != "ErrSvnAccess":
+                        tag = pversion.rsplit("+svn")[0]
+                        svn_prefix = re.search('(\+svn[r|\-]?)', pversion)
+                        if tag and svn_prefix:
+                                pupver = tag + svn_prefix.group() + pupver
+
         elif type == 'cvs':
                 pupver = "HEAD"
                 pstatus = "UPDATE"
-- 
1.7.9.5


