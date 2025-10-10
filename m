Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F72CCCD184
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:11 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2332.1760064665650451453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DG0EiZ2l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so1543229b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064665; x=1760669465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gW8+NsxRBTC/pG7OPv6EWy8wnqQcgyHERIdrYbk5brE=;
        b=DG0EiZ2lJtv8bWC782knbBcgE9PKZcr6Ip3szF27Evk3ISLol9m2/IHqTjOTqRW3H4
         KeEjR/DO0kI6KpieDYmZmWwFtojErnqEusHhhoAEyf7Hj5rPES1fJ4Y28AL8eTs/SUC0
         8IQua7vgWbb2U+3Y9lx0YI7a2+rQiiJMKR2VrD+h6ntAI95UIJhk/DNzVgwVDKmdGMdX
         2PQ8t1mSSWUjwBn24S+W7v6z8Yu+YkdfSnHFSYYna7DFN/OCY2K9A2cJfRDdV+xfBF0c
         Z/A8oWmzrVr/6DnwSdLOI3ZWxPjAliQWs3qt7BtLwFbhDqerPPtKRdkyDhgMYuILvtNU
         KEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064665; x=1760669465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gW8+NsxRBTC/pG7OPv6EWy8wnqQcgyHERIdrYbk5brE=;
        b=SpCOQ1QND8+wJlIACLlQz1lEEv524T1YnljnyMZ3q1znJN4/g10W5jOw1G2nR32S9p
         mdjooUkRAYI5lCbsVr60qfUe2BIGjojk714gbsdLPlbykwBopAY3efElhBahaBnxsPzS
         TCoYnAO4nHBwqzlFbsTfWTdBHTThuTax8OIMVab7HQte1Pix/B5u2ZSrcoJfuHsWgIU6
         PG/UTXgiENb1En6gDDTaFiRJnUGrkS7OoRYSu/mEtzTggu/p7RThpfkHniScq8REGRzV
         W53K0DjnLyoE4hZBK/jTJSM7uR9A5xJm9gHse0x0LgWEy7reXZyQ8xPYITUzxCGmV2dH
         hCLA==
X-Gm-Message-State: AOJu0Yx7AQPTGBy6CWOk3Yy9rlBycqDCvRSTP4a+aHuTf/Nr8jVvdgO2
	WhPit5nHjzi/KWQ37zzdJlviMl9EfWMcE5jLs83qAJIPzvXxaaddlKY7gAjQxMLzd7r2YlBS7g2
	bMIXG
X-Gm-Gg: ASbGnctqw6bLzNsEXwaaOYm1mLtrEp/qtCUFLx9g3jvzkCkMYauiFhiQfceYgDsAd13
	AwCdsmbRLAuM+uxZqLLnbyPZD07JdgB08p/hoH6CUoxxMkEu8BgqbHOtNTSCddDrCFhMTawYJv2
	VFtN/ALMNHTAvOvuFJpR2eZqy6aK0Qtwwwh7XaiwSrw3WHnZSZIfSeMUhiyuHoW1CiyKjHiyneP
	1SuVu3cvfZaD2dYCEEbv11LDuYAHFubBT1BUd7W66YNJnJwmc/cAvdiQkvgJewo0wS/A748QE66
	1q6gTGbgHBfQn2o/qFmOlvnRI6WewydnkLTUHwEbSjO/xE0BisG4tuR4VC0qZAm8eL/Bgg9C3Cx
	QMgKrOjfWdMdu5HyvkYbEKOil+pdNegCh
X-Google-Smtp-Source: AGHT+IFvdzA9GcZDldtKncyYvhi1D3xm7FxekZRR+LDnF+4dsUnYZzhyzqGTzuYIdkWwVFMcnt43rg==
X-Received: by 2002:a05:6a00:1701:b0:781:1a9f:aeeb with SMTP id d2e1a72fcca58-7938570951amr10392031b3a.1.1760064664881;
        Thu, 09 Oct 2025 19:51:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/18] glibc: stable 2.39 branch updates
Date: Thu,  9 Oct 2025 19:50:32 -0700
Message-ID: <95d0fb4db6d4599ed9e4bfea1850e66aa4466726.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224657

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..765534258e7f2c33719e3a5bc13432552991513b

