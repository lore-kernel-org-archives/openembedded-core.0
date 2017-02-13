Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC077732A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:06:16 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:06:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546820"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:06:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:06:06 +0200
Message-Id: <5eb1a4810bf745c5932feee2d1b47621353e9689.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 36/36] package_deb.bbclass: Ignore file paths in RPROVIDES
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
X-List-Received-Date: Mon, 13 Feb 2017 15:06:16 -0000

From: Amarnath Valluri <amarnath.valluri@intel.com>

Unlike rpm, debian packaging does not allow file paths in 'Provides:' field.
When 'usrmerge' distro feature enabled bash/busybox packages adds '/bin/sh' to
it's RPROVIDES to satisfy build dependencies, this entry should be filtered out.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eb549ca971a..e1bc078d6b6 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -237,6 +237,10 @@ python do_package_deb () {
         debian_cmp_remap(rsuggests)
         # Deliberately drop version information here, not wanted/supported by deb
         rprovides = dict.fromkeys(bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES") or ""), [])
+        # Remove file paths if any from rprovides, debian does not support custom providers
+        for key in list(rprovides.keys()):
+            if key.startswith('/'):
+                del rprovides[key]
         rprovides = collections.OrderedDict(sorted(rprovides.items(), key=lambda x: x[0]))
         debian_cmp_remap(rprovides)
         rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES") or "")
-- 
2.11.0


