Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5606572F83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875718"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:45 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:34 +0200
Message-Id: <981c190c9015d2af41e5224e01532442631b08e4.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 17/39] package_rpm.bbclass: make architecture-independent .rpm packages "noarch" instead of "all"
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:54 -0000

Too many places in dnf/rpm4 stack make that assumption; let's not fight against it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index db448ab8d1d..07eb974f736 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -684,7 +684,9 @@ python do_package_rpm () {
     rpmbuild = d.getVar('RPMBUILD')
     targetsys = d.getVar('TARGET_SYS')
     targetvendor = d.getVar('HOST_VENDOR')
-    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_")
+    # Too many places in dnf stack assume that arch-independent packages are "noarch".
+    # Let's not fight against this.
+    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_").replace("all", "noarch")
     sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
     if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
         ml_prefix = (d.getVar('MLPREFIX') or "").replace("-", "_")
-- 
2.11.0


