Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 78DF16E89B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 13:33:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2014 05:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,779,1384329600"; d="scan'208";a="469644715"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.79])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2014 05:33:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 13:33:48 +0000
Message-Id: <1391520828-30296-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/populate_sdk_base: remove nostamp from do_populate_sdk
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
X-List-Received-Date: Tue, 04 Feb 2014 13:33:57 -0000

We've removed nostamp from do_rootfs in image.bbclass in OE-Core commit
8505008c115efb54d18e5f25441c7a938a32ffaf, and we should do the same for
do_populate_sdk here for the same reason - we can now rely on task
signatures so if nothing has changed, we don't need to re-run it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 29890e3..096628b 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -330,7 +330,6 @@ populate_sdk_log_check() {
 }
 
 do_populate_sdk[dirs] = "${TOPDIR}"
-do_populate_sdk[nostamp] = "1"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
 do_populate_sdk[recrdeptask] = "do_package_write"
-- 
1.8.5.3


