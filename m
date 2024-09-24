Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEACCF9C77
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:12:24 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.15049.1727187136806565190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iiSzjTZi;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4582c62ee33so56436541cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727187135; x=1727791935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5CxBsxttyWNACO/XVzTeJ80VN8MOJS3MvQ13f7npx4=;
        b=iiSzjTZiWHn3OPHKrOcv1lJhGi1Qcefqihr1+5we0EdWn07yG1VqL142HTFx7CeC3T
         XW08QAUC6AmOi0AhSdwPHnLqWRZzLKomEAoIhfGqN/EGHyFImUk8N/vldQ9Vgwu1cp/9
         D2HM1N8qsIu9wsGfHq/HImqqLqmzWPxECzXpIfV0iQIeWCVK/MiF2Rna9HOeSbNlx4ad
         8g/PuoEvYwgRfxQpa3j8jV5x301QTTaRGlH4jdhVPJHETjup5yCfHSOJi2Q5y0+TpqX1
         wqWk1Nsi3xIp8omKeozCf99vLR0PAjA0Cjz+ur5tiPobLYKgVLNAk/flLqhxa9j9LM/H
         KlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187135; x=1727791935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5CxBsxttyWNACO/XVzTeJ80VN8MOJS3MvQ13f7npx4=;
        b=iq3tUmtrCQtQsFcUzldMiQCdg+ph4Vg4wVieD76NWga0Ajj5NlIbn/bUXTPMk2YPGu
         Y3l4OG079Zif1PF2/AvCNvzTMuV9XY+wdUO52V8tix5ZwCK8hx6mrKSu6KR6kaKDRVHY
         1OzPAEi3we1THkwee+TGf8bY0n47IHgtmpj9+AsYqEIswAF7G9GPBRzI2Ux1TyRogy5h
         RO/uYWL1hw9M1IL5/c26f6Y7rClKR1UJ4j+DFvTRQEuPiA8bWvopLsyuyeL+qGsYwckF
         I31e9ygzxGje0uAW2HTMpTPOOoOVj8cACQh2BSGE4L/4GyAoq/PAN+tUZd3FhV6JQUEm
         hgcw==
X-Gm-Message-State: AOJu0YzhBtpWfO6yZlop7XnHqQnsldrUDP7NeyULmwt3A2K821NUqY+P
	ECCUhOlblMMBAG1b5BnhHmRnnlEOIjWasmfEC2kGsLXWP6PgOZi6WH7RgT/k20BxLnGO6nT5YUf
	C/H0=
X-Google-Smtp-Source: AGHT+IHoF/4219HEAPoy9NLgfKXymkdp7c0rwaqt063+q7Y09bUBvv/g/et3h4B1Pvh2CWb6nRWRag==
X-Received: by 2002:a05:622a:1a28:b0:458:4b6b:ff16 with SMTP id d75a77b69052e-45b20510423mr223422531cf.32.1727187135507;
        Tue, 24 Sep 2024 07:12:15 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b526924d7sm6620711cf.87.2024.09.24.07.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:12:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] python3-hypothesis: upgrade 6.111.2 -> 6.112.1
Date: Tue, 24 Sep 2024 10:12:11 -0400
Message-Id: <20240924141212.2579675-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924141212.2579675-1-tgamblin@baylibre.com>
References: <20240924141212.2579675-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204867

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html):

6.112.1 - 2024-09-13
This patch removes a now-incorrect internal assertion about numpy’s
typing after recent numpy changes (currently only in numpy’s nightly
release).

6.112.0 - 2024-09-05
This release adds support for variable-width bytes in our IR layer
(issue #3921), which should mean improved performance anywhere you use
binary(). If you maintain an alternative backend as part of our (for now
explicitly unstable) Alternative backends for Hypothesis, this release
changes the draw_* interface and may be a breaking change for you.

ptest output:

|root@qemux86-64:~# ptest-runner python3-hypothesis
|START: ptest-runner
|2024-09-24T13:22
|BEGIN: /usr/lib/python3-hypothesis/ptest
|PASS: examples/test_binary_search.py:test_insert_is_sorted
|PASS: examples/test_binary_search.py:test_is_minimal
|PASS: examples/test_binary_search.py:test_inserts_into_same_place_twice
|PASS: examples/test_rle.py:test_decodes_to_starting_sequence
|PASS: examples/test_rle.py:test_duplicating_an_element_does_not_increase_length
|============================================================================
|Testsuite summary
|# TOTAL: 5
|# PASS: 5
|# SKIP: 0
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 1
|END: /usr/lib/python3-hypothesis/ptest
|2024-09-24T13:22
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
---
 ...hon3-hypothesis_6.111.2.bb => python3-hypothesis_6.112.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.111.2.bb => python3-hypothesis_6.112.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
index 3da0ce8c045..e4b7b53579f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "0496ad28c7240ee9ba89fcc7fb1dc74e89f3e40fbcbbb5f73c0091558dec8e6e"
+SRC_URI[sha256sum] = "b070d7a1bb9bd84706c31885c9aeddc138e2b36a9c112a91984f49501c567856"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.5


