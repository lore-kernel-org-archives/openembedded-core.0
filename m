Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F0CFE606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:49:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x83so2298104wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 08:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eSypURmmtY8yCUgmsFwPofXpo9SMxGQcxajLCkOWApQ=;
	b=huxCOTHl6p1Fvr5ijCSP+JpDM83J0fKIaewYFgk7vuiH5NGg5TNvIAFzcGkgIe9oOr
	wgdYu5im7BZJNmlFYWndzEX0uhd9GmR9J49tYckL2ulY2U819InFe9PlvLiKeWtncGUy
	vlLUxJLK0woKsxM0aAZQHqtYocu6CCI6aSYRAyP7Mcl+WWR7vw/VcXDH/VeuRWGddtFy
	2DAgUA7a0sx0LHaAQCjnLJAtEoUgez6d6dQ9qCsaUP4c8ECry9Ieq3oQnRarQ+Q6wuV0
	JzcCQjalNqtQGrjm1iHTgARlNNKSZxGKJP1XTm1cmN8EMVAdDDxcS8F44mCO5EhoEprz
	E5Yg==
X-Gm-Message-State: AEkoouvG2bLAv7l2TUYVyPHMcQWlQrMR+U8ensMaxKubpFomeHojyB688T6U2ImkOTM6fA==
X-Received: by 10.194.73.136 with SMTP id l8mr21259638wjv.153.1469548143586;
	Tue, 26 Jul 2016 08:49:03 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a2sm33679215wma.2.2016.07.26.08.49.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jul 2016 08:49:02 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 16:49:00 +0100
Message-Id: <1469548140-4095-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1469548140-4095-1-git-send-email-git@andred.net>
References: <1469548140-4095-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] tune-mips-24k: add QEMU_EXTRAOPTIONS for DSP and MIPS16e cores
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
X-List-Received-Date: Tue, 26 Jul 2016 15:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The core emulated by default by qemu-mips(el) just crashes with
illegal instruction when encountering DSP and/or MIPS16e
instructions - we have to specify a CPU that supports the extra
instructions.

This is an issue when generating a rootfs and e.g. running some
of the package postinstall scriptlets.

The patch to qemu to add 24KEc as a CPU has been accepted
upstream, so let's use that CPU here as well as needed.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/conf/machine/include/mips/tune-mips-24k.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/machine/include/mips/tune-mips-24k.inc b/meta/conf/machine/include/mips/tune-mips-24k.inc
index 154ab56..828acd4 100644
--- a/meta/conf/machine/include/mips/tune-mips-24k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-24k.inc
@@ -22,12 +22,15 @@ TUNE_FEATURES_tune-mips32r2-24kec-m16 = "${TUNE_FEATURES_tune-mips32r2-24kec} mi
 
 MIPSPKGSFX_VARIANT_tune-mips32r2-24kc = "mips32r2-24kc"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-nf} mips32r2-24kc-nf"
+QEMU_EXTRAOPTIONS_mips32r2-24kc-nf = " -cpu 24Kc"
 
 MIPSPKGSFX_VARIANT_tune-mips32r2-24kec = "mips32r2-24kec"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kc} mips32r2-24kec-nf"
+QEMU_EXTRAOPTIONS_mips32r2-24kec-nf = " -cpu 24KEc"
 
 MIPSPKGSFX_VARIANT_tune-mips32r2-24kec-m16 = "mips32r2-24kec${MIPSPKGSFX_MIPS16E}"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec} mips32r2-24kec-m16-nf"
+QEMU_EXTRAOPTIONS_mips32r2-24kec-m16-nf = " -cpu 24KEc"
 
 
 # little endian: kc, kc+dsp=kec, kc+dsp+mips16e=kec-m16
@@ -37,9 +40,12 @@ TUNE_FEATURES_tune-mips32r2el-24kec-m16 = "${TUNE_FEATURES_tune-mips32r2el-24kec
 
 MIPSPKGSFX_VARIANT_tune-mips32r2el-24kc = "mips32r2el-24kc"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-nf} mips32r2el-24kc-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-24kc-nf = " -cpu 24Kc"
 
 MIPSPKGSFX_VARIANT_tune-mips32r2el-24kec = "mips32r2el-24kec"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kc} mips32r2el-24kec-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-24kec-nf = " -cpu 24KEc"
 
 MIPSPKGSFX_VARIANT_tune-mips32r2el-24kec-m16 = "mips32r2el-24kec${MIPSPKGSFX_MIPS16E}"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec} mips32r2el-24kec-m16-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-24kec-m16-nf = " -cpu 24KEc"
-- 
2.8.1


