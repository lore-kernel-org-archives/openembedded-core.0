Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15370CA6016
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 21:08:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4866.1791493678426618778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 14:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=U26cFMQ1;
 spf=pass (domain: snapchat.com, ip: 209.85.128.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so22574385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1791493677; x=1792098477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gqdbKfeDCyrond1M8mO9ZOhrlZHuXt0w+gPdXUM5Bk=;
        b=U26cFMQ1wfk0sdz6UhJBJ5N4JU5Wu3AQk/Vl1CnXQesGN1l6qtn6II2JMe5yeYfTo+
         H9Ts8S8PSQujcLXK3K4+tzANyIQBEwfrCdu8mhdubP2Isnot+afJODJFsE0Xg12XI4R0
         vfVHmqUjPenq1INXSLeE/YSn3nOC4RHFfpVjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493677; x=1792098477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gqdbKfeDCyrond1M8mO9ZOhrlZHuXt0w+gPdXUM5Bk=;
        b=Beban95g27SjLaBFWehC7Ez0ML2UFWPNXGyvhFEOKp5Ij03fh3cIKwfgs3Hl3F1G9J
         W6O6P+L+JC+IliHToDb2Ot797KlWn5qu8tOul4tmJcb93ksdG+BxOIB0OpdUn388EfSy
         z0G5dJoG16g3sgzyA2/mMjFYve6wn5KtMbYqSPz74P5A1po9sp7IZrtYMoUb1qjmGcCU
         tSPJfQlTFd22Z1b2AyErjxUn1VGYcc3EeZCwIQgY1L2R2PiiUVsJ99FVgrOCBJ6kvtIB
         tDr77Y2RpCUxDxeBu3hBJYYsPOEwyy/6SwZd+d0MbSOYmLTaP5K+9U/QePVy3Mh/4Tid
         FfhQ==
X-Gm-Message-State: AFuF++mcm/TlbDDeTy7eEVmtdiEWHh/nGHOzFSlS62oHe4GOAPc8JJm4
	eYyQZTq0WIZI6irhEKT94CNloSQNCM1RU4ELRVmSHO1nKHdr56FDsNRYMC4iUTcdBfsDLsLDbcs
	Gnj6wDlmYXg==
X-Gm-Gg: AYBFou0I85uIRiWqyIC5XOuI9sy9Azx4f/PqC5zdXaN7zrWu2u7df+ggPZ0xz9XJLIe
	Pq0jL0CbcHMq+YP1ZyP76JnuonORrk6VHiDUPrQiaiEb8Dy1HadtmKuU1DpvRXOFajt/7ZS3Lav
	V8eQHhAcirIECjhAvaMahIHJYFKa/DGQ1sbQV12u5Moj7Z+5AuJ7SFcaoElaLauOte79efCtUUz
	fwLYunvOS+A94Qa6AJ6SG6v9flzpMscQ/X4yVXeXT1Ngmn03E6+LFRO45G8iQUIOqIbAxpkeAxy
	odIrEnl5PKe9yWiEPQs5DF5q0mSgvdCyJOmn805QZ2do3JkK0kvwfCZW1HSCx2ifSwdE4bKyfb0
	G+5XazoknHIzRpMnueV/8A8s3gNo+hI4gJ6mbawNNRCy/3AX/61zW9n5d8hPRucEhY8ZxVXvWmZ
	O4FshLKGDlY5yOCgoGKOLXa/kXPDPJkJlurqsluHuepYpRHiMiobYK2RVygsx/m4DzCL6R3gARq
	x76yfjgkLF6YP0lR+mHyJVTa3ZjBBMfE2Ijb7B2tEk=
X-Received: by 2002:a05:600c:19cf:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a18dcc0855mr121985e9.9.1791493676499;
        Thu, 08 Oct 2026 14:07:56 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm3413865e9.2.2026.10.08.14.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:56 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] create-spdx-3.0: track SPDX_INCLUDE_SOURCES in do_create_spdx's sstate signature
Date: Thu,  8 Oct 2026 23:07:50 +0200
Message-ID: <20261008210750.3105654-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 21:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247448

From: Etienne Cordonnier <ecordonnier@snap.com>

SPDX_INCLUDE_SOURCES and SPDX_INCLUDE_COMPILED_SOURCES control whether
do_create_spdx walks the source tree, but neither was in
SPDX3_VAR_DEPS, so toggling them left sstate serving stale output.
Verified on zlib: without this fix, setting SPDX_INCLUDE_SOURCES=1 left
the cached 2-file output unchanged; with it, the task reran and
produced 266 files.

AI-Generated: Claude Sonnet 5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/create-spdx-3.0.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 56fd01fd53..6d47aa1301 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -186,6 +186,8 @@ SPDX3_VAR_DEPS = "\
     SPDX_PROFILES \
     SPDX_NAMESPACE_PREFIX \
     SPDX_UUID_NAMESPACE \
+    SPDX_INCLUDE_SOURCES \
+    SPDX_INCLUDE_COMPILED_SOURCES \
     "
 
 python do_create_recipe_spdx() {
-- 
2.43.0


