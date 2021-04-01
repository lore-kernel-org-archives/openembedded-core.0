Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.1097.1617290929509267436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HENs75BF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso2477258otq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aFTrUJn4bRwO3wzYMxV1wtd5XTR+/yGeAut2uc6rscE=;
        b=HENs75BFwQkUd8LBb60Fi+9JdCRsjigfjX4IS9gTeQ/EhaYSsnPH4K5gaM1LZ5FN9L
         i2CMJnsUTS0p/TYoHzBHPshOn2nTSUT2ebo0uphkwq6HG2fL1a6Ov9Z//dTGYWzO1co9
         opG2gbYdnIiorChxkGgjhoPRWR3EIPtaZdLRN/hm93RGNEResk6/zeEBh3MAEY2dUnKR
         5+ckzGlb32AWGWfzgBOMbehiYBFHvNIPTppStlCGmfozMLtSQHe67FBnqhkbS5wxwEuR
         lijSwr7lnfZei4azSB/oKvopFyJx5FtlX3CD9+BNJojOlKP3EhuI80QltL2ZR14gMjJP
         INgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFTrUJn4bRwO3wzYMxV1wtd5XTR+/yGeAut2uc6rscE=;
        b=l87ODlCHsna/aa+D2rNFP7DGLiWDtGCaM1d/Aw7+u8+nTOC+/nt4nsD1eQmEXpKap5
         EBE3Yhi1mqSR31hYFFG07/7Furaf5n+lt6DAaVy6Vk6Q/JG7QAYTSx7n3InWZBw0Nt62
         IkyVlx/q4eqFsaOnarUAe4bc4LEVhXw3UMZto6t3XS+JeLentzVLvT9M2pY2vRpprDzP
         MbND99ZPkU5UOc2nXzxzq9e9qbVEeC1f2NseiKqOLokQ/X1p3/NaFJUjeJcTdq2PSl99
         Nj/XjiuV1O1YuuvChdwrwZ1XtVfmZePZo5e67qo90a1u7b2TAmGsI5wAt1WTa6fZTvUO
         kfGA==
X-Gm-Message-State: AOAM5333i6s15ZkB/M3ScRa6OoUVoPEEsgeqepfpbN0Gjc2JvyzkfWmU
	6jbCiwkaQTMZ88LQCZAwrvAbxz/+qWg4JIrfKs8=
X-Google-Smtp-Source: ABdhPJzrn9u5/RMeZnQEbGTzHq+KJocGeb+fw6CHGMo3r+FvteJ/PgI2pLY4pnostGqwo7gBZ4Fe5A==
X-Received: by 2002:a05:6830:20da:: with SMTP id z26mr7455309otq.74.1617290928390;
        Thu, 01 Apr 2021 08:28:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/15] cryptodev-module: Backport a patch to fix build failure with kernel v5.8
Date: Thu,  1 Apr 2021 05:27:35 -1000
Message-Id: <b132bdbca1980dd2f1e343372ae464f78fb337c2.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: He Zhe <zhe.he@windriver.com>

Fix the following build failure with linux-yocto-dev

zc.c:61:17: error: 'struct mm_struct' has no member named 'mmap_sem';
did you mean 'mmap_base'?
   61 |  down_read(&mm->mmap_sem);
      |                 ^~~~~~~~
      |                 mmap_base
zc.c:77:15: error: 'struct mm_struct' has no member named 'mmap_sem';
did you mean 'mmap_base'?
   77 |  up_read(&mm->mmap_sem);
      |               ^~~~~~~~
      |               mmap_base

(From OE-Core rev: fe668065ad7ec83aadfa36fe6ba1ced3db2e3cad)

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cryptodev/cryptodev-module_1.10.bb        |  1 +
 .../0001-Fix-build-for-Linux-5.8-rc1.patch    | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index 552eb6abaa..6474599c45 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -9,6 +9,7 @@ DEPENDS += "cryptodev-linux"
 
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
+file://0001-Fix-build-for-Linux-5.8-rc1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
new file mode 100644
index 0000000000..02c721a4f3
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
@@ -0,0 +1,49 @@
+From 9e765068582aae3696520346a7500322ca6cc2de Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Sat, 13 Jun 2020 19:46:44 +0200
+Subject: [PATCH] Fix build for Linux 5.8-rc1
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9740ca4e95b43b91a4a848694a20d01ba6818f7b
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da1c55f1b272f4bd54671d459b39ea7b54944ef9
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d8ed45c5dcd455fc5848d47f86883a1b872ac0d0
+
+Signed-off-by: Joan Bruguera <joanbrugueram@gmail.com>
+
+Upstream-Status: Backport [9e765068582aae3696520346a7500322ca6cc2de]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ zc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/zc.c b/zc.c
+index ae464ff..2c286bb 100644
+--- a/zc.c
++++ b/zc.c
+@@ -58,7 +58,11 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 		return 0;
+ 	}
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	down_read(&mm->mmap_sem);
++#else
++	mmap_read_lock(mm);
++#endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0))
+ 	ret = get_user_pages(task, mm,
+ 			(unsigned long)addr, pgcount, write, 0, pg, NULL);
+@@ -74,7 +78,11 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL, NULL);
+ #endif
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	up_read(&mm->mmap_sem);
++#else
++	mmap_read_unlock(mm);
++#endif
+ 	if (ret != pgcount)
+ 		return -EINVAL;
+ 
+-- 
+2.17.1
+
-- 
2.25.1

