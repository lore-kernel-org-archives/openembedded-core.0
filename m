Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF7261663
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 13:16:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jun 2013 06:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,896,1363158000"; d="scan'208";a="356057172"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2013 06:15:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2013 14:15:52 +0100
Message-Id: <1371647752-29176-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/package_tar: fix file ownership within tarballs
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
X-List-Received-Date: Wed, 19 Jun 2013 13:16:00 -0000

The fakeroot flag wasn't correctly set leading to files within the
output tarballs having uid/gid values from the build host instead of the
desired target permissions.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_tar.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index c4bb62f..2d6fc8f 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -56,7 +56,7 @@ python () {
         deps.append('tar-native:do_populate_sysroot')
         deps.append('virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package_write_tar', 'depends', " ".join(deps))
-        d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
+        d.setVarFlag('do_package_write_tar', 'fakeroot', "1")
 }
 
 
-- 
1.8.1.2


