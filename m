Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8222C78501
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:35:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 04:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205843493"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 04:35:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 14:34:54 +0300
Message-Id: <24d23d55def40dada3f0f3f03f4706532797cfca.1502795847.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
References: <cover.1502795847.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v4 5/8] package_manager.py: enable dnf's repo_gpgcheck if feed signing is enabled
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
X-List-Received-Date: Tue, 15 Aug 2017 11:35:03 -0000

If package feed signing is enabled enable repo gpg signature check for
rpm repositories added via PACKAGE_FEED_URIS. This has the implication
that all repositories added via this mechanism must be signed with the
same key.

[YOCTO #11209]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 942f2dd903..d43d729203 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -559,6 +559,12 @@ class RpmPM(PackageManager):
         if feed_uris == "":
             return
 
+        if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
+            gpg_opts = 'repo_gpgcheck=1\n'
+            gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO_VERSION'))
+        else:
+            gpg_opts = ''
+
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
         for uri in remote_uris:
@@ -569,12 +575,12 @@ class RpmPM(PackageManager):
                     repo_id   = "oe-remote-repo"  + "-".join(urlparse(repo_uri).path.split("/"))
                     repo_name = "OE Remote Repo:" + " ".join(urlparse(repo_uri).path.split("/"))
                     open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a').write(
-                             "[%s]\nname=%s\nbaseurl=%s\n\n" % (repo_id, repo_name, repo_uri))
+                             "[%s]\nname=%s\nbaseurl=%s\n%s\n" % (repo_id, repo_name, repo_uri, gpg_opts))
             else:
                 repo_name = "OE Remote Repo:" + " ".join(urlparse(uri).path.split("/"))
                 repo_uri = uri
                 open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'w').write(
-                             "[%s]\nname=%s\nbaseurl=%s\n" % (repo_base, repo_name, repo_uri))
+                             "[%s]\nname=%s\nbaseurl=%s\n%s" % (repo_base, repo_name, repo_uri, gpg_opts))
 
     def _prepare_pkg_transaction(self):
         os.environ['D'] = self.target_rootfs
-- 
2.12.3


