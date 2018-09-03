Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1F90E79164
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 00:38:28 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a20-v6so10125919edd.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 17:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=e0MQrqUjIzT3HVUvWlv2qmbuYyntVGYQ5b1E9/hOHqU=;
	b=RG24/nHcPZ2QGAvspci7A1AMPRPaeY+G0I6IqtpzwLaBOPEyFxzql4K4ercHX0MvtP
	wfdxFAWp0CFHjLo8fGoJO/FtkGuALF11sx9JtFyhiuPqxFPfhuhsGNLIzdhJJpSkCm/G
	N8drz0TXY156ZouxFzXuRbYt4LijfQl9DImm499iaY4aIC5Pbjbr3lzy1evik/iqUb7Z
	4ossykk9YYNRqu3IQNjEoqfXM4TtRZ8iu7wEW/DfGXkBKew2rP9AgF52HESTyvX/Tue7
	ta+iqcIzJ8Eu/DYSG781utsOSUsGHDvVw1ZUS5LEVN0TZW0B2a3yWgy4H3YoT5fw6Hs/
	9LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e0MQrqUjIzT3HVUvWlv2qmbuYyntVGYQ5b1E9/hOHqU=;
	b=V82i95Jmj31s38GXPc3ypY/Gq8rYvZzA4PeBUXZtf2hVC+A9iLtvIEQDJKo5DINEDa
	wuXwCCzPbFxJxiFv2K9xehO1MZwhZysCeWsU5qkfBcbfm15lHbMMKsXOfjSfhSTUv2zS
	G+BZ/vURu7LZxJ3anpCV6cm4hCdyrQQvNAESVsYNsWiJ4fbvfbaNmBCj/yqPRfIRp8d4
	TQzFHiKtCef4KrMFVxzdn8cnGfGmrvS4CqoaEBnUW5hzdZv91qs+XvB/b3BUOtq5PU5X
	9cPRwjK/4OOT0DmONdMkyBYQ6MJMMRB19a7fdYGzUMN4DWNUg1+fLq9A7cSB/oFfap2r
	WmMw==
X-Gm-Message-State: APzg51DAXn9xt5kEE6Nuv9os7ExSvBgWdZwr7Fe8XmXfWqJdrr4iftIC
	CeYR1qZd7H0w4OiSH2Ee+yeGttaCmBH/EQ==
X-Google-Smtp-Source: ANB0VdalRn0cxAia9BCx1b2Nt7pJ0b/YnmSMx4s4aPdq/05kZEf591+7+dJ4PIxWmljYVKuwPPVNng==
X-Received: by 2002:aa7:d416:: with SMTP id
	z22-v6mr29685825edq.258.1535935108614; 
	Sun, 02 Sep 2018 17:38:28 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	e15-v6sm8516561edb.60.2018.09.02.17.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 17:38:28 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2018 02:38:22 +0200
Message-Id: <1535935102-30843-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Subject: [openembedded-core][PATCH] kernel-fitimage.bbclass: Wrong binary was deployed for kernel-only FIT image.
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
X-List-Received-Date: Mon, 03 Sep 2018 00:38:28 -0000

The kernel-fitimage.bbclass always outputs one FIT image without initramfs.
This variant did deploy the kernel image itself rather than the FIT image.

(The FIT with initramfs was correctly deployed.)

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e1..16499c8 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -463,7 +463,7 @@ kernel_do_deploy_append() {
 		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
 		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
 		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
-		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
+		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${linux_bin_base_name}.bin
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-- 
2.7.4


