Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E2EDD6F597
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 14:32:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 06:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,600,1389772800"; d="scan'208";a="487237278"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 06:32:44 -0800
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 5CFD36A4083;
	Thu,  6 Mar 2014 06:32:33 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 18:35:56 +0200
Message-Id: <1394123756-25130-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394123756-25130-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1394123756-25130-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 2/2] oe-selftest: force some values in local.conf for _sstatetests_noauto.py
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
X-List-Received-Date: Thu, 06 Mar 2014 14:32:44 -0000

1) Some values should have default values in order for tests like sstate relocation to be relevant
   - SSTATE_DIR needs to have default value
   - SSTATE_MIRRORS need to be unset (we need the sstate files to be created)
   - TMPDIR needs to be in default location

2) Added conf/auto.conf to list of ported files to secondary build directories

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/_sstatetests_noauto.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
index 97366d9..fc9ae7e 100644
--- a/meta/lib/oeqa/selftest/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/_sstatetests_noauto.py
@@ -28,7 +28,17 @@ class RebuildFromSState(SStateBase):
         self.track_for_cleanup(builddir)
         os.mkdir(os.path.join(builddir, 'conf'))
         shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf'), os.path.join(builddir, 'conf/local.conf'))
+        config = {}
+        config['default_sstate_dir'] = "SSTATE_DIR ?= \"${TOPDIR}/sstate-cache\""
+        config['null_sstate_mirrors'] = "SSTATE_MIRRORS = \"\""
+        config['default_tmp_dir'] = "TMPDIR = \"${TOPDIR}/tmp\""
+        for key in config:
+            ftools.append_file(os.path.join(builddir, 'conf/selftest.inc'), config[key])
         shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/bblayers.conf'), os.path.join(builddir, 'conf/bblayers.conf'))
+        try:
+            shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/auto.conf'), os.path.join(builddir, 'conf/auto.conf'))
+        except:
+            pass
 
     def hardlink_tree(self, src, dst):
         os.mkdir(dst)
-- 
1.8.3.2


