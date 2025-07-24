Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585FFC87FCC
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:35:29 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.2559.1753385725570429385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QyLnuy0Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so1213673a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753385725; x=1753990525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWcnh0zes+qPOHeanVqpE1mGyXEAyrxPYvCErjU9pMc=;
        b=QyLnuy0QtYhgZQxU7GfQ2crZkCY3cwRnLpEZhf7/NEtiWRc+KDpPu783Y0Tuyc1Rbv
         c1lo3QjhIsuXrwbMcJe/AvletoqGPaDgL3rsWyuVnk5pimb74fz+e/TxsY6VvvZg49wB
         eNjj4vx+LB/fJJuGA4f/MuA7zwXvu7+UNmUsyLiZ9j8QiF81F+AHUirQNrIh+IwD1Wjx
         9o1TI181f02fqQLNNqclzasJr4GyEsqa6tj40WUowa5Q4yEfoEY3E/rg7dDdGc7sMQMv
         IYOrP7JdDuyMBKuRhyPVPd4usLgU8XED/lvDGtz8hKXrabmorI5YxsKK3hhHrf6Wnz76
         hgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385725; x=1753990525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWcnh0zes+qPOHeanVqpE1mGyXEAyrxPYvCErjU9pMc=;
        b=aLhpogJ3spZN+ErHPo6sGmQuFkvrFDeyuy87Wj81h54zwbXmM78N3DRsKbDZLwykpE
         4Ou9TPzO/SrYdJPi+qw107sTp9Fw9VvKmD3VS/JDOjMkIebp4Q6uaf1gi9Opa6m2Beyr
         MwuDEZDx/TfErOO26LahQx/NOTnfgGBXIlM3dlxdT6FB3O5goDPhu6JVfX1UnaUaSwPe
         SyMwBU3G5PQCRpNfzgkRabxNj2j1Tcd4CV7HCnCBxglljD+AJqmRfAKQz21pIbLvF/pt
         s5iAbSz9BNa2XOV5IR+O/BLTCooX2QNp0frZaWZd7/BpKKc7eQKW4VqjQgFNi5O+xV7/
         JXPg==
X-Gm-Message-State: AOJu0Yx7+ufpHlXW1aKhIMpEsit5aECze0qFNm6YwN+fJrLnLzBMTy+G
	LlBN044BpiSzZxAnhJ3xaHwwX3Jjtj/vpxRA25D4Db2xqwkC7XEWjNPy92G8Q/DV9+YOu49hl5B
	0dLH9
X-Gm-Gg: ASbGncvMPyJd9MBIYu/kTETP4l2Gb39QSM+pJwfMXI6IueFyi0vU+sr1usaToUbQVMz
	U3u26bkmNnqA+wBX+44VBZEsGVCllwCr4dxqHmrlHAFc31o9dvrg+MIAtufISnAKMrMExhxuc3l
	eR46BzxsQ8pG5rxOK9EYUG1kooDjoLKUicBOLOF08MJFf1vowyUp0sUoje+ldemrWSBObVqqOE/
	XMq9iNTpTr7uQafZgjYfZvwMSd/+JHiYkf83Q+OReGsqnu1hVQwAJYM77jUrIy7fwcN+mPqQF6U
	rMLxBa6KIHw6DrIA14rbDtSwXYm5R6eNMEtyNyEw3F8ElGZqRGQQqlgfx5S/rZx0eS1ML+0mnEp
	RDlvTudx4V9bN
X-Google-Smtp-Source: AGHT+IHUt2T5U8LEG746WOAOL55As6F5WsWGizHSUSg9haqGkhNgol0Ut4HK0QuMYsTivj9b5rYv/Q==
X-Received: by 2002:a17:90b:582e:b0:313:14b5:2538 with SMTP id 98e67ed59e1d1-31e50859d80mr10587599a91.35.1753385724790;
        Thu, 24 Jul 2025 12:35:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66267fa4sm1978524a91.5.2025.07.24.12.35.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:35:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/6] glibc: stable 2.41 branch updates
Date: Thu, 24 Jul 2025 12:35:07 -0700
Message-ID: <771be16db8c5cb90da0cc5544861ee70859a1ad5.1753385563.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753385563.git.steve@sakoman.com>
References: <cover.1753385563.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220862

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

$ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
6e489c17f8 Fix error reporting (false negatives) in SGID tests
11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)

Testing Results:
            Before     After   Diff
PASS         5803      5813    +10
XPASS        4         4        0
FAIL         266       257     -9
XFAIL        16        16       0
UNSUPPORTED  164       161     -3

6e489c17f8 Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates.

UNSUPPORTED tests changes
-UNSUPPORTED: stdlib/tst-secure-getenv
-UNSUPPORTED: elf/tst-env-setuid-static
-UNSUPPORTED: elf/tst-env-setuid-tunables

FAILed tests changes
+FAIL: elf/tst-env-setuid-tunables
-FAIL: stdio-common/tst-printf-format-d-int
-FAIL: stdio-common/tst-printf-format-d-long
-FAIL: stdio-common/tst-printf-format-sn-ushort
-FAIL: stdio-common/tst-printf-format-v-short
-FAIL: stdio-common/tst-printf-format-v-ushort
-FAIL: stdio-common/tst-printf-format-vas-double-f
-FAIL: stdio-common/tst-printf-format-vas-double-g
-FAIL: stdio-common/tst-printf-format-vas-double-g-mem
-FAIL: stdio-common/tst-printf-format-vas-int

PASSed tests changes
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-env-setuid-static
+PASS: stdio-common/tst-printf-format-d-int
+PASS: stdio-common/tst-printf-format-d-long
+PASS: stdio-common/tst-printf-format-sn-ushort
+PASS: stdio-common/tst-printf-format-v-short
+PASS: stdio-common/tst-printf-format-v-ushort
+PASS: stdio-common/tst-printf-format-vas-double-f
+PASS: stdio-common/tst-printf-format-vas-double-g
+PASS: stdio-common/tst-printf-format-vas-double-g-mem
+PASS: stdio-common/tst-printf-format-vas-int

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
+SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


