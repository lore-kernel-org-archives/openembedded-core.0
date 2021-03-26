Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.2192.1616785938345049183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 12:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KjMKgJ1F;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id w8so3013842pjf.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mzpb7YK/lJVKGIdU4i9jsGeEuk7O7Ty1+Dh5HTH5ka4=;
        b=KjMKgJ1F1vYYeosKNVDSGzxf7cS88xgY7gUjtHPhygIpXs+dPSyHcM/AGa+sjWWYtw
         +xgsAtWHIYNx87ZfplX3DRi6tx+QXw2duhk5cOHvlSLkNhHENJpOLIs5yjyO5I65YEYx
         9PoDJEKZVVFLV/C4VAkA5qaFVjAAoRNp+9/mt+p1jOyF2vD+eGgAhd9Fh3FiQ7ZF1smq
         gHgbDAZdLGqRK8II/jjETXU7roXWKU/zffC5bDCwERDwxQd09JVHmRBaJqmtXVzG3nPj
         a8Fho0wzh6GEcCdffaqCbQuDOgpnPEmEgYq3Wddq6Xud4Nj5vC4bmiziyEhW3//EvHA6
         torA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mzpb7YK/lJVKGIdU4i9jsGeEuk7O7Ty1+Dh5HTH5ka4=;
        b=OE4kKdUamzqhIfTcB/sH2iqOCGAVh+lklLvg3gmN5uOWri7w2CIyqhFw5biNZ6X+QH
         aSf5dVuCk1CswqVJDU91DdKzV2HEo3Nh8e3HE9QEeWg1CgrYocgeMFzeO+QWSQNP3rIp
         TWlschNpWoTt985wFFzkl+VTZO+ZUZ5puO5DVu0afu7zDGHVAkux7M33aahFYf6I4czf
         lZ0uNxRPhKE9EgL4z6NlKEQHGk89c45peqOme6SX8hIpFKFWtjCU4iYAO2oGQ8wXufwS
         fmUFsAolD/E+lPcONbKEGLF0WIKJ9KI8nqIqLpHcbz2mUVv4KhX0N/HdttB3no7vLJdb
         aoDA==
X-Gm-Message-State: AOAM532t4Ia1DEYc2s2BHXNKphHyMeFrhLsSQZruKiuo0wLLrcc3oWhX
	hXFqEGjdAeNHG7mLzmh9YHtLV27u6OLnLQ==
X-Google-Smtp-Source: ABdhPJwYd0yqCXmgMNndtRZIebRWs//esXWz1Fz0K/pTCh6GNEL9Jv4gSwNjn7zMDAHQ6eyxYsqQDA==
X-Received: by 2002:a17:90a:f28e:: with SMTP id fs14mr14873008pjb.100.1616785937313;
        Fri, 26 Mar 2021 12:12:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id z8sm8942871pjr.57.2021.03.26.12.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 12:12:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3] grub-efi: Re-introduce lost cast to long
Date: Fri, 26 Mar 2021 12:12:14 -0700
Message-Id: <20210326191214.256631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This cast was accidentally dropped in
https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2bf40e9e5be9808b17852e688eead87acff14420

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
v1: Avoid apply addent to rv32
v2: Drop building grub-efi for rv32
v3: Fix the real regression due to dropped typecast

 ...1-RISC-V-Restore-the-typcast-to-long.patch | 29 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch

diff --git a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
new file mode 100644
index 0000000000..f0ffb3d954
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
@@ -0,0 +1,29 @@
+From bf248231cb4f9f966f0d57821dd0491af54d4a0b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Mar 2021 11:59:43 -0700
+Subject: [PATCH] RISC-V: Restore the typcast to long
+
+this makes the type promotions clear and explicit
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util/grub-mkimagexx.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
+index 00f49cc..ab5523d 100644
+--- a/util/grub-mkimagexx.c
++++ b/util/grub-mkimagexx.c
+@@ -1242,7 +1242,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
+ 		  */
+ 
+ 		 sym_addr += addend;
+-		 off = sym_addr - target_section_addr - offset - image_target->vaddr_offset;
++		 off = (long)sym_addr - target_section_addr - offset - image_target->vaddr_offset;
+ 
+ 		 switch (ELF_R_TYPE (info))
+ 		   {
+-- 
+2.31.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bcff676c26..590deb8d92 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://determinism.patch \
+           file://0001-RISC-V-Restore-the-typcast-to-long.patch \
 "
 
 SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074145484"
-- 
2.31.0

