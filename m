Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6DBCF536D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:34:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.7681.1729686888813213317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fxZWVYjE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c6f492d2dso77882395ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686888; x=1730291688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgWLJJTuaAo5qfE/vI0BvUS1VFudA7V8p4gsgj9mEUQ=;
        b=fxZWVYjEmA2y7jF2WTL/4OXoLmsFRXhf46867HRSs1Yu1o6/DTnGSwp3vwwDRGVt5J
         3h7LsLXu597u/UCqFiZ8+jA3tuDf4uOjfWsplnBiUcu68mHnkY4CzWVPNErJlecFEidJ
         Y3E3NIMX8vVuoUUmWj4rH/gzfdj9vBXUtJ+23cOIfUztk+FjwYuKGayivp+0H5so8tKf
         8BXtvJZi8M9yUTF2rntIKMAqhPS0AEZ4bT2fhFCIUWp7r1czQ2jvj1qB88m2WKnq7Jjj
         Q5p7NgrBHJ7E3xGeuk3r4i7WmPFjko2uZqM6brNztDPYyWqQlyGSt9wQBJfEPTqLGDai
         keAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686888; x=1730291688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgWLJJTuaAo5qfE/vI0BvUS1VFudA7V8p4gsgj9mEUQ=;
        b=TjF1EsPIeYAjHDQyn/fAZmHRQ5mB3DAEii3jRNCLs6K1AahaJI7Ao6pItPWwwpY3JD
         RwnHjqQOv9G6xr7d6abCpR3DrZXgG8DOSruvBiX4dJJxYt9N0rEh4yopaQ8hD6DtU3tS
         8Mz/cHVVEoapmPvYWYtR0YA/IrLUKT94yqMb0Yof1kIECFX2y1du7jka/XTqvfzlnjZB
         Q017HKnO+uV+gCS9I/W2+dl7D54m6B+50l/R+ingS6Y8+7SWm4X7sLm7lzzWdfwtaqtw
         hWQChRMrmr6kHPU18Kw3AoixBD6mQlhnxdxDLQ7I8ZhPMIg+maYt6sE2hWWvEHVBFiTo
         G+Gw==
X-Gm-Message-State: AOJu0YzP3HlNg4R9jGumpHFqvjVGVzSOznZpfcZe9CPWXyulRp5NyUjz
	FuuQDKl2xu7bKxbbB9A2a9TdCHPJn/ZA9eLYd7HT4QedDy+7x/a5ZEAVmfOQQjVak2JeJWHrthV
	W
X-Google-Smtp-Source: AGHT+IEWxwD79AaZZkaEZtAcekRCQYom9wcXFE/t6cOpXEwvzrAFW1JIRQieFsmLfTGb+GpMn/OSnA==
X-Received: by 2002:a17:903:22c6:b0:20c:92ce:359d with SMTP id d9443c01a7336-20fa9ea2affmr31896275ad.45.1729686887994;
        Wed, 23 Oct 2024 05:34:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/27] glibc: stable 2.40 branch updates
Date: Wed, 23 Oct 2024 05:34:11 -0700
Message-Id: <08d6477a47ff7819af2c24693c5dfbd0c59ac2ff.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206214

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.40 stable branch are updated.
7073164add libio: Attempt wide backup free only for non-legacy code
adfb14e71f debug: Fix read error handling in pcprofiledump
f4a9b6e97b elf: Fix tst-dlopen-tlsreinit1.out test dependency
f496b750f1 elf: Avoid re-initializing already allocated TLS in dlopen (bug 31717)
b7edcfa0f4 elf: Clarify and invert second argument of _dl_allocate_tls_init
3414b17e9d nptl: Use <support/check.h> facilities in tst-setuid3
3b3350d7ba posix: Use <support/check.h> facilities in tst-truncate and tst-truncate64
e24902f409 ungetc: Fix backup buffer leak on program exit [BZ #27821]
dac7a0694b ungetc: Fix uninitialized read when putting into unused streams [BZ #27821]
2f749d2b15 Make tst-ungetc use libsupport
27fb563bfe stdio-common: Add test for vfscanf with matches longer than INT_MAX [BZ #27650]
bc240ba7c8 support: Add FAIL test failure helper
709319f9de string: strerror, strsignal cannot use buffer after dlmopen (bug 32026)
586e4cd8c6 Define __libc_initial for the static libc
c0af0c2ba0 x86: Fix bug in strchrnul-evex512 [BZ #32078]
898f25e0b1 x32/cet: Support shadow stack during startup for Linux 6.10
e3556937c2 x86-64: Remove sysdeps/x86_64/x32/dl-machine.h
39ee60a719 support: Add options list terminator to the test driver
5641780762 manual/stdio: Further clarify putc, putwc, getc, and getwc
6a97e2ba14 Fix name space violation in fortify wrappers (bug 32052)
aa533d58ff x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (bug 32047)
928769737c resolv: Fix tst-resolv-short-response for older GCC (bug 32042)
ca53bc68ab Add mremap tests
2eb2d78ca7 mremap: Update manual entry
3433a35842 linux: Update the mremap C implementation [BZ #31968]
46f19b2342 Enhanced test coverage for strncmp, wcsncmp
509166c9a5 Enhance test coverage for strnlen, wcsnlen
132a72f93c manual: make setrlimit() description less ambiguous
65fbcfe589 manual/stdio: Clarify putc and putwc
5d2a931a81 malloc: add multi-threaded tests for aligned_alloc/calloc/malloc
2aebac5e15 malloc: avoid global locks in tst-aligned_alloc-lib.c
145b588637 Fix version number in NEWS file
b6aeba2de1 manual: Do not mention STATIC_TLS in dynamic linker hardening recommendations
ef14142663 resolv: Do not wait for non-existing second DNS response after error (bug 30081)
8bbb8d7b16 resolv: Allow short error responses to match any query (bug 31890)

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5335a7b2852ce891a98eda18d59fc32e60f1c722)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 61996781bd..c8614e3c60 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.40/master"
 PV = "2.40+git"
-SRCREV_glibc ?= "6daa77104520ca992a9369bd01cccd4d98c82984"
+SRCREV_glibc ?= "7073164add3b874cf0c19ca0fb84236f6bb0985d"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


