Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Apr 2015 16:52:05 UTC
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.225])
	by mail.openembedded.org (Postfix) with ESMTP id 324F96E277
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 16:52:05 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:39894]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge02 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 69/21-19845-A0EF7255; Fri, 10 Apr 2015 16:44:59 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 12:44:28 -0400
Message-Id: <1428684268-55681-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.130:25
X-Cloudmark-Score: 0
Subject: [dizzy][PATCH] base-files: Check for /run and /var/lock softlinks on upgrade
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
X-List-Received-Date: Fri, 10 Apr 2015 16:52:06 -0000

Commit ea647cd9eebdc3e3121b84074519c4bb305adac9 moved the locations
of /run and /var/lock to match the FHS 3 draft specifications.
However, the install doesn't remove the existing directories.
As a result, upgrading a system may result in /run as a softlink
to /var/run and /var/run as a softlink to /run, creating a circular
link.

During pre and post-install, check for the existence of the old
softlinks, move the old file contents to a temporary location, remove
the softlinks, and restore the directory contents after installation.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 07f5c54..71cea08 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -66,6 +66,41 @@ hostname = "openembedded"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
+# In previous versions of base-files, /run was a softlink to /var/run and the
+# directory was located in /var/volatlie/run.  Also, /var/lock was a softlink
+# to /var/volatile/lock which is where the real directory was located.  Now,
+# /run and /run/lock are the real directories.  If we are upgrading, we may
+# need to remove the symbolic links first before we create the directories.
+# Otherwise the directory creation will fail and we will have circular symbolic
+# links.
+# 
+# If we do need to remove the symbolic links first, we also need to preserve
+# all the contents of the directory so running programs can find the files that
+# are in use in these directories.  Move the contents to a temporary directory
+# during pre-install to protect the contents
+pkg_preinst_${PN} () {
+    #!/bin/sh -e
+    if [ x"$D" = "x" ]; then
+        if [ -e "/var/volatile/lock" ]; then
+            # Move the contents of /var/volatile/lock to a temporary directory
+            mkdir -p /run_lock_tmp
+            mv /var/volatile/lock/* /run_lock_tmp/
+
+            # Remove the current directory
+            rm -rf /var/volatile/lock
+        fi
+
+        if [ -h "/run" ]; then
+            # Move the contents of /run to a temporary directory
+            mkdir -p /run_tmp
+            mv /run/* /run_tmp/
+
+            # Remove the current directory
+            rm -rf /run
+        fi
+    fi     
+}
+
 do_install () {
 	for d in ${dirs755}; do
 		install -m 0755 -d ${D}$d
@@ -79,6 +114,7 @@ do_install () {
 	for d in ${volatiles}; do
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
+
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
@@ -144,6 +180,25 @@ do_install_append_linuxstdbase() {
         done
 }
 
+# If we are on the actual hardware, check if we had to move /run and /run/lock.
+# If so, copy the temporary directory contents to their new locations.
+pkg_postinst_${PN} () {
+    #!/bin/sh -e
+    if [ x"$D" = "x" ]; then
+        if [ -e "/run_tmp" ]; then
+            mv /run_tmp/* /run/
+            rmdir /run_tmp
+        fi
+
+        if [ -e "/run_lock_tmp/" ]; then
+            mv /run_lock_tmp/* /run/lock
+            rmdir /run_lock_tmp
+        fi
+    else
+        exit 1
+    fi     
+}
+
 PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
 FILES_${PN} = "/"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
-- 
2.1.0


