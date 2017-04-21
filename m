Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7317312D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 22:18:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Apr 2017 15:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,231,1488873600"; d="scan'208";a="90798082"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 21 Apr 2017 15:18:37 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:18:35 -0700
Message-Id: <1492813116-26583-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/2] parselogs: whitelist bluetooth firmware load error for intel-corei7-64
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
X-List-Received-Date: Fri, 21 Apr 2017 22:18:38 -0000

The NUC6 has issues bringing up Bluetooth early in the boot sequence. We
see:

[    4.091790] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    4.097326] Bluetooth: hci0: Found device firmware: intel/ibt-11-5.sfi
[    4.145317] Bluetooth: hci0: Failed to send firmware data (-38)

Followed by this later on:

[   11.509870] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[   11.509988] Bluetooth: hci0: Found device firmware: intel/ibt-11-5.sfi
[   13.090308] Bluetooth: hci0: Waiting for firmware download to complete
[   13.090829] Bluetooth: hci0: Firmware loaded in 1549114 usecs
[   13.090987] Bluetooth: hci0: Waiting for device to boot
[   13.101958] Bluetooth: hci0: Device booted in 10818 usecs

Bluetooth does successfully come up and the firmware is loaded. This
behavior is consistent across all kernels I've tested.

[YOCTO #10628].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 6e92946..8a9231f 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -151,6 +151,7 @@ ignore_errors = {
         'failed to read out thermal zone',
         'Bluetooth: hci0: Setting Intel event mask failed',
         'ttyS2 - failed to request DMA',
+        'Bluetooth: hci0: Failed to send firmware data (-38)',
         ] + x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
-- 
2.5.5


