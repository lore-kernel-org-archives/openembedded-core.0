Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88629CDB484
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:47 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.284611.1697644118927567994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PrWphhW2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27d153c7f00so4748784a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644118; x=1698248918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tznH4Gebv6sfJMxVLrm9Nu+49JZpPrKx6/OQvRFK7ec=;
        b=PrWphhW2xENZ3Bz1UT+A/6Klss7l89mH5zMdQ2KJtZkovdQN1AwmFakQSQBnOdrk4F
         C793oBH5jYCAk9EZih3FFDTnVRCfp/iV5Jvv4cxltTTdG9m74ElGPgnGfFzM2vqgUaN+
         VdRgvbYm7blLw+LBNUgcIH6v6meRpkAVnXVHqQ7Zb+7OOxVhPxX3J/haSOhAQlAxlReo
         RfORsXxTPUlc+Z822TAnivMhe5pyx4xK81u7aZz7/bheSFpWuX9c1HXZmTw1fc5kYvOt
         jchQgeoQHoFsOyPR1iXiSVVnSId8OkSDAv7jYalusdUrp/pa6WIQHzGga1pSXEnKEQSY
         99QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644118; x=1698248918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tznH4Gebv6sfJMxVLrm9Nu+49JZpPrKx6/OQvRFK7ec=;
        b=moWI3G7D4aHz8WuvcMO6CVxSBkZpBII0Dlcfq/iduEMWB9+n0T1fCo3Oxr2HMvi4FA
         Sw4oXTn2kTSUoULvB4PX7Ttj+wbaOuj745/Mg+LwjVHN2SgAPULt6rOSVyVym2sQ0RNp
         r3+p0UtWH/H6Uupb5izqUHSzJviWMDl0W6AIZGuvIYPs2t/o/qTxUkyhiI3RRHKXTYBF
         iKz07fhNZ3Bq27AY8JFaDNBPYj6qAYLroC0FEu9LlLNz61Dbn7FCUBs0oGP0OcG953P6
         B2GDIo9ZYvK6tjQQluQaXXADb1PEAx+ce8XuNR5yJGV6oBq6T+SEsMcoO580W/DFar5H
         Q2uw==
X-Gm-Message-State: AOJu0YxV5Pm7710prE3iNVv2Dzz+VWFE/hbKV7i1JMFmXGjgzInzdGEg
	YQnjm159IP2wlHVrypjCEgWZnEMIJkEbtyNdYXY=
X-Google-Smtp-Source: AGHT+IEXVmnUsNLc4liGMRQqeONaUbVm2PqeZHGJRqhUWx+omzVXtprf+UbYyaC60SnTVgMvdn6dpg==
X-Received: by 2002:a17:90a:5893:b0:27d:5679:9fa1 with SMTP id j19-20020a17090a589300b0027d56799fa1mr5617251pji.17.1697644118006;
        Wed, 18 Oct 2023 08:48:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] binutils: Fix CVE-2022-47695
Date: Wed, 18 Oct 2023 05:48:20 -1000
Message-Id: <4d4732c2e295fea610d266fa12bae3cc01f93dfa.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189400

From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3d3af4ba39e892b1c544d667ca241846bc3df386]

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0031-CVE-2022-47695.patch        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 0964ab0825..da444ed1ba 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -62,5 +62,6 @@ SRC_URI = "\
      file://0030-CVE-2022-44840.patch \
      file://0031-CVE-2022-45703-1.patch \
      file://0031-CVE-2022-45703-2.patch \
+     file://0031-CVE-2022-47695.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch
new file mode 100644
index 0000000000..f2e9cea027
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2022-47695.patch
@@ -0,0 +1,58 @@
+From 2f7426b9bb2d2450b32cad3d79fab9abe3ec42bb Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 4 Dec 2022 22:15:40 +1030
+Subject: [PATCH] PR29846, segmentation fault in objdump.c compare_symbols
+
+Fixes a fuzzed object file problem where plt relocs were manipulated
+in such a way that two synthetic symbols were generated at the same
+plt location.  Won't occur in real object files.
+
+	PR 29846
+	PR 20337
+	* objdump.c (compare_symbols): Test symbol flags to exclude
+	section and synthetic symbols before attempting to check flavour.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3d3af4ba39e892b1c544d667ca241846bc3df386]
+
+CVE: CVE-2022-47695
+
+Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
+---
+ binutils/objdump.c | 23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 08a0fe521d8..21f75f4db40 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -1165,20 +1165,17 @@ compare_symbols (const void *ap, const void *bp)
+ 	return 1;
+     }
+ 
+-  if (bfd_get_flavour (bfd_asymbol_bfd (a)) == bfd_target_elf_flavour
++  /* Sort larger size ELF symbols before smaller.  See PR20337.  */
++  bfd_vma asz = 0;
++  if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0
++      && bfd_get_flavour (bfd_asymbol_bfd (a)) == bfd_target_elf_flavour)
++    asz = ((elf_symbol_type *) a)->internal_elf_sym.st_size;
++  bfd_vma bsz = 0;
++  if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0
+       && bfd_get_flavour (bfd_asymbol_bfd (b)) == bfd_target_elf_flavour)
+-    {
+-      bfd_vma asz, bsz;
+-
+-      asz = 0;
+-      if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+-	asz = ((elf_symbol_type *) a)->internal_elf_sym.st_size;
+-      bsz = 0;
+-      if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+-	bsz = ((elf_symbol_type *) b)->internal_elf_sym.st_size;
+-      if (asz != bsz)
+-	return asz > bsz ? -1 : 1;
+-    }
++    bsz = ((elf_symbol_type *) b)->internal_elf_sym.st_size;
++  if (asz != bsz)
++    return asz > bsz ? -1 : 1;
+ 
+   /* Symbols that start with '.' might be section names, so sort them
+      after symbols that don't start with '.'.  */
-- 
2.34.1


