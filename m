Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB05EC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 14:15:25 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.104709.1673360124387078659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 06:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RgpqXtgm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v2so891186wrw.10
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqig4wKuGf3hWXTPdu0lO13FhWbaVHRS6ftAF3eI8P0=;
        b=RgpqXtgmKdGIO/6oE517HmhsDGvnYnfmz+tf7ewwnJ/qpRWvq3NRy6SA7MLpa6bMB+
         tzTe/EXXsprTDfYerbEp4T6YRxyug0r9tjj9u3vgxAQbRGSv7Lkxngs6HuOto6+9RZ5O
         scJ+NkXY4fd7OZpgXQ04N/u4LrC5/98VQh/g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqig4wKuGf3hWXTPdu0lO13FhWbaVHRS6ftAF3eI8P0=;
        b=rSitj+oWeu22KM2tlbyhwz/h1yv5th6yHp83Bfjr0qZ6tDXmquSoOGwftDNHcseod3
         l6yJS2prQJejeVKpQw42i0e7k4JZrCBhxBI6qM/lp28dPU9P6aqjofaQYB5jNXVajpo7
         FQi7F2Z64sPgdQm4KEXjP7DRBdVvyltZnXJa4j9x+RsRuv9jq34NZAyjM11IvhewlOhj
         yfpgYzCzroUohfZHn6CasxrTkEvOWt/AOj8VI9JyZCM8UhgNH+d3r05ey+MdcB4nH7/V
         I00/e0V4RVMJJZ0+ickLMiRyfxyWSq7bKiFu9xJmO5HtmCyIgMxSz+3mUPiU5bV83zq1
         qRdA==
X-Gm-Message-State: AFqh2kruStvtwnSyu4tkuW2zMd70dNif6DZp1JAmeL64SwCrwd0fMAKl
	zyCd6Te9ZtR9Y0KNBMEg/rwhG1i4a4BrVbqi
X-Google-Smtp-Source: AMrXdXvo+2MFstUZRzZGseb9L6nuDvWsCW3pO3N+3dvxa1803RQl5YER9AIGaF6029pzVL9d0fIXhw==
X-Received: by 2002:a5d:6dc4:0:b0:2b4:e5e:1e16 with SMTP id d4-20020a5d6dc4000000b002b40e5e1e16mr12148882wrz.35.1673360122188;
        Tue, 10 Jan 2023 06:15:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef35:464f:aac3:7a])
        by smtp.gmail.com with ESMTPSA id m10-20020a056000008a00b002683695bf97sm11194577wrx.58.2023.01.10.06.15.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:15:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Add fix submitted upstream for uninative segfaults
Date: Tue, 10 Jan 2023 14:15:20 +0000
Message-Id: <20230110141520.1462138-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 14:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175713

The new uninative tarball is segfaulting in quilt (the underlying
patch binary). We see errors in dmesg like:

(patch): Uhuuh, elf segment at 0000000000400000 requested but the memory is mapped already

This patch submitted to patchelf upstream looks like an appropriate fix
for that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...b4f9ab8d564904c292099a022ffb3cccd52d.patch | 104 ++++++++++++++++++
 .../patchelf/patchelf_0.17.0.bb               |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch b/meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch
