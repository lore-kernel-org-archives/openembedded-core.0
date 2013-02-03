Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fL-0002c7-JI
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401L9w020544; Mon, 4 Feb 2013 00:01:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l+zVnnVebb8j; Mon,  4 Feb 2013 00:01:23 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401EJd020464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:15 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pm-0000YV-9f; Sun, 03 Feb 2013 23:56:02 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:50 +0000
Message-Id: <a8127137bd0ce5506e82641af52cc71a7f798113.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 20/22] package.bbclass: Better document the different phases of operation
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
X-List-Received-Date: Mon, 04 Feb 2013 00:12:40 -0000

Add headers to document the different phases of do_package and
make the steps clearer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a09eb15..2c3f173 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1778,6 +1778,10 @@ python do_package () {
     # as any change to rpmdeps requires this to be rerun.
     # PACKAGE_BBCLASS_VERSION = "1"
 
+    ###########################################################################
+    # Sanity test the setup
+    ###########################################################################
+
     packages = (d.getVar('PACKAGES', True) or "").split()
     if len(packages) < 1:
         bb.debug(1, "No packages to build, skipping do_package")
@@ -1793,12 +1797,24 @@ python do_package () {
         bb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package")
         return
 
+    ###########################################################################
+    # Setup PKGD (from D)
+    ###########################################################################
+
     for f in (d.getVar('PACKAGEBUILDPKGD', True) or '').split():
         bb.build.exec_func(f, d)
 
+    ###########################################################################
+    # Split up PKGD into PKGDEST
+    ###########################################################################
+
     for f in (d.getVar('PACKAGESPLITFUNCS', True) or '').split():
         bb.build.exec_func(f, d)
 
+    ###########################################################################
+    # Process PKGDEST
+    ###########################################################################
+
     # Build global list of files in each split package
     global pkgfiles
     pkgfiles = {}
-- 
1.7.10.4



