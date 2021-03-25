Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3569.1616645710644131651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 21:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EGw8lGzB;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id j25so714516pfe.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 21:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgKQyci5yN2cvr5kT+Kn9gGPWONt47c5G6Ov5jPMYjg=;
        b=EGw8lGzBM51RoOC7AK+xgfi/wMg3QOYMYPNGN2k6uWzDz8Bn5rL4309+lzerEfZJgd
         AEAC7cZIgsdrlolYafK+vKPzZKuW07eeGT+1kFWckpdnyJlpPvKXEaDr5TERWi1bt/oc
         SWjR5zK526I18rCqLcjYpGlsmIxAAl8w3/jcZJhECHsRAOsn8qaQalV/8lQcxhsvTIVz
         txR5nIpTF7zcBex+84YYxwsExmocZIv9qX++UGAHz7plfy0SobYlAmHtJ4UgZBc7eNG6
         odVkoB3RpjwHT3sKc47TiZPHZndEbDKNsKiScn4pnYXm6x2DVU83pJ3+0eiLoAsjCsSi
         c3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgKQyci5yN2cvr5kT+Kn9gGPWONt47c5G6Ov5jPMYjg=;
        b=KGdKJe6mspexjhhe2u/DOIovdSKtvDvDzD3Wfn2l0mmYm7gTJTtFLZX9ZMXHKCp+Eh
         PE7ECRjMUmPzj0u/SHkjtRAosfxcu40xpq9Jo8S9WAFEsaSXDAxgILblDUm/7EKXYuSO
         bRlyUywyPDhaPIIOmqKW/oQCRgLCykbIBflBpeKE+E0m+gzBaxyCc6fXAbNO8MftG+vd
         k+9T4IVK7SwWGUVTDEZxE+df5glcXLKWfaMdv5JoHOAfMp6vD6oa30oEy5oZWLWlXHwt
         AjBqUw4slfmj/tstlHBb/iFGvnR84VRFw2mKPjsDaB8ahhggavzHbyr/ch0APCdfVghX
         BR3Q==
X-Gm-Message-State: AOAM5324HZyh3OKkMJAF66GsuA/ooWMw6YDtLzh+BZlgz+l+4ubv9qYB
	9nxCCc62FhHyGe2MupUhIIsg9EdXTLBxpQ==
X-Google-Smtp-Source: ABdhPJwUPvezeRcJDcTIUQn9CXgj/CnPNhb9ehBgb+JGcwIVPk9Vq5P+rWcNWPUrBLASLu8sGWTTPw==
X-Received: by 2002:a17:902:7886:b029:e7:1052:adad with SMTP id q6-20020a1709027886b02900e71052adadmr6250473pll.75.1616645709634;
        Wed, 24 Mar 2021 21:15:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4578])
        by smtp.gmail.com with ESMTPSA id b140sm3990850pfb.98.2021.03.24.21.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 21:15:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] grub-efi: Fix build failure on RISCV32
Date: Wed, 24 Mar 2021 21:15:06 -0700
Message-Id: <20210325041506.3558560-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 ...sable-offset-overflow-check-for-rv32.patch | 45 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch b/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
new file mode 100644
index 0000000000..6547bf2261
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
@@ -0,0 +1,45 @@
+From ce1cea0563011698e4a70c9a60e7da66b57ab1d6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Mar 2021 20:55:56 -0700
+Subject: [PATCH] Disable offset overflow check for rv32
+
+Fixes
+/tmp/grub/grub-mkimage: error: target 17c6 not reachable from pc=936.
+
+Upstream-Status: Reported [https://savannah.gnu.org/bugs/index.php?60283]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util/grub-mkimagexx.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
+index 00f49ccaa..6deb66226 100644
+--- a/util/grub-mkimagexx.c
++++ b/util/grub-mkimagexx.c
+@@ -1297,9 +1297,10 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
+ 		     {
+ 		       grub_uint32_t hi20, lo12;
+ 
++#ifdef MKIMAGE_ELF64
+ 		       if (off != (grub_int32_t)off)
+ 			 grub_util_error ("target %lx not reachable from pc=%lx", (long)sym_addr, (long)((char *)target - (char *)e));
+-
++#endif
+ 		       hi20 = (off + 0x800) & 0xfffff000;
+ 		       lo12 = (off - hi20) & 0xfff;
+ 		       t32[0] = grub_host_to_target32 ((grub_target_to_host32 (t32[0]) & 0xfff) | hi20);
+@@ -1336,9 +1337,10 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
+ 		     {
+ 		       grub_int32_t hi20;
+ 
++#ifdef MKIMAGE_ELF64
+ 		       if (off != (grub_int32_t)off)
+ 			 grub_util_error ("target %lx not reachable from pc=%lx", (long)sym_addr, (long)((char *)target - (char *)e));
+-
++#endif
+ 		       hi20 = (off + 0x800) & 0xfffff000;
+ 		       *t32 = grub_host_to_target32 ((grub_target_to_host32 (*t32) & 0xfff) | hi20);
+ 		     }
+-- 
+2.31.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bcff676c26..d8a556e06c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://determinism.patch \
+           file://0001-Disable-offset-overflow-check-for-rv32.patch \
 "
 
 SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074145484"
-- 
2.31.0

