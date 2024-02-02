Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A71C4828D
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 01:32:35 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.13222.1706837545131120163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 17:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ky9szzjT;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2963cc5e8acso177151a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 17:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706837544; x=1707442344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T++cY/sHpK0p4n5manBwRFilXxcy2RiaVvFk8whRhmQ=;
        b=Ky9szzjTwI5Y57aLLS7pLFMYljRehnyl3iFLfPjhx9HthAga0GlqaMw/T/xT6iO3P4
         L2EeD0xGXSzuXfwFogUANxcKJxzlnye/cHZrCF9ko5YQ3Lm506qZEaIIuArbA3Txphhv
         YgGdXBJmyVn96v/u/zDpTY1hHLE6oHrkjlt9g+KxnY8s3t0ZZiLbmSVeBjS3M0fKsg0+
         UdCrGlHNHIjCEn2otm9lUKefhk7ZhBNIA90XvvL07S62JYjm1qRydySLFld8pmdf39bU
         vc2cxNGNuW1OicH+zmPAwAjQMEiyUOzPVlFHupITJKmFPs8msaTzPwP1JtAXFr1BmyH5
         GCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706837544; x=1707442344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T++cY/sHpK0p4n5manBwRFilXxcy2RiaVvFk8whRhmQ=;
        b=GFK1fZLayB8Pl+1+GhTVyirw4NhyEYlUJA9y/ArL/4OsXRP6eYHBmah0tNaEsN8mKR
         Ji+CSdelJmLzJE8rDf3o0a6C11WUAhhH34mf4vRC+Qa6/SZC9ngEfO9dfH+yXYBKfU7T
         +SKLIIa5kpcEOF2p6Tx0xad1UxH3L8RUcAXPwWg9f7mxooqf34laDtVIIL/b/s0mXWlf
         IGO5Q0xZ4tY1xDI93X6/jeKxvyJnktnUv60KMK4weVyUb7k9REoOnnMU3ZoqkUynTm08
         VCbbseb4jdXG0CAC86Y0V4WTcJeRN0B8UeLAD4wDSehBNgwGaKVAtzd+cZ9xCiKGfeNm
         IxXA==
X-Gm-Message-State: AOJu0YyHw0a1WswH/IMiAiS9FeRhWLJhC1Ol1/ER7h0Q3NHVJZM/R7v2
	TSj3nUbhcgbOfCjqkpG5zA0Y4RcNP3jZC6CTBJAj+6+kOnQ4DPUaGEH0KZnvGCo=
X-Google-Smtp-Source: AGHT+IEx9J5WkLD+v+raiP3OSrGvalx/9WYaL6bBWJjiHpG6Bdkzi62mDFBFtMz4WnY0R5brMhM7pA==
X-Received: by 2002:a17:90b:80d:b0:295:ff5a:5e4d with SMTP id bk13-20020a17090b080d00b00295ff5a5e4dmr802057pjb.20.1706837544119;
        Thu, 01 Feb 2024 17:32:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e58e])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090ac28600b002961ccd55e4sm1945121pjt.31.2024.02.01.17.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 17:32:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemtap: Backport GCC-14 related calloc fixes
Date: Thu,  1 Feb 2024 17:32:21 -0800
Message-ID: <20240202013221.365561-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 01:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194780

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-fix-build-against-upcoming-gcc-14-.patch | 40 +++++++++++++++++++
 ...d-against-upcoming-gcc-14-Werror-cal.patch | 36 +++++++++++++++++
 .../systemtap/systemtap_git.inc               |  2 +
 3 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
new file mode 100644
index 00000000000..e3d94d93123
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch
@@ -0,0 +1,40 @@
+From d42139cf9cd26d0c0363fcfe007716baeb8de517 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 22 Dec 2023 19:42:38 +0000
+Subject: [PATCH] bpf-translate.cxx: fix build against upcoming `gcc-14`
+ (`-Werror=calloc-transposed-args`)
+
+`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
+detected minor infelicity in `calloc()` API usage in `systemtap`:
+
+    bpf-translate.cxx: In function 'bpf::BPF_Section* bpf::output_probe(BPF_Output&, program&, const std::string&, unsigned int)':
+    bpf-translate.cxx:5044:39: error: 'void* calloc(size_t, size_t)' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+     5044 |   bpf_insn *buf = (bpf_insn*) calloc (sizeof(bpf_insn), ninsns);
+          |                                       ^~~~~~~~~~~~~~~~
+    bpf-translate.cxx:5044:39: note: earlier argument should specify number of elements, later size of each element
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=d42139cf9cd26d0c0363fcfe007716baeb8de517]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bpf-translate.cxx | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bpf-translate.cxx b/bpf-translate.cxx
+index 1a9302463..aa8ef65ce 100644
+--- a/bpf-translate.cxx
++++ b/bpf-translate.cxx
+@@ -5041,9 +5041,9 @@ output_probe(BPF_Output &eo, program &prog,
+ 	}
+     }
+ 
+-  bpf_insn *buf = (bpf_insn*) calloc (sizeof(bpf_insn), ninsns);
++  bpf_insn *buf = (bpf_insn*) calloc (ninsns, sizeof(bpf_insn));
+   assert (buf);
+-  Elf64_Rel *rel = (Elf64_Rel*) calloc (sizeof(Elf64_Rel), nreloc);
++  Elf64_Rel *rel = (Elf64_Rel*) calloc (nreloc, sizeof(Elf64_Rel));
+   assert (rel);
+ 
+   unsigned i = 0, r = 0;
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch
new file mode 100644
index 00000000000..22578fb3f61
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch
@@ -0,0 +1,36 @@
+From 52596f023652114642faba5726c99488529029ce Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Thu, 21 Dec 2023 10:00:06 +0000
+Subject: [PATCH] staprun: fix build against upcoming `gcc-14`
+ (`-Werror=calloc-transposed-args`)
+
+`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
+detected minor infelicity in `calloc()` API usage in `systemtap`:
+
+    staprun.c: In function 'main':
+    staprun.c:550:50: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+      550 |                 char ** new_argv = calloc(sizeof(char *),argc+2);
+          |                                                  ^~~~
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=52596f023652114642faba5726c99488529029ce]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ staprun/staprun.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/staprun/staprun.c b/staprun/staprun.c
+index 8437f3af6..d1b0b221b 100644
+--- a/staprun/staprun.c
++++ b/staprun/staprun.c
+@@ -547,7 +547,7 @@ int main(int argc, char **argv)
+            us to extend argv[], with all the C fun that entails. */
+ #ifdef HAVE_OPENAT
+         if (relay_basedir_fd >= 0) {
+-                char ** new_argv = calloc(sizeof(char *),argc+2);
++                char ** new_argv = calloc(argc+2, sizeof(char *));
+                 const int new_Foption_size = 10; /* -FNNNNN */
+                 char * new_Foption = malloc(new_Foption_size);
+                 int i;
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index bebfa7f777e..c574bcb2ba9 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -10,6 +10,8 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Makefile.am-remove-runtime-linux-uprobes-and-runtime.patch \
            file://0001-prerelease-datestamp-fixes.patch \
            file://0001-configure.ac-fix-broken-libdebuginfod-library-auto-d.patch \
+           file://0001-bpf-translate.cxx-fix-build-against-upcoming-gcc-14-.patch \
+           file://0001-staprun-fix-build-against-upcoming-gcc-14-Werror-cal.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.43.0


