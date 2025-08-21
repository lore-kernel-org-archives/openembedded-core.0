Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9491FCA0FE7
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.705.1755790813565917937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XKmR3dc1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-245f2a8fa81so15660455ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790813; x=1756395613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUpiTtBf0EWgnaDxV432jr4uzMFKpB+TTlnLHoTFNFE=;
        b=XKmR3dc1NJ+UbhZmewpTT75lGYgGha+AQ+00/4kK2bN6qUP3ZVPrv2wR5xc5emb/lx
         KUv4ot/FuDOg2Z8ouU7YT0TBFkoFk3Y23MTEmSnEeQ9xQdAdl58X4wrmKc69DYCPHSjy
         aEdWBuaDTPznME9nzr/iM+z3ig/nT7peSyBtFytGAiWdBaAO0m2JNV0Gsgt0WBIZl7k+
         uK4IXQBYefiUoHJLZrk1wcoH8vHfeDzwe962R5giM1onfIAS1hua7cHsZ9SG+OUrywM1
         rjK36MAK2Qj/CZMvJlE02D5PELD0udq6GecPZuMt+UnxHbeyhCvZPSWG/L4SibIBnNqF
         5R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790813; x=1756395613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUpiTtBf0EWgnaDxV432jr4uzMFKpB+TTlnLHoTFNFE=;
        b=DIJSREOtF6AZsBObqEahm9dwW+bnMzFM45CgcNUtb4G8vLCHVqe32nkTsxSDoTFHA2
         PUd9VmE/aQclxF65qI0GNy2+4Fs58AD0vKXIrczhF1zA5PdWZBC6WCf3RCLuGpB596gO
         R0gdVFN2Rbj1N+YnU6AwZCokId8oh08+Ot1WkEnoRSUfqVQWdRBvD0hLqQR9hooGhwVp
         1p3v2FsmJBtkVZ7o65u1yCZi8J+ZTVdXCxhI62zBpJT953Y6iAYOHLW2YveJ1D3EYCXv
         84gsVt/S+ogdkgvI3MQmt3zN4Tkzqg8+lWR7f+Bg5VGnC+ynxs6K/JgSZ3+nKQYSClTC
         svPg==
X-Gm-Message-State: AOJu0YyI9p+nagRROy/4Rse06Vfn73XCJIjoDIeuzBn0lvRprvBwXMm1
	ruJVtI1kG1pzYOz/WUcJEf+NtskT763QaAo0ySKdAwjT9kpX3Hu5DyrXUpq2AZRS6WHKOAN/C/U
	XFSAY
X-Gm-Gg: ASbGncswCbM41YlTF9GalwoYrTRllvpJw/6y1xZQ31eekPLpbxVQXaTJ2C3H5O3kyd2
	Sy3DwQofv8O3n4uN5ChoO7Tu2151Ip7ARI2C58lGamXSL58/EzBeWThrB6rhAsYRlEz2ceR4kmc
	nYGLLGtiyqDzegFW+JWikJtvTI4BC496JiJ7xm3ey/OPJ7kTifHgcf9p9f3vveaoGUMuFPZXvyR
	pW+XgjeF6Zt01QhjOR9cs/aK0doBjikchPLFOyLKugsGyLzpGOV3TphQDCKqzB1TEwLbatWx3Ci
	YlJ8U58LrR90n0NYliPPKAnjlgc7rEHatvbNV2QTRpl431ijH+EJQXre4sdpHhXqX9UXYfH6Mla
	+MFVbT1clyehqPA==
X-Google-Smtp-Source: AGHT+IEGDgiKbxZpE6rTXXz+4juu8krh/UeT+scy+8mnGZK6ZOWp/1I+nk/JA6osqTfL1VPYVsNpfw==
X-Received: by 2002:a17:902:d4cb:b0:237:e3bc:7691 with SMTP id d9443c01a7336-2460622198amr32929355ad.13.1755790812585;
        Thu, 21 Aug 2025 08:40:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/15] elfutils: Fix CVE-2025-1377
Date: Thu, 21 Aug 2025 08:39:47 -0700
Message-ID: <36436f0996d3a84fe6a59434dec1a92704110602.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222255

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability, which was classified as problematic, has been found in GNU elfutils
0.192. This issue affects the function gelf_getsymshndx of the file strip.c of the
component eu-strip. The manipulation leads to denial of service. The attack needs to
be approached locally. The exploit has been disclosed to the public and may be used.
The identifier of the patch is fbf1df9ca286de3323ae541973b08449f8d03aba. It is
recommended to apply a patch to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1377
https://ubuntu.com/security/CVE-2025-1377

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1377.patch        | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index f8cf083ec6..fb4109441b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1371.patch \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1376.patch \
+           file://CVE-2025-1377.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
new file mode 100644
index 0000000000..003215017f
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
+CVE: CVE-2025-1377
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/strip.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/strip.c b/src/strip.c
+index 403e0f6..2b5d057 100644
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -126,13 +126,14 @@ static char *tmp_debug_fname = NULL;
+ /* Close debug file descriptor, if opened. And remove temporary debug file.  */
+ static void cleanup_debug (void);
+ 
+-#define INTERNAL_ERROR(fname) \
++#define INTERNAL_ERROR_MSG(fname, msg) \
+   do { \
+     cleanup_debug (); \
+     error_exit (0, _("%s: INTERNAL ERROR %d (%s): %s"),			\
+-		fname, __LINE__, PACKAGE_VERSION, elf_errmsg (-1));	\
++		fname, __LINE__, PACKAGE_VERSION, msg);	\
+   } while (0)
+ 
++#define INTERNAL_ERROR(fname) INTERNAL_ERROR_MSG(fname, elf_errmsg (-1))
+ 
+ /* Name of the output file.  */
+ static const char *output_fname;
+@@ -631,7 +632,14 @@ remove_debug_relocations (Ebl *ebl, Elf *elf, GElf_Ehdr *ehdr,
+ 	     resolve relocation symbol indexes.  */
+ 	  Elf64_Word symt = shdr->sh_link;
+ 	  Elf_Data *symdata, *xndxdata;
+-	  Elf_Scn * symscn = elf_getscn (elf, symt);
++	  Elf_Scn *symscn = elf_getscn (elf, symt);
++	  GElf_Shdr symshdr_mem;
++	  GElf_Shdr *symshdr = gelf_getshdr (symscn, &symshdr_mem);
++	  if (symshdr == NULL)
++	    INTERNAL_ERROR (fname);
++	  if (symshdr->sh_type == SHT_NOBITS)
++	    INTERNAL_ERROR_MSG (fname, "NOBITS section");
++
+ 	  symdata = elf_getdata (symscn, NULL);
+ 	  xndxdata = get_xndxdata (elf, symscn);
+ 	  if (symdata == NULL)
+-- 
+2.43.2
+
-- 
2.43.0


