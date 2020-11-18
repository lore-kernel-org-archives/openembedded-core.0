Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.30831.1605730913814441909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 12:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=lxp3yGzl;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B28C62145D;
	Wed, 18 Nov 2020 20:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605730913;
	bh=sFmT4puedC29I0lIPqF0GCLFAKorD3674FEo2wb0yQI=;
	h=From:To:Cc:Subject:Date:From;
	b=lxp3yGzlqzhU9IRqVQhaHfixypbrAhOe9Je9udasDcHCRfzg5rIkXQlymN6z7KKve
	 pGOstHACJUS+BFqwUkmoOnJF//3F03egJR58TBhqefPEcOZniLIq3P8vj/92Jb3och
	 KHbDeHdV3OBwX3fNcoK66/MeLUkFWGXOQR2hfmi4=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH RESEND] kernel-uboot: allow compression option to be configurable
Date: Wed, 18 Nov 2020 20:21:46 +0000
Message-Id: <20201118202146.25315-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

While some platforms might choose to compress the kernel by
default especially when boot medium is slow, others want
uncompressed kernel.

The choice of decompression speed vs. load speed is very
platform dependent.

Allow platform to choose the option here.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta/classes/kernel-uboot.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 87f02654fa5..b1e7ac05c23 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,3 +1,7 @@
+# fitImage kernel compression algorithm
+FIT_KERNEL_COMP_ALG ?= "gzip"
+FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
+
 uboot_prep_kimage() {
 	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
@@ -11,8 +15,8 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
-		linux_suffix=".gz"
-		linux_comp="gzip"
+		linux_suffix="${FIT_KERNEL_COMP_ALG_EXTENSION}"
+		linux_comp="${FIT_KERNEL_COMP_ALG}"
 	fi
 
 	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
-- 
2.17.1

