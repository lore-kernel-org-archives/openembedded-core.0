Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RsbWK-00063d-SG
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 15:50:50 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q11EgnoJ002109;
	Wed, 1 Feb 2012 06:42:50 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed,  1 Feb 2012 09:42:46 -0500
Message-Id: <1328107366-22541-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1328107366-22541-1-git-send-email-bruce.ashfield@windriver.com>
References: <1328107366-22541-1-git-send-email-bruce.ashfield@windriver.com>
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/patch: return "other" elements found on the SRC_URI
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
X-List-Received-Date: Wed, 01 Feb 2012 14:50:50 -0000

commit:

  patch.bbclass: abstract out logic that determines patches to apply

gives the ability for other clases to emit series files for use outside
of a build system, or even within the build system. There are sometimes
elements on the SRC_URI that while not directly applicable to patching,
can be related to patching the package. For example, the yocto kernel
class would like to know about these 'other' items on the SRC_URI to
locate out of tree kernel features.

This change keeps the default the same, but adds the ability to query
for anything 'non-patch' that may be on the SRC_URI. Additional filtering
is left up to the caller of the routine.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/patch.bbclass |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 1ea4bc5..d664215 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -7,13 +7,17 @@ PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
 inherit terminal
 
-def src_patches(d):
+def src_patches(d, type = "patches"):
 	workdir = d.getVar('WORKDIR', True)
 	fetch = bb.fetch2.Fetch([], d)
 	patches = []
+	others = []
 	for url in fetch.urls:
 		local = patch_path(url, fetch, workdir)
 		if not local:
+			if type == "others":
+				local = fetch.localpath(url)
+				others.append(local)
 			continue
 
 		urldata = fetch.ud[url]
@@ -43,7 +47,10 @@ def src_patches(d):
 		localurl = bb.encodeurl(('file', '', local, '', '', patchparm))
 		patches.append(localurl)
 
-	return patches
+	if type == "others":
+		return others
+	else:
+		return patches
 
 def patch_path(url, fetch, workdir):
 	"""Return the local path of a patch, or None if this isn't a patch"""
-- 
1.7.4.1



