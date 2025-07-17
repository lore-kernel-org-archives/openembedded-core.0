Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D54C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:31 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.40269.1752721163569890356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=klGHj/O9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ef62066eso5698905ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721163; x=1753325963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBAMtl8afungTtZMJrBJllHIwMSmPtThm+3Ip58SP08=;
        b=klGHj/O9BpdoVCCYQ8ShOYiYA4DTJZ/rerrIfBwetf4YsvG0DpKcZ71RGLQxP007AU
         rPfipkLhOVO2RdeBqqctsV36vcLYIPj0ITAiX+wPz18Ph8XjPOUxY2fUC40oRSZXDipr
         TCsRAZZsAwkTwHV9osfJTrMuIsFeGQZKLH0ZKsD7QQyNjS5JV4xjkAVmDYzcEx69gWnr
         JkJgsvpbLEYTGT2uOQuVoOyRuh7pM5BIFEBPbUcje9G+RQ2wwQoT/HmS5rlv39bGpQyP
         ASPMCatoHwuaKbrFTtguFkJ5NOas8MfVJXYrUMTFykHwg1IM3re2uC76M/dBdT1cCBjI
         ifTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721163; x=1753325963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBAMtl8afungTtZMJrBJllHIwMSmPtThm+3Ip58SP08=;
        b=UmDfh41tOJxemwRV1qxXAjGKndMeOParAyKUEabS0G7YyjSKEdvLu8qL5P3U3mxjln
         02A0nENKGoakuaKq3y8up/t0Ei4jRCXCrwHrdMdBFoI+aA/i7Bwhy8aln1rRWw1lIkoi
         vdJe3/+qPvwn9jo/g7oEyruqoMRXlKUZZlE4+z2QwjR/lGgODUobM5lThhPdnR3D6gR6
         9sDLDv0rIQ3FD+JHlxi85kjB8/zS2T7zj9MmL3VJnk7sEb2ysmUkF6Casx4HzD/7hp7c
         ZNSIBe+arXnEM4QrIrS3zDJ7eKEoTfYszE0UsILX2uioMv1dv7THus8LgI6kSxcBOdMw
         UivA==
X-Gm-Message-State: AOJu0YwQ0tLzc2M525EfGINbXjYGxCpaGebCkg67sJbyX9sr8Gga9dFV
	64kQl0b2B0teNU8RSpAkIlYyhQ0pJRF3JmxemXMX5Gt/o75gLbo871q8bIDYhAl2D9Zvz0w+sBa
	JOMgU
X-Gm-Gg: ASbGncvpSCDPDc02rN/xMMkWuKbUY1fQ3XUYhOiJ5SiI7GLeSo41dPkoKGWc9f5y2oo
	JnPB4JQDalCZbQlLaAyPA6mJ0vOVY6jOuZgpDzeGsUooJtyGpzyNQtfQwXBglxVo9QmTFai2u5g
	plCNIqJZn+1YmKLS1Zv6is1iMaLWRLWHU1GvBi2OVLv9jPV6Al6xCN8Oc8EA2j1bzFJ1wrwXxfi
	PlfVXj9sUb7up390zQqMFelOZ/aM7eJl3NyIKhb3nFyM0uLRCJJe8c4xRw0aLwFFGAB/e0zScmg
	VMH0K6D3XG/EqVMZjrITA7RXhZEr4eCdXEcsWQ7v+euctx4klB43A3blHPr4CBuvvkLxaUxs6lE
	Hxpra4LAzpq14Pg==
X-Google-Smtp-Source: AGHT+IGwp/xGisGQfkFSfqSQzxfQaTTr+AL7p4ePcX3HhRicXwaT7viMWjKFK9wTgOaOjwH8EIWb0w==
X-Received: by 2002:a17:902:f642:b0:234:a139:1217 with SMTP id d9443c01a7336-23e302a2b4cmr16084125ad.18.1752721162772;
        Wed, 16 Jul 2025 19:59:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/12] binutils: stable 2.42 branch updates
Date: Wed, 16 Jul 2025 19:58:57 -0700
Message-ID: <412def8923a89f3c385eae25901bed0c07859029.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220509

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commit on binutils-2.42 stable branch are updated.

x86: Check MODRM for call and jmp in binutils older than 2.45

Test Results:
                                 Before  After  Diff
No. of expected passes            302     302    0
No. of unexpected failures        2       2      0
No. of untested testcases         1       1      0
No. of unsupported tests          7       7      0

Testing was done and there were no regressions found

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index ea018a48a3..9471e6accd 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
 
-SRCREV ?= "6558f9f5f0ccc107a083ae7fbf106ebcb5efa817"
+SRCREV ?= "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.43.0


