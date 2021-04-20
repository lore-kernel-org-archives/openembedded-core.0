Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.11488.1618928615582259439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 07:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPVZnIeL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id w4so34092532wrt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UauEbCgOYHm3IX2AKhPlMTqg6HOo3a3oU+iH2aewAk=;
        b=fPVZnIeLWiLW0MPVvWwFRy+j9dGgqE3NMdwq+sPY/kngHYJEfUv6K4aH5nuOqVRpXC
         R7be9cXEZ/fq/Xxk2noUOewqaxGTYRmOpjEibLIHD+nFTLK3aiIYexuEEHhVyHB9c7kq
         YXLx1ZcWa7rXNkKiokBizseXW8Sqr+kvtEaqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5UauEbCgOYHm3IX2AKhPlMTqg6HOo3a3oU+iH2aewAk=;
        b=XpfYDJ5B78NVG5WYMWOFPfFjYBmTqZsygQbxS7GbFFjXPLgB0g9uZnlX4JAX6Wi0qz
         gxZf2G2MBKFsQRunjCsdG+X/+kUA6Ex8d+TAvK9dq18gb/wpr6xgdE3XDUeBDcV0BKZL
         U5XlNPFj5u8rJ4tgiiN31MYTLbHF0rActpeXbMnXpZVwssWahauv5E+tFG/TDNLKb5Kt
         mtNkidFw0aRoMYpVXkZKepwFvFw9/bmgANP4/RCxwQR427cN87f0a80PGK/uUAaOnkVL
         Oe0qEUlqrHkcFJvWVzhqRO5rJjRaS5k6HTbiFagJj8jBC87LyJMqBMR7ijZfy3oIffes
         WSVA==
X-Gm-Message-State: AOAM530x171U0PBlXDSoVjlguT2h/AXudhXknGNJpTBPqh8Joycy/tW8
	fnFoQ/c928PbGHeNXtp7QpsLnoOcWm7o2g==
X-Google-Smtp-Source: ABdhPJyI0KvIz8LaVhrFyTFA+5/35aPefxJLAJRs2jZrnNGjzVBkZff0Xx5oJV8qXEZTUgbCUh2FRg==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr21296417wrw.108.1618928613885;
        Tue, 20 Apr 2021 07:23:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e28b:7bcb:6782:eaf2])
        by smtp.gmail.com with ESMTPSA id n18sm21327518wrw.11.2021.04.20.07.23.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 07:23:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Backport fix from upstream for note section overlap error
Date: Tue, 20 Apr 2021 15:23:33 +0100
Message-Id: <20210420142333.1518359-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch from upstream to fix an error:
patchelf: cannot normalize PT_NOTE segment: non-contiguous SHT_NOTE sections

seen on our ubuntu1604 autobuilder worker.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...c83653ce1b5fc201ff6db93b966394766814.patch | 44 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch b/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
new file mode 100644
index 00000000000..ba35ec6ffcd
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
@@ -0,0 +1,44 @@
+From 6edec83653ce1b5fc201ff6db93b966394766814 Mon Sep 17 00:00:00 2001
+From: rmnull <rmnull@users.noreply.github.com>
+Date: Tue, 18 Aug 2020 20:22:52 +0530
+Subject: [PATCH] mark phdrs synced with sections, avoid rechecking it when
+ syncing note sections to segments.
+
+This also serves as a bug fix when a previously synced note segment
+overlaps with another section and creates a false alarm.
+
+Upstream-Status: Backport
+---
+ src/patchelf.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 05ec793..622f0b6 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -669,6 +669,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
+             memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
+     }
+ 
++    std::set<unsigned int> noted_phdrs = {};
+     for (auto & i : replacedSections) {
+         std::string sectionName = i.first;
+         auto & shdr = findSection(sectionName);
+@@ -721,7 +722,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
+                 shdr.sh_addralign = orig_shdr.sh_addralign;
+ 
+             for (unsigned int j = 0; j < phdrs.size(); ++j)
+-                if (rdi(phdrs[j].p_type) == PT_NOTE) {
++                if (rdi(phdrs[j].p_type) == PT_NOTE && noted_phdrs.find(j) == noted_phdrs.end()) {
+                     Elf_Off p_start = rdi(phdrs[j].p_offset);
+                     Elf_Off p_end = p_start + rdi(phdrs[j].p_filesz);
+                     Elf_Off s_start = rdi(orig_shdr.sh_offset);
+@@ -739,6 +740,8 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
+                     phdrs[j].p_offset = shdr.sh_offset;
+                     phdrs[j].p_vaddr = phdrs[j].p_paddr = shdr.sh_addr;
+                     phdrs[j].p_filesz = phdrs[j].p_memsz = shdr.sh_size;
++
++                    noted_phdrs.insert(j);
+                 }
+         }
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 95886c6d3a9..2eb09aee321 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -6,6 +6,7 @@ LICENSE = "GPLv3"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
+           file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
            "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
-- 
2.30.2

