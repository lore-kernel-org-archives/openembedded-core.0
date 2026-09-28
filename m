Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB3BC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:32:47 +0000 (UTC)
Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47152.1790555559233237714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UfXFPFdW;
 spf=pass (domain: gmail.com, ip: 74.125.229.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d5303884so1645466eec.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790555559; x=1791160359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FptkSa9J9dwZf1/sOG/tezhTtX79JzlNUBu7BDM2WVg=;
        b=UfXFPFdWMs7kmUtbVpygA74oOBm/UwqvwuCM+0EWYQNla46Qtcf5q3Aat5tMgDn4fP
         cdB3EX41iGQbeSIb09N9pIDE+UwlQo29eOYEydZR4CMxlI17iyK/FLbYouF9hWAAnDK3
         7qnknASTjo5Sq8eLAL6b4DBvvc8fR7nYHOtqAc8FsEKkKwNO8zG4aw+xo7gJZ1eLr0wQ
         JXvnCaUd681Q9rSpalEmBcsgM30HhDKIgaVpRe0hrKNHySFkgl5uCeuSseI61euRrJIv
         vSAsYVVbYeZlQQfzdk5xyVNRZAyWA1j9Yl3w6Cr4kAlQG8X1muFwmkjZx635BLMlsO1E
         4etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790555559; x=1791160359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FptkSa9J9dwZf1/sOG/tezhTtX79JzlNUBu7BDM2WVg=;
        b=zUMQlEOno9IhSqD9NLTX+vGCnCoYkbFY1jDvpb/vytIVPh2ZXjxuoVeWUax2qtVZam
         VNHsw/vatCfIo20LnBRQ/e4uNjAa4QpErc1hJuG2YbijILtN1b1Zshky31brZt+8xhcb
         zsA0iCGsjbf/6WmIJ9Q/Gbq1D5B2Bl8dq1RK21Hp7+/Fy+4axX93vozz510dE0GDCuSn
         lgXZLUmKWNC8bAejAX7CBy+00KZJrnfCLruqsTwnMSa9CEFJbN/yGKy2HJb4faW57uIZ
         ITTu9f4fLSx7N7SeVYUwbtaLJXn+85IFLKUxWkhHLLAIR4sU8CObDPqihOgOWrLAgnPm
         kWuA==
X-Gm-Message-State: AFuF++k1sSnTz96XT48Kngn220fau2SaAHftf0wY6XdojIQNYaUZc79w
	+ZL8iLWP2IMhMcXbvYvCuIeV/+lbJXDYLYPxfNSHvcAGyhA3Mb7C1lo7lvj5q/Sz
X-Gm-Gg: AYBFou2azlvtCS6SVr4PKCYkbIkjkQhcf8CsykUzyNWKV5VAu8Cb/m3sin+XHiCrRbK
	d0j+RLouh7PVvGCMUVSozUk51Uox+SnqzYYDBwIUB1ab39PAz/igEu7kocdpz0TT1x8Lgkeaf2S
	KpGvU7z9oD/vnrvmZiHwvD0Yiiip4DR/XsCHZweexyVtw0PE/bcyvsfbqfajQcR0Lekdv6Cn4Pk
	9WqjRYjYd/YGIWO2V2y37adN5BWJh1RZyyF5FVjEMIS1FUgiN86luVJSeEXX9Ts+86nyYFlI23S
	S0tAxwzCEO/2UsMF0jlG21F0JMvZzo9pdqS4XLcDVdERuUIe5pwJwoRYSfXs9vU6SGhgPYx3BUL
	WMqc5RvBndvafcGJ7Xqn8N6TOZGzFHF0OhJgTc79Un/IDLsfitX9FkN0TamMt19oWoXzwoOYWmN
	A5tijkKYYzmDrlWFXCFwf5S8fjJqlqLwx4kUKzYOKmwgZV02mRInlsCjyMZozHDZ/vslEdrbVBM
	PqzJE9SWUiXWeel47hM/n7j9qrehYCZ78sUNAZIX1JXyxODxv1eI/eOIG4pBigtLoqQ1vXpZPNB
	KefUIwwX6WJ2L80U4MUZZT/4HqT/l6n1fpvNGHuAG626xUatA+1sLfRtRqT6Iqxuuq6ZjcOWp6j
	nV6VO/H5ztoeWdz63k8qste1L8k8WOsZJd4K0dswOaEgaBWykO0JUFjiKALLMZPCe1wZNsqUN6m
	/U5uCm/7goowyzZ78PxaAtaJTI4Fjlmhd++SLUMg==
X-Received: by 2002:a05:7023:c085:b0:144:d792:8be5 with SMTP id a92af1059eb24-146d096b419mr7145451c88.42.1790555558513;
        Sun, 27 Sep 2026 17:32:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acd3d8eesm19439530c88.8.2026.09.27.17.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:32:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] musl: Upgrade to latest tip of trunk
