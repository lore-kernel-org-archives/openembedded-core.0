Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE4BB6F57E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 14:32:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 06:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,600,1389772800"; d="scan'208";a="487237247"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 06:32:42 -0800
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id B8CBA6A4083;
	Thu,  6 Mar 2014 06:32:30 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 18:35:55 +0200
Message-Id: <1394123756-25130-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] oe-selftest: optimize code in _sstatetests_noauto.py module
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
X-List-Received-Date: Thu, 06 Mar 2014 14:32:43 -0000

1) Some of the checks made when creating new directories are unnecessary beacause
the test will fail anyway if os.mkdir() fails, with the appropriate error message.

Removing this code.

2) Moved the adding to tracked paths for deletion of temporary build directories
and sstate-cache directories to after they are created. This makes more sense
and prevents deletion of these directories if they allready exist and may contain
useful data.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/_sstatetests_noauto.py | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
index 5253334..97366d9 100644
--- a/meta/lib/oeqa/selftest/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
@@ -24,23 +24,15 @@ class RebuildFromSState(SStateBase):
         return found_targets
 
     def configure_builddir(self, builddir):
-        if os.path.exists(builddir):
-            raise AssertionError("Cannot create build directory at %s: Path allready exists!" % builddir)
-        try:
-            os.mkdir(builddir)
-        except:
-            raise AssertionError("Cannot create %s . Make sure %s exists!" % (dst, os.path.dirname(dst)))
+        os.mkdir(builddir)
+        self.track_for_cleanup(builddir)
         os.mkdir(os.path.join(builddir, 'conf'))
         shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf'), os.path.join(builddir, 'conf/local.conf'))
         shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/bblayers.conf'), os.path.join(builddir, 'conf/bblayers.conf'))
 
     def hardlink_tree(self, src, dst):
-        if os.path.exists(dst):
-            raise AssertionError("Cannot create directory at %s: Path allready exists!" % dst)
-        try:
-            os.mkdir(dst)
-        except:
-            raise AssertionError("Cannot create %s . Make sure %s exists!" % (dst, os.path.dirname(dst)))
+        os.mkdir(dst)
+        self.track_for_cleanup(dst)
         for root, dirs, files in os.walk(src):
             if root == src:
                 continue
@@ -54,9 +46,6 @@ class RebuildFromSState(SStateBase):
             buildB = os.path.join(self.builddir, 'buildB')
         else:
             buildB = buildA
-        self.track_for_cleanup(buildA)
-        self.track_for_cleanup(buildB)
-        self.track_for_cleanup(os.path.join(self.builddir, 'sstate-cache-buildA'))
 
         if rebuild_dependencies:
             rebuild_targets = self.get_dep_targets(primary_targets)
-- 
1.8.3.2


