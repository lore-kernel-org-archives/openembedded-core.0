Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8243CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.3125.1760733581458551165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qm2B4PDj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781001e3846so2240839b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733581; x=1761338381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbplsZF7p94rpveeB4nGXS2tapuSKd85i4Vyiuw8ABw=;
        b=qm2B4PDjaNZeAtKBhLvSu+CiNXCrxXwgQvaOscppZiuivDJIBGeAN94ouEzAgyAG7F
         dnkOc21KKXegZY7dBJXyRZFLNfISuDpG6mYx5riXDV0tyXT+2o8P3tZ55KAvnbLlrUJf
         yngDevhTGjqm7aMmxP4E5gVC3/8RiRYKytcaNURohXARs1M8VjOYcOrP1QHy6IpnioOL
         iRkdy2spnty/qpNg2Ffi2+4E38i1dxVuCMP9Q4ogAgmokMjkfjB9WYbWqITqiY/B/Y1J
         IYz1A9i6Xlnax5lrcttUQdUT6HrzFKubf+7dOuN+0Le4XXe4QsK4xiMrpCZTqhizI9MN
         B02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733581; x=1761338381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbplsZF7p94rpveeB4nGXS2tapuSKd85i4Vyiuw8ABw=;
        b=gisl8QhkfK1Vq5TMkPHS78hu9iNp2oICwUKLVfZjcOOCLFuX9QG7whffQRC6SW5Y+W
         UoyVLV0Ndo60ejNlnOiRaNRLNSYtJoVrVA5TIMQ7iMiH9VsYiCjnytZa2znjY62uVSPU
         9V2aV7OspsRGTzEIs0NxYB8/4VE8U/ilPvdKK8Kft/7lCTybRHXO0Onw8yLNGbKNdXkG
         AKvubbO9zlWhBVD3iDA6PcVxaZKpctRj9LNZv1mAL5fTw8LCfc7PhUe5PzTuQyQF7WpX
         d9Fy8PLVG45kwP3o9rJfLcO/zE4h4HS2D8t9+7dIzcHMV8ZMSLitmOxcV0RxLf3OyW/d
         yJlg==
X-Gm-Message-State: AOJu0YyvSpN6pNnsOioIewMBHfG9ODqyr2ChKhig0CDQ7RdqFl32WUe0
	HRjKxZTRPcSVu6PN5p3LBXPULE4Rj6mRTXzNZQOEMlL1CKWi80WWZdtX72uZwdFT5k/Gwcy28ta
	SuXIO0rs=
X-Gm-Gg: ASbGnctdmcu5wVYmzG6c02bK3X+aOvWkVcnN1CWCnjFTvRVVQytfFmwRggbC+25lIdc
	4m0IK0kX3Vrfz3XZZ22NS6V6IAcI9Mr8fAzkUTkBQY7vO02mqGFOScLv5Y/DC/LClJxqmcCi5Fd
	7SkIbPouBdC1dGsI/qzA5C12LpESAShppZrM3b8ZeR2dj9nb0JWu9+uf4KeTcJF3ioIG6Crlsfs
	hF+f8OKFDDqFlEChdJ86+v/UkPIufunVSxdGnxuhTCDgK03P1lY05FsHDQvj8Z/lue2ZjQ6HyWB
	9XhHLQNBIlzx0R51tazsRW0yeFqhR/qZW9Y2LemOAtoODZt9wDmuCZ1v1BU4oSsVjxSSpx45Cm2
	wYULUsTSTZRdRcAB8JJbNikGnGAlcMi+jI1Mg6bZOhB1b1DInEutjLxasEN9kM3v3vA==
X-Google-Smtp-Source: AGHT+IGtYqIQkKXJ8K/ZxSxb57TtAPBZH5UuXD+lnZtlcIae75RoIbZfsWVHBU2aDPjX39XRm7mKHw==
X-Received: by 2002:a05:6a00:13a0:b0:781:189:ae43 with SMTP id d2e1a72fcca58-7a220b06cd9mr5141025b3a.20.1760733580619;
        Fri, 17 Oct 2025 13:39:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/26] glibc: stable 2.39 branch updates
Date: Fri, 17 Oct 2025 13:38:54 -0700
Message-ID: <d60dd826d81bc4c85452826427d710b2bb0ddde9.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225045

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline b027d5b145f1b2908f370bdb96dfe40180d0fcb6..58cbbd43fe82910cf8ae9008351b0b0665104500

58cbbd43fe (HEAD -> release/2.39/master, origin/release/2.39/master) x86: Detect Intel Nova Lake Processor
835b1e3379 x86: Detect Intel Wildcat Lake Processor
765534258e nss: Group merge does not react to ERANGE during merge (bug 33361)
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
PASS         5080      5099      +19
XPASS        4         4          0
FAIL         119       120       +1
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
elf/ifuncmain8                                                PASS              -

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89e532fd67..2ca1571158 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "b027d5b145f1b2908f370bdb96dfe40180d0fcb6"
-SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
+SRCREV_glibc ?= "58cbbd43fe82910cf8ae9008351b0b0665104500"
+SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
-- 
2.43.0


