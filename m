Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A6CA875F3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 15:06:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2015 08:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,681,1437462000"; d="scan'208";a="810876385"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2015 08:01:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:01:01 +0300
Message-Id: <1444834861-19459-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444834861-19459-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1444834861-19459-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] package_manager: support GPG_PATH variable
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
X-List-Received-Date: Wed, 14 Oct 2015 15:06:31 -0000

If defined, use GPG_PATH as the gpg home directory when signing package
feeds. This setting is only used by package_manager if package feed
singning has been enabled, i.e.  PACKAGE_FEED_SIGN="1".

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c34e436..5c2130b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -133,8 +133,11 @@ class RpmIndexer(Indexer):
             if pkgfeed_gpg_name:
                 repomd_file = os.path.join(arch_dir, 'repodata', 'repomd.xml')
                 gpg_cmd = "%s --detach-sign --armor --batch --no-tty --yes " \
-                          "--passphrase-file '%s' -u '%s' %s" % (gpg_bin,
-                          pkgfeed_gpg_pass, pkgfeed_gpg_name, repomd_file)
+                          "--passphrase-file '%s' -u '%s' " % \
+                          (gpg_bin, pkgfeed_gpg_pass, pkgfeed_gpg_name)
+                if self.d.getVar('GPG_PATH', True):
+                    gpg_cmd += "--homedir %s " % self.d.getVar('GPG_PATH', True)
+                gpg_cmd += repomd_file
                 repo_sign_cmds.append(gpg_cmd)
 
             rpm_dirs_found = True
-- 
2.1.4


