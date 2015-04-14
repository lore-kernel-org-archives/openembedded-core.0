Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.227])
	by mail.openembedded.org (Postfix) with ESMTP id 40E5173912
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 21:08:27 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:41460]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge01 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 2A/15-12846-BC18D255; Tue, 14 Apr 2015 21:08:28 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 17:08:15 -0400
Message-Id: <1429045696-117207-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.118:25
X-Cloudmark-Score: 0
Subject: [dizzy][PATCHv2 1/2] base-files: Check for /run and /var/lock softlinks on upgrade
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
X-List-Received-Date: Tue, 14 Apr 2015 21:08:29 -0000

Commit ea647cd9eebdc3e3121b84074519c4bb305adac9 moved the locations
of /run and /var/lock to match the FHS 3 draft specifications.
However, the install doesn't remove the existing directories.
As a result, upgrading a system may result in /run as a softlink
to /var/run and /var/run as a softlink to /run, creating a circular
link.

During pre-install, check for the existence of the old softlinks and
remove them so the new directories can be installed.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 07f5c54..9021103 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -66,6 +66,29 @@ hostname = "openembedded"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
+# In previous versions of base-files, /run was a softlink to /var/run and the
+# directory was located in /var/volatlie/run.  Also, /var/lock was a softlink
+# to /var/volatile/lock which is where the real directory was located.  Now,
+# /run and /run/lock are the real directories.  If we are upgrading, we may
+# need to remove the symbolic links first before we create the directories.
+# Otherwise the directory creation will fail and we will have circular symbolic
+# links.
+# 
+pkg_preinst_${PN} () {
+    #!/bin/sh -e
+    if [ x"$D" = "x" ]; then
+        if [ -h "/var/lock" ]; then
+            # Remove the symbolic link
+            rm -f /var/lock
+        fi
+
+        if [ -h "/run" ]; then
+            # Remove the symbolic link
+            rm -f /run
+        fi
+    fi     
+}
+
 do_install () {
 	for d in ${dirs755}; do
 		install -m 0755 -d ${D}$d
@@ -79,6 +102,7 @@ do_install () {
 	for d in ${volatiles}; do
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
+
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
-- 
2.1.0


