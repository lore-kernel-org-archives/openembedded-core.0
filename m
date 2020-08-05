Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.2246.1596649817184693207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lCjaBxTO;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id w19so12709237plq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vQ9eNP8RTsCGYlqJorIBiCDI8KOkzssAbI2r+Ard6bk=;
        b=lCjaBxTOVikPOzeU5Th54ijSQKnCnki7dLMpCtlFbz1N/IaYyvpuF1ahhbrrjZ3Gu7
         vqDCq71orbTyZxfXBtH58IoXKCARaJ3JVbApFUBgUlDqW5gr0SVogp9VeoBmPJb6WbeD
         vjdY51KayYIz8cVR08A0PFunJf8cVyVvGullcLDPkZbvHIC42GlecqrmLemRVO4vYdM1
         gGknCxgp3z0YYQa6Itkj5IBE5l77CFz/+MtDYIRugLnXNMjQ3gSlAWXNdJP684eFl1p5
         NaDaWEdeJWu2c5yz/qYu18u2/NSXD9+TlvpCAvCtahkkE9K8OhP0H+/5n6kYjBQwJr4N
         MB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQ9eNP8RTsCGYlqJorIBiCDI8KOkzssAbI2r+Ard6bk=;
        b=QDSiaEbFXHhV9c+p0ts6sWDf6zGSxtrhWnrOPC7waA0tfY323DhsgO1cLJI0yqzq/J
         uSgruN8TBM2pMZ5R6ytHFUbA4rvvCRj3qHDX+cfs8kzWRCVaUWJ9pbB9c7iH7az8a+KV
         c9aScJnoQ02grFrSAjmCrDjcb8vqpY6Xk2xYISJ6w2CIExPaqBARxHA9LXFpVlvJ8Uiy
         1D2YaiYgA9NU438Y9vknKyHnd1FI6f9Fh3xKj5iDfhhnIf/63UQDFDNpn22xMnGmcQK5
         VgCihOIjK+53uk/rNjZPDNBNxwg65YxlOVhNx8X/Z8fqa+6LOQmQZBjgGxm5k3LLJ9Zw
         2tAQ==
X-Gm-Message-State: AOAM530m9AglEH4Q1TAyd6QRmza+dAy2GRiZZnoXNBp+mL9TugezTl9z
	M39WNZpbgHdB3ELK6mtavxigYijT1gI=
X-Google-Smtp-Source: ABdhPJzq8Y3t/CL/Y3XRgH3cyKZEldV9p6JwVyrLJLd+J1p3zgOYxRxAf9uVX7NSRMLKU8XNrlIL2A==
X-Received: by 2002:a17:90a:380b:: with SMTP id w11mr4630719pjb.213.1596649816369;
        Wed, 05 Aug 2020 10:50:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id v77sm4711115pfc.137.2020.08.05.10.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:50:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] kexec-tools: Fix build with -fno-common
Date: Wed,  5 Aug 2020 10:50:10 -0700
Message-Id: <20200805175011.126156-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805175011.126156-1-raj.khem@gmail.com>
References: <20200805175011.126156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-kexec-Fix-build-with-fno-common.patch | 43 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.20.bb               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
new file mode 100644
index 0000000000..355053363e
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
@@ -0,0 +1,43 @@
+From c5fec6d6368b4103557deb710150119dca438544 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Aug 2020 10:46:39 -0700
+Subject: [PATCH] kexec: Fix build with -fno-common
+
+Ensure that my_debug is not doubly defined
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/arch/ppc64/kexec-elf-ppc64.c | 2 --
+ kexec/fs2dt.h                      | 2 +-
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
+index 3510b70..695b8b0 100644
+--- a/kexec/arch/ppc64/kexec-elf-ppc64.c
++++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
+@@ -44,8 +44,6 @@
+ uint64_t initrd_base, initrd_size;
+ unsigned char reuse_initrd = 0;
+ const char *ramdisk;
+-/* Used for enabling printing message from purgatory code */
+-int my_debug = 0;
+ 
+ int elf_ppc64_probe(const char *buf, off_t len)
+ {
+diff --git a/kexec/fs2dt.h b/kexec/fs2dt.h
+index 7633273..fe24931 100644
+--- a/kexec/fs2dt.h
++++ b/kexec/fs2dt.h
+@@ -30,7 +30,7 @@ extern struct bootblock bb[1];
+ 
+ /* Used for enabling printing message from purgatory code
+  * Only has implemented for PPC64 */
+-int my_debug;
++extern int my_debug;
+ extern int dt_no_old_root;
+ 
+ void reserve(unsigned long long where, unsigned long long length);
+-- 
+2.28.0
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
index 871b36440f..1e81ecc2c7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0005-Disable-PIE-during-link.patch \
            file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
            file://0007-kexec-un-break-the-build-on-32-bit-x86.patch \
+           file://0001-kexec-Fix-build-with-fno-common.patch \
            "
 
 SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
-- 
2.28.0

