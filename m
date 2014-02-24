Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 952C06E8E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:12:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1OGCIgr019564 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:12:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fDGRXCypbwEc
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:12:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1OGCECu019547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:12:15 GMT
Message-ID: <1393258327.31769.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 16:12:07 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package: Drop do_package_write task
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
X-List-Received-Date: Mon, 24 Feb 2014 16:12:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The reasons this task was introduced are lost in the mists of time. It
allowed for the a single "package_write" task instead of spelling out
the explicit package backends, however in all but one case we do that
anyway.

As such as might as well give in and delete the task, converting that
single reference into explicit dependencies.

This gives bitbake a bit less work to to when processing the runqueue
since there are less tasks (but more dependencies in some cases).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 297d962..0018a62 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -235,9 +235,6 @@ python () {
 
         # shlibs requires any DEPENDS to have already packaged for the *.list files
         d.appendVarFlag('do_package', 'deptask', " do_packagedata")
-
-    elif not bb.data.inherits_class('image', d):
-        d.setVar("PACKAGERDEPTASK", "")
 }
 
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
@@ -2003,15 +2000,6 @@ python do_packagedata_setscene () {
 }
 addtask do_packagedata_setscene
 
-# Dummy task to mark when all packaging is complete
-do_package_write () {
-	:
-}
-do_package_write[noexec] = "1"
-PACKAGERDEPTASK = "do_package_write"
-do_build[recrdeptask] += "${PACKAGERDEPTASK}"
-addtask package_write before do_build after do_packagedata
-
 #
 # Helper functions for the package writing classes
 #
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index b9d7978..a16d57e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -311,3 +311,5 @@ addtask package_write_deb before do_package_write after do_packagedata do_packag
 
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
+
+do_build[recrdeptask] += "do_package_write_deb"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 7cf2c8a..aab31e5 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -257,3 +257,5 @@ addtask package_write_ipk before do_package_write after do_packagedata do_packag
 
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
+
+do_build[recrdeptask] += "do_package_write_ipk"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index f267b8a..bce5648 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -736,3 +736,5 @@ addtask package_write_rpm before do_package_write after do_packagedata do_packag
 
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
+
+do_build[recrdeptask] += "do_package_write_rpm"