765534258e (HEAD, origin/release/2.39/master) nss: Group merge does not react to ERANGE during merge (bug 33361)
7ce7b4b2f4 Rename new tst-sem17 test to tst-sem18
a6ac06abeb Avoid uninitialized result in sem_open when file does not exist
ff6ce67220 elf: handle addition overflow in _dl_find_object_update_1 [BZ #32245]
fffc2df8a3 Optimize __libc_tsd_* thread variable access
83340b35cc i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
5541edb1bd i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
1f17635507 debug: Fix tst-longjmp_chk3 build failure on Hurd
3b6c8ea878 debug: Wire up tst-longjmp_chk3
89596f46e3 i386: Update ___tls_get_addr to preserve vector registers
4c2509882f elf: Preserve _rtld_global layout for the release branch
cf0e7d512d elf: Compile _dl_debug_state separately (bug 33224)
5cd1f4b1a1 elf: Restore support for _r_debug interpositions and copy relocations
97017da5ef elf: Introduce _dl_debug_change_state
5601ad79b7 elf: Introduce separate _r_debug_array variable
24c94ea84e elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
79d84b5da5 elf: Fix handling of symbol versions which hash to zero (bug 29190)
5f5c411132 elf: Second ld.so relocation only if libc.so has been loaded
4c9b1877fd elf: Reorder audit events in dlcose to match _dl_fini (bug 32066)
f407a14ff7 elf: Call la_objclose for proxy link maps in _dl_fini (bug 32065)
e27601b385 elf: Signal la_objopen for the proxy link map in dlmopen (bug 31985)
fef226255d elf: Add the endswith function to <endswith.h>
d21a217fa0 elf: Update DSO list, write audit log to elf/tst-audit23.out
4f145bb35d elf: Switch to main malloc after final ld.so self-relocation
65d86471ce elf: Introduce _dl_relocate_object_no_relro
5434cc2c41 elf: Do not define consider_profiling, consider_symbind as macros
b2d8c6cbe7 elf: rtld_multiple_ref is always true
2b89de7c91 Revert "elf: Run constructors on cyclic recursive dlopen (bug 31986)"
46e3ecad27 elf: Fix map_complete Systemtap probe in dl_open_worker
5f225025db elf: Signal RT_CONSISTENT after relocation processing in dlopen (bug 31986)
d6cc325fcf elf: Signal LA_ACT_CONSISTENT to auditors after RT_CONSISTENT switch
6917fde6f9 elf: Run constructors on cyclic recursive dlopen (bug 31986)
9fa7cc6a0b ldconfig: Move endswithn into a new header file
269e89bd8d x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
62ff85fd09 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
f0e8d04eef libio: Test for fdopen memory leak without SEEK_END support (bug 31840)
42a8cb7560 Remove memory leak in fdopen (bug 31840)
d1c1f78e9e math: Remove no-mathvec flag
20d2d69a2f Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variables [BZ #33234]
c11950503f ctype: Fallback initialization of TLS using relocations (bug 19341, bug 32483)
25c537c3b3 Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupper,tolower}
fbdf9680cc Remove <libc-tsd.h>
fca5937510 ctype: Reformat Makefile.
49f0e73fa3 elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
64488b4b31 elf: Extract rtld_setup_phdr function from dl_main
9833fcf7ce elf: Do not add a copy of _dl_find_object to libc.so
fbade65338 arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)
392e6cf1e8 AArch64: Improve codegen in SVE log1p
3a78a276a3 AArch64: Optimize inverse trig functions
b6ea8902a7 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]

Testing Results:
            Before     After    Diff
PASS         5080      5096      +16
XPASS        4         4          0
FAIL         119       123       +4
XFAIL        16        16         0
UNSUPPORTED  154       154        0

Testcases changes

testcase-name                                                before           after

debug/tst-longjmp_chk3(new)                                    -               PASS
elf/check-dt-x86-64-plt(new)                                   -               PASS
elf/check-gnu2-tls(new)                                        -               PASS
lf/tst-dlmopen4-nonpic(new)                                    -               PASS
elf/tst-dlmopen4-pic(new)                                      -               PASS
elf/tst-dlopen-auditdup(new)                                   -               PASS
elf/tst-dlopen-constructor-null(new)                           -               PASS
elf/tst-link-map-contiguous-ldso(new)                          -               PASS
elf/tst-link-map-contiguous-libc(new)                          -               PASS
elf/tst-nolink-libc-1(new)                                     -               PASS
elf/tst-nolink-libc-2(new)                                     -               PASS
elf/tst-rtld-no-malloc(new)                                    -               PASS
elf/tst-rtld-no-malloc-audit(new)                              -               PASS
elf/tst-rtld-no-malloc-preload(new)                            -               PASS
elf/tst-tls23(new)                                             -               PASS
elf/tst-version-hash-zero(new)                                 -               PASS
libio/tst-fdopen-seek-failure(new)                             -               PASS
libio/tst-fdopen-seek-failure-mem(new)                         -               PASS
nptl/tst-sem18(new)                                            -               PASS
ctype/tst-ctype-tls-dlmopen(new)                               -               FAIL
ctype/tst-ctype-tls-dlopen-static(new)                         -               FAIL
stdio-common/tst-scanf-bz27650                                FAIL             PASS
malloc/tst-aligned-alloc-random-thread-cross-malloc-check     PASS             FAIL
malloc/tst-aligned-alloc-random-thread-malloc-check           PASS             FAIL
timezone/tst-tzset                                            PASS             FAIL
elf/ifuncmain8                                                PASS              -

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89e532fd67..f63eb0ad56 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
-SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
+SRCREV_glibc ?= "765534258e7f2c33719e3a5bc13432552991513b"
+SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
-- 
2.43.0


