Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956D7D3B7FC
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:55:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5063.1765277742543528970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iG27X++Y;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so51079625e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765277741; x=1765882541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fey6/MMZYY5H26igQ2VPhHYh3Z8zP28DH95PmOpkcug=;
        b=iG27X++Y58XjOcjumfS4TfjeETCuuMHYUmRpT5XZI7n1FVBWD6gBMmXbkIBRAvsRIQ
         BWT4P0IyEElG1O0J40uTjUF5/UhKugFFl3yh6+9RDDEmHQEHsvjOzS8qLyk05dg1Anvw
         04pMw+nTz+8ls9qlDr0w8aBD0w8NIIUgN87Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277741; x=1765882541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fey6/MMZYY5H26igQ2VPhHYh3Z8zP28DH95PmOpkcug=;
        b=TkXjcmXBNgwVK/FbQ+D85KO2Ysa/YqsPhCCFbR2zFX9DOyGKKliIXw3WG6tJKH3XBi
         NcayKRB5J5WMm9m1dMDgOsxhwgNVK+dO4uY19HjKgQMmpbLY6uHNinlJQQ8F6lI/EIYd
         sid9rQ/geEm5bTnblWaEUoUW/t12NGeb/cJB9qN+oXlbRytOmdgKaXbpgy8pzkUCoSpB
         MO9mQt4ynamwL0xNHhetX3WuU7pkXgFSLQ3UO111JQGqK8Ual8kOqVOAORzhMZ2pi4Fu
         QSN0Ze5Bc5YiMwKcnshchVu1W8njUZDOBoZNnTa6cSYvhcJgDwIrzGJ3j5JfGVLCdJ7b
         T2lQ==
X-Gm-Message-State: AOJu0YwfMf5QVoGDjMDj/3lXf6hAHhQ6uQomO8rf1PPuROWvAZamZc62
	J9fxVwBScB6bHLwY6C2OKKiIFXerVa6hF+asCCxSSJDzfLvR3OQfsv4Z1w+p1nylGXeTQfOt+uU
	PTTj5
X-Gm-Gg: ASbGncsNF33je97Amt4ugJxNgZFJoxevMaNVKCdGFpOj+iMTADElE5YUSoQS+jLr5d0
	+b2r1Tymv3ceByEqmFLgsfCZyEI9EbXsi/Vo9TUttF1IoH9ZmtfZmHI4iCvAJl6pLqchOHdjrBi
	UKiaZONTrJdYesvU432qqOV3/nFujVEgwQxxSnm0Tyn8wg/7PGhuWjNzwfFdQ7WxwXdYk7tRLqP
	2Qzfuw0LAOk2U/v+nqio2nynsk6CRzLtvjpAxGJX3hugF8UMW9XSHEXi7uicqWiGGxDdTUFk37E
	ujpZV+kh5nthHjozkmC3Fi3XunEbn3TCZxxhIFC0eZAK6rY2ZyKNeT8PLESdn0LDHcu698IcJgW
	PAn+Mt6+c3uNLH6hLYUx443rxoIGYQq1FNs+1PvPgWMzzDpFOLrMNCeNCFKg9ptdZR/2+d5Feqm
	2H0HzQpSGxzlamZ6pZpuB45013AChYMEAqvnFO+xqaA0Z8x8j36ANcWJQXK9MBkTjyxVrYs0NnM
	hm65O9TvrvnB9rS3h309Ts=
X-Google-Smtp-Source: AGHT+IF5CGdpJESxu9vjjvxK3c52XY9jdxO9jhqI5ak2KezPBZ1/xIjlbLzvR5Wag1p9txhpihEuVQ==
X-Received: by 2002:a05:600c:350b:b0:477:79f8:da9d with SMTP id 5b1f17b1804b1-47939e3d074mr117150725e9.24.1765277740828;
        Tue, 09 Dec 2025 02:55:40 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-fc4a-65a9-382e-6f5d.rev.sfr.net. [2a02:8434:8fe1:4f01:fc4a:65a9:382e:6f5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7435sm17412895e9.0.2025.12.09.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:55:40 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v3 4/6] patchtest/selftest:  Extract head-attached test loop into function
Date: Tue,  9 Dec 2025 11:55:11 +0100
Message-Id: <20251209105513.273859-4-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227428

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

