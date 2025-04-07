Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639F6C369A8
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.42758.1744018853876049688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqlX2eiW;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0618746bso28837955e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018852; x=1744623652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ1drc8RcjXbMxjFNfXs46qZ9G3eZWXRGPLPyTH+HlA=;
        b=hqlX2eiWKO2gqDyELSPpBFvr8l0NDocYjjNvqjvBRfTfohWVjkQHt59MCuVg3H8h/F
         N4qYvkumXYokiDK7V848u9Wc2GnpuafG5OhXmlrbnVaA6PTl62k3qa7ZQGGx96uN2eB4
         jut0qwvQxEc2fs687d0LuaGzwiW0/hImgRqbjATKKsrtfg4U0y4qZ2ho2tXmEavZhlc9
         VySeeEYv6rSYehXj4QIMzVaQ6Oj2zR0y2PFMkDQvnNQBPOSNzObRFgm6VyygBOERNAQ/
         4Jj6UmU0zVf2icrZ5d76kfLn5g7R64ce+PEB2xD+uwCcx5GxMUzMC0aVANhjqb38i7d3
         UUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018852; x=1744623652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ1drc8RcjXbMxjFNfXs46qZ9G3eZWXRGPLPyTH+HlA=;
        b=Vg3fu2OoYKTwtDTzLPEBYvOhzRFSI/6Rlo/Ebe3UA+KrYeoPif317PqEDDz/Q+aBXs
         53cz302ue4KlcZvCg3wdJjuLnKMqnxZ24fhU8/b1Se7xR2UlNGU+d+0Ib0+U2MAAIVRD
         O9XL5zQQvw9xDtyHFL/mjARO50+uLaUw31PjGOpDAWaeOv++tkW7VmLtiREh3vdain5m
         kri/DJYjRIOZ7uNVsKPmt3cEAoEHD5un77dCEoVqjZYQlUyC+yzB7tc0CH+MqtBzeoa8
         SwRKgGqOP0m3qi5VelKMkbnlg51D1Gbqatovh3h/gxnJWhgZcoE/wZ7OARY2IpXZM7oi
         oHNQ==
X-Gm-Message-State: AOJu0YzyH2y9mIqr8LNxCN8WNb0eUMwy6K0yAfbpBvTK5lsvdgbqKlhU
	Um6kP3gVkK+BPFLwmTa8agEPnDb+JrDQV+Gv6gS7uqKc/Y+CMsR9VJeJNA==
X-Gm-Gg: ASbGnctVRxSYksvIQ8tExfhjqKHVQ7WOdzXh31dfomSOlUGgtPQBX98QSbrvV0+oJpI
	NY8/O3t7p6MX3b+9JRsDx1/U7hgi6RAN8yzY4Qzz3KZWMIDGykKwxynF/pJoqtvx/Zx2iaHhhlV
	mz81YJ8wZ0YPv84ZtkcEgXsdb/EwmhBoar/0C5+OFvkUbyLDkYvVWVOHiXWh9oc51ssJA+tgMoN
	6+SByWFKoeqpdy36AHkOGbxZAbPjONnTBbR958By3SWStIar2C47SIQ9prhUy9G7vFmphjeTlBR
	duQqTCBIyIfFlLPRRVs2gL9nK/YCr10vxh2C3ty+Cc+8Z+RpjfkwLdSPP50lTZd9M3fcv1gNr0K
	glSrd7w==
X-Google-Smtp-Source: AGHT+IHUjAA94lhFwAEvSdp8aX0HgJK3k1o1/t2+4ipRG2Y6MxIx9cqSOcHK2jvyoEEYEj7ZZylMHw==
X-Received: by 2002:a05:600c:46d1:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-43ecf85f223mr99140705e9.13.1744018851812;
        Mon, 07 Apr 2025 02:40:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/18] elfutils: remove 0001-libasm-may-link-with-libbz2-if-found.patch
Date: Mon,  7 Apr 2025 11:40:31 +0200
Message-Id: <20250407094045.753021-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214413

From: Alexander Kanavin <alex@linutronix.de>

The original linking issues seem to be long gone.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../elfutils/elfutils_0.192.bb                |  1 -
 ...libasm-may-link-with-libbz2-if-found.patch | 39 -------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 7bf9865555d..4fbfa4b1357 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
-           file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
deleted file mode 100644
index 6031b721fcb..00000000000
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7bcee92c2006b7adad463be28cf4c3af21489cd2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 Oct 2017 22:30:46 -0700
-Subject: [PATCH] libasm may link with libbz2 if found
-
-This can fail to link binaries like objdump
-where indirect libraries may be not found by linker
-
-| /mnt/a/oe/build/tmp/work/riscv64-bec-linux/elfutils/0.170-r0/recipe-sysroot/usr/lib/libbz2.so.1: error adding symbols: DSO missing from command line
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 3bcee3c..18eed9a 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -46,7 +46,7 @@ EXTRA_DIST += make-debug-archive.in
- CLEANFILES += make-debug-archive
- 
- if BUILD_STATIC
--libasm = ../libasm/libasm.a
-+libasm = ../libasm/libasm.a $(zip_LIBS)
- libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
- if LIBDEBUGINFOD
-@@ -55,7 +55,7 @@ else
- libdebuginfod =
- endif
- else
--libasm = ../libasm/libasm.so
-+libasm = ../libasm/libasm.so $(zip_LIBS)
- libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
- libelf = ../libelf/libelf.so
- if LIBDEBUGINFOD
-- 
2.39.5


