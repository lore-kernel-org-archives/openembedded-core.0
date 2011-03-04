Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pvav6-0006F3-Rg
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:44:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2011 11:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="609190622"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2011 11:42:11 -0800
Message-Id: <30343a72b89167b46ff4cc33be6ada2fd4b13a59.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 17:17:05 +0800
Date: Fri, 04 Mar 2011 11:42:11 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 02/13] distrodata.bbclass: Get git repo tag information
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
X-List-Received-Date: Fri, 04 Mar 2011 19:44:13 -0000

From: Mei Lei <lei.mei@intel.com>

For those recipes which use git repo and have tag information, we can use tag to trace the version change. For other no tag recipes, we still use their
commit checksum to trace their version change.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 meta/classes/distrodata.bbclass |   52 ++++++++++++++++++++++++++++++++------
 1 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index d84b306..e2cc8fa 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -347,7 +347,6 @@ python do_checkpkg() {
 		f = tempfile.NamedTemporaryFile(delete=False, prefix="%s-1-" % pn)
 		status = internal_fetch_wget(url, d, f)
 		fhtml = f.read()
-
 		if status == "SUCC" and len(fhtml):
 			newver = parse_inter(curver)
 
@@ -436,6 +435,10 @@ python do_checkpkg() {
 			else:
 				"""newver still contains a full package name string"""
 				status = re.search("(\d+[\.\-_])*(\d+[0-9a-zA-Z]*)", newver[1]).group()
+				if "_" in status:
+					status = re.sub("_",".",status)
+				elif "-" in status:
+					status = re.sub("-",".",status)
 		elif not len(fhtml):
 			status = "ErrHostNoDir"
 
@@ -531,6 +534,12 @@ python do_checkpkg() {
 	
 			alturi = bb.encodeurl([type, host, altpath, user, pswd, {}])
 			newver = check_new_version(alturi, curname, d)
+			while(newver == "ErrHostNoDir"):
+				if alturi == "/download":
+					break
+				else:
+					alturi = "/".join(alturi.split("/")[0:-2]) + "/download"
+					newver = check_new_version(alturi, curname, d)
 			if not re.match("Err", newver):
 				pupver = newver
 				if pupver != pcurver:
@@ -550,13 +559,38 @@ python do_checkpkg() {
 			gitproto = parm['protocol']
 		else:
 			gitproto = "rsync"
-
-		gitcmd = "git ls-remote %s://%s%s%s HEAD 2>&1" % (gitproto, gituser, host, path)
-		print gitcmd
-		ver = os.popen(gitcmd).read()
-		if ver and re.search("HEAD", ver):
-			pupver = ver.split("\t")[0]
-			if pcurver == pupver:
+		gitcmd = "git ls-remote %s://%s%s%s *tag* 2>&1" % (gitproto, gituser, host, path)
+		gitcmd2 = "git ls-remote %s://%s%s%s HEAD 2>&1" % (gitproto, gituser, host, path)
+		tmp = os.popen(gitcmd).read()
+		tmp2 = os.popen(gitcmd2).read()
+		#This is for those repo have tag like: refs/tags/1.2.2
+		if tmp:
+			tmpline = tmp.split("\n")
+			verflag = 0
+			for line in tmpline:
+				if len(line)==0:
+					break;
+				puptag = line.split("/")[-1]
+				puptag = re.search("[0-9][0-9|\.|_]+[0-9]", puptag)
+				if puptag == None:
+					continue;
+				puptag = puptag.group()
+				puptag = re.sub("_",".",puptag)
+				plocaltag = pversion.split("+")[0]
+				if "git" in plocaltag:
+					plocaltag = plocaltag.split("-")[0]
+				result = bb.utils.vercmp(("0", puptag, ""), ("0", plocaltag, ""))
+				if result > 0:
+					verflag = 1
+					pstatus = "UPADTE"
+					pupver = puptag
+				elif verflag == 0 :
+					pupver = plocaltag
+					pstatus = "MATCH"
+		#This is for those no tag repo
+		elif tmp2:
+			pupver = tmp2.split("\t")[0]
+			if pupver in pversion:
 				pstatus = "MATCH"
 			else:
 				pstatus = "UPDATE"
@@ -580,7 +614,7 @@ python do_checkpkg() {
 		for line in svninfo.split("\n"):
 			if re.search("^Last Changed Rev:", line):
 				pupver = line.split(" ")[-1]
-				if pcurver == pupver:
+				if pupver in pversion:
 					pstatus = "MATCH"
 				else:
 					pstatus = "UPDATE"
-- 
1.7.1.1



