Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3A20877E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:03:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 05:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="903963458"
Received: from tommasog-mobl.amr.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.2.145])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2017 05:03:32 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 15:03:28 +0300
Message-Id: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] package_manager: rpm: remove update-alternatives correctly
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
X-List-Received-Date: Tue, 26 Sep 2017 12:03:33 -0000

With "read-only-rootfs" in IMAGE_FEATURES, packages in ROOTFS_RO_UNNEEDED
are removed when building the rootfs.

rootfs.py has a note about some of the assumptions to that removal:

 "Make sure update-alternatives is last on the command line, so
  that it is removed last. This makes sure that its database is
  available while uninstalling packages, allowing alternative
  symlinks of packages to be uninstalled to be managed correctly."

However, it turns out rpm does not care about "last on the command
line" and update-alternatives provider is removed before other the
packages get to run their %preun scripts for update-alternatives.

This leaves broken alternative symlinks in rootfs.

The fix is to remove packages one by one (reversed command line
list did not work either) and process update-alternatives provider
last.

And while we're at it, make logging more verbose to better see
what's happening (and to get it consistent with opkg's remove() logging).

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 994e462..c122902 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -614,13 +614,16 @@ class RpmPM(PackageManager):
             self._invoke_dnf(["remove"] + pkgs)
         else:
             cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-            args = ["-e", "--nodeps", "--root=%s" %self.target_rootfs]
+            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
 
-            try:
-                output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
-            except subprocess.CalledProcessError as e:
-                bb.fatal("Could not invoke rpm. Command "
-                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
+            for pkg in pkgs:
+                try:
+                    bb.note("Running %s" % ' '.join([cmd] + args + [pkg]))
+                    output = subprocess.check_output([cmd] + args + [pkg], stderr=subprocess.STDOUT).decode("utf-8")
+                    bb.note(output)
+                except subprocess.CalledProcessError as e:
+                    bb.fatal("Could not invoke rpm. Command "
+                         "'%s' returned %d:\n%s" % (' '.join([cmd] + args + [pkg]), e.returncode, e.output.decode("utf-8")))
 
     def upgrade(self):
         self._prepare_pkg_transaction()
-- 
2.1.4


