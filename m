Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E1DC52CD8
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.43721.1721740406064881877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d4mQ8/1g;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb81c0ecb4so3065588a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740405; x=1722345205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7vVnqcxO+0iOFJ6VMfHNb7sxyX3pnpPWVEK8R65E6c=;
        b=d4mQ8/1gW4gX2D6Dd0HL5k/64g3hd3OyHivSd2bAiEv9aEGWHoRHSD2k9y55nxPmuL
         1mF23Xce/9w8WEB0UvQpV1bKj1AqPF0n9+1rDGPyNjLSCW4INKc3A6x6WLaZ99kEXEhG
         z1P1GYPNGgZRO+/lK24DzeL8puJcvZkKdPfJl0nCC0+iUUF+86HP7G6XP/IYW+5frv9J
         0E4qch7f8v2s4JYYXgYnrRJCzp2A6jp+tQoKtLnB+ENBIh6r2pgZrx8S9A1CJ38bKity
         gPgIlsFlHiPY/mJXPnI8S3aWiyPkczs7Wj/njaoRRM5yIcHVDJMiHT5KsnZM0CM3Sj5C
         RegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740405; x=1722345205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7vVnqcxO+0iOFJ6VMfHNb7sxyX3pnpPWVEK8R65E6c=;
        b=oLlsQLpzCRQI0OFKIIMma/ljwFCR1vpVZX8kS2yXoWh1R9JSi4VDcFRIbaBI0w02OT
         5E4tCp5nhcd5/ZqVXMtBxolIGQAVmf1jlmrC0CdEeNfE1v2Cdww5XjwdZaxSY10cHzNH
         hDuoXvXkrs5JpyuUJrio/KxITUZ3hStoVIt607xV8ZngfgCslA9hAOnKb3GK3nQcQ8FU
         YHKdawSDmFNyG4gjxMOoBDpCFxkBHz7pyQ6jZLdne04TJqCSz3Tta55uBLvBq4Htj/zE
         dTOUeaA+Xw+kpQ7K2XoZlrsilFtrRRiGEV8oFMJwGoe5JTk/AMDl6+jDYPUb8Ymj2FGZ
         gllQ==
X-Gm-Message-State: AOJu0Yymihv1Odbqc4VTZdX+YY/ZoUojXwzpx5Aou56KAx3KwqX3jMK0
	Hfj7u8GA7D8eBV9MJ06S7G7LRo5RtE0FJSiUBtYHX6e9UOtYoDmoE3QPAUBjNeu9uHm0kA0Yx9L
	C6p8=
X-Google-Smtp-Source: AGHT+IEVOzmYTNiuBKXaZikDQYCQin7/AOhWhqqe1Vdx0mtjkGN55VmIXFf2qCCS/wY7ctRlNjbn2Q==
X-Received: by 2002:a17:90b:3b8b:b0:2c9:63fb:d3ab with SMTP id 98e67ed59e1d1-2cd8d13522bmr3128292a91.22.1721740404983;
        Tue, 23 Jul 2024 06:13:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/17] glibc: stable 2.39 branch updates
Date: Tue, 23 Jul 2024 06:13:00 -0700
Message-Id: <b1fd313c75f08ad34cce5716d18abebc30982ec7.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202346

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
e8f5217097 Linux: Make __rseq_size useful for feature detection (bug 31965)
143a7a0623 elf: Make dl-rseq-symbols Linux only
1062ebbd19 nptl: fix potential merge of __rseq_* relro symbols
5c46e6b666 s390x: Fix segfault in wcsncmp [BZ #31934]
a036311246 stdlib: fix arc4random fallback to /dev/urandom (BZ 31612)
d2cbfcf1d9 math: Provide missing math symbols on libc.a (BZ 31781)
d473c9bb3b math: Fix isnanf128 static build (BZ 31774)
3950cbd7a1 math: Fix i386 and m68k exp10 on static build (BZ 31775)
6cb25aff85 math: Fix i386 and m68k fmod/fmodf on static build (BZ 31488)
74630b1bb7 posix: Fix pidfd_spawn/pidfd_spawnp leak if execve fails (BZ 31695)
7f9f25f255 Linux: Include <dl-symbol-redir-ifunc.h> in dl-sysdep.c
198632a05f NEWS: update list of fixed CVEs in 2.39
77bb3c7154 NEWS: update list of fixed bugs in 2.39
f05638731e x86: Properly set x86 minimum ISA level [BZ #31883]
b7f5b0a711 x86: Properly set MINIMUM_X86_ISA_LEVEL for i386 [BZ #31867]
e1d0040a6d localedata: ssy_ER: Fix syntax error
9de9cd17e7 malloc: New test to check malloc alternate path using memory obstruction
a2da98aa2a malloc: Improve aligned_alloc and calloc test coverage.
305ee48826 malloc/Makefile: Split and sort tests
00899eba26 x86/cet: fix shadow stack test scripts
6ade91c211 elf: Avoid some free (NULL) calls in _dl_update_slotinfo
70f560fc22 misc: Add support for Linux uio.h RWF_NOAPPEND flag
c9d8534406 i386: Disable Intel Xeon Phi tests for GCC 15 and above (BZ 31782)
aee37de299 Reinstate generic features-time64.h
dd535f4f19 Always define __USE_TIME_BITS64 when 64 bit time_t is used
26e7005728 socket: Use may_alias on sockaddr structs (bug 19622)
9f2b100d67 parse_fdinfo: Don't advance pointer twice [BZ #31798]
c7c3f5bf80 LoongArch: Fix undefined `__memset_aligned` reference in ld.so linking.
32969a2b36 socket: Add new test for connect
2db79c96ba libsupport: Add xgetpeername
ab4ef4421f x86_64: Fix missing wcsncat function definition without multiarch (x86-64-v4)
97bb89668d Force DT_RPATH for --enable-hardcoded-path-in-tests
71149c2a2e elf: Only process multiple tunable once (BZ 31686)
f8e4623421 Add a test to check for duplicate definitions in the static library
8b005d7869 i686: Fix multiple definitions of __memmove_chk and __memset_chk
8323a83abd i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk
5141d4d83c Revert "i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk"
c16871e662 Revert "i686: Fix multiple definitions of __memmove_chk and __memset_chk"
fa616ea373 Revert "Add a test to check for duplicate definitions in the static library"
ff110b2591 Add a test to check for duplicate definitions in the static library
ad92c483a4 i686: Fix multiple definitions of __memmove_chk and __memset_chk
3148714ab6 i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1e4a323d64..ad58bebcf1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "273a835fe7c685cc54266bb8b502787bad5e9bae"
+SRCREV_glibc ?= "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


