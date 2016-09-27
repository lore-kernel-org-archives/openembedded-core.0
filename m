Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C5F7B60069
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 21:29:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2016 14:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,406,1470726000"; d="scan'208";a="1063124223"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2016 14:29:20 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 14:32:04 -0700
Message-Id: <1475011924-241525-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] parselogs: Update uvesafb errors in qemu whitelist
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
X-List-Received-Date: Tue, 27 Sep 2016 21:29:20 -0000

This change only whitelists the timeout message in infinite
wait case in uvesafb driver.

With the latest timeout patch introducing infinite wait in
uvesafb driver, we whitelist the timeout message since it works
as a warning for issues related to timeout not to be fixed in
build servers.

We remove other errors for bug-discovering purposes in some cases
where these lines are still worthy to be caught (not whitelisted):

The removed errors show up again in the infinite wait case. It
indicates a different root cause or the timeout patch doesn't work
correctly.

Timeout happens when developers explicitly set a non-negative timeout
of a limited period to wait for task completion in uvesafb driver.

Timeout or/and errors occur when kernel doesn't have the latest
timeout patch in driver.

Note: The latest timeout patch is tracked by:
a2966330bcd29e99c0403235edb29433b0c53d56

[YOCTO #8245]

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---

NOTE: I don't have an AB server setup to really test it before submission.

Please review it carefully before merge this patch.

Let me know if there any way I can test it, or we just wait any result from AB server...

Thanks

 meta/lib/oeqa/runtime/parselogs.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 763c42f..40247d2 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -63,11 +63,7 @@ qemux86_common = [
     "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
     "can't claim BAR ",
     'amd_nb: Cannot enumerate AMD northbridges',
-    'uvesafb: 5000 ms task timeout error',
-    'detected fb_set_par error, error code: -22',
-    'Getting VBE info block failed',
-    'vbe_init() failed with -22',
-    'uvesafb: mode switch failed',
+    'uvesafb: 5000 ms task timeout, infinitely waiting',
     'tsc: HPET/PMTIMER calibration failed',
 ] + common_errors
 
-- 
2.7.4


