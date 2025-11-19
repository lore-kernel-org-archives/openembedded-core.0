Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC59CF58F8
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:41 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17209.1763584945917377696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XPJHaeBD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29586626fbeso2025905ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584945; x=1764189745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63p2fjl83WAe62P8/MeeNXLaZwMfD46zit7jYYqWLRc=;
        b=XPJHaeBD7BEAIVVGksFELQUPu5Ft730Fz/DMBJyboYfNBdJNsJVxsPrqDZf2CYxTDq
         w4ISsfs0VP6tkqKPbIxk2AtHMpfp6sgFNL7mo9ZXIm46nsRK+ef0ON5nuKligGxHF1gs
         7ET2kJbFohUAstOsfT1oc13QvP0WZtOVN0iAdAow12w0+9N8seSEtPoxbPo/ziYyu0l6
         YZLPLLvnx25SbJBC0O61Z169yWKYz3V7EiURVGJRc/W7WaTi1tKuHGUn4jcLFJ8kfthO
         ER+6QaeQpNjdmz2PGVhLo7UMQUg1Lgb5bJxqKoDw0Q9PxAU2SozWuHtN+7T39DE2qkC1
         IKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584945; x=1764189745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=63p2fjl83WAe62P8/MeeNXLaZwMfD46zit7jYYqWLRc=;
        b=DLEqpEs8XSGTXeGwxfkqc8uUObMA5cw94/cVuogZO6LA9fVcL3Tc8oamDLQoR2pioF
         iP0omi5f044dponL6zA0TiXbZ9a8qwK2PrEwbI+GauMNILGhNNBEDUqXI0oBcOHC/vr1
         T5/Q22xc+Q8anv99XgF46M7WrT2OahqJUI6i8lBay0dRJXv1oYd7JwogPOiFYnIaAlvm
         1/3HxuYZKYV4a6atcU10/Z2iAqbupErHJM/hq5xpPaU1RfYOHRZIM4l942uGvcH3hBLe
         /fPtJrbFxkhzPlk0NfnKpM6sp7rmMd9Z7Nos0aLCKmllxm97NhoAfWvqH/7eGRbI+RLk
         57Qw==
X-Gm-Message-State: AOJu0YyLToYhfFQepqAKSjUinQJtds1KWF9pBJ7hGa/wSEILwK4UFI6W
	Oept0SVa+grRzXbK3O1nClN5LR154Wms8axWlXh53kqobqp1YQtPV+O0GpgatcdgEHTbCEj9SBU
	uhT/T
X-Gm-Gg: ASbGncsgV78f2i/nCK/HiPI9KAx1BBIwuEa9Q2EAUu+0CqPvm0TAYS037UIFzqe0cLI
	GxVH9LXruK/K7vFfRFvf9f2qFs0GXuLvlhQvxFdwqDnfibk96i65IP7Bmq+Dz31T0iphgrqYL1w
	dHRSvivvE6FLAeWT9vACDFN9hLUo8j4yJeyOKVTOdhy5v6I5H8VAmathwi/TsiXMaCX8x9dS/8h
	J84XF9h6SWAP/lhjP7znoyfMq5nPC7ebSSANXv7oDYcdRC6AbXPrBGfMl3vyNBFTsXXpdSSBBbk
	dqiViQXiShpAfAFmdy6bTMZc7nHqfFEcCkLy5/dsrcB90cCREDQDVTzbbsVmuY+dWokCcacaGkv
	mCCN2RjVwVFC4Pw4K+wmxtG4XiWGNdE5CzEA7dlKyLMjg3ROBXk0VVhG9gZwgydwPQpbg55oQYb
	uBOsK4LriGmvQ2
X-Google-Smtp-Source: AGHT+IGjB/3jGlj2pa6vXxMxf8+yeVfYmJKxNs4XRuxmue7T4/jMo4wq6INo31PRu1OXIx379cUs4A==
X-Received: by 2002:a17:903:19d0:b0:295:f95a:5122 with SMTP id d9443c01a7336-29b5ccf7f54mr2638235ad.15.1763584945090;
        Wed, 19 Nov 2025 12:42:25 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] elfutils: Fix CVE-2025-1377
