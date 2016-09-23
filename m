Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 239976093F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:48:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 23 Sep 2016 04:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="172358930"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2016 04:48:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 14:48:21 +0300
Message-Id: <1474631301-1249-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gnutls: Skip QA check for text relocation on x86
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
X-List-Received-Date: Fri, 23 Sep 2016 11:48:26 -0000

Current release has relocations in .text on x86. Silence the
warning for now: Upcoming release should have a real fix.

[YOCTO #10290]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/gnutls/gnutls_3.5.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
index 1bdca6a..2010889 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
@@ -7,3 +7,6 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
            "
 SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
 SRC_URI[sha256sum] = "92c4bc999a10a1b95299ebefaeea8333f19d8a98d957a35b5eae74881bdb1fef"
+
+# x86 .text relocations should be fixed from 3.5.5 onwards
+INSANE_SKIP_${PN}_append_x86 = "textrel"
-- 
2.1.4


