Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B196CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 08:51:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15108.1781772698444355002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 01:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=INqaKLi6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cdae130cso3201295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781772697; x=1782377497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/8GGjvkMf2y/BUaqQj3+I7w0vBUoifcJPTexMLNJFA=;
        b=INqaKLi6FS/q5szyOtpvB4QVsEDXYGsMBtafxK1CXyc0cN71/YsnVtQHohfnPUH/mp
         jh0c+KCMKdqxAEZv0OWkaipOhBKx37TMCVtNjoAKT1f7M+kCgctTW2ws2Sl1BmnEYNm+
         +9S0BeTFVGyWSzeD1xPWm2TsKhD1Hnt+k8ZI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772697; x=1782377497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/8GGjvkMf2y/BUaqQj3+I7w0vBUoifcJPTexMLNJFA=;
        b=so2dyC5B5UXleLRgZqdkEi3jZlaPm+PsXA1UhNU3ge+VBMI4o4nMmOzrb/ocxyC1Sy
         CRflfNK0uiVnOwet0LlxbJwAgs7Okz0iJXhySDbUhVLvCp6+vEXScDtUnM12/LMjqmkt
         KxRSeTpEap+IZrxNK/QKRV2OmyZcHuu2zO/lmWMWqX4cQf9Sqsv9vLU9J2hZR1at8DjK
         b8CaXe3BiXBsOUW6VQ/GwIF6JfIyGaXBnZnm0g/OW10jTQAviZNsDj5Ydwhk+RXxGZSm
         GqqGdYQTwzwq9uHkkVr9agNSAkXZr8HKvXmgIWoTO/wqWzSPpROTggeEIvUdXxc/gNRW
         6M6Q==
X-Gm-Message-State: AOJu0YyXvQ9PK9EEfE9egBeo8jk4sr3iq8FRxTcYir/aGVf2gI9cMov/
	e4K8ipPi5x4Wcbw0UOTitA6TEUwcAkarUMHlI8KzIvC2taHbEpUyo6eU6+YjkWcOPQmOwZ/gv6g
	UR1hj
X-Gm-Gg: Acq92OGp7rJMFI49LbqEIFya6vX5zI6Sy/pZ2vG00uTQbua2wtjqiqKFCJvkGocSWs3
	+B3/LtBw6iWBnhO0BKq50Y9Ng5Lb5NefH8/inWL2iwZtwtQUGOHageuVEX0PSy6rceOZZ64ZKk2
	foyN8FfZF69k10Yf/e0HLZkQs2rXnSdw5vYDwuyQHXzK+naOR+qd2xKEpPqukgreg5KB7pUxiN0
	93g9QgsL8tPLn2e3UfTkoOBwcUAxlUPDr0yY8E5bi98DoUAqTU6/a3DMr8hUBooXl2JQYARXB5L
	WMLGWTZKH1ELc1IEE5Yr9/h+shHAmKnJS49mu8uTpFUfbVqibXD/rae2oo3MhFQLazgjejdi3Uw
	l0zyjCKDE7/kaHiGBeY2aUxX6jA1Yqp0DGd9ompBfY1gW994t9zIZDZ0a95e+sqbhsZSoOddct+
	RSXZ4XLPWAIUUZH31JaQvX2CkZIV0qAJvWuAlNxqq6/A==
X-Received: by 2002:a05:600c:4f53:b0:492:37b7:6090 with SMTP id 5b1f17b1804b1-492381e4ae2mr45330915e9.5.1781772696484;
        Thu, 18 Jun 2026 01:51:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:70bd:e97f:6372:90f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm227634535e9.11.2026.06.18.01.51.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:51:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] README.qemu: Update to match current architecture support
Date: Thu, 18 Jun 2026 09:51:32 +0100
Message-ID: <20260618085133.3756278-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 08:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239068

The README is out of date, update to add qemuriscv64 and lower
the importance of powerpc/mips.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README.qemu.md | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/README.qemu.md b/README.qemu.md
index cff0f079145..bdd44082882 100644
--- a/README.qemu.md
+++ b/README.qemu.md
@@ -2,14 +2,18 @@ QEMU Emulation Targets
 ======================
 
 To simplify development, the build system supports building images to
-work with the QEMU emulator in system emulation mode. Several architectures
-are currently supported in 32 and 64 bit variants:
+work with the QEMU emulator in system emulation mode. Our support and testing
+is currently focused around the following primary architectures and machine
+targets:
 
 * ARM (qemuarm + qemuarm64)
 * x86 (qemux86 + qemux86-64)
-* PowerPC (qemuppc only)
-* MIPS (qemumips + qemumips64)
+* RISC-V (qemuriscv64)
 
 Use of the QEMU images is covered in the Yocto Project Reference Manual.
 The appropriate MACHINE variable value corresponding to the target is given
 in brackets.
+
+OpenEmbedded does also have support for PowerPC (qemuppc/qemuppc64), MIPS
+(qemumips + qemumips64), qemuriscv32 and other less common targets but these
+are not as widely tested.

