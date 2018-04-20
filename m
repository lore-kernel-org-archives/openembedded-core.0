Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3B44E74621
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:25:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3K7PZHU019696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 20 Apr 2018 08:25:36 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f9QQJ-0000Je-Dk; Fri, 20 Apr 2018 08:25:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 08:25:32 +0100
Message-Id: <1524209132-1175-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH] package: Fix PACKAGELOCK handling
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
X-List-Received-Date: Fri, 20 Apr 2018 07:25:37 -0000

PACKAGELOCK is there to protect readers of PKGDATA_DIR from writes and files
changing whilst they're being read. With various changes to the codebase,
the lock code has become confused as the files are now written by the sstate
code in do_packagedata, not in do_package directly any longer.

This change cleans up the code so read sites take the shared lock (anything in
do_package), write sites take the full lock (do_packagedata sstate).

The lock from do_package sstate is no longer needed since it doesn't write
outside WORKDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0436d91..e03d450 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1615,7 +1615,7 @@ python package_do_shlibs() {
     shlibswork_dir = d.getVar('SHLIBSWORKDIR')
 
     # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
+    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
 
     def linux_so(file, needed, sonames, renames, pkgver):
         needs_ldconfig = False
@@ -1900,7 +1900,7 @@ python package_do_pkgconfig () {
                                 pkgconfig_needed[pkg] += exp.replace(',', ' ').split()
 
     # Take shared lock since we're only reading, not writing
-    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
+    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
 
     for pkg in packages.split():
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
@@ -2233,11 +2233,9 @@ do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
 do_package[vardeps] += "${PACKAGEBUILDPKGD} ${PACKAGESPLITFUNCS} ${PACKAGEFUNCS} ${@gen_packagevar(d)}"
 addtask package after do_install
 
-PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 SSTATETASKS += "do_package"
 do_package[cleandirs] = "${PKGDEST} ${PKGDESTWORK}"
 do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST} ${PKGDESTWORK}"
-do_package[sstate-lockfile-shared] = "${PACKAGELOCK}"
 do_package_setscene[dirs] = "${STAGING_DIR}"
 
 python do_package_setscene () {
@@ -2252,9 +2250,12 @@ do_packagedata () {
 addtask packagedata before do_build after do_package
 
 SSTATETASKS += "do_packagedata"
+# PACKAGELOCK protects readers of PKGDATA_DIR against writes
+# whilst code is reading in do_package
+PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
 do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
-do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
+do_packagedata[sstate-lockfile] = "${PACKAGELOCK}"
 do_packagedata[stamp-extra-info] = "${MACHINE_ARCH}"
 
 python do_packagedata_setscene () {
-- 
2.7.4


