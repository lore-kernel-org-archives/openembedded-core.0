Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3F26E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:55:17 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o44so807999wrf.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/m/Gm8SSg4viIN78PhdnglwLgt1WvbEXo0znlnf1NXE=;
	b=U8PoFPwkLRSerFpMzDKWAwC2nAQmByhX8x0xz0B7yLm1HKzD7EY/QBjcbciSobdkfD
	WkoFkyrNn0TNAcGS/aJBuEpztGXVb2LmFAhZyrdDnXX0lBxRVewt5lrML4dYWSFwdMn/
	ubjcz1sMv+ypgjYB0/Ii+fBzaXX83R+zYxAYFoIXdC7V1x7+zyyKIPkCGIogRsLan249
	qf6lqKDgEJDX4s6t1POq8fHScuRPhSUP3S0liJPWnoFX+me1LQY90Upgkwr9Qw94Qjqb
	DumQXu2dccxWDncHTJh5CAzABvI3dAV+YViKzSx9pg+u6M8rfMD9KrKtxllCowZv2O18
	ZAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=/m/Gm8SSg4viIN78PhdnglwLgt1WvbEXo0znlnf1NXE=;
	b=YWCFTmpHE/BtURGw2ZzO2Pot3Ym0Fe8XLVRiLDCQDDQaETRwt7LZkjnYsxEmC0Jkj0
	HswBDYWS97TYh/Ewgb5k0uejB1VVgWSIi5e0piiqoOC4IQ3dtGUGi97WD1G0OUKVsxQA
	SQyIdctI7c6uEyQgOL4iSoHlUlEnB7uE5SqNiNzQ/uxpdF335/PtfmWlqmp5bZHDpto4
	g5hVKESHePA46xfjT7WjusNtvWfvAyXpO24lnhXEzQYBa4iHnmgaENg/EWOQAbi2u1DH
	5Fu4nkF4YufIWUvA9jblM7jyIE/IXsZlkupfjk6JYcgeuItObNbzOORYO6SMMMa+0n/b
	vZqQ==
X-Gm-Message-State: AMCzsaV/xtqH9Kx2MWte5hXDCMPrTvTH1rXIk5mNPhbHsxBxsInXHk6d
	+vyHdzcWF5ZhHul1NTuxt1w5i7Nz
X-Google-Smtp-Source: ABhQp+RIaItgKJ/kX0H8hGl45HB4rIj5bsC9Bgiim3+6VTQ26aBS3na403ZLLvwtm77npk3kiKi7Gw==
X-Received: by 10.223.202.10 with SMTP id o10mr3031057wrh.208.1508954117812;
	Wed, 25 Oct 2017 10:55:17 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id v5sm2634923wme.5.2017.10.25.10.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 10:55:16 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 19:55:06 +0200
Message-Id: <20171025175509.32310-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][PATCH 1/4] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 17:55:18 -0000

Bad image type replacement for aarch64

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b6b2..9baf399f2e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,9 +7,12 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "mips":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "arm64":
+            replacementtype = "Image"
+        elif uarch == "mips":
             replacementtype = "vmlinuz.bin"
-        elif d.getVar("UBOOT_ARCH") == "x86":
+        elif uarch == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
-- 
2.13.6


