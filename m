Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SlpHy-0005KS-Qv
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 00:40:15 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q62MRvVp001372 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 15:27:57 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q62MRu9l001371
	for openembedded-core@lists.openembedded.org;
	Mon, 2 Jul 2012 15:27:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2012 15:27:56 -0700
Message-Id: <1341268076-1331-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC] package.bbclass: enable the use of ERROR_QA
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
X-List-Received-Date: Mon, 02 Jul 2012 22:40:15 -0000

This patch allows the use of ERROR_QA to give policy control to distros
for the Installed and not shipped error in packages. installed_vs_shipped
can be set in the distro config file for ERROR_QA.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package.bbclass |   17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 10c2f0a..231b01b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -988,10 +988,19 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.warn("For recipe %s, the following files/directories were installed but not shipped in any package:" % pn)
-		for f in unshipped:
-			bb.warn("  " + f)
-
+		msg = pn + ": Files/directories were installed but not shipped" 
+		if "installed_vs_shipped" in = (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
+			bb.note("Package %s skipping Packging installed vs shipped QA test" % pn) 
+			continue
+		if "installed_vs_shipped" in (d.getVar("ERROR_QA", True) or "").split():
+			package_qa_handle_error("installed_vs_shipped", msg, d)
+			for f in unshipped:
+				package_qa_handle_error("installed_vs_shipped", "  " + f, d)
+		else:
+			bb.warn("For recipe %s, the following files/directories were installed but
+			for f in unshipped:
+				bb.warn("  " + f)
+ 
 	bb.build.exec_func("package_name_hook", d)
 
 	for pkg in package_list:
-- 
1.7.10.4



