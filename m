Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B4F0A60665
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 00:03:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2020 16:03:16 -0800
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; d="scan'208";a="235771903"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.156])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2020 16:03:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 08:03:10 +0800
Message-Id: <20200206000310.109984-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [zeus][PATCH] Revert "bzip2: Fix CVE-2019-12900"
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
X-List-Received-Date: Thu, 06 Feb 2020 00:03:15 -0000
Content-Transfer-Encoding: 8bit

This reverts commit 175e6cb75ce328d51a9d4ad18c7e09d9fb92c2e1.

This change is already in bzip2 1.0.7. The change fixing a regression
caused by this change is in 1.0.8 which is the current version in zeus.

This isn't resulting in failures because the patch file isn't included
in SRC_URI.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
deleted file mode 100644
index 9859d9d1a2..0000000000
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
-From: Albert Astals Cid <aacid@kde.org>
-Date: Tue, 28 May 2019 19:35:18 +0200
-Subject: [PATCH] Make sure nSelectors is not out of range
-
-nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
-which is
-UChar    selectorMtf[BZ_MAX_SELECTORS];
-so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
-access
-Fixes out of bounds access discovered while fuzzying karchive
-
-Link: https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc.patch
-
-Upstream-Status: Backport
-CVE: CVE-2019-12900.patch
-Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
----
- decompress.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/decompress.c b/decompress.c
-index ab6a624..f3db91d 100644
---- a/decompress.c
-+++ b/decompress.c
-@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
-       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
-       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
-       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
--      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
-+      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
-       for (i = 0; i < nSelectors; i++) {
-          j = 0;
-          while (True) {
---
-2.22.0
-- 
2.24.1


