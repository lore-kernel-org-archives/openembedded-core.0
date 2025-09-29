Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED132CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:33:32 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1142.1759160003088948707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 08:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UL9itk4v;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so5090457a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759160002; x=1759764802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is/H/+UPUBC9YnJLo4ImO1xp3I04EAEr+kbNaiPuLFA=;
        b=UL9itk4vV8cdt4eDNO+VHO3x4QkSaP5BJiJbkh/dyyJnjdkbX7MeLXab0B1mbY4iT8
         3g5V/0jouRFmsIAc4ZsdQh4vHc9vMknleMJrrYnQoBp9TTs/RpPZXBpD2xS/zrFwVOU4
         XzhCCU2zgpPRJmiPRsCoFFoDr7581snybw/mC9MdHypLDLOrsBSn6roA9xG4OqKVMtBh
         mnLD1W/3UVOwSBg2EqyI4qUYznllj+A3+fyv3tJEwqA3VagaozHM+BJ7jrjJsRZoCmJt
         sQqgTO7v2jDOhAr5Qe5NxezCUa7BvDctUTAEWym7a4ptVbMkEhRkjoTI2cwNbY39+3Fp
         5WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759160002; x=1759764802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is/H/+UPUBC9YnJLo4ImO1xp3I04EAEr+kbNaiPuLFA=;
        b=ZTZUgjpYNhAwQPjw0rFeB2XCMX8ZRWDgizzQ5+ubQ09PDdaBgfdrpWfnnDHk8DeO2K
         U1RbGYzLHkPTDsL1UCos4A62fo1GovyKFsMsLDBhphPmlT5onldVVZE2J/o7S/2g2l35
         wafw+PiWJB/UFppqh/ro6tN9ZjEt6i0taZxD8CajSqB60dDfe2p/uaF+thf5J4sIieyM
         p8SOIS5iWIArwaydM3mveiYB0QJ80Pdo+nUy5XIGnDIpC85h+HyfYjAu3OM0hpvk25rP
         U950cMpKBLGos6jC6Ah9sWXQaiXdPM8sYJrn8FsQxbP/WhLU7EEkKVE5bs4B0kRB9qtQ
         Uw/A==
X-Gm-Message-State: AOJu0Yy5X+KLBZndkm5mlflpR4MJn1+mPEgocHzEONzZQTe80d2BtnAl
	cW+7r//4b5BCGN8ElG6zSf5slybbRBLJqRAji0iNI+CPWwDohlHi5jNolfiJh2GV
X-Gm-Gg: ASbGncudMH0j7prpTaGCQalZTHfPxylxO4BURXYo8yU2vP/uU20XuzZZCD4jGdGBjYW
	mM0OIjzQVjELO9RoDD6d79xBHFp5W49i+qLPrCFKRLg59yxsJelWk1h5c6+r8QP/GYme7o+iYAx
	JZJo7Af9BggU3tFCFgPt7jxj+Bdp9mipRkuF1XvPWvclvSoKee+F5UV1U9jbKnEVY+XcZnNdtwn
	Nr7rRt+KE5G0mG8BSnQqwYTiZ1cCbUs3MRvl/BCyTq4SPdBSKoTiKcs045WBBy1zRAY+/uzYqvR
	VbbcdgaOndMP8sL4Xvng0AsZaJl4MM3EKLqEHGuV+RphUdbO/7s4nwrIguHX11A9+uDUQ7QsyTu
	XZbpW40pZacL/GhS2P8NjdFQ5sA0JztRSnCGOvqYM7yL4yUQ8eeDnkNJmMaxibrgWCH3+4CpFdb
	NXpHALu+Z2xEEY/BTu9amlJlrKn4Xw8p4SU+FNtq/Cd3RlI+SMDsxd+xksOsV+zQ==
X-Google-Smtp-Source: AGHT+IHoJoBC6Cajlwh2tNohes9N0lV+YjJIfEARpvShNfTJVSHQ/77Z4l1HF3S94htnYTXyTIN4Xw==
X-Received: by 2002:a17:90b:1b4a:b0:32b:6ac0:8633 with SMTP id 98e67ed59e1d1-3342a25784fmr19716302a91.16.1759160001975;
        Mon, 29 Sep 2025 08:33:21 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fa7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda71bdsm17440273a91.11.2025.09.29.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 08:33:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip of trunk
Date: Mon, 29 Sep 2025 08:33:19 -0700
Message-ID: <20250929153319.1257365-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 15:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224148

Brings
* 0ccaf057 printf: fix buffer overflow in floating point decimal formatting
* 0b86d60b riscv: fix setjmp assembly when compiling for ilp32f/lp64f.
* f6944eb3 powerpc[64]: fix missing ctr and xer regs in syscall asm clobberlists
* a6244de1 fix erroneous definition of IN6_IS_ADDR_V4COMPAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b016c27eeee..3f5fa37fbad 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "8fd5d031876345e42ae3d11cc07b962f8625bc3b"
+SRCREV = "0ccaf0572e9cccda2cced0f7ee659af4c1c6679a"
 
 BASEVER = "1.2.5"
 

