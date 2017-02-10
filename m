Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 30EE060851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:42:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 05:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="42543564"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2017 05:42:37 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 15:42:17 +0200
Message-Id: <1486734151-28331-10-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 09/23] package_deb.bbclass: Ignore file paths in RPROVIDES
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
X-List-Received-Date: Fri, 10 Feb 2017 13:42:37 -0000

Unlike rpm, debian packaging does not allow file paths in 'Provides:' field.
When 'usrmerge' distro feature enabled bash/busybox packages adds '/bin/sh' to
it's RPROVIDES to satisfy build dependencies, this entry should be filtered out.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/package_deb.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eb549ca..e1bc078 100644
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
2.7.4


