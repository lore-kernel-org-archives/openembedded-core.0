Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56E7E7D86E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 07:03:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m3so1866010wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 00:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kgI9hBZaaOgt/VR0/f0Z7pc+D24ej5zWrVaczEdXQ74=;
	b=MV2Iruh4cg8Slh902+WStaTyuC5NOp8wnoDwswkPmK5JWyVZyjCEx+cw1Z7wDk6Snw
	I/wSGPrBi5xyOthcVMj4y7nWvYfaTbHE977bSzsDO6onmOm6tSHUXxkTF20Y7xd8Wml+
	fCheyKC1MTDg+6VvLVPrJtIwJOfE78QFLMBliU4JZQAOZYadUGfE1oLvB/xLSeqWTqrn
	YNJTYfhcgAncSe5RevPDYloj7TQCmFdxvlfJv7RFAswtP6MXsRdXXBr+7IUghXw3zKZq
	O82pOgVaKJqrSYznLwB/KCT3qAUUnnKZM20bHAzxlbC6Cyz7oL0BzNV1visvF+qzsCPy
	0v4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kgI9hBZaaOgt/VR0/f0Z7pc+D24ej5zWrVaczEdXQ74=;
	b=Z7N0uc+if2P6LAYotGfIvaqzRqUvehUUifM5Kjwnz6Em6ildhjTB0jObLXRd9jkBpJ
	qUj2+TMDeGowIfmMvDZHGBjMTGVw6qJXlp5ncbVzZoPZM9/zqucPrS83gkghHTWMBYgX
	FYRHgjzgmYSUkJGNfHD4ZbOVAhHKMqyhUstxwYD1MoxrcSzJv4Rb4L6YGVW4NVnWSvve
	toSk37mx7jY1k0eDqC7B6+JoK3v3B0H0g31t1Bz5Z5dUqUIKMSr0aR++alDvGFrnMgIr
	HYp1vMIWuvX4Dx/ud1sx89pz5tu6vZvEUpHvNGZn8YWBqLND13IH87W3wV66IVww/2zn
	f37A==
X-Gm-Message-State: APjAAAVj6CBm0gLpVIEN20I24pPjXWFJwGts1uOE/B/bUvcTTxfvyxnr
	owW+S58Cou6WT0LG/5clwLStI4Nv
X-Google-Smtp-Source: APXvYqwAv9akr6Marq89XAAByTqTVCvQ03/9fiocUO76EVXbaA86uwFKGWJCSZeuy+89uiZc93AjLA==
X-Received: by 2002:adf:ec06:: with SMTP id x6mr27632600wrn.159.1557990215659; 
	Thu, 16 May 2019 00:03:35 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q16sm4860146wmj.17.2019.05.16.00.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 00:03:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 07:03:34 +0000
Message-Id: <20190516070334.24298-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] grub-efi-cfg, systemd-boot-cfg: use MACHINE_ARCH
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
X-List-Received-Date: Thu, 16 May 2019 07:03:35 -0000

* both use KERNEL_IMAGETYPE variable which is MACHINE specific
* fixes:

  === Comparing signatures for task do_configure.sigdata between hammerhead and mako ===
  ERROR: grub-bootconf different signature for task do_configure.sigdata between hammerhead and mako
  basehash changed from 710332f3ec15670302dd690708730c9e418d53790ce36d6a91b049ae4f7069b1 to c9a46e58b4634b5fd47d20683f8320e15f5c4cb7628e3a62ed97d8528d7aabd2
  Variable KERNEL_IMAGETYPE value changed from 'zImage-dtb' to 'zImage'

  ERROR: systemd-bootconf different signature for task do_configure.sigdata between hammerhead and mako
  basehash changed from 2abbaf6d7760696fbf1ff5df5705239b475ccbf6f0c831fc4031984c0ce0e9f2 to 24f1e7886dee02b04bc180acc1c946ad82ce842655e5a5f4a8006f4a8490f985
  Variable KERNEL_IMAGETYPE value changed from 'zImage-dtb' to 'zImage'

  detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --targets=world --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/grub-efi-cfg.bbclass     | 3 +++
 meta/classes/systemd-boot-cfg.bbclass | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index 5eeee6c2e3..f661a69f83 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -27,6 +27,9 @@ EFIDIR = "/EFI/BOOT"
 GRUB_ROOT ?= "${ROOT}"
 APPEND ?= ""
 
+# Uses MACHINE specific KERNEL_IMAGETYPE
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 # Need UUID utility code.
 inherit fs-uuid
 
diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index 021c9f9331..b3e0e6ad41 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -2,6 +2,9 @@ SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 SYSTEMD_BOOT_ENTRIES ?= ""
 SYSTEMD_BOOT_TIMEOUT ?= "10"
 
+# Uses MACHINE specific KERNEL_IMAGETYPE
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 # Need UUID utility code.
 inherit fs-uuid
 
-- 
2.17.1


