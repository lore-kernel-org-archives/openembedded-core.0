Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SlrMO-00016R-AG
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 02:52:56 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q630ecH2032112 for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 17:40:38 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q630ebJ4032111
	for openembedded-core@lists.openembedded.org;
	Mon, 2 Jul 2012 17:40:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2012 17:40:37 -0700
Message-Id: <1341276037-32076-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC v2] package.bbclass: enable the use of package_qa_handle_error
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
X-List-Received-Date: Tue, 03 Jul 2012 00:52:56 -0000

This will allow the reporting of these errors as either WARNINGs (default)
or ERRORs if installed_vs_shipped is added to the ERROR_QA of the policy
file (such as a <distro_name>.conf file.

V2: found the code I had intended to send instead of that other junk,
    was just not watching what I pushed on that one, sorry. (this is edit in
    no in the actual commit message)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package.bbclass |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0b98c6b..ff2ec96 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -988,9 +988,14 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.warn("For recipe %s, the following files/directories were installed but not shipped in any package:" % pn)
-		for f in unshipped:
-			bb.warn("  " + f)
+		msg = pn + ": Files/directories were installed but not shipped" 
+		skip = (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
+		if "installed_vs_shipped" in skip:
+			bb.note("Package %s skipping QA tests: installed_vs_shipped" % pn)
+		else:
+			package_qa_handle_error("installed_vs_shipped", msg, d)
+			for f in unshipped:
+				package_qa_handle_error("installed_vs_shipped", "  " + f, d)
 
 	bb.build.exec_func("package_name_hook", d)
 
-- 
1.7.10.4



