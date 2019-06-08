Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id A688C7E53D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 12:02:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id b17so4633064wrq.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2019 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kgI9hBZaaOgt/VR0/f0Z7pc+D24ej5zWrVaczEdXQ74=;
	b=V7ONuVBwQ3xGqA54CKgK1Ifs5ocRq1gTmj7Q8MPBUcy9khjjNWuAw+mZxfohQgLqTV
	nswrnN8N75yEcW2tmFHsqRpCZIM8lW2wLBPxktF4QbScC5247xgKVWh5czzm/IGUIHS1
	scrRUrSoTpavJv41b1UrPg/sRlhVYq2kYr/C8PqrZUM6XcFwXU0YxAGyv+7oMYv6hHr6
	f2pMsUi1G87hlNTqKfSpWJk0/Hwc1obmB59QUKZkU72UZCH07rK/FLsA8zoO7X1bUckQ
	idGZbjhK5h0xlFwmu7l2zVvGfxDb/rlroUyzRu+yf+YK4DfmPXq5+j2ZFBrztpwpMhH5
	BA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kgI9hBZaaOgt/VR0/f0Z7pc+D24ej5zWrVaczEdXQ74=;
	b=HgC32FCRnt3ennn3jakLsP3SBgSteUEEe6Vk0lzxZpaOtsiXrpwUMb3esrinqPJ5jg
	DU2X0rWwXTCqhYszf/m4yM799+FeOCy6jFYZRbpB2QbZgMTr7v+XD3sx3yC4OsL40mgt
	qPokXGNePu1Z/u6tvVC/WPsOnlbD26huJ8CrsGgjnStyHtLic/+JW7FkIVXOp9fX8QO0
	8yd/Z72Tab1CoDKC9b0yHxB5/YPTEE/GGk16TPHe5Y9HqDk7uF5vjU+h4aThnrZXk6dO
	IObz8tEJH1Uv/+FFBttt7x0I+WHngnjgXKVlme1syxgFr2V3NWFaBpjntrl/ECkFK+dY
	MnRw==
X-Gm-Message-State: APjAAAUaraILgTQO26joQa8p45dyd0CU2ve+5d5eNwooI3rLyh1Z+PUR
	bDqMkkIfkO+8ZiHea5b9Iv/bk0ib
X-Google-Smtp-Source: APXvYqwcW9C19ACouwQTvhIn1c/vfkSQqneEVJ6b4K6A112vFZYgoqsT184FvIzjNxIwRudhqKYa5Q==
X-Received: by 2002:adf:f2c8:: with SMTP id d8mr10669287wrp.221.1559995327008; 
	Sat, 08 Jun 2019 05:02:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j132sm8878593wmj.21.2019.06.08.05.02.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 08 Jun 2019 05:02:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jun 2019 12:02:04 +0000
Message-Id: <20190608120204.265-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] grub-efi-cfg, systemd-boot-cfg: use MACHINE_ARCH
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
X-List-Received-Date: Sat, 08 Jun 2019 12:02:07 -0000

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


