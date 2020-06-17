Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.4360.1592388969721558726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K8VVze3A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h5so1707626wrc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Frn4SRNcsrUbXzeJnlCaxOhLrkRf34WtGzl+AhOnww=;
        b=K8VVze3A1WkraDNhxyPLdnvp9ya5g2Q7MrE0i6sOnUm6p8gE2cXOrjQTVX62tZwRZS
         TqT59M19HM1ydrgqu/a2Pgoq/ZI+dwNJ4d6wmgxeQVr+9V+n2JrZejIGYmiw3K3nS/Gg
         yidQGa8wWSA54AcePxyv1CHAWhcao2l+o8jUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Frn4SRNcsrUbXzeJnlCaxOhLrkRf34WtGzl+AhOnww=;
        b=I1vwKiYjee7wh7NhMcRQZEZ/86au0cPb6ZoapKGsVFXZYBxlEBYNa7OdCYS9MeKRp3
         8m7sb4OmUu1U/2t0W+8otCpbJm3oiWKi27sqR3mpZAYAyV0lsWrQm/fIB7MHiv4nNzlp
         mxm4NyV21H7NDQlPCOYj6T0yxk46daFXTTSLYTyY1nSSlyV3PyR/QaIwshlvIWbEyA9P
         sAmSUUvQ6+R0gSfc4i7jz3CztaNSUk8SciFvUusX0TPz/44LotverVGgFAB6FnkVJRq8
         vxgR3UoakbRg/nqawjuRH/xX1jTZMEiP4Q/IjeFqQM92WNHMH8N60o7bcneLAlDELYYx
         i0bw==
X-Gm-Message-State: AOAM533KehNzwLhW/xmp6NrQImwL++10f3ZsyvipoZXp1FWsLx2lR8c6
	iWKDVeFrVcBCOy8dQ/t0m3bnAcP2PR96fA==
X-Google-Smtp-Source: ABdhPJwwkoXCIoqoOGmYJorlaQxJ/dLhlWSck4i44KjiRXSRHRsnYcWZrznP6d7Q0OjYzDPXLLx1+Q==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr7491526wrq.242.1592388967428;
        Wed, 17 Jun 2020 03:16:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o10sm32340300wrj.37.2020.06.17.03.16.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:16:06 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Upgrade 0.10 -> 0.11
Date: Wed, 17 Jun 2020 11:16:05 +0100
Message-Id: <20200617101605.406388-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two patches were merged upstream, the other needed refreshing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/fix-adjusting-startPage.patch    | 45 -------------------
 .../patchelf/patchelf/fix-phdrs.patch         | 37 ---------------
 .../patchelf/handle-read-only-files.patch     | 18 ++++----
 .../{patchelf_0.10.bb => patchelf_0.11.bb}    |  4 +-
 4 files changed, 11 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.10.bb => patchelf_0.11.bb} (73%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch b/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
deleted file mode 100644
index a0988423fee..00000000000
--- a/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1630d3f846c7721b1e7cd3b005bb2b34816e1d0f Mon Sep 17 00:00:00 2001
-From: Ed Bartosh <ed.bartosh@linux.intel.com>
-Date: Fri, 21 Jul 2017 12:33:53 +0300
-Subject: [PATCH] patchelf: fix segfault for binaries linked by gold
-
-commit 1cc234fea5600190d872329aca60e2365cefc39e
-
-fix adjusting startPage
-
-startPage is adjusted unconditionally for all executables.
-This results in incorrect addresses assigned to INTERP and LOAD
-program headers, which breaks patched executable.
-
-Adjusting startPage variable only when startOffset > startPage
-should fix this.
-
-This change is related to the issue NixOS#10
-
-Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
-Github PR: https://github.com/NixOS/patchelf/pull/127
-
-Upstream-Status: Submitted
-
----
- src/patchelf.cc | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index a63e3a11c61f..2483d25d78f1 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -756,10 +756,8 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
-        since DYN executables tend to start at virtual address 0, so
-        rewriteSectionsExecutable() won't work because it doesn't have
-        any virtual address space to grow downwards into. */
--    if (isExecutable) {
--        if (startOffset >= startPage) {
--            debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
--        }
-+    if (isExecutable && startOffset > startPage) {
-+        debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
-         startPage = startOffset;
-     }
- 
diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
deleted file mode 100644
index d087bd7855c..00000000000
--- a/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-When running patchelf on some existing patchelf'd binaries to change to longer 
-RPATHS, ldd would report the binaries as invalid. The output of objdump -x on 
-those libraryies should show the top of the .dynamic section is getting trashed,
-something like:
-
-0x600000001 0x0000000000429000
-0x335000 0x0000000000335000
-0xc740 0x000000000000c740
-0x1000 0x0000000000009098
-SONAME libglib-2.0.so.0
-
-(which should be RPATH and DT_NEEDED entries)
-
-This was tracked down to the code which injects the PT_LOAD section.
-
-The issue is that if the program headers were previously relocated to the end 
-of the file which was how patchelf operated previously, the relocation code 
-wouldn't work properly on a second run as it now assumes they're located after 
-the elf header. This change forces them back to immediately follow the elf
-header which is where the code has made space for them.
-
-Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/202]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-RP 2020/6/2
-
-Index: git/src/patchelf.cc
-===================================================================
---- git.orig/src/patchelf.cc
-+++ git/src/patchelf.cc
-@@ -762,6 +762,7 @@ void ElfFile<ElfFileParamNames>::rewrite
-     }
- 
-     /* Add a segment that maps the replaced sections into memory. */
-+    wri(hdr->e_phoff, sizeof(Elf_Ehdr));
-     phdrs.resize(rdi(hdr->e_phnum) + 1);
-     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
-     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
index 03b0d18a89f..bf721c1af86 100644
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -14,30 +14,32 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  src/patchelf.cc | 16 +++++++++++++++-
  1 file changed, 15 insertions(+), 1 deletion(-)
 
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 0b4965adff83..b5db2aef0e8a 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -497,7 +497,17 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -499,9 +499,19 @@ void ElfFile<ElfFileParamNames>::sortShd
  
  static void writeFile(std::string fileName, FileContents contents)
  {
--    int fd = open(fileName.c_str(), O_TRUNC | O_WRONLY);
 +    struct stat st;
 +    int fd;
 +
+     debug("writing %s\n", fileName.c_str());
+ 
+-    int fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
 +    if (stat(fileName.c_str(), &st) != 0)
 +        error("stat");
 +
 +    if (chmod(fileName.c_str(), 0600) != 0)
 +        error("chmod");
 +
-+    fd = open(fileName.c_str(), O_TRUNC | O_WRONLY);
++    fd = open(fileName.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0777);
 +
      if (fd == -1)
          error("open");
  
-@@ -511,6 +521,10 @@ static void writeFile(std::string fileName, FileContents contents)
+@@ -515,6 +525,10 @@ static void writeFile(std::string fileNa
  
      if (close(fd) != 0)
          error("close");
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.11.bb
similarity index 73%
rename from meta/recipes-devtools/patchelf/patchelf_0.10.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.11.bb
index 84e640773b2..ba7ad404e93 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.11.bb
@@ -1,13 +1,11 @@
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
-           file://fix-adjusting-startPage.patch \
-           file://fix-phdrs.patch \
            "
 
 LICENSE = "GPLv3"
 SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 
-SRCREV = "e1e39f3639e39360ceebb2f7ed533cede4623070"
+SRCREV = "d6b2a72d9ec3bdfde4b1aacdada823ce388968bb"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

