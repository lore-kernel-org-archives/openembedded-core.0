Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5fVr-0008AA-57
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 16:39:47 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5fTv-0002dn-FB from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 07:37:47 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 1 Apr 2011 07:37:47 -0700
Received: from localhost.localdomain ([172.30.80.69]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 1 Apr 2011 08:37:46 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2011 07:37:44 -0700
Message-Id: <42c05490fe14aa1366ccac99964248c82fe3b2ea.1301668619.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301668619.git.tom_rini@mentor.com>
References: <cover.1301668619.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 01 Apr 2011 14:37:46.0236 (UTC)
	FILETIME=[5DE81BC0:01CBF07A]
Subject: [PATCH 1/2] patch.bbclass: allow importing patches into other dirs
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
X-List-Received-Date: Fri, 01 Apr 2011 14:39:47 -0000

This is taken from openembedded.master:
commit 9d0d70da60ca8ef278916f442125d41161846f38
Author: Chris Larson <chris_larson@mentor.com>
Date:   Mon Aug 23 13:03:55 2010 -0400

    patch: allow importing patches into other dirs

    Use the 'patchdir' flag.  If relative, it's assumed to be relative to ${S}.
    It creates a patchset class per patch directory, so for quilt this results i
    multiple .pc/patches directories to manage each of the patchsets.

    Signed-off-by: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/patch.bbclass |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 80fd45f..7622163 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -31,10 +31,8 @@ python patch_do_patch() {
 
 	path = os.getenv('PATH')
 	os.putenv('PATH', bb.data.getVar('PATH', d, 1))
-	patchset = cls(s, d)
-	patchset.Clean()
 
-	resolver = rcls(patchset)
+	classes = {}
 
 	workdir = bb.data.getVar('WORKDIR', d, 1)
 	for url in src_uri:
@@ -117,6 +115,21 @@ python patch_do_patch() {
 				bb.note("Patch '%s' doesn't apply to revision" % pname)
 				continue
 
+		if "patchdir" in parm:
+			patchdir = parm["patchdir"]
+			if not os.path.isabs(patchdir):
+				patchdir = os.path.join(s, patchdir)
+		else:
+			patchdir = s
+
+		if not patchdir in classes:
+			patchset = cls(patchdir, d)
+			resolver = rcls(patchset)
+			classes[patchdir] = (patchset, resolver)
+			patchset.Clean()
+		else:
+			patchset, resolver = classes[patchdir]
+
 		bb.note("Applying patch '%s' (%s)" % (pname, oe.path.format_display(local, d)))
 		try:
 			patchset.Import({"file":local, "remote":url, "strippath": striplevel}, True)
-- 
1.7.0.4



