Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ACACF9C73
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 15:00:14 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.16378.1727190005300718113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 08:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=aFGnbXQn;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c34dd6c21aso38483926d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727190004; x=1727794804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxqfPL9/PIle0bSQcTdMPxQ/iKqc0Y6sjVODY77hC4I=;
        b=aFGnbXQnqhghc0SrJntDaviHVL9LMWOQcZIDr2OW8wAu9SXG9aQgFoVJLqdnAqk+7r
         MHSXQ9mUBevGDZBAE4IqSUx/X8veOpoZ/F5s0oTm0T99EzAahoXK6Kc7hyHwzec4Rerf
         prr2mcI3i550V1JVF6GD0pFHn87aK5oc3wPFbsNfaLXXW/a2nCAOM2lD8ApyzGYqrs7P
         IAKxnGrUKsGijKQl71Nc3faLHoZpyvlNDiuOqgSLd2ldmu8kf4k/jHkDKnQ1wzi0rlrk
         VPi0pFq06KWqu/183Aszfb858LYclVqOTJTIN7uGI2g+RZ6XhpxIFpjV3my/DebZ2sk9
         4WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190004; x=1727794804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxqfPL9/PIle0bSQcTdMPxQ/iKqc0Y6sjVODY77hC4I=;
        b=SudO2WIIAChhFbmceOobRL+DI/OuavpofUCl88cffw4oD6cj9PpKRTijXG+JYYqvKy
         gEoFHQUaTWa7jp3JhzfWLMfMBhJMtlUfBSYeUsMauZF3Lgki5GDCemmO2PmTl0M8zJrX
         ZEWcTtHmLJonK7s+6EmF/6WdxUAFK6nbv7X9aF3EQ9ppXkWoJbEQgPaxYfIBrUy0I3NP
         hdveMpAn4bpy4AZzQ/cjnigkuYm16LwyT5w7v7A5G8CMQoLXXgWTrluilvO1pqjl6zcd
         IbLAlf1nopN47FXFsc9tcVBP4BTx6yFo0DG+8k5DuiDYR8pC9tiIgRMbd3N/WKXX6mDi
         7lbg==
X-Gm-Message-State: AOJu0Yw0L4yWTUgh1XZUPlMjAa/NBH/r/2tuYozMSyNEDyF18lEcc78g
	RT0SzoHHJtwHBPfeUFz/NYqphjuSFeNoe75nBsO1pk/hSAJewCLECtQwMjh1utothD061EB8tL1
	5FK4=
X-Google-Smtp-Source: AGHT+IEBgSTCyhcEUf8ArpuZe8eVF90xaQWMg2Zol6Xd1A2DEFPtNFN/6altQmDeQ5zQVIWGpoEmZA==
X-Received: by 2002:a05:6214:4a8b:b0:6c3:5ee6:91e5 with SMTP id 6a1803df08f44-6c7bc73f77emr178929566d6.29.1727190003890;
        Tue, 24 Sep 2024 08:00:03 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f772f27sm7205716d6.121.2024.09.24.08.00.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 08:00:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4 v2] python3-hypothesis: upgrade 6.111.2 -> 6.112.1
Date: Tue, 24 Sep 2024 11:00:00 -0400
Message-Id: <20240924150001.2586819-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924150001.2586819-1-tgamblin@baylibre.com>
References: <20240924150001.2586819-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 15:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204875

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

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds the missing signoff.

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


