Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.19838.1597560141144906781
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LwDiGpb5;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id c10so6763596pjn.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32YBvhgZN34K2xzLADIhwDvcPw9B1Nq62gNjf2lohzo=;
        b=LwDiGpb55w1zL/RAv4+kWGj6I/rcTbZjW2JAU2YeiBiR4H7zXGRn95YzSG0GvPp7gh
         wkQIGat90u4AnR/RqiUCgriSfJJQCrHbTXHsOF6I/giToSObe2Q56Sm2abMHyW/26GsY
         U69p9ZqQP1ak/9Dmkz1RhJ8PgggeSbm/v/TcoRIIRM5CivEoIZ270JyrY6BUOieHS7hL
         sGt18hmdGWSb6+7eKIUgPzhjd8Qr4eyO3EEQF97BAx+SUSJNoCikd7wTMO1n2HWuq6gA
         DQpopX82+pK9BJ5LhggEevjstQmsbHTx3TdTCMXPa6XKJ2HQdDg65E9hXVyaUhu8I3ue
         U1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32YBvhgZN34K2xzLADIhwDvcPw9B1Nq62gNjf2lohzo=;
        b=cqlNmwf63OdOwNgyHt6A/Jnv73hJzn83zJyHOIDeGZpM2q9onzA+Gendrm7tJY16YI
         tIC87FUDZEZOs7ldog8+SQ+RcKd6Fegi9xBx8ePc4K03M6EkfNHGWxGrz7jcjp03SG6E
         R+DsBm+OpjG56R3dgWtTD2Pwaa9WW24tl3iKwaTiogO5fE+pO8TlySoJrK9eDpdqupxo
         LjK1Y6OJMgOATBM1SM3YDYOYS/9mdRORNN2SVctXm+Al7SMflWozNMmksKwRjHe0i+xW
         ggs8qa9CYj/5oL+sXPpbiI67IurC9Y97IXqddFvyKKowP6RXfEEMOnCBUXJkwH/Llj0H
         6Zbg==
X-Gm-Message-State: AOAM53245J/gvGDTpbHKSQG3/X9Hb2PT08Af9hLVg2rPNuOeUjEH1wAF
	KghH6OqbPgsAWV+wQBYvIC99I0hnzn8+yw==
X-Google-Smtp-Source: ABdhPJw/cnb+aIK1cYghGP+WeyysmlYHSOq7HjC+I+rfDy0djBX0w8i03V+8D1mYiosQN9kdbxEe2Q==
X-Received: by 2002:a17:902:d715:: with SMTP id w21mr7258449ply.197.1597560140360;
        Sat, 15 Aug 2020 23:42:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id v128sm14544305pfc.14.2020.08.15.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 23:42:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] kexec-tools: Fix additional duplicate symbols on aarch64/x86_64 builds
Date: Sat, 15 Aug 2020 23:42:15 -0700
Message-Id: <20200816064216.1142587-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-kexec-Fix-build-with-fno-common.patch | 39 +++++++++++++++----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
index 355053363e..a3ba0912d4 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
@@ -12,8 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  kexec/fs2dt.h                      | 2 +-
  2 files changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
-index 3510b70..695b8b0 100644
 --- a/kexec/arch/ppc64/kexec-elf-ppc64.c
 +++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
 @@ -44,8 +44,6 @@
@@ -25,8 +23,6 @@ index 3510b70..695b8b0 100644
  
  int elf_ppc64_probe(const char *buf, off_t len)
  {
-diff --git a/kexec/fs2dt.h b/kexec/fs2dt.h
-index 7633273..fe24931 100644
 --- a/kexec/fs2dt.h
 +++ b/kexec/fs2dt.h
 @@ -30,7 +30,7 @@ extern struct bootblock bb[1];
@@ -38,6 +34,35 @@ index 7633273..fe24931 100644
  extern int dt_no_old_root;
  
  void reserve(unsigned long long where, unsigned long long length);
--- 
-2.28.0
-
+--- a/kexec/arch/arm64/kexec-arm64.h
++++ b/kexec/arch/arm64/kexec-arm64.h
+@@ -50,8 +50,8 @@ int zImage_arm64_load(int argc, char **a
+ void zImage_arm64_usage(void);
+ 
+ 
+-off_t initrd_base;
+-off_t initrd_size;
++extern off_t initrd_base;
++extern off_t initrd_size;
+ 
+ /**
+  * struct arm64_mem - Memory layout info.
+@@ -65,7 +65,7 @@ struct arm64_mem {
+ };
+ 
+ #define arm64_mem_ngv UINT64_MAX
+-struct arm64_mem arm64_mem;
++extern struct arm64_mem arm64_mem;
+ 
+ uint64_t get_phys_offset(void);
+ uint64_t get_vp_offset(void);
+--- a/kexec/arch/x86_64/kexec-bzImage64.c
++++ b/kexec/arch/x86_64/kexec-bzImage64.c
+@@ -42,7 +42,6 @@
+ #include <arch/options.h>
+ 
+ static const int probe_debug = 0;
+-int bzImage_support_efi_boot;
+ 
+ int bzImage64_probe(const char *buf, off_t len)
+ {
-- 
2.28.0

