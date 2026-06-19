Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6C6CDB46D
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38259.1781857997830918132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=STa3g2L+;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso913133f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857996; x=1782462796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GsQbsIB0BXMZ4oT8TQKQK3gcly8bAkBIPXej8QDBfA=;
        b=STa3g2L+LcVjeUDt6LXuZa2hxPkS5L1+6907P9/2MAN58FddPnkVqAUx8SKg4kapc6
         vFthp7uA5LZPg51Obv8oAMpdwfDpvr/QT40FBElVapcWQrbDeRVBs71CjQH4yys5aFFe
         e1OTrovAPQGG0hB068gaM7f4Y6iSDjL9EhbDJ0bEc8IIKs/y2sVO3yW8Dg+jGD6I+GLq
         NKuYUCLPc9mwbEfif+mzuRk9F50oDFavOoou8Pdt4f+PPKuCXzCsUhaNGtSCZhnpQbSz
         0pFadjCU6s006Gi8U7rb4pW1Npa34TL8kNdk/pNM6KFhhR6cba8kQ+Y5V4kYjpJiov1W
         8Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857996; x=1782462796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3GsQbsIB0BXMZ4oT8TQKQK3gcly8bAkBIPXej8QDBfA=;
        b=KUIR8nFi78dfD4ceGibulQjjcN40TlSodCAzPRx5WFM+QgLPVFLUR7cQrkDcgOvIPA
         tE1t07inBGNB/jiGEX46AVFiPPGA3NGa0xg55X7dEdO0eu29F6SvbiblMyrRRfzEZJHH
         S+yC8nMt6uefM11RLulAorqfqpM+MKerDVTJS5gsqffAMDkekrehJ88Dk5cTBCdaY3vN
         DSDHiOlyOjhbX2+FO3I21Tb2aiLJXs/bZ6SGx1pLi3Nko9bbHHniTI325in5/Kb8glZB
         An4pH3VCWWdJO0GDCkf/NxShPnNTnE1Xj2hzp9pMHziz9NdTv7X0T+E5F/PF1svvqSXs
         Mlsg==
X-Gm-Message-State: AOJu0Yyi0Yhf0QrYxfUMpEkMi0JzyldUfm/fOFKKgp6fjys4NTUbEN2b
	uGeL7qO8FzncNaGNcxPfqWfVNW399noq0/dTwX7T4HA83FZzyUQcPhI+KaVsICKu
X-Gm-Gg: AfdE7cno5M3CmNYfMOeItdoEoY6TayKK1+5+2w8OKtDW1FlDOJd0l3CwZtsi9O+Srj1
	5mcrNQf5wByt71XczljYIbImE+4FY8a6Y56P3DN/IhgPI1cSIlODYphUpaamFERkBEsQP8jXwbT
	tra/dCqTGhmmLvhXPAQSrcmwjOL/MTw4Vkcv5iuLgcoMC2AphAVPBHZUGm6skR+viXtibWtHTa2
	RmNx+SAjjThVbkqR7OZbFRqHngl4ZqJWvu8uCMEFyd+Mx8NNN1f+z1CnuIZvFCcamnaetMR1Zp3
	Wf9K4KPVPubGw1aN0gtJjBXkh7aHC/YPnnYbVMp4JWhOLy3iBoGT6m9Tmc/36YqAuml2tPlFKyI
	C8vp/YS/gBJ+xi0gW9Ov9y15SRvWLr5N68HO1hhJdwYsWAsbv/2DmTspCiV/NRViaWf7nxKJhpm
	7drsjLDOrLc0uDS61b9R6LV1C/LsTxBu69Z4y/nQ458rA0Bdvr
X-Received: by 2002:a05:600c:b90:b0:490:ec79:3077 with SMTP id 5b1f17b1804b1-4923f436f0dmr58197565e9.16.1781857995736;
        Fri, 19 Jun 2026 01:33:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/15] elfutils: upgrade 0.194 -> 0.195
