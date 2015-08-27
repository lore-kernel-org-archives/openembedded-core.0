Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BEE9976DFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:31:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 02:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="776621089"
Received: from wneubaue-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.11.162])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 02:31:23 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 12:31:16 +0300
Message-Id: <1440667876-1024-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 4/4] package_manager: support for signed RPM package feeds
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
X-List-Received-Date: Thu, 27 Aug 2015 09:31:21 -0000

This change makes it possible to create GPG signed RPM package feeds -
i.e. package feed with GPG signed metadata (repodata). All deployed RPM
repositories will be signed and the GPG public key is copied to the rpm
deployment directory.

In order to enable the new feature one needs to define four variables in
bitbake configuration.
1. 'PACKAGE_FEED_SIGN = "1"' enabling the feature
2. 'PACKAGE_FEED_GPG_NAME = "<key_id>"' defining the GPG key to use for
   signing
3. 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "<path_to_file>"' pointing to a
   file containing the passphrase for the secret signing key
4. 'PACKAGE_FEED_GPG_PUBKEY = "<path_to_pubkey>"' pointing to the
   corresponding public key (in "armor" format)
The user may define "GPG_CMD" in the bitbake configuration in order to
specify a specific the gpg binary/wrapper to use for signing.

[YOCTO #8134]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 936887c..83c119a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -108,8 +108,17 @@ class RpmIndexer(Indexer):
         archs = archs.union(set(sdk_pkg_archs))
 
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+            pkgfeed_gpg_name = self.d.getVar('PACKAGE_FEED_GPG_NAME', True)
+            pkgfeed_gpg_pass = self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True)
+        else:
+            pkgfeed_gpg_name = None
+            pkgfeed_gpg_pass = None
+        gpg_bin = self.d.getVar('GPG_BIN', True) or \
+                  bb.utils.which(os.getenv('PATH'), "gpg")
 
         index_cmds = []
+        repo_sign_cmds = []
         rpm_dirs_found = False
         for arch in archs:
             dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
@@ -121,6 +130,12 @@ class RpmIndexer(Indexer):
 
             index_cmds.append("%s --dbpath %s --update -q %s" % \
                              (rpm_createrepo, dbpath, arch_dir))
+            if pkgfeed_gpg_name:
+                repomd_file = os.path.join(arch_dir, 'repodata', 'repomd.xml')
+                gpg_cmd = "%s --detach-sign --armor --batch --no-tty --yes " \
+                          "--passphrase-file '%s' -u '%s' %s" % (gpg_bin,
+                          pkgfeed_gpg_pass, pkgfeed_gpg_name, repomd_file)
+                repo_sign_cmds.append(gpg_cmd)
 
             rpm_dirs_found = True
 
@@ -132,12 +147,20 @@ class RpmIndexer(Indexer):
         result = oe.utils.multiprocess_exec(index_cmds, create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
-        # Copy pubkey to repo
+        # Sign repomd
+        result = oe.utils.multiprocess_exec(repo_sign_cmds, create_index)
+        if result:
+            bb.fatal('%s' % ('\n'.join(result)))
+        # Copy pubkey(s) to repo
         distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
             shutil.copy2(self.d.getVar('RPM_GPG_PUBKEY', True),
                          os.path.join(self.deploy_dir,
                                       'RPM-GPG-KEY-%s' % distro_version))
+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+            shutil.copy2(self.d.getVar('PACKAGE_FEED_GPG_PUBKEY', True),
+                         os.path.join(self.deploy_dir,
+                                      'REPODATA-GPG-KEY-%s' % distro_version))
 
 
 class OpkgIndexer(Indexer):
-- 
2.1.4


