Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14A2E757D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 10:57:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Jun 2015 03:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,573,1427785200"; d="scan'208";a="723020651"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2015 03:53:01 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 13:53:07 +0300
Message-Id: <233b4b03f6f31e477d85baf38634d75a29eb965b.1433760735.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433760735.git.cristian.iorga@intel.com>
References: <cover.1433760735.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1433760735.git.cristian.iorga@intel.com>
References: <cover.1433760735.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] insane: errors out on binaries installed by allarch-inherit recipes
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
X-List-Received-Date: Mon, 08 Jun 2015 10:57:57 -0000

If a prebuilt binary is installed via a recipe that
inherits allarch, an odd-looking traceback is thrown out.
Fixed by implementing a proper check and outputting an
error message that clarifies the issue.

Fixes [YOCTO #7662].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/classes/insane.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 14d4a3c..e12f2ec 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -457,6 +457,11 @@ def package_qa_check_arch(path,name,d, elf, messages):
     provides = d.getVar('PROVIDES', True)
     bpn = d.getVar('BPN', True)
 
+    if target_arch == "allarch":
+        pn = d.getVar('PN', True)
+        messages["arch"] = pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries"
+        return
+
     # FIXME: Cross package confuse this check, so just skip them
     for s in ['cross', 'nativesdk', 'cross-canadian']:
         if bb.data.inherits_class(s, d):
-- 
2.1.4