Date: Fri, 19 Jun 2026 10:32:51 +0200
Message-ID: <20260619083305.3505156-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239144

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{elfutils_0.194.bb => elfutils_0.195.bb}  |  3 +-
 ...001-config-eu.am-do-not-force-Werror.patch | 12 ++--
 ...u-objects-to-libelf.a-static-archive.patch |  6 +-
 ...-check-data_list.data.d.d_buf-before.patch |  6 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...m-compile-test_nlist-with-standard-C.patch |  6 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  8 +--
 .../elfutils/files/0003-fixheadercheck.patch  |  6 +-
 .../elfutils/files/0003-musl-utils.patch      |  6 +-
 ...h64-Recognize-SHT_AARCH64_ATTRIBUTES.patch | 60 -------------------
 .../elfutils/files/ptest.patch                | 14 ++---
 11 files changed, 34 insertions(+), 95 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.194.bb => elfutils_0.195.bb} (98%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0004-aarch64-Recognize-SHT_AARCH64_ATTRIBUTES.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.194.bb b/meta/recipes-devtools/elfutils/elfutils_0.195.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.194.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.195.bb
index 2173a94401..bfc648d69f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.194.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.195.bb
@@ -20,12 +20,11 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
-           file://0004-aarch64-Recognize-SHT_AARCH64_ATTRIBUTES.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "09e2ff033d39baa8b388a2d7fbc5390bfde99ae3b7c67c7daaf7433fbcf0f01e"
+SRC_URI[sha256sum] = "37629fdf7f1f3dc2818e138fca2b8094177d6c2d0f701d3bb650a561218dc026"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
index d4e141927f..0149c64602 100644
--- a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
@@ -1,4 +1,4 @@
-From e169c3fc734be1783b3e1a4768dbec05fb64cb4f Mon Sep 17 00:00:00 2001
+From 5a82f181583e02e19ed739a195801032532474bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:50:48 +0100
 Subject: [PATCH] config/eu.am: do not force -Werror
@@ -13,18 +13,18 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 deletions(-)
 
 diff --git a/config/eu.am b/config/eu.am
-index 0b7dab5..5e7a03f 100644
+index 321591f..a1748a8 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+@@ -135,7 +135,6 @@ AM_CFLAGS = -Wall -Wshadow -Wformat=2 \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
- 	    $(USE_AFTER_FREE3_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) $(MISSING_PARAMETER_NAME_WARNING) \
+ 	    $(DEPRECATED_NON_PROTOTYPE_WARNING) $(FREE_LABELS_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
  	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
-@@ -109,7 +108,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+@@ -145,7 +144,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
  	   $(TRAMPOLINES_WARNING) \
  	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
index 81c5255447..c2571c27f9 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch
@@ -1,4 +1,4 @@
-From f5d6e088f84dd05278c4698a21cbf1ff4569978d Mon Sep 17 00:00:00 2001
+From ad94a59ebcc32f71853716aff650997076d112df Mon Sep 17 00:00:00 2001
 From: Mark Wielaard <mark@klomp.org>
 Date: Tue, 22 Oct 2024 15:03:42 +0200
 Subject: [PATCH] libelf: Add libeu objects to libelf.a static archive
@@ -20,10 +20,10 @@ Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h
  1 file changed, 3 insertions(+)
 
 diff --git a/libelf/Makefile.am b/libelf/Makefile.am
-index 05484c1..72f1e22 100644
+index cc539c8..156a486 100644
 --- a/libelf/Makefile.am
 +++ b/libelf/Makefile.am
-@@ -125,6 +125,9 @@ libelf.so: $(srcdir)/libelf.map $(libelf_so_LIBS) $(libelf_so_DEPS)
+@@ -126,6 +126,9 @@ libelf.so: $(srcdir)/libelf.map $(libelf_so_LIBS) $(libelf_so_DEPS)
  libeu_objects = $(shell cat ../lib/libeu.manifest)
  libelf_a_LIBADD = $(addprefix ../lib/,$(libeu_objects))
  
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 1ee50588dc..297cf19ccb 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From c4a26ff38182b289a1076bbef263e808b5e3aa97 Mon Sep 17 00:00:00 2001
+From 6b339ad9f9084b653b0d0c3823c871a7a9774b63 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -19,10 +19,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index da8f3a2..8557658 100644
+index 9df2e16..339d7ed 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -170,14 +170,16 @@ elf_end (Elf *elf)
+@@ -176,14 +176,16 @@ elf_end (Elf *elf)
  		   architecture doesn't require overly stringent
  		   alignment the raw data buffer is the same as the
  		   one used for presenting to the caller.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 2fc526372d..7a9e1fbcdd 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From d59d6fd13e4a7fe3fdca2a4ce1cd2def36356bb4 Mon Sep 17 00:00:00 2001
+From 168f8b6e37a762a6263c279d95fee9346e1f44ca Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index f3790a6d25..455704b065 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From 34ae914b362c84ff0a96b8936beedb44a2e3f451 Mon Sep 17 00:00:00 2001
+From 7355ed2e9d0e1f38ab87f115011ab498388b4a41 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index eed9bd4..5dd6e05 100644
+index 946c7d2e..32590f6 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -104,7 +104,7 @@ endif
+@@ -118,7 +118,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index bf177cce4a..b02f8e4c08 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From bd78783254a7126d82eab26a2069b3a457b98e2e Mon Sep 17 00:00:00 2001
+From ad1bf27f823db8a48e1e64ecce2e6998e990dc41 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
-index 3a00ae0..40468fc 100644
+index cf9d4b5..f518ce2 100644
 --- a/libelf/gnuhash_xlate.h
 +++ b/libelf/gnuhash_xlate.h
-@@ -42,6 +42,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -41,6 +41,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
       words.  We must detangle them here.   */
    Elf32_Word *dest32 = dest;
    const Elf32_Word *src32 = src;
@@ -28,7 +28,7 @@ index 3a00ae0..40468fc 100644
  
    /* First four control words, 32 bits.  */
    for (unsigned int cnt = 0; cnt < 4; ++cnt)
-@@ -52,7 +53,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -51,7 +52,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
        len -= 4;
      }
  
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index a539396fd8..fd0efe595d 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From da61b483072b7b0bfac1f034ad03972f5104a410 Mon Sep 17 00:00:00 2001
+From 7b48ae456de3e2f2a94f91c800b238788d5fd277 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
-index 3594e8b..a3314e5 100644
+index 57239ee..3a640bd 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
-@@ -355,8 +355,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
+@@ -360,8 +360,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
  		     we test for the alignment of the section being large
  		     enough for the largest alignment required by a data
  		     block.  */
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index d8961f6293..21073716a0 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From b1c956cd739f364c4a80381578ddaba43e36903b Mon Sep 17 00:00:00 2001
+From efa2836719b669c3200a615898627f6b6a4dd570 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -56,7 +56,7 @@ index f771b92..263de62 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 403e0f6..738e948 100644
+index 20cc8a2..2ce52e8 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
@@ -74,7 +74,7 @@ index 403e0f6..738e948 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index d70053d..b8a6ff3 100644
+index 5585b0e..adc39a3 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -51,6 +51,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/0004-aarch64-Recognize-SHT_AARCH64_ATTRIBUTES.patch b/meta/recipes-devtools/elfutils/files/0004-aarch64-Recognize-SHT_AARCH64_ATTRIBUTES.patch
deleted file mode 100644
index 34c96a7942..0000000000
--- a/meta/recipes-devtools/elfutils/files/0004-aarch64-Recognize-SHT_AARCH64_ATTRIBUTES.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From: Mark Wielaard <mark@klomp.org>
-To: elfutils-devel@sourceware.org
-Cc: Mark Wielaard <mark@klomp.org>
-Subject: [PATCH] aarch64: Recognize SHT_AARCH64_ATTRIBUTES
-Date: Tue, 24 Feb 2026 22:32:26 +0100   [thread overview]
-Message-ID: <20260224213226.3212482-1-mark@klomp.org> (raw)
-
-Recognize SHT_AARCH64_ATTRIBUTES. This is enough to stop elflint
-complaining about unknown section types. But doesn't implement parsing
-the attributes.
-
-        * backends/aarch64_symbol.c (aarch64_section_type_name):
-        New function.
-        * backends/aarch64_init.c (aarch64_init): Hook
-        section_type_name.
-
-Upstream-Status: Submitted [https://inbox.sourceware.org/elfutils-devel/20260224213226.3212482-1-mark@klomp.org/]
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
-diff --git a/backends/aarch64_init.c b/backends/aarch64_init.c
-index bed929548dcd..c61767d56636 100644
---- a/backends/aarch64_init.c
-+++ b/backends/aarch64_init.c
-@@ -54,6 +54,7 @@ aarch64_init (Elf *elf __attribute__ ((unused)),
-   HOOK (eh, dynamic_tag_check);
-   HOOK (eh, data_marker_symbol);
-   HOOK (eh, abi_cfi);
-+  HOOK (eh, section_type_name);
-
-   /* X0-X30 (31 regs) + SP + 1 Reserved + ELR, 30 Reserved regs (34-43)
-      + V0-V31 (32 regs, least significant 64 bits only)
-diff --git a/backends/aarch64_symbol.c b/backends/aarch64_symbol.c
-index 15e0805b7604..af9322fda561 100644
---- a/backends/aarch64_symbol.c
-+++ b/backends/aarch64_symbol.c
-@@ -134,3 +134,21 @@ aarch64_dynamic_tag_check (int64_t tag)
-	  || tag == DT_AARCH64_PAC_PLT
-	  || tag == DT_AARCH64_VARIANT_PCS);
- }
-+
-+/* Return symbolic representation of section type.  */
-+const char *
-+aarch64_section_type_name (int type,
-+			   char *buf __attribute__ ((unused)),
-+			   size_t len __attribute__ ((unused)))
-+{
-+  switch (type)
-+    {
-+#ifndef SHT_AARCH64_ATTRIBUTES
-+#define SHT_AARCH64_ATTRIBUTES 0x70000003
-+#endif
-+    case SHT_AARCH64_ATTRIBUTES:
-+      return "AARCH64_ATTRIBUTES";
-+    }
-+
-+  return NULL;
-+}
---
-2.52.0
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index 6b83fa4662..ebf1d3f4c2 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From 74dad3295f2b8dc06b7e6bb876bc4541e927ef47 Mon Sep 17 00:00:00 2001
+From eeafa586990429f440eb2dbd9b4231edff6ae904 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -21,10 +21,10 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0670e01..14f3e36 100644
+index 80c7fd8..3e31485 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -43,7 +43,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2025 The elfutils developers.])
+@@ -43,7 +43,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2026 The elfutils developers.])
  AC_PREREQ(2.69)			dnl Minimum Autoconf version required.
  
  dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
@@ -34,20 +34,20 @@ index 0670e01..14f3e36 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 00ba754..6be7dd6 100644
+index 9a00541..946c7d2e 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -937,3 +937,5 @@ check: check-am coverage
+@@ -943,3 +943,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
 +oecheck:
 +	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
 diff --git a/tests/test-subr.sh b/tests/test-subr.sh
-index ea80cbe..7632d20 100644
+index 623b5b7..5bac66c 100644
 --- a/tests/test-subr.sh
 +++ b/tests/test-subr.sh
-@@ -92,12 +92,6 @@ installed_testrun()
+@@ -95,12 +95,6 @@ installed_testrun()
    program="$1"
    shift
    case "$program" in
-- 
2.47.3


