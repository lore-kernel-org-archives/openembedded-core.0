Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B982C83F37
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:01 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.40456.1752720955150679684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JXRV0uA/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b390136ed88so282312a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720954; x=1753325754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeU2oqYFsWLdsUE8z+/38/m+lgkOF4XszeBN9TpMOzc=;
        b=JXRV0uA/e5oQEaHik9pBu+MgCUoyBorZtN/ivmOtEBu8E14JTPHnR6C4Ljp50GPH4a
         d6mm8Chp7hL03vyQXesaL3U0xfw8QCaqbuAmPw/Q1RyyMlnUcHQNAbNYVgCGYju30P2W
         FoG26lymp7UtCgykoPmnzu4JdnnZmlRkP/rVTNyQLC3SQBFEytJsyVNqAQquN8K6vrJW
         oWYwwhXMVLfy5Fcn7NabCuIa3k1Xw7yrJRJSZzDrQ57nHsfy3tsZtMRQGjrLt/Q0eECN
         nc0lsjODV53cAbEf3WSPjlSp50lYgWz18Ni6EHrpnzinXv+dLhSIBpB1PFZa6fxug67Z
         PfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720954; x=1753325754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OeU2oqYFsWLdsUE8z+/38/m+lgkOF4XszeBN9TpMOzc=;
        b=U83QJ92QbLn7J1AijFlm1++pfpfsicD14x4H2n86fAi/vNWdOqZaQoXJHk0D5t3Rbv
         Sxo0+CLamMDZma6ynSvHlbuhLDoHVy7xRSWHDfS3pgncdgH0Q9n4Ru+OTwWMtDfSLYRj
         kfcbQZhqR5+RoF0umjfjjXLPqFaQaWDg/ln/MNvVA3IhG3HkeNTGjNQec5qfBoc8tdNR
         k/PyHyetrgNgunmCtpnxVGfHUgHA8V0fzIokNfaCpXj7UmaXbprHp9QVTX9cA9slrYCk
         vI4IO1nYdT1cJlIPtPHkmqGjNbJCHwJssJ6MGwtud374Q5LVpMxAM4mbcUDcu2/JSqO4
         frqg==
X-Gm-Message-State: AOJu0YxQhcGxvwA33y20VhGvKxMxZvUt2whfvVLGj3kJ8xZ79nJ9YWyn
	Bj7MvdhDD8DXZyMcbgHTBWhxPhM4fJZf5wt1haMq6OEwuO6gC14fz2Z7sJqjj/gN8lTeSpvH1EN
	cbVQD
X-Gm-Gg: ASbGncs+5PDBFBB1ZEXEHPAU/kjSzHbjq5CBHVVe4+MOVIN8JIb1P4wiovUMqnouua1
	7UcOn3O9V+LoK3kgN6recdSjHjVbOJdMRLAfbTpEt1zXdbumL2a3vGcgBg0OwDwRrgaW9/O7cdE
	JcOYv14oIuKmglOUM5i6+//5IOYqDMp0fmNaKrWX6U7nIPSyiuy9GsvToykwxSZhVhUhZrN+upc
	30+poDQHWm7jqBrOdd7I7msnibq0li+Ewogkd8hJH9fV9dYNOfXt9HqPCxssXrrya8s3AbUzFsa
	wESXjSEgN8bzg3+KrQtCk+B7StsPT9ODE21E5R1fqCDEcXyuLpv1JfZPst0xz21PGZza/ODF6UD
	a7H327+UpopQKQw==
X-Google-Smtp-Source: AGHT+IFWsj8cPRdFFw7KYiUwW3+NrfMytteA1adTC2fSpoYkWM7Ubj6vjYv/ISyBv1iGwt3njU1P3w==
X-Received: by 2002:a17:90b:5385:b0:31a:ab75:6e45 with SMTP id 98e67ed59e1d1-31c9e76c178mr7948346a91.28.1752720954206;
        Wed, 16 Jul 2025 19:55:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/13] binutils: stable 2.44 branch updates
Date: Wed, 16 Jul 2025 19:55:31 -0700
Message-ID: <bf237c02ac3f49b367601063aba28c8d09cd8be8.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220494

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.44 stable branch are updated.

b09cf42d51e ld/PE: special-case relocation types only for COFF inputs
f0019390d12 s390: Prevent GOT access rewrite for misaligned symbols
452f5511154 x86: Check MODRM for call and jmp in binutils older than 2.45
4058d5a38a1 ld: fix C23 issue in vers7 test

Test Results:
                                 Before  After  Diff
No. of expected passes            310     310    0
No. of unexpected failures        1       1      0
No. of untested testcases         1       1      0
No. of unsupported tests          9       9      0

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index e5df62b14e..8855fa709a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
 
-SRCREV ?= "819d713b6340ed3657e00ad0bc8d5f2b73094a0f"
+SRCREV ?= "8e98f97aecb0f0a1a1e2ef244e9aa235248ef8fa"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


