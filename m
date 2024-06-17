Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AD0C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:06:05 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.55034.1718625955461633589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x7VoYW3S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-704189f1225so3786638b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625955; x=1719230755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUHKlR9OBAEZac3eEHxEkPPo6sg56cFOXjIWYs4lhNg=;
        b=x7VoYW3SPad5ZNXxey39gGJShONYy1o/0IHR7VwfARaJAWooCQREMkCDVq+Vzqyjl9
         6W0FiXYr6A8zcQXJYiddoiuv3BFvDtxZS/K8vrHoZ4lZ18nFALyZwzloYMIY2pYWtqHK
         JXWv+iwGG73m8IZeWi7pAh0sR8PEgnWzMqUxD4pNU+FEdkT6lLwZAjdMBSHczHZXpDUl
         vViB7WcvKevrNfw+bE1dsN/9FU84P4DKKKs3Yd9dazY1+NCbXBwf/hogw8bokBL02dAI
         T+bktOqmA0bWk4ehFLsFCiQuoB+IqPe1yIaY4e8HT21kfBzNRicATRieS3NZHZq+LT60
         U/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625955; x=1719230755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUHKlR9OBAEZac3eEHxEkPPo6sg56cFOXjIWYs4lhNg=;
        b=B1Is33ULyhTbHaRGxxBrHp7jtJZ/viuBsXBwPEBam12tAwidtMtnTnBgIS4hUf73ta
         l6vZV+/0rTMW7NJ+VTOvvccaBI0AAzyovaac24uMCzsB8hi8PET6UE5spL6LgIx1oT1J
         1a5TG9kUoF1FPOKWzVb4h9vQWe2cdbUnYofn3iDuM65Ohs+Yhdq+YPXJgxKGGGVA5ZFw
         RYsQQjEMgQHNNnK3kueO9v31ddWlc/3VTemShlCZ1wgBc/eEzTc3JOaIxbLyoEYv+6+c
         3sG2EV9b3ajqRs9k2V4XrUxHan5aqQ2wMnbcQL8jZ5o2VDFngl6kRmF9XFMe0OBIyxdV
         TIVw==
X-Gm-Message-State: AOJu0Yy3PbNPzCAOaHPGo97w4PTnPc2CIGVmzgVgzqqTNzjaJqyNED5z
	0fMQPbDgxPau6fzmtQthOG5ejJYX9fL/Hq3vE25UjD3C5SRHToQ90VJU1vh4QTsXUONTvIm3n0t
	42n0=
X-Google-Smtp-Source: AGHT+IFpiJoCmmIKJvLc9Ne3AJ7dIb7Ex62up9jlpzQ7wnkr5fq0p5Q8XRYD5LWcgwMHHt1lfXsBEQ==
X-Received: by 2002:a05:6a20:5601:b0:1af:fff9:30dd with SMTP id adf61e73a8af0-1bae7ed0428mr8141062637.35.1718625954650;
        Mon, 17 Jun 2024 05:05:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/22] kexec-tools: Fix build with GCC-14 on musl
Date: Mon, 17 Jun 2024 05:04:57 -0700
Message-Id: <30e226d48ae04e387d53fbde1b729569ae35bad5.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200830

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 704f51f72c301bd081a635dbe94e52aa97ffb827)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...linux-setup.c-Use-POSIX-basename-API.patch | 54 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
new file mode 100644
index 0000000000..e223f45998
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
@@ -0,0 +1,54 @@
+From 32c8ffa7ace6f1b7e63f9ddffab00b00c36a7b57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 May 2024 21:18:08 -0700
+Subject: [PATCH] x86-linux-setup.c: Use POSIX basename API
+
+Musl C library only supports POSIX basename function. while glibc has
+both GNU extention as well as POSIX basename implemented. Switch to
+using posix version, so it can work across musl and glibc
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18/GCC-14 flags the absense of prototype as error.
+therefore include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2024-May/030034.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/arch/i386/x86-linux-setup.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
+index 9a281dc..73251b9 100644
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -14,6 +14,7 @@
+  *
+  */
+ #define _GNU_SOURCE
++#include <libgen.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -329,12 +330,14 @@ static int add_edd_entry(struct x86_linux_param_header *real_mode,
+ 	memset(edd_info, 0, sizeof(struct edd_info));
+ 
+ 	/* extract the device number */
+-	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
++	char* sysfs_name_copy = strdup(sysfs_name);
++	if (sscanf(basename(sysfs_name_copy), "int13_dev%hhx", &devnum) != 1) {
+ 		fprintf(stderr, "Invalid format of int13_dev dir "
+-				"entry: %s\n", basename(sysfs_name));
++				"entry: %s\n", basename(sysfs_name_copy));
++		free(sysfs_name_copy);
+ 		return -1;
+ 	}
+-
++	free(sysfs_name_copy);
+ 	/* if there's a MBR signature, then add it */
+ 	if (file_scanf(sysfs_name, "mbr_signature", "0x%x", &mbr_sig) == 1) {
+ 		real_mode->edd_mbr_sig_buffer[*current_mbr] = mbr_sig;
+-- 
+2.45.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index dec821ea88..f0a484f884 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://Fix-building-on-x86_64-with-binutils-2.41.patch \
+           file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
            "
 
 SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
-- 
2.34.1


