Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31AACCD18F
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9214.1760038307289424274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z1QcTn2E;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-789fb76b466so1253429b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038306; x=1760643106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QGqWQrXYF76rIpinXnbklVeUXD/qCyz3ZNEeLJPVOU=;
        b=Z1QcTn2EBj9l1nobYXvYxNd74PyGwpEkfayTUM2LpDBpSP52aJSs79s09oONHrnLEa
         GZaVqz9Y3nMW5mwita8F0NWjZR/6jlXdvdWSOZECgmiBYLkCLQ996ReWZrgM1g5PERSl
         S/PV458AyL4JPv0Xq27uHLxR0vGwivnzJOsou2FRjsrYdIyQnHwya8RIIJHX5fUKKABV
         9057d2hFGU2Hie7SVjUjRGj6vR5XU4uJY8z+7/h4/7GYBDnMDihFpvE4uzqpFfKeQykP
         2Y97c1X8XEUHEX4P1WKXNybu6U5vr9aT+tZYC/q4Zxogbc5zkshbLIESK7jRGoF7v00x
         00Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038306; x=1760643106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QGqWQrXYF76rIpinXnbklVeUXD/qCyz3ZNEeLJPVOU=;
        b=HMId/8rEPZ1iLRN7SPNUzVSudslpdjBqn87Wnnh9B36emiJTqQ8PJ5GSSNt+t78FPO
         +urLqdOS72j7zMHr/U4dlUlCVN+/54KrJVJKKNX/kv22Hm/sbwBqOyNqztGvm5Iw4vtr
         M4p4ba+AxEEQ9zhPx81T49HM6DEXRg+etgtYeweqovm+8f7CX/HSE047E9SIq9CwF1lt
         ppuIn/FD3GyM8wK/PEAbfikW/3I9E4rD1LCgnyb6iarmsz88B3BnggO06OwxsXzLxvVr
         fQrrKlJTPIzxvFvHMCmiC7RSTi6v8fVJtjWFZWhZJ4qjw8NvwmpPkNYBmLdyFhdpUFMg
         /3mQ==
X-Gm-Message-State: AOJu0Yy5L84SYl/ARVydFN7Jp6NEKCbefj5XwTuhfQkb3Olf7Q9FDRZg
	xfVKM27CzInYoG4/9q438/VSgVEH7c6qaBMCZJD9tF45eKI4hGui2zw4+lMpw1lhxOyOdnZTb4e
	20UIZ
X-Gm-Gg: ASbGncuEheZHq100AUobQzJ8KlLM41+agdYair7/vtc9toF2knYS/nOGp/pEReEvP9A
	PxXw/y/rwtiVTqzp0kGREz0UuKnT4E5y5+vfB+raprRfDbYTS5d1D2QFO+pz9O0ivShomlNkhY/
	j/mWAvjZ7yn0ui+/4rOCHd3UHPFSVRMZve9z+0kTGZn8+WGCzl5KMGA1ccMUqgykfYADHySGbob
	tAxSYKPma8c8k/lIJArSp+A0astIoCCmdhpArxjVa6cuBJ10t3vXYQRDKMUlRSRnT+Ht2AOPfDA
	mPQUiG/Oh7laSQ9UL4rgcf3g2JpYhKlSzqOnez+SceziHVHaBFDvepVcD7N8zXJ1+KhmuOxS15e
	WAqughy4wzjQnu0A7ShCPfhbGP5QdcqL3GBUPIQ==
X-Google-Smtp-Source: AGHT+IGpq7iLt3dC2wr/AfVZUd8sJxX3TEHcp2Lqsic50qb3PnFETJwnd4ikfMFlejX2Bb2ZYX/ASw==
X-Received: by 2002:a05:6a00:391a:b0:77e:8130:fda with SMTP id d2e1a72fcca58-79385ddc9f9mr11023686b3a.13.1760038306046;
        Thu, 09 Oct 2025 12:31:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/24] glibc: stable 2.35 branch updates
Date: Thu,  9 Oct 2025 12:31:03 -0700
Message-ID: <932ee96c0dc24ac3cdb9cee5bf96375568b41df0.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224638

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

git log --oneline a66bc3941ff298e474d5f02d0c3303401951141f..4e50046821f05ada5f14c76803845125ddb3ed7d

4e50046821 (HEAD, origin/release/2.35/master) x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
c97735cfde elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
96cc65a28a elf: Extract rtld_setup_phdr function from dl_main
e3f04f64fa elf: Do not add a copy of _dl_find_object to libc.so
bfae8bf49c arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)

Testing Results:
           Before     After   Diff
PASS         4605      4609     +4
XPASS           6         6      0
FAIL          358       356     -2
XFAIL          16        16      0
UNRESOLVED      0         1     +1
UNSUPPORTED   197       197      0

Testcases changes

testcase-name                              before           after

elf/tst-link-map-contiguous-libc(new)        -               PASS
elf/tst-link-map-contiguous-ldso(new)        -               FAIL
elf/check-dt-x86-64-plt(new)                 -               UNRESOLVED
misc/tst-tsearch                            FAIL             PASS
posix/bug-regex24                           FAIL             PASS
string/tst-cmp                              FAIL             PASS

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0b06005b25..b9f5e8fb8f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "a66bc3941ff298e474d5f02d0c3303401951141f"
+SRCREV_glibc ?= "4e50046821f05ada5f14c76803845125ddb3ed7d"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


