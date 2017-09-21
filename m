Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBE2477FF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 11:25:20 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g50so2971970wra.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 04:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/wz1OTlipBSd0vjDWroHnA+v/QAHHWoc7xuY7exFr3o=;
	b=F+QU9vp/65PT5e6jpqpNVwUa5PevRw/MMtGu/+jOdopxyOSAc4b9S2ptxBmyvZkDzJ
	jQg3xz3cJAfMx5In4xXU21XBI/bPqhIoEp/YMJ9HYPqM9r3ao5CdzLEALAsYNKgjYgCK
	X9pq+0G7VwiLxupS1E0r+8b5l8alcKxJ6KxIsPkCLG9tkd+m5tAKuiikdYHlR/181sEt
	gGxIdTBezXGsm7WYeRdlaGjRtFAC5keWRy9swyz6GE3mWipWSz5hVqIJFCeLVOlTWx4I
	mrgqSJN1cB2EucCu6oYjyFbGjdgKJwzse9TloRmsrbnjXO7bKWlYUFAwzoZiakr+SF2d
	usCA==
X-Gm-Message-State: AHPjjUhBU6I8OzyInZcsZ7R9G/krkssN2u4rPVXIjmA2y24spZA4A51y
	8wIsqxUIbEebK/HXgNcec3A7f99d
X-Google-Smtp-Source: AOwi7QB1WgG3qty8e9SDLKOhcc+DHW9/jmAagKtE3YBe9Zzr3GG+lkufBJC5ELoTzpFiZToCg+SSTQ==
X-Received: by 10.223.173.204 with SMTP id w70mr1712736wrc.281.1505993121041; 
	Thu, 21 Sep 2017 04:25:21 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id s3sm1808085wrc.24.2017.09.21.04.25.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 04:25:20 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 12:25:17 +0100
Message-Id: <20170921112518.16132-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "u-boot: fix extlinux creation race"
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
X-List-Received-Date: Thu, 21 Sep 2017 11:25:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This reverts commit 60c90398580998b2379bb438f0f75b29285135a5.

This causes circular dependencies when UBOOT_SIGN_ENABLE is active.

These are usually caused by circular dependencies and any circular dependency chains found will be printed below. Increase the debug level to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task u-boot.bb:do_concat_dtb (dependent Tasks ['kernel.bb:do_assemble_fitimage'])
  Task u-boot.bb:do_install (dependent Tasks ['u-boot.bb:do_concat_dtb', 'pseudo_1.8.2.bb:do_populate_sysroot', 'u-boot.bb:do_compile'])
  Task u-boot.bb:do_deploy (dependent Tasks ['u-boot.bb:do_deploy_dtb', 'u-boot.bb:do_install'])
  Task .../recipes-kernel/linux/kernel.bb:do_assemble_fitimage (dependent Tasks ['kernel.bb:do_compile', 'u-boot.bb:do_deploy'])

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index aa21c0e556..c2bcf99840 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -304,4 +304,4 @@ do_deploy () {
     fi
 }
 
-addtask deploy before do_build after do_install
+addtask deploy before do_build after do_compile
-- 
2.14.1


