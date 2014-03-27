Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8EA6F8E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:26:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Mar 2014 09:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,743,1389772800"; d="scan'208";a="509052964"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2014 09:19:18 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 18:18:53 +0200
Message-Id: <2180ba438e8cd8179adddb576516cec516261f2f.1395933640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395933640.git.laurentiu.palcu@intel.com>
References: <cover.1395933640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1395933640.git.laurentiu.palcu@intel.com>
References: <cover.1395933640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] package_manager.py: delete RPM db locks after calling rpmresolve
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
X-List-Received-Date: Thu, 27 Mar 2014 16:26:14 -0000

If the locks are not removed, the output of the next rpm command
executed will contain the following string:

rpmdb: BDB1540 configured environment flags incompatible with
existing environment

And this will create various parsing issues.

[YOCTO #6049]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 764ab72..0f22e46 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -242,6 +242,12 @@ class RpmPkgsList(PkgsList):
         self.ml_prefix_list, self.ml_os_list = \
             RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var, os_var)
 
+    def _unlock_rpm_db(self):
+        # Remove rpm db lock files
+        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.rootfs_dir)
+        for f in rpm_db_locks:
+            bb.utils.remove(f, True)
+
     '''
     Translate the RPM/Smart format names to the OE multilib format names
     '''
@@ -281,6 +287,8 @@ class RpmPkgsList(PkgsList):
 
         try:
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip()
+
+            self._unlock_rpm_db()
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the package dependencies. Command '%s' "
                      "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output))
@@ -299,9 +307,7 @@ class RpmPkgsList(PkgsList):
             # bb.note(cmd)
             tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
 
-            rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.rootfs_dir)
-            for f in rpm_db_locks:
-                bb.utils.remove(f, True)
+            self._unlock_rpm_db()
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
-- 
1.7.9.5


