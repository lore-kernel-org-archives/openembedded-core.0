Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8868CC54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:31:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.49790.1748871110254440404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 06:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iQCEKTHT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso2675485f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748871108; x=1749475908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGuk4HetRjjGGFMs0fNU6RWk37AgKs6lSQAQpjGG22E=;
        b=iQCEKTHTMMAhrF0HRjn5dN59MlYTgA4+GvEgjltDPQ4Z+SEcY66bLxG2jI3dKC6CPp
         7F9Y/ojVfk7OrfUVolIdFWE9RhM2SBgfI2NjppCw78jhf4voPEvQS9EqFMvlA3NwH/jm
         zOH114aKYqvdxfWwzs10/CR/Z+zKxMw9P6gOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871108; x=1749475908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGuk4HetRjjGGFMs0fNU6RWk37AgKs6lSQAQpjGG22E=;
        b=nr1q+UmfM45HQzDfVVBFkaQXdrEJ0JE2cixWYCOeSsepIjDX0k1KOiUHla7T6EHK/I
         tuPiuPZr5RINpiQmVBv1S1nBBrVXivPLToxLc+QFVnQxoKLmdwSMFGTiVmYF6ce0aGqU
         JFpxAlu3bOaZsPyPAQQBeN/L+HPVyxFM4fwf4wsCbLRdYO2uCpazJCzM+LMbQaD92wQP
         ESC33POhoGaPRDZdPAGO6d4cY3F31r7SISaQ6VM6Xv1jXXjk+Chc022Ks9kKi0KqSfJw
         Rd7BCftqHsO5ucv8v3sVPgOVAoW24jnDRrDRvj2MZGXL9DLIbi7w1obZ+zushEOLhlO1
         h1WQ==
X-Gm-Message-State: AOJu0YyM8bMsLljR6mk1QVJr5njK7hEuL+9X0PnVIBe5Hu5CQqzrVq5I
	YLfaBw7ozCrc9icCRRjoXjHKud8StJz69y6ktFVRmykGBHSL1Wf09laBK1Vb8z5Xy0nXKBWhh9a
	E1jlvdEk=
X-Gm-Gg: ASbGncvC6phSKk2DT79MfQlnrjnk/bnxOEcJmiOQYASrpUV2l80shNFcY3iYfH/8Lrb
	roiC02i75egbd9+W9QGtvOkpn85wwRfK58OgDSNxLNPCaMlkOlkYmlJX/KfnIMhdcoDbL88z4eJ
	cmvl9T+YoPmxUv/FTGkUvxEhuftiZhmjZlKDofH5LLvZOS5H1ZIJ6ehCet4u7FxHgcXRVSu5yjI
	/MLK7gCC+Rg8y6651A80nhKq5icUx2s2BxkZ7c8Gb4fomduvc7qFk88WlokFHX9eJaDR6w/9zfp
	/qR3xiQxfqwjRG0D4oTdktFtQTK8OSN8Gkrkp8ocYFh/aJ2bKvwrCsZYeBAniyStpNSVmphJ9O+
	v7RJ7
X-Google-Smtp-Source: AGHT+IG2NdGt4VVXYtWtzOOD9OilCxokGmfbVlRoiz0bFYZ8l/fRHh3NolawpZHMnd2bnKbiVLfNpw==
X-Received: by 2002:a05:6000:2082:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a4f89e24e4mr10067044f8f.57.1748871108189;
        Mon, 02 Jun 2025 06:31:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dac2:e1a5:9f09:aee2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm14629468f8f.26.2025.06.02.06.31.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:31:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Disable hanging ptest for riscv64
Date: Mon,  2 Jun 2025 14:31:44 +0100
Message-ID: <20250602133144.3521798-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250602133144.3521798-1-richard.purdie@linuxfoundation.org>
References: <20250602133144.3521798-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217720

One of the ptests keeps hanging on qemuriscv64. Until it is investigated, stop
it runnig for now. Also improve the debug output from the run-ptest script so
it is easier to see where things hang in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu/run-ptest | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu/run-ptest b/meta/recipes-devtools/qemu/qemu/run-ptest
index f9a4e8fb2b5..1157b48855d 100644
--- a/meta/recipes-devtools/qemu/qemu/run-ptest
+++ b/meta/recipes-devtools/qemu/qemu/run-ptest
@@ -9,5 +9,10 @@ export SRC_PATH=$ptestdir
 cd $ptestdir/tests
 tests=$(find . -name "test-*" ! -name "*.p")
 for f in $tests; do
+    # Test hangs intermittently on qemurisc64 on autobuilder
+    if [ "$f" = "./unit/test-nested-aio-poll" -a `uname -m` = "riscv64" ]; then
+        continue
+    fi
+    echo "Running $f"
     $f  | sed '/^ok/ s/ok/PASS:/g'
 done

