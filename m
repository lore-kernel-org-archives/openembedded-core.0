Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60782C83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:36:54 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.20656.1751985405501353802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iRQDax8w;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5903bceffso63816411cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985404; x=1752590204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jvGWg8dfLpcwa8a4qQQlU1HmOxukEa6v9ulJOjBL1M=;
        b=iRQDax8wujkW4xHPzRWqdJ7J+v0eumh2JiCDdAiay9b+5DbUbZgKsGLSHVN8BWBjyQ
         0eWTjBZcrgLQrfvQ5VapAVZfpB0pmSRBprTl+s965UWmK+hRBSR9gd1fbxGVMjxF8104
         DFTwOX70c0THp+r7GcmXtSkxaOHnSKk8ugJIi1XPBBNWH/NPboY2d9mYAyG45m6f77XN
         Io4dxD5HQ8nORvytjkFSYCl/xfBJti1fIygB4sXhmRmIX+duUCechrqikvIa4+31f3iH
         Onsr/Q8KPRAGYw/y10Tld+xDMlBhVjbbyE+xL3/yHstPwwYpMTBKKy53lLHbbGC9QLy8
         v1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985404; x=1752590204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jvGWg8dfLpcwa8a4qQQlU1HmOxukEa6v9ulJOjBL1M=;
        b=F0cKVEPOl6H9s8R1iNM1NXBw3Vi7OIDpdJHRXliWPpcx+bQLDI0ve/zqkXZbPsiK3X
         hA8dAkid83Gi4aroUhcx65R6lyQ+voITHSsvYtrrJISMMPWoXX8xKG+LTPofTm6sYli4
         azSCwyHkQQXu7uvEUOiOhlhzaK4NsdUKZBSLbDywwQJvlaYpxbYPsIebTPBc7WAMw8qc
         DOmUjaijLZJPA8XqkYji6CSpH8DDU4zT0Gy/sRlCF85NVmHDZftMpeKnvluG4O9yhq7/
         2LFAdk8rUZom/LGdbpN86NIqs2mfJ393b25/0jYinzgIbGLiEytgcJ91PgakOpiIQgbh
         7Yeg==
X-Gm-Message-State: AOJu0YzPJ51qu+PZ6IDe0I2wuiF6UusXrv+5Be7GXQcSzhmOEFOOgZSu
	rdRSi8JxCY/XESbCNAhoA+wBdUMwQLufSDT/dZiQbHjBtqiC9aJDtbcWe7rrCxfy
X-Gm-Gg: ASbGnctdOyas+isZRu/xialMFLuOQ3oRM3sOUCWRBE3H0jp8pLsb8H5J2LgleHYC7zA
	3tYWKlJrCKo0zmQ1jSYcpfL3lM5ikamdIzks9USqheM177wlACDHWAll/Qm49XuMTyhQK7GDwkH
	Lkm47z8r8lTyxJS4jidBbw9BCH2n6JJyh4fsB4NeR4qKuz8Huezs+ZJR352YqAVsITr37PC1p0I
	+kekmluT4upnSD2MIptrK9MF6+SJGak8MIputel53Ayf9x2GuNfEiEXD1wMXDeYhiLxL+6YZ9EI
	p2aXs4x/NtPEsGvW+6pQOC+EI2M1NOWJrN0TxtwbdmE+wtP/gVQ5OIjMoCsJG/UWHePeGDmnApz
	BzP5W4VKWy7WWwssyeDOkOy43LBNez7vp+LZwcss2QR45qGwoOn1jj8VgSkTQoHOiV+OHO1KNxA
	==
X-Google-Smtp-Source: AGHT+IHVqiGPJh2x6KYaagnJlXNklk7bOlvLnzBwzZyi4BwOt5iGuMRlfOOKUXmg/l5Mg2QSYiAgnA==
X-Received: by 2002:a05:622a:118b:b0:494:b1f9:d683 with SMTP id d75a77b69052e-4a9cd81eab2mr60967081cf.49.1751985404164;
        Tue, 08 Jul 2025 07:36:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4c8esm80462671cf.4.2025.07.08.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:36:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/6.12: riscv tune fragments
Date: Tue,  8 Jul 2025 10:36:33 -0400
Message-Id: <b18de02b606c8c0dbdf4d4575b388b575501f2d8.1751985223.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1751985223.git.bruce.ashfield@gmail.com>
References: <cover.1751985223.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220036

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mark Hatle
    Email: mark.hatle@amd.com
    Subject: arch/riscv/tunes: Implement RISC-V ISA selection
    Date: Wed, 18 Jun 2025 18:20:08 -0500

    You need to first clear (risc-isa-clear) the defaults, and then apply the
    ISA components starting with the base ISA and extensions (riscv-isa-...).

    Only ISA extensions available in TUNE_FEATURES are currently
    implemented.

    Signed-off-by: Mark Hatle <mark.hatle@amd.com>
    Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5f6a563ee5..7c3769e6d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d7a7983928e6846c682771f9671d958e4789d691"
-SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 6152ebfaa7..2d5cfd7f78 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index f07bf26d15..04428d2c18 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
 SRCREV_machine:qemux86-64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
 SRCREV_machine:qemumips64 ?= "2fd393fbc1b2f8e809b07f4ffb73a4611a569c3d"
 SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
-SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
+SRCREV_meta ?= "d32aa55c8954b11e8e29627e82df6180b2efc4fd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


