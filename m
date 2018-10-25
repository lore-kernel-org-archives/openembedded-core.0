Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECD060402
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 05:35:20 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t22-v6so6961345lji.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 22:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0djAKO/yXm1H/DLp1Y32TMcNfw83trR3t+frZ++vX0Q=;
	b=jWMp7q9NBxMpDscwRZ4zeTkZuSZiJGZ5Jlpx7VH12Tc+zw3vTA8G9zYW/sCwiG63Cl
	l+PQUaiN+PoTKmxaExniYZq70kbexAkshVN7wJv7O7hW3SMCpvOXp5RstAKAkY5CQjsx
	uc4LYU/p6HdD1pJJiWKCDWCbVqTG2ARHciH379YrB4zLzvoC7GVMUwIktkHYNVd/yLHh
	uVDAh3+ESJMshJUIdV8cZZZf9ICGYmErQCPiAcckuwpXdBsnlpydPVEvjxJ8YduGf/ai
	0h44ucfu7WboHcLzSrYWZHWYcf4PQzz/Irxu5IW1o6FbP2s/MSTQM6y/aUt2CotS3DSG
	AZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0djAKO/yXm1H/DLp1Y32TMcNfw83trR3t+frZ++vX0Q=;
	b=JWBFutCLVbPo0Is25qBPVJO8hBE5TbqpO3s54OemUN26SX11wY0Oaz1zFSinOTw45B
	mVdK4++UUT2eR9rTIaCOOB6FmugiGthiQgrlHAMg2EYCxlpBM0VYtvY4D24xfj8aFXZV
	H0BXNB3cXx3pUcP4TqfADQbVSSsVOquSSBLTBRuZ9Rk+5zwX3DnnO0ArLX6us24ndGT2
	qBUm3/OyVWIoNmi8rrfZEPgcWsONryAVwLSyZ6y5FOQ2FQfafX3bZ0EXFTvFVSmNDESK
	+Z23I120tmnnJ7Uz5w7pENKW2Ok459ihliNSz14jIvBQsgsHUJZEEyKye8kArjV1YH2z
	Jing==
X-Gm-Message-State: AGRZ1gKXSD4HlB4o+w4M5PWwDLH+nwQZdD/q2WcJBkCXtgrdIlTA0sR5
	s8lq3p3AZEODaXjzaoRsLb1GV+hw3Pk=
X-Google-Smtp-Source: AJdET5eG/5nDZNuy30h8esaQGwmFcbkn8gY6a9NQW4B2CRNRrwIo75FnKO3uRi9HhRG2i/nkQLvdxA==
X-Received: by 2002:a2e:630a:: with SMTP id x10-v6mr125771ljb.11.1540445720481;
	Wed, 24 Oct 2018 22:35:20 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-250-30.cust.tele2.se. [77.218.250.30])
	by smtp.gmail.com with ESMTPSA id
	18-v6sm782958ljg.50.2018.10.24.22.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Oct 2018 22:35:19 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 07:35:13 +0200
Message-Id: <1540445713-22944-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] wic: bootimg-efi: add a title source parameter
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
X-List-Received-Date: Thu, 25 Oct 2018 05:35:20 -0000

From: Ming Liu <liu.ming50@gmail.com>

Sometimes the users might want to change the title showing on UEFI
booting screen, so far it's hard-coded to 'boot'.

There is not a easy way to customize it in current design, I tried
firstly with '--configfile', but that does not work with --use-uuid,
since the later option will generate a UUID and write it to boot
config, only when the former option is not enabled.

So a new source parameter 'titile' is added in this patch, it defaults
to 'boot' to be consistent with the original title.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 0eb86a0..83a7e18 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -77,12 +77,13 @@ class BootimgEFIPlugin(SourcePlugin):
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
             bootloader = creator.ks.bootloader
+            title = source_params.get('title')
 
             grubefi_conf = ""
             grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
             grubefi_conf += "default=boot\n"
             grubefi_conf += "timeout=%s\n" % bootloader.timeout
-            grubefi_conf += "menuentry 'boot'{\n"
+            grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
 
             kernel = "/bzImage"
 
@@ -152,9 +153,10 @@ class BootimgEFIPlugin(SourcePlugin):
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
             kernel = "/bzImage"
+            title = source_params.get('title')
 
             boot_conf = ""
-            boot_conf += "title boot\n"
+            boot_conf += "title %s\n" % (title if title else "boot")
             boot_conf += "linux %s\n" % kernel
             boot_conf += "options LABEL=Boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
-- 
2.7.4


