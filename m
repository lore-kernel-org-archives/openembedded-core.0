Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281C0CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:41:15 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2495.1755816074749317641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nOm/Kf/E;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-618b62dba21so2102250a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816073; x=1756420873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NN3beUXCWdtUaHJyAc/oShmP5jfhA8Bfk0loqqOeByo=;
        b=nOm/Kf/EDGh+0Phy3StaT/0HBc7cQaSyoqfTFVsm8Lj9z5vposOz+upMWtUGd7lBby
         KKmVbdANkW14F4c6PSe0stDhCxCGnSS68LyRijmPByqFVQbZebRcjDyTiabfr0m7mA8v
         S5+cPzf6QGkjL9PyBk/j0F1vqex0OUoCyCnwSEzmDCHRAKyYlxaQ3gl2mWkEiH8/B45h
         WlaxGwDFyRh4tKKDQimmKdnID/m25mz0EWqOoFpKC1w24PAAqNfpkNSo1Sbeg7Wivt4w
         2nH8WwDZfNyFqwZxVRedFKaYRSYsrXW8GxNEcHqIv6puUpLK7SxEy7gFQm+Q2FGi5BmE
         BtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816073; x=1756420873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN3beUXCWdtUaHJyAc/oShmP5jfhA8Bfk0loqqOeByo=;
        b=NqUwdsJrkla3bOOOvbN94gPf63RL5Tvr1Caem7qndZL4hKgATJjCaj4s64aTMA/rl+
         hLgmNAw5KMjSVQ9DLg++jwg2MzvVUpybI3rTQCvpf+yhC9PYp8Sr04my0tFP4F/UO2qD
         2wJ8JArj+wD+CMoTCpkzRvIZ9e83OWx3lcseobSILnLJDy566IyJsN2jtMCLzxSsjpVY
         6pmHLKrDOg9je8vhlqVrAePSRKo9tJl2qbZUeYdqwLO2/eTUM6+uOubVUZDC4kkxdYoU
         BPFumQWVd4XlAkOuvBUOogq9v2lDd28d+EPGW9if1tfdvreeoJO+z0yE72ew4OXXnlKa
         K7WA==
X-Gm-Message-State: AOJu0YyTqH+ebH1+7U81x5sbOMHIw0OZTFUW8pSEBf4gE+Y8V7qrssPd
	LcySi8VcygJ62l3Te9H0ya8F5Fwwj6E9CsAWSWte1w2RdYNB3p58WN2pGsy9AQ==
X-Gm-Gg: ASbGncugokUdGkFvFTOmfg5ORGFNSBkpoTB4brHVrSbY4kdw3ro/2jUPmV/XCU0qs6y
	ljllohswVX2qA4ZFuq/Vq2kNdwvmDjcHRPnpdDTWeBPok3p8lk+viDhoo7tLpbriGOHDK1/MXgE
	8TvVBLhieECFFstx4FxmnfuXSu7WfK+lsb6LEH45PpjgSc9ag+SYLZOlbatGd7YhVLXu/f5rW4h
	nqkqSJmjmJoRyG+ulTb81+fvqeuDoGBw6aBofeKOmMdq2fQ24f64NbhBvWWOe+MAEAf66VxLOkc
	6ip9/ptg+Il2oLIoPvKRb2PcQyrDEeTXxNYVUdyx/mq2zl3xpyaTKZsUpCA5kdacEsO5XqngVX8
	1aPBSdS0S+tgvkVlVCVoIyeyTg2i1eE/Rap/PA+tkeTcq2y72SeHTSDAr
X-Google-Smtp-Source: AGHT+IEsGpJgEaYPpM+o0fRWjXbY2wXM6dYv2liDBSW9wZGXruRQaCNftEon+BM5C/QOS/bbtQLxDw==
X-Received: by 2002:a05:6402:2114:b0:615:cac6:2b07 with SMTP id 4fb4d7f45d1cf-61c1b91d8eemr671017a12.34.1755816072971;
        Thu, 21 Aug 2025 15:41:12 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-61a757745absm6149392a12.28.2025.08.21.15.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:41:12 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] license.py: avoid deprecated ast.Str
Date: Fri, 22 Aug 2025 00:41:05 +0200
Message-ID: <20250821224105.1673143-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222283

From: Martin Jansa <martin.jansa@gmail.com>

* it's deprecated since python-3.12 and removed in 3.14 causing:

openembedded-core/meta/lib/oe/license.py', lineno: 176, function: visit
     0172:
     0173:        LicenseVisitor.__init__(self)
     0174:
     0175:    def visit(self, node):
 *** 0176:        if isinstance(node, ast.Str):
     0177:            lic = node.s
     0178:
     0179:            if license_ok(self._canonical_license(self._d, lic),
     0180:                    self._dont_want_licenses) == True:
Exception: AttributeError: module 'ast' has no attribute 'Str'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 6e55fa1e7f..ca779d3d83 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -173,8 +173,8 @@ class ManifestVisitor(LicenseVisitor):
         LicenseVisitor.__init__(self)
 
     def visit(self, node):
-        if isinstance(node, ast.Str):
-            lic = node.s
+        if isinstance(node, ast.Constant):
+            lic = node.value
 
             if license_ok(self._canonical_license(self._d, lic),
                     self._dont_want_licenses) == True:

