Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6A1A77E09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 13:01:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Jun 2017 06:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,369,1493708400"; d="scan'208";a="276893230"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2017 06:01:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2017 15:58:21 +0300
Message-Id: <20170621125821.18091-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170621125821.18091-1-alexander.kanavin@linux.intel.com>
References: <20170621125821.18091-1-alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 3/3] package_manager.py: set dnf's releasever setting from DISTRO_CODENAME
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
X-List-Received-Date: Wed, 21 Jun 2017 13:01:14 -0000

So that:

1) dnf does not complain anymore about releasever not being set and then fail
for the same reason;

2) it's possible to refer to $releasever in dnf package feed configuration
(repo paths in particular) without hardconding the release name (pyro, morty, etc.)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index bc4e3013f0c..72503eb9d38 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -494,9 +494,11 @@ class RpmPM(PackageManager):
         # This prevents accidental matching against libsolv's built-in policies
         if len(archs) <= 1:
             archs = archs + ["bogusarch"]
-        archconfdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
-        bb.utils.mkdirhier(archconfdir)
-        open(archconfdir + "arch", 'w').write(":".join(archs))
+        confdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
+        bb.utils.mkdirhier(confdir)
+        open(confdir + "arch", 'w').write(":".join(archs))
+        distro_codename = self.d.getVar('DISTRO_CODENAME')
+        open(confdir + "releasever", 'w').write(distro_codename if distro_codename is not None else '')
 
         open(oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"), 'w').write("")
 
-- 
2.11.0


