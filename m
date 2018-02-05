Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF2371CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:46:58 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c2so40904955qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QGTrlbz24yadfkbESg2EnjjcRe+IFRhCMGSm0h26VHc=;
	b=cdyNrKvKvfgUoyiHakXtx1exR7QJOQdI51YORxqhvzaWqWXPqCJYRIVg652J7utdtQ
	1LTzw/RqvOOvwd7rLbnavzuuS0xiJLD6hcWKHYy1/EAWCKIKuvohqBFc3WEnuAV0YvYi
	bGn+53yPXF2zQAf4sWdinI9vD9vRYpR0zSDzGpgHaUdE1U/AldzNQBSqiAx1tlpptqyu
	iWBp3xsQ4vFSB+Dx98eQgO695O+bb+/3mQ7qsiu8cWrXyK6BPpLac7Vy23Ngp+kyIPjQ
	0hWm9Uw5yBGFv9/1zTKivSmd56INyxl+oggC+fWSy2OgNsKkE/fteaGT0BtYyBnD/n5I
	Dd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QGTrlbz24yadfkbESg2EnjjcRe+IFRhCMGSm0h26VHc=;
	b=aI12Gzlnv0mknKjOX44vrBATeh8E3MyxSLbJXqe97CHb5qy3gjle+xMYb6HxF39yFE
	QRzB0076VOy1BD6gUKKFP3W1WF4cwHq/PLJDts7Sr1VdjqpTQoAccXiXuNsi3mpJqFKR
	DOjzYzzTJpRj/fWsMKALVz3Gf+ix/2ds2zygWzMClYTxJU8OsP7zrsh49ODRoQRVsEEW
	z2ME9Q+vogFDuyLdh4YPbbo5E90y2intkuZs0p6nUU5gdQuhRmXCgvJodEgPWlOH4tGW
	lOmyVhiENUNw45ejlqKfyfK2O8pCaQieRH+JBpNv5I/DUFq3e+99ycMiExQgAE0nH92F
	HJDQ==
X-Gm-Message-State: APf1xPA5KsJWBEfSz9CDXXBSOonDhzBV1J9yJLAl/lEu5COoj0tiaesn
	iaW79sWqbXL3yVEHTC6cLZCkqSuH7g==
X-Google-Smtp-Source: AH8x225lyvbRQi5HbAIjxxMOQ6jWreqKKHRamaVUJuwqodx31+VT4vcSaHVpObx2FXaabqCWVJnwoQ==
X-Received: by 10.200.52.207 with SMTP id x15mr20127602qtb.267.1517856418911; 
	Mon, 05 Feb 2018 10:46:58 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id
	t123sm5709045qkh.60.2018.02.05.10.46.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Feb 2018 10:46:58 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 16:20:44 -0200
Message-Id: <1517854844-14634-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] grub-efi: allow default config to be customized by the distro
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
X-List-Received-Date: Mon, 05 Feb 2018 18:46:58 -0000

The default grub config produced by grub-efi can't be easily customized
by the distro (without replacing the standard cfg file), so create an
extra variable GRUB_CFG to allow customizing the config file that is
consumed by grub-mkimage.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index a72b189..6530d92 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -53,13 +53,14 @@ do_install_class-target() {
         {} +
 }
 
+GRUB_CFG ?= "cfg"
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 search loadenv test"
 
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+	grub-mkimage -c ../${GRUB_CFG} -p /EFI/BOOT -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               ${GRUB_BUILDIN}
 	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
-- 
2.7.4


