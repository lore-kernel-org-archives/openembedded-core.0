Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E84EF77BE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:32:58 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id a103so94624912ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NHOg9vbvH7WBFg2GgOubiI9yHKlPKcwrMd0oQJabFqI=;
	b=E6u9Pbga6ErUFnCBn1M6OPmiAPFE6iga3HX/0lgG0a19bJKyUkl+FF1ok0sxLZb+rs
	+x78j7uxA43fMZ3+WO8s5c+90/zlQoRcd5AE3NjilbrNBr10BledDq4fDZP+H7jXLzms
	gO3YLnhpx8081irzM/X+VfuPhBvZgkwhIjpAo5DFQX4/e7XAYvg4bimFys6ijNipNRWy
	heFTaLzJCrjPcfATBSqbqCKBsNpmBynJ6iK/QXkkJmPT0cI72B3cB87ozl5tiSdqoCBd
	fYmVUj1cqOhK6kXX/fAqlWnX8ngre9kOpXkRK2dybVo4NBjWXEH915kWAMLomPQwK/IZ
	iJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NHOg9vbvH7WBFg2GgOubiI9yHKlPKcwrMd0oQJabFqI=;
	b=TdeGRYJVRqZ6blUBeVtvQSxbbZHkWPOpN7YUYkUA3O+uvotHznBIMX+eyR/Zrf2g7C
	RrU0mnEasUiDyIoEebJKuImY/j2ZNHuNE/bC6Qs+4sxoU6IJSB2AyERemtrwzkkdCZOE
	oFtouyUpEJrLpvbNuqLlkealqPrgkf58ZFbtEQsrthNLtD0/+3DEPstW3PrcTOX5sghC
	zYrcULI7G2Kizh9hMk0q0lojG8vLEWR56lyN0m69PYzNJiu3j5iIvd4xrB72iCG+HerH
	nm2IrSIWP28dOPMULiV5K6xDz2pvb/usmiwL83QHPQ3Px5HPDG00Ow2U5rhWij45hvIr
	Yq5Q==
X-Gm-Message-State: AN3rC/69ZHFF4I0jXb3K5v8k9gJTjP18MS/csiNYykwI6zryLmdnsJDl
	rRwRZ/0LzDMMWfXQ
X-Received: by 10.107.140.10 with SMTP id o10mr6342426iod.139.1492115579683;
	Thu, 13 Apr 2017 13:32:59 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C73A.dip0.t-ipconnect.de.
	[93.232.199.58])
	by smtp.gmail.com with ESMTPSA id h71sm78194ioe.9.2017.04.13.13.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 13:32:58 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 22:32:51 +0200
Message-Id: <20170413203251.1915-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] runqemu: support virtio drive type
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
X-List-Received-Date: Thu, 13 Apr 2017 20:32:59 -0000

Setting QB_DRIVE_TYPE=/dev/vd selects virtio without triggering any
warnings. Previously, that was only possible by setting an unknown
value and relying on the fallback to virtio, which caused some
warnings to be printed.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5b5d56b9ef4..a536ff17c07 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -992,12 +992,15 @@ class BaseConfig(object):
                         logger.info('Using ide drive')
                         vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
                     else:
-                        logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
-
-                if not vm_drive:
-                    logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
-                    logger.warn('Trying to use virtio block drive')
-                    vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
+                        # virtio might have been selected explicitly (just use it), or
+                        # is used as fallback (then warn about that).
+                        if not drive_type.startswith("/dev/vd"):
+                            logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
+                            logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
+                            logger.warn('Trying to use virtio block drive')
+                        vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
+
+                # All branches above set vm_drive.
                 self.rootfs_options = '%s -no-reboot' % vm_drive
             self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
 
-- 
2.11.0


