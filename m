Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46A3CCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.9354.1761659193136208852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zyfpYkBb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26e68904f0eso64631375ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659192; x=1762263992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBxWFGkS0l0lhN6tGr++gCo5vVTFWdqpxlJ7/HD9sNI=;
        b=zyfpYkBbncIwVZeFrTN2Q0MQkQwp1Qc2ghgTZhpHStcuv50HLDdK0XK+EYaaoJG4s2
         QGrBOLCsypvVcN8iQzreqqQR4VNQAvk8C3sZBGUY64wuWswUk4dGJAs2ET16/+nVcR0o
         yE2mFc2T3HDwNNcw01A0+aVxFu0jhMl7wY7r05eIYXFEwxOSjXMwgEb1pT4jdgepi7hi
         9VKB3mIMIxs69zM3BQvK6+6wtGFVP5SbYTunPwryBAu+LLk0ULHkT2siEiDHV/yOo8AH
         fcO8SKNV21/xeDs3M3bnSFqjCB/KJtdgZ4KeR7VgfSwossho3z5NXR2MYXJlRyn/3QQs
         Solg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659192; x=1762263992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBxWFGkS0l0lhN6tGr++gCo5vVTFWdqpxlJ7/HD9sNI=;
        b=Tb92sV/6u4zHB+Kd6IfyCECEH2GkYNtSBfl4st0UE4SgmlnTGDRXwnZKR7lTmjq/Y6
         bXHgNy079apSjZMkGkdIxJbZ4LmrQ5/HkX7y5qy7Q8b//21bAspRJ2sQSN7l26PA6ljP
         qAcrWBq/YQs3vmpTKu4x3L/dtuLK941jNImG1rSD4m2hwNFD/WfR5y3JKJgvFaTiphTD
         P0aysykCqZQxx3uX68hipL7BKaVDPMf1+smBmCWVtVbi+LgociM0VTh4LOfhUiuSoP4o
         zLfXwXF4XqjhjzZ6KQ5tNgkyQzq+sVjoZNNjbvgzuZeRVEQfhj1z0qyy/hpxASZfbBjP
         Hf5g==
X-Gm-Message-State: AOJu0YwWbpVI8poORAOvK9o2oA9VzSKfy5qbb8eIkRv1Txh9DZyE+GUN
	50fR/r3OZz3QkJrgChTgOm6HIxEaTx5l++8TgJSHMbMozjQckVIZwwHtFWN5gbsinIIJNqyykd8
	gMdcDZb8=
X-Gm-Gg: ASbGncvw4vYgFQMGu35WnUEIdBAgtMP2kFPKLTRDY5NcmNmMMp1ZJW1agfk5oTiDK8M
	sjj0jrDNh/IEezY78qYGv94i+46x8Iecsl8SxDtIPv9fyfDADnd3s3uarKglEwfepNGdKh1JWK3
	n0+lgGuGnmLLKCZjlgakzt6U58F31bnLeK4aND/2As/pWCZnYAogppeVgby4BdRvcBkCRAoksW0
	mLiaGhv1ZjfWEwpuVg7e52sIiQlrF8L1I8xKGBQvTYVyz9b2HLwoipr0Pgyh8UA20jSliAVtASE
	qohKuRLz+yoE98J5MEYAWf9UVTUh2yVyZ5o0uIbXGmp3grdcueDwoG4Vgow/L/9Kcd1NZGTkssn
	ApjPz9ABDwDyMiNpqwSVEP3fv5ztWl7TI93cLSYk/hpf1sKMBFHJUfOVTsp5bbHYQDmHeTj34xJ
	WRLw==
X-Google-Smtp-Source: AGHT+IHP7UI72a4Dcn4yNWhytNzHqdUyL9lvXheDW6rOofcaJ26XAEEzIa8EoZV/eojVNAl263kj5Q==
X-Received: by 2002:a17:902:d4cc:b0:28a:8ae7:4034 with SMTP id d9443c01a7336-294cb3d0b60mr46284815ad.25.1761659192224;
        Tue, 28 Oct 2025 06:46:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] elfutils: Fix CVE-2025-1377
Date: Tue, 28 Oct 2025 06:46:14 -0700
Message-ID: <ae89d0c2ca49c40429f787577d280b5886f42cc1.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225404

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
https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1377.patch        | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index c5f357eb93..0fd6d31af1 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1371.patch \
            file://0007-Fix-build-with-gcc-15.patch \
            file://CVE-2025-1376.patch \
+           file://CVE-2025-1377.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
new file mode 100644
index 0000000000..31a9ec33f2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
@@ -0,0 +1,69 @@
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/strip.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/strip.c b/src/strip.c
+index 6436443..16922e9 100644
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
+2.40.0
+
-- 
2.43.0


