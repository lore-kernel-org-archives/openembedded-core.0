Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 562B860797
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 16:11:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u88GBVwR011283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 09:11:31 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Sep 2016 09:11:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 09:11:29 -0700
Message-ID: <f1ef4421b32bc136010d797f19648a092b379ac9.1473349886.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473349886.git.liezhi.yang@windriver.com>
References: <cover.1473349886.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] parselogs: Whitelist qemux86 error message with qemu 2.7.0
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
X-List-Received-Date: Thu, 08 Sep 2016 16:11:31 -0000
Content-Type: text/plain

qemu 2.7.0 introduces kernel errors:

[    2.310768] pci 0000:00:00.0: [11ab:4620] type 00 class 0x060000
[    2.311338] pci 0000:00:00.0: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
[    2.311604] pci 0000:00:00.0: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
[    2.311835] pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (can't size)
[    2.312063] pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
[    2.312323] pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
[    2.314320] pci 0000:00:0a.0: [8086:7110] type 00 class 0x060100
[    2.315363] pci 0000:00:0a.1: [8086:7111] type 00 class 0x010180

Whitelist this for now since this is preferable to the random failures
we're seeing from qemuppc with 2.6.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 1b9f6d0..2aabae7 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -74,6 +74,7 @@ ignore_errors = {
     'default' : common_errors,
     'qemux86' : [
         'Failed to access perfctr msr (MSR',
+        'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
         ] + qemux86_common,
     'qemux86-64' : qemux86_common,
     'qemumips' : [
-- 
2.9.0


