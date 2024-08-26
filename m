Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E17C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 17:43:34 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.59051.1724694207332294386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 10:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ALUg3J6W;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-714262f1bb4so3296745b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724694206; x=1725299006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MieNzEl7vzlMr8HE6vqo9ZsXRMdhcJvrriM/+oBUyQ=;
        b=ALUg3J6WrgvU8wwuKhH58/ysRZqJGg6QeC5j0KKSQzYURwt9GKIk/gXkDHMfl83Cdq
         yIEmR/SilbyaSwzCOaVrJXgbFKFqwQGOl//7wo8fS9WSWyuocBPKDBiz/4oSrlkpry4n
         bkGZR3RgRYv2pSUOxKPVLw/J3yY0/8zl9QMV0dLoH0o+aq0fSTw/GR6PME6TwQ8NnLMb
         m5U6UKnWCfb03TCsnqJMpy+wPupWLgj2BAcLQqP6nkjPYLZRU+tVoJRhhLW957XyPOxX
         Fj5cfb0f/USQ7uqp8kd48H7E3woJh2M3bgDP3eCICRnpe1f/KOOZZJr56WDJtrwS1C3A
         LwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724694206; x=1725299006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MieNzEl7vzlMr8HE6vqo9ZsXRMdhcJvrriM/+oBUyQ=;
        b=BfVuhe3+o4y9tSDxF27xiXM1WMTMlWe3y8VvEo0pXr5lATzhZgTlW4MrgthwzTXjlf
         gHc1rPphZzAdmqd/5XSR0CSi4ebLnpUEXezkeKQnAsMgSg0V/FOFzvJe95lKGYLMoSAX
         muyTczs0lLtwPqsa31o1r7moUStibNZBpTVGRDGAHftVaYKHBADrZgxHnvcsWiL6mFCr
         U5zj680pUGQASgAlLVlOOxVmOJEjjawSX3zJCr96AM3pncez+cWZpgDsyeDtrXgbMkHA
         awCq8NXvlwGGgV/zYtJxiCHlqPFa9cP6/NPCuyOULIUFHCQWhG3XBXcuzc7QHp6mzjuO
         FBvw==
X-Gm-Message-State: AOJu0YyoV/G2PuXh4BoTnR/jYXhHnnDqzMuRspHNt3UnxWBzJ/PD3cIS
	jY/eq1/8Y9kuSOG+e/bM4LBTNCRN7fm1zUcfrfR5KBl3AKG4kiVoriVnpg==
X-Google-Smtp-Source: AGHT+IHRpKnCf8aqNoe+pfmmblQB6p81nuzvlTE4TIwuQxEYEqw5OL9/hxvVGLsVnIYITTtieJ+Wug==
X-Received: by 2002:a05:6a20:38a0:b0:1cc:9f24:43 with SMTP id adf61e73a8af0-1cc9f240184mr4549373637.12.1724694206400;
        Mon, 26 Aug 2024 10:43:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm56933625ad.31.2024.08.26.10.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:43:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] musl: Update to 1.2.5 release
Date: Mon, 26 Aug 2024 10:43:21 -0700
Message-ID: <20240826174322.2938481-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826174322.2938481-1-raj.khem@gmail.com>
References: <20240826174322.2938481-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 17:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203768

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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No changes

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

