Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DCDC5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 16:26:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1284.1724775969914339044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 09:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDEwifAw;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc47abc040so49736295ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775969; x=1725380769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2W6qm3K9wVwCvhPi6YzceAZSNFG+idAcoBRXzbkf008=;
        b=jDEwifAwtthvKX/0hrzOUN1H9kQxY+IG66ZpRzAcGTd+Z9FH+SMG/RDTK/snd4Qfwo
         NqvBifZREWe4Pbl4682TGoLIxevZ61959mqCe2IVFSiHAmPJdw+gnXLhxslVuKVC25zi
         atkRfzkn2oVFG1mHRzHM8xF3PmuyAIK/jeVRZFFLyntjDrjAB67PDPf9/0wrTi68LbhX
         oAvdKf+kgncNLv8PPR5Rfnq4cDqvlzRy2FWjEKdyf3st5LUoaN3kkKyzur/XeLhJ8p85
         Ih4tnHYZikiCBq/Xh8TEu/+FyTgCcwY4hdm667/2gyVVPfDtehNm1khuOlgHvjDXDSRJ
         DEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775969; x=1725380769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2W6qm3K9wVwCvhPi6YzceAZSNFG+idAcoBRXzbkf008=;
        b=SLt0QGC59E01+CTvkXCxXFC/0qv1LkNJQ4mrNIVsVDk0D4Ds+EF36KGzedqicRf3Gq
         WhBEZCIItgJmgkLiD0x1hY3fI0E9OFNe+RNPOGua59wF4xZJtn7UxOoDYhBLxWa/XJg6
         q9U5GmO0zTCPdPuu6M+wXHMiyUwQX5h2XwXnOxY6ssU2otypUDXGKfJy/M1NtRCUmIQV
         SvbmKotqzWKCooLtGVs3m9Qj3PbdBCx7BkCmz49K4zHM8d57+amm1g2pIGkZgHW4qniz
         9KvktYDXG0ajK64VMWloThFq0qklNKv5vezQSw+B8Hd/ruUqSlnalLUewgovMJfeQKiK
         XSvg==
X-Gm-Message-State: AOJu0YzYw6iexZa/p8xsWex4Ooq2YkYYixru0h7IBSpQUk7Uv0wIYZao
	y/x31ZceOJGwihNoFxTYV1vMc/fXxdWth+iwmzmo9er3mrTSNLoqi/68cg==
X-Google-Smtp-Source: AGHT+IGqC2M8S4TSo0z8BVxbC8g89v27PoQ32V5UQapWXCKTtIWl70fuXnM+AZC70lgepd8tXu1v3A==
X-Received: by 2002:a17:902:ec8c:b0:202:85e:cf56 with SMTP id d9443c01a7336-2039e4b55c6mr164556445ad.38.1724775968991;
        Tue, 27 Aug 2024 09:26:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fc70f0sm85039895ad.299.2024.08.27.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:26:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 2/3] musl: Update to 1.2.5 release
Date: Tue, 27 Aug 2024 09:26:03 -0700
Message-ID: <20240827162604.2108623-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827162604.2108623-1-raj.khem@gmail.com>
References: <20240827162604.2108623-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 16:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203855

This release adds extension functions statx and preadv2/pwritev2, with
fallback implementations for older kernels, and adds two new ports:
loongarch64 and riscv32. Minor changes to the printf family of
functions have been made for conformance to new standards
interpretations/requirements. TLSDESC support for riscv64 has also
been added.

Bugs fixed include some DNS issues related to new TCP fallback
functionality, several rare race conditions, potentially incorrect
return value when glob aborts, and several signifiant arch-specific
bugs affecting TLSDESC on arm, riscv64 icache flushing, and sh
sigsetjmp and dlsym RTLD_NEXT. [1]

Do not use https protocol for fetching

Musl author confirms that https protocol is not well supported yet on
musl git host, currently we experience this problem intermittently on
some build hosts where the fetching fails.

fatal: protocol error: bad line length character: erro
WARNING: Failed to fetch URL git://git.etalabs.net/git/musl;branch=master;protocol=https

[1] https://www.openwall.com/lists/musl/2024/03/01/2

(From OE-Core rev: c6c79477209f5e7e1a0206942de9603a7accec67)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: No change
v3: No change

 ...ic-linker-a-relative-symlink-to-libc.patch | 12 +++---
 ...ir-and-libdir-as-default-pathes-to-l.patch | 10 ++---
 ...pedefs-for-Elf64_Relr-and-Elf32_Relr.patch | 37 -------------------
 meta/recipes-core/musl/musl_git.bb            |  7 ++--
 4 files changed, 14 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch

diff --git a/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
index 8b097f32768..06ab27f0eb4 100644
--- a/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
+++ b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
@@ -1,4 +1,4 @@
-From f95b6fd0475a95c00e886219271cb5c93838e3c3 Mon Sep 17 00:00:00 2001
+From 665ecc610c261d5e98710aa0c6ccf6e4991eaf58 Mon Sep 17 00:00:00 2001
 From: Amarnath Valluri <amarnath.valluri@intel.com>
 Date: Wed, 18 Jan 2017 16:14:37 +0200
 Subject: [PATCH 1/2] Make dynamic linker a relative symlink to libc
