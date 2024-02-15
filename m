Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39EEC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:02:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.19221.1708016526836909617
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHnyDPiT;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d94b222a3aso10101195ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 09:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708016526; x=1708621326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB0iDUMDlHtm/7AEaamXCJ4wlShYBBN/Hgvsg7ZGu6o=;
        b=CHnyDPiTF1Ng3oBBdXrlzdUsZg3vmxVaDvT3VJqsW1Vp+inoH5hrvLMGBamh3z+7B5
         Op081pZEf+NfOhetLleJtKMOL9lPQsQyXXbdWMXPszi3pdqqwiysU1fUj8Uj2DdEGOH/
         9nyvY1OlrMS3TTj/9Bno+NYr/cWRpZz0NRiRKXcMzwV9ebAd76Zm3dJuSbRgN8bsxkP0
         Jzb8QPrxEMNLqWvhBU91jQDxRSwCFfjouJqGIGtynYMBscOS2CkBuqv9YZoQo8Tne3cR
         ns+WRWN2IntH/6TvYzZP42F6U0j6SXYBIr0jPMPDDDuCyUv/3kiqZBt3k3r6chjETQXS
         ZBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016526; x=1708621326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB0iDUMDlHtm/7AEaamXCJ4wlShYBBN/Hgvsg7ZGu6o=;
        b=lQe/6fcEVVEz1uRIR8rY59rmhyixh6WCJlYQJNJhNhodjXw46ImZxqT+ixe4nUvNXp
         BUfo70N4oL19tGfywavMifdAoFT8CixQ6qCltiqgsV3d7rrtiWfuPP/DhwK1e+UiYLmJ
         DLA0g8OkaleAxMSITTRBHIn2B3uPrEnB+bP9gq0tJhvYZmm1M7T/z5RgXidT22boItQf
         /fTPnBR/O8KIZdyh7IP28Hfs2hp6xG8e7FwbUjWSwToF+TL8tWNwpxgYrwPRPUHgBpAw
         t8zYh0p5RsxZq3XYewEGOTY7uTBytLn8up5I8bA39PF7yECGiT7gCJKxTw/I4fdU5jzi
         HK2Q==
X-Gm-Message-State: AOJu0Yze4zUAmDwG7qqiYCYQY8uZl0Wp8QZsunXXCu/xy44Q5CM4ZFR5
	8ag9gk4kcs578ZE9c580+Wd/QD6z7nHfd0dk+YM31jDTmiCzn3k82s8bXv5wz6w=
X-Google-Smtp-Source: AGHT+IGoJIrVKyviWPkJje2kL6zqudSStRlN/FeCAKD0qII7tctcvxwVULVZR92eYa6LhsE7EKGFEQ==
X-Received: by 2002:a17:902:dac7:b0:1db:499c:9b9e with SMTP id q7-20020a170902dac700b001db499c9b9emr2709687plx.9.1708016525417;
        Thu, 15 Feb 2024 09:02:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::fffa])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902c74a00b001db715d3bf2sm638087plq.137.2024.02.15.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 09:02:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] musl: Update to latest tip of trunk
Date: Thu, 15 Feb 2024 09:02:00 -0800
Message-ID: <20240215170201.1044011-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195546

Do not use https protocol for fetching

Musl author confirms that https protocol is not well supported yet on
musl git host, currently we experience this problem intermittently on
some build hosts where the fetching fails.

fatal: protocol error: bad line length character: erro
WARNING: Failed to fetch URL git://git.etalabs.net/git/musl;branch=master;protocol=https

Brings these changes

* cf91e9b3 fix erroneous feature test macro check for ppoll
* 39838619 syslog: use C locale for timestamp generation
* 8b704868 stdc-predef.h: prevent redefining __STDC_UTF_{16,32}__ macros
* 407aea62 riscv: add TLSDESC support
* 2e1bb87a install.sh: avoid creating symlinks with restricted permissions
* 0e330722 sqrtl: fix invalid use of a non-constant-expression as static initializer
* bd3138b7 riscv: correct symbol version of __vdso_flush_icache
* 15aa7abd elf.h: add NT_RISCV_CSR and NT_RISCV_VECTOR constants
* 25c41236 elf.h: update RISC-V relocation types
* 81cced6e add preadv2 and pwritev2 syscall wrappers, flag value macros
* f247462b expose ppoll in default feature profile
* 07af0181 move ppoll from src/linux to src/select reflecting future standardization
* 11fb3832 remove INT_MAX limit on the n argument to snprintf/swprintf
* f47a5d40 strftime: don't attempt to parse field width without seeing a digit
* f314e133 mntent: fields are delimited only by tabs or spaces, not general whitespace
* ee1d39bc mntent: unescape octal sequences
* e17b9d74 ldso: fix TLSDESC addend processing on archs with backwards descriptors
* 039d3c34 ldso: convert TLSDESC_BACKWARDS from "#ifdef" to "if" logic
* 7b6a6516 byte-based printf family: emit a nul byte for %lc with argument zero
* 8c086e76 remove arbitrary limit from dns result parsing
* 2265a4c9 pass AT_NO_AUTOMOUNT when emulating fstatat via statx
* 2d84486a __year_to_secs: fix dangling pointer
* c5459df1 timer_create: volatile static -> static volatile
* 7bb11f75 ensure valid setxid return value in an unexpected error case
* 7f3a2925 synccall: add separate exit_sem to fix thread release logic bug
* 5baf2d92 ldso: use __ehdr_start if available to locate its own ELF headers
* 725e17ed remove non-prototype declaration of basename from string.h
* 6be76895 elf.h: add typedefs for Elf64_Relr and Elf32_Relr

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ic-linker-a-relative-symlink-to-libc.patch | 12 +++---
 ...ir-and-libdir-as-default-pathes-to-l.patch | 10 ++---
 ...pedefs-for-Elf64_Relr-and-Elf32_Relr.patch | 37 -------------------
 meta/recipes-core/musl/musl_git.bb            |  5 +--
 4 files changed, 13 insertions(+), 51 deletions(-)
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
index 324269a9687..fb2b188e010 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,16 +4,15 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
+SRCREV = "cf91e9b3937dc354b702c8ac1b6135bd818154ba"
 
 BASEVER = "1.2.4"
 
 PV = "${BASEVER}+git"
 
-SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
+SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.43.2