Date: Sun, 27 Sep 2026 17:32:34 -0700
Message-ID: <20260928003234.858683-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928003234.858683-1-khem.raj@oss.qualcomm.com>
References: <20260928003234.858683-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 00:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246717

Brings following changes

* c4e1bb39 fnmatch: fix FNM_PERIOD failure of escaped '.' to match leading '.'
* be5ba569 asprintf: always clear the result pointer on failure
* 3594657b fix printf handling of indirect (asterisk) field width of INT_MIN
* 9ec8ef2c vfwscanf: consistently use MB_LEN_MAX instead of magic number 4
* c2541fd5 stdio: reserve multibyte space in allocated vfwscanf %c conversions
* 7d7b03b8 vf[w]scanf: fix integer overflow in %mlc allocation with large width
* 331cf270 wordexp: clear positional parameters
* 235f7289 wordexp: fix stderr redirection
* 15a1155e fix undefined pointer arithmetic in wcsrchr
* ba6961dd mntent: avoid undefined behavior on long lines
* 48a619ca math: fmaf rewrite
* a9764402 math: fix fmaf subnormal double rounding
* c0c6e62a time: fix TZif version parsing
* 4dad8af7 scandir: remove unused header
* 0270c6f0 scandir: fix qsort usage
* 0c34aa68 scandir: report ENOMEM and EOVERFLOW
* 187765a3 scandir: disable cancellation around cancellation points
* 194f3481 scandir: don't examine errno after closedir()
* b5934c40 scandir: hide that errno is set to 0
* a2985317 catgets: accept (nl_catd)-1 catalog descriptor
* 67e12dfc sprintf: fix one byte truncation when producing string of length INT_MAX
* 27b485a2 math: fix expl on x86
* ec9daea2 math: fix powl(x<0,oddint) for some over/underflow cases
* 38e04447 wordexp: free word on vector allocation failure
* 212926d1 powerpc: set up a proper stack frame in the parent thread in clone()
* 691ba934 riscv: clear fp and ra in _start like on other ports
* 208480aa x32: clone: fix read of stack slot containing ctid
* de5536d8 or1k: fix local-exec tls with large alignment
* c5e2f7e7 fix integer overflow in gai_strerror, hstrerror and regerror
* 47dd1f9c riscv32, riscv64: make alignment padding in ucontext_t explicit
* 89793723 dns: Avoid division-by-zero when zero attempts is specified in resolv.conf
* a0617d05 sys/types.h: add reclen_t
* aeeb7dd4 fix return type of CPU_ISSET[_S] macros
* c674d78f mipsn32: pass syscall arguments as long long instead of long
* 5e9972ea fix build regression in clock_nanosleep on 64-bit archs
* cb0cdc2e clock_nanosleep: don't assume nanosleep syscall exists
* 4a0406c8 ftello: report overflow in buffered stream position
* 30cc6422 fseeko: avoid overflow adjusting relative seek offset
* c2021b77 time: avoid overflow normalizing extreme tm_mday
* e9ac48d2 stdio: avoid invalid pointer arithmetic in fputwc
* 26c909bb math: make acoshf consistent with acosh
* 3e80328d math: fix acosh for x<0
* f21a9653 fix toctou race in popen children's closing of other popen pipes
* b306b16a riscv32: fix missing and extraneous items in syscall table
* 3cc477a2 fix linkage namespace violations in mallocng
* af839d43 math: include missing float.h in logbl
* 50979c5b fix rounding of hex floats in strtod/scanf on ld64 and ld128 archs
* bf96b52a mallocng: fix handling of allocations with extreme alignment
* 64f05291 ldso: fix missing errno code when reporting relro mprotect failure
* bb4b4102 fix fmemopen write-mode streams clobbering final byte with null
* 9086784b fix failure to report write error (ENOSPC) on fmemopen streams
* 5122f9f3 qsort: fix shift UB in shl and shr
* b3291b9a qsort: hard-preclude oob array writes independent of any invariants
* 228da39e qsort: fix leonardo heap corruption from bug in doubleword ctz primitive
* d2f20c49 adjust iswalnum to admit tail call to iswalpha
* 67219f01 fix pathological slowness & incorrect mappings in iconv gb18030 decoder
* 40acb04b regex: reject invalid \digit back reference in BRE
* 0572555d fix incorrect access to tzname[] by strptime %Z conversion specifier
* 3df932bc fix condition for riscv{32,64} non-stup fenv
* 19695004 riscv: don't define fenv macros for soft float
* 31b3ce53 remove non-generic __WORDSIZE definition
* 6f6bd4a1 dns: fix nameserver OOB read in IPv6-disabled fallback

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 849b9e46ee..212bda1f29 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "9fa28ece75d8a2191de7c5bb53bed224c5947417"
+SRCREV = "c4e1bb3994c14ed5112c894d15a451bf00f0d501"
 
 BASEVER = "1.2.6"
 

