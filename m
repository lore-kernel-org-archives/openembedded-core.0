Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF5C731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:54:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7VEsCMb001263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Aug 2016 07:54:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 31 Aug 2016 07:54:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 31 Aug 2016 10:54:11 -0400
Message-ID: <1472655251-15336-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemuarm/qa: whitelist amba and jitter
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
X-List-Received-Date: Wed, 31 Aug 2016 14:54:17 -0000
Content-Type: text/plain

With the update to the 4.8 kernel the versatile platform (and hence
qemuarm) has switched to a device tree boot.

We are using an ummodified mainline kernel versatilepb device tree,
which includes definitions of multiple amba devices. These devices
are not present in the qemu system emulation, hence throw warnings
during boot.

These warnings are not unique to oe-core, and rather than carry kernel
patches to the device tree (for now), we whitelist the known warnings
so qa testing will pass. We also can't turn amba off completely, since
it is providing valid devices (like the serial port) and AMBA is
force selected by other kconfig values.

We also have a jitterentropy warning that shows up on some hosts.
This warning is harmless, and like amba we can't turn it off in a
fragment since it is force selected by crypto (and we'd rather not
turn all crypto off). So we add it to the whitelist while investigations
continue into what is needed in the host to support this fully.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 8a13554cc5da..2424da127422 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -92,7 +92,16 @@ ignore_errors = {
     'qemuarm' : [
         'mmci-pl18x: probe of fpga:05 failed with error -22',
         'mmci-pl18x: probe of fpga:0b failed with error -22',
-        'Failed to load module "glx"'
+        'Failed to load module "glx"',
+        'OF: amba_device_add() failed (-19) for /amba/smc@10100000',
+        'OF: amba_device_add() failed (-19) for /amba/mpmc@10110000',
+        'OF: amba_device_add() failed (-19) for /amba/sctl@101e0000',
+        'OF: amba_device_add() failed (-19) for /amba/watchdog@101e1000',
+        'OF: amba_device_add() failed (-19) for /amba/sci@101f0000',
+        'OF: amba_device_add() failed (-19) for /amba/ssp@101f4000',
+        'OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000',
+        'Failed to initialize \'/amba/timer@101e3000\': -22',
+        'jitterentropy: Initialization failed with host not compliant with requirements: 2',
         ] + common_errors,
     'qemuarm64' : [
         'Fatal server error:',
-- 
2.5.0


