Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29fK-0002c4-Um
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:12:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401L9v020544; Mon, 4 Feb 2013 00:01:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aODRDGZF5c28; Mon,  4 Feb 2013 00:01:22 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1401Dof020462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:01:14 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29Pl-0000YL-NK; Sun, 03 Feb 2013 23:56:01 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:48 +0000
Message-Id: <b6cd8fa1100a6ee840c65d1ab38a8e3e4bf46dc8.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
References: <e3d21cd567d7d7bf3df4a349265e0400c583962d.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 18/22] package.bbclass: Add PACKAGESPLITFUNCS variable
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

Prepending to populate_packages is rather ugly and means its hard to trace
errors and also profiling informaiton is summed together in one function.

This patch starts to split out the prepends to become separate functions
to avoid these issues. This is generally a neater way to write functions
than prepending to where there can sometimes be variable scope issues
and we've been bitten by whitespace issues in the past.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass              |    4 +++-
 meta/classes/package.bbclass             |    6 ++++++
 meta/classes/update-alternatives.bbclass |    4 +++-
 meta/classes/update-rc.d_real.bbclass    |    4 +++-
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4805944..00117a6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -301,7 +301,9 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-python populate_packages_prepend () {
+PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
+
+python split_kernel_packages () {
     import re
 
     modinfoexp = re.compile("([^=]+)=(.*)")
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c822c43..a09eb15 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1754,6 +1754,9 @@ PACKAGEBUILDPKGD ?= " \
                 ${PACKAGE_PREPROCESS_FUNCS} \
                 split_and_strip_files \
                 fixup_perms \
+                "
+# Functions which split PKGD up into separate packages
+PACKAGESPLITFUNCS ?= " \
                 package_do_split_locales \
                 populate_packages"
 # Functions which process metadata based on split packages
@@ -1793,6 +1796,9 @@ python do_package () {
     for f in (d.getVar('PACKAGEBUILDPKGD', True) or '').split():
         bb.build.exec_func(f, d)
 
+    for f in (d.getVar('PACKAGESPLITFUNCS', True) or '').split():
+        bb.build.exec_func(f, d)
+
     # Build global list of files in each split package
     global pkgfiles
     pkgfiles = {}
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 90bc56b..147d236 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -282,7 +282,9 @@ python perform_packagecopy_append () {
                     bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
 }
 
-python populate_packages_prepend () {
+PACKAGESPLITFUNCS_prepend = "populate_packages_updateralternatives "
+
+python populate_packages_updatealternatives () {
     pn = d.getVar('BPN', True)
 
     # Do actual update alternatives processing
diff --git a/meta/classes/update-rc.d_real.bbclass b/meta/classes/update-rc.d_real.bbclass
index 0cd671f..f9d55fb 100644
--- a/meta/classes/update-rc.d_real.bbclass
+++ b/meta/classes/update-rc.d_real.bbclass
@@ -47,7 +47,9 @@ python __anonymous() {
     update_rc_after_parse(d)
 }
 
-python populate_packages_prepend () {
+PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
+
+python populate_packages_updatercd () {
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to postinst/postrm for %s' % pkg)
         """
-- 
1.7.10.4



