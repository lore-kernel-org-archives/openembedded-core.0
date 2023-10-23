Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DEEC25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 20:24:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.132028.1698092670002470877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 13:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D8UG4xvD;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-27d0a173e61so2407198a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698092669; x=1698697469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gcAOcJMM/RGQkPLWdh+0LVMqW3Q6vvaADH+hPo3ZR4=;
        b=D8UG4xvDMFtX2Y1B7EBC+tDTLFVtVRWqkFvlHfeuMnNDBi7LNHUEpy5aCvDb+LLAYa
         rNg6w+NEk5XxwuowaStGbL4Wz+IrcNbgXgyAkTLU4aw0CKnSjd8KlaisASI9i/FsfyIu
         eG43TNgyUjsV4t/iTOfl7MLJFkOf1J2T3nHJcjIBDCiXMLFS0omfdQu8pVEwQxrbIyhd
         UYQq+ZKoxQvTdOgEZ5+1KKlhsvQR75jXwWBN1/WSds6sM6FHLeq04ODY3raOqFD851tA
         Cnfw/mzzkUsyweCGbe808a11QRqSuRGLHHkTU7ad6auWZwp5UabMKWvVTZMd/5HB1EGn
         uSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698092669; x=1698697469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gcAOcJMM/RGQkPLWdh+0LVMqW3Q6vvaADH+hPo3ZR4=;
        b=qe54W3g4m69hv2kug/xyE+uhcezgj8hMwFNWfdnMSfVKFWCalnxVNP5KAG8TdsY/GS
         HvD7mgEZOCkZBSDgLMrufIY7irzt9jusaJvAlXjpR9lVzAC5WFo29Frr3YNEBznft2zz
         8cOT1DuA8/araNNwGOmnON9g0hXgxrPkQWVHcABEDUUbhzRZ3sDI5LE5cRK5dViSK8ox
         JdMjo+dE2cCjZ5sr10a2eJkBFkqNy/+y+t6+RhRMGlyfDHmVBiGU+Rt/HEy/B9X/Y/L4
         rpSRpJUcNZHOZvlLUHPtRIRzwOx78p2M50ys+wFoB6V7uCR0egK5jk7EA/Ijfo1BT72u
         CXbA==
X-Gm-Message-State: AOJu0Yy39BlBc/qEyFNSK7/GPE1eoCw5E1BXWoCg4ZEL2RTnkXFySHB5
	ucM7e/TuQqssuHqTGclzyaJ2p/aZpIE=
X-Google-Smtp-Source: AGHT+IEx8Ux/yRgLJ7uDFcZAmW7vLNYX1S3UGKk4x5F//7IkG84+MCufeS3y0H+kbWc0iuBzQ6qj/g==
X-Received: by 2002:a17:90a:66cf:b0:27d:166b:40f6 with SMTP id z15-20020a17090a66cf00b0027d166b40f6mr7766734pjl.41.1698092669034;
        Mon, 23 Oct 2023 13:24:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id x89-20020a17090a6c6200b0027d06ddc06bsm8658108pjj.33.2023.10.23.13.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 13:24:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssl: Inherit riscv32 config from latomic config on linux
Date: Mon, 23 Oct 2023 13:24:24 -0700
Message-ID: <20231023202424.647618-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 20:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189632

We still need this option for riscv32, the patch is also submitted
upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Link-libatomic-on-riscv32.patch      | 35 +++++++++++++++++++
 .../openssl/openssl_3.1.3.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch b/meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch
new file mode 100644
index 00000000000..2c54d8f685a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch
@@ -0,0 +1,35 @@
+From 73266b8573c71e6720453c4c5a9e6e8fa4daec65 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Oct 2023 13:03:52 -0700
+Subject: [PATCH] Link libatomic on riscv32
+
+GCC toolchains on linux are not able to build libcrypto without linking
+to libatomic as it does not have all needed atomics implemented as
+intrinsics
+
+Fixes errors like
+
+| ld: ./libcrypto.so: undefined reference to `__atomic_is_lock_free'
+
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22460]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Configurations/10-main.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
+index 46094f59c2..d1a15a1152 100644
+--- a/Configurations/10-main.conf
++++ b/Configurations/10-main.conf
+@@ -816,7 +816,7 @@ my %targets = (
+     },
+ 
+     "linux32-riscv32" => {
+-        inherit_from     => [ "linux-generic32"],
++        inherit_from     => [ "linux-latomic" ],
+         perlasm_scheme   => "linux32",
+         asm_arch         => 'riscv32',
+     },
+-- 
+2.42.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
index 5432d9dd8c2..e1cbfc2c5b3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://fix_random_labels.patch \
+           file://0001-Link-libatomic-on-riscv32.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.42.0


