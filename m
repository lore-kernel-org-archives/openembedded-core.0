Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10B3E7718A
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 23:08:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.118182.1734563333941579895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 15:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f9e4NcTn;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725dac69699so190637b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563333; x=1735168133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5wbUIpucp/VLpQutZVqZIwSTyUw/s/4ny0FjkPJJ2g=;
        b=f9e4NcTn+SYrHtW2UilQQ2YJCyIrhg2NrdRfKUuePo4zzWIwU/YhQezaTG1mB9B49g
         si7crbi+zxV0E6KpS2OR++xTDMkMAj6XDmK4LKzIHTGjB1mdTCzg9yjzBWhwiS5gBFiD
         TJ5lnMG5ctBJLQK5Al/bKtq72ZvDLdpmb6ELtPzJdAsHfxUQvtSlDCwaFVsptqDioO1Y
         jMpUx95LMeuvA4ugDiKTGoM9ZpH09PV4ZShdPV1HwqYZ8W24TLfnxizuogzs8tFb7fVQ
         QY6/DMGU+rPG2NzrO/1GzZrACDERL6AJ1cHoy93xv7N7SepDRCDGm6wsj2BiKVzFhKa6
         u27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563333; x=1735168133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5wbUIpucp/VLpQutZVqZIwSTyUw/s/4ny0FjkPJJ2g=;
        b=vdwZtCuRvgAyS0booSUzY0PzC20J9qWBI1JbMoHgpSS8C9UofKvWgeDW3Id1laL/Q8
         3YMK9dgydbEAfArdvOXinb5whoeGkeCH8PzsJS6mzte3aT6b3S/TlNQvmNzr3B32JVyd
         0Gqfz/5UUTt+XidWmPq9K6Wds5CDsgUvKGHDNQoKzJdeSfvzyKT1xiXbp8ggm+Acf5Hm
         r7S73GLIqNKYTXQ8R/yB1AJFNc4b1AP5KQknslGZ3VhesVj3lmLO7DDdv1P0zDSepIIP
         JiFBIeosQai+qJ24Pa0Z5o4OthLs80T8n3ikyNWpXqm0lkg0bk5HSLuFVPF8gEMI2psT
         vOjg==
X-Gm-Message-State: AOJu0Yz3dGIfGyLdcjAN8KXKnUhLo8Pu/l2S/4CpRiXCVVEFPJ+quvBQ
	lexn/0R7Uno31qJzwWA9lZ8IrX3DkFqfpphIxIFk7/0V1il+yrTQWAn021Q3
X-Gm-Gg: ASbGncsr6Wwc25y1GhMYmodEzzPkLiUlwQvMAJF5GoRJRL6iOSO310c4RBuyhMSfYY+
	9/N2El6WMfpiJzvYQzs71nIVgovhzZ/xcDtR8IWLlIgLhloSEiGAyuY4bpCJzmCnmK6MkGdmxSF
	JNj/1nrRg7aDRersjfWSmkvtmd2YCK+I+0qgjtpyibfEXhvu3jgi5LNf+LY2WzLuuR5CQWsIywf
	x9iYmOHwtMBPgLMdKZbc9ypklT9zdZ7lDphvzcGLqM8vmfprZUR1X78zQ==
X-Google-Smtp-Source: AGHT+IFeMQhb0Wzbw47vyYc6zcyOITsxDldKLSiUFgTBpOJ2gCFEF5R9FDw5c12LKoFQDB7Mb2v0sA==
X-Received: by 2002:a05:6a00:f99:b0:725:f056:19b1 with SMTP id d2e1a72fcca58-72aa8d5520cmr2186348b3a.13.1734563333003;
        Wed, 18 Dec 2024 15:08:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::d5a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816540sm11536b3a.22.2024.12.18.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:08:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Upgrade to latest
Date: Wed, 18 Dec 2024 15:08:50 -0800
Message-ID: <20241218230850.1692527-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 23:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208892

Brings following changes

* 61399d4b loongarch64: add TLSDESC support
* 9b6a24f9 wire up vdso clock_gettime for riscv32 and riscv64
* f2375aac wire up vdso clock_gettime for powerpc, powerpc64, and s390x
* bc5f816a mips: use preferred asm mnemomic jr for better assembler compatibility
* 4e6c827c mntent: exclude trailing newline from parsed field
* 9929a571 arm: fix _init/_fini alignment in crti.o

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9d33df49968..1509c2e3108 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "047a16398b29d2702a41a0d6d15370d54b9d723c"
+SRCREV = "61399d4bd02ae1ec03068445aa7ffe9174466bfd"
 
 BASEVER = "1.2.5"
 

