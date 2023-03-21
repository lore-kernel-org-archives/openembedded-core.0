Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C918FC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:00:38 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.23018.1679425235273957120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 12:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=vA7vZUrM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id t13so10521899qvn.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1679425234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhc85nhswf45LB7/26Yhm4Yp58/zjGEfAHRqTgJ4inc=;
        b=vA7vZUrMVlAwwxbD4OlHUbNvunmQE47uETNwS6Z0rMIK7MxaLLf8Vi/giN77g9gZBS
         uZhWQOoL3QBvtcfr8JYOOsINsPR9dpFG3flDfFzODZWdnxGfvIkoEMmv7gEvIOKX/nZ8
         PhJxJIkXSggrIpd33OZ84vHP9fuBcuzmwuuekGFY6wtO++ONYviWWST3VJypsWObuomW
         i2PhfqVv7ovkhRNsvQgtb9dDfbCxveY4d8iu2oKhGfPce+gWVdaHuR32OaclLHCeYuGu
         X9iWXV3y+M8lRB5AK9h/decuYftAY7G4R5rgAdvoKntOC2Naw/Moy4Pez7Wf788CM3KA
         g+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hhc85nhswf45LB7/26Yhm4Yp58/zjGEfAHRqTgJ4inc=;
        b=6hg/NJ1H1212vmdvQ2TrCF1XXGvbnSeToZqp+nic74q6goela04zIYZ5V9VdwrNkLj
         pNb71HBiDyAwFfrzQVybinLArDTy7LiNe20gIOCjzcHZUgdMZ1sDc2DU7aHNBSqYO2Z8
         P0NipOcKYQT55TgzhGPVoo+KaMuOE6GKf1nc+ZudesuVOzB5V0qFWSmjV1lQ6JjQlzqg
         3mTF6ayGvkv0m46Sbf5AbKwkn3nglKlfYDmOlBD/VgHfA+Kj8yKrimY4hHcs7C1ABG+A
         TKP5kJOGeFumTuYd31gqMHJjAUrsrFhLApMkitaxuCWlclZwlw/Wr+XllwYknIKPtO6V
         uYEw==
X-Gm-Message-State: AO0yUKXLTNbNOEmUIWPW1BOOUdb2B2EDVLOhCIFgcE/RZPm+opvqMXgg
	7DjwKSJ+KczCzbGmT6LT0ir2xYsZlpSjAHn+Z0k=
X-Google-Smtp-Source: AK7set+F+8eqgHjoVubuM6KEuu/td3RsgRNeNiWyUNx3DBRGsq/ehOjrUVpZNmqtv14jFxWPF8p3/A==
X-Received: by 2002:a05:6214:5299:b0:5b4:89b4:1af8 with SMTP id kj25-20020a056214529900b005b489b41af8mr1312584qvb.16.1679425233895;
        Tue, 21 Mar 2023 12:00:33 -0700 (PDT)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id i7-20020a378607000000b007422eee8058sm9947641qkd.125.2023.03.21.12.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:00:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH] libunwind: work around arm printf issue
Date: Tue, 21 Mar 2023 15:00:32 -0400
Message-Id: <20230321190032.908584-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 19:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178897

When building for Arm, the following error is seen:
| ../../libunwind-1.6.2/src/arm/Gtrace.c:529:7: error: call to undeclared library function 'printf' with type 'int (const char *, ...)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
|       printf("XXX1\n");

Since every other reference to printf either has BSD or !linux then, I
think it's safe to assume this is not valid and a BSD ifdef can be
placed around this code.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../0007-Remove-undefined-printf.patch        | 32 +++++++++++++++++++
 .../libunwind/libunwind_1.6.2.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0007-Remove-undefined-printf.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0007-Remove-undefined-printf.patch b/meta/recipes-support/libunwind/libunwind/0007-Remove-undefined-printf.patch
new file mode 100644
index 000000000000..1826d8d72405
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0007-Remove-undefined-printf.patch
@@ -0,0 +1,32 @@
+From ed4777e3200aadacfaf2b48e1cd6dec9da37c737 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Tue, 21 Mar 2023 15:14:10 +0000
+Subject: [PATCH] Remove undefined printf
+
+Seeing the following error when building with clang for Linux on Arm
+| ../../libunwind-1.6.2/src/arm/Gtrace.c:529:7: error: call to undeclared library function 'printf' with type 'int (const char *, ...)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+|       printf("XXX1\n");
+
+Based on other printf's in libunwind, this appears to not be used on
+Linux (and appears to only be used for BSD).  So, add an ifdef around
+this chunk to only be defined for BSD
+
+Upstream-Status: Pending
+---
+ src/arm/Gtrace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/arm/Gtrace.c b/src/arm/Gtrace.c
+index 51fc281..fb73d87 100644
+--- a/src/arm/Gtrace.c
++++ b/src/arm/Gtrace.c
+@@ -526,7 +526,9 @@ tdep_trace (unw_cursor_t *cursor, void **buffer, int *size)
+       break;
+ 
+     case UNW_ARM_FRAME_SYSCALL:
++#if defined(__FreeBSD__)
+       printf("XXX1\n");
++#endif
+       break;
+ 
+     default:
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
index 716be9a452f4..74d7874f50bb 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -5,6 +5,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
            file://0004-Fix-build-on-mips-musl.patch \
            file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            file://0006-Fix-for-X32.patch \
+           file://0007-Remove-undefined-printf.patch \
            "
 SRC_URI:append:libc-musl = " file://musl-header-conflict.patch"
 
-- 
2.30.2


