Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55600D41D55
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:07:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11350.1765465613458589818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dlRz87Lq;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so2778495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765465611; x=1766070411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fey6/MMZYY5H26igQ2VPhHYh3Z8zP28DH95PmOpkcug=;
        b=dlRz87Lq6QYnWEwOg8ksPva+BmXXQ9b836cY7v3Atk4FKxYvHLqwXTaztTIcLy48rR
         MVFw0BqDDuutceCBnbF1wCAlz1zS9KLT4VU+O6swtiW4aJgLXY9VS/jfczBsinKUq6q+
         qBRscHJ+P2D8rn9gdV9AGRrpafgZnJfXdDUnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465611; x=1766070411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fey6/MMZYY5H26igQ2VPhHYh3Z8zP28DH95PmOpkcug=;
        b=L0AJckdcPzFrxjNWRvLCyLLu2tN2zMRjlZwpGnhoW1txM00iYiY4u/6adQEakd07nP
         FCx1VR+6jBErH7r865d7qsAlTvZhCWaDLrZvrgQnQD7xJMr64czt/knT5oTE5iR9xRB3
         3DmCD6bSZi0gGpBy4gkxg8qPOU6aeGlgrnKD5oZnULyI4bjrmVlLAXK8d4MkpKJGlXhz
         9A1ri7uizPkV3R917yiiWgArk7ikQ3z9h+BzjtsXTp5qozSbMDax770PPDPioPo1y7T5
         FRxsQHwMpYFTWDEX+htrQV12GnID/qbAAnEuS2B+Nd3WDh2Yz5SLMtMutH80qRTUjY9P
         cQQg==
X-Gm-Message-State: AOJu0YwZ8duRBLrCBfFgBfilmzKzqGqCECYhZzNEbiE9/7M2RT1zSqWp
	RrWqlXF6Dm2rHPgpyU/ZV8oLR7HAP48p32ky3dRNVQ/9sZ1Y82dxRUEHqYOVjwvxKqewkxpUKxA
	+arCT
X-Gm-Gg: AY/fxX4ZZ2kTrywEpoBPe+3KWuShp1avwAQuO/rygtgqXMogil0zmihxRdAd2fiLCYe
	EtfZ8st1Hzw9RX0vvTnZztcVDJ66JHW/HOklKGF+Z9DiqGz6yFc7wBDGPfzT7vG6a8YQ1yVA35Z
	doVpWVT9xv4fldUxio+jSbqBaRljhJ8eW3tpDY67YMLk2BEsZpVOU0GRfrPuHdUCI80Mi9jgvnL
	zMJ9HRziWdfxeoZ07YWG9Ns2zAchkfaOERjALAensmgtIkevwKphem9PGUksdPtWaOrUGPyrmYM
	Kpo+xEBbwpBN7PukmOXkcEwEQsN/uXovUyPpclQU/9zTlED9Mad91+FFCa+JZ9bGyASrtdiDGyH
	e8LVGybtIZ9gSWxDJgXiypu9RBPsihBDSQpZerRBnCYIZWswGRa7VIP80y21KnTCfAu+F7B2YcY
	b8qQgykQuLNkUN4UBIUJJHxiaMo6g7IFaK1XB1hsen+Q8hYKRioMU5GmUuKR6HvdX6Gid0t2DJF
	WXkIROTJRrlbMfWXMNf4A==
X-Google-Smtp-Source: AGHT+IHqR9HIN7SpQYIV3nCnnVoUNgVRJ/w+UZAlMq/SGjezAQ6uJONYlt/NCs+SF/RT3wJTmpw4TQ==
X-Received: by 2002:a5d:5f52:0:b0:429:8a71:d57 with SMTP id ffacd0b85a97d-42fa39db05dmr7436854f8f.27.1765465611526;
        Thu, 11 Dec 2025 07:06:51 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-5250-bba4-03e6-c67a.rev.sfr.net. [2a02:8434:8fe1:4f01:5250:bba4:3e6:c67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm6504043f8f.11.2025.12.11.07.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:51 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v4 4/6] patchtest/selftest:  Extract head-attached test loop into function
Date: Thu, 11 Dec 2025 16:06:44 +0100
Message-Id: <20251211150646.2647853-4-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
References: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227542

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Move the loop that run the tests in head attached tests into a function
'test_head_attached'. Also add an explicit check for the case where no patches
are found and exit with an error.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index a1be478e1a..92acc4d556 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -95,6 +95,12 @@ def test(root, patch):
 
     return results
 
+def test_head_attached(patches, counts):
+    for patch_info in patches:
+        results = test(patch_info["root"], patch_info["patch"])
+        counts = analyze_result(results, patch_info, counts)
+    return counts
+
 if __name__ == '__main__':
     counts = {
         "pass": 0,
@@ -107,8 +113,10 @@ if __name__ == '__main__':
     }
 
     results = None
+
     patches = get_patches(patchesdir)
-    for patch_info in patches:
-        results = test(patch_info["root"], patch_info["patch"])
-        counts = analyze_result(results, patch_info, counts)
+    if not patches:
+        print(f"Error: Unable to find patch(es) in {patchesdir}")
+        sys.exit(1)
+    counts = test_head_attached(patches, counts)
     print_results(counts)

