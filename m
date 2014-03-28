Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBAE60E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:12:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 03:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,750,1389772800"; d="scan'208";a="482031613"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2014 03:12:11 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 12:10:43 +0200
Message-Id: <76a2532bb2e4f251b94622363391d5c2e2ffa084.1396000670.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396000670.git.laurentiu.palcu@intel.com>
References: <cover.1396000670.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1396000670.git.laurentiu.palcu@intel.com>
References: <cover.1396000670.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] package_manager.py: leave the __db.00* files in place
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
X-List-Received-Date: Fri, 28 Mar 2014 10:12:12 -0000

Do not delete the __db.00* files in the PackageManager class. Leave this
operation up to the client classes. One side effect of this deletion was
the following message appearing in the output of the next rpm command
executed:

rpmdb: BDB1540 configured environment flags incompatible with existing
environment

We might also gain some time here by not deleting/creating those files
very often.

[YOCTO #6049]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 764ab72..a8360fe 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -299,9 +299,6 @@ class RpmPkgsList(PkgsList):
             # bb.note(cmd)
             tmp_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
 
-            rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.rootfs_dir)
-            for f in rpm_db_locks:
-                bb.utils.remove(f, True)
         except subprocess.CalledProcessError as e:
             bb.fatal("Cannot get the installed packages list. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -1101,7 +1098,6 @@ class RpmPM(PackageManager):
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
             bb.note(output)
             os.chmod(saved_dir, 0755)
-            self._unlock_rpm_db()
         except subprocess.CalledProcessError as e:
             bb.fatal("Invoke save_rpmpostinst failed. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
@@ -1117,14 +1113,12 @@ class RpmPM(PackageManager):
             self._invoke_smart('flag --set ignore-recommends %s' % i)
         self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
 
-        self._unlock_rpm_db()
-
     '''
     The rpm db lock files were produced after invoking rpm to query on
     build system, and they caused the rpm on target didn't work, so we
     need to unlock the rpm db by removing the lock files.
     '''
-    def _unlock_rpm_db(self):
+    def unlock_rpm_db(self):
         # Remove rpm db lock files
         rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' % self.target_rootfs)
         for f in rpm_db_locks:
-- 
1.7.9.5


