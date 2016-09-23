Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B7ABE65C8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:04:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Sep 2016 05:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1055306679"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2016 05:04:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:04:14 +0300
Message-Id: <1474632254-1411-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1474631301-1249-1-git-send-email-jussi.kukkonen@intel.com>
References: <1474631301-1249-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCHv2] gnutls: Skip QA check for text relocation on x86
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
X-List-Received-Date: Fri, 23 Sep 2016 12:04:18 -0000

Current release has relocations in .text on x86. Silence the
warning for now: Upcoming release should have a real fix.

[YOCTO #10290]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
Changes since v1:
 * Add leading space to _append, thanks Martin. 


 meta/recipes-support/gnutls/gnutls_3.5.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
index 1bdca6a..8317eb4 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
@@ -7,3 +7,6 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
            "
 SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
 SRC_URI[sha256sum] = "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b5eae74881bdb1fef"
+
+# x86 .text relocations should be fixed from 3.5.5 onwards
+INSANE_SKIP_${PN}_append_x86 = " textrel"
-- 
2.1.4


