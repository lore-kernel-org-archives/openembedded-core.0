Return-Path: <mike@foundries.io>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABC337D716
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 05:46:30 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bf11so4524518plb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 22:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7//U3XPBvJO0M+q9czA4TBkTkPAqbX5KouG4LrfiUHY=;
	b=ooCW8UmtSeAnMQjM9V6UVaU5dSQYeVUHO7mCd/bjLBOqtAET/6JzCwQCv2ym01Ekve
	62cgP7MI414dL1X6/1jz3YB5ye8U91vGRXEzCi4MPADoJfiY2flbq6PNbkPzCHMq7tcL
	O3+L/M78Ah3pPmqS5roJqVP3dxhHQSfFL/RNNN+hFIYhlwBQkbrTS9G511GCdmpJsJhG
	ls6oq+XhzQGzdzPVoHq7WPQS3pbe9c/wOlF0au5fqyqGG9r/KavjFjBNbNE/0B0NndOs
	iioKPzdwXsahJImS+7Jky5tbDxHzomtBnw/6hZ5v6OKiUlP5IQNIqvM1H3BjmrjSsNd2
	EiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7//U3XPBvJO0M+q9czA4TBkTkPAqbX5KouG4LrfiUHY=;
	b=t4XVNWr4FSRfpBg9rgvTDheuGD7plUmq2AfcbKLe+Lgmxsu4+NsqZE1adusg/Umj+r
	EUB/Ae0i+zgOXllfyD7MHMVtH2ByYnQEGzOETuKg0YUogfuuNeG0t1+Kt7mMLmTROxXU
	Xc44nNOYmFwxjM4SIjsuJtN3Dx44buJi1CZVBXHnH19mqm9L3Xn5be8dooLB2pXyl0Kb
	bkf1S7rnQo8oDDkVcupaC1mbuB74HNsYWKv2m5f6HdQbU1tv3btunUlIsRlq+njFWQdN
	RzlbrKKeFs5iw9NliijyrwP5g08P/BYxs5tKt0OD+ycOAdoPIxwmPpQbwI7J4E4j3Uz/
	SmJQ==
X-Gm-Message-State: APjAAAVRpQbR7a2fIaN/t5MFPARRhqWU9Y+5URYa496GL3OCwFT49h+S
	+NA/Oq8zaHVh8KQwiOCGtchyrRYrs9M=
X-Google-Smtp-Source: APXvYqxhyv/fw9G+F0g9N7+yuJy+qX7JNC0mzM6YFAqH8dJhmLsuKr1/LlU1cCXwB6VLmRjorpDAxw==
X-Received: by 2002:a17:902:2c83:: with SMTP id
	n3mr53163290plb.281.1555047991369; 
	Thu, 11 Apr 2019 22:46:31 -0700 (PDT)
Received: from scottml-arch.lan (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8]) by smtp.googlemail.com with ESMTPSA id
	k1sm43334662pfc.83.2019.04.11.22.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 22:46:30 -0700 (PDT)
From: Michael Scott <mike@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 22:46:25 -0700
Message-Id: <20190412054625.9447-1-mike@foundries.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Fri, 12 Apr 2019 05:46:30 -0000
Content-Transfer-Encoding: 8bit

Support RISC-V kernel image, using the "Image" target.

This change allows RISC-V support for fitImage via the following
flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
with ramdisk and dtb).

This was tested using QEMU RISC-V 64-bit.

Signed-off-by: Michael Scott <mike@foundries.io>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2517d75746..2820ff9689 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,6 +10,8 @@ python __anonymous () {
         uarch = d.getVar("UBOOT_ARCH")
         if uarch == "arm64":
             replacementtype = "Image"
+        elif uarch == "riscv":
+            replacementtype = "Image"
         elif uarch == "mips":
             replacementtype = "vmlinuz.bin"
         elif uarch == "x86":
-- 
2.21.0


