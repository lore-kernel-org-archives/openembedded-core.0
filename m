Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC557C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 06:19:38 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.4981.1638425978336009264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 22:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YTY3iSsO;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id np3so19778343pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 22:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfXe5g5xTuvmjHHuArQFzK7kDGBKTxlx5RvV5dKkskM=;
        b=YTY3iSsONVDM7uOiZdcv/61qqhqrx9uMQPnfDs0hC6StpShF4fl2bruoBrisxseiUs
         VN95a6J39dkpZe+CEWA6Gs/GHkiVDE0Zn6OKlLYvuUGfFJcTjH57kqlveXQ2Iim3zjF2
         Ceg8Jz934jrc1+f990O1o9s4LsXvtk653u80aE0F9ZRtYfS82bLjRwLtGlQKkAM8eVXZ
         06d4QgiCjr2T5eFaabmxRDHLjT9Bv8ZCIldruq4Ys10INYnQT52HURzsxxdOvUwAJm2Y
         PXH7fF0gbsWZnIjCZGfmB1bopLvcZuedk0Jgld6fsfWtwlas0IA/8T9fUGOeS7YtNmkL
         AJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kfXe5g5xTuvmjHHuArQFzK7kDGBKTxlx5RvV5dKkskM=;
        b=T01040do9mBo/wI5nYwlXk4NKOgSN4PuBpVCJFFGoAPmfS0jn6omXBeS85CEBcs5V/
         wguIct9GutTgE+4pFH6W1H3CBzfHpzsr7YdNF7ohxvgUcD0PnEhofiRdxgZsUSXho520
         TcE2O1OKC0+YHhyst0cFSFfQfm76YFOOYndJpPJDGGJOdPIHxjImIPj7DNINwtVr1C5x
         yzLzgSK+gHMP8Q3WU154XqPttDv0ZgjmYs7Nk1tOGyQHKQivOzmWas+5R8prAzam8vP9
         L9/JGGzIs0cTu1lCcGGAhsS7ZEDhbK55bbiPhs71L0x0X4juqMR6gXW8ESqbO1B8Wea7
         VFAg==
X-Gm-Message-State: AOAM531JprKKFqrmWKNP+KDEFEz3jqY55caP3GFLkGPrl5R8shy3nBeP
	Eq0QYbEaf8TXBeTEgsZlIgcV+Z0vJvXS0A==
X-Google-Smtp-Source: 
 ABdhPJwl3ipsDH4jwZG2U303PoAMnNyU8ErG7oN5zvizxL2Yn6P3Lphqsro9LbEnfO0N861e5qydXQ==
X-Received: by 2002:a17:90a:be10:: with SMTP id
 a16mr3709550pjs.133.1638425977527;
        Wed, 01 Dec 2021 22:19:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 y8sm1885960pfi.56.2021.12.01.22.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 22:19:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH] glibc: Drop patch to support/workaround prelinked apps on
 armv5
Date: Wed,  1 Dec 2021 22:19:33 -0800
Message-Id: <20211202061933.2156855-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 06:19:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159072

The usecase explained in bug #1443 works fine now a days on qemuarmv5,
tested by using lltng-ust and explicitly linking in liburcu-bp.so as
well, since its no more a direct dependency of liblttng-ust.so.1

Given that usecase works, unbolt this fix now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 ...443-which-explains-what-the-patch-do.patch | 58 -------------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 -
 2 files changed, 59 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch

diff --git a/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
deleted file mode 100644
index 07d4411c61c..00000000000
--- a/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From add514edf4299d1bf540d85d0aa0bd5fe0d46b78 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
-
-  We build some random program and link it with -lust.  When we run it,
-  it dies with a SIGSEGV before reaching main().
-
-  Libust.so depends on liburcu-bp.so from the usermode-rcu package.
-  Although libust.so is not prelinked, liburcu-bp.so IS prelinked; this
-  is critical.
-
-  Libust.so uses a TLS / __thread variable that is defined in liburcu-
-  bp.so.  There are special ARM-specific relocation types that allow two
-  shared libraries to share thread-specific data.  This is critical too.
-
-  One more critical issue: although liburcu-bp.so is prelinked, we can't
-  load it at its prelinked address, because we also link against
-  librt.so, and librt.so uses that address.
-
-  The dynamic linker is forced to relink liburcu-bp.so at a different
-  address.  In the course of relinking, it processes the special ARM
-  relocation record mentioned above.  The prelinker has already filled
-  in the information, which is a short offset into a table of thread-
-  specific data that is allocated per-thread for each library that uses
-  TLS.  Because the normal behavior of a relocation is to add the symbol
-  value to an addend stored at the address being relocated, we end up
-  adding the short offset to itself, doubling it.
-
-  Now we have an awkward situation.  The libust.so library doesn't know
-  about the addend, so its TLS data for this element is correct.  The
-  liburcu-bp.so library has a different offset for the element.  When we
-  go to initialize the element for the first time in liburcu-bp.so, we
-  write the address of the result at the doubled (broken) offset.
-  Later, when we refer to the address from libust.so, we check the value
-  at the correct offset, but it's NULL, so we eat hot SIGSEGV.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/arm/dl-machine.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
-index ff5e09e207..d68bfe5cbe 100644
---- a/sysdeps/arm/dl-machine.h
-+++ b/sysdeps/arm/dl-machine.h
-@@ -510,7 +510,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
- 
- 	case R_ARM_TLS_DTPOFF32:
- 	  if (sym != NULL)
--	    *reloc_addr += sym->st_value;
-+	    *reloc_addr = sym->st_value;
- 	  break;
- 
- 	case R_ARM_TLS_TPOFF32:
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 02b76ab3f35..1826eba1756 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -33,7 +33,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
            file://0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
            file://0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
-           file://0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
            file://0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
            file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
-- 
2.34.1