Date: Wed, 19 Nov 2025 12:42:10 -0800
Message-ID: <e4e8392e688ceb0d8e68fe48118383c031178b5e.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763584791.git.steve@sakoman.com>
References: <cover.1763584791.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226592

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability, which was classified as problematic, has been found in GNU elfutils
0.192. This issue affects the function gelf_getsymshndx of the file strip.c of the
component eu-strip. The manipulation leads to denial of service. The attack needs to
be approached locally. The exploit has been disclosed to the public and may be used.
The identifier of the patch is fbf1df9ca286de3323ae541973b08449f8d03aba. It is
recommended to apply a patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-1377

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=fbf1df9ca286de3323ae541973b08449f8d03aba

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.186.bb                |  1 +
 .../elfutils/files/CVE-2025-1377.patch        | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index 9f0fb43d50..f97a97c673 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1376.patch \
+           file://CVE-2025-1377.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
new file mode 100644
index 0000000000..de263738f2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
@@ -0,0 +1,68 @@
+From fbf1df9ca286de3323ae541973b08449f8d03aba Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 13 Feb 2025 14:59:34 +0100
+Subject: [PATCH] strip: Verify symbol table is a real symbol table
+
+We didn't check the symbol table referenced from the relocation table
+was a real symbol table. This could cause a crash if that section
+happened to be an SHT_NOBITS section without any data. Fix this by
+adding an explicit check.
+
+       * src/strip.c (INTERNAL_ERROR_MSG): New macro that takes a
+       message string to display.
+       (INTERNAL_ERROR): Use INTERNAL_ERROR_MSG with elf_errmsg (-1).
+       (remove_debug_relocations): Check the sh_link referenced
+       section is real and isn't a SHT_NOBITS section.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32673
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2025-1377
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=fbf1df9ca286de3323ae541973b08449f8d03aba]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/strip.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/src/strip.c b/src/strip.c
+index d5b753d..0cfd8c8 100644
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -127,13 +127,14 @@ static char *tmp_debug_fname = NULL;
+ /* Close debug file descriptor, if opened. And remove temporary debug file.  */
+ static void cleanup_debug (void);
+ 
+-#define INTERNAL_ERROR(fname) \
++#define INTERNAL_ERROR_MSG(fname, msg) \
+   do { \
+     cleanup_debug (); \
+     error (EXIT_FAILURE, 0, _("%s: INTERNAL ERROR %d (%s): %s"),      \
+-	   fname, __LINE__, PACKAGE_VERSION, elf_errmsg (-1)); \
++	   fname, __LINE__, PACKAGE_VERSION, msg); \
+   } while (0)
+ 
++#define INTERNAL_ERROR(fname) INTERNAL_ERROR_MSG(fname, elf_errmsg (-1))
+ 
+ /* Name of the output file.  */
+ static const char *output_fname;
+@@ -632,7 +633,13 @@ remove_debug_relocations (Ebl *ebl, Elf *elf, GElf_Ehdr *ehdr,
+ 	     resolve relocation symbol indexes.  */
+ 	  Elf64_Word symt = shdr->sh_link;
+ 	  Elf_Data *symdata, *xndxdata;
+-	  Elf_Scn * symscn = elf_getscn (elf, symt);
++	  Elf_Scn *symscn = elf_getscn (elf, symt);GElf_Shdr symshdr_mem;
++          GElf_Shdr *symshdr = gelf_getshdr (symscn, &symshdr_mem);
++          if (symshdr == NULL)
++            INTERNAL_ERROR (fname);
++          if (symshdr->sh_type == SHT_NOBITS)
++            INTERNAL_ERROR_MSG (fname, "NOBITS section");
++
+ 	  symdata = elf_getdata (symscn, NULL);
+ 	  xndxdata = get_xndxdata (elf, symscn);
+ 	  if (symdata == NULL)
+-- 
+2.40.0
+
-- 
2.43.0


