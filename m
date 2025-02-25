Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA9FC021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9089.1740493817461158676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MexDweOX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so120257685ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493817; x=1741098617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVS2zVMIYvX7wBHYO7dSOJkA+KHqpodPvBFpLH+urSY=;
        b=MexDweOXTFr4rItpXIufseYuhzkps03K4CJguSB0yT+nmVp4yTPz1Rp/p9QcCUhEFV
         qR+G55o/Vvc0jHs/FGlFrxE5oh89trEySEHIfGCnR7s52pBDUr4+TXdt8w9vyvMeVAQN
         Mc5DEQ6bxj+/wlMqwJVDEYGlacDzoQDZejuqbrvGjpZHY0PGEDQ47yxpKOgKt0FVFdxI
         aR6FmMJtXHrdTlE4Orf3ypmZNpYy+ASFUN2lF0fRbWS5+Cx+rLx+xDHARoA/oZ7xpPAM
         UwdM67rGPJfzZwIe3k6dgUO96hkavN5J/IA3ON8DsWEpehrr6XgsbSZ1Y0bPnfE+IlKe
         2rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493817; x=1741098617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVS2zVMIYvX7wBHYO7dSOJkA+KHqpodPvBFpLH+urSY=;
        b=YhGGA5X3uo5HZRwNzKmSc1VPc41irm6LjzSlIzfFBDFAtECz2esj/ad6IewjMT/Jfc
         6xO+NMuwWfbUn19bJUno2tIr5b2Vdfw+2OkZUvl8VmfjW5r3jOU7Ns599sXqBgM4o5hd
         UaKfR9sRk+vGlbYjQo8RPPro1H45iZUSINzPtrGBa7V+Dhb8KTdvU9ZMkgMW1TFUB0ib
         agETI4atPDRidKOROxSsp4WgJDEYND3ZD6kzTIwGRN/XVsStjL0gmjwDwhebKZR2hEIv
         6uVJvitzwEVkkmBgzxLrNLXF/MrcaHSydvNMLUVHDKenQdXCNB+37YjG/kio0fqkEv8n
         x1ig==
X-Gm-Message-State: AOJu0YyY84ZLmfdQesNQ5yiMbWeBBI4djK9ytjNGdUai9l90YHXhpi4Y
	FE9qHZXhxWHKRAI2rh4moq9q7ZxSbfpBBWH5XHFcfKGJ1I6Y9nFzFjtDCZzmJNYTFtcmKeKPJda
	z
X-Gm-Gg: ASbGncs3L6YMM3kT3bJI6IJeN7aB8qtwJPQWzp/IlRs6TPHSQ219tNIJqwI0qBv6906
	SQPjGttzW9kdCsk6zFohOAGG8Ss7xMGDJePNLueTVPscRvYrji6dKG0NEn1rYV3iCx85rXUw4+f
	pUCkOQG7k5z4v5/XEuIPr/BwRCJpnAUQ+zkQ3ukZeHNSb/mjhXg4BkZxHuq9GwW4rWm+bEsNW7A
	vAxlHfmbsfK2ET6Fd3W45CisO2paugBpFwz2z7wEZQY7VSvPqSNDEj7Oyz3ZY8iJx/W1fdB54YI
	QyhWlIpYWbiQElxEvQ==
X-Google-Smtp-Source: AGHT+IFgHBsN7nMm8i4XlDIxF/O5Wte3R3JHZaPcX5JRabSt8vplB9eRv26KhRpbtq7tD/f6LNxROQ==
X-Received: by 2002:a17:903:41c2:b0:21f:55e:ed64 with SMTP id d9443c01a7336-221a0ec9b4bmr247066195ad.3.1740493816552;
        Tue, 25 Feb 2025 06:30:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/22] u-boot: fix CVE-2024-57258
Date: Tue, 25 Feb 2025 06:29:42 -0800
Message-ID: <b4bf3ba66052db7a311ac696563a8a0f9c585600.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211892

From: Hongxu Jia <hongxu.jia@windriver.com>

Integer overflows in memory allocation in Das U-Boot before 2025.01-rc1
occur for a crafted squashfs filesystem via sbrk, via request2size,
or because ptrdiff_t is mishandled on x86_64.

https://nvd.nist.gov/vuln/detail/CVE-2024-57258

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2024-57258-1.patch       | 47 +++++++++++++++++++
 .../u-boot/files/CVE-2024-57258-2.patch       | 43 +++++++++++++++++
 .../u-boot/files/CVE-2024-57258-3.patch       | 40 ++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  3 ++
 4 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