@@ -35,7 +35,7 @@ index e8cc4436..466d9afd 100644
  install-libs: $(ALL_LIBS:lib/%=$(DESTDIR)$(libdir)/%) $(if $(SHARED_LIBS),$(DESTDIR)$(LDSO_PATHNAME),)
  
 diff --git a/tools/install.sh b/tools/install.sh
-index d913b60b..b6a7f797 100755
+index 855a8ca2..a2e6a5eb 100755
 --- a/tools/install.sh
 +++ b/tools/install.sh
 @@ -6,18 +6,20 @@
@@ -61,15 +61,15 @@ index d913b60b..b6a7f797 100755
  m) mode=$OPTARG ;;
  ?) usage ;;
  esac
-@@ -48,7 +50,7 @@ trap 'rm -f "$tmp"' EXIT INT QUIT TERM HUP
- umask 077
+@@ -49,7 +51,7 @@ umask 077
  
  if test "$symlink" ; then
+ umask 000
 -ln -s "$1" "$tmp"
 +ln $symlinkflags "$1" "$tmp"
+ umask 077
  else
  cat < "$1" > "$tmp"
- chmod "$mode" "$tmp"
 -- 
-2.37.2
+2.43.0
 
diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
index 59bfae5a27c..04630b32ee9 100644
--- a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
+++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
@@ -1,4 +1,4 @@
-From 3cce8716c6c3ae2e0c835caeac3780ec35090b2d Mon Sep 17 00:00:00 2001
+From e27de983ef70257ca1fd7f5096eea41613612ecf Mon Sep 17 00:00:00 2001
 From: Serhey Popovych <serhe.popovych@gmail.com>
 Date: Tue, 11 Dec 2018 05:44:20 -0500
 Subject: [PATCH 2/2] ldso: Use syslibdir and libdir as default pathes to
@@ -36,10 +36,10 @@ index 466d9afd..d2f458fa 100644
  
  LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
 diff --git a/ldso/dynlink.c b/ldso/dynlink.c
-index cc677952..b0e8815b 100644
+index 324aa859..7d3ab44c 100644
 --- a/ldso/dynlink.c
 +++ b/ldso/dynlink.c
-@@ -29,6 +29,8 @@
+@@ -35,6 +35,8 @@ static size_t ldso_page_size;
  #define realloc __libc_realloc
  #define free __libc_free
  
@@ -48,7 +48,7 @@ index cc677952..b0e8815b 100644
  static void error_impl(const char *, ...);
  static void error_noop(const char *, ...);
  static void (*error)(const char *, ...) = error_noop;
-@@ -1097,7 +1099,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
+@@ -1159,7 +1161,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
  					sys_path = "";
  				}
  			}
@@ -58,5 +58,5 @@ index cc677952..b0e8815b 100644
  		}
  		pathname = buf;
 -- 
-2.37.2
+2.43.0
 
diff --git a/meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch b/meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch
deleted file mode 100644
index 45d40cd5b46..00000000000
--- a/meta/recipes-core/musl/musl/0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 65b0ac0d998bf0f36924a7c27ed9e702b2a5a453 Mon Sep 17 00:00:00 2001
-From: Violet Purcell <vimproved@inventati.org>
-Date: Sat, 4 Nov 2023 12:09:20 -0400
-Subject: [PATCH] elf.h: add typedefs for Elf64_Relr and Elf32_Relr
-
-These were overlooked when DT_RELR was added in commit
-d32dadd60efb9d3b255351a3b532f8e4c3dd0db1, potentially breaking
-software that treats presence of the DT_RELR macro as implying they
-exist.
-
-Upstream-Status: Backport [1.2.5]
-
-Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
-
----
- include/elf.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/include/elf.h b/include/elf.h
-index 23f2c4bc..72d17c3a 100644
---- a/include/elf.h
-+++ b/include/elf.h
-@@ -558,6 +558,11 @@ typedef struct {
- 
- 
- 
-+typedef Elf32_Word Elf32_Relr;
-+typedef Elf64_Xword Elf64_Relr;
-+
-+
-+
- #define ELF32_R_SYM(val)		((val) >> 8)
- #define ELF32_R_TYPE(val)		((val) & 0xff)
- #define ELF32_R_INFO(sym, type)		(((sym) << 8) + ((type) & 0xff))
--- 
-2.25.1
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 324269a9687..63b2038e4be 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,16 +4,15 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
+SRCREV = "0784374d561435f7c787a555aeab8ede699ed298"
 
-BASEVER = "1.2.4"
+BASEVER = "1.2.5"
 
 PV = "${BASEVER}+git"
 
-SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
+SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
           "
 
 S = "${WORKDIR}/git"

