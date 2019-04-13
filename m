Return-Path: <mike@foundries.io>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD7E7DC70
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 04:56:48 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w25so6067392pfi.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qhwATc2bbfhWGeYHUCephWKrqfZTWIoZITxkwxfaExw=;
	b=NXpI0G+FSQxsZNMulmGHtyUCAnP/KrSF5F0da9S1j6yO/Ee9pL73rbyB6tH7KigmJl
	RXAuw6Xwx+GUqTsLGZHXOKZ0+e+2KQU/Xzug0lqbPiuqLEC0WAWkfQvc2jkMAWqS6jUr
	KcrNryMOpoloieutNmjuu448tgeMfsmiotlcUEr1eUZrDG8CSYHdgy8XBAMVVCGmZTp5
	2IA0RkxB+luos4WqWzSLTJUf6ou/6WQuVJG67UfcgqZouxWnyJDMwOcsRFsv3Z6/oadb
	2JQD6baedUtmn7wJdCncshWBso3Qc+huNB8cwCfKW7w+LuTriDviPVAnpvun1ANFKJnQ
	Yn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qhwATc2bbfhWGeYHUCephWKrqfZTWIoZITxkwxfaExw=;
	b=OIxdKQ2Qst+wF3SYiUIMS42NUIvXCv7vru9fZm+k/yFbX7ra7Bqf0ThITjxIEjO6Zw
	ZQL5PpuvUBRkaK8KaiCnTE6QIYhVqkqaJOcKjrBP6JR0v+uDZI8XdNMG9X4MNwh9/Gsw
	/5VxGBPfi2UEawqS0qFgORtXCSgztIAUV6+tEoVvvigQNOb08Hb06gtrmLotT4lo7E5I
	YZi2OgbA2dhXfSu5aw6ClSJbGBIJTw8u/bieD2Wauia3Ye41ky6wVjTSZrMlBn4SOhpM
	Bp3dupq4KeAPSogw6hUwfjXQ2eIxPKh5valm0bGyUkxoe3sqzvi9XiKzM1PzCfvEFFLm
	7R9Q==
X-Gm-Message-State: APjAAAX5dD0Bja2fN10aSAIjx65BpGCUEW1Nq1WvRzJkN6Cu6Do2ofmW
	6oyegQTb9NaBDjU3M4IETSUxpfdTQh8=
X-Google-Smtp-Source: APXvYqxmJM3pAkixiZbR6UJPjt5axcJ57wU9QNDfqGJ6QtfDLwensGzHxh2ptLFHk1BqHY1GzT6zoQ==
X-Received: by 2002:a62:19c3:: with SMTP id 186mr62309150pfz.172.1555131409560;
	Fri, 12 Apr 2019 21:56:49 -0700 (PDT)
Received: from scottml-arch.gateway.innflux.com ([207.183.242.50])
	by smtp.googlemail.com with ESMTPSA id
	o67sm101341916pga.55.2019.04.12.21.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 21:56:48 -0700 (PDT)
From: Michael Scott <mike@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 21:56:41 -0700
Message-Id: <20190413045641.3659-1-mike@foundries.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Sat, 13 Apr 2019 04:56:48 -0000
Content-Transfer-Encoding: 8bit

Support RISC-V kernel image, using the "Image" target.

This change allows RISC-V support for fitImage via the following
flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
with ramdisk and dtb).

This was tested using QEMU RISC-V 64-bit.

Signed-off-by: Michael Scott <mike@foundries.io>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2517d75746..09abedff8e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -8,7 +8,7 @@ python __anonymous () {
         d.setVar("DEPENDS", depends)
 
         uarch = d.getVar("UBOOT_ARCH")
-        if uarch == "arm64":
+        if uarch == "arm64" or uarch == "riscv":
             replacementtype = "Image"
         elif uarch == "mips":
             replacementtype = "vmlinuz.bin"
-- 
2.21.0