new file mode 100644
index 0000000000..d33a4260ba
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-1.patch
@@ -0,0 +1,47 @@
+From 50ab41c3628dedeca1a331dd86dd203b73faea74 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 12:08:45 +0200
+Subject: [PATCH 5/8] dlmalloc: Fix integer overflow in sbrk()
+
+Make sure that the new break is within mem_malloc_start
+and mem_malloc_end before making progress.
+ulong new = old + increment; can overflow for extremely large
+increment values and memset() can get wrongly called.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2024-57258
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/0a10b49206a29b4aa2f80233a3e53ca0466bb0b3]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/dlmalloc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common/dlmalloc.c b/common/dlmalloc.c
+index de3f0422..bae2a27c 100644
+--- a/common/dlmalloc.c
++++ b/common/dlmalloc.c
+@@ -591,6 +591,9 @@ void *sbrk(ptrdiff_t increment)
+ 	ulong old = mem_malloc_brk;
+ 	ulong new = old + increment;
+ 
++	if ((new < mem_malloc_start) || (new > mem_malloc_end))
++		return (void *)MORECORE_FAILURE;
++
+ 	/*
+ 	 * if we are giving memory back make sure we clear it out since
+ 	 * we set MORECORE_CLEARS to 1
+@@ -598,9 +601,6 @@ void *sbrk(ptrdiff_t increment)
+ 	if (increment < 0)
+ 		memset((void *)new, 0, -increment);
+ 
+-	if ((new < mem_malloc_start) || (new > mem_malloc_end))
+-		return (void *)MORECORE_FAILURE;
+-
+ 	mem_malloc_brk = new;
+ 
+ 	return (void *)old;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
new file mode 100644
index 0000000000..688e2c64d8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-2.patch
@@ -0,0 +1,43 @@
+From db7c626204f488a802a2e58b7a788b11fde6be7d Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 12:08:44 +0200
+Subject: [PATCH 6/8] dlmalloc: Fix integer overflow in request2size()
+
+req is of type size_t, casting it to long opens the door
+for an integer overflow.
+Values between LONG_MAX - (SIZE_SZ + MALLOC_ALIGN_MASK) - 1 and LONG_MAX
+cause and overflow such that request2size() returns MINSIZE.
+
+Fix by removing the cast.
+The origin of the cast is unclear, it's in u-boot and ppcboot since ever
+and predates the CVS history.
+Doug Lea's original dlmalloc implementation also doesn't have it.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2024-57258
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/8642b2178d2c4002c99a0b69a845a48f2ae2706f]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ common/dlmalloc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/dlmalloc.c b/common/dlmalloc.c
+index bae2a27c..1ac4ee9f 100644
+--- a/common/dlmalloc.c
++++ b/common/dlmalloc.c
+@@ -379,8 +379,8 @@ nextchunk-> +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ /* pad request bytes into a usable size */
+ 
+ #define request2size(req) \
+- (((long)((req) + (SIZE_SZ + MALLOC_ALIGN_MASK)) < \
+-  (long)(MINSIZE + MALLOC_ALIGN_MASK)) ? MINSIZE : \
++ ((((req) + (SIZE_SZ + MALLOC_ALIGN_MASK)) < \
++  (MINSIZE + MALLOC_ALIGN_MASK)) ? MINSIZE : \
+    (((req) + (SIZE_SZ + MALLOC_ALIGN_MASK)) & ~(MALLOC_ALIGN_MASK)))
+ 
+ /* Check if m has acceptable alignment */
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch
new file mode 100644
index 0000000000..2c8a7c9d91
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57258-3.patch
@@ -0,0 +1,40 @@
+From 37095a204127b60b5e00c4c5d435d6e48a6a1c51 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 12:08:43 +0200
+Subject: [PATCH 7/8] x86: Fix ptrdiff_t for x86_64
+
+sbrk() assumes ptrdiff_t is large enough to enlarge/shrink the heap
+by LONG_MIN/LONG_MAX.
+So, use the long type, also to match the rest of the Linux ecosystem.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2024-57258
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/c17b2a05dd50a3ba437e6373093a0d6a359cdee0]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ arch/x86/include/asm/posix_types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/arch/x86/include/asm/posix_types.h b/arch/x86/include/asm/posix_types.h
+index dbcea7f4..e1ed9bca 100644
+--- a/arch/x86/include/asm/posix_types.h
++++ b/arch/x86/include/asm/posix_types.h
+@@ -20,11 +20,12 @@ typedef unsigned short	__kernel_gid_t;
+ #if defined(__x86_64__)
+ typedef unsigned long	__kernel_size_t;
+ typedef long		__kernel_ssize_t;
++typedef long		__kernel_ptrdiff_t;
+ #else
+ typedef unsigned int	__kernel_size_t;
+ typedef int		__kernel_ssize_t;
+-#endif
+ typedef int		__kernel_ptrdiff_t;
++#endif
+ typedef long		__kernel_time_t;
+ typedef long		__kernel_suseconds_t;
+ typedef long		__kernel_clock_t;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index c68e3e442f..cdee9fc721 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -15,6 +15,9 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2024-57255.patch \
                    file://CVE-2024-57256.patch \
                    file://CVE-2024-57257.patch \
+                   file://CVE-2024-57258-1.patch \
+                   file://CVE-2024-57258-2.patch \
+                   file://CVE-2024-57258-3.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0


