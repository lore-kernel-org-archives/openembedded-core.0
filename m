Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C1EE7719D
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:24 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.32443.1736371040792342272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I1OM3fiX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216395e151bso3063965ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371040; x=1736975840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S84OhkaZsP1D6kTniuO6LHZG50TiMRsS29EoR9iyivw=;
        b=I1OM3fiXeSPdt2PIPJgptlL7Gupe47xeochokWWtcLGyrQVAiKOWC12Mh6yLY54Y8q
         hi+hc5f87PUb70Rrr2uoqw1D27IEF6Tuni6ivGq4TnlP9ZIaF1raVNmIj1xXyloX15Lj
         fc9HCOConElz659w5+GXJyw5VHTD1C/Bw7IPadiGFGbDhr51F4uEmJpnX+hOUxtQJ6c9
         05SxrqbUsK7Xo59EpiY2HK8KjVTrzoybqF8GcYMssYdLuxudToZ3vcPCz7+A2dAsSG9V
         TMJWazBnB5l+rVWaj1xMRAqa6AgoLAGxCRIf2AxcLbWeNlgH9ufgkMb5V8gugQTcXmK9
         ehPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371040; x=1736975840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S84OhkaZsP1D6kTniuO6LHZG50TiMRsS29EoR9iyivw=;
        b=EHs28Fdq2+AfDzZa/ie52kdzt4lbDbgkuyOE6/2FpBXy4iU8IjCZRSjyi4RHucLgQc
         HDtdTjEtpnCJAyjuWoswtiKG7x78Bg8FVAratPIWN8GEtbdg+T3+HXRyaMfx8AQtXGiq
         3OYKepmPfok/kdLoQi5h+EAwrv88hLgyzjaV7K0MivKi5C91IBFkXZbA1MevPl80Mw5y
         dIx65SujOTe+uxeCRoIn7/SVpvG9Q/QrAfpIAnlj8QezybxqnAiwjqDbv2XEI0gqYy4W
         zGwam4twSwlTTPngN9Ivll3R+LfZxMrs5lP/sUvZBdMPyGxKJZImmGdM8fk3BMWsYwr/
         0HvA==
X-Gm-Message-State: AOJu0YxndiaWf6DJOBIEUqH+GU11cJjfWjbE3aUGel6cfgCROrUoIDZ3
	x8649XiY6mBV6DRtdnqmsZaYabkBZ1pnakltBNwQ5OdpLpj9/yOfg3kxIrt3tKbtKNMBXEjMkZD
	IZug=
X-Gm-Gg: ASbGncsu61/8TbdifNqCoFhAcBvMgc0a6G7iy37vJSYBHnC+8XEweVG5ghvaPJ3T+4P
	tSJZBx9WmvzH068+Btcz8RNG5QUQSC3YBEWyTxG/tctR3VbmIdhP7XpFNGjTEcFpHNmX6dFXVcv
	R3qEnDjrXGT1KFKiayhsgYmZutysEWP2BoCBe3U9Ef3AH1+FrvCNmU+l2nxqxtL0f38CiLeAQLg
	jKsczuqr39xZ49xruyLx1eExF/ZktP1Znj4/AIdzwx32Q==
X-Google-Smtp-Source: AGHT+IGUXcUCpm1fk9/ZAcEwpy2GCZyo8l1Bnutant1uIlAY+dQMnOKQH3pEhXt4gmYta2INbkJtHw==
X-Received: by 2002:a17:902:c407:b0:216:271d:e06c with SMTP id d9443c01a7336-21a8d64e8ebmr10574785ad.4.1736371039941;
        Wed, 08 Jan 2025 13:17:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/18] binutils: stable 2.43.1 branch update
Date: Wed,  8 Jan 2025 13:16:53 -0800
Message-ID: <90237b3a41f8027543e0e24ac99e76e308bb4587.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209593

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commit on binutils-2.43.1 stable branch are updated.
b82e2250574 Automatic date update in version.in
280374309b1 PR32300, --dependency-file: link dependencies are not all collected
263e116833e s390: Add arch15 instructions
645da6d426e s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt operand constraints
7f7047a9c6c s390: Simplify (dis)assembly of insn operands with const bits
e7592364504 s390: Align opcodes to lower-case
d6ab1d2efdc s390: Document syntax to omit base register operand
c40337b1784 LoongArch: Add elfNN_loongarch_mkobject to initialize LoongArch tdata
95ed7cf1be2 segv in bfd_elf_get_str_section
0a71d78f6a6 ld: Don't explicitly add .note.gnu.build-id in elf.sc
ad2ce1e6457 x86: Turn PLT32 to PC32 only for PC-relative relocations
238493e7f09 x86-64: Disable PIE on PR gas/32189 test
68d5dbd315d x86-64: Never make R_X86_64_GOT64 section relative
d77d08180d1 x86/APX: Don't promote AVX/AVX2 instructions out of APX spec
f307db3d8b7 bfd: Pass true to ld_plugin_object_p
cd3e2b58f2c PR32109, aborting at bfd/bfd.c:1236 in int _bfd_doprnt
2d37b890e56 lto: Add a test for PR ld/32083
d16a1893c44 ld: Add an LTO test for common symbol override
e4cfe6dab3e Re-enable development changes on the 2_43 branch

Testing was done and there were no regressions found

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4950a2d67a85b3f4a643a46fdc54d348abce5ed6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.43.1.inc                 |  2 +-
 ...-of-system-directories-when-cross-linki.patch | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
index 94e7d7f7e6..4a8666b433 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "beb2cdbcda911764b2bed5e57921fe90493260bd"
+SRCREV ?= "b82e2250574ef00faf7fcb1e95e14f22b1fa85af"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index b267e516b3..0c429d7f2c 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -184,11 +184,11 @@ diff --git a/ld/ldfile.c b/ld/ldfile.c
 index 87be885d31a..86c8a5b267d 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -344,6 +344,22 @@ ldfile_add_library_path (const char *name, enum search_dir_source source)
-       search_tail_ptr = &new_dirs->next;
-     }
- 
-+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
+@@ -319,6 +319,22 @@
+   *search_tail_ptr = new_dirs;
+   search_tail_ptr = &new_dirs->next;
+
++ #ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
 +  if (command_line.poison_system_directories
 +  && ((!strncmp (name, "/lib", 4))
 +      || (!strncmp (name, "/usr/lib", 8))
@@ -204,9 +204,9 @@ index 87be885d31a..86c8a5b267d 100644
 +   }
 +#endif
 +
-   return new_dirs;
- }
- 
+   /* If a directory is marked as honoring sysroot, prepend the sysroot path
+      now.  */
+   if (name[0] == '=')
 diff --git a/ld/ldlex.h b/ld/ldlex.h
 index defe3fcbbb9..aea75a25dc8 100644
 --- a/ld/ldlex.h
-- 
2.43.0


