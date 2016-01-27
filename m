Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA0777187
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 20:58:56 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cy9so10519498pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 12:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pJs4HRgz5AJCuuaSUB0SSQXVOK7IhlUzG8C8XUmR8tU=;
	b=nNsNAkMjF+Q8UFk4cfLLrEQ/1alei9SposkdhhHVozAVwoDYWcNLYSSz1wRBV4Rs5+
	W4DVafnoXyfQCnxpX53JhjJYo2QKQYyRXmxVLqPIX0Dh3d67XSDH7hW1Afep1vPi9A/j
	Enu6djMerKKhsMh54TLwNnaEIos+/qyNwwfuPSO8ovdod0swGghNPhs9I+k2CHPS5BlD
	F2rOmnSgnFih8rzH4dGGTVEGi0VVqVRtn69343b495y271oNkGMigTrUKtJTdZkhR9rH
	ZNoPuUDNg6w+Gpx6v5jQiw1mFIHw/aDHKqId5/JxMFkkw0KplXMuQ2W8QhbyOu8e6wxb
	nD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pJs4HRgz5AJCuuaSUB0SSQXVOK7IhlUzG8C8XUmR8tU=;
	b=bsP98DK3QjTJbKAALnvD98OGlWIjtwS3Udk9SF3oJFc+8sq1xCGISovF1h+nsqaj+P
	VtbqGTxZ2XaaxzgYP2n2WIXijlkaFFoiqY89y0b7GEHfV4SwhigIglmQXsWvjiZsrDbQ
	lCG04OqUrekKfS4uT2U0M1vzqN3Z+K0KnluNWlZ7IkUOXJzY4pgbRlJczu3nmH2Xod8L
	xQIdI5uUqoxMb1wK8/lr+BeoDOsntHsie/k9SBygzxTXpRQ1bZ1MoPr6JhSdpeb4wQvb
	h0MO9shpj1D2LIxv7KpKHZj9rzfRRQUXeFEPKN903BsLBh1LT4YUcQqZrgKvLX436FIZ
	fQuw==
X-Gm-Message-State: AG10YOTTuetlaguHeryHVgLwvD+GzLoWEBlvoRklH1pmM8kCrWYdEtrcmhPFcz6n5rvwMw==
X-Received: by 10.66.159.38 with SMTP id wz6mr45654012pab.12.1453928336760;
	Wed, 27 Jan 2016 12:58:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 6sm475496pfo.58.2016.01.27.12.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 12:58:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 12:58:51 -0800
Message-Id: <1453928331-30257-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] qemu.bbclass: clarify QEMU_EXTRAOPTIONS
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
X-List-Received-Date: Wed, 27 Jan 2016 20:59:00 -0000

QEMU_EXTRAOPTIONS is a way to add PACKAGE_ARCH specific options to the
qemu_run_binary qemu commandline. The base QEMU_EXTRAOPTIONS variable
(ie without a PACKAGE_ARCH suffix) is not used, so defining it, either
directly or via an over-ride has no effect.

Although previously an over-ride for _armv7a was used, it did nothing
for most armv7a builds, which typically use PACKAGE_ARCH values such
as "cortexa9hf-neon". In practice this worked OK since without a -cpu
option, qemu-arm will default to emulating a CPU which supports all
required architecture levels.

qemu-arm (v2.5.0) with no -cpu option has been confirmed to
successfully run binaries built for armv7ve.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/qemu.bbclass | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 315c17f..c696085 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -35,18 +35,20 @@ def qemu_run_binary(data, rootfs_path, binary):
             + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
 
-# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are 
-# PACKAGE_ARCH, not overrides and hence have to do this dance. Simply being arch 
-# specific isn't good enough.
+# QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are
+# PACKAGE_ARCH, *NOT* overrides.
+# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
+# enough and a PACKAGE_ARCH specific -cpu option is needed (hence we have to do
+# this dance). For others (e.g. arm) a -cpu option is not necessary, since the
+# qemu-arm default CPU supports all required architecture levels.
+
 QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
-QEMU_EXTRAOPTIONS_iwmmxt    = " -cpu pxa270-c5"
-QEMU_EXTRAOPTIONS_armv6     = " -cpu arm1136"
-QEMU_EXTRAOPTIONS_armv7a    = " -cpu cortex-a8"
+
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e5500"
 QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
 QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
-QEMU_EXTRAOPTIONS_ppc7400   = " -cpu 7400"
+QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
-- 
1.9.1


