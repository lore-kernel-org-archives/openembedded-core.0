Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF856093A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 18:15:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Sep 2016 11:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,382,1470726000"; d="scan'208";a="1055460535"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2016 11:15:05 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 11:15:00 -0700
Message-Id: <1474654500-20199-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] parselogs.py: Add amd_nb error to x86_common whitelist
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
X-List-Received-Date: Fri, 23 Sep 2016 18:15:04 -0000

This has always silently failed on hardware without AMD Northbridge,
and a recent kernel patch made it not silent. It would be ideal to only
whitelist the error for genericx86 MACHINEs and disable the CONFIG
option that enables it in intel-* MACHINEs, but in order to disable
this configuration option we would have to enable EXPERT and
DEBUG_KERNEL, which we don't want. Instead just whitelist it on all
x86 MACHINEs.

Fixes [YOCTO #10261].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 763c42f..2d4a133 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -56,6 +56,7 @@ x86_common = [
     'probe of LNXPWRBN:00 failed with error -22',
     'pmd_set_huge: Cannot satisfy',
     'failed to setup card detect gpio',
+    'amd_nb: Cannot enumerate AMD northbridges',
 ] + common_errors
 
 qemux86_common = [
-- 
2.5.5


