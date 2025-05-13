Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99193C3ABCB
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 03:33:49 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.68318.1747107220187420949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 20:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=ejvOeCCZ;
 spf=pass (domain: underview.tech, ip: 209.85.219.53, mailfrom: vince@underview.tech)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f5373067b3so75390176d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 20:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1747107219; x=1747712019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UcchmSYoDJWjdgtSdgmDjm/ASpALbXvuQueEoz6Ncqo=;
        b=ejvOeCCZjUhSFk6dirHXeLFopCGcx7pqFqMfmdj2EMOSu2lT7Pfuqa0QXEZgT24hYs
         BEYC6TvatN6edsYA9o9lziJrDriYDyB6KRVpW4l2hbLTfgjX8CjO9Pwmnob01ZPaO2Hy
         oXDe+6fbsdXrC6k6lZCB2T8urlhhuNdPwU8q2wG1Y/iXsSvRSQ5ERFb0Zo5rPnE78IZX
         OTO6iFkKdoTC+2AGxBvAz935w2mheXWkSkeZ44IMx/BAGQsjNXJVJ81zx4kxyzec2EYw
         k0YmlVyAgVvXh1z2Qt38oj5TJSUeUtRi7uPncBfgyl2u58amUx1hD1ZCTACFwm727RwL
         kXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747107219; x=1747712019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcchmSYoDJWjdgtSdgmDjm/ASpALbXvuQueEoz6Ncqo=;
        b=u+N23camADWaphvR+r+QRJgi+0wMUTGdAAngdsJ9ucjb4G5bLjy1s7bM8HW1v/zD/j
         S3cDdlkPc86DyOXxZ9zFWJevNp56iu5O9PgbKmoNagpcfaiUAW9xsrmBX94NjxYqJGpg
         joO4piXmN5oiOn9cT7cl61eDksCLpvBnXfU5XkqMBYbWsO5ax0H5pv1sVcQTYEkDwl8h
         iWGAKIDwN/NMeOW1xdP7cJnFrOPssUMzFXJsMxR+hq6FvOV+UFE9Zu0zFy2Z4mtkriYq
         TCrjbr5zj4PqGAOEBSf7NU/vKTK1pHSTLMFZrp3viplSex2ZLiR93pylt8h/tzQWENWH
         biQA==
X-Gm-Message-State: AOJu0YxcR3SCLCaVd9zcbqlQyfr6E2ynQZiV7e46Xnkf1lNTZ1E/9Cjf
	wkAK1z55rXXdrX44+BbJKxEeRA1XfYc6obnVJ/9+z/FnaAV2n2bfu556IFgUoYKvV7QOCZyu8kf
	W
X-Gm-Gg: ASbGncsvfI/L9d3/Tx5Qha98MG++x2CNcUtPkBoi9JEFN7n7pF29cCZoJuGZ6j30qyv
	IGkmwS4lnPCLn+5ryZuAvli6xhLV5BVIEbneG0YU7ygVD0zzF1i5Nrrr7NDdgmHxvWcAF975GAi
	23M1eGmGm5w5/sLFnXoExx1ZeTWWlLLFt1FKt0ivN5umQV7uVNveTgR3adOs5VCFHyArh68t4zu
	nB3AhQSbcu38rjNi7qMt+epNDq61xPPZKbxuf0as2zeff4azhVawU4UPUxf1LNWOWIgvHpvTQP3
	pbDGIb2QlrjPcc9Gl6gjm0CmJNbDMp3LPYsowyIZ
X-Google-Smtp-Source: AGHT+IE9qQ1o/X9YVUwwUX5CixJVPbbApK6LE1h9YVXYeE5pnsAOJHFE4wODbDR2IGPO+BiqxpQrRw==
X-Received: by 2002:ad4:5d69:0:b0:6f5:4d7e:9687 with SMTP id 6a1803df08f44-6f6e47cb90dmr269059646d6.27.1747107218809;
        Mon, 12 May 2025 20:33:38 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::abf4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6eb98e5f8sm44168066d6.45.2025.05.12.20.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:33:38 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] linux-yocto: build out-of-tree drivers with SDK
Date: Mon, 12 May 2025 23:32:29 -0400
Message-ID: <20250513033228.125360-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216390

Attached patches enables the compilation
of out-of-tree drivers whilst utilizing
the Yocto built SDK.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 ...-add-KCFLAGS-to-build-with-Yocto-SDK.patch | 63 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  4 ++
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch

diff --git a/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch
new file mode 100644
index 0000000000..b556f25daf
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch
@@ -0,0 +1,63 @@
+From e48021f480428b5e34d299261029bfafdf0e3a2f Mon Sep 17 00:00:00 2001
+From: Vincent Davis Jr <vince@underview.tech>
+Date: Sun, 11 May 2025 19:57:46 -0400
+Subject: [PATCH] Makefile: add KCFLAGS to build with Yocto SDK
+
+When running
+
+make -C \
+"${SDKTARGETSYSROOT}/lib/modules/<kernel version>/build" \
+modules_prepare
+
+Issues that are encountered include
+
+make -f ./Makefile syncconfig
+make -f ./scripts/Makefile.build obj=scripts/basic
+   92 | #include <sys/types.h>
+      |          ^~~~~~~~~~~~~
+compilation terminated.
+
+ld: cannot find Scrt1.o: No such file or directory
+ld: cannot find crti.o: No such file or directory
+ld: cannot find crtbeginS.o: No such file or directory
+ld: cannot find -lgcc: No such file or directory
+ld: cannot find -lgcc_s: No such file or directory
+ld: cannot find -lc: No such file or directory
+ld: cannot find -lgcc: No such file or directory
+ld: cannot find -lgcc_s: No such file or directory
+ld: cannot find crtendS.o: No such file or directory
+ld: cannot find crtn.o: No such file or directory
+
+Solved by setting KCFLAGS as the yocto project SDK
+KCFLAGS is set to --sysroot="${SDKTARGETSYSROOT}".
+
+Signed-off-by: Vincent Davis Jr <vince@underview.tech>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 64c514f4bc19..bbe7b0503841 100644
+--- a/Makefile
++++ b/Makefile
+@@ -459,7 +459,7 @@ HOSTRUSTC = rustc
+ HOSTPKG_CONFIG	= pkg-config
+ 
+ KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
+-			 -O2 -fomit-frame-pointer -std=gnu11
++			 -O2 -fomit-frame-pointer -std=gnu11 $(KCFLAGS)
+ KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
+ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
+ 
+@@ -491,7 +491,7 @@ KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS) \
+ 		       -I $(srctree)/scripts/include
+ KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
+ 			-Zallow-features= $(HOSTRUSTFLAGS)
+-KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
++KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS) $(KCFLAGS)
+ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
+ KBUILD_PROCMACROLDFLAGS := $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLAGS))
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 389329030d..5f45ab2bc4 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -37,6 +37,10 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
+# Appears to be the only way to build out-of-tree
+# kernel drivers with the yocto project SDK.
+SRC_URI += "file://0001-Makefile-add-KCFLAGS-to-build-with-Yocto-SDK.patch"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.43.0