new file mode 100644
index 00000000000..6296f0e44b1
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch
@@ -0,0 +1,104 @@
+From 8d2cb4f9ab8d564904c292099a022ffb3cccd52d Mon Sep 17 00:00:00 2001
+From: Jason <otherjason@nodomain.com>
+Date: Fri, 2 Dec 2022 10:01:41 -0500
+Subject: [PATCH] Fix bug in file shifting that could cause conflicting PT_LOAD
+ segments
+
+When a section in the file needs to be enlarged (e.g. to accommodate
+setting a larger RPATH), shiftFile() is used to shift all content
+following the growing section to a later position in the file.
+
+Commit 109b771f53ee3d37ede8c0f165665605183c0975 introduced logic to
+ensure that, after the segment split, no sections span multiple
+segments. This is done by sliding the portion of the segment after the
+split point later in the file, then adding a new PT_LOAD segment that
+contains the preceding data plus the extra room that is being added. The
+existing implementation does this by simply adding
+`extraPages*getPageSize()` bytes to the number of bytes ahead of the
+split point in the segment.
+
+However, this approach can result in two PT_LOAD segments that overlap
+when page boundaries are taken into account. As an example, this PT_LOAD
+section (taken from a Python 3.10 binary):
+
+LOAD           0x0000000000000000 0x0000000000400000 0x0000000000400000
+               0x0000000000000948 0x0000000000000948  R E    0x200000
+
+is split into the following two sections:
+
+LOAD           0x0000000000000000 0x00000000003ff000 0x00000000003ff000
+               0x0000000000001594 0x0000000000001594  R E    0x1000
+LOAD           0x0000000000001594 0x0000000000400594 0x0000000000400594
+               0x00000000000003b4 0x00000000000003b4  R E    0x1000
+
+Note that the two PT_LOAD sections both contain the memory page at
+address 0x400000. The Linux kernel's ELF loader (at least as of v4.18)
+does not accept this as a valid ELF executable, triggering a segfault
+with si_code=SI_KERNEL immediately when the binary is executed.
+
+The fix here is to set the length of the segment that comes before the
+split point more carefully; instead of adding `extraPages*getPageSize()`
+bytes to the portion of the segment that came before the split, the
+actual number of padding bytes that were needed (before rounding up to
+the next multiple of the page size) are used. This avoids the overlap
+in the PT_LOAD segments and makes the output files executable again.
+---
+ src/patchelf.cc | 10 ++++++----
+ src/patchelf.h  |  2 +-
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/447]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -432,7 +432,7 @@ static uint64_t roundUp(uint64_t n, uint
+ 
+ 
+ template<ElfFileParams>
+-void ElfFile<ElfFileParamNames>::shiftFile(unsigned int extraPages, size_t startOffset)
++void ElfFile<ElfFileParamNames>::shiftFile(unsigned int extraPages, size_t startOffset, size_t extraBytes)
+ {
+     assert(startOffset >= sizeof(Elf_Ehdr));
+ 
+@@ -508,7 +508,7 @@ void ElfFile<ElfFileParamNames>::shiftFi
+     wri(phdr.p_offset, phdrs.at(splitIndex).p_offset - splitShift - shift);
+     wri(phdr.p_paddr, phdrs.at(splitIndex).p_paddr - splitShift - shift);
+     wri(phdr.p_vaddr, phdrs.at(splitIndex).p_vaddr - splitShift - shift);
+-    wri(phdr.p_filesz, wri(phdr.p_memsz, splitShift + shift));
++    wri(phdr.p_filesz, wri(phdr.p_memsz, splitShift + extraBytes));
+     wri(phdr.p_flags, PF_R | PF_W);
+     wri(phdr.p_align, getPageSize());
+ }
+@@ -898,12 +898,14 @@ void ElfFile<ElfFileParamNames>::rewrite
+         neededSpace += sizeof(Elf_Phdr);
+         debug("needed space is %d\n", neededSpace);
+ 
+-        unsigned int neededPages = roundUp(neededSpace - startOffset, getPageSize()) / getPageSize();
++        /* Calculate how many bytes are needed out of the additional pages. */
++        size_t extraSpace = neededSpace - startOffset; 
++        unsigned int neededPages = roundUp(extraSpace, getPageSize()) / getPageSize();
+         debug("needed pages is %d\n", neededPages);
+         if (neededPages * getPageSize() > firstPage)
+             error("virtual address space underrun!");
+ 
+-        shiftFile(neededPages, startOffset);
++        shiftFile(neededPages, startOffset, extraSpace);
+ 
+         firstPage -= neededPages * getPageSize();
+         startOffset += neededPages * getPageSize();
+Index: git/src/patchelf.h
+===================================================================
+--- git.orig/src/patchelf.h
++++ git/src/patchelf.h
+@@ -77,7 +77,7 @@ private:
+ 
+     void sortShdrs();
+ 
+-    void shiftFile(unsigned int extraPages, size_t sizeOffset);
++    void shiftFile(unsigned int extraPages, size_t sizeOffset, size_t extraBytes);
+ 
+     std::string getSectionName(const Elf_Shdr & shdr) const;
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb b/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
index 5faee923bfe..b32abc7b871 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.17.0.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 LICENSE = "GPL-3.0-only"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
+           file://8d2cb4f9ab8d564904c292099a022ffb3cccd52d.patch \
            "
 SRCREV = "ad0265668f12eff59027259345fed4b0f315336a"
 
-- 
2.37.2


