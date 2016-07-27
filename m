Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 041AF606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:28:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so5301227wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=msdZHLzH0lV5sDjW8WsGNfajWvHaoglDUkWrI+x4hio=;
	b=W41bWD2TI0R7cC9H62kl3mNXXiA+he5nh8WiQrcGb+Y5xDwmQRRel4Fv7txq5Tp1to
	F9Hn0Vx4mt+CpJp8j8MGe/Wc0RpR3WNOpMLnJM3FaHt4RRrYgqll/zur1Zta69NGIu1M
	9LcW7lbzrdmoTFjw1pt31nN0gFp2BF9wBfDsCQJBoHPRgSje5ILFB+0jS3EqDk0+L2cV
	dRWqeNwG6rpWyTDW/HN7a2FbJBur7iebnRNmsXavD7zcZ3d2msV9qHd6LkoX2C8BNbPh
	VMC+GeZAnYaPxHU5MqiHCodVfHxBChEqjcKahQk0IomWjbj4DzRYqxjyFwlk+skOvXnj
	NPoA==
X-Gm-Message-State: AEkoouuiv55fOP7I8a6d0WcjkZYFpIqzTLtsOdtm79kvmLFGw05vEdyMyWlAwf+ZmKoIqg==
X-Received: by 10.28.145.20 with SMTP id t20mr30220459wmd.74.1469608117106;
	Wed, 27 Jul 2016 01:28:37 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id mc8sm5138947wjb.7.2016.07.27.01.28.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 01:28:36 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 09:28:35 +0100
Message-Id: <1469608115-17190-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1469548140-4095-2-git-send-email-git@andred.net>
References: <1469548140-4095-2-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2 v2] qemu.bbclass: add QEMU_EXTRAOPTIONS for MIPS24K (DSP and MIPS16e)
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
X-List-Received-Date: Wed, 27 Jul 2016 08:28:38 -0000
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
 meta/classes/qemu.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 22d8169..7e3efc4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -53,6 +53,12 @@ QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 QEMU_EXTRAOPTIONS_corei7-32 = " -cpu Nehalem,check=false"
 QEMU_EXTRAOPTIONS_corei7-64 = " -cpu Nehalem,check=false"
 QEMU_EXTRAOPTIONS_corei7-64-x32 = " -cpu Nehalem,check=false"
+QEMU_EXTRAOPTIONS_mips32r2-24kc-nf = " -cpu 24Kc"
+QEMU_EXTRAOPTIONS_mips32r2-24kec-nf = " -cpu 24KEc"
+QEMU_EXTRAOPTIONS_mips32r2-24kec-m16-nf = " -cpu 24KEc"
+QEMU_EXTRAOPTIONS_mips32r2el-24kc-nf = " -cpu 24Kc"
+QEMU_EXTRAOPTIONS_mips32r2el-24kec-nf = " -cpu 24KEc"
+QEMU_EXTRAOPTIONS_mips32r2el-24kec-m16-nf = " -cpu 24KEc"
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e500mc"
-- 
2.8.1


