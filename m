Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.16398.1616984539009128356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 19:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AyxqmGoM;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id i6so1298803pgs.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Mar 2021 19:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GWuei5Ey1PgQ4ToX7z33k01KQFZmGJi5aiGTbK7+2oI=;
        b=AyxqmGoMsypSun1a6LZTbgd/utdG5/CgmSDnMIEyB8tPpQEdPOcmR0BLUoyIlauVn5
         63f6J7r93BJ4CDeLrthjvEMiMp5DBJ1QJp2I6zxDPiZZ2p4WYmG0fvCpRdIcfxEOX1p5
         VreK6dALMJN+8lqLd+vdK4/LS5vAHxQInUiu01893rtOzPZOfdh8GR9lCARroC6Bs+Oa
         ldzZPONMQNspCYpZRYd6xPwzqfAosXMth/jsG85eIkltV98s5cc7yjUkBmOM1JrVA8uO
         0Ulnk3/yaefiKM0O5w1eGczJ8qo4MKkbvzSFr6J1r4zoLWJfVt3FrEkj1CFshUm6gAfh
         jFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GWuei5Ey1PgQ4ToX7z33k01KQFZmGJi5aiGTbK7+2oI=;
        b=Wk0UirC1saLhOfF0Iu/bM4nha31nVXM//Z25q3gXZrViVDBPgO2xkM+d7fuGJgs0vJ
         GmsRelA1b/bJvH+qIrKVGbVQHVGN2TUXQVaShB0pFCoolQ2wFDshGcEPWWXktxu3FAiu
         Y/gpXwzMuakmT3/DNZc0RD1Cwvj23YpyeEeJCjIZvJ22pCAmg9SQ0fCtgMPH8yJnJXxg
         po61MU48L6ptKjfrl9E6RcbPB5IaHujf9NyCrAzzLUWqQTD3U632dWUF/S0v+5KBubiS
         ovy1XZ3ZRGKzHOR5yK/KiMMGycKKee++FqzFk2HV8W4cJr9g5EGTldZFJKQ1m8aFaZDA
         s4+w==
X-Gm-Message-State: AOAM53073CbXU8GEmnedDa4C+qtZhRaNl/+F/29qxPZei1SzovjSJyKV
	IoJxHwc9A0rTgnhYhpnz6HxGbKK5uys7Uw==
X-Google-Smtp-Source: ABdhPJyc04bF2ESSdmRBr/Mv6osHlx3BDEJe4vu/qA4GfyDp7+lkZoibDP/+/aejb/24BwJ1uKZqdA==
X-Received: by 2002:aa7:860f:0:b029:200:851:1bff with SMTP id p15-20020aa7860f0000b029020008511bffmr23395431pfn.64.1616984538092;
        Sun, 28 Mar 2021 19:22:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id k19sm205552pgl.1.2021.03.28.19.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 19:22:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] grub2: Enable on riscv32
Date: Sun, 28 Mar 2021 19:22:09 -0700
Message-Id: <20210329022209.2114558-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the patch as submitted upstream to grub2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-RISC-V-Restore-the-typcast-to-long.patch | 22 ++++++++++++++-----
 meta/recipes-bsp/grub/grub2.inc               |  2 +-
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
index f0ffb3d954..2f15a91f68 100644
--- a/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
+++ b/meta/recipes-bsp/grub/files/0001-RISC-V-Restore-the-typcast-to-long.patch
@@ -1,18 +1,28 @@
-From bf248231cb4f9f966f0d57821dd0491af54d4a0b Mon Sep 17 00:00:00 2001
+From e4c41db74b8972285cbdfe614c95c1ffd97d70e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 26 Mar 2021 11:59:43 -0700
-Subject: [PATCH] RISC-V: Restore the typcast to long
+Subject: [PATCH] RISC-V: Restore the typcast to 64bit type
 
 this makes the type promotions clear and explicit
+It was already typecasted to long but was accidentally dropped in [1]
+which stated to cause failures on riscv32 as reported in [2]
 
-Upstream-Status: Pending
+[1] https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2bf40e9e5be9808b17852e688eead87acff14420
+[2] https://savannah.gnu.org/bugs/index.php?60283
+
+Upstream-Status: Submitted
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Andreas Schwab <schwab@suse.de>
+Cc: Daniel Kiper <daniel.kiper@oracle.com>
+Cc: Chester Lin <clin@suse.com>
+Cc: Nikita Ermakov <arei@altlinux.org>
+Cc: Alistair Francis <alistair.francis@wdc.com>
 ---
  util/grub-mkimagexx.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
-index 00f49cc..ab5523d 100644
+index 00f49ccaa..ac677d03d 100644
 --- a/util/grub-mkimagexx.c
 +++ b/util/grub-mkimagexx.c
 @@ -1242,7 +1242,7 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
@@ -20,10 +30,10 @@ index 00f49cc..ab5523d 100644
  
  		 sym_addr += addend;
 -		 off = sym_addr - target_section_addr - offset - image_target->vaddr_offset;
-+		 off = (long)sym_addr - target_section_addr - offset - image_target->vaddr_offset;
++		 off = (grub_int64_t)sym_addr - target_section_addr - offset - image_target->vaddr_offset;
  
  		 switch (ELF_R_TYPE (info))
  		   {
 -- 
-2.31.0
+2.31.1
 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0e431ac008..590deb8d92 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -34,7 +34,7 @@ UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)\.tar\.(gz|xz)"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv64)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST_armv7a = 'null'
 COMPATIBLE_HOST_armv7ve = 'null'
 
-- 
2.31.1

