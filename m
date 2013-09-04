Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB746B275
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 16:22:07 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id u54so613327wes.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 09:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wGzpxu41KvY8ePbXksjfr9gn/VUF21r2wrKtds6G2B8=;
	b=Wz/QQRoWzU4Cxuzg/zi7UyYfVk+yjbf7SIZwnzT2vMPmmImGXixO8x6Hf68vB4cBev
	UpEpwmpaCg1ZEdXop0e7CgytjxzM+KJy/dbFsclUnmFgAnzTDcGdUl++x8X6dydsUxs6
	a5+DpP5A0o/RDf/XVwIx6a38hxK/rk30L9m3F0ZlknYKbp13YjsXxdtuGY1IPqCUg8KK
	NoytXiyvtWpn5LCJS0ewsRI0HnsFYhQeTZrCJgHqOLkmxMc4p/KvVTZnV9dX+hTxq1om
	HA4puCxRX+Nwe+5kj/QPkIXnAs4W+6QPz0MEQHDikEqk29ed2fMi8e+8k32csveGHEN1
	77CA==
X-Gm-Message-State: ALoCoQllMo5BSDvv+guYGPNbMUgAY4KAchAwmaneTY2q/ht9SFKHaM28GaKJ/irOMIVXZZnWJn6s
X-Received: by 10.194.86.5 with SMTP id l5mr2444581wjz.45.1378311728411;
	Wed, 04 Sep 2013 09:22:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id u8sm5186549wiz.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 09:22:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 17:22:02 +0100
Message-Id: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Wed, 04 Sep 2013 16:22:07 -0000

Only qemumips was recommending kernel-modules which meant that the other qemu
machines were missing some kernel modules, for example binfmt-misc.

Move the recommends to qemu.inc so that all qemu machines pull in the kernel
modules that have been built.

[ YOCTO #4863 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/qemu.inc |    2 ++
 meta/conf/machine/qemumips.conf    |    2 --
 meta/conf/machine/qemumips64.conf  |    2 --
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 545f8d1..7baf13e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -27,3 +27,5 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
+
+MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index ce1c419..89721a6 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index b2c7998..7ba98cb 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-- 
1.7.10.4


