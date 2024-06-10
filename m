Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57FEC27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 17:41:32 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.25959.1718041288752951999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 10:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UP1Fq0JE;
 spf=pass (domain: baylibre.com, ip: 209.85.128.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-62a08b1a81bso47017587b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718041288; x=1718646088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtftV1s02BKoCbVPUg19tlEOmI9xdYdb6aSkDA1uwLE=;
        b=UP1Fq0JEOcU703jK9yTmtBmmLpmnMCoZfjEBnhw4q3ZIspxZKHzC0yySc+GkRZqOG+
         jIvoSAX3QRLbbvNPyGnEVoOggx07rFYEh1bvZKwu8ZZe2poB7vlZe33qsq0fE2D36wLr
         AS2v9JaM3A4pDzFZDBkNb+SenL1vQbnasaGijB0bgRyDhm8BkmbAgIXdoROX8dlGeKk+
         MI2bWov/vzo5//zjRm3tbXSs2vSc2j5rC430cNA78PNKmbo/nMYTNq981L64wSCV8Pjh
         wBlbLwsKqVwWTikd8rilm2STb6JrMAm78Wk4sUetNK6670QTH2gsrA0R6Lr4PcbMlqYT
         jCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041288; x=1718646088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtftV1s02BKoCbVPUg19tlEOmI9xdYdb6aSkDA1uwLE=;
        b=Jc7wBmLhEw1cWvQBuhLrKtKFelXdwHYsWDu9rKtdEEnnpOD13qaW94V8i5UxKfMF29
         nnycXonkWmmxvfHe8Zb/qO8K0hGyQnAStz1cDxFHVsV8nGA/BvC7Wf1FVSBCSRuZfeuj
         maF0si8hUX39XACJ6TVevIIzMM0HDoVFjqHHyxgW7sz8J3RYs6IiI1ww185Po2KE8MzV
         7ESjBz21/fLMToXLKlm0z9StWjZAYHLEy2AnorxVPZCubStADFx7//o/0ood3t0s+Bbx
         evVSCdNtEMh5nDT0qk6NTD/VosHI5EPXJkRi8uA/mzWnoMsgKH93SeOzR28kaPOqOg5u
         Utaw==
X-Gm-Message-State: AOJu0YyXG4lPvIQvr1XdOpLe50/bSkn3A0H/VW3/j3jDRinHiyzTfUiU
	rutvrqjtbBX/1pwKZMu9kk39v4i9HJqwvh+X8onSE7uFtoGSk2oHGuE+Im7GXI8hTqfpovsNC/V
	A
X-Google-Smtp-Source: AGHT+IEp+xBdL38rUAEDWDov+jUxC1vaCVUOdWY3N3xgZVoDHCepMorl/32FX2gysnIcRdaQ7xhTWw==
X-Received: by 2002:a25:ae8f:0:b0:dfa:4ad7:19d0 with SMTP id 3f1490d57ef6-dfaf65e6834mr10899771276.2.1718041287627;
        Mon, 10 Jun 2024 10:41:27 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44038959fcdsm37921081cf.10.2024.06.10.10.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:41:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-pytest: upgrade 8.2.1 -> 8.2.2
Date: Mon, 10 Jun 2024 13:41:26 -0400
Message-ID: <20240610174126.973019-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 17:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200483

Changelog (https://docs.pytest.org/en/stable/changelog.html):

Bug Fixes
- #12355: Fix possible catastrophic performance slowdown on a certain parametrization pattern involving many higher-scoped parameters.
- #12367: Fix a regression in pytest 8.2.0 where unittest class instances (a fresh one is created for each test) were not released promptly on test teardown but only on session teardown.
- #12381: Fix possible “Directory not empty” crashes arising from concurent cache dir (.pytest_cache) creation. Regressed in pytest 8.2.0.

Improved Documentation
- #12290: Updated Sphinx theme to use Furo instead of Flask, enabling Dark mode theme.
- #12356: Added a subsection to the documentation for debugging flaky tests to mention lack of thread safety in pytest as a possible source of flakyness.
- #12363: The documentation webpages now links to a canonical version to reduce outdated documentation in search engine results.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-pytest_8.2.1.bb => python3-pytest_8.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.2.1.bb => python3-pytest_8.2.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.2.1.bb b/meta/recipes-devtools/python/python3-pytest_8.2.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.2.1.bb
rename to meta/recipes-devtools/python/python3-pytest_8.2.2.bb
index 28dbe786f8..531f40df81 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.2.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "5046e5b46d8e4cac199c373041f26be56fdb81eb4e67dc11d4e10811fc3408fd"
+SRC_URI[sha256sum] = "de4bb8104e201939ccdc688b27a89a7be2079b22e2bd2b07f806b6ba71117977"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.45.2


