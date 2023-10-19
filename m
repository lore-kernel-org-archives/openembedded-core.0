Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB848CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 20:49:32 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.39089.1697748569949415495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 13:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=m7SYE+HM;
 spf=pass (domain: baylibre.com, ip: 209.85.167.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2e4107f47so106200b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 13:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697748569; x=1698353369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3Y3dPhw2sXaXNcWPKlRpjYh49SDDYmIiOFyUKDb9s=;
        b=m7SYE+HMAxTKkDabsIMB7TXk8ib3QP0a29LV87BJ3UCelZeJO3odPgGB8yIfhIDN5G
         t2r9XQmiEjaW5fG8bxSM4rRgetkS13zHkU8kli2zJNJbQMTJgrsAhXbEogqTLosc2aO+
         XEMFFVQSSk4VEjjugXXzASjEvFj1QaS50aomCv9rY6Lbj6Jrc8d6vaebOymRg2tfMTrR
         AxFhfr1hvJpB3VRrpMWKy4UjE7GBhK3jrKRvONyZHXAtT6YoleqLfORCkRA/4qeoYaR2
         5ivDq0KsyTOIpsI60JVjCxLQ6qXLRR4DbxzFHJdRxqGw+eKLlTt9ZCD9+Huc0Dvu/2mt
         9qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697748569; x=1698353369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3Y3dPhw2sXaXNcWPKlRpjYh49SDDYmIiOFyUKDb9s=;
        b=IujWNwHTJnBQex6iHCOEJrC6rMgJeVamGu5gfSW2bsBm7ugL8iSThXQGUzfhgQhut4
         m9ZZ2vDPIKd7VGbkL9oJk6QXbhX2m0E0xoZJYX+/mQ7ZOVbQgDZ5Y/Njm8pg/aiD1vbU
         wpOLeNdPfEpGEc79iOO1ccx04wAOvhwIMSXAIyMnAgA6qYGSyULfowqdaxZdct1osW+V
         0zx+OQEoXrbUTv/n67payetsTisJXv7kE6auxBQ8rQsdpqOxIBK6+RvLj9T0POMO7DCq
         CxmzNuKYDsmRlQEMBUM/Y2SZKXjhkIowyfD7BtaH1W1kGOCSQK+urUnldCSNYoGzkGjB
         dMEA==
X-Gm-Message-State: AOJu0Yyi3mzH4P5E4PHQjhSpYD0MuEH5n15vWKa77NUQ2fiKssU0Sqnv
	weB7YYgcIVd/Zw6ON21kFBGmVeJZUUZUGxxmtrockA==
X-Google-Smtp-Source: AGHT+IHj861VTOBB0pkq5AY7GmeavTUU0KMJGVMOXLfcObLK2LcZKoE81Wzt6WqziSXp2svI1M2tgA==
X-Received: by 2002:a05:6808:1996:b0:3ab:8956:ad95 with SMTP id bj22-20020a056808199600b003ab8956ad95mr4142421oib.9.1697748569041;
        Thu, 19 Oct 2023 13:49:29 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id c25-20020ac853d9000000b004109928c607sm88013qtq.43.2023.10.19.13.49.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 13:49:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] patchtest: skip merge test if not targeting master
Date: Thu, 19 Oct 2023 16:49:26 -0400
Message-ID: <20231019204927.2290521-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 20:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189482

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox_merge.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index bc55c588b40..013b9e0144d 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -18,6 +18,8 @@ def headlog():
 
 class Merge(base.Base):
     def test_series_merge_on_head(self):
+        if PatchTestInput.repo.branch == "master":
+            self.skip("Skipping merge test since patch is not intended for master branch")
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog = headlog()
             self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
-- 
2.41.0


