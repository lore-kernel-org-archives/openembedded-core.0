Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBA3C369A6
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.43303.1744018854613365154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MVXPodIv;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so36171455e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018853; x=1744623653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq95dafiEmKQL+SMY5vIntmrMnwC25G7FEZiwrAaMmA=;
        b=MVXPodIvM1RH0z0WYvBbIZUQTSVtQyyfcFd9rSKMOmGdNvX6kHMa0OLk4JhmkgXQQd
         UgXuSxg1+w0h2w759+3qxSAhRtKeYuXu/bGn3+QIG4p4GcU+B4H9kd/yD21vhagywp8x
         WN1RpHGIgvO3yxE9WrJWNmb58V6WaIv9xv29fbAu2nkWb71xW9HZNvGI3qVQk4SX0b2t
         X0tCdvgJtjzzJz6TfjGQGN6+B5r27/bV2ksLaK8blVe7dGesFrrVdspPsU0AFUOwSMDN
         z2irHDNHkWXFkGtVEpq2nSGNmdTPLlY0XijghIJNCT3ySPQ09DUNc1YPiUPqsNdB75xs
         gD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018853; x=1744623653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq95dafiEmKQL+SMY5vIntmrMnwC25G7FEZiwrAaMmA=;
        b=IBVTt5q4MOvBV8V66tbZ+38nl3wdaLTWwT6ye4xvgR0hJduT9vgG8poo9kaIL1MwZ/
         6N5wi3tDgepXH1RhhXrVDKW33BbAkVNGAMpi9t9Kl3R1a3iqWr/uNTAxnCDpX82vCng2
         O4luJ+AiROHJmkT9KU9WfC9GpgC5J1fuLgEiWaoeEFD1foPyMIOlv7GUYFA82zXGRE7O
         qKnTBGy6KcSJofFh0LKgaxSSavB3zm5ITWD2lnWL3fd+oXXqX/7MeQiZQ8ZTQ0FQDOGW
         EHmh/k5slKUpL+Nrj/Eiq77gVvDd6tbwS4cvtgA/+7S4DymiuW/DYeVuqJI8So/iEd2a
         If4A==
X-Gm-Message-State: AOJu0YwTWNQLzg4nXv873D4M/8OUX78Y9ww7Tq72xkyBl7968N4f7Zph
	9WWKQkbEmmMWwiiaxqtVnzHWFEAmU749i9ebRA7ui/n+mNvdL3AZ75LfRQ==
X-Gm-Gg: ASbGncsdFDLqWuz17WP7s6Zg9QfxGgLWpKoCik119cZBxePYYPKiah4ebXteY39/xQV
	smh4Ulmk2f86MeBcwGeHG5h96r8TJTnedb87YTAAMQ1ZQ9fCJrPetho4sV7JcmcjltTCJAEl/cU
	NJUWiiTuNhd8tyK9MrEF9N4s4WDIZPlmXltYeWPUUiUQn7J5X4eJIsPOYOZqJXAAq5XoDBBxzNt
	lRNxzQA10CIJvCg7pWZiS6iH/dpX1jXijhi9WvIhqfeNC2RaisiaJtBJSRE5P6REmEU380VPF8d
	PjBm3vX4pLDPvW1VOvnvV3+CInfzXqXF2k7sfvc0NUfQCBBSVT2dycxjahyC6B6uq2GjgCP6G9e
	EqOr74w==
X-Google-Smtp-Source: AGHT+IGdZFJfsEyibxfDYySgGNqk1lbUZzysLiZnOePzVJLymNv2/cPLjNDVcpTh2diHIWks3lIsvQ==
X-Received: by 2002:a05:600c:1e8f:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-43ee0698c8cmr87274125e9.15.1744018852458;
        Mon, 07 Apr 2025 02:40:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/18] elfutils: remove 0001-dso-link-change.patch
Date: Mon,  7 Apr 2025 11:40:32 +0200
Message-Id: <20250407094045.753021-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214414

From: Alexander Kanavin <alex@linutronix.de>

The original linking issues seem to be long gone.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../elfutils/elfutils_0.192.bb                |  1 -
 .../elfutils/files/0001-dso-link-change.patch | 49 -------------------
 2 files changed, 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 4fbfa4b1357..f96e7c8ef05 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -12,7 +12,6 @@ DEPENDS:append:libc-musl = " argp-standalone fts musl-legacy-error musl-obstack"
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
-           file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
deleted file mode 100644
index 0eb532f3dd5..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7b0f78c86bf2e658649327fb3dd1b862f282c42e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 17:10:57 +0800
-Subject: [PATCH] dso link change
-
-Upstream-Status: Pending
-
-This patch makes the link to the dependencies of libdw explicit, as
-recent ld no longer implicitly links them. See
-http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html
-as a similar example of the error message you can encounter without this
-patch, and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
-https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for
-more details.
-
-Rebase to 0.170
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/Makefile.am   | 2 +-
- tests/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 6bdf2df..3bcee3c 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -56,7 +56,7 @@ libdebuginfod =
- endif
- else
- libasm = ../libasm/libasm.so
--libdw = ../libdw/libdw.so
-+libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
- libelf = ../libelf/libelf.so
- if LIBDEBUGINFOD
- libdebuginfod = ../debuginfod/libdebuginfod.so
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 76f1682..865a604 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -733,7 +733,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz $(zstd_LIBS) $(libeu)
- libasm = ../libasm/libasm.a
- else
--libdw = ../libdw/libdw.so
-+libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
- libelf = ../libelf/libelf.so
- libasm = ../libasm/libasm.so
- endif
-- 
2.39.5


