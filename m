Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 66E2B719F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 20:28:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 29 Nov 2016 12:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,570,1473145200"; d="scan'208";a="36928343"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 29 Nov 2016 12:28:27 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 12:28:18 -0800
Message-Id: <1480451298-14142-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] parselogs.py: Whitelist iwlwifi firmware load error messages
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
X-List-Received-Date: Tue, 29 Nov 2016 20:28:28 -0000

The iwlwifi module of any given kernel has a minimum and maximum
supported firmware version. The kernel begins by attempting to load the
maximum version, and decrements until it is successful. The 4.8 kernel's
maximum supported firmware version is 24, but thus far only 22 has been
released, meaning we get errors for 24 and 23.

Filter out iwlwifi firmware load error messages, as they are not
necessarily indicative of real problems.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 58f62da..8610863 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -58,6 +58,7 @@ x86_common = [
     'failed to setup card detect gpio',
     'amd_nb: Cannot enumerate AMD northbridges',
     'failed to retrieve link info, disabling eDP',
+    'Direct firmware load for iwlwifi',
 ] + common_errors
 
 qemux86_common = [
-- 
2.5.5


